
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

//Turbolift

/area/turbolift
	name = "\improper Turbolift"
	icon_state = "shuttle"
	requires_power = 0
	dynamic_lighting = 1

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

/area/maintenance/firstdeck
	name = "First Deck Maintenance"
	icon_state = "maintcentral"

/area/maintenance/firstdeck/centralstarboard
	name = "First Deck Starboard Maintenance"
	icon_state = "smaint"

/area/maintenance/firstdeck/centralport
	name = "First Deck Port Maintenance"
	icon_state = "pmaint"

/area/hallway/primary/firstdeck/elevator
	name = "\improper First Deck Central Elevator Access"
	icon_state = "hallC"

/area/rnd/xenobiology/xenoflora_isolation
	name = "\improper Xenoflora Isolation"
	icon_state = "xeno_f_store"

/area/crew_quarters/heads/sc/sd
	name = "\improper Command - Station Director's Office"
	icon_state = "captain"
	sound_env = MEDIUM_SOFTFLOOR
	holomap_color = HOLOMAP_AREACOLOR_COMMAND
// Shuttles

//NT response shuttle

/area/shuttle/response_ship
	name = "\improper Response Team Ship"
	icon_state = "shuttlered"
	requires_power = 0
	flags = RAD_SHIELDED
	ambience = AMBIENCE_HIGHSEC

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

/area/expoutpost/starbowhallway
	name = "\improper Starboard Bow Hallway"

/area/expoutpost/suite1
	name = "\improper Suite One"

/area/expoutpost/suite2
	name = "\improper Suite Two"

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

//BRIDGE AREAS

/area/bridge
	icon_state = "bridge"
	holomap_color = HOLOMAP_AREACOLOR_COMMAND
	ambience = AMBIENCE_ARRIVALS
	sound_env = LARGE_ENCLOSED
	lightswitch = 0

/area/bridge/HoP_Office
	name = "\improper HoP Office"
	icon_state = "bridge"

/area/bridge/AI_Core_Chamber
	name = "\improper AI Core Chamber"
	icon_state = "bridge"
	sound_env = AMBIENCE_AI

/area/bridge/AI_Upload_Hall
	name = "\improper AI Upload Hall"
	icon_state = "bridge"
	sound_env = AMBIENCE_AI

/area/bridge/Cyborg_Station
	name = "\improper Cyborg Station"
	icon_state = "bridge"
	sound_env = AMBIENCE_AI

/area/bridge/Server_Room
	name = "\improper Server Room"
	icon_state = "bridge"
	sound_env = AMBIENCE_AI

/area/bridge/Deck3_Corridor
	name = "\improper 3 Deck Corridor"
	icon_state = "bridge"
	lightswitch = 1

/area/bridge/sleep
	icon_state = "bridge"
	flags = RAD_SHIELDED | AREA_ALLOW_LARGE_SIZE | AREA_BLOCK_SUIT_SENSORS | AREA_BLOCK_TRACKING | AREA_SOUNDPROOF | AREA_FORBID_EVENTS

/area/bridge/sleep/HoP_Quarters
	name = "\improper HoP Quarters"

/area/bridge/sleep/CE_Quarters
	name = "\improper CE Quarters"

/area/bridge/sleep/CMO_Quarters
	name = "\improper CMO Quarters"
/area/bridge/sleep/RD_Quarters
	name = "\improper RD Quarters"

/area/bridge/sleep/HoS_Quarters
	name = "\improper HoS Quarters"

/area/bridge/sleep/Secretary_Quarters
	name = "\improper Secretary Quarters"

/area/bridge/sleep/Captain_Quarters
	name = "\improper Captain Quarters"

/area/bridge/Leisure_Room
	name = "\improper Leisure Room"
	icon_state = "bridge"

/area/bridge/Breakroom
	name = "\improper Breakroom"
	icon_state = "bridge"

/area/bridge/Control_Atrium
	name = "\improper Control Atrium"
	icon_state = "bridge"

/area/bridge/Captain_Office
	name = "\improper Captain Office"
	icon_state = "bridge"

/area/bridge/Conference_Room
	name = "\improper Conference Room"
	icon_state = "bridge"

/area/bridge/Embassy
	name = "\improper Embassy"
	icon_state = "bridge"

/area/bridge/Firstaid_Post
	name = "\improper FirstAid Post"
	icon_state = "bridge"

/area/bridge/Vault_Reception
	name = "\improper Vault Reception"
	icon_state = "bridge"

/area/bridge/Vault
	name = "\improper Vault"
	icon_state = "bridge"

//SECURITY AREAS

/area/security
	icon_state = "security"
	holomap_color = HOLOMAP_AREACOLOR_SECURITY
	ambience = AMBIENCE_HIGHSEC
	sound_env = STANDARD_STATION
	lightswitch = 0

/area/security/Aft_Security_Post
	name = "\improper Aft Security Post"
	icon_state = "security"

/area/security/Reception
	name = "\improper Reception"
	icon_state = "security"

/area/security/Deck2_1_Corridor
	name = "\improper 2 Deck 1 Corridor"
	icon_state = "security"

/area/security/Deck2_2_Corridor
	name = "\improper 2 Deck 2 Corridor"
	icon_state = "security"

/area/security/Forensics_Office
	name = "\improper Forensics Office"
	icon_state = "security"

/area/security/Internal_Affairs_Office
	name = "\improper Internal Affairs Office"
	icon_state = "security"

/area/security/HoS_Office
	name = "\improper HoS Office"
	icon_state = "security"

/area/security/Wardens_Office
	name = "\improper Wardens Office"
	icon_state = "security"

/area/security/Equipment_Storage
	name = "\improper Equipment Storage"
	icon_state = "security"

/area/security/Restroom
	name = "\improper Restroom"
	icon_state = "security"
	lightswitch = 1

/area/security/Lobby
	name = "\improper Lobby"
	icon_state = "security"

/area/security/Boardroom
	name = "\improper Boardroom"
	icon_state = "security"

/area/security/Locker_Room
	name = "\improper Locker Room"
	icon_state = "security"

/area/security/Firing_Range
	name = "\improper Firing Range"
	icon_state = "security"

/area/security/Storage_Room
	name = "\improper Storage Room"
	icon_state = "security"

/area/security/Shuttlebay_Storage
	name = "\improper Shuttlebay Storage"
	icon_state = "security"

/area/security/Processing_Room
	name = "\improper Processing Room"
	icon_state = "security"

/area/security/Evidence_Storage
	name = "\improper Evidence Storage"
	icon_state = "security"

/area/security/Armory
	name = "\improper Armory"
	icon_state = "security"

/area/security/Brig
	name = "\improper Brig"
	icon_state = "security"

/area/security/Prison_Wing
	name = "\improper Prison Wing"
	icon_state = "security"

/area/security/Visitation_Room
	name = "\improper Visitation Room"
	icon_state = "security"

/area/security/Quantum_Pad_Checkpoint
	name = "\improper Quantum Pad Checkpoint"
	icon_state = "security"
	lightswitch = 1

/area/security/Quantum_Pad_Storage
	name = "\improper Quantum Pad Storage"
	icon_state = "security"

/area/security/Exploration_Ship_Bay
	name = "\improper Exploration Ship Bay"
	icon_state = "security"
	ambience = AMBIENCE_HANGAR

/area/security/Exploration_Sling_Shuttle
	name = "\improper Station Shuttle to Exploration Carrier"
	icon_state = "security"
	ambience = AMBIENCE_HANGAR

/area/security/Transit_Turrets
	name = "\improper Transit Turrets"
	icon_state = "security"

//MEDICAL AREAS

/area/medical
	icon_state = "medbay"
	holomap_color = HOLOMAP_AREACOLOR_MEDICAL
	ambience = AMBIENCE_GENERIC
	sound_env = STANDARD_STATION
	lightswitch = 0

/area/medical/For_Medical_Post
	name = "\improper For Medical Post"
	icon_state = "medbay"

/area/medical/Aft_Medical_Post
	name = "\improper Aft Medical Post"
	icon_state = "medbay"

/area/medical/Port_Medical_Post
	name = "\improper Port Medical Post"
	icon_state = "medbay"

/area/medical/EMT_Bay
	name = "\improper EMT Bay"
	icon_state = "medbay"

/area/medical/Reception
	name = "\improper Reception"
	icon_state = "medbay"

/area/medical/FirstAid_Storage
	name = "\improper FirstAid Storage"
	icon_state = "medbay"

/area/medical/Chemistry
	name = "\improper Chemistry"
	icon_state = "medbay"

/area/medical/Distillery
	name = "\improper Distillery"
	icon_state = "medbay"

/area/medical/Treatment_Hall
	name = "\improper Treatment Hall"
	icon_state = "medbay"

/area/medical/Surgery_Viewing
	name = "\improper Surgery Viewing"
	icon_state = "medbay"

/area/medical/Surgery_Room_1
	name = "\improper Surgery Room 1"
	icon_state = "medbay"

/area/medical/Surgery_Room_2
	name = "\improper Surgery Room 2"
	icon_state = "medbay"

/area/medical/Deck2_Evac_Corridor
	name = "\improper 2 Deck Evac Corridor"
	icon_state = "medbay"

/area/medical/Deck2_Corridor
	name = "\improper 2 Deck Corridor"
	icon_state = "medbay"

/area/medical/Patient_Ward
	name = "\improper Patient Ward"
	icon_state = "medbay"

/area/medical/Dressing_Room
	name = "\improper Dressing Room"
	icon_state = "medbay"

/area/medical/Locker_Room
	name = "\improper Locker Room"
	icon_state = "medbay"

/area/medical/CMO_Office
	name = "\improper CMO Office"
	icon_state = "medbay"

/area/medical/Stairwell
	name = "\improper Stairwell"
	icon_state = "medbay"

/area/medical/Morgue
	name = "\improper Morgue"
	icon_state = "medbay"
	ambience = AMBIENCE_GHOSTLY

/area/medical/Resleeving
	name = "\improper Resleeving"
	icon_state = "medbay"

/area/medical/Lounge
	name = "\improper Lounge"
	icon_state = "medbay"

/area/medical/Patient_1
	name = "\improper Patient 1"
	icon_state = "medbay"

/area/medical/Patient_2
	name = "\improper Patient 2"
	icon_state = "medbay"

/area/medical/Patient_3
	name = "\improper Patient 3"
	icon_state = "medbay"

/area/medical/Patient_4
	name = "\improper Patient 4"
	icon_state = "medbay"

/area/medical/Psych_Room_1
	name = "\improper Psych Room 1"
	icon_state = "medbay"

/area/medical/Psych_Room_2
	name = "\improper Psych Room 2"
	icon_state = "medbay"

/area/medical/Virology
	name = "\improper Virology"
	icon_state = "medbay"

/area/medical/Genetics_Lab
	name = "\improper Genetics Lab"
	icon_state = "medbay"

/area/medical/Surgery_Storage
	name = "\improper Surgery Storage"
	icon_state = "medbay"

/area/medical/Deck3_Corridor
	name = "\improper 3 Deck Corridor"
	icon_state = "medbay"

/area/medical/Autoresleeving
	name = "\improper Autoresleeving"
	icon_state = "medbay"
	ambience = AMBIENCE_GHOSTLY

/area/medical/Restrooms
	name = "\improper Restrooms"
	icon_state = "medbay"
	lightswitch = 1

//SCIENCE AREAS

/area/rnd
	icon_state = "research"
	holomap_color = HOLOMAP_AREACOLOR_SCIENCE
	ambience = AMBIENCE_ENGINEERING
	sound_env = LARGE_SOFTFLOOR
	lightswitch = 0

/area/rnd/Research_Lab
	name = "\improper Research Lab"
	icon_state = "research"

/area/rnd/Robotics_Lab
	name = "\improper Robotics Lab"
	icon_state = "research"

/area/rnd/Mech_Bay
	name = "\improper Mech Bay"
	icon_state = "research"

/area/rnd/Locker_Room
	name = "\improper Locker Room"
	icon_state = "research"

/area/rnd/Server_Room
	name = "\improper Server Room"
	icon_state = "research"

/area/rnd/Circuitry_Den
	name = "\improper Circuitry Den"
	icon_state = "research"

/area/rnd/Testing_Lab
	name = "\improper Testing Lab"
	icon_state = "research"

/area/rnd/Toxins_Storage
	name = "\improper Toxins Storage"
	icon_state = "research"

/area/rnd/Toxins_Mixing_Room
	name = "\improper Toxins Mixing Room"
	icon_state = "research"

/area/rnd/Toxins_Viewing_Port
	name = "\improper Toxins Viewing Port"
	icon_state = "research"

/area/rnd/RD_Office
	name = "\improper RD Office"
	icon_state = "research"

/area/rnd/Observation_Hall
	name = "\improper Observation Hall"
	icon_state = "research"

/area/rnd/PA_Chamber
	name = "\improper PA Chamber"
	icon_state = "research"

/area/rnd/Research_Ship_Bay
	name = "\improper Research Ship Bay"
	icon_state = "research"
	ambience = AMBIENCE_HANGAR

/area/rnd/Xenobiology_Lab
	name = "\improper Xenobiology Lab"
	icon_state = "research"

/area/rnd/Xenobotany_Lab
	name = "\improper Xenobotany Lab"
	icon_state = "research"

/area/rnd/Xenobotany_Isolation_Chamber
	name = "\improper Xenobotany Isolation Chamber"
	icon_state = "research"

/area/rnd/Testing_Chamber
	name = "\improper Testing Chamber"
	icon_state = "research"

/area/rnd/PA_Access
	name = "\improper Testing PA Access"
	icon_state = "research"

/area/rnd/Deck2_Corridor
	name = "\improper 2 Deck Corridor"
	icon_state = "research"


//ENGINEERING AREAS

/area/engineering
	icon_state = "engineering"
	holomap_color = HOLOMAP_AREACOLOR_ENGINEERING
	ambience = AMBIENCE_ENGINEERING
	sound_env = LARGE_ENCLOSED
	lightswitch = 0

/area/engineering/Central_Engineering_Post
	name = "\improper Central Engineering Post"
	icon_state = "engineering"
	lightswitch = 1

/area/engineering/GravGen_Room
	name = "\improper GravGen Room"
	icon_state = "engineering"

/area/engineering/Telecomms_Foyer
	name = "\improper Telecomms Foyer"
	icon_state = "engineering"
	ambience = AMBIENCE_AI

/area/engineering/Telecomms_Control_Room
	name = "\improper Telecomms Control Room"
	icon_state = "engineering"
	ambience = AMBIENCE_AI

/area/engineering/Telecomms_Network
	name = "\improper Telecomms Network"
	icon_state = "engineering"
	ambience = AMBIENCE_AI
	lightswitch = 1

/area/engineering/Reception
	name = "\improper Reception"
	icon_state = "engineering"

/area/engineering/Engineering_EVA
	name = "\improper Engineering EVA"
	icon_state = "engineering"

/area/engineering/Locker_Room
	name = "\improper Locker Room"
	icon_state = "engineering"

/area/engineering/Engineering_Workshop
	name = "\improper Engineering Workshop"
	icon_state = "engineering"

/area/engineering/Deck2_1_Corridor
	name = "\improper 2 Deck 1 Corridor"
	icon_state = "engineering"

/area/engineering/Deck2_2_Corridor
	name = "\improper 2 Deck 2 Corridor"
	icon_state = "engineering"

/area/engineering/Deck2_Evac_Corridor
	name = "\improper 2 Deck Evac Corridor"
	icon_state = "engineering"

/area/engineering/Storage
	name = "\improper Storage"
	icon_state = "engineering"

/area/engineering/Drone_Fab
	name = "\improper Drone Fab"
	icon_state = "engineering"

/area/engineering/Canister_Storage
	name = "\improper Canister Storage"
	icon_state = "engineering"

/area/engineering/Mech_Bay
	name = "\improper Mech Bay"
	icon_state = "engineering"

/area/engineering/Technical_Storage
	name = "\improper Technical Storage"
	icon_state = "engineering"

/area/engineering/CE_Office
	name = "\improper CE Office"
	icon_state = "engineering"

/area/engineering/Deck3_1_Corridor
	name = "\improper 3 Deck 1 Corridor"
	icon_state = "engineering"

/area/engineering/Deck3_2_Corridor
	name = "\improper 3 Deck 2 Corridor"
	icon_state = "engineering"

/area/engineering/Atmospherics_Chamber
	name = "\improper Atmospherics Chamber"
	icon_state = "engineering"
	ambience = AMBIENCE_ATMOS

/area/engineering/Atmospherics_Control_Room
	name = "\improper Atmospherics Control Room"
	icon_state = "engineering"

/area/engineering/Atmospherics_Substation
	name = "\improper Atmospherics Substation"
	icon_state = "engineering"

/area/engineering/Engine1_Chamber
	name = "\improper 1 Engine Chamber"
	icon_state = "engineering"

/area/engineering/Engine1_Control_Room
	name = "\improper 1 Engine Control Room"
	icon_state = "engineering"

/area/engineering/Engine1_Access_Hall
	name = "\improper 1 Engine Access Hall"
	icon_state = "engineering"

/area/engineering/Engine1_Substation
	name = "\improper 1 Engine Substation"
	icon_state = "engineering"

/area/engineering/Engine2_Chamber
	name = "\improper 2 Engine Chamber"
	icon_state = "engineering"

/area/engineering/Engine3_Control_Room
	name = "\improper 2 Engine Control Room"
	icon_state = "engineering"

/area/engineering/Engine2_Access_Hall
	name = "\improper 2 Engine Access Hall"
	icon_state = "engineering"

/area/engineering/Engine2_Substation
	name = "\improper 2 Engine Substation"
	icon_state = "engineering"

/area/engineering/Engine2_Canister_Storage
	name = "\improper 2 Engine Canister Storage"
	icon_state = "engineering"

/area/engineering/Engine2_Waste_Handling
	name = "\improper 2 Engine Waste Handling"
	icon_state = "engineering"

/area/engineering/Construction_Area
	name = "\improper Construction Area"
	icon_state = "engineering"

/area/engineering/Airlock_Access
	name = "\improper Airlock Access"
	icon_state = "engineering"

/area/engineering/Engine_Tech_Storage
	name = "\improper Engine Tech Storage"
	icon_state = "engineering"

/area/engineering/Breakroom
	name = "\improper Engineering Breakroom"
	icon_state = "engineering"

/area/engineering/Solar_Control_ForPort
	name = "\improper Solar Control ForPort"
	icon_state = "engineering"
	ambience = AMBIENCE_SPACE

/area/engineering/Solar_Control_ForStar
	name = "\improper Solar Control ForStar"
	icon_state = "engineering"
	ambience = AMBIENCE_SPACE

/area/engineering/Solar_Control_AftPort
	name = "\improper Solar Control AftPort"
	icon_state = "engineering"
	ambience = AMBIENCE_SPACE

/area/engineering/Solar_Control_AftStar
	name = "\improper Solar Control AftStar"
	icon_state = "engineering"
	ambience = AMBIENCE_SPACE

/area/engineering/Solar_Array_ForPort
	name = "\improper Solar Array ForPort"
	icon_state = "engineering"
	ambience = AMBIENCE_SPACE
	dynamic_lighting = 0

/area/engineering/Solar_Array_ForStar
	name = "\improper Solar Array ForStar"
	icon_state = "engineering"
	ambience = AMBIENCE_SPACE
	dynamic_lighting = 0

/area/engineering/Solar_Array_AftPort
	name = "\improper Solar Array AftPort"
	icon_state = "engineering"
	ambience = AMBIENCE_SPACE
	dynamic_lighting = 0

/area/engineering/Solar_Array_AftStar
	name = "\improper Solar Array AftStar"
	icon_state = "engineering"
	ambience = AMBIENCE_SPACE
	dynamic_lighting = 0

//CARGO AREAS

/area/quartermaster
	icon_state = "quart"
	holomap_color = HOLOMAP_AREACOLOR_CARGO
	ambience = AMBIENCE_HANGAR
	sound_env = SOUND_ENVIRONMENT_HANGAR
	lightswitch = 0

/area/quartermaster/For_Tool_Storage
	name = "\improper For Tool Storage"
	icon_state = "quart"

/area/quartermaster/Star_Tool_Storage
	name = "\improper Star Tool Storage"
	icon_state = "quart"

/area/quartermaster/Aft_Tool_Storage
	name = "\improper Aft Tool Storage"
	icon_state = "quart"

/area/quartermaster/Reception
	name = "\improper Reception"
	icon_state = "quart"

/area/quartermaster/Packaging_Room
	name = "\improper Packaging Room"
	icon_state = "quart"

/area/quartermaster/Recycling
	name = "\improper Recycling"
	icon_state = "quart"

/area/quartermaster/Warehouse
	name = "\improper Warehouse"
	icon_state = "quart"

/area/quartermaster/Deck2_Stairwell
	name = "\improper 2 Deck Stairwell"
	icon_state = "quart"

/area/quartermaster/Deck1_Stairwell
	name = "\improper 1 Deck Stairwell"
	icon_state = "quart"

/area/quartermaster/Supply_Ship_Bay
	name = "\improper Supply Ship Bay"
	icon_state = "quart"
	ambience = AMBIENCE_HANGAR

/area/quartermaster/Depot1
	name = "\improper 1 Depot"
	icon_state = "quart"

/area/quartermaster/Depot2
	name = "\improper 2 Depot"
	icon_state = "quart"

/area/quartermaster/Mining_Ship_Bay
	name = "\improper Mining Ship Bay"
	icon_state = "quart"
	ambience = AMBIENCE_HANGAR

/area/quartermaster/Mining_EVA
	name = "\improper Mail Room"
	icon_state = "quart"

/area/quartermaster/Waste_Disposals
	name = "\improper Waste Disposals"
	icon_state = "quart"

/area/quartermaster/QM_Office
	name = "\improper QM Office"
	icon_state = "quart"

/area/quartermaster/Mail_Room
	name = "\improper Mail Room"
	icon_state = "quart"

/area/quartermaster/Deck1_Corridor
	name = "\improper Mail Room"
	icon_state = "quart"

/area/quartermaster/Breakroom
	name = "\improper Cargo Breakroom"
	icon_state = "quart"

//DOMICILE AREAS

/area/crew_quarters
	icon_state = "gaming"
	ambience = AMBIENCE_GENERIC
	sound_env = SOUND_ENVIRONMENT_HALLWAY
	lightswitch = 0

/area/crew_quarters/Holodeck
	name = "\improper Holodeck"
	icon_state = "gaming"

/area/crew_quarters/Midnight_Bar
	name = "\improper Midnight Bar"
	icon_state = "gaming"
	flags = RAD_SHIELDED | AREA_FORBID_EVENTS | AREA_FORBID_SINGULO | AREA_ALLOW_CLOCKOUT

/area/crew_quarters/Midnight_Kitchen
	name = "\improper Midnight Kitchen"
	icon_state = "gaming"
	flags = RAD_SHIELDED | AREA_FORBID_EVENTS | AREA_FORBID_SINGULO | AREA_ALLOW_CLOCKOUT

/area/crew_quarters/Gallery
	name = "\improper Gallery"
	icon_state = "gaming"

/area/crew_quarters/VR
	name = "\improper VR"
	icon_state = "gaming"

/area/crew_quarters/Gym
	name = "\improper Gym"
	icon_state = "gaming"

/area/crew_quarters/Gym_Sauna
	name = "\improper Gym Sauna"
	icon_state = "gaming"

/area/crew_quarters/Chapel_Lobby
	name = "\improper Chapel Lobby"
	icon_state = "gaming"
	ambience = AMBIENCE_CHAPEL

/area/crew_quarters/Chapel_Morgue
	name = "\improper Chapel Morgue"
	icon_state = "gaming"
	ambience = AMBIENCE_CHAPEL

/area/crew_quarters/Chapel_Office
	name = "\improper Chapel Office"
	icon_state = "gaming"
	ambience = AMBIENCE_CHAPEL

/area/crew_quarters/Central_Restroom
	name = "\improper Central Restroom"
	icon_state = "gaming"
	flags = RAD_SHIELDED | AREA_FORBID_EVENTS | AREA_FORBID_SINGULO | AREA_ALLOW_CLOCKOUT
	lightswitch = 1

/area/crew_quarters/For_Restroom
	name = "\improper For Restroom"
	icon_state = "gaming"
	flags = RAD_SHIELDED | AREA_FORBID_EVENTS | AREA_FORBID_SINGULO | AREA_ALLOW_CLOCKOUT
	lightswitch = 1

/area/crew_quarters/Star_Restroom
	name = "\improper Star Restroom"
	icon_state = "gaming"
	flags = RAD_SHIELDED | AREA_FORBID_EVENTS | AREA_FORBID_SINGULO | AREA_ALLOW_CLOCKOUT
	lightswitch = 1

/area/crew_quarters/Aft_Restroom
	name = "\improper Aft Restroom"
	icon_state = "gaming"
	flags = RAD_SHIELDED | AREA_FORBID_EVENTS | AREA_FORBID_SINGULO | AREA_ALLOW_CLOCKOUT
	lightswitch = 1

/area/crew_quarters/Port_Restroom
	name = "\improper Port Restroom"
	icon_state = "gaming"
	flags = RAD_SHIELDED | AREA_FORBID_EVENTS | AREA_FORBID_SINGULO | AREA_ALLOW_CLOCKOUT
	lightswitch = 1

/area/crew_quarters/Library
	name = "\improper Library"
	icon_state = "gaming"
	ambience = AMBIENCE_SPACE

/area/crew_quarters/Library_Cafe
	name = "\improper Library Cafe"
	icon_state = "gaming"
	ambience = AMBIENCE_SPACE

/area/crew_quarters/Library_Office
	name = "\improper Library Office"
	icon_state = "gaming"
	ambience = AMBIENCE_SPACE

/area/crew_quarters/Rec_Lounge
	name = "\improper Rec Lounge"
	icon_state = "gaming"

/area/crew_quarters/Office_Lounge
	name = "\improper Office Lounge"
	icon_state = "gaming"

/area/crew_quarters/Chomp_Hydroponics
	name = "\improper Chomp Hydroponics"
	icon_state = "gaming"
	flags = RAD_SHIELDED | AREA_FORBID_EVENTS | AREA_FORBID_SINGULO | AREA_ALLOW_CLOCKOUT

/area/crew_quarters/Chomp_Stage
	name = "\improper Chomp Convention Stage"
	icon_state = "gaming"
	flags = RAD_SHIELDED | AREA_FORBID_EVENTS | AREA_FORBID_SINGULO | AREA_ALLOW_CLOCKOUT

/area/crew_quarters/Chomp_Kitchen
	name = "\improper Chomp Kitchen"
	icon_state = "gaming"
	flags = RAD_SHIELDED | AREA_FORBID_EVENTS | AREA_FORBID_SINGULO

/area/crew_quarters/Chomp_Dinner_1
	name = "\improper Chomp Dinner 1"
	icon_state = "gaming"
	flags = RAD_SHIELDED | AREA_FORBID_EVENTS | AREA_FORBID_SINGULO | AREA_ALLOW_CLOCKOUT
	lightswitch = 1

/area/crew_quarters/Chomp_Dinner_2
	name = "\improper Chomp Dinner 2"
	icon_state = "gaming"
	flags = RAD_SHIELDED | AREA_FORBID_EVENTS | AREA_FORBID_SINGULO | AREA_ALLOW_CLOCKOUT
	lightswitch = 1

/area/crew_quarters/Chomp_Lounge
	name = "\improper Chomp Lounge"
	icon_state = "gaming"
	flags = RAD_SHIELDED | AREA_FORBID_EVENTS | AREA_FORBID_SINGULO | AREA_ALLOW_CLOCKOUT

/area/crew_quarters/Public_Hydroponics
	name = "\improper Public Hydroponics"
	icon_state = "gaming"

/area/crew_quarters/Botanical_Shop
	name = "\improper Botanical Shop"
	icon_state = "gaming"

/area/crew_quarters/Observation_Atrium
	name = "\improper Observation Atrium"
	icon_state = "gaming"

/area/crew_quarters/Observation_Lounge
	name = "\improper Observation Lounge"
	icon_state = "gaming"

/area/crew_quarters/Public_Garden
	name = "\improper Public Garden"
	icon_state = "gaming"

/area/crew_quarters/sleep
	flags = RAD_SHIELDED | AREA_ALLOW_LARGE_SIZE | AREA_BLOCK_SUIT_SENSORS | AREA_BLOCK_TRACKING | AREA_SOUNDPROOF | AREA_FORBID_EVENTS | AREA_FORBID_SINGULO | AREA_ALLOW_CLOCKOUT
	lightswitch = 0
	icon_state = "gaming"

/area/crew_quarters/sleep/Dormitory_01
	name = "\improper Dormitory 01"

/area/crew_quarters/sleep/Dormitory_02
	name = "\improper Dormitory 02"

/area/crew_quarters/sleep/Dormitory_03
	name = "\improper Dormitory 03"

/area/crew_quarters/sleep/Dormitory_04
	name = "\improper Dormitory 04"

/area/crew_quarters/sleep/Dormitory_05
	name = "\improper Dormitory 05"

/area/crew_quarters/sleep/Dormitory_06
	name = "\improper Dormitory 06"

/area/crew_quarters/sleep/Dormitory_07
	name = "\improper Dormitory 07"

/area/crew_quarters/sleep/Dormitory_08
	name = "\improper Dormitory 08"

/area/crew_quarters/sleep/Dormitory_09
	name = "\improper Dormitory 09"

/area/crew_quarters/sleep/Dormitory_10
	name = "\improper Dormitory 10"

/area/crew_quarters/sleep/Dormitory_11
	name = "\improper Dormitory 11"

/area/crew_quarters/sleep/Dormitory_12
	name = "\improper Dormitory 12"

/area/crew_quarters/Dorm_Corridor_1
	name = "\improper Dorm Corridor 1"
	icon_state = "gaming"
	lightswitch = 1

/area/crew_quarters/Dorm_Corridor_2
	name = "\improper Dorm Corridor 2"
	icon_state = "gaming"
	lightswitch = 1

/area/crew_quarters/Dorm_Corridor_3
	name = "\improper Dorm Corridor 3"
	icon_state = "gaming"
	lightswitch = 1

/area/crew_quarters/Dorm_Corridor_4
	name = "\improper Dorm Corridor 4"
	icon_state = "gaming"
	lightswitch = 1

/area/crew_quarters/Dorm_Foyer
	name = "\improper Dorm Foyer"
	icon_state = "gaming"
	lightswitch = 1

/area/crew_quarters/Public_Gateway
	name = "\improper Public Gateway"
	icon_state = "gaming"

/area/crew_quarters/Emergency_EVA
	name = "\improper Emergency EVA"
	icon_state = "gaming"

/area/crew_quarters/Public_EVA
	name = "\improper Public EVA"
	icon_state = "gaming"

/area/crew_quarters/Custodial_Office
	name = "\improper Custodial Office"
	icon_state = "gaming"

//COMMONS AREAS
/area/hallway
	icon_state = "hallA"
	ambience = AMBIENCE_GENERIC
	sound_env = MEDIUM_SOFTFLOOR

/area/hallway/ForPort_1_Deck_Observatory
	name = "\improper ForPort 1 Deck Observatory"
	icon_state = "hallA"

/area/hallway/ForStar_1_Deck_Observatory
	name = "\improper ForStar 1 Deck Observatory"
	icon_state = "hallA"

/area/hallway/AftPort_1_Deck_Observatory
	name = "\improper AftPort 1 Deck Observatory"
	icon_state = "hallA"

/area/hallway/AftStar_1_Deck_Observatory
	name = "\improper AftStar 1 Deck Observatory"
	icon_state = "hallA"

/area/hallway/ForPort_2_Deck_Observatory
	name = "\improper ForPort 2 Deck Observatory"
	icon_state = "hallA"

/area/hallway/ForStar_2_Deck_Observatory
	name = "\improper ForStar 2 Deck Observatory"
	icon_state = "hallA"

/area/hallway/AftPort_2_Deck_Observatory
	name = "\improper AftPort 2 Deck Observatory"
	icon_state = "hallA"

/area/hallway/AftStar_2_Deck_Observatory
	name = "\improper AftStar 2 Deck Observatory"
	icon_state = "hallA"

/area/hallway/For_Transit_Foyer
	name = "\improper For Transit Foyer"
	icon_state = "hallA"

/area/hallway/Star_Transit_Foyer
	name = "\improper Star Transit Foyer"
	icon_state = "hallA"
	flags = RAD_SHIELDED | AREA_ALLOW_CLOCKOUT

/area/hallway/Aft_Transit_Lobby
	name = "\improper Aft Transit Lobby"
	icon_state = "hallA"

/area/hallway/Port_Transit_Foyer
	name = "\improper Port Transit Foyer"
	icon_state = "hallA"
	flags = RAD_SHIELDED | AREA_ALLOW_CLOCKOUT

/area/hallway/For_1_Deck_Stairwell
	name = "\improper For 1 Deck Stairwell"
	icon_state = "hallA"

/area/hallway/For_2_Deck_Stairwell
	name = "\improper For 2 Deck Stairwell"
	icon_state = "hallA"

/area/hallway/For_3_Deck_Stairwell
	name = "\improper For 3 Deck Stairwell"
	icon_state = "hallA"

/area/hallway/Star_1_Deck_Stairwell
	name = "\improper Star 1 Deck Stairwell"
	icon_state = "hallA"

/area/hallway/Star_2_Deck_Stairwell
	name = "\improper Star 2 Deck Stairwell"
	icon_state = "hallA"

/area/hallway/Star_3_Deck_Stairwell
	name = "\improper Star 3 Deck Stairwell"
	icon_state = "hallA"

/area/hallway/Aft_1_Deck_Stairwell
	name = "\improper Aft 1 Deck Stairwell"
	icon_state = "hallA"

/area/hallway/Aft_2_Deck_Stairwell
	name = "\improper Aft 2 Deck Stairwell"
	icon_state = "hallA"

/area/hallway/Aft_3_Deck_Stairwell
	name = "\improper Aft 3 Deck Stairwell"
	icon_state = "hallA"

/area/hallway/Port_1_Deck_Stairwell
	name = "\improper Port 1 Deck Stairwell"
	icon_state = "hallA"

/area/hallway/Port_2_Deck_Stairwell
	name = "\improper Port 2 Deck Stairwell"
	icon_state = "hallA"

/area/hallway/Port_3_Deck_Stairwell
	name = "\improper Port 3 Deck Stairwell"
	icon_state = "hallA"

/area/hallway/For_2_Deck_Central_Corridor_1
	name = "\improper For 2 Deck Central Corridor 1"
	icon_state = "hallA"

/area/hallway/For_2_Deck_Central_Corridor_2
	name = "\improper For 2 Deck Central Corridor 2"
	icon_state = "hallA"

/area/hallway/Star_2_Deck_Central_Corridor_1
	name = "\improper Star 2 Deck Central Corridor 1"
	icon_state = "hallA"

/area/hallway/Star_2_Deck_Central_Corridor_2
	name = "\improper Star 2 Deck Central Corridor 2"
	icon_state = "hallA"

/area/hallway/Aft_2_Deck_Central_Corridor_1
	name = "\improper Aft 2 Deck Central Corridor 1"
	icon_state = "hallA"

/area/hallway/Aft_2_Deck_Central_Corridor_2
	name = "\improper Aft 2 Deck Central Corridor 2"
	icon_state = "hallA"

/area/hallway/Port_2_Deck_Central_Corridor_1
	name = "\improper Port 2 Deck Central Corridor 1"
	icon_state = "hallA"

/area/hallway/Port_2_Deck_Central_Corridor_2
	name = "\improper Port 2 Deck Central Corridor 2"
	icon_state = "hallA"

/area/hallway/Aft_3_Deck_Central_Corridor_1
	name = "\improper Aft 3 Deck Central Corridor 1"
	icon_state = "hallA"

/area/hallway/Aft_3_Deck_Central_Corridor_2
	name = "\improper Aft 3 Deck Central Corridor 2"
	icon_state = "hallA"

/area/hallway/For_2_Deck_Corridor_1
	name = "\improper For 2 Deck Corridor 1"
	icon_state = "hallA"

/area/hallway/For_2_Deck_Corridor_2
	name = "\improper For 2 Deck Corridor 2"
	icon_state = "hallA"

/area/hallway/Star_2_Deck_Corridor_1
	name = "\improper Star 2 Deck Corridor 1"
	icon_state = "hallA"

/area/hallway/Star_2_Deck_Corridor_2
	name = "\improper Star 2 Deck Corridor 2"
	icon_state = "hallA"

/area/hallway/Aft_2_Deck_Corridor_1
	name = "\improper Aft 2 Deck Corridor 1"
	icon_state = "hallA"

/area/hallway/Aft_2_Deck_Corridor_2
	name = "\improper Aft 2 Deck Corridor 2"
	icon_state = "hallA"

/area/hallway/Port_2_Deck_Corridor_1
	name = "\improper Port 2 Deck Corridor 1"
	icon_state = "hallA"

/area/hallway/Port_2_Deck_Corridor_2
	name = "\improper Port 2 Deck Corridor 2"
	icon_state = "hallA"

/area/hallway/Aft_2_Deck_Lobby
	name = "\improper Aft 2 Deck Lobby"
	icon_state = "hallA"

/area/hallway/Aft_2_Deck_Shuttlebay_Corridor
	name = "\improper Aft 2 Deck Shuttlebay Corridor"
	icon_state = "hallA"

/area/hallway/Central_1_Deck_Hall
	name = "\improper Central 1 Deck Hall"
	icon_state = "hallA"

/area/hallway/Central_2_Deck_Hall
	name = "\improper Central 2 Deck Hall"
	icon_state = "hallA"

/area/hallway/Central_3_Deck_Hall
	name = "\improper Central 3 Deck Hall"
	icon_state = "hallA"

/area/hallway/Cryostorage_Lounge
	name = "\improper Cryostorage Lounge"
	icon_state = "hallA"

/area/hallway/Deck1_Transit_Hall
	name = "\improper 1 Deck Transit Hall"
	icon_state = "hallA"

/area/hallway/Deck1_Corridor
	name = "\improper 1 Deck Corridor"
	icon_state = "hallA"

/area/hallway/For_Locker_Room
	name = "\improper For Locker Room"
	icon_state = "hallA"

/area/hallway/Planetside_Equipment
	name = "\improper Planetside Equipment"
	icon_state = "hallA"

/area/hallway/Star_Breakroom
	name = "\improper Star Breakroom"
	icon_state = "hallA"

/area/hallway/Port_Breakroom
	name = "\improper Port Breakroom"
	icon_state = "hallA"

/area/hallway/Port_1Deck_Central_Corridor_1
	name = "\improper Port Deck1 Central Corridor 1"
	icon_state = "hallA"

/area/hallway/Port_1Deck_Central_Corridor_2
	name = "\improper Port Deck1 Central Corridor 2"
	icon_state = "hallA"

/area/hallway/Star_1Deck_Central_Corridor_1
	name = "\improper Star Deck1 Central Corridor 1"
	icon_state = "hallA"

/area/hallway/Star_1Deck_Central_Corridor_2
	name = "\improper Star Deck1 Central Corridor 2"
	icon_state = "hallA"

/area/hallway/Port_1Deck_Atrium
	name = "\improper Port Deck1 Atrium"
	icon_state = "hallA"

/area/hallway/Star_1Deck_Atrium
	name = "\improper Star Deck1 Atrium"
	icon_state = "hallA"

/area/hallway/Stairwell_For
	name = "\improper Stairwell Forward"
	icon_state = "hallA"

/area/hallway/Stairwell_Star
	name = "\improper Stairwell Starboard"
	icon_state = "hallA"

/area/hallway/Stairwell_Aft
	name = "\improper Stairwell Aft"
	icon_state = "hallA"

/area/hallway/Stairwell_Port
	name = "\improper Stairwell Port"
	icon_state = "hallA"


//HARBOR AREAS

/area/harbor
	icon_state = "hangar"
	ambience = AMBIENCE_ARRIVALS
	sound_env = SOUND_ENVIRONMENT_HANGAR


/area/harbor/Dock1
	name = "\improper 1 Dock"
	icon_state = "hangar"
	flags = RAD_SHIELDED

/area/harbor/Dock2
	name = "\improper 2 Dock"
	icon_state = "hangar"
	flags = RAD_SHIELDED

/area/harbor/Dock3
	name = "\improper 3 Dock"
	icon_state = "hangar"
	flags = RAD_SHIELDED

/area/harbor/Dock4
	name = "\improper 4 Dock"
	icon_state = "hangar"
	flags = RAD_SHIELDED

/area/harbor/Dock5
	name = "\improper 5 Dock"
	icon_state = "hangar"
	flags = RAD_SHIELDED

/area/harbor/Ship_Bay1
	name = "\improper 1 Ship Bay"
	icon_state = "hangar"
	ambience = AMBIENCE_HANGAR

/area/harbor/Ship_Bay2
	name = "\improper 2 Ship Bay"
	icon_state = "hangar"
	ambience = AMBIENCE_HANGAR

/area/harbor/Ship_Bay3
	name = "\improper 3 Ship Bay"
	icon_state = "hangar"
	ambience = AMBIENCE_HANGAR

/area/harbor/Ship_Bay4
	name = "\improper 4 Ship Bay"
	icon_state = "hangar"
	ambience = AMBIENCE_HANGAR

/area/harbor/Port_Docking_Foyer
	name = "\improper Port Docking Foyer"
	icon_state = "hangar"
	flags = RAD_SHIELDED

/area/harbor/Star_Docking_Foyer
	name = "\improper Star Docking Foyer"
	icon_state = "hangar"
	flags = RAD_SHIELDED

/area/harbor/Fueling_Post
	name = "\improper Fueling Post"
	icon_state = "hangar"

/area/harbor/Fueling_Storage
	name = "\improper Fueling Storage"
	icon_state = "hangar"

/area/harbor/For_Shuttlebay
	name = "\improper For Shuttlebay"
	icon_state = "hangar"

/area/harbor/Star_Shuttlebay
	name = "\improper Star Shuttlebay"
	icon_state = "hangar"

/area/harbor/Aft_Shuttlebay
	name = "\improper Aft Shuttlebay"
	icon_state = "hangar"

/area/harbor/Port_Shuttlebay
	name = "\improper Port Shuttlebay"
	icon_state = "hangar"

/area/harbor/For_3_Deck_Airlock_Access_1
	name = "\improper For 3 Deck Airlock Access 1"
	icon_state = "hangar"

/area/harbor/For_3_Deck_Airlock_Access_2
	name = "\improper For 3 Deck Airlock Access 2"
	icon_state = "hangar"

/area/harbor/Star_2_Deck_Airlock_Access
	name = "\improper Star 2 Deck Airlock Access"
	icon_state = "hangar"

/area/harbor/Star_3_Deck_Airlock_Access
	name = "\improper Star 3 Deck Airlock Access"
	icon_state = "hangar"

/area/harbor/Aft_3_Deck_Airlock_Access
	name = "\improper Aft 3 Deck Airlock Access"
	icon_state = "hangar"

/area/harbor/Aft_2_Deck_Airlock_Access
	name = "\improper Aft 2 Deck Airlock Access"
	icon_state = "hangar"

/area/harbor/Port_3_Deck_Airlock_Access
	name = "\improper Port 3 Deck Airlock Access"
	icon_state = "hangar"

//MAINTENANCE AREAS

/area/maintenance
	icon_state = "fsmaint"
	ambience = AMBIENCE_MAINTENANCE
	sound_env = SOUND_ENVIRONMENT_SEWER_PIPE

/area/maintenance/ab_StripBar
	name = "\improper abandoned StripBar"
	icon_state = "fsmaint"

/area/maintenance/ab_Medical
	name = "\improper abandoned Medical"
	icon_state = "fsmaint"

/area/maintenance/ab_Surgery
	name = "\improper abandoned Surgery"
	icon_state = "fsmaint"

/area/maintenance/ab_GeneralStore
	name = "\improper abandoned GeneralStore"
	icon_state = "fsmaint"

/area/maintenance/ab_Kitchen
	name = "\improper abandoned Kitchen"
	icon_state = "fsmaint"

/area/maintenance/ab_Hydroponics
	name = "\improper abandoned Hydroponics"
	icon_state = "fsmaint"

/area/maintenance/ab_SportsField
	name = "\improper abandoned SportsField"
	icon_state = "fsmaint"

/area/maintenance/ab_CardTrading
	name = "\improper abandoned CardTrading"
	icon_state = "fsmaint"

/area/maintenance/ab_ChuteTrade
	name = "\improper abandoned ChuteTrade"
	icon_state = "fsmaint"

/area/maintenance/ab_Theater
	name = "\improper abandoned Theater"
	icon_state = "fsmaint"

/area/maintenance/ab_Pdance
	name = "\improper abandoned Pdance"
	icon_state = "fsmaint"

/area/maintenance/ab_Chapel
	name = "\improper abandoned Chapel"
	icon_state = "fsmaint"

/area/maintenance/ab_TeshDen
	name = "\improper abandoned TeshDen"
	icon_state = "fsmaint"

/area/maintenance/Market_Stall_1
	name = "\improper Market Stall 1"
	icon_state = "fsmaint"

/area/maintenance/Market_Stall_2
	name = "\improper Market Stall 2"
	icon_state = "fsmaint"

/area/maintenance/Market_Stall_3
	name = "\improper Market Stall 3"
	icon_state = "fsmaint"

/area/maintenance/Market_Stall_4
	name = "\improper Market Stall 4"
	icon_state = "fsmaint"

/area/maintenance/Market_Stall_5
	name = "\improper Market Stall 5"
	icon_state = "fsmaint"

/area/maintenance/Market_Stall_6
	name = "\improper Market Stall 6"
	icon_state = "fsmaint"

/area/maintenance/Deck1_Port_Corridor
	name = "\improper Deck1 Port Corridor"
	icon_state = "fsmaint"

/area/maintenance/Deck1_Star_Corridor
	name = "\improper Deck1 Star Corridor"
	icon_state = "fsmaint"

/area/maintenance/Deck1_ForPort_Corridor1
	name = "\improper Deck1 ForPort Corridor1"
	icon_state = "fsmaint"

/area/maintenance/Deck1_ForPort_Corridor2
	name = "\improper Deck1 ForPort Corridor2"
	icon_state = "fsmaint"

/area/maintenance/Deck1_ForPort_Corridor3
	name = "\improper Deck1 ForPort Corridor3"
	icon_state = "fsmaint"

/area/maintenance/Deck1_ForPort_Chamber1
	name = "\improper Deck1 ForPort Chamber1"
	icon_state = "fsmaint"

/area/maintenance/Deck1_ForStar_Corridor1
	name = "\improper Deck1 ForStar Corridor1"
	icon_state = "fsmaint"

/area/maintenance/Deck1_ForStar_Corridor2
	name = "\improper Deck1 ForStar Corridor2"
	icon_state = "fsmaint"

/area/maintenance/Deck1_ForStar_Corridor3
	name = "\improper Deck1 ForStar Corridor3"
	icon_state = "fsmaint"

/area/maintenance/Deck1_ForStar_Chamber1
	name = "\improper Deck1 ForStar Chamber1"
	icon_state = "fsmaint"

/area/maintenance/Deck1_ForStar_Chamber2
	name = "\improper Deck1 ForStar Chamber2"
	icon_state = "fsmaint"

/area/maintenance/Deck1_ForStar_Chamber3
	name = "\improper Deck1 ForStar Chamber3"
	icon_state = "fsmaint"

/area/maintenance/Deck1_AftStar1_Corridor1
	name = "\improper Deck1 AftStar1 Corridor1"
	icon_state = "fsmaint"

/area/maintenance/Deck1_AftStar1_Corridor2
	name = "\improper Deck1 AftStar1 Corridor2"
	icon_state = "fsmaint"

/area/maintenance/Deck1_AftStar1_Corridor3
	name = "\improper Deck1 AftStar1 Corridor3"
	icon_state = "fsmaint"

/area/maintenance/Deck1_AftPort_Corridor1
	name = "\improper Deck1 AftPort Corridor1"
	icon_state = "fsmaint"

/area/maintenance/Deck1_AftPort_Corridor2
	name = "\improper Deck1 AftPort Corridor2"
	icon_state = "fsmaint"

/area/maintenance/Deck1_AftPort_Corridor3
	name = "\improper Deck1 AftPort Corridor3"
	icon_state = "fsmaint"

/area/maintenance/Deck1_AftPort_Chamber1
	name = "\improper Deck1 AftPort Chamber1"
	icon_state = "fsmaint"

/area/maintenance/Deck1_AftPort_Chamber2
	name = "\improper Deck1 AftPort Chamber2"
	icon_state = "fsmaint"

/area/maintenance/Deck1_AftPort_Chamber3
	name = "\improper Deck1 AftPort Chamber3"
	icon_state = "fsmaint"

/area/maintenance/Deck1_Cargo_Corridor1
	name = "\improper Deck1 Cargo Corridor1"
	icon_state = "fsmaint"

/area/maintenance/Deck1_Cargo_Corridor2
	name = "\improper Deck1 Cargo Corridor2"
	icon_state = "fsmaint"

/area/maintenance/Deck1_Cargo_Corridor3
	name = "\improper Deck1 Cargo Corridor3"
	icon_state = "fsmaint"

/area/maintenance/Deck1_Cargo_Chamber1
	name = "\improper Deck1 Cargo Chamber1"
	icon_state = "fsmaint"

/area/maintenance/Deck1_Security_PortCorridor1
	name = "\improper Deck1 Security PortCorridor1"
	icon_state = "fsmaint"

/area/maintenance/Deck1_Security_PortCorridor2
	name = "\improper Deck1 Security PortCorridor2"
	icon_state = "fsmaint"

/area/maintenance/Deck1_Security_PortChamber1
	name = "\improper Deck1 Security PortChamber1"
	icon_state = "fsmaint"

/area/maintenance/Deck1_Security_PortChamber2
	name = "\improper Deck1 Security PortChamber2"
	icon_state = "fsmaint"

/area/maintenance/Deck1_Security_PortChamber3
	name = "\improper Deck1 Security PortChamber3"
	icon_state = "fsmaint"

/area/maintenance/Deck1_Security_StarCorridor1
	name = "\improper Deck1 Security StarCorridor1"
	icon_state = "fsmaint"

/area/maintenance/Deck1_Security_StarCorridor2
	name = "\improper Deck1 Security StarCorridor2"
	icon_state = "fsmaint"

/area/maintenance/Deck1_Security_StarCorridor3
	name = "\improper Deck1 Security StarCorridor3"
	icon_state = "fsmaint"

/area/maintenance/Deck1_Security_StarChamber1
	name = "\improper Deck1 Security StarChamber1"
	icon_state = "fsmaint"

/area/maintenance/Deck1_Security_StarChamber2
	name = "\improper Deck1 Security StarChamber2"
	icon_state = "fsmaint"

/area/maintenance/Deck1_Science_ForCorridor1
	name = "\improper Deck1 Science ForCorridor1"
	icon_state = "fsmaint"

/area/maintenance/Deck1_Science_AftCorridor1
	name = "\improper Deck1 Science AftCorridor1"
	icon_state = "fsmaint"

/area/maintenance/Deck2_For_Corridor
	name = "\improper Deck2 For Corridor"
	icon_state = "fsmaint"

/area/maintenance/Deck2_ForStar_Corridor
	name = "\improper Deck2 ForStar Corridor"
	icon_state = "fsmaint"

/area/maintenance/Deck2_Star_Corridor
	name = "\improper Deck2 Star Corridor"
	icon_state = "fsmaint"

/area/maintenance/Deck2_AftStar_Corridor
	name = "\improper Deck2 AftStar Corridor"
	icon_state = "fsmaint"

/area/maintenance/Deck2_Aft_Corridor
	name = "\improper Deck2 Aft Corridor"
	icon_state = "fsmaint"

/area/maintenance/Deck2_AftPort_Corridor
	name = "\improper Deck2 AftPort Corridor"
	icon_state = "fsmaint"

/area/maintenance/Deck2_Port_Corridor
	name = "\improper Deck2 Port Corridor"
	icon_state = "fsmaint"

/area/maintenance/Deck2_ForPort_Corridor
	name = "\improper Deck2 ForPort Corridor"
	icon_state = "fsmaint"

/area/maintenance/Deck2_Security_StarCorridor1
	name = "\improper Deck2 Security StarCorridor1"
	icon_state = "fsmaint"

/area/maintenance/Deck2_Security_AftStarCorridor1
	name = "\improper Deck2 Security AftStarCorridor1"
	icon_state = "fsmaint"

/area/maintenance/Deck2_Security_AftStarCorridor2
	name = "\improper Deck2 Security AftStarCorridor2"
	icon_state = "fsmaint"

/area/maintenance/Deck2_Security_AftPortCorridor1
	name = "\improper Deck2 Security AftPortCorridor1"
	icon_state = "fsmaint"

/area/maintenance/Deck2_Security_AftPortCorridor2
	name = "\improper Deck2 Security AftPortCorridor2"
	icon_state = "fsmaint"

/area/maintenance/Deck2_Security_ForPortCorridor1
	name = "\improper Deck2 Security ForPortCorridor1"
	icon_state = "fsmaint"

/area/maintenance/Deck2_Security_ForPortChamber1
	name = "\improper Deck2 Security ForPortChamber1"
	icon_state = "fsmaint"

/area/maintenance/Deck2_Security_ForCorridor1
	name = "\improper Deck2 Security ForCorridor1"
	icon_state = "fsmaint"

/area/maintenance/Deck2_Security_ForCorridor2
	name = "\improper Deck2 Security ForCorridor2"
	icon_state = "fsmaint"

/area/maintenance/Deck2_Security_ForCorridor3
	name = "\improper Deck2 Security ForCorridor3"
	icon_state = "fsmaint"

/area/maintenance/Deck2_Security_PortCorridor1
	name = "\improper Deck2 Security PortCorridor1"
	icon_state = "fsmaint"

/area/maintenance/Deck2_Security_ForCorridor1
	name = "\improper Deck2 Security ForCorridor1"
	icon_state = "fsmaint"

/area/maintenance/Deck2_Security_ForStar_Chamber
	name = "\improper Deck2 Security ForStar Chamber"
	icon_state = "fsmaint"

/area/maintenance/Deck2_Science_ForCorridor1
	name = "\improper Deck2 Science ForCorridor1"
	icon_state = "fsmaint"

/area/maintenance/Deck2_Science_StarCorridor1
	name = "\improper Deck2 Science StarCorridor1"
	icon_state = "fsmaint"

/area/maintenance/Deck2_Science_StarCorridor2
	name = "\improper Deck2 Science StarCorridor2"
	icon_state = "fsmaint"

/area/maintenance/Deck2_Science_StarChamber1
	name = "\improper Deck2 Science StarChamber1"
	icon_state = "fsmaint"

/area/maintenance/Deck2_Science_ForPort_Corridor
	name = "\improper Deck2 Science ForPort Corridor"
	icon_state = "fsmaint"

/area/maintenance/Deck2_Science_ForPort_Chamber
	name = "\improper Deck2 Science ForPort Chamber"
	icon_state = "fsmaint"

/area/maintenance/Deck2_Medical_AftPortChamber1
	name = "\improper Deck2 Medical AftPortChamber1"
	icon_state = "fsmaint"

/area/maintenance/Deck2_Medical_AftPortCorridor1
	name = "\improper Deck2 Medical AftPortCorridor1"
	icon_state = "fsmaint"

/area/maintenance/Deck2_Medical_AftCorridor1
	name = "\improper Deck2 Medical AftCorridor1"
	icon_state = "fsmaint"

/area/maintenance/Deck2_Medical_AftCorridor2
	name = "\improper Deck2 Medical AftCorridor2"
	icon_state = "fsmaint"

/area/maintenance/Deck2_Medical_AftStarChamber1
	name = "\improper Deck2 Medical AftStarChamber1"
	icon_state = "fsmaint"

/area/maintenance/Deck2_Civilian_ForStarCorridor1
	name = "\improper Deck2 Civilian ForStarCorridor1"
	icon_state = "fsmaint"

/area/maintenance/Deck2_Civilian_ForStarCorridor2
	name = "\improper Deck2 Civilian ForStarCorridor2"
	icon_state = "fsmaint"

/area/maintenance/Deck2_Civilian_StarCorridor1
	name = "\improper Deck2 Civilian StarCorridor1"
	icon_state = "fsmaint"

/area/maintenance/Deck2_Civilian_StarChamber1
	name = "\improper Deck2 Civilian StarChamber1"
	icon_state = "fsmaint"

/area/maintenance/Deck2_Civilian_StarChamber2
	name = "\improper Deck2 Civilian StarChamber2"
	icon_state = "fsmaint"

/area/maintenance/Deck2_Civilian_AftCorridor1
	name = "\improper Deck2 Civilian AftCorridor1"
	icon_state = "fsmaint"

/area/maintenance/Deck2_Civilian_AftPortCorridor1
	name = "\improper Deck2 Civilian AftPortCorridor1"
	icon_state = "fsmaint"

/area/maintenance/Deck2_Civilian_PortChamber1
	name = "\improper Deck2 Civilian PortChamber1"
	icon_state = "fsmaint"

/area/maintenance/Deck2_Civilian_PortChamber2
	name = "\improper Deck2 Civilian PortChamber2"
	icon_state = "fsmaint"

/area/maintenance/Deck2_Civilian_ForPortCorridor1
	name = "\improper Deck2 Civilian ForPortCorridor1"
	icon_state = "fsmaint"

/area/maintenance/Deck2_Civilian_ForPortCorridor2
	name = "\improper Deck2 Civilian ForPortCorridor2"
	icon_state = "fsmaint"

/area/maintenance/Deck2_Civilian_ForPortChamber1
	name = "\improper Deck2 Civilian ForPortChamber1"
	icon_state = "fsmaint"

/area/maintenance/Deck2_Cargo_StarChamber1
	name = "\improper Deck2 Cargo StarChamber1"
	icon_state = "fsmaint"

/area/maintenance/Deck2_Cargo_AftStarChamber1
	name = "\improper Deck2 Cargo AftStarChamber1"
	icon_state = "fsmaint"

/area/maintenance/Deck2_Cargo_AftStarCorridor1
	name = "\improper Deck2 Cargo AftStarCorridor1"
	icon_state = "fsmaint"

/area/maintenance/Deck2_Cargo_AftCorridor1
	name = "\improper Deck2 Cargo AftCorridor1"
	icon_state = "fsmaint"

/area/maintenance/Deck2_Cargo_AftCorridor2
	name = "\improper Deck2 Cargo AftCorridor2"
	icon_state = "fsmaint"

/area/maintenance/Deck2_Cargo_AftPortCorridor1
	name = "\improper Deck2 Cargo AftPortCorridor1"
	icon_state = "fsmaint"

/area/maintenance/Deck2_Engineering_PortCorridor1
	name = "\improper Deck2 Engineering PortCorridor1"
	icon_state = "fsmaint"

/area/maintenance/Deck2_Engineering_PortCorridor2
	name = "\improper Deck2 Engineering PortCorridor2"
	icon_state = "fsmaint"

/area/maintenance/Deck2_Engineering_PortChamber1
	name = "\improper Deck2 Engineering PortChamber1"
	icon_state = "fsmaint"

/area/maintenance/Deck2_Engineering_PortChamber2
	name = "\improper Deck2 Engineering PortChamber2"
	icon_state = "fsmaint"

/area/maintenance/Deck2_Engineering_ForStarChamber1
	name = "\improper Deck2 Engineering ForStarChamber1"
	icon_state = "fsmaint"

/area/maintenance/Deck2_Engineering_ForStarChamber2
	name = "\improper Deck2 Engineering ForStarChamber2"
	icon_state = "fsmaint"

/area/maintenance/Deck2_Engineering_ForStarCorridor1
	name = "\improper Deck2 Engineering ForStarCorridor1"
	icon_state = "fsmaint"

/area/maintenance/Deck3_Bridge_ForChamber1
	name = "\improper Deck3 Bridge ForChamber1"
	icon_state = "fsmaint"

/area/maintenance/Deck3_Bridge_ForStarCorridor1
	name = "\improper Deck3 Bridge ForStarCorridor1"
	icon_state = "fsmaint"

/area/maintenance/Deck3_Bridge_ForStarCorridor2
	name = "\improper Deck3 Bridge ForStarCorridor2"
	icon_state = "fsmaint"

/area/maintenance/Deck3_Bridge_ForStarCorridor3
	name = "\improper Deck3 Bridge ForStarCorridor3"
	icon_state = "fsmaint"

/area/maintenance/Deck3_Bridge_ForStarChamber1
	name = "\improper Deck3 Bridge ForStarChamber1"
	icon_state = "fsmaint"

/area/maintenance/Deck3_Bridge_AftStarCorridor1
	name = "\improper Deck3 Bridge AftStarCorridor1"
	icon_state = "fsmaint"

/area/maintenance/Deck3_Bridge_AftPortCorridor1
	name = "\improper Deck3 Bridge AftPortCorridor1"
	icon_state = "fsmaint"

/area/maintenance/Deck3_Bridge_ForStarCorridor1
	name = "\improper Deck3 Bridge ForStarCorridor1"
	icon_state = "fsmaint"

/area/maintenance/Deck3_Bridge_ForStarCorridor2
	name = "\improper Deck3 Bridge ForStarCorridor2"
	icon_state = "fsmaint"

/area/maintenance/Deck3_Bridge_ForStarCorridor3
	name = "\improper Deck3 Bridge ForStarCorridor3"
	icon_state = "fsmaint"

/area/maintenance/Deck3_Bridge_ForPort_Chamber1
	name = "\improper Deck3 Bridge ForPort Chamber1"
	icon_state = "fsmaint"

/area/maintenance/Deck3_Bridge_ForPort_Corridor1
	name = "\improper Deck3 Bridge ForPort Corridor1"
	icon_state = "fsmaint"

/area/maintenance/Deck3_Bridge_ForPort_Corridor2
	name = "\improper Deck3 Bridge ForPort Corridor2"
	icon_state = "fsmaint"

/area/maintenance/Deck3_Medical_ForChamber1
	name = "\improper Deck3 Medical ForChamber1"
	icon_state = "fsmaint"

/area/maintenance/Deck3_Medical_ForChamber2
	name = "\improper Deck3 Medical ForChamber2"
	icon_state = "fsmaint"

/area/maintenance/Deck3_Medical_ForChamber3
	name = "\improper Deck3 Medical ForChamber3"
	icon_state = "fsmaint"

/area/maintenance/Deck3_Medical_ForStarChamber1
	name = "\improper Deck3 Medical ForStarChamber1"
	icon_state = "fsmaint"

/area/maintenance/Deck3_Medical_ForStarChamber2
	name = "\improper Deck3 Medical ForStarChamber2"
	icon_state = "fsmaint"

/area/maintenance/Deck3_Medical_ForStarChamber3
	name = "\improper Deck3 Medical ForStarChamber3"
	icon_state = "fsmaint"

/area/maintenance/Deck3_Medical_StarCorridor1
	name = "\improper Deck3 Medical StarCorridor1"
	icon_state = "fsmaint"

/area/maintenance/Deck3_Medical_AftStarChamber1
	name = "\improper Deck3 Medical AftStarChamber1"
	icon_state = "fsmaint"

/area/maintenance/Deck3_Medical_AftCorridor1
	name = "\improper Deck3 Medical AftCorridor1"
	icon_state = "fsmaint"

/area/maintenance/Deck3_Medical_AftCorridor2
	name = "\improper Deck3 Medical AftCorridor2"
	icon_state = "fsmaint"

/area/maintenance/Deck3_Medical_AftPortCorridor1
	name = "\improper Deck3 Medical AftPortCorridor1"
	icon_state = "fsmaint"

/area/maintenance/Deck3_Medical_AftPortChamber1
	name = "\improper Deck3 Medical AftPortChamber1"
	icon_state = "fsmaint"

/area/maintenance/Deck3_Medical_AftPortChamber2
	name = "\improper Deck3 Medical AftPortChamber2"
	icon_state = "fsmaint"

/area/maintenance/Deck3_Medical_PortChamber1
	name = "\improper Deck3 Medical PortChamber1"
	icon_state = "fsmaint"

/area/maintenance/Deck3_Medical_PortChamber2
	name = "\improper Deck3 Medical PortChamber2"
	icon_state = "fsmaint"

/area/maintenance/Deck3_Medical_ForPortChamber1
	name = "\improper Deck3 Medical ForPortChamber1"
	icon_state = "fsmaint"

/area/maintenance/Deck3_Medical_ForPortChamber2
	name = "\improper Deck3 Medical ForPortChamber2"
	icon_state = "fsmaint"

/area/maintenance/Deck3_Dorms_ForCorridor1
	name = "\improper Deck3 Dorms ForCorridor1"
	icon_state = "fsmaint"

/area/maintenance/Deck3_Dorms_ForStarChamber1
	name = "\improper Deck3 Dorms ForStarChamber1"
	icon_state = "fsmaint"

/area/maintenance/Deck3_Dorms_ForStarChamber2
	name = "\improper Deck3 Dorms ForStarChamber2"
	icon_state = "fsmaint"

/area/maintenance/Deck3_Dorms_StarCorridor1
	name = "\improper Deck3 Dorms StarCorridor1"
	icon_state = "fsmaint"

/area/maintenance/Deck3_Dorms_StarCorridor2
	name = "\improper Deck3 Dorms StarCorridor2"
	icon_state = "fsmaint"

/area/maintenance/Deck3_Dorms_StarChamber1
	name = "\improper Deck3 Dorms StarChamber1"
	icon_state = "fsmaint"

/area/maintenance/Deck3_Dorms_StarChamber2
	name = "\improper Deck3 Dorms StarChamber2"
	icon_state = "fsmaint"

/area/maintenance/Deck3_Dorms_AftCorridor1
	name = "\improper Deck3 Dorms AftCorridor1"
	icon_state = "fsmaint"

/area/maintenance/Deck3_Dorms_AftCorridor2
	name = "\improper Deck3 Dorms AftCorridor2"
	icon_state = "fsmaint"

/area/maintenance/Deck3_Dorms_AftPortChamber1
	name = "\improper Deck3 Dorms AftPortChamber1"
	icon_state = "fsmaint"

/area/maintenance/Deck3_Dorms_AftPortChamber2
	name = "\improper Deck3 Dorms AftPortChamber2"
	icon_state = "fsmaint"

/area/maintenance/Deck3_Dorms_PortCorridor1
	name = "\improper Deck3 Dorms PortCorridor1"
	icon_state = "fsmaint"

/area/maintenance/Deck3_Dorms_PortChamber1
	name = "\improper Deck3 Dorms PortChamber1"
	icon_state = "fsmaint"

/area/maintenance/Deck3_Dorms_ForStarChamber1
	name = "\improper Deck3 Dorms ForStarChamber1"
	icon_state = "fsmaint"

/area/maintenance/Deck3_Dorms_ForStarChamber2
	name = "\improper Deck3 Dorms ForStarChamber2"
	icon_state = "fsmaint"

/area/maintenance/Deck3_Dorms_ForPort_Corridor1
	name = "\improper Deck3 Dorms ForPort Corridor1"
	icon_state = "fsmaint"

/area/maintenance/Deck3_Dorms_ForPort_Chamber1
	name = "\improper Deck3 Dorms ForPort Chamber1"
	icon_state = "fsmaint"

/area/maintenance/Deck3_Engineering_ForCorridor1
	name = "\improper Deck3 Engineering ForCorridor1"
	icon_state = "fsmaint"

/area/maintenance/Deck3_Engineering_ForStarChamber1
	name = "\improper Deck3 Engineering ForStarChamber1"
	icon_state = "fsmaint"

/area/maintenance/Deck3_Engineering_ForStarChamber2
	name = "\improper Deck3 Engineering ForStarChamber2"
	icon_state = "fsmaint"

/area/maintenance/Deck3_Engineering_StarChamber1
	name = "\improper Deck3 Engineering StarChamber1"
	icon_state = "fsmaint"

/area/maintenance/Deck3_Engineering_AftStarCorridor1
	name = "\improper Deck3 Engineering AftStarCorridor1"
	icon_state = "fsmaint"

/area/maintenance/Deck3_Engineering_AftStarCorridor2
	name = "\improper Deck3 Engineering AftStarCorridor2"
	icon_state = "fsmaint"

/area/maintenance/Deck3_Engineering_AftStarChamber1
	name = "\improper Deck3 Engineering AftStarChamber1"
	icon_state = "fsmaint"

/area/maintenance/Deck3_Engineering_AftStarChamber2
	name = "\improper Deck3 Engineering AftStarChamber2"
	icon_state = "fsmaint"

/area/maintenance/Deck3_Engineering_AftStarChamber3
	name = "\improper Deck3 Engineering AftStarChamber3"
	icon_state = "fsmaint"

/area/maintenance/Deck3_Center_Star
	name = "\improper Deck3 Center Star"
	icon_state = "fsmaint"

/area/maintenance/Deck3_Center_Port
	name = "\improper Deck3 Center Port"
	icon_state = "fsmaint"

/area/maintenance/Distro_Central
	name = "\improper Distro Central"
	icon_state = "engineering"
	ambience = AMBIENCE_ATMOS

/area/maintenance/Distro_Harbor
	name = "\improper Distro Harbor"
	icon_state = "engineering"
	ambience = AMBIENCE_ATMOS

/area/maintenance/Distro_Civilian
	name = "\improper Distro Civilian"
	icon_state = "engineering"
	ambience = AMBIENCE_ATMOS

/area/maintenance/Research_Substation
	name = "\improper Research Substation"
	icon_state = "engineering"
	ambience = AMBIENCE_SUBSTATION
	lightswitch = 1

/area/maintenance/Medical_Substation
	name = "\improper Medical Substation"
	icon_state = "engineering"
	ambience = AMBIENCE_SUBSTATION
	lightswitch = 1

/area/maintenance/Dorms_Substation
	name = "\improper Dorms Substation"
	icon_state = "engineering"
	ambience = AMBIENCE_SUBSTATION
	lightswitch = 1

/area/maintenance/Domicile_Substation
	name = "\improper Domicile Substation"
	icon_state = "engineering"
	ambience = AMBIENCE_SUBSTATION
	lightswitch = 1

/area/maintenance/Harbor_Substation
	name = "\improper Harbor Substation"
	icon_state = "engineering"
	ambience = AMBIENCE_SUBSTATION
	lightswitch = 1

/area/maintenance/Telecomms_Substation
	name = "\improper Telecomms Substation"
	icon_state = "engineering"
	ambience = AMBIENCE_SUBSTATION
	lightswitch = 1

/area/maintenance/Security_Substation
	name = "\improper Security Substation"
	icon_state = "engineering"
	ambience = AMBIENCE_SUBSTATION
	lightswitch = 1

/area/maintenance/Bridge_Substation
	name = "\improper Bridge Substation"
	icon_state = "engineering"
	ambience = AMBIENCE_SUBSTATION
	lightswitch = 1

/area/maintenance/AI_Substation
	name = "\improper AI Substation"
	icon_state = "engineering"
	ambience = AMBIENCE_SUBSTATION
	lightswitch = 1

/area/maintenance/Cargo_Substation
	name = "\improper Cargo Substation"
	icon_state = "engineering"
	ambience = AMBIENCE_SUBSTATION
	lightswitch = 1

/area/maintenance/Engineering_Substation
	name = "\improper Engineering Substation"
	icon_state = "engineering"
	ambience = AMBIENCE_SUBSTATION
	lightswitch = 1
