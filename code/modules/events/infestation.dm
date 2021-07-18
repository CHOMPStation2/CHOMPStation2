//CHOMP Edit changed for Southern Cross areas
#define LOC_KITCHEN 0
#define LOC_ATMOS 1
#define LOC_CHAPEL 2
#define LOC_LIBRARY 3
#define LOC_HYDRO 4
<<<<<<< HEAD
#define LOC_TECH 5
#define LOC_HANGAR1 6
#define LOC_HANGAR2 7
#define LOC_HANGAR3 8
#define LOC_VAULT 9

||||||| parent of f849783331... Merge pull request #11122 from Enzo-Leon/migrations
#define LOC_VAULT 5
#define LOC_CONSTR 6
#define LOC_TECH 7
#define LOC_GARDEN 8
=======
#define LOC_CONSTR 5
#define LOC_TECH 6
#define LOC_GARDEN 7
#define LOC_STEMNGR 8
#define LOC_RESEARCH 9
>>>>>>> f849783331... Merge pull request #11122 from Enzo-Leon/migrations

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
<<<<<<< HEAD
//CHOMP Edit changed for Southern Cross areas
	location = rand(0,9)
||||||| parent of f849783331... Merge pull request #11122 from Enzo-Leon/migrations

	location = rand(0,8)
=======

	location = rand(0,10)
>>>>>>> f849783331... Merge pull request #11122 from Enzo-Leon/migrations
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
<<<<<<< HEAD
||||||| parent of f849783331... Merge pull request #11122 from Enzo-Leon/migrations
		if(LOC_VAULT)
			spawn_area_type = /area/security/nuke_storage
			locstring = "the vault"
		if(LOC_CONSTR)
			spawn_area_type = /area/construction
			locstring = "the construction area"
=======
		if(LOC_CONSTR)
			spawn_area_type = /area/construction
			locstring = "the construction area"
>>>>>>> f849783331... Merge pull request #11122 from Enzo-Leon/migrations
		if(LOC_TECH)
			spawn_area_type = /area/storage/tech
			locstring = "technical storage"
<<<<<<< HEAD
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
||||||| parent of f849783331... Merge pull request #11122 from Enzo-Leon/migrations
		if(LOC_GARDEN)
			spawn_area_type = /area/hydroponics/garden
			locstring = "the public garden"
=======
		if(LOC_GARDEN)
			spawn_area_type = /area/hydroponics/garden
			locstring = "the public garden"
		if(LOC_STEMNGR)
			spawn_area_type = /area/crew_quarters/captain
			locstring = "the site manager's office"
		if(LOC_RESEARCH)
			spawn_area_type = /area/rnd/research
			locstring = "the research division"
>>>>>>> f849783331... Merge pull request #11122 from Enzo-Leon/migrations

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
		if(VERM_SPIDERS)
			spawn_types = list(/obj/effect/spider/spiderling)
			min_number = 4 //CHOMP Add
			max_number = 8 //CHOMP edit
			vermstring = "spiders"

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


/datum/event/infestation/announce()
	command_announcement.Announce("Bioscans indicate that [vermstring] have been breeding in [locstring]. Clear them out, before this starts to affect productivity.", "Vermin infestation")

#undef LOC_KITCHEN
#undef LOC_ATMOS
#undef LOC_CHAPEL
#undef LOC_LIBRARY
#undef LOC_HYDRO
#undef LOC_TECH
<<<<<<< HEAD
#undef LOC_HANGAR1
#undef LOC_HANGAR2
#undef LOC_HANGAR3
#undef LOC_VAULT
||||||| parent of f849783331... Merge pull request #11122 from Enzo-Leon/migrations
#undef LOC_GARDEN
=======
#undef LOC_GARDEN
#undef LOC_STEMNGR
#undef LOC_RESEARCH
>>>>>>> f849783331... Merge pull request #11122 from Enzo-Leon/migrations

#undef VERM_MICE
#undef VERM_LIZARDS
#undef VERM_SPIDERS
