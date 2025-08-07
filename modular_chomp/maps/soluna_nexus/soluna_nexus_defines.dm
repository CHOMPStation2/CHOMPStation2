// To be filled out when more progress on the new map occurs.
/datum/map/soluna_nexus
	name = "Soluna Nexus"
	full_name = "Soluna Nexus"
	path = "soluna_nexus"

	lobby_screens = list('modular_chomp/html/lobby/chompstation.webp')
	id_hud_icons = 'icons/mob/hud_jobs_vr.dmi'

	holomap_smoosh = list(list(
		Z_LEVEL_SN_STATION_ONE,
		Z_LEVEL_SN_STATION_TWO,
		Z_LEVEL_SN_STATION_THREE,
		))

	zlevel_datum_type = /datum/map_z_level/soluna_nexus

	station_name  = "NLS Soluna Nexus"
	station_short = "Soluna Nexus"
	dock_name     = "NCS Northern Star" // Now we're the centcom!
	boss_name     = "Central Command"
	boss_short    = "Centcom"
	company_name  = "NanoTrasen"
	company_short = "NT"
	starsys_name  = "Vir"
	use_overmap = TRUE
	overmap_size = 50
	overmap_event_areas = 44

	shuttle_docked_message = "The scheduled shuttle to the %dock_name% has docked with the station at docks one and two. It will depart in approximately %ETD%."
	shuttle_leaving_dock = "The Crew Transfer Shuttle has left the station. Estimate %ETA% until the shuttle docks at %dock_name%."
	shuttle_called_message = "A crew transfer to %dock_name% has been scheduled. The shuttle has been called. Those leaving should proceed to docks one and two in approximately %ETA%."
	shuttle_recall_message = "The scheduled crew transfer has been cancelled."
	emergency_shuttle_docked_message = "The Emergency Shuttle has docked with the station at docks one and two. You have approximately %ETD% to board the Emergency Shuttle."
	emergency_shuttle_leaving_dock = "The Emergency Shuttle has left the station. Estimate %ETA% until the shuttle docks at %dock_name%."
	emergency_shuttle_called_message = "An emergency evacuation shuttle has been called. It will arrive at docks one and two in approximately %ETA%."
	emergency_shuttle_recall_message = "The emergency shuttle has been recalled."

	// Networks that will show up as options in the camera monitor program
	station_networks = list(
							NETWORK_CARGO,
							NETWORK_CIRCUITS,
							NETWORK_CIVILIAN,
							NETWORK_COMMAND,
							NETWORK_ENGINE,
							NETWORK_ENGINEERING,
							NETWORK_ENGINEERING_OUTPOST,
							NETWORK_FIRST_DECK,
							NETWORK_SECOND_DECK,
							NETWORK_THIRD_DECK,
							NETWORK_MAIN_OUTPOST,
							NETWORK_MEDICAL,
							NETWORK_MINE,
							NETWORK_RESEARCH,
							NETWORK_RESEARCH_OUTPOST,
							NETWORK_CARRIER,
							NETWORK_ROBOTS,
							NETWORK_PRISON,
							NETWORK_SECURITY,
							NETWORK_TELECOM,
							) //CHOMPedit: add "NETWORK_CARRIER" for exploration outpost cams
	// Camera networks that exist, but don't show on regular camera monitors.
	secondary_networks = list(
							NETWORK_ERT,
							NETWORK_MERCENARY,
							NETWORK_THUNDER,
							NETWORK_COMMUNICATORS,
							NETWORK_ALARM_ATMOS,
							NETWORK_ALARM_POWER,
							NETWORK_ALARM_FIRE,
							NETWORK_SUPPLY,
							)
	usable_email_tlds = list("freemail.nt")
	allowed_spawns = list("Arrivals Shuttle","Gateway", "Cryogenic Storage", "Cyborg Storage", "Station gateway", "Sif plains", "Fuel Depot")
	default_skybox = /datum/skybox_settings/soluna_nexus
	unit_test_exempt_areas = list(/area/ninja_dojo, /area/shuttle/ninja)
	unit_test_exempt_from_atmos = list(/area/engineering/Telecomms_Network, /area/security/Transit_Turrets)

	planet_datums_to_make = list(/datum/planet/sif, /datum/planet/thor, /datum/planet/tyr) //This must be added to load maps at round start otherwise they will have weather or sun.

	unit_test_z_levels = list(
		Z_LEVEL_SN_STATION_ONE,
		Z_LEVEL_SN_STATION_TWO,
		Z_LEVEL_SN_STATION_THREE,
		)

	lateload_z_levels = list(
		list(Z_NAME_SC_SURFACE),
		list(Z_NAME_SC_SURFACE_MINE),
		list(Z_NAME_SC_SURFACE_WILD),
		list(Z_NAME_SN_MISC),
		list(Z_NAME_SN_CENTCOM),
		list(Z_NAME_SN_TRANSIT),
		list(Z_NAME_VR_WORLD_CH),
		list(Z_NAME_FUELDEPOT_CH),
		list(Z_NAME_PLANET_THOR_CH),
		list(Z_NAME_PLANET_TYR_CH),
		)

	lateload_gateway = list(
		list(Z_NAME_GATEWAY_SNOW_FIELD_CH),
		list(Z_NAME_GATEWAY_MADNESS_LAB_CH),
		list(Z_NAME_GATEWAY_ABANDONED_CITY_CH),
		list(Z_NAME_GATEWAY_SKYSCRAPER_CH),
		)

/datum/map/soluna_nexus/perform_map_generation()
	// First, place a bunch of submaps. This comes before tunnel/forest generation as to not interfere with the submap.(This controls POI limit generation, increase or lower its values to have more or less POI's)

	// Cave submaps are first.
	var/surface_mine_z = GLOB.map_templates_loaded[Z_NAME_SC_SURFACE_MINE]
	seed_submaps(list(surface_mine_z), 140, /area/surface/cave/unexplored/normal, /datum/map_template/surface/mountains/normal)
	seed_submaps(list(surface_mine_z), 140, /area/surface/cave/unexplored/deep, /datum/map_template/surface/mountains/deep)

	// Plains to make them less plain.
	var/surface_z = GLOB.map_templates_loaded[Z_NAME_SC_SURFACE]
	seed_submaps(list(surface_z), 220, /area/surface/outside/plains/normal, /datum/map_template/surface/plains) // Center area is WIP until map editing settles down.

	// Wilderness is next.
	var/surface_wild_z = GLOB.map_templates_loaded[Z_NAME_SC_SURFACE_WILD]
	seed_submaps(list(surface_wild_z), 240, /area/surface/outside/wilderness/normal, /datum/map_template/surface/wilderness/normal)
	seed_submaps(list(surface_wild_z), 240, /area/surface/outside/wilderness/deep, /datum/map_template/surface/wilderness/deep)
	// If Space submaps are made, add a line to make them here as well.

	// Now for the tunnels. (This decides the load order of ore generation and cave generation. Check Random_Map to see % )
	new /datum/random_map/automata/cave_system/(null, 1, 1, surface_mine_z, world.maxx, world.maxy) // Create the mining Z-level.
	new /datum/random_map/noise/ore(null, 1, 1, surface_mine_z, 64, 64)         // Create the mining ore distribution map.
	// Todo: Forest generation.
	return 1

/datum/map/soluna_nexus/get_map_info()
	. = list()
	. +=  "The NLS [full_name] is a small waystation in orbit of the frozen garden world of Sif, jewel of the Vir system.<br>"
	. +=  "Though Vir is typically peaceful, the system has seen its fair share of conflict in the face of technological extremists, rogue drone intelligence, and worse.<br>"
	. +=  "As an employee of NanoTrasen, operators of the Southern Cross and one of the galaxy's largest research corporations, you're probably just here to do a job."
	return jointext(., "<br>")

// Skybox Settings
/datum/skybox_settings/soluna_nexus
	icon_state = "dyable"
	random_color = TRUE

// Lateload handling
/datum/map_template/soluna_nexus_lateload
	allow_duplicates = FALSE
	var/associated_map_datum

/datum/map_template/soluna_nexus_lateload/on_map_loaded(z)
	if(!associated_map_datum || !ispath(associated_map_datum))
		log_game("Extra z-level [src] has no associated map datum")
		return

	new associated_map_datum(using_map, z)
	return ..()

/datum/map_z_level/soluna_nexus_lateload/New(datum/map/map, mapZ)
	z = mapZ
	return ..(map)

// For making the 4-in-1 holomap, we calculate some offsets
#define SOUTHERN_CROSS_MAP_SIZE 200 // Width and height of compiled in Southern Cross z levels.
#define SOUTHERN_CROSS_HOLOMAP_CENTER_GUTTER 40 // 40px central gutter between columns
#define SOUTHERN_CROSS_HOLOMAP_MARGIN_X ((HOLOMAP_ICON_SIZE - (2*SOUTHERN_CROSS_MAP_SIZE) - SOUTHERN_CROSS_HOLOMAP_CENTER_GUTTER) / 2) // 100
#define SOUTHERN_CROSS_HOLOMAP_MARGIN_Y ((HOLOMAP_ICON_SIZE - (2*SOUTHERN_CROSS_MAP_SIZE)) / 2) // 60

// Station Z-Levels
/datum/map_z_level/soluna_nexus/station
	flags = MAP_LEVEL_STATION|MAP_LEVEL_CONTACT|MAP_LEVEL_PLAYER|MAP_LEVEL_CONSOLES|MAP_LEVEL_VORESPAWN
	holomap_legend_x = 220
	holomap_legend_y = 160

/datum/map_z_level/soluna_nexus/station/station_one
	z = Z_LEVEL_SN_STATION_ONE
	name = "Deck 1"
	base_turf = /turf/space
	transit_chance = 15
	holomap_offset_x = SOUTHERN_CROSS_HOLOMAP_MARGIN_X - SOUTHERN_CROSS_HOLOMAP_CENTER_GUTTER / 2
	holomap_offset_y = SOUTHERN_CROSS_HOLOMAP_MARGIN_Y //+ SOUTHERN_CROSS_MAP_SIZE*0

/datum/map_z_level/soluna_nexus/station/station_two
	z = Z_LEVEL_SN_STATION_TWO
	name = "Deck 2"
	base_turf = /turf/simulated/open
	transit_chance = 15
	holomap_offset_x = SOUTHERN_CROSS_HOLOMAP_MARGIN_X - SOUTHERN_CROSS_HOLOMAP_CENTER_GUTTER / 2
	holomap_offset_y = SOUTHERN_CROSS_HOLOMAP_MARGIN_Y + SOUTHERN_CROSS_MAP_SIZE

/datum/map_z_level/soluna_nexus/station/station_three
	z = Z_LEVEL_SN_STATION_THREE
	name = "Deck 3"
	base_turf = /turf/simulated/open
	transit_chance = 15
	holomap_offset_x = SOUTHERN_CROSS_HOLOMAP_MARGIN_X + SOUTHERN_CROSS_MAP_SIZE + SOUTHERN_CROSS_HOLOMAP_CENTER_GUTTER / 2
	holomap_offset_y = SOUTHERN_CROSS_HOLOMAP_MARGIN_Y + SOUTHERN_CROSS_MAP_SIZE

/* //CHOMPedit: Disabling empty space map level as overmap generation now generates this as needed.
/datum/map_z_level/southern_cross/empty_space
	z = Z_LEVEL_EMPTY_SPACE
	name = "Empty"
	flags = MAP_LEVEL_PLAYER
	transit_chance = 60
*/

// Surface Z-Level
/datum/map_z_level/soluna_nexus_lateload/surface
	name = Z_NAME_SC_SURFACE
	flags = MAP_LEVEL_CONTACT|MAP_LEVEL_PLAYER|MAP_LEVEL_SEALED|MAP_LEVEL_CONSOLES|MAP_LEVEL_VORESPAWN
	base_turf = /turf/simulated/floor/outdoors/rocks

/datum/map_template/soluna_nexus_lateload/surface
	name = Z_NAME_SC_SURFACE
	mappath = "modular_chomp/maps/southern_cross/southern_cross-5.dmm"
	associated_map_datum = /datum/map_z_level/soluna_nexus_lateload/surface

// Surface Mine Z-Level
/datum/map_z_level/soluna_nexus_lateload/surface_mine
	name = Z_NAME_SC_SURFACE_MINE
	flags = MAP_LEVEL_CONTACT|MAP_LEVEL_PLAYER|MAP_LEVEL_SEALED|MAP_LEVEL_CONSOLES
	base_turf = /turf/simulated/floor/outdoors/rocks

/datum/map_template/soluna_nexus_lateload/surface_mine
	name = Z_NAME_SC_SURFACE_MINE
	mappath = "modular_chomp/maps/southern_cross/southern_cross-6.dmm"
	associated_map_datum = /datum/map_z_level/soluna_nexus_lateload/surface_mine

// Surface Wild Z-Level
/datum/map_z_level/soluna_nexus_lateload/surface_wild
	name = Z_NAME_SC_SURFACE_WILD
	flags = MAP_LEVEL_PLAYER|MAP_LEVEL_SEALED|MAP_LEVEL_CONTACT|MAP_LEVEL_CONSOLES
	base_turf = /turf/simulated/floor/outdoors/rocks

/datum/map_template/soluna_nexus_lateload/surface_wild
	name = Z_NAME_SC_SURFACE_WILD
	mappath = "modular_chomp/maps/southern_cross/southern_cross-10.dmm"
	associated_map_datum = /datum/map_z_level/soluna_nexus_lateload/surface_wild

// Misc Z-Level
/datum/map_z_level/soluna_nexus_lateload/misc
	name = Z_NAME_SN_MISC
	flags = MAP_LEVEL_PLAYER|MAP_LEVEL_VORESPAWN
	transit_chance = 15

/datum/map_template/soluna_nexus_lateload/misc
	name = Z_NAME_SN_MISC
	name_alias = Z_NAME_ALIAS_MISC
	mappath = "modular_chomp/maps/soluna_nexus/soluna_nexus-6.dmm"
	associated_map_datum = /datum/map_z_level/soluna_nexus_lateload/misc

// Centcom Z-Level
/datum/map_z_level/soluna_nexus_lateload/centcom
	name = Z_NAME_SN_CENTCOM
	flags = MAP_LEVEL_ADMIN|MAP_LEVEL_CONTACT

/datum/map_template/soluna_nexus_lateload/centcom
	name = Z_NAME_SN_CENTCOM
	name_alias = Z_NAME_ALIAS_CENTCOM
	mappath = "modular_chomp/maps/soluna_nexus/soluna_nexus-7.dmm"
	associated_map_datum = /datum/map_z_level/soluna_nexus_lateload/centcom

// Transit Z-Level
/datum/map_z_level/soluna_nexus_lateload/transit
	name = Z_NAME_SN_TRANSIT
	flags = MAP_LEVEL_ADMIN|MAP_LEVEL_SEALED|MAP_LEVEL_PLAYER|MAP_LEVEL_CONTACT

/datum/map_template/soluna_nexus_lateload/transit
	name = Z_NAME_SN_TRANSIT
	mappath = "modular_chomp/maps/soluna_nexus/soluna_nexus-8.dmm"
	associated_map_datum = /datum/map_z_level/soluna_nexus_lateload/transit

//Thor Z-Level
/datum/map_z_level/soluna_nexus_lateload/thor
	name = Z_NAME_PLANET_THOR_CH
	flags = MAP_LEVEL_PLAYER|MAP_LEVEL_SEALED
	base_turf = /turf/simulated/floor/outdoors/rocks

/datum/map_template/common_lateload/thor
	associated_map_datum = /datum/map_z_level/soluna_nexus_lateload/thor

// Tyr Z-Level
/datum/map_z_level/soluna_nexus_lateload/valley
	name = Z_NAME_PLANET_TYR_CH
	flags = MAP_LEVEL_PLAYER|MAP_LEVEL_SEALED
	base_turf = /turf/simulated/floor/outdoors/rocks

/datum/map_template/common_lateload/tyr
	associated_map_datum = /datum/map_z_level/soluna_nexus_lateload/valley
