#define LOC_KITCHEN 0
#define LOC_ATMOS 1
#define LOC_CHAPEL 2
#define LOC_LIBRARY 3
#define LOC_HYDRO 4
#define LOC_TECH 5
#define LOC_HANGAR2 6
#define LOC_HANGAR3 7
#define LOC_FIELD 8


#define VERM_RATS 0
#define VERM_LIZARDMEN 1

/datum/event/mutants
	announceWhen = 25
	endWhen = 26
	var/location
	var/locstring
	var/vermin
	var/vermstring

/datum/event/mutants/start()

	location = rand(0,8)
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
		/*
		if(LOC_HANGAR1)
			spawn_area_type = /area/hangar/one
			locstring = "the hangar deck"
		*/
		if(LOC_HANGAR2)
			spawn_area_type = /area/hangar/two
			locstring = "the hangar deck"
		if(LOC_HANGAR3)
			spawn_area_type = /area/hangar/three
			locstring = "the hangar deck"
		if(LOC_FIELD) // CHOMPEdit - Another one for the list...
			spawn_area_type = /area/maintenance/field
			locstring = "the maintenance deck"

	for(var/areapath in typesof(spawn_area_type))
		var/area/A = locate(areapath)
		for(var/turf/simulated/floor/F in A.contents)
			if(turf_clear(F))
				turfs += F

	var/list/spawn_types = list()
	var/max_number
	vermin = rand(0,1)
	switch(vermin)
		if(VERM_RATS)
			spawn_types = list(/mob/living/simple_mob/animal/passive/mouse/event)
			max_number = 6
			vermstring = "mutant mice"
		if(VERM_LIZARDMEN)
			spawn_types = list(/mob/living/simple_mob/animal/passive/lizard/event)
			max_number = 6
			vermstring = "mutant lizards"

	spawn(0)
		var/num = rand(2,max_number)
		while(turfs.len > 0 && num > 0)
			var/turf/simulated/floor/T = pick(turfs)
			turfs.Remove(T)
			num--
			var/spawn_type = pick(spawn_types)
			new spawn_type(T)


/datum/event/mutants/announce()
	command_announcement.Announce("Bioscans indicate... What are those? It looks like [vermstring] have been breeding in [locstring]. Clear them out, just in case.", "Vermin infestation")

#undef LOC_KITCHEN
#undef LOC_ATMOS
#undef LOC_CHAPEL
#undef LOC_LIBRARY
#undef LOC_HYDRO
#undef LOC_TECH
#undef LOC_HANGAR2
#undef LOC_HANGAR3

#undef VERM_RATS
#undef VERM_LIZARDMEN
