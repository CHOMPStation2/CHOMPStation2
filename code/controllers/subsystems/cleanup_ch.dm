#define FIRE_PRIORITY_CLEANUP 20
#define MAX_CLEANUP_QUEUE_TIME 120 //Max time in queue before we give up.
#define URGENCY_PANIC_MODE 0.75 //Max urgency before we start to skip checks
#define SMOOTHSTEP(variable) (max(min(6*(variable**5) - 15*(variable**4) + 10*(variable**3),1),0))
//This is the cleanup subsystem. Its responsibility is to clean up unneeded atoms such as empty bullet casings and dead mobs in an effort to boost performance.
SUBSYSTEM_DEF(cleanup)
	name = "Cleanup"
	priority = FIRE_PRIORITY_CLEANUP
	flags = SS_BACKGROUND|SS_NO_INIT
	wait = 300 //Fires every 5 minutes.

	var/stat_tag = "Cl" //Used for logging
	var/urgency //How desperate are we to delete stuff?
	var/points //How much complexity is in our queue?
	var/list/processing = list()
	var/list/currentrun = list()

	var/datum/cleanupentry/current_thing

/datum/controller/subsystem/cleanup/Recover()
	log_debug("[name] subsystem Recover().")
	if(SScleanup.current_thing)
		log_debug("current_thing was: (\ref[SScleanup.current_thing])[SScleanup.current_thing]([SScleanup.current_thing.type]) - currentrun: [SScleanup.currentrun.len] vs total: [SScleanup.processing.len]")
	var/list/old_processing = SScleanup.processing.Copy()
	for(var/datum/D in old_processing)
		if(istype(D))
			processing |= D

/datum/controller/subsystem/cleanup/stat_entry()
	..("[stat_tag]:[processing.len] U:[urgency] P:[points]")

/datum/controller/subsystem/cleanup/proc/get_points()
	var/temp_points = processing.len
	for(var/mob/mob_entry in processing)
		if(istype(mob_entry))
			temp_points += 2 //Mobs are worth 3x as much as atoms, since they're counted once in the first definition for temp_points, and twice here.
	for(var/mob/living/carbon/carbon_entry in processing)
		if(istype(carbon_entry))
			temp_points += 2 //Carbons are worth 5x as much as atoms, since they're counted once in the first definition for temp_points, twice for being a mob, and twice for carbon.
	return temp_points

/proc/cleanup_adjusted_points(points)
	return (log(points)-2.5)/3

/datum/controller/subsystem/cleanup/proc/get_urgency() //Let's try to decide how badly we need to delete stuff. Urgency is always betweeen 0 and 1, 0 meaning no rush, and 1 meaning delete stuff twice as quick.
	SScleanup.points = SScleanup.get_points()
	var/adjusted_points = cleanup_adjusted_points(SScleanup.points) //Use the following points to get an idea for this equation: (12.182,0), (100,0.702), (244.692,1)
	var/adjusted_tidi = cleanup_adjusted_points(2*SStime_track.time_dilation_avg) //We use average time dilation to avoid unwanted behavior during small lag spikes. Same equation as before, but x is multiplied by 2.
	var/combined_score = adjusted_points * adjusted_tidi //We multiply them together, because we should only act urgently when both of these are above standard values.
	var/out = SMOOTHSTEP(combined_score) //Finally we add smoothstep as a way of smoothly clamping between 0 and 1.
	if(out > URGENCY_PANIC_MODE)
		log_and_message_admins("WARNING: Cleanup subsystem has reached panic mode threshold, atoms and mobs in the queue will be deleted faster and regardless of location or last movement")
	return out
	// To further document what the math here is actually doing, the following are points in the form of (SScleanup.points, SStime_track.time_dilation_avg, urgency):
	// (50,25,0.076), (50,50,0.205), (50,100,0.387), (100,25,0.205), (100,50,0.486), (100,100,0.772), (100,150,0.896), (150,25,0.307), (150,50,0.66), (150,100,0.926), (150,150, 0.99) 
	


/datum/controller/subsystem/cleanup/fire(resumed = 0)
	if (!resumed)
		currentrun = processing.Copy()
		SScleanup.urgency = get_urgency()
	var/list/current_run = currentrun
	var/current_check = 0
	while(current_run.len)
		current_thing = current_run[current_run.len]
		current_run.len--
		if(QDELETED(current_thing) || QDELETED(current_thing.entry_atom))
			processing -= current_thing
		current_check = current_thing.Check()
		if(current_check == -1) //-1 means remove us from queue without deleting the atom.
			processing -= current_thing
			qdel(current_thing)
			current_thing = null
		if(current_check == TRUE)
			processing -= current_thing
			qdel(current_thing.entry_atom)
			current_thing.entry_atom = null
			qdel(current_thing)
			current_thing = null
		if (MC_TICK_CHECK)
			current_thing = null
			return

	current_thing = null

/datum/controller/subsystem/cleanup/proc/add_to_queue(atom/entry)
	SScleanup.processing += new /datum/cleanupentry(entry)

//Cleanup entry, used to hold information about the atom we're trying to cleanup.
/datum/cleanupentry
	var/atom/entry_atom
	var/list/data
	var/time_entered
	var/time_entered_objective

/datum/cleanupentry/New(atom/cl_atom)
	entry_atom = cl_atom
	data = list()
	time_entered = world.time
	time_entered_objective = world.time

/datum/cleanupentry/proc/Check()
	return entry_atom.CleanupCheck(src,world.time - time_entered)

//We use a proc attached to the atom so that atoms can have custom requirements for being cleaned up.
/atom/proc/CleanupCheck(datum/cleanupentry/entry, time, urgency) //Default check, consider this Class I, only requirement is 10 minutes have passed
	if((world.time - entry.time_entered_objective) > MAX_CLEANUP_QUEUE_TIME MINUTES)
		return -1
	
	if(isnull(entry.data["turf_time"]))
		entry.data["turf_time"] = 0
	
	if(!istype(loc,/turf/) && urgency < URGENCY_PANIC_MODE) //Pause the timer if we're not on a turf, and urgency isn't too high.
		entry.time_entered = world.time - entry.data["turf_time"]
		return FALSE
	
	if(time < (10 MINUTES * urgency))
		entry.data["turf_time"] = time
		return FALSE
	
	return TRUE

/mob/living/CleanupCheck(datum/cleanupentry/entry, time, urgency)
	if(stat!=DEAD) //If we become alive again by some means, we need to remove ourselves from the queue
		return -1
	
	return CleanupCheckII(entry, time, urgency, 30 MINUTES)

/proc/CleanupCheckII(datum/cleanupentry/entry, time, urgency, length) //Class II check, to be used for stuff that we're more hesitant about deleting, checks whether it's moved recently.
	if((world.time - entry.time_entered_objective) > MAX_CLEANUP_QUEUE_TIME MINUTES)
		return -1
	
	if(!entry.data.len)
		entry.data["pastloc"] = get_turf(entry.entry_atom)
		entry.data["lastmoved"] = entry.time_entered
		entry.data["turf_time"] = 0
		return FALSE
	
	if(!istype(entry.entry_atom.loc,/turf/) && urgency < URGENCY_PANIC_MODE) //Pause the timer if we're not on a turf, and urgency isn't too high.
		entry.time_entered = world.time - entry.data["turf_time"]
		return FALSE
	
	if((entry.data["pastloc"] != get_turf(entry.entry_atom))) //If our turf is different than it was last time, 
		entry.data["lastmoved"] = world.time
		entry.data["turf_time"] = 0
		entry.data["pastloc"] = get_turf(entry.entry_atom)
		return FALSE

	//If Urgency is greater than panic threshold use time_entered, otherwise use lastmoved to check for how long it's been.
	if(((urgency <= URGENCY_PANIC_MODE) && ((world.time - entry.data["lastmoved"]) < (length * urgency))) || ((urgency > URGENCY_PANIC_MODE) && (time < (length * urgency))))
		return FALSE
	
	return TRUE

//Overrides, these actually add stuff to the queue to be cleaned up.
/mob/living/simple_mob/death(gibbed)
	if((!ckey) && (!istype(src,/mob/living/simple_mob/humanoid)) && (!gibbed)) //Humanoids spawn different corpses on death, so ignore them for now. There will be an edit in their file for this.
		SScleanup.add_to_queue(src)
	. = ..()

/mob/living/carbon/human/monkey/death(gibbed)
	if((!ckey) && (!gibbed))
		SScleanup.add_to_queue(src)
	. = ..()