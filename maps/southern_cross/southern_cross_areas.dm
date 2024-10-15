
/*
/datum/map/southern_cross

	post_round_safe_areas = list (
		/area/centcom,
		/area/shuttle/escape/centcom,
		/area/shuttle/escape_pod1/centcom,
		/area/shuttle/escape_pod2/centcom,
		/area/shuttle/escape_pod3/centcom,
		/area/shuttle/escape_pod5/centcom,
		/area/shuttle/transport1/centcom,
		/area/shuttle/administration/centcom,
		/area/shuttle/response_ship,
	)
*/

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
z
//Turbolift

/area/turbolift
	name = "\improper Turbolift"
	icon_state = "shuttle"
	requires_power = 0
	dynamic_lighting = 1
	flags = RAD_SHIELDED

/area/turbolift/start
	name = "\improper Turbolift Start"

/area/turbolift/firstdeck
	name = "\improper first deck"
	base_turf = /turf/simulated/floor/plating

/area/turbolift/seconddeck
	name = "\improper second deck"
	base_turf = /turf/simulated/open

/area/turbolift/thirddeck
	name = "\improper third deck"
	base_turf = /turf/simulated/open

// Elevator areas.
// CHOMPEdit - Maintenance Deck
/area/turbolift/port_deck_maints
	name = "lift (maints deck)"
	lift_floor_label = "Deck 0"
	lift_floor_name = "Maintenance Deck"
	lift_announce_str = "Arriving at Maintenance Deck: Engineering. Power Back Up. Gravity Generator."
	base_turf = /turf/simulated/floor

/area/turbolift/port_deck_one
	name = "lift (first deck)"
	lift_floor_label = "Deck 1"
	lift_floor_name = "Hangar Deck"
	lift_announce_str = "Arriving at Hangar Deck: Main Hangars.Cargo Delivery. Telecommunications. Auxiliary Shuttle Docks. Escape Pods."

/area/turbolift/port_deck_two
	name = "lift (second deck)"
	lift_floor_label = "Deck 2"
	lift_floor_name = "Operations Deck"
	lift_announce_str = "Arriving at Operations Deck: Engineering. Cargo. Medbay. Research. Security. Crew Facilities Shuttle Docks. Cryogenic Storage."

/area/turbolift/starboard_deck_one
	name = "lift (first deck)"
	lift_floor_label = "Deck 1"
	lift_floor_name = "Hangar Deck"
	lift_announce_str = "Arriving at Hangar Deck: Main Hangars.Cargo Delivery. Telecommunications. Auxiliary Shuttle Docks. Escape Pods."
	base_turf = /turf/simulated/floor

/area/turbolift/starboard_deck_two
	name = "lift (second deck)"
	lift_floor_label = "Deck 2"
	lift_floor_name = "Operations Deck"
	lift_announce_str = "Arriving at Operations Deck: Engineering. Cargo. Medbay. Research. Security. Crew Facilities, Shuttle Docks. Cryogenic Storage."

/area/turbolift/center_deck_one
	name = "lift (first deck)"
	lift_floor_label = "Deck 1"
	lift_floor_name = "Hangar Deck"
	lift_announce_str = "Arriving at Hangar Deck: Main Hangars.Cargo Delivery. Telecommunications. Auxiliary Shuttle Docks. Escape Pods."
	base_turf = /turf/simulated/floor

/area/turbolift/center_deck_two
	name = "lift (second deck)"
	lift_floor_label = "Deck 2"
	lift_floor_name = "Operations Deck"
	lift_announce_str = "Arriving at Operations Deck: Engineering. Cargo. Medbay. Research. Security. Crew Facilities Shuttle Docks. Cryogenic Storage."

/area/turbolift/center_deck_three
	name = "lift (third deck)"
	lift_floor_label = "Deck 3"
	lift_floor_name = "Command Deck"
	lift_announce_str = "Arriving at Command Deck: Bridge. Meeting Room. Command Quarters. AI Core. Solars."

/area/turbolift/cargo_deck_one
	name = "lift (first deck)"
	lift_floor_label = "Deck 1"
	lift_floor_name = "Hangar Deck"
	lift_announce_str = "Arriving at Cargo Delivery."
	base_turf = /turf/simulated/floor

/area/turbolift/cargo_deck_two
	name = "lift (second deck)"
	lift_floor_label = "Deck 2"
	lift_floor_name = "Operations Deck"
	lift_announce_str = "Arriving at Cargo."

//Deck One (Z-1)

/area/engineering/auxiliary_engineering
	name = "\improper Auxiliary Engineering Station"
	sound_env = SMALL_ENCLOSED
/*
//KSC - CHOMPStation Edit 1/19/21 - Moving this to the second-deck
/area/crew_quarters/firstdeck/gym
	name = "\improper Station Gym"
	icon_state = "fitness"
*/

/area/construction/firstdeck/
	name = "\improper Engineering Construction Area"
	icon_state = "construction"

/area/construction/firstdeck/construction1
	name = "\improper First Deck Engineering Construction Area 1"

/area/construction/firstdeck/construction2
	name = "\improper First Deck Engineering Construction Area 2"

/area/construction/firstdeck/construction3
	name = "\improper First Deck Engineering Construction Area 3"

/area/construction/firstdeck/construction4
	name = "\improper First Deck Engineering Construction Area 4"

/area/construction/firstdeck/construction5
	name = "\improper First Deck Engineering Construction Area 5"

/area/crew_quarters/toilet/firstdeck
	name = "\improper First Deck Restroom"

/area/maintenance/firstdeck
	name = "First Deck Maintenance"
	icon_state = "maintcentral"

/area/maintenance/firstdeck/aftstarboard
	name = "First Deck Aft Starboard Maintenance"
	icon_state = "asmaint"

/area/maintenance/firstdeck/aftport
	name = "First Deck Aft Port Maintenance"
	icon_state = "apmaint"

/area/maintenance/firstdeck/forestarboard
	name = "First Deck Fore Starboard Maintenance"
	icon_state = "fsmaint"

/area/maintenance/firstdeck/foreport
	name = "First Deck Fore Port Maintenance"
	icon_state = "fpmaint"

/area/maintenance/firstdeck/centralstarboard
	name = "First Deck Starboard Maintenance"
	icon_state = "smaint"

/area/maintenance/firstdeck/centralport
	name = "First Deck Port Maintenance"
	icon_state = "pmaint"

/area/maintenance/substation/firstdeck
	name = "First Deck Utility Access"

/area/maintenance/substation/firstdeck/cargo
	name = "First Deck Cargo Substation"

/area/hallway/primary/firstdeck/elevator
	name = "\improper First Deck Central Elevator Access"
	icon_state = "hallC"

/area/hallway/primary/firstdeck/fore
	name = "\improper First Deck Fore Hallway"
	icon_state = "hallF"

/area/hallway/primary/firstdeck/fpcenter
	name = "\improper First Deck Fore Port Central Hallway"
	icon_state = "hallC1"

/area/hallway/primary/firstdeck/fscenter
	name = "\improper First Deck Fore Starboard Central Hallway"
	icon_state = "hallC2"

/area/hallway/primary/firstdeck/apcenter
	name = "\improper First Deck Aft Port Central Hallway"
	icon_state = "hallC3"

/area/hallway/primary/firstdeck/ascenter
	name = "\improper First Deck Aft Starboard Central Hallway"
	icon_state = "hallC4"

/area/hallway/primary/firstdeck/aft
	name = "\improper First Deck Aft Hallway"
	icon_state = "hallA"

/area/hallway/primary/firstdeck/port
	name = "\improper First Deck Port Hallway"
	icon_state = "hallP"

/area/hallway/primary/firstdeck/starboard
	name = "\improper First Deck Starboard Hallway"
	icon_state = "hallS"

/area/hallway/primary/firstdeck/auxdockaft
	name = "\improper First Deck Aft Auxiliary Dock"
	icon_state = "docking_hallway"
	forbid_events = TRUE

/area/hallway/primary/firstdeck/auxdockfore
	name = "\improper First Deck Fore Auxiliary Dock"
	icon_state = "docking_hallway"

//CHOMPStation Edit. Two new areas for the vault.
/area/hallway/primary/firstdeck/vaultcheckpoint
    name = "\improper Vault Checkpoint"
    icon_state = "nuke_storage"

/area/hallway/primary/firstdeck/vaultlobby
    name = "\improper Vault Lobby"
    icon_state = "nuke_storage"

//CHOMPStation Edit Start TFF 4/5/20 - One of these ain't the same thing, bruh. Escape Pod 1, Escape Pod 2, Research Access Hallway.
/area/hallway/secondary/escape/firstdeck/ep_port
	name = "\improper Large Escape Pod 2 Port"
	icon_state = "escape_pod"

/area/hallway/secondary/escape/firstdeck/ep_starboard
	name = "\improper Large Escape Pod 2 Starboard"
	icon_state = "escape_pod"

/area/hallway/secondary/escape/firstdeck/ep_aftport
	name = "\improper Escape Pods Aft Port"
	icon_state = "escape_pod"

/area/hallway/secondary/escape/firstdeck/ep_aftstarboard
	name = "\improper Escape Pods Aft Starboard"
	icon_state = "escape_pod"

/area/hallway/secondary/firstdeck/research_access
	name = "\improper First Deck Research Access Hallway"
	icon_state = "hallS"
//CHOMPStation Edit End
/* Moving hangars to Space Station 13 areas.dm
/area/hangar
	name = "\improper First Deck Hangar"
	icon_state = "hangar"
	sound_env = LARGE_ENCLOSED

/area/hangar/one
	name = "\improper Hangar One"

/area/hangar/lockerroomone
	name = "\improper Exploration Locker Room One"
	icon_state = "hangarcontrol"

/area/hangar/two
	name = "\improper Hangar Two"

/area/hangar/lockerroomtwo
	name = "\improper Exploration Locker Room Two"
	icon_state = "hangarcontrol"

/area/hangar/three
	name = "\improper Hangar Three"

/area/hangar/lockerroomthree
	name = "\improper Exploration Locker Room Three"
	icon_state = "hangarcontrol"
*/
/area/security/checkpoint3
	name = "\improper Security - Auxiliary Checkpoint"
	icon_state = "security"

/area/medical/first_aid_station
	name = "\improper First-Aid Station"
	icon_state = "medbay2"

//CHOMPedit begin 7/9/23, adds chem distillery
/area/medical/distillery
	name ="\improper Chemistry Distillery"
	icon_state = "chem"
//CHOMPedit end
/area/medical/first_aid_station/firstdeck/
	name = "\improper First Deck First-Aid Station"

/area/storage/emergency_storage/
	flags = RAD_SHIELDED
	name = "Emergency Storage"
	icon_state = "emergencystorage"

/area/storage/emergency_storage/firstdeck/aft_emergency
	name = "First Deck Aft Emergency Storage"

/area/storage/emergency_storage/firstdeck/ap_emergency
	name = "First Deck Aft Port Emergency Storage"

/area/storage/emergency_storage/firstdeck/as_emergency
	name = "First Deck Aft Starboard Emergency Storage"

/area/storage/emergency_storage/firstdeck/fore_emergency
	name = "First Deck Fore Emergency Storage"

/area/storage/emergency_storage/firstdeck/fp_emergency
	name = "First Deck Fore Port Emergency Storage"

/area/storage/emergency_storage/firstdeck/fs_emergency
	name = "First Deck Fore Starboard Emergency Storage"

//CHOMPStation Edit Start 10/5/20 TFF - Change Pilot EVA to Auxillary EVA
/area/ai_monitored/storage/eva/aux
	name = "Auxiliary EVA Storage"
	icon_state = "eva"
//Chompstation Edit End

/area/tcomm/
	icon_state = "tcomsatcham"
	holomap_color = HOLOMAP_AREACOLOR_COMMAND

/area/tcomm/entrance
	name = "\improper Telecomms Teleporter"
	icon_state = "tcomsatentrance"

/area/tcomm/tcomfoyer
	name = "\improper Telecomms Foyer"
	icon_state = "tcomsatfoyer"

/area/tcomm/chamber
	name = "\improper Telecomms Central Compartment"
	icon_state = "tcomsatcham"

/area/tcomm/tcomstorage
	name = "\improper Telecomms Storage"
	icon_state = "tcomsatstore"

/area/tcomm/computer
	name = "\improper Telecomms Control Room"
	icon_state = "tcomsatcomp"

/area/quartermaster/hallway
	name = "\improper Cargo Bay Hallway"
	icon_state = "quart"

/area/quartermaster/mininglockerroom
	name = "\improper Mining Locker Room"
	icon_state = "mining"

//ChompStation Edit Start - New Teleporter Bay for station to SIF travel

/area/teleporter/firstdeck
	icon_state = "red"
	name = "Teleporter Bay Core"

/area/teleporter/firstdeck/prep
	name = "Teleporter Bay Prep"


//Deck Two (Z-2)

/area/maintenance/substation/atmospherics
	name = "Atmospherics Substation"
	ambience = AMBIENCE_SUBSTATION //CHOMP Addition

/area/maintenance/substation/maintenance
	name = "Maintenance Substation"
	ambience = AMBIENCE_SUBSTATION

/area/maintenance/emergencyeva
	name = "\improper Emergency EVA Maintenance"
	icon_state = "maint_eva"

/area/maintenance/substation/central // n/a
	name = "Central Substation"
	ambience = AMBIENCE_SUBSTATION //CHOMP Addition

//CHOMPStation Edit Start TFF 6/2/20 - Added substation

/area/maintenance/substation/dorms
	name = "Substation"
	icon_state = "substation"
	sound_env = SMALL_ENCLOSED
	ambience = AMBIENCE_SUBSTATION //CHOMP Addition

//CHOMPStation Edit End

/area/maintenance/robotics
	name = "Robotics Maintenance"
	icon_state = "maint_research"

/area/maintenance/research_medical
	name = "Research Medical Maintenance"
	icon_state = "maint_research"

/area/construction/seconddeck/
	name = "\improper Second Deck Engineering Construction Area"
	icon_state = "construction"

/area/construction/seconddeck/construction1
	name = "\improper Second Deck Engineering Construction Area 1"

/area/crew_quarters/seconddeck/locker
	name = "\improper Locker Room"
	icon_state = "locker"

//CHOMPStation Edit Start KSC 1/19/21 - Added area for new GYM

/area/crew_quarters/seconddeck/gym
	name = "\improper Station Gym"
	icon_state = "fitness"

//CHOMPstation Edit 8/8/22 - Added a Art Gallery and some missing areas Kassc wanted me to add
/area/crew_quarters/seconddeck/artgallery
	name = "\improper Art Gallery"
	icon_state = "art"

/area/crew_quarters/seconddeck/artsupplies
	name = "\improper Art Supplies"
	icon_state = "artsupply"

/area/crew_quarters/seconddeck/gameroom
	name = "\improper Game Room"
	icon_state = "gaming"

//CHOMPstation Edit 8/27/22 - VR Room for station baby~
/area/crew_quarters/thirddeck/vrroom
	name = "\improper Virtual Reality Room"
	icon_state = "gaming"
	flags = RAD_SHIELDED //Depending on the video game, you might still get figuative cancer

//CHOMPStation Edit End

/area/crew_quarters/seconddeck/locker/locker_toilet
	name = "\improper Locker Toilets"
	icon_state = "toilet"
	sound_env = SMALL_ENCLOSED

/area/crew_quarters/seconddeck/barrestroom
	name = "\improper Bar Restroom"
	icon_state = "bar"

/area/crew_quarters/heads/sc/
	name = "\improper Command - Head Office"
	icon_state = "head_quarters"
	flags = RAD_SHIELDED
	sound_env = MEDIUM_SOFTFLOOR

/area/crew_quarters/heads/sc/hop
	name = "\improper Command - HoP's Office"
	icon_state = "head_quarters"
	holomap_color = HOLOMAP_AREACOLOR_COMMAND

/area/crew_quarters/heads/sc/hor
	name = "\improper Research - RD's Office"
	icon_state = "head_quarters"
	holomap_color = HOLOMAP_AREACOLOR_SCIENCE

/area/crew_quarters/heads/sc/chief
	name = "\improper Engineering - CE's Office"
	icon_state = "head_quarters"
	holomap_color = HOLOMAP_AREACOLOR_ENGINEERING

/area/crew_quarters/heads/sc/hos
	name = "\improper Security - HoS' Office"
	icon_state = "head_quarters"
	holomap_color = HOLOMAP_AREACOLOR_SECURITY

/area/crew_quarters/heads/sc/cmo
	name = "\improper Medbay - CMO's Office"
	icon_state = "head_quarters"
	holomap_color = HOLOMAP_AREACOLOR_MEDICAL

/area/engineering/engineer_eva
	name = "\improper Engineering EVA"
	icon_state = "engine_eva"

/area/engineering/engi_restroom
	name = "\improper Engineering Restroom"
	icon_state = "toilet"
	flags = RAD_SHIELDED
	sound_env = SMALL_ENCLOSED

/area/engineering/hallway/atmos_hallway
	name = "\improper Atmospherics Hallway"

/area/engineering/hallway/engineer_hallway
	name = "\improper Engineering Hallway"
	icon_state = "engineering_aft_hallway"

/area/hallway/primary/seconddeck/stairwell
	name = "\improper Second Deck Central Stairwell Access"
	icon_state = "hallC"

/area/hallway/primary/seconddeck/fore
	name = "\improper Second Deck Fore Hallway"
	icon_state = "hallF"

/area/hallway/primary/seconddeck/fpcenter
	name = "\improper Second Deck Fore Port Central Hallway"
	icon_state = "hallC1"

/area/hallway/primary/seconddeck/fscenter
	name = "\improper Second Deck Fore Starboard Central Hallway"
	icon_state = "hallC2"

/area/hallway/primary/seconddeck/apcenter
	name = "\improper Second Deck Aft Port Central Hallway"
	icon_state = "hallC3"

/area/hallway/primary/seconddeck/ascenter
	name = "\improper Second Deck Aft Starboard Central Hallway"
	icon_state = "hallC4"

/area/hallway/primary/seconddeck/aft
	name = "\improper Second Deck Aft Hallway"
	icon_state = "hallA"

/area/hallway/primary/seconddeck/port
	name = "\improper Second Deck Port Hallway"
	icon_state = "hallP"

/area/hallway/primary/seconddeck/starboard
	name = "\improper Second Deck Starboard Hallway"
	icon_state = "hallS"

/area/hallway/primary/seconddeck/dockhallway
	name = "\improper Shuttle Dock Hallway"
	icon_state = "docking_hallway"

/area/hallway/secondary/seconddeck/research_medical
	name = "Research Medical Hallway"
	icon_state = "hallS"

/area/medical/foyer
	name = "\improper Medbay Foyer"
	icon_state = "medbay2"
	music = 'sound/ambience/signal.ogg'

/area/medical/first_aid_station/seconddeck/
	name = "\improper First-Aid Station"

/area/medical/first_aid_station/seconddeck/port
	name = "\improper Port First-Aid Station"

/area/medical/first_aid_station/seconddeck/fore
	name = "\improper Fore First-Aid Station"

/area/medical/first_aid_station/seconddeck/aft
	name = "\improper Aft First-Aid Station"

/area/medical/medical_lockerroom
	name = "\improper Medbay Locker Room"
	icon_state = "locker"

/area/medical/medical_restroom
	name = "\improper Medbay Restroom"
	icon_state = "medbay_restroom"
	flags = RAD_SHIELDED
	sound_env = SMALL_ENCLOSED

/area/security/aid_station
	name = "\improper Security - Aid Station"
	icon_state = "security_aid_station"

/area/security/security_ses
	name = "\improper Security - Secondary Equipment Storage"
	icon_state = "security_equip_storage"

/area/security/security_restroom
	name = "\improper Security - Restroom"
	icon_state = "security_bathroom"
	flags = RAD_SHIELDED
	sound_env = SMALL_ENCLOSED

/area/storage/emergency_storage/seconddeck/ap_emergency
	name = "Second Deck Aft Port Emergency Storage"

/area/storage/emergency_storage/seconddeck/as_emergency
	name = "Second Deck Aft Starboard Emergency Storage"

/area/storage/emergency_storage/seconddeck/central_emergency
	name = "Second Deck Central Emergency Storage"

/area/storage/emergency_storage/seconddeck/fp_emergency
	name = "Second Deck Fore Port Emergency Storage"

/area/storage/emergency_storage/seconddeck/fs_emergency
	name = "Second Deck Fore Starboard Emergency Storage"

/area/storage/emergency_storage/seconddeck/port_emergency
	name = "Second Deck Port Emergency Storage"

/area/rnd/research_restroom_sc
	name = "\improper Research Restroom"
	icon_state = "research_restroom"
	flags = RAD_SHIELDED
	sound_env = SMALL_ENCLOSED

/area/rnd/research_lockerroom
	name = "\improper Research - Locker Room"
	icon_state = "toxlab"

/area/rnd/toxins_launch
	name = "\improper Research - Toxins Launch Room"
	icon_state = "toxtest"

/area/rnd/research/firstdeck/hallway
	name = "\improper Research - First Deck Hallway"
	icon_state = "research"

/area/rnd/xenobiology/xenoflora_isolation
	name = "\improper Xenoflora Isolation"
	icon_state = "xeno_f_store"

/area/quartermaster/lockerroom
	name = "\improper Cargo Locker Room"
	icon_state = "quart"

/area/security/security_hallway
	name = "\improper Security Hallway"
	icon_state = "security"

//Deck Three (Z-3)

/area/ai
	holomap_color = HOLOMAP_AREACOLOR_COMMAND
	ambience = AMBIENCE_AI

/area/ai/ai_cyborg_station
	name = "\improper Cyborg Station"
	icon_state = "ai_cyborg"
	sound_env = SMALL_ENCLOSED

/area/ai/ai_upload
	name = "\improper AI Upload Chamber"
	icon_state = "ai_upload"

/area/ai/ai_upload_foyer
	name = "AI Upload Access"
	icon_state = "ai_foyer"
	sound_env = SMALL_ENCLOSED

/area/ai/ai_server_room
	name = "Messaging Server Room"
	icon_state = "ai_server"
	sound_env = SMALL_ENCLOSED

/area/crew_quarters/heads/sc/sd
	name = "\improper Command - Station Director's Office"
	icon_state = "captain"
	sound_env = MEDIUM_SOFTFLOOR
	holomap_color = HOLOMAP_AREACOLOR_COMMAND

/area/crew_quarters/heads/sc/hop/quarters
	name = "\improper Command - HoP's Quarters"
	icon_state = "head_quarters"

/area/crew_quarters/heads/sc/hor/quarters
	name = "\improper Research - RD's Quarters"
	icon_state = "research"

/area/crew_quarters/heads/sc/chief/quarters
	name = "\improper Engineering - CE's Quarters"
	icon_state = "engine"

/area/crew_quarters/heads/sc/hos/quarters
	name = "\improper Security - HoS' Quarters"
	icon_state = "security"

/area/crew_quarters/heads/sc/cmo/quarters
	name = "\improper Medbay - CMO's Quarters"
	icon_state = "medbay"

/area/crew_quarters/heads/sc/restroom
	name = "\improper Command - Restroom"
	icon_state = "toilet"

/area/crew_quarters/heads/sc/bs
	name = "\improper Command - Secretary Quarters"

/area/hallway/primary/thirddeck/central
	name = "\improper Third Deck Port Hallway"
	icon_state = "hallC"

/area/hallway/primary/thirddeck/port
	name = "\improper Third Deck Port Hallway"
	icon_state = "hallP"

/area/hallway/primary/thirddeck/starboard
	name = "\improper Third Deck Starboard Hallway"
	icon_state = "hallS"

//CHOMPStation Edit Start TFF 6/2/20 KC - Added new hallway for dorms. 11/20/20 KC - Added more areas for gateway and halls.

/area/hallway/primary/thirddeck/aftportcentral
	name = "\improper Third Deck Central Aft Port Hallway"
	icon_state = "hallC"

/area/hallway/primary/thirddeck/aftstarboardcentral
	name = "\improper Third Deck Central Aft Starboard Hallway"
	icon_state = "hallC"

/area/hallway/primary/thirddeck/stationgateway
	name = "\improper Third Deck Central Gateway"
	icon_state = "teleporter"

/area/hallway/primary/thirddeck/aft
	name = "\improper Third Deck Aft Hallway"
	icon_state = "hallA"

/area/hallway/primary/thirddeck/aftdoorm
	name = "\improper Third Deck Aft Doorm Hallway"
	icon_state = "docking_hallway"

/area/maintenance/thirddeck/dormsport
	name = "Third Deck Aft Starboard Maintenance"
	icon_state = "asmaint"

/area/maintenance/thirddeck/dormsstarboard
	name = "Third Deck Aft Starboard Maintenance"
	icon_state = "asmaint"

//CHOMPedit Giving a maint bar its own APC
/area/maintenance/thirddeck/dormsstarboard/maintbar
	name = "Third Deck Aft Starboard Speakeasy"
	icon_state = "asmaint"
//CHOMPedit end
/area/maintenance/thirddeck/dormsaft
	name = "Third Deck Aft Starboard Maintenance"
	icon_state = "asmaint"

/area/maintenance/thirddeck/hiddenkitchen
	name = "Third Deck Hidden Kitchen"
	icon_state = "asmaint"

/area/maintenance/thirddeck/dormsatmos
	name = "Third Deck Dorm's Atmospherics"
	icon_state = "asmaint"

//CHOMPStation Edit Start TFF 6/2/20 KC - Added new First Aid station.

/area/medical/first_aid_station/thirddeck
	name = "\improper Center Thirddeck First-Aid Station"
	icon_state = "medbay2"

//CHOMPStation Edit End

/area/maintenance/thirddeck/aftstarboard
	name = "Third Deck Aft Starboard Maintenance"
	icon_state = "asmaint"

/area/maintenance/thirddeck/aftport
	name = "Third Deck Aft Port Maintenance"
	icon_state = "apmaint"

/area/maintenance/thirddeck/forestarboard
	name = "Third  Deck Fore Starboard Maintenance"
	icon_state = "fsmaint"

/area/maintenance/thirddeck/foreport
	name = "Third  Deck Fore Port Maintenance"
	icon_state = "fpmaint"

/area/maintenance/solars
	icon_state = "SolarcontrolA"
	sound_env = SMALL_ENCLOSED
	holomap_color = HOLOMAP_AREACOLOR_ENGINEERING

/area/maintenance/solars/aftportsolar
	name = "Solar Maintenance - Aft Port"
	icon_state = "SolarcontrolP"

/area/maintenance/solars/aftstarboardsolar
	name = "Solar Maintenance - Aft Starboard"
	icon_state = "SolarcontrolS"

/area/maintenance/solars/foreportsolar
	name = "Solar Maintenance - Fore Port"
	icon_state = "SolarcontrolP"

/area/maintenance/solars/forestarboardsolar
	name = "Solar Maintenance - Fore Starboard"
	icon_state = "SolarcontrolS"

/area/solar
	requires_power = 1
	always_unpowered = 1
	ambience = AMBIENCE_SPACE

/area/solar/aftportsolar
	name = "\improper Aft Port Solar Array"
	icon_state = "panelsP"

/area/solar/foreportsolar
	name = "\improper Fore Port Solar Array"
	icon_state = "panelsP"

/area/solar/aftstarboardsolar
	name = "\improper Aft Starboard Solar Array"
	icon_state = "panelsS"

/area/solar/forestarboardsolar
	name = "\improper Fore Starboard Solar Array"
	icon_state = "panelsS"

/area/thirddeck/roof
	name = "\improper Third Deck Plating"
	dynamic_lighting = 0
	ambience = AMBIENCE_SPACE

// Shuttles

//NT response shuttle

/area/shuttle/response_ship
	name = "\improper Response Team Ship"
	icon_state = "shuttlered"
	requires_power = 0
	flags = RAD_SHIELDED
	ambience = AMBIENCE_HIGHSEC

/* Chompstation Edit - Removing Shuttle 1 & 2
//Shuttle One

/area/shuttle/shuttle1
	name = "\improper Hangar Deck"
	icon_state = "yellow"
	requires_power = 0
	dynamic_lighting = 1
	flags = RAD_SHIELDED

/area/shuttle/shuttle1/start
	name = "\improper Hangar One"
	icon_state = "shuttlered"
	base_turf = /turf/simulated/floor/reinforced

/area/shuttle/shuttle1/arrivals_dock
	name = "\improper docked with Southern Cross"
	icon_state = "shuttle"

/area/shuttle/shuttle1/seconddeck
	name = "south of second deck"
	icon_state = "south"

/area/shuttle/shuttle1/mining
	name = "wilderness site"
	icon_state = "shuttlered"

/area/shuttle/shuttle1/planet
	name = "planetside outpost"
	icon_state = "shuttlered"
	base_turf = /turf/simulated/floor/plating/sif/planetuse

/area/shuttle/shuttle1/transit
	name = "transit"
	icon_state = "shuttlered"
	base_turf = /turf/space/transit/north

/area/shuttle/shuttle1/orbit
	name = "in orbit of Sif"
	icon_state = "shuttlegrn"
	base_turf = /turf/space

/area/shuttle/shuttle1/sky
	name = "hovering over skies of sif"
	icon_state = "shuttlegrn"
	base_turf = /turf/simulated/sky

/area/shuttle/shuttle1/sky_transit
	name = "in flight over sif"
	icon_state = "shuttlered"
	base_turf = /turf/simulated/sky/moving

//Shuttle Two

/area/shuttle/shuttle2
	name = "\improper Hangar Deck"
	icon_state = "yellow"
	requires_power = 0
	dynamic_lighting = 1
	flags = RAD_SHIELDED

/area/shuttle/shuttle2/start
	name = "\improper Hangar Two"
	icon_state = "shuttlered"
	base_turf = /turf/simulated/floor/reinforced

/area/shuttle/shuttle2/arrivals_dock
	name = "\improper docked with Southern Cross"
	icon_state = "shuttle"

/area/shuttle/shuttle2/seconddeck
	name = "south of second deck"
	icon_state = "south"

/area/shuttle/shuttle2/mining
	name = "wilderness site"
	icon_state = "shuttlered"

/area/shuttle/shuttle2/planet
	name = "planetside outpost"
	icon_state = "shuttlered"
	base_turf = /turf/simulated/floor/plating/sif/planetuse

/area/shuttle/shuttle2/transit
	name = "transit"
	icon_state = "shuttlered"
	base_turf = /turf/space/transit/north

/area/shuttle/shuttle2/orbit
	name = "in orbit of Sif"
	icon_state = "shuttlegrn"
	base_turf = /turf/space

/area/shuttle/shuttle2/sky
	name = "hovering over skies of sif"
	icon_state = "shuttlegrn"
	base_turf = /turf/simulated/sky

/area/shuttle/shuttle2/sky_transit
	name = "in flight over sif"
	icon_state = "shuttlered"
	base_turf = /turf/simulated/sky/moving

End Chompstation Edit*/

// Centcom Transport Shuttle
/area/shuttle/transport1
	icon_state = "shuttle"
	name = "\improper Transport Shuttle"

// Centcom Admin Shuttle

/area/shuttle/administration
	name = "\improper Administration Shuttle"
	icon_state = "shuttlered"

//Merc

/area/syndicate_mothership
	name = "\improper Mercenary Base"
	icon_state = "syndie-ship"
	requires_power = 0
	dynamic_lighting = 0
	flags = RAD_SHIELDED
	ambience = AMBIENCE_HIGHSEC

/area/syndicate_station
	name = "\improper Mercenary Base"
	icon_state = "syndie-ship"
	requires_power = 0
	dynamic_lighting = 0
	flags = RAD_SHIELDED
	ambience = AMBIENCE_HIGHSEC

/area/syndicate_station/start
	name = "\improper Mercenary Ship"
	icon_state = "shuttlered"

/area/syndicate_station/firstdeck
	name = "north-west of first deck"
	icon_state = "northwest"

/area/syndicate_station/seconddeck
	name = "north-east of second deck"
	icon_state = "northeast"

/area/syndicate_station/thirddeck
	name = "south-east of third deck"
	icon_state = "southeast"

/area/syndicate_station/mining
	name = "mining site"
	icon_state = "shuttlered"

/area/syndicate_station/planet
	name = "planetside"
	dynamic_lighting = 1
	icon_state = "shuttlered"
	base_turf = /turf/simulated/floor/outdoors/grass/sif/planetuse

/area/syndicate_station/transit
	name = " transit"
	icon_state = "shuttlered"
	base_turf = /turf/space/transit/east

/area/syndicate_station/orbit
	name = "in orbit of Sif"
	icon_state = "shuttlegrn"
	base_turf = /turf/space

/area/syndicate_station/sky
	name = "hovering over skies of sif"
	icon_state = "shuttlegrn"
	base_turf = /turf/simulated/sky/west

/area/syndicate_station/sky_transit
	name = "in flight over sif"
	icon_state = "shuttlered"
	base_turf = /turf/simulated/sky/moving/west

/area/syndicate_station/arrivals_dock
	name = "\improper docked with Southern Cross"
	dynamic_lighting = 0
	icon_state = "shuttle"

//Skipjack

/area/skipjack_station
	name = "Raider Outpost"
	icon_state = "yellow"
	requires_power = 0
	dynamic_lighting = 0
	flags = RAD_SHIELDED
	ambience = AMBIENCE_HIGHSEC

/area/skipjack_station/transit
	name = "transit"
	icon_state = "shuttlered"
	base_turf = /turf/space/transit/north

/area/skipjack_station/firstdeck
	name = "north of first deck"
	icon_state = "northwest"

/area/skipjack_station/seconddeck
	name = "west of second deck"
	icon_state = "west"

/area/skipjack_station/thirddeck
	name = "east of third deck"
	icon_state = "east"

/area/skipjack_station/mining
	name = "mining site"
	icon_state = "shuttlered"

/area/skipjack_station/planet
	name = "planet"
	icon_state = "shuttlered"
	dynamic_lighting = 1
	base_turf = /turf/simulated/floor/outdoors/grass/sif/planetuse

/area/skipjack_station/orbit
	name = "in orbit of Sif"
	icon_state = "shuttlegrn"
	base_turf = /turf/space

/area/skipjack_station/sky
	name = "hovering over skies of sif"
	icon_state = "shuttlegrn"
	base_turf = /turf/simulated/sky/north

/area/skipjack_station/sky_transit
	name = "in flight over sif"
	icon_state = "shuttlered"
	base_turf = /turf/simulated/sky/moving/north

/area/skipjack_station/arrivals_dock
	name = "\improper docked with Southern Cross"
	icon_state = "shuttle"

// Ninja areas
/area/ninja_dojo
	name = "\improper Ninja Base"
	icon_state = "green"
	requires_power = 0
	flags = RAD_SHIELDED
	ambience = AMBIENCE_HIGHSEC

/area/ninja_dojo/dojo
	name = "\improper Clan Dojo"
	dynamic_lighting = 0

/area/shuttle/ninja
	name = "\improper Ninja Shuttle"
	icon_state = "shuttlered"

//Trade Ship

/area/shuttle/merchant
	icon_state = "shuttle"

/area/shuttle/merchant/home
	name = "\improper Merchant Vessel - Home"

/area/shuttle/merchant/away
	name = "\improper Merchant Vessel - Away"

//Small Escape Pods

/area/shuttle/escape_pod1
	name = "\improper Escape Pod One"
	music = "music/escape.ogg"

/area/shuttle/escape_pod1/station
	icon_state = "shuttle2"
	base_turf = /turf/simulated/floor/airless

/area/shuttle/escape_pod1/centcom
	icon_state = "shuttle"

/area/shuttle/escape_pod1/transit
	icon_state = "shuttle"

/area/shuttle/escape_pod2
	name = "\improper Escape Pod Two"
	music = "music/escape.ogg"

/area/shuttle/escape_pod2/station
	icon_state = "shuttle2"
	base_turf = /turf/simulated/floor/airless

/area/shuttle/escape_pod2/centcom
	icon_state = "shuttle"

/area/shuttle/escape_pod2/transit
	icon_state = "shuttle"

/area/shuttle/escape_pod3
	name = "\improper Escape Pod Three"
	music = "music/escape.ogg"

/area/shuttle/escape_pod3/station
	icon_state = "shuttle2"
	base_turf = /turf/simulated/floor/airless

/area/shuttle/escape_pod3/centcom
	icon_state = "shuttle"

/area/shuttle/escape_pod3/transit
	icon_state = "shuttle"

/area/shuttle/escape_pod4
	name = "\improper Escape Pod Four"
	music = "music/escape.ogg"

/area/shuttle/escape_pod4/station
	icon_state = "shuttle2"
	base_turf = /turf/simulated/floor/airless

/area/shuttle/escape_pod4/centcom
	icon_state = "shuttle"

/area/shuttle/escape_pod4/transit
	icon_state = "shuttle"

/area/shuttle/escape_pod5
	name = "\improper Escape Pod Five"
	music = "music/escape.ogg"

/area/shuttle/escape_pod5/station
	icon_state = "shuttle2"
	base_turf = /turf/simulated/floor/airless

/area/shuttle/escape_pod5/centcom
	icon_state = "shuttle"

/area/shuttle/escape_pod5/transit
	icon_state = "shuttle"

/area/shuttle/escape_pod6
	name = "\improper Escape Pod Six"
	music = "music/escape.ogg"

/area/shuttle/escape_pod6/station
	icon_state = "shuttle2"
	base_turf = /turf/simulated/floor/airless

/area/shuttle/escape_pod6/centcom
	icon_state = "shuttle"

/area/shuttle/escape_pod6/transit
	icon_state = "shuttle"

/area/shuttle/escape_pod7
	name = "\improper Escape Pod Seven"
	music = "music/escape.ogg"

/area/shuttle/escape_pod7/station
	icon_state = "shuttle2"
	base_turf = /turf/simulated/floor/reinforced/airless

/area/shuttle/escape_pod7/centcom
	icon_state = "shuttle"

/area/shuttle/escape_pod7/transit
	icon_state = "shuttle"

/area/shuttle/escape_pod8
	name = "\improper Escape Pod Eight"
	music = "music/escape.ogg"

/area/shuttle/escape_pod8/station
	icon_state = "shuttle2"
	base_turf = /turf/simulated/floor/reinforced/airless

/area/shuttle/escape_pod8/centcom
	icon_state = "shuttle"

/area/shuttle/escape_pod8/transit
	icon_state = "shuttle"

//Large Escape Pods

/area/shuttle/large_escape_pod1
	name = "\improper Large Escape Pod One"
	music = "music/escape.ogg"

/area/shuttle/large_escape_pod1/station
	icon_state = "shuttle2"
	base_turf = /turf/simulated/floor/airless

/area/shuttle/large_escape_pod1/centcom
	icon_state = "shuttle"

/area/shuttle/large_escape_pod1/transit
	icon_state = "shuttle"

/area/shuttle/large_escape_pod2
	name = "\improper Large Escape Pod Two"
	music = "music/escape.ogg"

/area/shuttle/large_escape_pod2/station
	icon_state = "shuttle2"
	base_turf = /turf/simulated/floor/airless

/area/shuttle/large_escape_pod2/centcom
	icon_state = "shuttle"

/area/shuttle/large_escape_pod2/transit
	icon_state = "shuttle"

/area/shuttle/cryo
	name = "\improper Cryogenic Storage"

/area/shuttle/cryo/station
	icon_state = "shuttle2"
	base_turf = /turf/simulated/floor/airless

/area/shuttle/cryo/centcom
	icon_state = "shuttle"

/area/shuttle/cryo/transit
	icon_state = "shuttle"

// Fishing CHOMPstation edit

/area/surface/outpost/fishing
	name = "\improper Fishing Outpost"
	icon_state = "recreation_area"

/area/surface/outpost/fishing/smes
	name = "\improper Fishing SMES Maintenance"
	icon_state = "substation"
	ambience = AMBIENCE_SUBSTATION //CHOMP Addition

//Shuttle 3 CHOMPedit

/area/shuttle/shuttle3
	name = "\improper Hangar Deck"
	icon_state = "yellow"
	requires_power = 0
	dynamic_lighting = 1
	flags = RAD_SHIELDED

/area/shuttle/shuttle3/start
	name = "\improper Expedition Hangar One"
	icon_state = "shuttlered"
	base_turf = /turf/simulated/floor/reinforced

/area/shuttle/shuttle3/seconddeck
	name = "south of second deck"
	icon_state = "south"

/area/shuttle/shuttle3/stationhangar3
	name = "\improper Hangar Three"
	icon_state = "shuttlered"
	base_turf = /turf/simulated/floor/reinforced

/area/shuttle/shuttle3/mining
	name = "wilderness site"
	icon_state = "shuttlered"

/area/shuttle/shuttle3/transit
	name = "transit"
	icon_state = "shuttlered"
	base_turf = /turf/space/transit/north

/area/shuttle/shuttle3/orbit
	name = "in orbit of Sif"
	icon_state = "shuttlegrn"
	base_turf = /turf/space

/area/shuttle/shuttle3/sky
	name = "hovering over skies of sif"
	icon_state = "shuttlegrn"
	base_turf = /turf/simulated/sky

/area/shuttle/shuttle3/sky_transit
	name = "in flight over sif"
	icon_state = "shuttlered"
	base_turf = /turf/simulated/sky/moving

//CHOMPedit: Exploration outpost ferry shuttle

/area/shuttle/expoutpost/site
	name = "\improper Exploration Sling"
	icon_state = "shuttle2"

/area/shuttle/expoutpost/station
	name = "\improper Exploration Sling"
	icon_state = "shuttle2"
	base_turf = /turf/simulated/floor/reinforced/airless

//CHOMPedit: New Explo Carrier Areas.

/area/expoutpost/stationshuttle
	name = "\improper Station Shuttle to Exploration Carrier"

// Bow

/area/expoutpost/portbowairlock
	name = "\improper Port Bow Airlock"

/area/expoutpost/starboardbowairlock
	name = "\improper Starboard Bow Airlock"

/area/expoutpost/eva
	name = "\improper EVA"

/area/expoutpost/botany
	name = "\improper Botany Lab"

/area/expoutpost/washroom
	name = "\improper Washroom"

/area/expoutpost/civaccesshallway
	name = "\improper Civilian Access Hallway"

/area/expoutpost/janitorial
	name = "\improper Janitorial Closet"

/area/expoutpost/kitchen
	name = "\improper Kitchen"

/area/expoutpost/restrooms
	name = "\improper Restrooms"

/area/expoutpost/portbowhallway
	name = "\improper Port Bow Hallway"

/area/expoutpost/bar
	name = "\improper Bar"
	flags = RAD_SHIELDED

/area/expoutpost/starbowhallway
	name = "\improper Starboard Bow Hallway"

/area/expoutpost/suite1
	name = "\improper Suite One"
	flags = RAD_SHIELDED

/area/expoutpost/suite2
	name = "\improper Suite Two"
	flags = RAD_SHIELDED

/area/expoutpost/pathfinderroom
	name = "\improper Pathfinder's Ready-Room"
	flags = RAD_SHIELDED

/area/expoutpost/commanderroom
	name = "\improper Security Commander's Ready-Room"
	flags = RAD_SHIELDED

/area/expoutpost/portqpadjunction
	name = "\improper Port Q-Pad Junction"

/area/expoutpost/starqpadjunction
	name = "\improper Starboard Q-Pad Junction"

/area/expoutpost/slingcarrierdock
	name = "\improper Sling Carrier Dock"

/area/expoutpost/stationqpad
	name ="\improper Station Q-Pad Junction"

/area/expoutpost/secbowcheckpoint
	name = "\improper Security Bow Checkpoint"

// Midship

/area/expoutpost/staginghangar
	name = "\improper Staging Hangar"

// Stern

/area/expoutpost/uppersternhallway
	name = "\improper Upper Stern Hallway"

/area/expoutpost/medbaylobby
	name = "\improper Medbay Lobby"

/area/expoutpost/medicalbay
	name = "\improper Medical Bay"

/area/expoutpost/surgical1
	name = "\improper Surgical Theatre One"

/area/expoutpost/midsternhallway
	name = "\improper Middle Stern Hallway"

/area/expoutpost/exploarmory
	name = "\improper Exploration Armory"

/area/expoutpost/explobriefroom
	name = "\improper Exploration Briefing Room"

/area/expoutpost/explodorm1
	name = "\improper Exploration Dorm One"
	flags = RAD_SHIELDED

/area/expoutpost/explodorm2
	name = "\improper Exploration Dorm Two"
	flags = RAD_SHIELDED

/area/expoutpost/breakroom
	name = "\improper Public Breakroom"

/area/expoutpost/cic
	name = "\improper Combat Information Center"

/area/expoutpost/secoffice
	name = "\improper Security Office"

/area/expoutpost/gatewayeva
	name = "\improper Gateway EVA"

/area/expoutpost/gateway
	name = "\improper Gateway"

/area/expoutpost/secarmory
	name = "\improper Security Armory"

/area/expoutpost/miningfoyer
	name = "\improper Mining Foyer"

/area/expoutpost/reactoraccess
	name = "\improper Reactor Access"

/area/expoutpost/reactorcr
	name = "\improper Reactor Control Room"

/area/expoutpost/reactorroom
	name = "\improper Fusion Reactor"

/area/expoutpost/rndlobby
	name = "\improper R&D Lobby"

/area/expoutpost/rnd
	name = "\improper Research and Development"

/area/expoutpost/engoffice
	name = "\improper Engineering Office"

/area/expoutpost/engstorage
	name = "\improper Engineering Equipment Room"

/area/expoutpost/atmospherics
	name = "\improper Atmospherics"

/area/expoutpost/secureaccess
	name = "\improper Secure Access Corridor"

/area/expoutpost/techstorage
	name = "\improper Technical Storage"

/area/expoutpost/aicore
	name = "\improper Auxiliary AI Core"

/area/expoutpost/telecomms
	name = "\improper Ship Telecomms"

/area/expoutpost/disposals
	name = "\improper Disposals Sorting"

/area/expoutpost/lowersternhallway
	name = "\improper Lower Stern Hallway"

/area/expoutpost/portfuelstorage
	name = "\improper Port Fuel Storage"

/area/expoutpost/starfuelstorage
	name = "\improper Starboard Fuel Storage"

// Maints

/area/expoutpost/portuppermaint
	name = "\improper Port Upper Maintenance"

/area/expoutpost/staruppermaint
	name = "\improper Starboard Upper Maintenance"

/area/expoutpost/portexplomaint
	name = "\improper Port Exploration Maintenance"

/area/expoutpost/starsciencemaint
	name = "\improper Starboard Science Maintenance"

/area/expoutpost/portlowermaint
	name = "\improper Port Lower Maintenance"

/area/expoutpost/starlowermaint
	name = "\improper Starboard Lower Maintenance"

/area/expoutpost/portsternairlock
	name = "\improper Port Stern Airlock"

/area/expoutpost/starsternairlock
	name = "\improper Starboard Stern Airlock"

// Hangars

/area/expoutpost/hangarone
	name = "\improper Exploration Carrier Hangar One"
	icon_state = "hangar"

/area/expoutpost/hangartwo
	name = "\improper Exploration Carrier Hangar Two"
	icon_state = "hangar"

/area/expoutpost/hangarthree
	name = "\improper Exploration Carrier Hangar Three"
	icon_state = "hangar"

/area/expoutpost/hangarfour
	name = "\improper Exploration Carrier Hangar Four"
	icon_state = "hangar"

/area/expoutpost/hangarfive
	name = "\improper Exploration Carrier Hangar Five"
	icon_state = "hangar"

/area/expoutpost/hangarsix
	name = "\improper Exploration Carrier Hangar Six"
	icon_state = "hangar"

//CHOMPedit: Exploration backup shuttle. For now this is a placeholder for future expedition content.

/area/shuttle/shuttlebackup
	name = "\improper Hangar Deck"
	icon_state = "yellow"
	requires_power = 0
	dynamic_lighting = 1
	flags = RAD_SHIELDED

/area/shuttle/shuttlebackup/start
	name = "\improper Expedition Backup Shuttle Docks"
	icon_state = "shuttlered"

// Misc

/area/wreck/ufoship
	name = "\improper Wreck"
	icon_state = "storage"
	ambience = AMBIENCE_OTHERWORLDLY

/area/wreck/supplyshuttle
	name = "\improper Wreck"
	icon_state = "storage"
	ambience = AMBIENCE_RUINS

/area/shuttle/overmap/sif
	name = "wilderness site"
	icon_state = "shuttlered"

//Temp Removal TFF 15/2/20
/*
// CHOMP-Edit: This is the Belt Mining addition
// Belt Mining Areas
/area/mine/unexplored/belt_miner
	name = "\improper Belt Mining"
	base_turf = /turf/space
/area/mine/explored/belt_miner
	name = "\improper Belt Mining"
	base_turf = /turf/space

// Belt Mining outpost areas
/area/outpost/mining_main/passage
	name = "\improper Mining Outpost Passage"
/area/outpost/mining_main/hangar
	name = "\improper Mining Outpost Belt Miner Hangar"
/area/outpost/mining_main/belt_outpost // Master area for "Belt Outpost", all sub-areas follow this one's preset
	name = "\improper Belt Mining Outpost"
	sound_env = ASTEROID
	forced_ambience = list('sound/ambience/ruins/ruins1.ogg')
	lightswitch = 0
/area/outpost/mining_main/belt_outpost/airlock
	name = "\improper Belt Mining Airlock"
/area/outpost/mining_main/belt_outpost/dorms
	name = "\improper Belt Mining Dorms"
	forced_ambience = list('sound/ambience/generic/generic1.ogg')
/area/outpost/mining_main/belt_outpost/substation
	name = "\improper Belt Mining Substation"
	ambience = list('sound/ambience/engineering/engineering1.ogg')
/area/outpost/mining_main/belt_outpost/atmos
	name = "\improper Belt Mining Atmos"
	ambience = list('sound/ambience/ambiatm1.ogg')
/area/outpost/mining_main/belt_outpost/solars
	name = "\improper Belt Mining Solars"
/area/outpost/mining_main/belt_outpost/tank_storage
	name = "\improper Belt Mining Tank Holding and Console Access"

// Belter 2.0 Areas!
/area/shuttle/beltferry/station
	name = "Belter M2.0 Landed"
	icon_state = "shuttle2"
	base_turf = /turf/simulated/floor/reinforced

/area/shuttle/beltferry/belt // This is our "dock" area for the Belter M2.0
	name = "Belter M2.0 Holding Position"
	icon_state = "shuttle2"
	base_turf = /turf/space

/area/shuttle/beltferry/transit // Transit Area - the in-between.
	name = "Belter M2.0 Transit"
	icon_state = "shuttle2"
*/
// CHOMPAdd Start - Maintenance Deck Areas
/area/maintenance/abcargo
	name = "Abandoned Cargo"
	icon_state = "maint_cargo"

/area/maintenance/abmedical
	name = "Abandoned Medical"
	icon_state = "maint_medbay"

/area/maintenance/abfirstaid
	name = "Abandoned First Aid Station"
	icon_state = "maint_medbay"

/area/maintenance/abchemistry
	name = "Abandoned Chemistry"
	icon_state = "maint_medbay"

/area/maintenance/abscience
	name = "Abandoned Science"
	icon_state = "asmaint"

/area/maintenance/absgenetics
	name = "Abandoned Genetics"
	icon_state = "asmaint"

/area/maintenance/thrift
	name = "Abandoned Thrift Store"
	icon_state = "mid_civilian_hallway"

/area/maintenance/abtheatre
	name = "Abandoned Theatre"
	icon_state = "Theatre"
	sound_env = LARGE_SOFTFLOOR

/area/maintenance/ragecage
	name = "Rage Cage"
	icon_state = "nuke_storage"

/area/engineering/lowlobby
	name = "Engineering Deck 0 Lobby"
	icon_state = "maint_pumpstation"

/area/engineering/backuppowerlobby
	name = "Engineering Backup Power Lobby"
	icon_state = "engineering"

/area/engineering/backuppower
	name = "Engineering Backup Power"
	icon_state = "engineering"

/area/maintenance/substation/gravgen
	name = "Gravity Generator Substation"
	icon_state = "engineering"

/area/maintenance/engineering/gravgen
	name = "Gravity Generator Maintenance"

/area/maintenance/fieldhallway
	name = "Maintenance Deck Field Hallway"
/area/maintenance/fieldthrift
	name = "Maintenance Deck Thrift Store Hallway"

/area/maintenance/abhydroponicssupp
	name = "Abandoned Botany Supplies"

/area/maintenance/abhydroponics
	name = "Abandoned Botany"

/area/maintenance/smoleroom
	name = "Smole Room"

/area/maintenance/janitoral
	name = "Maintenance Deck Janitoral"

/area/maintenance/lookout
	name = "Maintenance Deck Lookout"

/area/maintenance/bar/dorms
	name = "Maintenance Bar Dorms"
	icon_state = "Sleep"
	soundproofed = TRUE
	limit_mob_size = FALSE
	block_suit_sensors = TRUE
	flags = RAD_SHIELDED
	block_tracking = TRUE

/area/maintenance/bar/dorms/dorm_1
	name = "Maintenance Deck Bar Dorms 1"

/area/maintenance/bar/dorms/dorm_2
	name = "Maintenance Deck Bar Dorms 2"

/area/maintenance/zerocent
	name = "Maintenance Deck Central"
	icon_state = "maintcentral"

/area/maintenance/zeroport
	name = "Maintenance Deck Port"
	icon_state = "pmaint"

/area/maintenance/zeroaft
	name = "Maintenance Deck Aft"
	icon_state = "amaint"

/area/maintenance/zerostarboard
	name = "Maintenance Deck Starboard"
	icon_state = "smaint"

/area/maintenance/zerofore
	name = "Maintenance Deck Fore"
	icon_state = "fmaint"

/area/maintenance/gravlobby
	name = "Gravity Generator Lobby"
	icon_state = "engineering"

/area/maintenance/zerobar
	name = "Abandoned Bar"
	icon_state = "maint_bar"
