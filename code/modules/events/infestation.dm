//CHOMP Edit changed for Southern Cross areas
#define LOC_KITCHEN 0
#define LOC_ATMOS 1
#define LOC_CHAPEL 2
#define LOC_LIBRARY 3
#define LOC_HYDRO 4
#define LOC_TECH 5
#define LOC_HANGAR1 6
#define LOC_HANGAR2 7
#define LOC_HANGAR3 8
#define LOC_VAULT 9


#define VERM_MICE 0
#define VERM_LIZARDS 1
#define VERM_SPIDERS 2

/datum/event/infestation
	announceWhen = 10
	endWhen = 11
	var/location
	var/locstring
	var/vermin
	var/vermstring

/datum/event/infestation/start()
//CHOMP Edit changed for Southern Cross areas
	location = rand(0,9)
	var/list/turf/simulated/floor/turfs = list()
	var/spawn_area_type
	switch(location)
		if(LOC_KITCHEN)
			spawn_area_type = /area/crew_quarters/kitchen
			locstring = "the kitchen"
		if(LOC_ATMOS)
			spawn_area_type = /area/engineering/atmos
			locstring = "atmospherics"
		if(LOC_CHAPEL)
			spawn_area_type = /area/chapel/main
			locstring = "the chapel"
		if(LOC_LIBRARY)
			spawn_area_type = /area/library
			locstring = "the library"
		if(LOC_HYDRO)
			spawn_area_type = /area/hydroponics
			locstring = "hydroponics"
		if(LOC_TECH)
			spawn_area_type = /area/storage/tech
			locstring = "technical storage"
		if(LOC_HANGAR1)
			spawn_area_type = /area/hangar/one
			locstring = "the hangar deck"
		if(LOC_HANGAR2)
			spawn_area_type = /area/hangar/two
			locstring = "the hangar deck"
		if(LOC_HANGAR3)
			spawn_area_type = /area/hangar/three
			locstring = "the hangar deck"
		if(LOC_VAULT)
			spawn_area_type = /area/security/nuke_storage
			locstring = "the vault"

	for(var/areapath in typesof(spawn_area_type))
		var/area/A = locate(areapath)
		for(var/turf/simulated/floor/F in A.contents)
			//VOREStation Edit - Fixes event
			var/blocked = FALSE
			for(var/atom/movable/AM in F)
				if(AM.density)
					blocked = TRUE
			if(!blocked)
				turfs += F
			//VOREStation Edit - Fixes event

	var/list/spawn_types = list()
	var/min_number //CHOMP Add
	var/max_number
	vermin = rand(0,2)
	switch(vermin)
		if(VERM_MICE)
			spawn_types = list(/mob/living/simple_mob/animal/passive/mouse/gray, /mob/living/simple_mob/animal/passive/mouse/brown, /mob/living/simple_mob/animal/passive/mouse/white)
			min_number = 2 //CHOMP Add
			max_number = 12
			vermstring = "mice"
		if(VERM_LIZARDS)
			spawn_types = list(/mob/living/simple_mob/animal/passive/lizard)
			min_number = 2 //CHOMP Add
			max_number = 6
			vermstring = "lizards"

		// ChompEDIT Begin
		if(VERM_SPIDERS)
			spawn_types = list(/obj/effect/spider/spiderling)
			min_number = 4 //CHOMP Add
			max_number = 8 //CHOMP edit
			vermstring = "spiders"

	/* //Chomp REMOVE - in upstream file, not used here
	// Check if any landmarks exist!
	for(var/obj/effect/landmark/C in landmarks_list)
		if(C.name == "verminstart")
			spawn_locations.Add(C.loc)
	*/ //Chomp REMOVE END

	spawn(0)
		var/num = rand(min_number,max_number)
		while(turfs.len > 0 && num > 0)
			var/turf/simulated/floor/T = pick(turfs)
			turfs.Remove(T)
			num--

			if(vermin == VERM_SPIDERS)
				var/obj/effect/spider/spiderling/S = new(T)
				S.amount_grown = -1
			else
				var/spawn_type = pick(spawn_types)
				new spawn_type(T)
		// ChompEDIT End
/* CHOMPedit - Upstream Code, not implmeneted here
/datum/event/infestation/tick()
	if(activeFor % 5 != 0)
		return // Only process every 10 seconds.
	if(count_spawned_vermin() < vermin_cap)
		spawn_vermin(rand(4,10), prep_size_min, prep_size_max)

/datum/event/infestation/proc/spawn_vermin(var/num_groups, var/group_size_min, var/group_size_max)
	if(spawn_locations.len) // Okay we've got landmarks, lets use those!
		shuffle_inplace(spawn_locations)
		num_groups = min(num_groups, spawn_locations.len)
		for (var/i = 1, i <= num_groups, i++)
			var/group_size = rand(group_size_min, group_size_max)
			for (var/j = 0, j < group_size, j++)
				spawn_one_vermin(spawn_locations[i])
		return

// Spawn a single vermin at given location.
/datum/event/infestation/proc/spawn_one_vermin(var/loc)
	var/mob/living/simple_mob/animal/M = new spawn_types(loc)
	RegisterSignal(M, COMSIG_OBSERVER_DESTROYED, PROC_REF(on_vermin_destruction))
	spawned_vermin.Add(M)
	return M

// Counts living vermin spawned by this event.
/datum/event/infestation/proc/count_spawned_vermin()
	. = 0
	for(var/mob/living/simple_mob/animal/M as anything in spawned_vermin)
		if(!QDELETED(M) && M.stat != DEAD)
			. += 1

// If vermin is kill, remove it from the list.
/datum/event/infestation/proc/on_vermin_destruction(var/mob/M)
	SIGNAL_HANDLER
	spawned_vermin -= M
	UnregisterSignal(M, COMSIG_OBSERVER_DESTROYED)
*/


/datum/event/infestation/announce()
	command_announcement.Announce("Bioscans indicate that [vermstring] have been breeding in [locstring]. Clear them out, before this starts to affect productivity.", "Vermin infestation")

#undef LOC_KITCHEN
#undef LOC_ATMOS
#undef LOC_CHAPEL
#undef LOC_LIBRARY
#undef LOC_HYDRO
#undef LOC_TECH
#undef LOC_HANGAR1
#undef LOC_HANGAR2
#undef LOC_HANGAR3
#undef LOC_VAULT

#undef VERM_MICE
#undef VERM_LIZARDS
#undef VERM_SPIDERS // Chomp EDIT
