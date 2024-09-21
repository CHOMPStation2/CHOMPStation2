
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
/*
/area/turbolift/port_deck_maints
	name = "lift (maints deck)"
	lift_floor_label = "Deck 0"
	lift_floor_name = "Maintenance Deck"
	lift_announce_str = "Arriving at Maintenance Deck: Engineering. Power Back Up. Gravity Generator."
	base_turf = /turf/simulated/floor
*/
/area/turbolift/port_deck_one
	name = "lift (first deck)"
	lift_floor_label = "Deck 1"
	lift_floor_name = "Hangar Deck"
	lift_announce_str = "Arriving at Hangar Deck: Main Hangars.Cargo Delivery. Telecommunications. Auxiliary Shuttle Docks. Escape Pods."
	base_turf = /turf/simulated/floor

/area/turbolift/port_deck_two
	name = "lift (second deck)"
	lift_floor_label = "Deck 2"
	lift_floor_name = "Operations Deck"
	lift_announce_str = "Arriving at Operations Deck: Engineering. Cargo. Medbay. Research. Security. Crew Facilities Shuttle Docks. Cryogenic Storage."

/area/turbolift/port_deck_three
	name = "lift (third deck)"
	lift_floor_label = "Deck 3"
	lift_floor_name = "Command Deck"
	lift_announce_str = "Arriving at Command Deck: Bridge. Meeting Room. Command Quarters. AI Core. Solars."

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

/area/turbolift/starboard_deck_three
	name = "lift (third deck)"
	lift_floor_label = "Deck 3"
	lift_floor_name = "Command Deck"
	lift_announce_str = "Arriving at Command Deck: Bridge. Meeting Room. Command Quarters. AI Core. Solars."

/area/turbolift/center_deck_one
	name = "lift (first deck)"
	lift_floor_label = "Deck 1"
	lift_floor_name = "Hangar Deck"
	lift_announce_str = "Arriving at Hangar Deck: Main Hangars. Cargo Delivery. Telecommunications. Auxiliary Shuttle Docks. Escape Pods."
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

/area/turbolift/aft_deck_one
	name = "lift (first deck)"
	lift_floor_label = "Deck 1"
	lift_floor_name = "Hangar Deck"
	lift_announce_str = "Arriving at Hangar Deck: Main Hangars. Cargo Delivery. Telecommunications. Auxiliary Shuttle Docks. Escape Pods."
	base_turf = /turf/simulated/floor

/area/turbolift/aft_deck_two
	name = "lift (second deck)"
	lift_floor_label = "Deck 2"
	lift_floor_name = "Operations Deck"
	lift_announce_str = "Arriving at Operations Deck: Engineering. Cargo. Medbay. Research. Security. Crew Facilities Shuttle Docks. Cryogenic Storage."

/area/turbolift/aft_deck_three
	name = "lift (third deck)"
	lift_floor_label = "Deck 3"
	lift_floor_name = "Command Deck"
	lift_announce_str = "Arriving at Command Deck: Bridge. Meeting Room. Command Quarters. AI Core. Solars."

/area/turbolift/forward_deck_one
	name = "lift (first deck)"
	lift_floor_label = "Deck 1"
	lift_floor_name = "Hangar Deck"
	lift_announce_str = "Arriving at Hangar Deck: Main Hangars. Cargo Delivery. Telecommunications. Auxiliary Shuttle Docks. Escape Pods."
	base_turf = /turf/simulated/floor

/area/turbolift/forward_deck_two
	name = "lift (second deck)"
	lift_floor_label = "Deck 2"
	lift_floor_name = "Operations Deck"
	lift_announce_str = "Arriving at Operations Deck: Engineering. Cargo. Medbay. Research. Security. Crew Facilities Shuttle Docks. Cryogenic Storage."

/area/turbolift/forward_deck_three
	name = "lift (third deck)"
	lift_floor_label = "Deck 3"
	lift_floor_name = "Command Deck"
	lift_announce_str = "Arriving at Command Deck: Bridge. Meeting Room. Command Quarters. AI Core. Solars."


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

/area/shuttle/escape_pod9
	name = "\improper Escape Pod Nine"
	music = "music/escape.ogg"

/area/shuttle/escape_pod9/station
	icon_state = "shuttle2"
	base_turf = /turf/simulated/floor/reinforced/airless

/area/shuttle/escape_pod9/centcom
	icon_state = "shuttle"

/area/shuttle/escape_pod9/transit
	icon_state = "shuttle"

/area/shuttle/escape_pod10
	name = "\improper Escape Pod Ten"
	music = "music/escape.ogg"

/area/shuttle/escape_pod10/station
	icon_state = "shuttle2"
	base_turf = /turf/simulated/floor/reinforced/airless

/area/shuttle/escape_pod10/centcom
	icon_state = "shuttle"

/area/shuttle/escape_pod10/transit
	icon_state = "shuttle"

/area/shuttle/escape_pod11
	name = "\improper Escape Pod Eleven"
	music = "music/escape.ogg"

/area/shuttle/escape_pod11/station
	icon_state = "shuttle2"
	base_turf = /turf/simulated/floor/reinforced/airless

/area/shuttle/escape_pod11/centcom
	icon_state = "shuttle"

/area/shuttle/escape_pod11/transit
	icon_state = "shuttle"

/area/shuttle/escape_pod12
	name = "\improper Escape Pod Twelve"
	music = "music/escape.ogg"

/area/shuttle/escape_pod12/station
	icon_state = "shuttle2"
	base_turf = /turf/simulated/floor/reinforced/airless

/area/shuttle/escape_pod12/centcom
	icon_state = "shuttle"

/area/shuttle/escape_pod12/transit
	icon_state = "shuttle"

/area/shuttle/escape_pod13
	name = "\improper Escape Pod Thirteen"
	music = "music/escape.ogg"

/area/shuttle/escape_pod13/station
	icon_state = "shuttle2"
	base_turf = /turf/simulated/floor/reinforced/airless

/area/shuttle/escape_pod13/centcom
	icon_state = "shuttle"

/area/shuttle/escape_pod13/transit
	icon_state = "shuttle"

/area/shuttle/escape_pod14
	name = "\improper Escape Pod Fourteen"
	music = "music/escape.ogg"

/area/shuttle/escape_pod14/station
	icon_state = "shuttle2"
	base_turf = /turf/simulated/floor/reinforced/airless

/area/shuttle/escape_pod14/centcom
	icon_state = "shuttle"

/area/shuttle/escape_pod14/transit
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

/area/shuttle/large_escape_pod3
	name = "\improper Large Escape Pod Three"
	music = "music/escape.ogg"

/area/shuttle/large_escape_pod3/station
	icon_state = "shuttle2"
	base_turf = /turf/simulated/floor/airless

/area/shuttle/large_escape_pod3/centcom
	icon_state = "shuttle"

/area/shuttle/large_escape_pod3/transit
	icon_state = "shuttle"

/area/shuttle/large_escape_pod4
	name = "\improper Large Escape Pod Four"
	music = "music/escape.ogg"

/area/shuttle/large_escape_pod4/station
	icon_state = "shuttle2"
	base_turf = /turf/simulated/floor/airless

/area/shuttle/large_escape_pod4/centcom
	icon_state = "shuttle"

/area/shuttle/large_escape_pod4/transit
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

/area/engineering/gravgen
	name = "Gravity Generator"
	icon_state = "engineering"

/area/maintenance/engineering/gravgen
	name = "Gravity Generator Maintenance"

/area/maintenance/maintdeck/field
	name = "Maintenance Deck Field"

/area/maintenance/maintdeck/fieldhallway
	name = "Maintenance Deck Field Hallway"
/area/maintenance/maintdeck/fieldthrift
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

/area/maintenance/bar/dorm_1
	name = "Maintenance Deck Bar Dorms 1"

/area/maintenance/bar/dorm_2
	name = "Maintenance Deck Bar Dorms 2"

//ALL THE NEW AREAS FOR NEW STATION! KAS

/area/SouthernCrossV2 // Parent for var inheritence
    name = "\improper SouthernCross Areas"
    icon_state = "yellow"
//    requires_power = FALSE

//BRIDGE AREAS

/area/SouthernCrossV2/Bridge/
    icon_state = "bridge"
    holomap_color = HOLOMAP_AREACOLOR_COMMAND
    ambience = AMBIENCE_ARRIVALS
    sound_env = LARGE_ENCLOSED
    lightswitch = 0

/area/SouthernCrossV2/Bridge/HoP_Office
    name = "\improper HoP Office"
    icon_state = "bridge"

/area/SouthernCrossV2/Bridge/AI_Core_Chamber
    name = "\improper AI Core Chamber"
    icon_state = "bridge"
    sound_env = AMBIENCE_AI

/area/SouthernCrossV2/Bridge/AI_Upload_Hall
    name = "\improper AI Upload Hall"
    icon_state = "bridge"
    sound_env = AMBIENCE_AI

/area/SouthernCrossV2/Bridge/Cyborg_Station
    name = "\improper Cyborg Station"
    icon_state = "bridge"
    sound_env = AMBIENCE_AI

/area/SouthernCrossV2/Bridge/Server_Room
    name = "\improper Server Room"
    icon_state = "bridge"
    sound_env = AMBIENCE_AI

/area/SouthernCrossV2/Bridge/Deck3_Corridor
    name = "\improper 3 Deck Corridor"
    icon_state = "bridge"
    lightswitch = 1

/area/SouthernCrossV2/Bridge/HoP_Quarters
    name = "\improper HoP Quarters"
    icon_state = "bridge"
    flags = RAD_SHIELDED
    limit_mob_size = FALSE
    block_suit_sensors = TRUE
    block_tracking = TRUE
    soundproofed = TRUE
    forbid_events = TRUE

/area/SouthernCrossV2/Bridge/CE_Quarters
    name = "\improper CE Quarters"
    icon_state = "bridge"
    flags = RAD_SHIELDED
    limit_mob_size = FALSE
    block_suit_sensors = TRUE
    block_tracking = TRUE
    soundproofed = TRUE
    forbid_events = TRUE

/area/SouthernCrossV2/Bridge/CMO_Quarters
    name = "\improper CMO Quarters"
    icon_state = "bridge"
    flags = RAD_SHIELDED
    limit_mob_size = FALSE
    block_suit_sensors = TRUE
    block_tracking = TRUE
    soundproofed = TRUE
    forbid_events = TRUE

/area/SouthernCrossV2/Bridge/RD_Quarters
    name = "\improper RD Quarters"
    icon_state = "bridge"
    flags = RAD_SHIELDED
    limit_mob_size = FALSE
    block_suit_sensors = TRUE
    block_tracking = TRUE
    soundproofed = TRUE
    forbid_events = TRUE

/area/SouthernCrossV2/Bridge/HoS_Quarters
    name = "\improper HoS Quarters"
    icon_state = "bridge"
    flags = RAD_SHIELDED
    limit_mob_size = FALSE
    block_suit_sensors = TRUE
    block_tracking = TRUE
    soundproofed = TRUE
    forbid_events = TRUE

/area/SouthernCrossV2/Bridge/Secretary_Quarters
    name = "\improper Secretary Quarters"
    icon_state = "bridge"
    flags = RAD_SHIELDED
    limit_mob_size = FALSE
    block_suit_sensors = TRUE
    block_tracking = TRUE
    soundproofed = TRUE
    forbid_events = TRUE

/area/SouthernCrossV2/Bridge/Leisure_Room
    name = "\improper Leisure Room"
    icon_state = "bridge"

/area/SouthernCrossV2/Bridge/Breakroom
    name = "\improper Breakroom"
    icon_state = "bridge"

/area/SouthernCrossV2/Bridge/Control_Atrium
    name = "\improper Control Atrium"
    icon_state = "bridge"

/area/SouthernCrossV2/Bridge/Captain_Office
    name = "\improper Captain Office"
    icon_state = "bridge"

/area/SouthernCrossV2/Bridge/Captain_Quarters
    name = "\improper Captain Quarters"
    icon_state = "bridge"
    flags = RAD_SHIELDED
    limit_mob_size = FALSE
    block_suit_sensors = TRUE
    block_tracking = TRUE
    soundproofed = TRUE
    forbid_events = TRUE

/area/SouthernCrossV2/Bridge/Conference_Room
    name = "\improper Conference Room"
    icon_state = "bridge"

/area/SouthernCrossV2/Bridge/Embassy
    name = "\improper Embassy"
    icon_state = "bridge"

/area/SouthernCrossV2/Bridge/Firstaid_Post
    name = "\improper FirstAid Post"
    icon_state = "bridge"

/area/SouthernCrossV2/Bridge/Vault_Reception
    name = "\improper Vault Reception"
    icon_state = "bridge"

/area/SouthernCrossV2/Bridge/Vault
    name = "\improper Vault"
    icon_state = "bridge"

//SECURITY AREAS

/area/SouthernCrossV2/Security
    icon_state = "security"
    holomap_color = HOLOMAP_AREACOLOR_SECURITY
    ambience = AMBIENCE_HIGHSEC
    sound_env = STANDARD_STATION
    lightswitch = 0

/area/SouthernCrossV2/Security/Aft_Security_Post
    name = "\improper Aft Security Post"
    icon_state = "security"

/area/SouthernCrossV2/Security/Reception
    name = "\improper Reception"
    icon_state = "security"

/area/SouthernCrossV2/Security/Deck2_1_Corridor
	name = "\improper 2 Deck 1 Corridor"
	icon_state = "security"

/area/SouthernCrossV2/Security/Deck2_2_Corridor
    name = "\improper 2 Deck 2 Corridor"
    icon_state = "security"

/area/SouthernCrossV2/Security/Forensics_Office
    name = "\improper Forensics Office"
    icon_state = "security"

/area/SouthernCrossV2/Security/Internal_Affairs_Office
    name = "\improper Internal Affairs Office"
    icon_state = "security"

/area/SouthernCrossV2/Security/HoS_Office
    name = "\improper HoS Office"
    icon_state = "security"

/area/SouthernCrossV2/Security/Wardens_Office
    name = "\improper Wardens Office"
    icon_state = "security"

/area/SouthernCrossV2/Security/Equipment_Storage
    name = "\improper Equipment Storage"
    icon_state = "security"

/area/SouthernCrossV2/Security/Restroom
    name = "\improper Restroom"
    icon_state = "security"
    lightswitch = 1

/area/SouthernCrossV2/Security/Lobby
    name = "\improper Lobby"
    icon_state = "security"

/area/SouthernCrossV2/Security/Boardroom
    name = "\improper Boardroom"
    icon_state = "security"

/area/SouthernCrossV2/Security/Locker_Room
    name = "\improper Locker Room"
    icon_state = "security"

/area/SouthernCrossV2/Security/Firing_Range
    name = "\improper Firing Range"
    icon_state = "security"

/area/SouthernCrossV2/Security/Storage_Room
    name = "\improper Storage Room"
    icon_state = "security"

/area/SouthernCrossV2/Security/Shuttlebay_Storage
    name = "\improper Shuttlebay Storage"
    icon_state = "security"

/area/SouthernCrossV2/Security/Processing_Room
    name = "\improper Processing Room"
    icon_state = "security"

/area/SouthernCrossV2/Security/Evidence_Storage
    name = "\improper Evidence Storage"
    icon_state = "security"

/area/SouthernCrossV2/Security/Armory
    name = "\improper Armory"
    icon_state = "security"

/area/SouthernCrossV2/Security/Brig
    name = "\improper Brig"
    icon_state = "security"

/area/SouthernCrossV2/Security/Prison_Wing
    name = "\improper Prison Wing"
    icon_state = "security"

/area/SouthernCrossV2/Security/Visitation_Room
    name = "\improper Visitation Room"
    icon_state = "security"

/area/SouthernCrossV2/Security/Quantum_Pad_Checkpoint
    name = "\improper Quantum Pad Checkpoint"
    icon_state = "security"
    lightswitch = 1

/area/SouthernCrossV2/Security/Quantum_Pad_Storage
    name = "\improper Quantum Pad Storage"
    icon_state = "security"

/area/SouthernCrossV2/Security/Exploration_Ship_Bay
    name = "\improper Exploration Ship Bay"
    icon_state = "security"
    ambience = AMBIENCE_HANGAR

/area/SouthernCrossV2/Security/Exploration_Sling_Shuttle
    name = "\improper Station Shuttle to Exploration Carrier"
    icon_state = "security"
    ambience = AMBIENCE_HANGAR

/area/SouthernCrossV2/Security/Transit_Turrets
    name = "\improper Transit Turrets"
    icon_state = "security"

//MEDICAL AREAS

/area/SouthernCrossV2/Medical
    icon_state = "medbay"
    holomap_color = HOLOMAP_AREACOLOR_MEDICAL
    ambience = AMBIENCE_GENERIC
    sound_env = STANDARD_STATION
    lightswitch = 0

/area/SouthernCrossV2/Medical/For_Medical_Post
    name = "\improper For Medical Post"
    icon_state = "medbay"

/area/SouthernCrossV2/Medical/Aft_Medical_Post
    name = "\improper Aft Medical Post"
    icon_state = "medbay"

/area/SouthernCrossV2/Medical/Port_Medical_Post
    name = "\improper Port Medical Post"
    icon_state = "medbay"

/area/SouthernCrossV2/Medical/EMT_Bay
    name = "\improper EMT Bay"
    icon_state = "medbay"

/area/SouthernCrossV2/Medical/Reception
    name = "\improper Reception"
    icon_state = "medbay"

/area/SouthernCrossV2/Medical/FirstAid_Storage
    name = "\improper FirstAid Storage"
    icon_state = "medbay"

/area/SouthernCrossV2/Medical/Chemistry
    name = "\improper Chemistry"
    icon_state = "medbay"

/area/SouthernCrossV2/Medical/Distillery
    name = "\improper Distillery"
    icon_state = "medbay"

/area/SouthernCrossV2/Medical/Treatment_Hall
    name = "\improper Treatment Hall"
    icon_state = "medbay"

/area/SouthernCrossV2/Medical/Surgery_Viewing
    name = "\improper Surgery Viewing"
    icon_state = "medbay"

/area/SouthernCrossV2/Medical/Surgery_Room_1
    name = "\improper Surgery Room 1"
    icon_state = "medbay"

/area/SouthernCrossV2/Medical/Surgery_Room_2
    name = "\improper Surgery Room 2"
    icon_state = "medbay"

/area/SouthernCrossV2/Medical/Deck2_Evac_Corridor
	name = "\improper 2 Deck Evac Corridor"
	icon_state = "medbay"

/area/SouthernCrossV2/Medical/Deck2_Corridor
    name = "\improper 2 Deck Corridor"
    icon_state = "medbay"

/area/SouthernCrossV2/Medical/Patient_Ward
    name = "\improper Patient Ward"
    icon_state = "medbay"

/area/SouthernCrossV2/Medical/Dressing_Room
    name = "\improper Dressing Room"
    icon_state = "medbay"

/area/SouthernCrossV2/Medical/Locker_Room
    name = "\improper Locker Room"
    icon_state = "medbay"

/area/SouthernCrossV2/Medical/CMO_Office
    name = "\improper CMO Office"
    icon_state = "medbay"

/area/SouthernCrossV2/Medical/Stairwell
    name = "\improper Stairwell"
    icon_state = "medbay"

/area/SouthernCrossV2/Medical/Morgue
    name = "\improper Morgue"
    icon_state = "medbay"
    ambience = AMBIENCE_GHOSTLY

/area/SouthernCrossV2/Medical/Resleeving
    name = "\improper Resleeving"
    icon_state = "medbay"

/area/SouthernCrossV2/Medical/Lounge
    name = "\improper Lounge"
    icon_state = "medbay"

/area/SouthernCrossV2/Medical/Patient_1
    name = "\improper Patient 1"
    icon_state = "medbay"

/area/SouthernCrossV2/Medical/Patient_2
    name = "\improper Patient 2"
    icon_state = "medbay"

/area/SouthernCrossV2/Medical/Patient_3
    name = "\improper Patient 3"
    icon_state = "medbay"

/area/SouthernCrossV2/Medical/Patient_4
    name = "\improper Patient 4"
    icon_state = "medbay"

/area/SouthernCrossV2/Medical/Psych_Room_1
    name = "\improper Psych Room 1"
    icon_state = "medbay"

/area/SouthernCrossV2/Medical/Psych_Room_2
    name = "\improper Psych Room 2"
    icon_state = "medbay"

/area/SouthernCrossV2/Medical/Virology
    name = "\improper Virology"
    icon_state = "medbay"

/area/SouthernCrossV2/Medical/Genetics_Lab
    name = "\improper Genetics Lab"
    icon_state = "medbay"

/area/SouthernCrossV2/Medical/Surgery_Storage
    name = "\improper Surgery Storage"
    icon_state = "medbay"

/area/SouthernCrossV2/Medical/Deck3_Corridor
    name = "\improper 3 Deck Corridor"
    icon_state = "medbay"

/area/SouthernCrossV2/Medical/Autoresleeving
    name = "\improper Autoresleeving"
    icon_state = "medbay"
    ambience = AMBIENCE_GHOSTLY

/area/SouthernCrossV2/Medical/Restrooms
    name = "\improper Restrooms"
    icon_state = "medbay"
    lightswitch = 1

//SCIENCE AREAS

/area/SouthernCrossV2/Science
    icon_state = "research"
    holomap_color = HOLOMAP_AREACOLOR_SCIENCE
    ambience = AMBIENCE_ENGINEERING
    sound_env = LARGE_SOFTFLOOR
    lightswitch = 0

/area/SouthernCrossV2/Science/Research_Lab
    name = "\improper Research Lab"
    icon_state = "research"

/area/SouthernCrossV2/Science/Robotics_Lab
    name = "\improper Robotics Lab"
    icon_state = "research"

/area/SouthernCrossV2/Science/Mech_Bay
    name = "\improper Mech Bay"
    icon_state = "research"

/area/SouthernCrossV2/Science/Locker_Room
    name = "\improper Locker Room"
    icon_state = "research"

/area/SouthernCrossV2/Science/Server_Room
    name = "\improper Server Room"
    icon_state = "research"

/area/SouthernCrossV2/Science/Circuitry_Den
    name = "\improper Circuitry Den"
    icon_state = "research"

/area/SouthernCrossV2/Science/Testing_Lab
    name = "\improper Testing Lab"
    icon_state = "research"

/area/SouthernCrossV2/Science/Toxins_Storage
    name = "\improper Toxins Storage"
    icon_state = "research"

/area/SouthernCrossV2/Science/Toxins_Mixing_Room
    name = "\improper Toxins Mixing Room"
    icon_state = "research"

/area/SouthernCrossV2/Science/Toxins_Viewing_Port
    name = "\improper Toxins Viewing Port"
    icon_state = "research"

/area/SouthernCrossV2/Science/RD_Office
    name = "\improper RD Office"
    icon_state = "research"

/area/SouthernCrossV2/Science/Observation_Hall
    name = "\improper Observation Hall"
    icon_state = "research"

/area/SouthernCrossV2/Science/PA_Chamber
    name = "\improper PA Chamber"
    icon_state = "research"

/area/SouthernCrossV2/Science/Research_Ship_Bay
    name = "\improper Research Ship Bay"
    icon_state = "research"
    ambience = AMBIENCE_HANGAR

/area/SouthernCrossV2/Science/Xenobiology_Lab
    name = "\improper Xenobiology Lab"
    icon_state = "research"

/area/SouthernCrossV2/Science/Xenobotany_Lab
    name = "\improper Xenobotany Lab"
    icon_state = "research"

/area/SouthernCrossV2/Science/Xenobotany_Isolation_Chamber
    name = "\improper Xenobotany Isolation Chamber"
    icon_state = "research"

/area/SouthernCrossV2/Science/Testing_Chamber
    name = "\improper Testing Chamber"
    icon_state = "research"

/area/SouthernCrossV2/Science/PA_Access
    name = "\improper Testing PA Access"
    icon_state = "research"

/area/SouthernCrossV2/Science/Deck2_Corridor
    name = "\improper 2 Deck Corridor"
    icon_state = "research"


//ENGINEERING AREAS

/area/SouthernCrossV2/Engineering
    icon_state = "engineering"
    holomap_color = HOLOMAP_AREACOLOR_ENGINEERING
    ambience = AMBIENCE_ENGINEERING
    sound_env = LARGE_ENCLOSED
    lightswitch = 0

/area/SouthernCrossV2/Engineering/Central_Engineering_Post
    name = "\improper Central Engineering Post"
    icon_state = "engineering"
    lightswitch = 1

/area/SouthernCrossV2/Engineering/GravGen_Room
    name = "\improper GravGen Room"
    icon_state = "engineering"

/area/SouthernCrossV2/Engineering/Telecomms_Foyer
    name = "\improper Telecomms Foyer"
    icon_state = "engineering"
    ambience = AMBIENCE_AI

/area/SouthernCrossV2/Engineering/Telecomms_Control_Room
    name = "\improper Telecomms Control Room"
    icon_state = "engineering"
    ambience = AMBIENCE_AI

/area/SouthernCrossV2/Engineering/Telecomms_Network
    name = "\improper Telecomms Network"
    icon_state = "engineering"
    ambience = AMBIENCE_AI
    lightswitch = 1

/area/SouthernCrossV2/Engineering/Reception
    name = "\improper Reception"
    icon_state = "engineering"

/area/SouthernCrossV2/Engineering/Engineering_EVA
    name = "\improper Engineering EVA"
    icon_state = "engineering"

/area/SouthernCrossV2/Engineering/Locker_Room
    name = "\improper Locker Room"
    icon_state = "engineering"

/area/SouthernCrossV2/Engineering/Engineering_Workshop
    name = "\improper Engineering Workshop"
    icon_state = "engineering"

/area/SouthernCrossV2/Engineering/Deck2_1_Corridor
    name = "\improper 2 Deck 1 Corridor"
    icon_state = "engineering"

/area/SouthernCrossV2/Engineering/Deck2_2_Corridor
    name = "\improper 2 Deck 2 Corridor"
    icon_state = "engineering"

/area/SouthernCrossV2/Engineering/Deck2_Evac_Corridor
    name = "\improper 2 Deck Evac Corridor"
    icon_state = "engineering"

/area/SouthernCrossV2/Engineering/Storage
    name = "\improper Storage"
    icon_state = "engineering"

/area/SouthernCrossV2/Engineering/Drone_Fab
    name = "\improper Drone Fab"
    icon_state = "engineering"

/area/SouthernCrossV2/Engineering/Canister_Storage
    name = "\improper Canister Storage"
    icon_state = "engineering"

/area/SouthernCrossV2/Engineering/Mech_Bay
    name = "\improper Mech Bay"
    icon_state = "engineering"

/area/SouthernCrossV2/Engineering/Technical_Storage
    name = "\improper Technical Storage"
    icon_state = "engineering"

/area/SouthernCrossV2/Engineering/CE_Office
    name = "\improper CE Office"
    icon_state = "engineering"

/area/SouthernCrossV2/Engineering/Deck3_1_Corridor
    name = "\improper 3 Deck 1 Corridor"
    icon_state = "engineering"

/area/SouthernCrossV2/Engineering/Deck3_2_Corridor
    name = "\improper 3 Deck 2 Corridor"
    icon_state = "engineering"

/area/SouthernCrossV2/Engineering/Atmospherics_Chamber
    name = "\improper Atmospherics Chamber"
    icon_state = "engineering"
    ambience = AMBIENCE_ATMOS

/area/SouthernCrossV2/Engineering/Atmospherics_Control_Room
    name = "\improper Atmospherics Control Room"
    icon_state = "engineering"

/area/SouthernCrossV2/Engineering/Atmospherics_Substation
    name = "\improper Atmospherics Substation"
    icon_state = "engineering"

/area/SouthernCrossV2/Engineering/Engine1_Chamber
    name = "\improper 1 Engine Chamber"
    icon_state = "engineering"

/area/SouthernCrossV2/Engineering/Engine1_Control_Room
    name = "\improper 1 Engine Control Room"
    icon_state = "engineering"

/area/SouthernCrossV2/Engineering/Engine1_Access_Hall
    name = "\improper 1 Engine Access Hall"
    icon_state = "engineering"

/area/SouthernCrossV2/Engineering/Engine1_Substation
    name = "\improper 1 Engine Substation"
    icon_state = "engineering"

/area/SouthernCrossV2/Engineering/Engine2_Chamber
    name = "\improper 2 Engine Chamber"
    icon_state = "engineering"

/area/SouthernCrossV2/Engineering/Engine3_Control_Room
    name = "\improper 2 Engine Control Room"
    icon_state = "engineering"

/area/SouthernCrossV2/Engineering/Engine2_Access_Hall
    name = "\improper 2 Engine Access Hall"
    icon_state = "engineering"

/area/SouthernCrossV2/Engineering/Engine2_Substation
    name = "\improper 2 Engine Substation"
    icon_state = "engineering"

/area/SouthernCrossV2/Engineering/Engine2_Canister_Storage
    name = "\improper 2 Engine Canister Storage"
    icon_state = "engineering"

/area/SouthernCrossV2/Engineering/Engine2_Waste_Handling
    name = "\improper 2 Engine Waste Handling"
    icon_state = "engineering"

/area/SouthernCrossV2/Engineering/Construction_Area
    name = "\improper Construction Area"
    icon_state = "engineering"

/area/SouthernCrossV2/Engineering/Airlock_Access
    name = "\improper Airlock Access"
    icon_state = "engineering"

/area/SouthernCrossV2/Engineering/Engine_Tech_Storage
    name = "\improper Engine Tech Storage"
    icon_state = "engineering"

/area/SouthernCrossV2/Engineering/Breakroom
    name = "\improper Engineering Breakroom"
    icon_state = "engineering"

/area/SouthernCrossV2/Engineering/Solar_Control_ForPort
    name = "\improper Solar Control ForPort"
    icon_state = "engineering"
    ambience = AMBIENCE_SPACE

/area/SouthernCrossV2/Engineering/Solar_Control_ForStar
    name = "\improper Solar Control ForStar"
    icon_state = "engineering"
    ambience = AMBIENCE_SPACE

/area/SouthernCrossV2/Engineering/Solar_Control_AftPort
    name = "\improper Solar Control AftPort"
    icon_state = "engineering"
    ambience = AMBIENCE_SPACE

/area/SouthernCrossV2/Engineering/Solar_Control_AftStar
    name = "\improper Solar Control AftStar"
    icon_state = "engineering"
    ambience = AMBIENCE_SPACE

/area/SouthernCrossV2/Engineering/Solar_Array_ForPort
    name = "\improper Solar Array ForPort"
    icon_state = "engineering"
    ambience = AMBIENCE_SPACE
    dynamic_lighting = 0

/area/SouthernCrossV2/Engineering/Solar_Array_ForStar
    name = "\improper Solar Array ForStar"
    icon_state = "engineering"
    ambience = AMBIENCE_SPACE
    dynamic_lighting = 0

/area/SouthernCrossV2/Engineering/Solar_Array_AftPort
    name = "\improper Solar Array AftPort"
    icon_state = "engineering"
    ambience = AMBIENCE_SPACE
    dynamic_lighting = 0

/area/SouthernCrossV2/Engineering/Solar_Array_AftStar
    name = "\improper Solar Array AftStar"
    icon_state = "engineering"
    ambience = AMBIENCE_SPACE
    dynamic_lighting = 0

//CARGO AREAS

/area/SouthernCrossV2/Cargo
    icon_state = "quart"
    holomap_color = HOLOMAP_AREACOLOR_CARGO
    ambience = AMBIENCE_HANGAR
    sound_env = SOUND_ENVIRONMENT_HANGAR
    lightswitch = 0

/area/SouthernCrossV2/Cargo/For_Tool_Storage
    name = "\improper For Tool Storage"
    icon_state = "quart"

/area/SouthernCrossV2/Cargo/Star_Tool_Storage
    name = "\improper Star Tool Storage"
    icon_state = "quart"

/area/SouthernCrossV2/Cargo/Aft_Tool_Storage
    name = "\improper Aft Tool Storage"
    icon_state = "quart"

/area/SouthernCrossV2/Cargo/Reception
    name = "\improper Reception"
    icon_state = "quart"

/area/SouthernCrossV2/Cargo/Packaging_Room
    name = "\improper Packaging Room"
    icon_state = "quart"

/area/SouthernCrossV2/Cargo/Recycling
    name = "\improper Recycling"
    icon_state = "quart"

/area/SouthernCrossV2/Cargo/Warehouse
    name = "\improper Warehouse"
    icon_state = "quart"

/area/SouthernCrossV2/Cargo/Deck2_Stairwell
    name = "\improper 2 Deck Stairwell"
    icon_state = "quart"

/area/SouthernCrossV2/Cargo/Deck1_Stairwell
    name = "\improper 1 Deck Stairwell"
    icon_state = "quart"

/area/SouthernCrossV2/Cargo/Supply_Ship_Bay
    name = "\improper Supply Ship Bay"
    icon_state = "quart"
    ambience = AMBIENCE_HANGAR

/area/SouthernCrossV2/Cargo/Depot1
    name = "\improper 1 Depot"
    icon_state = "quart"

/area/SouthernCrossV2/Cargo/Depot2
    name = "\improper 2 Depot"
    icon_state = "quart"

/area/SouthernCrossV2/Cargo/Mining_Ship_Bay
    name = "\improper Mining Ship Bay"
    icon_state = "quart"
    ambience = AMBIENCE_HANGAR

/area/SouthernCrossV2/Cargo/Mining_EVA
    name = "\improper Mail Room"
    icon_state = "quart"

/area/SouthernCrossV2/Cargo/Waste_Disposals
    name = "\improper Waste Disposals"
    icon_state = "quart"

/area/SouthernCrossV2/Cargo/QM_Office
    name = "\improper QM Office"
    icon_state = "quart"

/area/SouthernCrossV2/Cargo/Mail_Room
    name = "\improper Mail Room"
    icon_state = "quart"

/area/SouthernCrossV2/Cargo/Deck1_Corridor
    name = "\improper Mail Room"
    icon_state = "quart"

/area/SouthernCrossV2/Cargo/Breakroom
    name = "\improper Cargo Breakroom"
    icon_state = "quart"

//DOMICILE AREAS

/area/SouthernCrossV2/Domicile
    icon_state = "gaming"
    ambience = AMBIENCE_GENERIC
    sound_env = SOUND_ENVIRONMENT_HALLWAY
    lightswitch = 0

/area/SouthernCrossV2/Domicile/Holodeck
    name = "\improper Holodeck"
    icon_state = "gaming"

/area/SouthernCrossV2/Domicile/Midnight_Bar
    name = "\improper Midnight Bar"
    icon_state = "gaming"
    flags = RAD_SHIELDED

/area/SouthernCrossV2/Domicile/Midnight_Kitchen
    name = "\improper Midnight Kitchen"
    icon_state = "gaming"
    flags = RAD_SHIELDED

/area/SouthernCrossV2/Domicile/Gallery
    name = "\improper Gallery"
    icon_state = "gaming"

/area/SouthernCrossV2/Domicile/VR
    name = "\improper VR"
    icon_state = "gaming"

/area/SouthernCrossV2/Domicile/Gym
    name = "\improper Gym"
    icon_state = "gaming"

/area/SouthernCrossV2/Domicile/Gym_Sauna
    name = "\improper Gym Sauna"
    icon_state = "gaming"

/area/SouthernCrossV2/Domicile/Chapel_Lobby
    name = "\improper Chapel Lobby"
    icon_state = "gaming"
    ambience = AMBIENCE_CHAPEL

/area/SouthernCrossV2/Domicile/Chapel_Morgue
    name = "\improper Chapel Morgue"
    icon_state = "gaming"
    ambience = AMBIENCE_CHAPEL

/area/SouthernCrossV2/Domicile/Chapel_Office
    name = "\improper Chapel Office"
    icon_state = "gaming"
    ambience = AMBIENCE_CHAPEL

/area/SouthernCrossV2/Domicile/Central_Restroom
    name = "\improper Central Restroom"
    icon_state = "gaming"
    flags = RAD_SHIELDED
    lightswitch = 1

/area/SouthernCrossV2/Domicile/For_Restroom
    name = "\improper For Restroom"
    icon_state = "gaming"
    flags = RAD_SHIELDED
    lightswitch = 1

/area/SouthernCrossV2/Domicile/Star_Restroom
    name = "\improper Star Restroom"
    icon_state = "gaming"
    flags = RAD_SHIELDED
    lightswitch = 1

/area/SouthernCrossV2/Domicile/Aft_Restroom
    name = "\improper Aft Restroom"
    icon_state = "gaming"
    flags = RAD_SHIELDED
    lightswitch = 1

/area/SouthernCrossV2/Domicile/Port_Restroom
    name = "\improper Port Restroom"
    icon_state = "gaming"
    flags = RAD_SHIELDED
    lightswitch = 1

/area/SouthernCrossV2/Domicile/Library
    name = "\improper Library"
    icon_state = "gaming"
    ambience = AMBIENCE_SPACE

/area/SouthernCrossV2/Domicile/Library_Cafe
    name = "\improper Library Cafe"
    icon_state = "gaming"
    ambience = AMBIENCE_SPACE

/area/SouthernCrossV2/Domicile/Library_Office
    name = "\improper Library Office"
    icon_state = "gaming"
    ambience = AMBIENCE_SPACE

/area/SouthernCrossV2/Domicile/Rec_Lounge
    name = "\improper Rec Lounge"
    icon_state = "gaming"

/area/SouthernCrossV2/Domicile/Office_Lounge
    name = "\improper Office Lounge"
    icon_state = "gaming"

/area/SouthernCrossV2/Domicile/Chomp_Hydroponics
    name = "\improper Chomp Hydroponics"
    icon_state = "gaming"
    flags = RAD_SHIELDED

/area/SouthernCrossV2/Domicile/Chomp_Kitchen
    name = "\improper Chomp Kitchen"
    icon_state = "gaming"
    flags = RAD_SHIELDED

/area/SouthernCrossV2/Domicile/Chomp_Dinner_1
    name = "\improper Chomp Dinner 1"
    icon_state = "gaming"
    flags = RAD_SHIELDED
    lightswitch = 1

/area/SouthernCrossV2/Domicile/Chomp_Dinner_2
    name = "\improper Chomp Dinner 2"
    icon_state = "gaming"
    flags = RAD_SHIELDED
    lightswitch = 1

/area/SouthernCrossV2/Domicile/Chomp_Lounge
    name = "\improper Chomp Lounge"
    icon_state = "gaming"
    flags = RAD_SHIELDED

/area/SouthernCrossV2/Domicile/Public_Hydroponics
    name = "\improper Public Hydroponics"
    icon_state = "gaming"

/area/SouthernCrossV2/Domicile/Botanical_Shop
    name = "\improper Botanical Shop"
    icon_state = "gaming"

/area/SouthernCrossV2/Domicile/Observation_Atrium
    name = "\improper Observation Atrium"
    icon_state = "gaming"

/area/SouthernCrossV2/Domicile/Observation_Lounge
    name = "\improper Observation Lounge"
    icon_state = "gaming"

/area/SouthernCrossV2/Domicile/Public_Garden
    name = "\improper Public Garden"
    icon_state = "gaming"

/area/SouthernCrossV2/Domicile/Dormitory_01
    name = "\improper Dormitory 01"
    icon_state = "gaming"
    flags = RAD_SHIELDED
    lightswitch = 0
    limit_mob_size = FALSE
    block_suit_sensors = TRUE
    block_tracking = TRUE
    soundproofed = TRUE
    forbid_events = TRUE

/area/SouthernCrossV2/Domicile/Dormitory_02
    name = "\improper Dormitory 02"
    icon_state = "gaming"
    flags = RAD_SHIELDED
    lightswitch = 0
    limit_mob_size = FALSE
    block_suit_sensors = TRUE
    block_tracking = TRUE
    soundproofed = TRUE
    forbid_events = TRUE

/area/SouthernCrossV2/Domicile/Dormitory_03
    name = "\improper Dormitory 03"
    icon_state = "gaming"
    flags = RAD_SHIELDED
    lightswitch = 0
    limit_mob_size = FALSE
    block_suit_sensors = TRUE
    block_tracking = TRUE
    soundproofed = TRUE
    forbid_events = TRUE

/area/SouthernCrossV2/Domicile/Dormitory_04
    name = "\improper Dormitory 04"
    icon_state = "gaming"
    flags = RAD_SHIELDED
    limit_mob_size = FALSE
    block_suit_sensors = TRUE
    block_tracking = TRUE
    soundproofed = TRUE
    forbid_events = TRUE

/area/SouthernCrossV2/Domicile/Dormitory_05
    name = "\improper Dormitory 05"
    icon_state = "gaming"
    flags = RAD_SHIELDED
    limit_mob_size = FALSE
    block_suit_sensors = TRUE
    block_tracking = TRUE
    soundproofed = TRUE
    forbid_events = TRUE

/area/SouthernCrossV2/Domicile/Dormitory_06
    name = "\improper Dormitory 06"
    icon_state = "gaming"
    flags = RAD_SHIELDED
    limit_mob_size = FALSE
    block_suit_sensors = TRUE
    block_tracking = TRUE
    soundproofed = TRUE
    forbid_events = TRUE

/area/SouthernCrossV2/Domicile/Dormitory_07
    name = "\improper Dormitory 07"
    icon_state = "gaming"
    flags = RAD_SHIELDED
    limit_mob_size = FALSE
    block_suit_sensors = TRUE
    block_tracking = TRUE
    soundproofed = TRUE
    forbid_events = TRUE

/area/SouthernCrossV2/Domicile/Dormitory_08
    name = "\improper Dormitory 08"
    icon_state = "gaming"
    flags = RAD_SHIELDED
    limit_mob_size = FALSE
    block_suit_sensors = TRUE
    block_tracking = TRUE
    soundproofed = TRUE
    forbid_events = TRUE

/area/SouthernCrossV2/Domicile/Dormitory_09
    name = "\improper Dormitory 09"
    icon_state = "gaming"
    flags = RAD_SHIELDED
    limit_mob_size = FALSE
    block_suit_sensors = TRUE
    block_tracking = TRUE
    soundproofed = TRUE
    forbid_events = TRUE

/area/SouthernCrossV2/Domicile/Dormitory_10
    name = "\improper Dormitory 10"
    icon_state = "gaming"
    flags = RAD_SHIELDED
    limit_mob_size = FALSE
    block_suit_sensors = TRUE
    block_tracking = TRUE
    soundproofed = TRUE
    forbid_events = TRUE

/area/SouthernCrossV2/Domicile/Dormitory_11
    name = "\improper Dormitory 11"
    icon_state = "gaming"
    flags = RAD_SHIELDED
    limit_mob_size = FALSE
    block_suit_sensors = TRUE
    block_tracking = TRUE
    soundproofed = TRUE
    forbid_events = TRUE

/area/SouthernCrossV2/Domicile/Dormitory_12
    name = "\improper Dormitory 12"
    icon_state = "gaming"
    flags = RAD_SHIELDED
    limit_mob_size = FALSE
    block_suit_sensors = TRUE
    block_tracking = TRUE
    soundproofed = TRUE
    forbid_events = TRUE

/area/SouthernCrossV2/Domicile/Dorm_Corridor_1
    name = "\improper Dorm Corridor 1"
    icon_state = "gaming"
    lightswitch = 1

/area/SouthernCrossV2/Domicile/Dorm_Corridor_2
    name = "\improper Dorm Corridor 2"
    icon_state = "gaming"
    lightswitch = 1

/area/SouthernCrossV2/Domicile/Dorm_Corridor_3
    name = "\improper Dorm Corridor 3"
    icon_state = "gaming"
    lightswitch = 1

/area/SouthernCrossV2/Domicile/Dorm_Corridor_4
    name = "\improper Dorm Corridor 4"
    icon_state = "gaming"
    lightswitch = 1

/area/SouthernCrossV2/Domicile/Dorm_Foyer
    name = "\improper Dorm Foyer"
    icon_state = "gaming"
    lightswitch = 1

/area/SouthernCrossV2/Domicile/Public_Gateway
    name = "\improper Public Gateway"
    icon_state = "gaming"

/area/SouthernCrossV2/Domicile/Emergency_EVA
    name = "\improper Emergency EVA"
    icon_state = "gaming"

/area/SouthernCrossV2/Domicile/Public_EVA
    name = "\improper Public EVA"
    icon_state = "gaming"

/area/SouthernCrossV2/Domicile/Custodial_Office
    name = "\improper Custodial Office"
    icon_state = "gaming"

//COMMONS AREAS
/area/SouthernCrossV2/Commons
    icon_state = "hallA"
    ambience = AMBIENCE_GENERIC
    sound_env = MEDIUM_SOFTFLOOR

/area/SouthernCrossV2/Commons/ForPort_1_Deck_Observatory
    name = "\improper ForPort 1 Deck Observatory"
    icon_state = "hallA"

/area/SouthernCrossV2/Commons/ForStar_1_Deck_Observatory
    name = "\improper ForStar 1 Deck Observatory"
    icon_state = "hallA"

/area/SouthernCrossV2/Commons/AftPort_1_Deck_Observatory
    name = "\improper AftPort 1 Deck Observatory"
    icon_state = "hallA"

/area/SouthernCrossV2/Commons/AftStar_1_Deck_Observatory
    name = "\improper AftStar 1 Deck Observatory"
    icon_state = "hallA"

/area/SouthernCrossV2/Commons/ForPort_2_Deck_Observatory
    name = "\improper ForPort 2 Deck Observatory"
    icon_state = "hallA"

/area/SouthernCrossV2/Commons/ForStar_2_Deck_Observatory
    name = "\improper ForStar 2 Deck Observatory"
    icon_state = "hallA"

/area/SouthernCrossV2/Commons/AftPort_2_Deck_Observatory
    name = "\improper AftPort 2 Deck Observatory"
    icon_state = "hallA"

/area/SouthernCrossV2/Commons/AftStar_2_Deck_Observatory
    name = "\improper AftStar 2 Deck Observatory"
    icon_state = "hallA"

/area/SouthernCrossV2/Commons/For_Transit_Foyer
    name = "\improper For Transit Foyer"
    icon_state = "hallA"

/area/SouthernCrossV2/Commons/Star_Transit_Foyer
    name = "\improper Star Transit Foyer"
    icon_state = "hallA"
    flags = RAD_SHIELDED

/area/SouthernCrossV2/Commons/Aft_Transit_Lobby
    name = "\improper Aft Transit Lobby"
    icon_state = "hallA"

/area/SouthernCrossV2/Commons/Port_Transit_Foyer
    name = "\improper Port Transit Foyer"
    icon_state = "hallA"
    flags = RAD_SHIELDED

/area/SouthernCrossV2/Commons/For_1_Deck_Stairwell
    name = "\improper For 1 Deck Stairwell"
    icon_state = "hallA"

/area/SouthernCrossV2/Commons/For_2_Deck_Stairwell
    name = "\improper For 2 Deck Stairwell"
    icon_state = "hallA"

/area/SouthernCrossV2/Commons/For_3_Deck_Stairwell
    name = "\improper For 3 Deck Stairwell"
    icon_state = "hallA"

/area/SouthernCrossV2/Commons/Star_1_Deck_Stairwell
    name = "\improper Star 1 Deck Stairwell"
    icon_state = "hallA"

/area/SouthernCrossV2/Commons/Star_2_Deck_Stairwell
    name = "\improper Star 2 Deck Stairwell"
    icon_state = "hallA"

/area/SouthernCrossV2/Commons/Star_3_Deck_Stairwell
    name = "\improper Star 3 Deck Stairwell"
    icon_state = "hallA"

/area/SouthernCrossV2/Commons/Aft_1_Deck_Stairwell
    name = "\improper Aft 1 Deck Stairwell"
    icon_state = "hallA"

/area/SouthernCrossV2/Commons/Aft_2_Deck_Stairwell
    name = "\improper Aft 2 Deck Stairwell"
    icon_state = "hallA"

/area/SouthernCrossV2/Commons/Aft_3_Deck_Stairwell
    name = "\improper Aft 3 Deck Stairwell"
    icon_state = "hallA"

/area/SouthernCrossV2/Commons/Port_1_Deck_Stairwell
    name = "\improper Port 1 Deck Stairwell"
    icon_state = "hallA"

/area/SouthernCrossV2/Commons/Port_2_Deck_Stairwell
    name = "\improper Port 2 Deck Stairwell"
    icon_state = "hallA"

/area/SouthernCrossV2/Commons/Port_3_Deck_Stairwell
    name = "\improper Port 3 Deck Stairwell"
    icon_state = "hallA"

/area/SouthernCrossV2/Commons/For_2_Deck_Central_Corridor_1
    name = "\improper For 2 Deck Central Corridor 1"
    icon_state = "hallA"

/area/SouthernCrossV2/Commons/For_2_Deck_Central_Corridor_2
    name = "\improper For 2 Deck Central Corridor 2"
    icon_state = "hallA"

/area/SouthernCrossV2/Commons/Star_2_Deck_Central_Corridor_1
    name = "\improper Star 2 Deck Central Corridor 1"
    icon_state = "hallA"

/area/SouthernCrossV2/Commons/Star_2_Deck_Central_Corridor_2
    name = "\improper Star 2 Deck Central Corridor 2"
    icon_state = "hallA"

/area/SouthernCrossV2/Commons/Aft_2_Deck_Central_Corridor_1
    name = "\improper Aft 2 Deck Central Corridor 1"
    icon_state = "hallA"

/area/SouthernCrossV2/Commons/Aft_2_Deck_Central_Corridor_2
    name = "\improper Aft 2 Deck Central Corridor 2"
    icon_state = "hallA"

/area/SouthernCrossV2/Commons/Port_2_Deck_Central_Corridor_1
    name = "\improper Port 2 Deck Central Corridor 1"
    icon_state = "hallA"

/area/SouthernCrossV2/Commons/Port_2_Deck_Central_Corridor_2
    name = "\improper Port 2 Deck Central Corridor 2"
    icon_state = "hallA"

/area/SouthernCrossV2/Commons/Aft_3_Deck_Central_Corridor_1
    name = "\improper Aft 3 Deck Central Corridor 1"
    icon_state = "hallA"

/area/SouthernCrossV2/Commons/Aft_3_Deck_Central_Corridor_2
    name = "\improper Aft 3 Deck Central Corridor 2"
    icon_state = "hallA"

/area/SouthernCrossV2/Commons/For_2_Deck_Corridor_1
    name = "\improper For 2 Deck Corridor 1"
    icon_state = "hallA"

/area/SouthernCrossV2/Commons/For_2_Deck_Corridor_2
    name = "\improper For 2 Deck Corridor 2"
    icon_state = "hallA"

/area/SouthernCrossV2/Commons/Star_2_Deck_Corridor_1
    name = "\improper Star 2 Deck Corridor 1"
    icon_state = "hallA"

/area/SouthernCrossV2/Commons/Star_2_Deck_Corridor_2
    name = "\improper Star 2 Deck Corridor 2"
    icon_state = "hallA"

/area/SouthernCrossV2/Commons/Aft_2_Deck_Corridor_1
    name = "\improper Aft 2 Deck Corridor 1"
    icon_state = "hallA"

/area/SouthernCrossV2/Commons/Aft_2_Deck_Corridor_2
    name = "\improper Aft 2 Deck Corridor 2"
    icon_state = "hallA"

/area/SouthernCrossV2/Commons/Port_2_Deck_Corridor_1
    name = "\improper Port 2 Deck Corridor 1"
    icon_state = "hallA"

/area/SouthernCrossV2/Commons/Port_2_Deck_Corridor_2
    name = "\improper Port 2 Deck Corridor 2"
    icon_state = "hallA"

/area/SouthernCrossV2/Commons/Aft_2_Deck_Lobby
    name = "\improper Aft 2 Deck Lobby"
    icon_state = "hallA"

/area/SouthernCrossV2/Commons/Aft_2_Deck_Shuttlebay_Corridor
    name = "\improper Aft 2 Deck Shuttlebay Corridor"
    icon_state = "hallA"

/area/SouthernCrossV2/Commons/Central_1_Deck_Hall
    name = "\improper Central 1 Deck Hall"
    icon_state = "hallA"

/area/SouthernCrossV2/Commons/Central_2_Deck_Hall
    name = "\improper Central 2 Deck Hall"
    icon_state = "hallA"

/area/SouthernCrossV2/Commons/Central_3_Deck_Hall
    name = "\improper Central 3 Deck Hall"
    icon_state = "hallA"

/area/SouthernCrossV2/Commons/Cryostorage_Lounge
    name = "\improper Cryostorage Lounge"
    icon_state = "hallA"

/area/SouthernCrossV2/Commons/Deck1_Transit_Hall
    name = "\improper 1 Deck Transit Hall"
    icon_state = "hallA"

/area/SouthernCrossV2/Commons/Deck1_Corridor
    name = "\improper 1 Deck Corridor"
    icon_state = "hallA"

/area/SouthernCrossV2/Commons/For_Locker_Room
    name = "\improper For Locker Room"
    icon_state = "hallA"

/area/SouthernCrossV2/Commons/Planetside_Equipment
    name = "\improper Planetside Equipment"
    icon_state = "hallA"

/area/SouthernCrossV2/Commons/Star_Breakroom
    name = "\improper Star Breakroom"
    icon_state = "hallA"

/area/SouthernCrossV2/Commons/Port_Breakroom
    name = "\improper Port Breakroom"
    icon_state = "hallA"

/area/SouthernCrossV2/Commons/Port_1Deck_Central_Corridor_1
    name = "\improper Port Deck1 Central Corridor 1"
    icon_state = "hallA"

/area/SouthernCrossV2/Commons/Port_1Deck_Central_Corridor_2
    name = "\improper Port Deck1 Central Corridor 2"
    icon_state = "hallA"

/area/SouthernCrossV2/Commons/Star_1Deck_Central_Corridor_1
    name = "\improper Star Deck1 Central Corridor 1"
    icon_state = "hallA"

/area/SouthernCrossV2/Commons/Star_1Deck_Central_Corridor_2
    name = "\improper Star Deck1 Central Corridor 2"
    icon_state = "hallA"

/area/SouthernCrossV2/Commons/Port_1Deck_Atrium
    name = "\improper Port Deck1 Atrium"
    icon_state = "hallA"

/area/SouthernCrossV2/Commons/Star_1Deck_Atrium
    name = "\improper Star Deck1 Atrium"
    icon_state = "hallA"

/area/SouthernCrossV2/Commons/Stairwell_For
    name = "\improper Stairwell Forward"
    icon_state = "hallA"

/area/SouthernCrossV2/Commons/Stairwell_Star
    name = "\improper Stairwell Starboard"
    icon_state = "hallA"

/area/SouthernCrossV2/Commons/Stairwell_Aft
    name = "\improper Stairwell Aft"
    icon_state = "hallA"

/area/SouthernCrossV2/Commons/Stairwell_Port
    name = "\improper Stairwell Port"
    icon_state = "hallA"


//HARBOR AREAS

/area/SouthernCrossV2/Harbor
    icon_state = "hangar"
    ambience = AMBIENCE_ARRIVALS
    sound_env = SOUND_ENVIRONMENT_HANGAR


/area/SouthernCrossV2/Harbor/Dock1
    name = "\improper 1 Dock"
    icon_state = "hangar"
    flags = RAD_SHIELDED

/area/SouthernCrossV2/Harbor/Dock2
    name = "\improper 2 Dock"
    icon_state = "hangar"
    flags = RAD_SHIELDED

/area/SouthernCrossV2/Harbor/Dock3
    name = "\improper 3 Dock"
    icon_state = "hangar"
    flags = RAD_SHIELDED

/area/SouthernCrossV2/Harbor/Dock4
    name = "\improper 4 Dock"
    icon_state = "hangar"
    flags = RAD_SHIELDED

/area/SouthernCrossV2/Harbor/Dock5
    name = "\improper 5 Dock"
    icon_state = "hangar"
    flags = RAD_SHIELDED

/area/SouthernCrossV2/Harbor/Ship_Bay1
    name = "\improper 1 Ship Bay"
    icon_state = "hangar"
    ambience = AMBIENCE_HANGAR

/area/SouthernCrossV2/Harbor/Ship_Bay2
    name = "\improper 2 Ship Bay"
    icon_state = "hangar"
    ambience = AMBIENCE_HANGAR

/area/SouthernCrossV2/Harbor/Ship_Bay3
    name = "\improper 3 Ship Bay"
    icon_state = "hangar"
    ambience = AMBIENCE_HANGAR

/area/SouthernCrossV2/Harbor/Ship_Bay4
    name = "\improper 4 Ship Bay"
    icon_state = "hangar"
    ambience = AMBIENCE_HANGAR

/area/SouthernCrossV2/Harbor/Port_Docking_Foyer
    name = "\improper Port Docking Foyer"
    icon_state = "hangar"
    flags = RAD_SHIELDED

/area/SouthernCrossV2/Harbor/Star_Docking_Foyer
    name = "\improper Star Docking Foyer"
    icon_state = "hangar"
    flags = RAD_SHIELDED

/area/SouthernCrossV2/Harbor/Fueling_Post
    name = "\improper Fueling Post"
    icon_state = "hangar"

/area/SouthernCrossV2/Harbor/Fueling_Storage
    name = "\improper Fueling Storage"
    icon_state = "hangar"

/area/SouthernCrossV2/Harbor/For_Shuttlebay
    name = "\improper For Shuttlebay"
    icon_state = "hangar"

/area/SouthernCrossV2/Harbor/Star_Shuttlebay
    name = "\improper Star Shuttlebay"
    icon_state = "hangar"

/area/SouthernCrossV2/Harbor/Aft_Shuttlebay
    name = "\improper Aft Shuttlebay"
    icon_state = "hangar"

/area/SouthernCrossV2/Harbor/Port_Shuttlebay
    name = "\improper Port Shuttlebay"
    icon_state = "hangar"

/area/SouthernCrossV2/Harbor/For_3_Deck_Airlock_Access_1
    name = "\improper For 3 Deck Airlock Access 1"
    icon_state = "hangar"

/area/SouthernCrossV2/Harbor/For_3_Deck_Airlock_Access_2
    name = "\improper For 3 Deck Airlock Access 2"
    icon_state = "hangar"

/area/SouthernCrossV2/Harbor/Star_2_Deck_Airlock_Access
    name = "\improper Star 2 Deck Airlock Access"
    icon_state = "hangar"

/area/SouthernCrossV2/Harbor/Star_3_Deck_Airlock_Access
    name = "\improper Star 3 Deck Airlock Access"
    icon_state = "hangar"

/area/SouthernCrossV2/Harbor/Aft_3_Deck_Airlock_Access
    name = "\improper Aft 3 Deck Airlock Access"
    icon_state = "hangar"

/area/SouthernCrossV2/Harbor/Aft_2_Deck_Airlock_Access
    name = "\improper Aft 2 Deck Airlock Access"
    icon_state = "hangar"

/area/SouthernCrossV2/Harbor/Port_3_Deck_Airlock_Access
    name = "\improper Port 3 Deck Airlock Access"
    icon_state = "hangar"

//EVACUATION AREAS

/area/SouthernCrossV2/Evac
    icon_state = "shuttle2"
    requires_power = FALSE
    flags = RAD_SHIELDED
    ambience = AMBIENCE_SPACE
    sound_env = SMALL_SOFTFLOOR
    base_turf = /turf/simulated/floor/airless

/area/SouthernCrossV2/Evac/Pod01
    name = "\improper 01 Pod"
    icon_state = "shuttle2"

/area/SouthernCrossV2/Evac/Pod02
    name = "\improper 02 Pod"
    icon_state = "shuttle2"

/area/SouthernCrossV2/Evac/Pod03
    name = "\improper 03 Pod"
    icon_state = "shuttle2"

/area/SouthernCrossV2/Evac/Pod04
    name = "\improper 04 Pod"
    icon_state = "shuttle2"

/area/SouthernCrossV2/Evac/Pod05
    name = "\improper 05 Pod"
    icon_state = "shuttle2"

/area/SouthernCrossV2/Evac/Pod06
    name = "\improper 06 Pod"
    icon_state = "shuttle2"

/area/SouthernCrossV2/Evac/Pod07
    name = "\improper 07 Pod"
    icon_state = "shuttle2"

/area/SouthernCrossV2/Evac/Pod08
    name = "\improper 08 Pod"
    icon_state = "shuttle2"

/area/SouthernCrossV2/Evac/Pod09
    name = "\improper 09 Pod"
    icon_state = "shuttle2"

/area/SouthernCrossV2/Evac/Pod10
    name = "\improper 10 Pod"
    icon_state = "shuttle2"

/area/SouthernCrossV2/Evac/Pod11
    name = "\improper 11 Pod"
    icon_state = "shuttle2"

/area/SouthernCrossV2/Evac/Pod12
    name = "\improper 12 Pod"
    icon_state = "shuttle2"

/area/SouthernCrossV2/Evac/Pod13
    name = "\improper 13 Pod"
    icon_state = "shuttle2"

/area/SouthernCrossV2/Evac/Pod14
    name = "\improper 14 Pod"
    icon_state = "shuttle2"

/area/SouthernCrossV2/Evac/Cryogenic_Shuttle
    name = "\improper Cryogenic Shuttle"
    icon_state = "shuttle2"

/area/SouthernCrossV2/Evac/Star_Transport_Shuttle
    name = "\improper Star Transport Shuttle"
    icon_state = "shuttle2"

/area/SouthernCrossV2/Evac/Port_Transport_Shuttle
    name = "\improper Port Transport Shuttle"
    icon_state = "shuttle2"

/area/SouthernCrossV2/Evac/Medical_Shuttle
    name = "\improper Medical Shuttle"
    icon_state = "shuttle2"

/area/SouthernCrossV2/Evac/Engineering_Shuttle
    name = "\improper Engineering Shuttle"
    icon_state = "shuttle2"

//MAINTENANCE AREAS

/area/SouthernCrossV2/Maints
    icon_state = "fsmaint"
    flags = RAD_SHIELDED
    ambience = AMBIENCE_MAINTENANCE
    sound_env = SOUND_ENVIRONMENT_SEWER_PIPE

/area/SouthernCrossV2/Maints/ab_StripBar
    name = "\improper abandoned StripBar"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/ab_Medical
    name = "\improper abandoned Medical"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/ab_Surgery
    name = "\improper abandoned Surgery"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/ab_GeneralStore
    name = "\improper abandoned GeneralStore"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/ab_Kitchen
    name = "\improper abandoned Kitchen"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/ab_Hydroponics
    name = "\improper abandoned Hydroponics"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/ab_SportsField
    name = "\improper abandoned SportsField"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/ab_CardTrading
    name = "\improper abandoned CardTrading"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/ab_ChuteTrade
    name = "\improper abandoned ChuteTrade"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/ab_Theater
    name = "\improper abandoned Theater"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/ab_Pdance
    name = "\improper abandoned Pdance"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/ab_Chapel
    name = "\improper abandoned Chapel"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/ab_TeshDen
    name = "\improper abandoned TeshDen"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Market_Stall_1
    name = "\improper Market Stall 1"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Market_Stall_2
    name = "\improper Market Stall 2"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Market_Stall_3
    name = "\improper Market Stall 3"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Market_Stall_4
    name = "\improper Market Stall 4"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Market_Stall_5
    name = "\improper Market Stall 5"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Market_Stall_6
    name = "\improper Market Stall 6"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck1_Port_Corridor
    name = "\improper Deck1 Port Corridor"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck1_Star_Corridor
    name = "\improper Deck1 Star Corridor"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck1_ForPort_Corridor1
    name = "\improper Deck1 ForPort Corridor1"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck1_ForPort_Corridor2
    name = "\improper Deck1 ForPort Corridor2"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck1_ForPort_Corridor3
    name = "\improper Deck1 ForPort Corridor3"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck1_ForPort_Chamber1
    name = "\improper Deck1 ForPort Chamber1"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck1_ForStar_Corridor1
    name = "\improper Deck1 ForStar Corridor1"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck1_ForStar_Corridor2
    name = "\improper Deck1 ForStar Corridor2"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck1_ForStar_Corridor3
    name = "\improper Deck1 ForStar Corridor3"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck1_ForStar_Chamber1
    name = "\improper Deck1 ForStar Chamber1"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck1_ForStar_Chamber2
    name = "\improper Deck1 ForStar Chamber2"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck1_ForStar_Chamber3
    name = "\improper Deck1 ForStar Chamber3"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck1_AftStar1_Corridor1
    name = "\improper Deck1 AftStar1 Corridor1"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck1_AftStar1_Corridor2
    name = "\improper Deck1 AftStar1 Corridor2"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck1_AftStar1_Corridor3
    name = "\improper Deck1 AftStar1 Corridor3"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck1_AftPort_Corridor1
    name = "\improper Deck1 AftPort Corridor1"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck1_AftPort_Corridor2
    name = "\improper Deck1 AftPort Corridor2"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck1_AftPort_Corridor3
    name = "\improper Deck1 AftPort Corridor3"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck1_AftPort_Chamber1
    name = "\improper Deck1 AftPort Chamber1"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck1_AftPort_Chamber2
    name = "\improper Deck1 AftPort Chamber2"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck1_AftPort_Chamber3
    name = "\improper Deck1 AftPort Chamber3"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck1_Cargo_Corridor1
    name = "\improper Deck1 Cargo Corridor1"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck1_Cargo_Corridor2
    name = "\improper Deck1 Cargo Corridor2"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck1_Cargo_Corridor3
    name = "\improper Deck1 Cargo Corridor3"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck1_Cargo_Chamber1
    name = "\improper Deck1 Cargo Chamber1"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck1_Security_PortCorridor1
    name = "\improper Deck1 Security PortCorridor1"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck1_Security_PortCorridor2
    name = "\improper Deck1 Security PortCorridor2"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck1_Security_PortChamber1
    name = "\improper Deck1 Security PortChamber1"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck1_Security_PortChamber2
    name = "\improper Deck1 Security PortChamber2"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck1_Security_PortChamber3
    name = "\improper Deck1 Security PortChamber3"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck1_Security_StarCorridor1
    name = "\improper Deck1 Security StarCorridor1"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck1_Security_StarCorridor2
    name = "\improper Deck1 Security StarCorridor2"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck1_Security_StarCorridor3
    name = "\improper Deck1 Security StarCorridor3"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck1_Security_StarChamber1
    name = "\improper Deck1 Security StarChamber1"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck1_Security_StarChamber2
    name = "\improper Deck1 Security StarChamber2"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck1_Science_ForCorridor1
    name = "\improper Deck1 Science ForCorridor1"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck1_Science_AftCorridor1
    name = "\improper Deck1 Science AftCorridor1"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck2_For_Corridor
    name = "\improper Deck2 For Corridor"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck2_ForStar_Corridor
    name = "\improper Deck2 ForStar Corridor"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck2_Star_Corridor
    name = "\improper Deck2 Star Corridor"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck2_AftStar_Corridor
    name = "\improper Deck2 AftStar Corridor"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck2_Aft_Corridor
    name = "\improper Deck2 Aft Corridor"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck2_AftPort_Corridor
    name = "\improper Deck2 AftPort Corridor"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck2_Port_Corridor
    name = "\improper Deck2 Port Corridor"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck2_ForPort_Corridor
    name = "\improper Deck2 ForPort Corridor"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck2_Security_StarCorridor1
    name = "\improper Deck2 Security StarCorridor1"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck2_Security_AftStarCorridor1
    name = "\improper Deck2 Security AftStarCorridor1"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck2_Security_AftStarCorridor2
    name = "\improper Deck2 Security AftStarCorridor2"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck2_Security_AftPortCorridor1
    name = "\improper Deck2 Security AftPortCorridor1"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck2_Security_AftPortCorridor2
    name = "\improper Deck2 Security AftPortCorridor2"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck2_Security_ForPortCorridor1
    name = "\improper Deck2 Security ForPortCorridor1"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck2_Security_ForPortChamber1
    name = "\improper Deck2 Security ForPortChamber1"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck2_Security_ForCorridor1
    name = "\improper Deck2 Security ForCorridor1"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck2_Security_ForCorridor2
    name = "\improper Deck2 Security ForCorridor2"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck2_Security_ForCorridor3
    name = "\improper Deck2 Security ForCorridor3"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck2_Security_PortCorridor1
    name = "\improper Deck2 Security PortCorridor1"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck2_Security_ForCorridor1
    name = "\improper Deck2 Security ForCorridor1"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck2_Security_ForStar_Chamber
    name = "\improper Deck2 Security ForStar Chamber"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck2_Science_ForCorridor1
    name = "\improper Deck2 Science ForCorridor1"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck2_Science_StarCorridor1
    name = "\improper Deck2 Science StarCorridor1"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck2_Science_StarCorridor2
    name = "\improper Deck2 Science StarCorridor2"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck2_Science_StarChamber1
    name = "\improper Deck2 Science StarChamber1"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck2_Science_ForPort_Corridor
    name = "\improper Deck2 Science ForPort Corridor"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck2_Science_ForPort_Chamber
    name = "\improper Deck2 Science ForPort Chamber"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck2_Medical_AftPortChamber1
    name = "\improper Deck2 Medical AftPortChamber1"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck2_Medical_AftPortCorridor1
    name = "\improper Deck2 Medical AftPortCorridor1"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck2_Medical_AftCorridor1
    name = "\improper Deck2 Medical AftCorridor1"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck2_Medical_AftCorridor2
    name = "\improper Deck2 Medical AftCorridor2"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck2_Medical_AftStarChamber1
    name = "\improper Deck2 Medical AftStarChamber1"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck2_Civilian_ForStarCorridor1
    name = "\improper Deck2 Civilian ForStarCorridor1"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck2_Civilian_ForStarCorridor2
    name = "\improper Deck2 Civilian ForStarCorridor2"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck2_Civilian_StarCorridor1
    name = "\improper Deck2 Civilian StarCorridor1"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck2_Civilian_StarChamber1
    name = "\improper Deck2 Civilian StarChamber1"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck2_Civilian_StarChamber2
    name = "\improper Deck2 Civilian StarChamber2"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck2_Civilian_AftCorridor1
    name = "\improper Deck2 Civilian AftCorridor1"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck2_Civilian_AftPortCorridor1
    name = "\improper Deck2 Civilian AftPortCorridor1"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck2_Civilian_PortChamber1
    name = "\improper Deck2 Civilian PortChamber1"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck2_Civilian_PortChamber2
    name = "\improper Deck2 Civilian PortChamber2"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck2_Civilian_ForPortCorridor1
    name = "\improper Deck2 Civilian ForPortCorridor1"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck2_Civilian_ForPortCorridor2
    name = "\improper Deck2 Civilian ForPortCorridor2"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck2_Civilian_ForPortChamber1
    name = "\improper Deck2 Civilian ForPortChamber1"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck2_Cargo_StarChamber1
    name = "\improper Deck2 Cargo StarChamber1"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck2_Cargo_AftStarChamber1
    name = "\improper Deck2 Cargo AftStarChamber1"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck2_Cargo_AftStarCorridor1
    name = "\improper Deck2 Cargo AftStarCorridor1"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck2_Cargo_AftCorridor1
    name = "\improper Deck2 Cargo AftCorridor1"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck2_Cargo_AftCorridor2
    name = "\improper Deck2 Cargo AftCorridor2"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck2_Cargo_AftPortCorridor1
    name = "\improper Deck2 Cargo AftPortCorridor1"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck2_Engineering_PortCorridor1
    name = "\improper Deck2 Engineering PortCorridor1"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck2_Engineering_PortCorridor2
    name = "\improper Deck2 Engineering PortCorridor2"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck2_Engineering_PortChamber1
    name = "\improper Deck2 Engineering PortChamber1"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck2_Engineering_PortChamber2
    name = "\improper Deck2 Engineering PortChamber2"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck2_Engineering_ForStarChamber1
    name = "\improper Deck2 Engineering ForStarChamber1"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck2_Engineering_ForStarChamber2
    name = "\improper Deck2 Engineering ForStarChamber2"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck2_Engineering_ForStarCorridor1
    name = "\improper Deck2 Engineering ForStarCorridor1"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck3_Bridge_ForChamber1
    name = "\improper Deck3 Bridge ForChamber1"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck3_Bridge_ForStarCorridor1
    name = "\improper Deck3 Bridge ForStarCorridor1"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck3_Bridge_ForStarCorridor2
    name = "\improper Deck3 Bridge ForStarCorridor2"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck3_Bridge_ForStarCorridor3
    name = "\improper Deck3 Bridge ForStarCorridor3"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck3_Bridge_ForStarChamber1
    name = "\improper Deck3 Bridge ForStarChamber1"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck3_Bridge_AftStarCorridor1
    name = "\improper Deck3 Bridge AftStarCorridor1"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck3_Bridge_AftPortCorridor1
    name = "\improper Deck3 Bridge AftPortCorridor1"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck3_Bridge_ForStarCorridor1
    name = "\improper Deck3 Bridge ForStarCorridor1"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck3_Bridge_ForStarCorridor2
    name = "\improper Deck3 Bridge ForStarCorridor2"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck3_Bridge_ForStarCorridor3
    name = "\improper Deck3 Bridge ForStarCorridor3"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck3_Bridge_ForPort_Chamber1
    name = "\improper Deck3 Bridge ForPort Chamber1"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck3_Bridge_ForPort_Corridor1
    name = "\improper Deck3 Bridge ForPort Corridor1"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck3_Bridge_ForPort_Corridor2
    name = "\improper Deck3 Bridge ForPort Corridor2"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck3_Medical_ForChamber1
    name = "\improper Deck3 Medical ForChamber1"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck3_Medical_ForChamber2
    name = "\improper Deck3 Medical ForChamber2"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck3_Medical_ForChamber3
    name = "\improper Deck3 Medical ForChamber3"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck3_Medical_ForStarChamber1
    name = "\improper Deck3 Medical ForStarChamber1"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck3_Medical_ForStarChamber2
    name = "\improper Deck3 Medical ForStarChamber2"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck3_Medical_ForStarChamber3
    name = "\improper Deck3 Medical ForStarChamber3"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck3_Medical_StarCorridor1
    name = "\improper Deck3 Medical StarCorridor1"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck3_Medical_AftStarChamber1
    name = "\improper Deck3 Medical AftStarChamber1"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck3_Medical_AftCorridor1
    name = "\improper Deck3 Medical AftCorridor1"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck3_Medical_AftCorridor2
    name = "\improper Deck3 Medical AftCorridor2"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck3_Medical_AftPortCorridor1
    name = "\improper Deck3 Medical AftPortCorridor1"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck3_Medical_AftPortChamber1
    name = "\improper Deck3 Medical AftPortChamber1"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck3_Medical_AftPortChamber2
    name = "\improper Deck3 Medical AftPortChamber2"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck3_Medical_PortChamber1
    name = "\improper Deck3 Medical PortChamber1"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck3_Medical_PortChamber2
    name = "\improper Deck3 Medical PortChamber2"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck3_Medical_ForPortChamber1
    name = "\improper Deck3 Medical ForPortChamber1"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck3_Medical_ForPortChamber2
    name = "\improper Deck3 Medical ForPortChamber2"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck3_Dorms_ForCorridor1
    name = "\improper Deck3 Dorms ForCorridor1"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck3_Dorms_ForStarChamber1
    name = "\improper Deck3 Dorms ForStarChamber1"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck3_Dorms_ForStarChamber2
    name = "\improper Deck3 Dorms ForStarChamber2"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck3_Dorms_StarCorridor1
    name = "\improper Deck3 Dorms StarCorridor1"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck3_Dorms_StarCorridor2
    name = "\improper Deck3 Dorms StarCorridor2"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck3_Dorms_StarChamber1
    name = "\improper Deck3 Dorms StarChamber1"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck3_Dorms_StarChamber2
    name = "\improper Deck3 Dorms StarChamber2"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck3_Dorms_AftCorridor1
    name = "\improper Deck3 Dorms AftCorridor1"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck3_Dorms_AftCorridor2
    name = "\improper Deck3 Dorms AftCorridor2"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck3_Dorms_AftPortChamber1
    name = "\improper Deck3 Dorms AftPortChamber1"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck3_Dorms_AftPortChamber2
    name = "\improper Deck3 Dorms AftPortChamber2"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck3_Dorms_PortCorridor1
    name = "\improper Deck3 Dorms PortCorridor1"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck3_Dorms_PortChamber1
    name = "\improper Deck3 Dorms PortChamber1"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck3_Dorms_ForStarChamber1
    name = "\improper Deck3 Dorms ForStarChamber1"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck3_Dorms_ForStarChamber2
    name = "\improper Deck3 Dorms ForStarChamber2"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck3_Dorms_ForPort_Corridor1
    name = "\improper Deck3 Dorms ForPort Corridor1"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck3_Dorms_ForPort_Chamber1
    name = "\improper Deck3 Dorms ForPort Chamber1"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck3_Engineering_ForCorridor1
    name = "\improper Deck3 Engineering ForCorridor1"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck3_Engineering_ForStarChamber1
    name = "\improper Deck3 Engineering ForStarChamber1"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck3_Engineering_ForStarChamber2
    name = "\improper Deck3 Engineering ForStarChamber2"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck3_Engineering_StarChamber1
    name = "\improper Deck3 Engineering StarChamber1"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck3_Engineering_AftStarCorridor1
    name = "\improper Deck3 Engineering AftStarCorridor1"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck3_Engineering_AftStarCorridor2
    name = "\improper Deck3 Engineering AftStarCorridor2"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck3_Engineering_AftStarChamber1
    name = "\improper Deck3 Engineering AftStarChamber1"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck3_Engineering_AftStarChamber2
    name = "\improper Deck3 Engineering AftStarChamber2"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck3_Engineering_AftStarChamber3
    name = "\improper Deck3 Engineering AftStarChamber3"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck3_Center_Star
    name = "\improper Deck3 Center Star"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Deck3_Center_Port
    name = "\improper Deck3 Center Port"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Distro_Central
    name = "\improper Distro Central"
    icon_state = "engineering"
    ambience = AMBIENCE_ATMOS

/area/SouthernCrossV2/Maints/Distro_Harbor
    name = "\improper Distro Harbor"
    icon_state = "engineering"
    ambience = AMBIENCE_ATMOS

/area/SouthernCrossV2/Maints/Distro_Civilian
    name = "\improper Distro Civilian"
    icon_state = "engineering"
    ambience = AMBIENCE_ATMOS

/area/SouthernCrossV2/Maints/Research_Substation
    name = "\improper Research Substation"
    icon_state = "engineering"
    ambience = AMBIENCE_SUBSTATION
    lightswitch = 1

/area/SouthernCrossV2/Maints/Medical_Substation
    name = "\improper Medical Substation"
    icon_state = "engineering"
    ambience = AMBIENCE_SUBSTATION
    lightswitch = 1

/area/SouthernCrossV2/Maints/Dorms_Substation
    name = "\improper Dorms Substation"
    icon_state = "engineering"
    ambience = AMBIENCE_SUBSTATION
    lightswitch = 1

/area/SouthernCrossV2/Maints/Domicile_Substation
    name = "\improper Domicile Substation"
    icon_state = "engineering"
    ambience = AMBIENCE_SUBSTATION
    lightswitch = 1

/area/SouthernCrossV2/Maints/Harbor_Substation
    name = "\improper Harbor Substation"
    icon_state = "engineering"
    ambience = AMBIENCE_SUBSTATION
    lightswitch = 1

/area/SouthernCrossV2/Maints/Telecomms_Substation
    name = "\improper Telecomms Substation"
    icon_state = "engineering"
    ambience = AMBIENCE_SUBSTATION
    lightswitch = 1

/area/SouthernCrossV2/Maints/Security_Substation
    name = "\improper Security Substation"
    icon_state = "engineering"
    ambience = AMBIENCE_SUBSTATION
    lightswitch = 1

/area/SouthernCrossV2/Maints/Bridge_Substation
    name = "\improper Bridge Substation"
    icon_state = "engineering"
    ambience = AMBIENCE_SUBSTATION
    lightswitch = 1

/area/SouthernCrossV2/Maints/AI_Substation
    name = "\improper AI Substation"
    icon_state = "engineering"
    ambience = AMBIENCE_SUBSTATION
    lightswitch = 1

/area/SouthernCrossV2/Maints/Cargo_Substation
    name = "\improper Cargo Substation"
    icon_state = "engineering"
    ambience = AMBIENCE_SUBSTATION
    lightswitch = 1

/area/SouthernCrossV2/Maints/Engineering_Substation
    name = "\improper Engineering Substation"
    icon_state = "engineering"
    ambience = AMBIENCE_SUBSTATION
    lightswitch = 1

//Temp Testing areas
/area/SouthernCrossV2/Maints/Room_01
    name = "\improper Room 01"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Room_02
    name = "\improper Room 02"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Room_03
    name = "\improper Room 03"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Room_04
    name = "\improper Room 04"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Room_05
    name = "\improper Room 05"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Room_06
    name = "\improper Room 06"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Room_07
    name = "\improper Room 07"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Room_08
    name = "\improper Room 08"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Room_09
    name = "\improper Room 09"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Room_10
    name = "\improper Room 10"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Room_11
    name = "\improper Room 11"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Room_12
    name = "\improper Room 12"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Room_13
    name = "\improper Room 13"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Room_14
    name = "\improper Room 14"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Room_15
    name = "\improper Room 15"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Room_16
    name = "\improper Room 16"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Room_17
    name = "\improper Room 17"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Room_18
    name = "\improper Room 18"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Room_19
    name = "\improper Room 19"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Room_20
    name = "\improper Room 20"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Room_21
    name = "\improper Room 21"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Room_22
    name = "\improper Room 22"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Room_23
    name = "\improper Room 23"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Room_24
    name = "\improper Room 24"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Room_25
    name = "\improper Room 25"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Room_26
    name = "\improper Room 26"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Room_27
    name = "\improper Room 27"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Room_28
    name = "\improper Room 28"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Room_29
    name = "\improper Room 29"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Room_30
    name = "\improper Room 30"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Room_31
    name = "\improper Room 31"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Room_32
    name = "\improper Room 32"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Room_33
    name = "\improper Room 33"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Room_34
    name = "\improper Room 34"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Room_35
    name = "\improper Room 35"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Room_36
    name = "\improper Room 36"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Room_37
    name = "\improper Room 37"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Room_38
    name = "\improper Room 38"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Room_39
    name = "\improper Room 39"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Room_40
    name = "\improper Room 40"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Room_41
    name = "\improper Room 41"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Room_42
    name = "\improper Room 42"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Room_43
    name = "\improper Room 43"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Room_44
    name = "\improper Room 44"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Room_45
    name = "\improper Room 45"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Room_46
    name = "\improper Room 46"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Room_47
    name = "\improper Room 47"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Room_48
    name = "\improper Room 48"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Room_49
    name = "\improper Room 49"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Room_50
    name = "\improper Room 50"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Room_51
    name = "\improper Room 51"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Room_52
    name = "\improper Room 52"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Room_53
    name = "\improper Room 53"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Room_54
    name = "\improper Room 54"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Room_55
    name = "\improper Room 55"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Room_56
    name = "\improper Room 56"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Room_57
    name = "\improper Room 57"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Room_58
    name = "\improper Room 58"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Room_59
    name = "\improper Room 59"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Room_60
    name = "\improper Room 60"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Room_61
    name = "\improper Room 61"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Room_62
    name = "\improper Room 62"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Room_63
    name = "\improper Room 63"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Room_64
    name = "\improper Room 64"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Room_65
    name = "\improper Room 65"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Room_66
    name = "\improper Room 66"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Room_67
    name = "\improper Room 67"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Room_68
    name = "\improper Room 68"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Room_69
    name = "\improper Room 69"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Room_70
    name = "\improper Room 70"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Room_71
    name = "\improper Room 71"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Room_72
    name = "\improper Room 72"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Room_73
    name = "\improper Room 73"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Room_74
    name = "\improper Room 74"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Room_75
    name = "\improper Room 75"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Room_76
    name = "\improper Room 76"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Room_77
    name = "\improper Room 77"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Room_78
    name = "\improper Room 78"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Room_79
    name = "\improper Room 79"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Room_80
    name = "\improper Room 80"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Room_81
    name = "\improper Room 81"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Room_82
    name = "\improper Room 82"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Room_83
    name = "\improper Room 83"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Room_84
    name = "\improper Room 84"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Room_85
    name = "\improper Room 85"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Room_86
    name = "\improper Room 86"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Room_87
    name = "\improper Room 87"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Room_88
    name = "\improper Room 88"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Room_89
    name = "\improper Room 89"
    icon_state = "fsmaint"

/area/SouthernCrossV2/Maints/Room_90
    name = "\improper Room 90"
    icon_state = "fsmaint"
