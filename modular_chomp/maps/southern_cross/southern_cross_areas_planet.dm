//Planetside

/area/surface
	name = "The Surface (Don't Use)"
	flags = RAD_SHIELDED

/area/surface/center
	name = "Center"
	icon_state = "center"

/area/surface/north
	name = "Outpost"
	icon_state = "north"

/area/surface/south
	name = "Lake"
	icon_state = "south"

/area/surface/east
	name = "Shoreline"
	icon_state = "east"

/area/surface/west
	name = "Snowfields"
	icon_state = "west"

/area/surface/northeast
	name = "Depths"
	icon_state = "northeast"

/area/surface/northwest
	name = "Mountains"
	icon_state = "northwest"

/area/surface/southwest
	name = "Glowing Forest"
	icon_state = "southwest"

/area/surface/southeast
	name = "Southern Shoreline"
	icon_state = "southeast"

/area/surface/outside
	ambience = AMBIENCE_SIF
	always_unpowered = TRUE
	flags = AREA_FLAG_IS_NOT_PERSISTENT
	outdoors = OUTDOORS_YES

// The area near the outpost, so POIs don't show up right next to the outpost.
/area/surface/outside/plains/outpost
	name = "Outpost Perimeter"
	icon_state = "green"

// Rest of the 'plains' Z-level, for POIs.
/area/surface/outside/plains/normal
	name = "Plains"
	icon_state = "yellow"

// So POIs don't get embedded in rock.
/area/surface/outside/plains/mountains
	name = "Mountains"
	icon_state = "darkred"

// Paths get their own area so POIs don't overwrite pathways.
/area/surface/outside/path
	name = "Pathway"
	icon_state = "purple"

// Used to overmap shuttle landing zones so POIs dont override it
/area/surface/outside/landing/plains
	name = "Plains"
	icon_state = "purple"

/area/surface/outside/path/plains

/area/surface/outside/wilderness/normal
	name = "Wilderness"
	icon_state = "yellow"

/area/surface/outside/wilderness/deep
	name = "Deep Wilderness"
	icon_state = "red"

// So POIs don't get embedded in rock.
/area/surface/outside/wilderness/mountains
	name = "Mountains"
	icon_state = "darkred"

// so POIs don't block landing zones
/area/surface/outside/landing/wilderness
	name = "Wilderness"
	icon_state = "purple"

/* //Sky islands removal, lack of use
/area/surface/outside/wilderness/skylands
	name = "Floating Islands"
	icon_state = "blue"

/area/surface/outside/wilderness/skylands/empty
	name = "Sky"
	icon_state = "red"
	luminosity = 1
*/


/area/surface/outside/path/wilderness

// Water
/area/surface/outside/ocean
	name = "Sea"
	icon_state = "bluenew"

/area/surface/outside/river
	name = "River"
	icon_state = "bluenew"

/area/surface/outside/river/faxalven
	name = "Faxälven River"

/area/surface/outside/river/indalsalven
	name = "Indalsälven River"

/area/surface/outside/river/svartan
	name = "Svartån River"

/area/surface/outside/lake/romsele
	name = "Romsele Lake"
	icon_state = "blue2"



/area/surface/cave
	flags = RAD_SHIELDED
	always_unpowered = TRUE

/area/surface/cave
	ambience = list('sound/ambience/ambimine.ogg', 'sound/ambience/song_game.ogg', 'sound/music/LRRMenu.ogg', 'sound/music/LRRTrack3.ogg', 'sound/ambience/cave/AmbCaveDebriA.ogg', 'sound/ambience/cave/AmbCaveDebriB.ogg', 'sound/ambience/cave/AmbCaveDebriC.ogg', 'sound/ambience/cave/AmbCaveDebriD.ogg')

// The bottom half that connects to the outpost and is safer.
/area/surface/cave/explored/normal
	name = "Tunnels"
	icon_state = "explored"

/area/surface/cave/explored/trader
	name = "Trader Hideout"
	icon_state = "hideaway"

/area/surface/cave/unexplored/normal
	name = "Tunnels"
	icon_state = "unexplored"

// The top half of the map that is more dangerous.
/area/surface/cave/explored/deep
	name = "Depths"
	icon_state = "explored_deep"

/area/surface/cave/unexplored/deep
	name = "Depths"
	icon_state = "unexplored_deep"



//Surface Outposts

/area/surface/outpost
	ambience = AMBIENCE_GENERIC

//Wilderness Shuttle Shelter

/area/surface/outpost/shelter
	name = "Wilderness Shelter"

/area/surface/outpost/shelter/dorms
	name = "Wilderness Shelter Dorms"
	icon_state = "Sleep"
	soundproofed = TRUE
	limit_mob_size = FALSE
	block_suit_sensors = TRUE
	flags = RAD_SHIELDED
	block_tracking = TRUE

/area/surface/outpost/shelter/exterior
	name = "Wilderness Shelter Exterior"
	icon_state = "exit"
	ambience = list('sound/ambience/ambimine.ogg', 'sound/ambience/song_game.ogg', 'sound/music/LRRMenu.ogg', 'sound/music/LRRTrack3.ogg', 'sound/ambience/cave/AmbCaveDebriA.ogg', 'sound/ambience/cave/AmbCaveDebriB.ogg', 'sound/ambience/cave/AmbCaveDebriC.ogg', 'sound/ambience/cave/AmbCaveDebriD.ogg')
	outdoors = OUTDOORS_YES

/area/surface/outpost/shelter/utilityroom
	name = "Wilderness Shelter Utility Room"
	icon_state = "substation"

//Valley stuffs, chomps Edit by Jasper, for wilds but stranger.
/area/surface/outpost/unfinished
	name = "Unfinished"
	icon_state = "red"

/area/surface/outside/valley/inner
	name = "Valley Inner"
	icon_state = "yellow"

/area/surface/outside/valley/walls
	name = "Valley Walls"
	icon_state = "yellow"
	outdoors = OUTDOORS_NO

/area/surface/outside/valley/edge
	name = "Valley Edge"
	icon_state = "yellow"

/area/surface/outside/valley/river
	name = "Valley River"
	icon_state = "yellow"

/area/surface/outside/valley/end
	name = "Valley's End"
	icon_state = "red"

// Main mining outpost
/area/surface/outpost/mining_main
	name = "North Mining Outpost"
	icon_state = "outpost_mine_main"
	outdoors = OUTDOORS_NO

/area/surface/outpost/mining_main/exterior
	name = "North Mining Outpost Exterior"
	icon_state = "outpost_mine_main"
	outdoors = OUTDOORS_YES

/area/surface/outpost/mining_main/crew_area
	name = "North Mining Crew Area"

/area/surface/outpost/mining_main/firstaid
	name = "North Mining First-Aid Station"

/area/surface/outpost/mining_main/storage
	name = "North Mining Gear Storage"

/area/surface/outpost/mining_main/uxstorage
	name = "North Mining Gear Secondary Storage"

/area/surface/outpost/mining_main/mech_bay
	name = "North Mining Mech Bay"

/area/surface/outpost/mining_main/emergencystorage
	name = "\improper North Mining Emergency Storage"
	flags = RAD_SHIELDED
	icon_state = "emergencystorage"
	sound_env = SMALL_ENCLOSED

/area/surface/outpost/mining_main/refinery
	name = "North Mining Refinery"

/area/surface/outpost/mining_main/restroom
	name = "North Mining Restroom"
	sound_env = SMALL_ENCLOSED

/area/surface/outpost/mining_main/tools
	name = "North Mining Tool Storage"

/area/surface/outpost/mining_main/cave
	name = "North Mining Outpost Cave"
	icon_state = "outpost_mine_main"

//Rust-Engine Outpost CHOMPedit - ksc

/area/surface/outpost/engineering/atmos_room
	name = "North Atmos Room"
	icon_state = "atmos"

/area/surface/outpost/engineering/smes
	name = "North Engineering SMES"
	icon_state = "substation"
	ambience = AMBIENCE_SUBSTATION //CHOMP Addition

/area/surface/outpost/engineering/reactor_smes
	name = "North Engineering Reactor SMES"
	icon_state = "engine_smes"
	ambience = AMBIENCE_SUBSTATION //CHOMP Addition

/area/surface/outpost/engineering/storage
	name = "North Engineering Storage"
	icon_state = "storage"

/area/surface/outpost/engineering/monitoring
	name = "North Engineering Monitoring"
	icon_state = "engine_monitoring"

/area/surface/outpost/engineering/auxiliary_storage
	name = "North Engineering Auxiliary Storage"
	icon_state = "emergencystorage"

//Research Surface Outpost

/area/surface/outpost/research
	icon_state = "outpost_research"
	outdoors = OUTDOORS_NO

/area/surface/outpost/research/xenoresearch
	name = "\improper Xenoresearch"

/area/surface/outpost/research/xenoresearch/smes
	name = "\improper Xenoresearch SMES Maintenance"
	icon_state = "substation"
	sound_env = SMALL_ENCLOSED
	ambience = AMBIENCE_SUBSTATION //CHOMP Addition

/area/surface/outpost/research/xenoresearch/emergencystorage
	name = "\improper Xenoresearch Emergency Storage"
	icon_state = "emergencystorage"
	sound_env = SMALL_ENCLOSED

/area/surface/outpost/research/xenoresearch/first_aid //CHOMPstation edit
	name = "\improper Xenoresearch First-Aid Station"
	icon_state = "medbay2"

/area/surface/outpost/research/xenoresearch/restroom
	name = "\improper Xenoresearch Restroom"
	icon_state = "research_restroom"
	sound_env = SMALL_ENCLOSED

/area/surface/outpost/research/xenoresearch/xenobiology
	name = "\improper Xenobiology Lab"
	icon_state = "xeno_lab"

/area/surface/outpost/research/xenoresearch/xenoflora
	name = "\improper Xenoflora Lab"
	icon_state = "xeno_f_lab"

/area/surface/outpost/research/xenoresearch/xenoflora_storage
	name = "\improper Xenoflora Storage"
	icon_state = "xeno_f_store"

/area/surface/outpost/research/xenoresearch/medical
	name = "Xenoresearch First-Aid Station"

/area/surface/outpost/research/xenoarcheology
	name = "\improper Xenoarcheology"

/area/surface/outpost/research/xenoarcheology/exterior
	name = "\improper xenoarcheology Exterior"
	icon_state = "exit"

/area/surface/outpost/research/xenoarcheology/medical
	name = "Xenoarcheology First-Aid Station"

/area/surface/outpost/research/xenoarcheology/smes
	name = "\improper Xenoarcheology SMES Maintenance"
	icon_state = "substation"
	sound_env = SMALL_ENCLOSED
	ambience = AMBIENCE_SUBSTATION //CHOMP Addition

/area/surface/outpost/research/xenoarcheology/emergencystorage
	name = "\improper Xenoarcheology Emergency Storage"
	icon_state = "emergencystorage"
	sound_env = SMALL_ENCLOSED

/area/surface/outpost/research/xenoarcheology/restroom
	name = "\improper Xenoarcheology Restroom"
	icon_state = "research_restroom"
	sound_env = SMALL_ENCLOSED

/area/surface/outpost/research/xenoarcheology/analysis
	name = "Xenoarcheology Sample Analysis"

/area/surface/outpost/research/xenoarcheology/anomaly
	name = "Xenoarcheology Anomalous Materials Lab"

/area/surface/outpost/research/xenoarcheology/isolation_a
	name = "Xenoarcheology Isolation A"

/area/surface/outpost/research/xenoarcheology/isolation_b
	name = "Xenoarcheology Isolation B"

/area/surface/outpost/research/xenoarcheology/isolation_c
	name = "Xenoarcheology Isolation C"

/area/surface/outpost/research/xenoarcheology/lounge
	name = "Xenoarcheology Research Lounge"

/area/surface/outpost/research/xenoarcheology/longtermstorage
	name = "Xenoarcheology Long-Term Anomalous Storage"

/area/surface/outpost/research/xenoarcheology/exp_prep
	name = "Xenoarcheology Expedition Preperation"

//Main Outpost

/area/surface/outpost/main
	name = "\improper Main Outpost"
	icon_state = "Sleep"
	outdoors = OUTDOORS_NO

/area/surface/outpost/main/laundry
	name = "\improper Main Outpost Laundry Room"

/area/surface/outpost/main/landing
	name = "\improper Main Outpost Shuttle Landing"
	icon_state = "hangar"

/area/surface/outpost/main/gen_room
	name = "\improper Main Outpost SMES"
	icon_state = "substation"
	ambience = AMBIENCE_SUBSTATION //CHOMP Edit

/area/surface/outpost/main/gen_room/smes_left
	name = "\improper Main Outpost Left Wing SMES"

/area/surface/outpost/main/gen_room/smes_right
	name = "\improper Main Outpost Right Wing SMES"

/area/surface/outpost/main/gen_room/smes
	name = "\improper Main Outpost Dorm SMES"
	icon_state = "substation"

/area/surface/outpost/main/pool
	name = "\improper Main Outpost Pool"
	icon_state = "pool"

/area/surface/outpost/main/restroom
	name = "\improper Main Outpost Restroom"
	icon_state = "toilet"
	sound_env = SMALL_ENCLOSED

/area/surface/outpost/main/showers
	name = "\improper Main Outpost Showers"
	icon_state = "toilet"
	sound_env = SMALL_ENCLOSED

/area/surface/outpost/main/gym
	name = "\improper Main Outpost Gym"
	icon_state = "fitness"

/area/surface/outpost/main/garage
	name = "\improper Main Outpost Garage"
	icon_state = "storage"

/area/surface/outpost/main/crew_quarters
	name = "\improper Main Outpost Crew Quarters"
	sound_env = MEDIUM_SOFTFLOOR

/area/surface/outpost/main/tcomm
	name = "\improper Main Outpost Telecommunications"
	icon_state = "tcomsatcham"
	music = "signal"

/area/surface/outpost/main/teleporter
	name = "\improper Main Outpost Teleporter"
	icon_state = "teleporter"

/area/surface/outpost/main/first_aid
	name = "\improper Main Outpost First-Aid Station"
	icon_state = "medbay2"

/area/surface/outpost/main/search_and_rescue
	name = "\improper Main Outpost Search and Rescue"
	icon_state = "medbay2"

/area/surface/outpost/main/exploration
	name = "\improper Main Outpost Exploration Prep Room"
	icon_state = "outpost_research"

/area/surface/outpost/main/exploration/containment
	name = "\improper Main Outpost Fauna Containment"

/area/surface/outpost/main/security
	name = "\improper Main Outpost Security Station"
	icon_state = "checkpoint1"

/area/surface/outpost/main/gateway
	name = "\improper Main Outpost Gateway"
	icon_state = "teleporter"
	music = "signal"

/area/surface/outpost/main/gateway
	name = "\improper Main Outpost Gateway"
	icon_state = "teleporter"

/area/surface/outpost/main/corridor
	name = "\improper Main Outpost Corridor"
	icon_state = "dk_yellow"

/area/surface/outpost/main/corridor/dorms
	name = "\improper Main Outpost Dorm Corridor"

/area/surface/outpost/main/corridor/right_lower
	name = "\improper Main Outpost Right Wing Lower Corridor"

/area/surface/outpost/main/corridor/right_upper
	name = "\improper Main Outpost Right Wing Upper Corridor"

/area/surface/outpost/main/corridor/left_lower
	name = "\improper Main Outpost Left Wing Lower Corridor"

/area/surface/outpost/main/corridor/left_upper
	name = "\improper Main Outpost Left Wing Upper Corridor"

/area/surface/outpost/main/bar
	name = "\improper Main Outpost Bar"
	icon_state = "bar"
/*
/area/surface/outpost/main/dorms
	name = "\improper Main Outpost Dorms"

/area/surface/outpost/main/dorms/dorm_1
	name = "\improper Main Outpost Dorm One"

/area/surface/outpost/main/dorms/dorm_2
	name = "\improper Main Outpost Dorm Two"

/area/surface/outpost/main/dorms/dorm_3
	name = "\improper Main Outpost Dorm Three"

/area/surface/outpost/main/dorms/dorm_4
	name = "\improper Main Outpost Dorm Four"

/area/surface/outpost/main/dorms/dorm_5
	name = "\improper Main Outpost Dorm Five"

/area/surface/outpost/main/dorms/dorm_6
	name = "\improper Main Outpost Dorm Six"
*/
/area/surface/outpost/main/airlock
	name = "\improper Main Outpost Airlock"
	icon_state = "red"
	ambience = AMBIENCE_SIF

/area/surface/outpost/main/airlock/left_one
	name = "\improper Outpost Left Wing Airlock One"

/area/surface/outpost/main/airlock/left_two
	name = "\improper Outpost Left Wing Airlock Two"

/area/surface/outpost/main/airlock/left_three
	name = "\improper Outpost Left Wing Airlock Three"

/area/surface/outpost/main/airlock/right_one
	name = "\improper Outpost Right Wing Airlock One"

/area/surface/outpost/main/airlock/right_two
	name = "\improper Outpost Right Wing Airlock Two"

/area/surface/outpost/main/airlock/right_three
	name = "\improper Outpost Right Wing Airlock Three"

/area/surface/outpost/main/airlock/landing_north
	name = "\improper Main Outpost North Airlock"

/area/surface/outpost/main/airlock/landing_south
	name = "\improper Main Outpost South Airlock"

/area/surface/outpost/main/construction_area
	name = "\improper Main Outpost Construction Area"
	icon_state = "construction"

/area/surface/outpost/main/janitor
	name = "\improper Main Outpost Custodial Closet"
	icon_state = "janitor"

/area/surface/outpost/main/emergency_storage
	flags = RAD_SHIELDED
	name = "Emergency Storage"
	icon_state = "emergencystorage"

/area/surface/outpost/main/emergency_storage/one
	name = "\improper Main Outpost Emergency Storage One"

/area/surface/outpost/main/emergency_storage/two
	name = "\improper Main Outpost Emergency Storage Two"

/area/surface/outpost/wall
	name = "The Wall"
	icon_state = "red"
	requires_power = FALSE
	ambience = AMBIENCE_HIGHSEC

/area/surface/outpost/wall/checkpoint
	name = "Checkpoint"
	ambience = AMBIENCE_HIGHSEC

//Civilian Outpost

/area/surface/outpost/civilian
	name = "\improper Civilian Outpost"
	icon_state = "recreation_area"

/area/surface/outpost/civilian/smes
	name = "\improper Civilian Outpost SMES"
	icon_state = "substation"
	ambience = AMBIENCE_ENGINEERING

/area/surface/outpost/civilian/fishing
	name = "\improper Civilian Outpost Fishing Supplies"
	icon_state = "storage"

/area/surface/outpost/civilian/pool
	name = "\improper Civilian Outpost Pool"
	icon_state = "pool"

/area/surface/outpost/civilian/sauna
	name = "\improper Civilian Outpost Sauna"

/area/surface/outpost/civilian/emergency_storage
	flags = RAD_SHIELDED
	name = "\improper Civilian Outpost Emergency Storage"
	icon_state = "emergencystorage"

//Security Outpost

/area/surface/outpost/security
	name = "\improper Security Outpost"
	icon_state = "checkpoint1"

/area/surface/outpost/security/maa
	name = "\improper Security Outpost Gear Storage"
	icon_state = "security"

/area/surface/outpost/security/smes
	name = "\improper Security Outpost SMES"
	icon_state = "substation"
	ambience = AMBIENCE_SUBSTATION //CHOMP Edit

//Mining Station

/area/outpost/mining_station
	icon_state = "outpost_mine_main"
	name = "Mining Station"
	outdoors = OUTDOORS_NO

/area/outpost/mining_station/dorms
	name = "Mining Station Dormitory"

/area/outpost/mining_station/storage
	name = "Mining Station Gear Storage"

/area/outpost/mining_station/gen_station
	name = "Mining Station Generator Room"
	icon_state = "substation"
	ambience = AMBIENCE_SUBSTATION //CHOMP Edit

/area/outpost/mining_station/crew_area
	name = "Mining Station Crew Area"

/area/outpost/mining_station/refinery
	name = "Mining Station Refinery"

/area/outpost/mining_station/telecomms
	name = "Main Station Telecommunications"
	sound_env = SMALL_ENCLOSED

/area/outpost/mining_station/dock
	name = "Mining Station Dock"
