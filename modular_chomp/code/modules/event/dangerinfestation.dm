#define LOC_RIOT 0
#define LOC_ATMOS 1
#define LOC_DISPOSAL 2
#define LOC_TECH 3
#define LOC_VAULT 4


#define DANGER_CRAB 0
#define DANGER_ICE 1
#define DANGER_RAY 2

//infestation event of a diffrent variety
//meant for engineering and science to exploit
/datum/event/dangerinfestation
	announceWhen = 10
	endWhen = 11
	var/location
	var/locstring
	var/danger
	var/dangerstring

/datum/event/dangerinfestation/start()
	location = rand(0,4)
	var/list/turf/simulated/floor/turfs = list()
	var/spawn_area_type
	switch(location)
		if(LOC_RIOT)
			spawn_area_type = /area/security/riot_control
			locstring = "riot control"
		if(LOC_ATMOS)
			spawn_area_type = /area/engineering/atmos
			locstring = "atmospherics"
		if(LOC_DISPOSAL)
			spawn_area_type = /area/maintenance/disposal
			locstring = "the disposal"
		if(LOC_TECH)
			spawn_area_type = /area/storage/tech
			locstring = "technical storage"
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

	var/list/spawn_types = list()
	var/min_number
	var/max_number
	danger = rand(0,2)
	switch(danger)
		if(DANGER_CRAB)
			spawn_types = list(/mob/living/simple_mob/vore/spacecritter/radcrab)
			min_number = 1
			max_number = 4
			dangerstring = "crystaline crabs"
		if(DANGER_ICE)
			spawn_types = list(/mob/living/simple_mob/vore/spacecritter/livingice)
			min_number = 1
			max_number = 4
			dangerstring = "strange entities"

		if(DANGER_RAY)
			spawn_types = list(/mob/living/simple_mob/vore/spacecritter/solarray)
			min_number = 1
			max_number = 4
			dangerstring = "solar rays"

	spawn(0)
		var/num = rand(min_number,max_number)
		while(turfs.len > 0 && num > 0)
			var/turf/simulated/floor/T = pick(turfs)
			turfs.Remove(T)
			num--
			var/spawn_type = pick(spawn_types)
			new spawn_type(T)

/datum/event/dangerinfestation/announce()
	command_announcement.Announce("Bioscans indicate that [dangerstring] have been entered [locstring]. Contain them before they start causing damage.", "Alien infestation")

#undef LOC_RIOT
#undef LOC_ATMOS
#undef LOC_DISPOSAL
#undef LOC_TECH
#undef LOC_VAULT


#undef DANGER_CRAB
#undef DANGER_ICE
#undef DANGER_RAY
