#define LOC_CONAREA1 0
#define LOC_CONAREA2 1
#define LOC_CENTERAL 2
#define LOC_TELECOMN 3
#define LOC_AIFOYER 4
#define LOC_TECH 5
#define LOC_FOREPORT 6
#define LOC_AFTPORT 7
#define LOC_TOXINLAUNCH 8


#define VERM_BANDITS 0
#define VERM_MERC 1
#define VERM_CULTIST 2
#define VERM_PIRATE 3

/datum/event/tresspasser
	announceWhen = 25
	endWhen = 26
	var/location
	var/locstring
	var/vermin
	var/vermstring

/datum/event/tresspasser/start()

	location = rand(0,8)
	var/list/turf/simulated/floor/turfs = list()
	var/spawn_area_type
	switch(location)
		if(LOC_CONAREA1)
			spawn_area_type = /area/construction/firstdeck/construction1
			locstring = "construction area 1"
		if(LOC_CONAREA2)
			spawn_area_type = /area/construction/firstdeck/construction2
			locstring = "atmospherics"
		if(LOC_CENTERAL)
			spawn_area_type = /area/maintenance/substation/central
			locstring = "centeral maintence"
		if(LOC_TELECOMN)
			spawn_area_type = /area/tcomm/computer
			locstring = "tele-comn"
		if(LOC_AIFOYER)
			spawn_area_type = /area/ai/ai_upload_foyer
			locstring = "ai foyer"
		if(LOC_TECH)
			spawn_area_type = /area/storage/tech
			locstring = "technical storage"
		if(LOC_FOREPORT)
			spawn_area_type = /area/maintenance/thirddeck/foreport
			locstring = "third deck fore port maintence"
		if(LOC_AFTPORT)
			spawn_area_type = /area/maintenance/thirddeck/aftport
			locstring = "third deck aft port maintence"
		if(LOC_TOXINLAUNCH)
			spawn_area_type = /area/rnd/toxins_launch
			locstring = "toxin launch"

	for(var/areapath in typesof(spawn_area_type))
		var/area/A = locate(areapath)
		for(var/turf/simulated/floor/F in A.contents)
			if(turf_clear(F))
				turfs += F

	var/list/spawn_types = list()
	var/max_number
	vermin = rand(0,3)
	switch(vermin)
		if(VERM_BANDITS)
			spawn_types = list(/mob/living/simple_mob/humanoid/merc/melee)
			max_number = 3
			vermstring = "intruders"
		if(VERM_MERC)
			spawn_types = list(/mob/living/simple_mob/humanoid/merc/melee/sword/space)
			max_number = 2
			vermstring = "highly armed intruder"
		if(VERM_CULTIST)
			spawn_types = list(/mob/living/simple_mob/humanoid/cultist/tesh)
			max_number = 4
			vermstring = "armed intruder"
		if(VERM_PIRATE)
			spawn_types = list(/mob/living/simple_mob/humanoid/pirate/machete/armored, /mob/living/simple_mob/humanoid/pirate/shield/armored, /mob/living/simple_mob/humanoid/pirate/ranged/armored)
			max_number = 2
			vermstring = "strangely armed intruder"

	spawn(0)
		var/num = rand(2,max_number)
		while(turfs.len > 0 && num > 0)
			var/turf/simulated/floor/T = pick(turfs)
			turfs.Remove(T)
			num--
			var/spawn_type = pick(spawn_types)
			new spawn_type(T)


/datum/event/tresspasser/announce()
	command_announcement.Announce("Bioscans indicate... What are those? It looks like [vermstring] has broken into [locstring]. Proceed with caution.", "Vermin infestation")

#undef LOC_CONAREA1
#undef LOC_CONAREA2
#undef LOC_CENTERAL
#undef LOC_LTELECOMN
#undef LOC_AIFOYER
#undef LOC_TECH
#undef LOC_FOREPORT
#undef LOC_AFTPORT
#undef LOC_TOXINLAUNCH


#undef VERM_RATS
#undef VERM_LIZARDMEN