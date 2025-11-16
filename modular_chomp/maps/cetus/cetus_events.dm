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

/datum/event/infestation/get_spawn_area() //adding this so maps can override areas if needed
	var/spawn_area_type
	switch(location)
		if(LOC_KITCHEN)
			spawn_area_type = /area/crew_quarters/kitchen
			locstring = "the kitchen"
		if(LOC_ATMOS)
			spawn_area_type = /area/engineering/Atmospherics_Chamber
			locstring = "atmospherics"
		if(LOC_CHAPEL)
			spawn_area_type = /area/chapel/main
			locstring = "the chapel"
		if(LOC_LIBRARY)
			spawn_area_type = /area/crew_quarters/cetus/Libraryf1
			locstring = "the library"
		if(LOC_HYDRO)
			spawn_area_type = /area/hydroponics
			locstring = "hydroponics"
		if(LOC_TECH)
			spawn_area_type = /area/engineering/cetus/meteor/techstorage
			locstring = "technical storage"
		if(LOC_HANGAR1)//no hangar one on cetus, so i'll have a litttle fun with this
			spawn_area_type = /area/maintenance/cetus/shallow/derelict/hallway
			locstring = "the HIS Andromeda"
		if(LOC_HANGAR2)
			spawn_area_type = /area/hangar/cetus/two
			locstring = "the hangar deck"
		if(LOC_HANGAR3)
			spawn_area_type = /area/hangar/three
			locstring = "the hangar deck"
		if(LOC_VAULT)
			spawn_area_type = /area/security/nuke_storage
			locstring = "the vault"
	return spawn_area_type

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
