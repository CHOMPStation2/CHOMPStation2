//
// Mobs Subsystem - Process mob.Life()
//

//VOREStation Edits - Contains temporary debugging code to diagnose extreme tick consumption.
//Revert file to Polaris version when done.

SUBSYSTEM_DEF(mobs)
	name = "Mobs"
	priority = FIRE_PRIORITY_MOBS
	wait = 2 SECONDS
	flags = SS_KEEP_TIMING|SS_NO_INIT
	runlevels = RUNLEVEL_GAME | RUNLEVEL_POSTGAME

	var/list/currentrun = list()
	var/log_extensively = FALSE
	var/list/timelog = list()

	var/slept_mobs = 0
	var/list/process_z = list()

	var/list/death_list = list()

/datum/controller/subsystem/mobs/stat_entry(msg)
	msg = "P: [GLOB.mob_list.len] | S: [slept_mobs] | D: [death_list.len]"
	return ..()

/datum/controller/subsystem/mobs/fire(resumed = 0)
	if (!resumed)
		src.currentrun = GLOB.mob_list.Copy()
		process_z.len = GLOB.living_players_by_zlevel.len
		slept_mobs = 0
		for(var/level in 1 to process_z.len)
			process_z[level] = GLOB.living_players_by_zlevel[level].len
		// Lets handle all of these while we have time, should always remain extremely small...
		if(death_list.len) // Don't contact DB if this list is empty
			if(CONFIG_GET(flag/sql_enabled))
				establish_db_connection()
				if(!SSdbcore.IsConnected())
					log_game("SQL ERROR during death reporting. Failed to connect.")
				else
					SSdbcore.MassInsert(format_table_name("death"), death_list)
			death_list.Cut()

	//cache for sanic speed (lists are references anyways)
	var/list/currentrun = src.currentrun
	var/times_fired = src.times_fired
	while(currentrun.len)
		var/mob/M = currentrun[currentrun.len]
		currentrun.len--

		if(!M || QDELETED(M))
			GLOB.mob_list -= M
			continue
		else if(M.low_priority && !(M.loc && get_z(M) && process_z[get_z(M)]))
			slept_mobs++
			continue
		//CHOMPEdit Start - Enable pausing mobs (For transformation, holding until reformation, etc.)
		else if(!M.enabled)
			slept_mobs++
			continue
		//CHOMPEdit End

		M.Life(times_fired)

		if (MC_TICK_CHECK)
			return

/datum/controller/subsystem/mobs/proc/log_recent()
	var/msg = "Debug output from the [name] subsystem:\n"
	msg += "- This subsystem is processed tail-first -\n"
	if(!currentrun || !GLOB.mob_list)
		msg += "ERROR: A critical list [currentrun ? "mob_list" : "currentrun"] is gone!"
		log_game(msg)
		log_world(msg)
		return
	msg += "Lists: currentrun: [currentrun.len], mob_list: [GLOB.mob_list.len]\n"

	if(!currentrun.len)
		msg += "!!The subsystem just finished the mob_list list, and currentrun is empty (or has never run).\n"
		msg += "!!The info below is the tail of mob_list instead of currentrun.\n"

	var/datum/D = currentrun.len ? currentrun[currentrun.len] : GLOB.mob_list[GLOB.mob_list.len]
	msg += "Tail entry: [describeThis(D)] (this is likely the item AFTER the problem item)\n"

	var/position = GLOB.mob_list.Find(D)
	if(!position)
		msg += "Unable to find context of tail entry in mob_list list.\n"
	else
		if(position != GLOB.mob_list.len)
			var/additional = GLOB.mob_list.Find(D, position+1)
			if(additional)
				msg += "WARNING: Tail entry found more than once in mob_list list! Context is for the first found.\n"
		var/start = clamp(position-2,1,GLOB.mob_list.len)
		var/end = clamp(position+2,1,GLOB.mob_list.len)
		msg += "2 previous elements, then tail, then 2 next elements of mob_list list for context:\n"
		msg += "---\n"
		for(var/i in start to end)
			msg += "[describeThis(GLOB.mob_list[i])][i == position ? " << TAIL" : ""]\n"
		msg += "---\n"
	log_game(msg)
	log_world(msg)

/datum/controller/subsystem/mobs/fail()
	..()
	log_recent()

/datum/controller/subsystem/mobs/critfail()
	..()
	log_recent()

/datum/controller/subsystem/mobs/proc/report_death(var/mob/living/L)
	if(!L)
		return
	if(!L.key || !L.mind)
		return
	if(!ticker || !ticker.mode)
		return
	ticker.mode.check_win()

	// Don't bother with the rest if we've not got a DB to do anything with
	if(!CONFIG_GET(flag/enable_stat_tracking) || !CONFIG_GET(flag/sql_enabled))
		return

	var/area/placeofdeath = get_area(L)
	var/podname = placeofdeath ? placeofdeath.name : "Unknown area"

	var/list/data = list(
	"name" = "[L.real_name]",
	"byondkey" = "[L.key]",
	"job" = "[L.mind.assigned_role]",
	"special" = "[L.mind.special_role]",
	"pod" = podname,
	"tod" = time2text(world.realtime, "YYYY-MM-DD hh:mm:ss"),
	"laname" = L.lastattacker ? L.lastattacker:real_name : "",
	"lakey" = L.lastattacker ? L.lastattacker:key : "",
	"gender" = L.gender,
	"bruteloss" = L.getBruteLoss(),
	"fireloss" = L.getFireLoss(),
	"brainloss" = L.brainloss,
	"oxyloss" = L.getOxyLoss(),
	"coord" = "[L.x], [L.y], [L.z]"
	)
	death_list += list(data)
