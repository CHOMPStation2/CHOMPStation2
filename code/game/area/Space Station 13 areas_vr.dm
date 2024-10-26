/area/shuttle/belter
	name = "Belter Shuttle"
	icon_state = "shuttle2"

//Rouguelike Mining
/area/asteroid/rogue
	has_gravity = 0
	requires_power = 1
	always_unpowered = 1
	power_light = 0
	power_equip = 0
	power_environ = 0
	var/asteroid_spawns = list()
	var/mob_spawns = list()
	var/shuttle_area //It would be neat if this were more dynamic, but eh.

/area/asteroid/rogue/zone1
	name = "Asteroid Belt Zone 1"
	icon_state = "red2"
	//shuttle_area = /area/shuttle/belter/belt/zone1

/area/asteroid/rogue/zone2
	name = "Asteroid Belt Zone 2"
	icon_state = "blue2"
	//shuttle_area = /area/shuttle/belter/belt/zone2

/area/asteroid/rogue/zone3
	name = "Asteroid Belt Zone 3"
	icon_state = "blue2"
	//shuttle_area = /area/shuttle/belter/belt/zone3

/area/asteroid/rogue/zone4
	name = "Asteroid Belt Zone 4"
	icon_state = "red2"
	//shuttle_area = /area/shuttle/belter/belt/zone4

/area/medical/resleeving
	name = "Resleeving Lab"
	icon_state = "genetics"

/area/bigship
	name = "Bigship"
	requires_power = 0
	flags = RAD_SHIELDED
	sound_env = SMALL_ENCLOSED
	base_turf = /turf/space
	icon_state = "red2"

/area/bigship/teleporter
	name = "Bigship Teleporter Room"

//////// Small Cruiser Areas ////////
/area/houseboat
	name = "Small Cruiser"
	requires_power = 0
	flags = RAD_SHIELDED
	base_turf = /turf/space
	icon_state = "red2"
	lightswitch = TRUE

/area/houseboat/holodeck_area
	name = "Small Cruiser - Holodeck"
	icon_state = "blue2"

/area/houseboat/holodeck/off
	name = "Small Cruiser Holo - Off"
	icon_state = "blue2"
/area/houseboat/holodeck/beach
	name = "Small Cruiser Holo - Beach"
	icon_state = "blue2"
/area/houseboat/holodeck/snow
	name = "Small Cruiser Holo - Snow"
	icon_state = "blue2"
/area/houseboat/holodeck/desert
	name = "Small Cruiser Holo - Desert"
	icon_state = "blue2"
/area/houseboat/holodeck/picnic
	name = "Small Cruiser Holo - Picnic"
	icon_state = "blue2"
/area/houseboat/holodeck/thunderdome
	name = "Small Cruiser Holo - Thunderdome"
	icon_state = "blue2"
/area/houseboat/holodeck/basketball
	name = "Small Cruiser Holo - Basketball"
	icon_state = "blue2"
/area/houseboat/holodeck/gaming
	name = "Small Cruiser Holo - Gaming Table"
	icon_state = "blue2"
/area/houseboat/holodeck/space
	name = "Small Cruiser Holo - Space"
	icon_state = "blue2"
/area/houseboat/holodeck/bunking
	name = "Small Cruiser Holo - Bunking"
	icon_state = "blue2"

/area/shuttle/cruiser/cruiser
	name = "Small Cruiser Shuttle - Cruiser"
	icon_state = "blue2"
	base_turf = /turf/simulated/floor/tiled/techfloor
/area/shuttle/cruiser/station
	name = "Small Cruiser Shuttle - Station"
	icon_state = "blue2"


// Tether Map has this shuttle
/area/shuttle/tether/surface
	name = "Tether Shuttle Landed"
	icon_state = "shuttle"
	base_turf = /turf/simulated/floor/reinforced

/area/shuttle/tether/station
	name = "Tether Shuttle Dock"
	icon_state = "shuttle2"

/area/shuttle/tether/transit
	name = "Tether Shuttle Transit"
	icon_state = "shuttle2"

// rnd (Research and Development)
/area/rnd/research/testingrange
	name = "\improper Weapons Testing Range"
	icon_state = "firingrange"

/area/rnd/research/researchdivision
	name = "\improper Research Division"
	icon_state = "research"

/area/rnd/outpost
	name = "\improper Research Outpost Hallway"
	icon_state = "research"

/area/rnd/outpost/airlock
	name = "\improper Research Outpost Airlock"
	icon_state = "green"

/area/rnd/outpost/eva
	name = "Research Outpost EVA Storage"
	icon_state = "eva"

/area/rnd/outpost/chamber
	name = "\improper Research Outpost Burn Chamber"
	icon_state = "engine"

/area/rnd/outpost/atmos
	name = "Research Outpost Atmospherics"
	icon_state = "atmos"

/area/rnd/outpost/storage
	name = "\improper Research Outpost Gas Storage"
	icon_state = "toxstorage"

/area/rnd/outpost/mixing
	name = "\improper Research Outpost Gas Mixing"
	icon_state = "toxmix"

/area/rnd/outpost/hallway
	name = "\improper Toxins Hallway"
	icon_state = "toxmix"

/area/rnd/outpost/heating
	name = "\improper Research Outpost Gas Heating"
	icon_state = "toxmix"

/area/rnd/outpost/testing
	name = "\improper Research Outpost Testing"
	icon_state = "toxtest"

/area/rnd/outpost/launch
	name = "\improper Research Toxins Launch Room"
	icon_state = "toxtest"

/area/maintenance/substation/outpost
	name = "Research Outpost Substation"

/area/engineering/engine_gas
	name = "\improper Engine Gas Storage"
	icon_state = "engine_waste"

//holodeck 3/29/21
/area/holodeck/source_smoleworld
	name = "\improper Holodeck - Smolworld"
	
/area/holodeck/source_gym
	name = "\improper Holodeck - Gym"

/area/holodeck/source_game_room
	name = "\improper Holodeck - Game Room"

/area/holodeck/source_patient_ward
	name = "\improper Holodeck - Patient Ward"

/area/holodeck/the_uwu_zone
	name = "\improper Holodeck - Inside"
