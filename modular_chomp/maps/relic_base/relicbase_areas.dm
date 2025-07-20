
/area/surface/outside
	ambience = AMBIENCE_THOR

/area/surface/outpost/mining_main/exterior
	name = "Mining Outpost Exterior"

/area/surface/outpost/mining_main/refinery
	name = "Mining Refinery"

/area/surface/outpost/mining_main/restroom
	name = "Mining Restroom"

/area/surface/outpost/mining_main/tools
	name = "Mining Tool Storage"

/area/surface/outpost/main/landing
	name = "\improper Landing Pad Four"

/area/surface/outpost/main/gym
	name = "\improper Gym"

/area/surface/outpost/main/garage
	name = "\improper Disused Garage"

/area/surface/outpost/main/bar
	name = "\improper Club"

/area/surface/outpost/main/airlock
	ambience = AMBIENCE_THOR

/area/surface/outpost/civilian/emergency_storage
	name = "\improper Abandoned Barracks"

/area/maintenance/firstdeck
	name = "Maintenance Level - Central"

/area/maintenance/firstdeck/centralstarboard
	name = "Maintenance Level - East"

/area/maintenance/firstdeck/centralport
	name = "Maintenance Level - West"

/area/maintenance/firstdeck/aftstarboard
	name = "Maintenance Level - Southeast"

/area/maintenance/firstdeck/aftportsolar
	name = "Maintenance Level - Southwest"

/area/maintenance/firstdeck/forestarboard
	name = "Maintenance Level - Northeast"

/area/maintenance/firstdeck/foreport
	name = "Maintenance Level - Northwest"

/area/hallway/primary/seconddeck/dockhallway
	name = "\improper Departures Tram Station"












// ^^^^^Areas above this area alread moved. Those are unique names for this map
// TODO

//// ALL THE AREAS BELOW ARE NOT YET CHECKED!!!!!

//Turbolift

// Elevator areas.
/area/turbolift/port_deck_one
	name = "lift (first deck)"
	lift_floor_label = "Deck 1"
	lift_floor_name = "Deck 1"
	lift_announce_str = "Arriving at Cargo Delivery"
	base_turf = /turf/simulated/floor

/area/turbolift/port_deck_two
	name = "lift (second deck)"
	lift_floor_label = "Deck 2"
	lift_floor_name = "Deck 2"
	lift_announce_str = "Arriving at Cargo"

//Deck One (Z-1)

/area/security/checkpoint3
	name = "\improper Security - Auxiliary Checkpoint"
	icon_state = "security"

/area/medical/first_aid_station
	name = "\improper First-Aid Station"
	icon_state = "medbay2"

/area/medical/first_aid_station/firstdeck/
	name = "\improper First Deck First-Aid Station"

/area/storage/emergency_storage/
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


//Deck Two (Z-2)


/area/construction/seconddeck
	name = "\improper Second Deck Engineering Construction Area"
	icon_state = "construction"

/area/construction/seconddeck/construction1
	name = "\improper Second Deck Engineering Construction Area 1"


//CHOMPStation Edit Start KSC 1/19/21 - Added area for new GYM

//CHOMPStation Edit End


/area/engineering/hallway/atmos_hallway
	name = "\improper Atmospherics Hallway"

/area/engineering/hallway/engineer_hallway
	name = "\improper Engineering Hallway"
	icon_state = "engineering_aft_hallway"


/area/medical/foyer
	name = "\improper Medbay Foyer"
	icon_state = "medbay2"
	music = 'sound/ambience/signal.ogg'

/area/medical/medsci
	name = "\improper Medical Science Hallway"
	icon_state = "medbay2"

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

/area/rnd/research/firstdeck/hallway/simulated_caves
	base_turf = /turf/simulated/floor/outdoors/rocks/caves

/area/rnd/xenobiology/xenoflora_isolation
	name = "\improper Xenoflora Isolation"
	icon_state = "xeno_f_store"

/area/rnd/xenobiology/simulated_caves
	base_turf = /turf/simulated/floor/outdoors/rocks/caves

/area/rnd/storage/simulated_caves
	base_turf = /turf/simulated/floor/outdoors/rocks/caves

/area/rnd/mixing/simulated_caves
	base_turf = /turf/simulated/floor/outdoors/rocks/caves

/area/security/security_hallway
	name = "\improper Security Hallway"
	icon_state = "security"

/area/security/tactical/simulated_caves
	base_turf = /turf/simulated/floor/outdoors/rocks/caves

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










//CHOMPStation Edit Start TFF 6/2/20 KC - Added new First Aid station.

/area/medical/first_aid_station/thirddeck
	name = "\improper Center Thirddeck First-Aid Station"
	icon_state = "medbay2"

//CHOMPStation Edit -- Relic Base/Forbearance Catacombs Area ~ Serdy


//CHOMPStation Edit End

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


//Shuttle One

/area/shuttle/shuttle1
	name = "\improper Hangar Deck"
	icon_state = "yellow"
	requires_power = 0
	dynamic_lighting = 1
	flags = RAD_SHIELDED

/area/shuttle/shuttle1/start
	name = "\improper Landing Pad One"
	icon_state = "shuttlered"
	base_turf = /turf/simulated/floor/reinforced

/area/shuttle/shuttle1/arrivals_dock
	name = "\improper docked with Relic Base"
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
	base_turf = /turf/simulated/floor/plating/thor/planetuse

/area/shuttle/shuttle1/transit
	name = "transit"
	icon_state = "shuttlered"
	base_turf = /turf/space/transit/north

/area/shuttle/shuttle1/orbit
	name = "in orbit of Thor"
	icon_state = "shuttlegrn"
	base_turf = /turf/space

/area/shuttle/shuttle1/sky
	name = "hovering over skies of Thor"
	icon_state = "shuttlegrn"
	base_turf = /turf/simulated/sky

/area/shuttle/shuttle1/sky_transit
	name = "in flight over Thor"
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
	name = "\improper Landing Pad Two"
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
	base_turf = /turf/simulated/floor/plating/thor/planetuse

/area/shuttle/shuttle2/transit
	name = "transit"
	icon_state = "shuttlered"
	base_turf = /turf/space/transit/north

/area/shuttle/shuttle2/orbit
	name = "in orbit of Sif"
	icon_state = "shuttlegrn"
	base_turf = /turf/space

/area/shuttle/shuttle2/sky
	name = "hovering over skies of Thor"
	icon_state = "shuttlegrn"
	base_turf = /turf/simulated/sky

/area/shuttle/shuttle2/sky_transit
	name = "in flight over Thor"
	icon_state = "shuttlered"
	base_turf = /turf/simulated/sky/moving

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
	base_turf = /turf/simulated/floor/outdoors/grass/thor/planetuse

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
	base_turf = /turf/simulated/floor/outdoors/grass/thor/planetuse

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

// Escape Shuttle

/area/shuttle/escape/station/simulated_grid
	base_turf = /turf/simulated/floor/tiled/techfloor/grid

// Arrivals Shuttle

/area/shuttle/arrival/pre_game/simulated_grid
	base_turf = /turf/simulated/floor/tiled/techfloor/grid

/area/shuttle/arrival/station/simulated_grid
	base_turf = /turf/simulated/floor/tiled/techfloor/grid

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
	name = "\improper Landing Pad Four"
	icon_state = "shuttlered"
	base_turf = /turf/simulated/floor/reinforced

/area/shuttle/shuttle3/seconddeck
	name = "south of second deck"
	icon_state = "south"

/area/shuttle/shuttle3/stationhangar3
	name = "\improper Landing Pad Three"
	icon_state = "shuttlered"
	base_turf = /turf/simulated/floor/reinforced

/area/shuttle/shuttle3/expedition
	name = "\improper Expedition Hangar One"
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
	base_turf = /turf/simulated/floor/reinforced

//mining elevator areas

/area/shuttle/minoutpost/site
	name = "\improper Mining Elevator"
	icon_state = "shuttle2"
	base_turf = /turf/simulated/floor/reinforced
/area/shuttle/minoutpost/base
	name = "\improper Mining Elevator"
	icon_state = "shuttle2"
	base_turf = /turf/simulated/floor/reinforced

//CHOMPedit: Exploration Carrier areas

/area/expoutpost
	name = "\improper Exploration Carrier"
	icon_state = "purple"

/area/expoutpost/shuttle
	name = "\improper Exploration Carrier shuttle"

/area/expoutpost/stationshuttle
	name = "\improper Station Shuttle to Exploration Carrier"

/area/expoutpost/debriefing
	name = "\improper Exploration Carrier Debriefing"
	ambience = AMBIENCE_OUTPOST

/area/expoutpost/prep
	name = "\improper Exploration Carrier Prep Room"

/area/expoutpost/prep/recovery
	name = "\improper Exploration Carrier Recovery"
	icon_state = "exam_room"

/area/expoutpost/pathfinder
	name = "\improper Exploration Carrier Pathfinder Office"

/area/expoutpost/hallwayaftport
	name = "\improper Exploration Carrier Aft Port Hallway"

/area/expoutpost/bathroom
	name = "\improper Exploration Carrier Bathroom"

/area/expoutpost/aftdock
	name = "\improper Exploration Carrier Backup Shuttle Docks"

/area/expoutpost/hangerhall
	name = "\improper Exploration Carrier Hangar Hallway"

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

/area/expoutpost/hangaroneprep
	name = "\improper Exploration Carrier Hangar One Prep"

/area/expoutpost/nukestorage //Yes this is a joke
	name = "\improper Exploration Carrier Secure Storage"
	icon_state = "nuke_storage"

/area/expoutpost/teleporter
	name = "\improper Exploration Carrier Teleporter"
	icon_state = "teleporter"

/area/expoutpost/gateway
	name = "\improper Exploration Carrier Gateway"
	icon_state = "teleporter"

/area/expoutpost/displayroom
	name = "\improper Exploration Carrier Display Room"

/area/solar/expstarboardsolar
	name = "\improper Exploration Carrier Starbound Solars"
	icon_state = "panelsS"

/area/solar/expportsolar
	name = "\improper Exploration Carrier Port Solars"
	icon_state = "panelsP"
