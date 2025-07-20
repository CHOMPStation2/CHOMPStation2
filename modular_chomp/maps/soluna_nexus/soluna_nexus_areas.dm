//Turbolift

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


/area/rnd/xenobiology/xenoflora_isolation
	name = "\improper Xenoflora Isolation"
	icon_state = "xeno_f_store"

// Shuttles


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
