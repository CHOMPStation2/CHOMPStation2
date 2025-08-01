// To be filled out when more progress on the new map occurs.
//MATCH THE DEFINE NUMBER WITH THE ACTUAL Z-LEVEL THAT YOU SEE IN THE GAME
/*
those Z_LEVEL_WHATEVER defines need to line up with what's in game, they don't decide what levels they go on
the order of zlevels is determined only by the order they're loaded in, there's no other way
so those just need to be updated every time someone rearranges the level load order
but they don't actually change anything about the load order
*/

/datum/map/southern_cross
	name = "Southern Cross"
	full_name = "Southern Cross"
	path = "southern_cross"

	lobby_screens = list('modular_chomp/html/lobby/chompstation.webp')
	id_hud_icons = 'icons/mob/hud_jobs_vr.dmi'

	holomap_smoosh = list(list(
		Z_LEVEL_SC_STATION_MAINTS,
		Z_LEVEL_SC_STATION_ONE,
		Z_LEVEL_SC_STATION_TWO,
		Z_LEVEL_SC_STATION_THREE))

	zlevel_datum_type = /datum/map_z_level/southern_cross

	station_name  = "NLS Southern Cross"
	station_short = "Southern Cross"
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
							NETWORK_TELECOM
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
							NETWORK_SUPPLY
							)
	usable_email_tlds = list("freemail.nt")
	allowed_spawns = list("Arrivals Shuttle","Gateway", "Cryogenic Storage", "Cyborg Storage", "Station gateway", "Sif plains", "Fuel Depot", "Tyr Wreckage", "The Dark")
	default_skybox = /datum/skybox_settings/southern_cross
	unit_test_exempt_areas = list(/area/ninja_dojo, /area/shuttle/ninja)
	unit_test_exempt_from_atmos = list(/area/tcomm/chamber)

	planet_datums_to_make = list(/datum/planet/sif,/datum/planet/thor, /datum/planet/tyr) //This must be added to load maps at round start otherwise they will have weather or sun.

	map_levels = list(
			Z_LEVEL_SC_STATION_MAINTS,
			Z_LEVEL_SC_STATION_ONE,
			Z_LEVEL_SC_STATION_TWO,
			Z_LEVEL_SC_STATION_THREE,
			Z_NAME_SC_SURFACE,
			Z_NAME_SC_SURFACE_MINE,
			Z_NAME_SC_MISC,
		)


	// Framework for porting Tether's lateload Z-Level system //Stock lateload maps
	lateload_z_levels = list(
			list(Z_NAME_VR_WORLD_CH),
			list(Z_NAME_FUELDEPOT_CH),
			list(Z_NAME_PLANET_THOR_CH),
			list(Z_NAME_PLANET_TYR_CH)
			)

	lateload_gateway = list(
		list(Z_NAME_GATEWAY_SNOW_FIELD_CH),
		list(Z_NAME_GATEWAY_MADNESS_LAB_CH),
		list(Z_NAME_GATEWAY_ABANDONED_CITY_CH),
		list(Z_NAME_GATEWAY_SKYSCRAPER_CH)
		) // Gateway maps. For now nothing fancy, just some already existing maps while we make our own.

	lateload_gateway = null

/datum/map/southern_cross/perform_map_generation()
	// First, place a bunch of submaps. This comes before tunnel/forest generation as to not interfere with the submap.(This controls POI limit generation, increase or lower its values to have more or less POI's)

	// Cave submaps are first.
	seed_submaps(list(Z_NAME_SC_SURFACE_MINE), 140, /area/surface/cave/unexplored/normal, /datum/map_template/surface/mountains/normal)  //CHOMPEdit bumped up from 60 to 80
	seed_submaps(list(Z_NAME_SC_SURFACE_MINE), 140, /area/surface/cave/unexplored/deep, /datum/map_template/surface/mountains/deep)  //CHOMPEdit bumped up from 60 to 80
	// Plains to make them less plain.
	seed_submaps(list(Z_NAME_SC_SURFACE), 220, /area/surface/outside/plains/normal, /datum/map_template/surface/plains) // Center area is WIP until map editing settles down.  //CHOMPEdit bumped up from 80 to 140
	// Wilderness is next.
	seed_submaps(list(Z_NAME_SC_SURFACE_WILD), 240, /area/surface/outside/wilderness/normal, /datum/map_template/surface/wilderness/normal)  //CHOMPEdit bumped up from 60 to 150
	seed_submaps(list(Z_NAME_SC_SURFACE_WILD), 240, /area/surface/outside/wilderness/deep, /datum/map_template/surface/wilderness/deep)  //CHOMPEdit bumped up from 60 to 150
	// If Space submaps are made, add a line to make them here as well.

	// Now for the tunnels. (This decides the load order of ore generation and cave generation. Check Random_Map to see % )
	new /datum/random_map/automata/cave_system/(null, 1, 1, Z_NAME_SC_SURFACE_MINE, world.maxx, world.maxy) // Create the mining Z-level.
	new /datum/random_map/noise/ore(null, 1, 1, Z_NAME_SC_SURFACE_MINE, 64, 64)         // Create the mining ore distribution map.
	// Todo: Forest generation.
	return 1

// Skybox Settings
/datum/skybox_settings/southern_cross
	icon_state = "dyable"
	random_color = TRUE
// For making the 6-in-1 holomap, we calculate some offsets
#define SOUTHERN_CROSS_MAP_SIZE 160 // Width and height of compiled in Southern Cross z levels.
#define SOUTHERN_CROSS_HOLOMAP_CENTER_GUTTER 40 // 40px central gutter between columns
#define SOUTHERN_CROSS_HOLOMAP_MARGIN_X ((HOLOMAP_ICON_SIZE - (2*SOUTHERN_CROSS_MAP_SIZE) - SOUTHERN_CROSS_HOLOMAP_CENTER_GUTTER) / 2) // 100
#define SOUTHERN_CROSS_HOLOMAP_MARGIN_Y ((HOLOMAP_ICON_SIZE - (3*SOUTHERN_CROSS_MAP_SIZE)) / 2) // 60

/datum/map_z_level/southern_cross/station
	flags = MAP_LEVEL_STATION|MAP_LEVEL_CONTACT|MAP_LEVEL_PLAYER|MAP_LEVEL_CONSOLES|MAP_LEVEL_VORESPAWN
	holomap_legend_x = 220
	holomap_legend_y = 160

/datum/map_z_level/southern_cross/station/station_maintenance
	z = Z_LEVEL_SC_STATION_MAINTS
	name = "Maintenance Deck"
	transit_chance = 15
	holomap_offset_x = HOLOMAP_ICON_SIZE - SOUTHERN_CROSS_HOLOMAP_MARGIN_X - SOUTHERN_CROSS_MAP_SIZE - 40
	holomap_offset_y = SOUTHERN_CROSS_HOLOMAP_MARGIN_Y + SOUTHERN_CROSS_MAP_SIZE*1

/datum/map_z_level/southern_cross/station/station_one
	z = Z_LEVEL_SC_STATION_ONE
	name = "Deck 1"
	base_turf = /turf/space
	transit_chance = 15
	holomap_offset_x = SOUTHERN_CROSS_HOLOMAP_MARGIN_X - 40
	holomap_offset_y = SOUTHERN_CROSS_HOLOMAP_MARGIN_Y + SOUTHERN_CROSS_MAP_SIZE*0

/datum/map_z_level/southern_cross/station/station_two
	z = Z_LEVEL_SC_STATION_TWO
	name = "Deck 2"
	base_turf = /turf/simulated/open
	transit_chance = 15
	holomap_offset_x = SOUTHERN_CROSS_HOLOMAP_MARGIN_X - 40
	holomap_offset_y = SOUTHERN_CROSS_HOLOMAP_MARGIN_Y + SOUTHERN_CROSS_MAP_SIZE*1

/datum/map_z_level/southern_cross/station/station_three
	z = Z_LEVEL_SC_STATION_THREE
	name = "Deck 3"
	base_turf = /turf/simulated/open
	transit_chance = 15
	holomap_offset_x = HOLOMAP_ICON_SIZE - SOUTHERN_CROSS_HOLOMAP_MARGIN_X - SOUTHERN_CROSS_MAP_SIZE - 40
	holomap_offset_y = SOUTHERN_CROSS_HOLOMAP_MARGIN_Y + SOUTHERN_CROSS_MAP_SIZE*1

/datum/map_z_level/southern_cross/surface
	name = Z_NAME_SC_SURFACE
	flags = MAP_LEVEL_CONTACT|MAP_LEVEL_PLAYER|MAP_LEVEL_SEALED|MAP_LEVEL_CONSOLES|MAP_LEVEL_VORESPAWN
	base_turf = /turf/simulated/floor/outdoors/rocks

/datum/map_z_level/southern_cross/surface_mine
	name = Z_NAME_SC_SURFACE_MINE
	flags = MAP_LEVEL_CONTACT|MAP_LEVEL_PLAYER|MAP_LEVEL_SEALED|MAP_LEVEL_CONSOLES
	base_turf = /turf/simulated/floor/outdoors/rocks

/datum/map_z_level/southern_cross/surface_wild
	name = Z_NAME_SC_SURFACE_WILD
	flags = MAP_LEVEL_PLAYER|MAP_LEVEL_SEALED|MAP_LEVEL_CONTACT|MAP_LEVEL_CONSOLES
	base_turf = /turf/simulated/floor/outdoors/rocks

/datum/map_z_level/southern_cross/misc
	name = Z_NAME_SC_MISC
	flags = MAP_LEVEL_PLAYER|MAP_LEVEL_VORESPAWN
	transit_chance = 15

/datum/map_z_level/southern_cross/centcom
	name = Z_NAME_SC_CENTCOM
	flags = MAP_LEVEL_ADMIN|MAP_LEVEL_CONTACT

/datum/map_z_level/southern_cross/transit
	name = Z_NAME_SC_TRANSIT
	flags = MAP_LEVEL_ADMIN|MAP_LEVEL_SEALED|MAP_LEVEL_PLAYER|MAP_LEVEL_CONTACT

//Thor Z-Level
/datum/map_z_level/southern_cross/thor
	name = Z_NAME_PLANET_THOR_CH
	flags = MAP_LEVEL_PLAYER|MAP_LEVEL_SEALED
	base_turf = /turf/simulated/floor/outdoors/rocks

/datum/map_z_level/southern_cross/valley
	name = Z_NAME_PLANET_TYR_CH
	flags = MAP_LEVEL_PLAYER|MAP_LEVEL_SEALED
	base_turf = /turf/simulated/floor/outdoors/rocks

/datum/map/southern_cross/get_map_info()
	. = list()
	. +=  "The NLS [full_name] is a small waystation in orbit of the frozen garden world of Sif, jewel of the Vir system.<br>"
	. +=  "Though Vir is typically peaceful, the system has seen its fair share of conflict in the face of technological extremists, rogue drone intelligence, and worse.<br>"
	. +=  "As an employee of NanoTrasen, operators of the Southern Cross and one of the galaxy's largest research corporations, you're probably just here to do a job."
	return jointext(., "<br>")
