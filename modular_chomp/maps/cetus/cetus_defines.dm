/datum/map/cetus
	name = "Cetus"
	full_name = "Cetus Station"
	path = "cetus"

	lobby_screens = list('modular_chomp/html/lobby/chompstation.webp')
	id_hud_icons = 'icons/mob/hud_jobs_vr.dmi'

	holomap_smoosh = list(list(
		Z_LEVEL_CETUS_STATION_ONE,
		Z_LEVEL_CETUS_STATION_TWO,
		Z_LEVEL_CETUS_STATION_THREE,
		))

	zlevel_datum_type = /datum/map_z_level/cetus

	station_name  = "NSS Cetus"
	station_short = "Cetus Station"
	dock_name     = "NCS Northern Star"
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
	emergency_shuttle_docked_message = "The Emergency Shuttle has docked with the station at docks two and three. You have approximately %ETD% to board the Emergency Shuttle."
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
	allowed_spawns = list("Arrivals Shuttle","Gateway", "Cryogenic Storage", "Cyborg Storage", "Station gateway", "Sif plains", "Fuel Depot", "Tyr Wreckage", "The Dark")
	default_skybox = /datum/skybox_settings/cetus
	unit_test_exempt_areas = list(/area/ninja_dojo, /area/shuttle/ninja, /area/thirddeck/roof, /area/hallway/secondary/entry/D2/arrivals, /area/asteroid/cetus)
	unit_test_exempt_from_atmos = list(/area/tcomm/chamber, /area/maintenance/cetus/mainsupport, /area/maintenance/cetus/auxsupport)

	planet_datums_to_make = list(/datum/planet/sif, /datum/planet/thor, /datum/planet/tyr) //This must be added to load maps at round start otherwise they will have weather or sun.

	unit_test_z_levels = list(
		Z_LEVEL_CETUS_STATION_ONE,
		Z_LEVEL_CETUS_STATION_TWO,
		Z_LEVEL_CETUS_STATION_THREE,
		)

	lateload_z_levels = list(
		list(Z_NAME_SC_SURFACE),
		list(Z_NAME_SC_SURFACE_MINE),
		list(Z_NAME_SC_SURFACE_WILD),
		list(Z_NAME_CETUS_MISC),
		list(Z_NAME_CETUS_CENTCOM),
		list(Z_NAME_CETUS_TRANSIT),
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

/datum/map/cetus/perform_map_generation()
	// First, place a bunch of submaps. This comes before tunnel/forest generation as to not interfere with the submap.(This controls POI limit generation, increase or lower its values to have more or less POI's)

	// Cave submaps are first.
	var/surface_mine_z = GLOB.map_templates_loaded[Z_NAME_ALIAS_SURFACE_MINES]
	seed_submaps(list(surface_mine_z), 140, /area/surface/cave/unexplored/normal, /datum/map_template/surface/mountain_ch/normal)  //CHOMPEdit bumped up from 60 to 80
	seed_submaps(list(surface_mine_z), 140, /area/surface/cave/unexplored/deep, /datum/map_template/surface/mountain_ch/deep)  //CHOMPEdit bumped up from 60 to 80

	// Plains to make them less plain.
	var/surface_z = GLOB.map_templates_loaded[Z_NAME_ALIAS_SURFACE]
	seed_submaps(list(surface_z), 220, /area/surface/outside/plains/normal, /datum/map_template/surface/plains_ch) // Center area is WIP until map editing settles down.  //CHOMPEdit bumped up from 80 to 140

	// Wilderness is next.
	var/surface_wild_z = GLOB.map_templates_loaded[Z_NAME_ALIAS_SURFACE_WILDS]
	seed_submaps(list(surface_wild_z), 240, /area/surface/outside/wilderness/normal, /datum/map_template/surface/wilderness_ch/normal)  //CHOMPEdit bumped up from 60 to 150
	seed_submaps(list(surface_wild_z), 240, /area/surface/outside/wilderness/deep, /datum/map_template/surface/wilderness_ch/deep)  //CHOMPEdit bumped up from 60 to 150
	// If Space submaps are made, add a line to make them here as well.

	// Now for the tunnels. (This decides the load order of ore generation and cave generation. Check Random_Map to see % )
	new /datum/random_map/automata/cave_system/(null, 1, 1, surface_mine_z, world.maxx, world.maxy) // Create the mining Z-level.
	new /datum/random_map/noise/ore(null, 1, 1, surface_mine_z, 64, 64)         // Create the mining ore distribution map.
	// Populate the asteroid itself with ore
	var/cetusz1 = GLOB.map_templates_loaded[Z_LEVEL_CETUS_STATION_ONE]
	var/cetusz2 = GLOB.map_templates_loaded[Z_LEVEL_CETUS_STATION_TWO]
	var/cetusz3 = GLOB.map_templates_loaded[Z_LEVEL_CETUS_STATION_THREE]
	new /datum/random_map/noise/ore(null, 1, 1, cetusz1, 64, 64)         // Create the asteroid ore distribution map.
	new /datum/random_map/noise/ore(null, 1, 1, cetusz2, 64, 64)
	new /datum/random_map/noise/ore(null, 1, 1, cetusz3, 64, 64)
	return 1

/datum/map/cetus/get_map_info()
	. = list()
	. +=  "The NSS [full_name] is a repurposed asteroid base in orbit of the frozen garden world of Sif, jewel of the Vir system.<br>"
	. +=  "Though Vir is typically peaceful, the system has seen its fair share of conflict in the face of technological extremists, rogue drone intelligence, and worse.<br>"
	. +=  "As an employee of NanoTrasen, operators of the NSS Cetus and one of the galaxy's largest research corporations, you're probably just here to do a job."
	return jointext(., "<br>")

// Skybox Settings
/datum/skybox_settings/cetus
	icon_state = "dyable"
	random_color = TRUE

// Lateload handling
/datum/map_template/cetus_lateload
	allow_duplicates = FALSE
	var/associated_map_datum

/datum/map_template/cetus_lateload/on_map_loaded(z)
	if(!associated_map_datum || !ispath(associated_map_datum))
		log_game("Extra z-level [src] has no associated map datum")
		return

	new associated_map_datum(using_map, z)
	return ..()

/datum/map_z_level/cetus_lateload/New(datum/map/map, mapZ)
	z = mapZ
	return ..(map)


// For making the 4-in-1 holomap, we calculate some offsets
#define CETUS_MAP_SIZE 225 // Width and height of compiled in Cetus z levels.
#define CETUS_HOLOMAP_CENTER_GUTTER 40 // 40px central gutter between columns
#define CETUS_HOLOMAP_MARGIN_X ((HOLOMAP_ICON_SIZE - (2*CETUS_MAP_SIZE) - CETUS_HOLOMAP_CENTER_GUTTER) / 2)
#define CETUS_HOLOMAP_MARGIN_Y ((HOLOMAP_ICON_SIZE - (2*CETUS_MAP_SIZE)) / 2)

// Station Z-Levels
/datum/map_z_level/cetus/station
	flags = MAP_LEVEL_STATION|MAP_LEVEL_CONTACT|MAP_LEVEL_PLAYER|MAP_LEVEL_CONSOLES|MAP_LEVEL_VORESPAWN
	holomap_legend_x = 220
	holomap_legend_y = 160

/datum/map_z_level/cetus/station/station_one
	z = Z_LEVEL_CETUS_STATION_ONE
	name = "Deck 1"
	base_turf = /turf/simulated/open
	transit_chance = 15
	holomap_offset_x = CETUS_HOLOMAP_MARGIN_X - 40
	holomap_offset_y = CETUS_HOLOMAP_MARGIN_Y //+ SOUTHERN_CROSS_MAP_SIZE*0

/datum/map_z_level/cetus/station/station_two
	z = Z_LEVEL_CETUS_STATION_TWO
	name = "Deck 2"
	base_turf = /turf/simulated/open
	transit_chance = 15
	holomap_offset_x = CETUS_HOLOMAP_MARGIN_X - 40
	holomap_offset_y = CETUS_HOLOMAP_MARGIN_Y + CETUS_MAP_SIZE

/datum/map_z_level/cetus/station/station_three
	z = Z_LEVEL_CETUS_STATION_THREE
	name = "Deck 3"
	base_turf = /turf/simulated/open
	transit_chance = 15
	holomap_offset_x = HOLOMAP_ICON_SIZE - CETUS_HOLOMAP_MARGIN_X - CETUS_MAP_SIZE - 40
	holomap_offset_y = CETUS_HOLOMAP_MARGIN_Y + CETUS_MAP_SIZE

// Surface Z-Level
/datum/map_z_level/cetus_lateload/surface
	name = Z_NAME_SC_SURFACE
	flags = MAP_LEVEL_CONTACT|MAP_LEVEL_PLAYER|MAP_LEVEL_SEALED|MAP_LEVEL_CONSOLES|MAP_LEVEL_VORESPAWN
	base_turf = /turf/simulated/floor/outdoors/rocks

/datum/map_template/cetus_lateload/surface
	name = Z_NAME_SC_SURFACE
	name_alias = Z_NAME_ALIAS_SURFACE
	mappath = "modular_chomp/maps/southern_cross/southern_cross-5.dmm"
	associated_map_datum = /datum/map_z_level/cetus_lateload/surface

// Surface Mines Z-Level
/datum/map_z_level/cetus_lateload/surface_mine
	name = Z_NAME_SC_SURFACE_MINE
	flags = MAP_LEVEL_CONTACT|MAP_LEVEL_PLAYER|MAP_LEVEL_SEALED|MAP_LEVEL_CONSOLES
	base_turf = /turf/simulated/floor/outdoors/rocks

/datum/map_template/cetus_lateload/surface_mine
	name = Z_NAME_SC_SURFACE_MINE
	name_alias = Z_NAME_ALIAS_SURFACE_MINES
	mappath = "modular_chomp/maps/southern_cross/southern_cross-6.dmm"
	associated_map_datum = /datum/map_z_level/cetus_lateload/surface_mine

// Surface Wilds Z-Level
/datum/map_z_level/cetus_lateload/surface_wild
	name = Z_NAME_SC_SURFACE_WILD
	flags = MAP_LEVEL_PLAYER|MAP_LEVEL_SEALED|MAP_LEVEL_CONTACT|MAP_LEVEL_CONSOLES
	base_turf = /turf/simulated/floor/outdoors/rocks

/datum/map_template/cetus_lateload/surface_wild
	name = Z_NAME_SC_SURFACE_WILD
	name_alias = Z_NAME_ALIAS_SURFACE_WILDS
	mappath = "modular_chomp/maps/southern_cross/southern_cross-10.dmm"
	associated_map_datum = /datum/map_z_level/cetus_lateload/surface_wild

// Misc Z-Level
/datum/map_z_level/cetus_lateload/misc
	name = Z_NAME_CETUS_MISC
	flags = MAP_LEVEL_PLAYER|MAP_LEVEL_VORESPAWN
	transit_chance = 15

/datum/map_template/cetus_lateload/misc
	name = Z_NAME_CETUS_MISC
	name_alias = Z_NAME_ALIAS_MISC
	mappath = "modular_chomp/maps/cetus/cetus-6.dmm"
	associated_map_datum = /datum/map_z_level/cetus_lateload/misc

// Centcom Z-Level
/datum/map_z_level/cetus_lateload/centcom
	name = Z_NAME_CETUS_CENTCOM
	flags = MAP_LEVEL_ADMIN|MAP_LEVEL_CONTACT

/datum/map_template/cetus_lateload/centcom
	name = Z_NAME_CETUS_CENTCOM
	name_alias = Z_NAME_ALIAS_CENTCOM
	mappath = "modular_chomp/maps/cetus/cetus-7.dmm"
	associated_map_datum = /datum/map_z_level/cetus_lateload/centcom

// Transit Z-Level
/datum/map_z_level/cetus_lateload/transit
	name = Z_NAME_CETUS_TRANSIT
	flags = MAP_LEVEL_ADMIN|MAP_LEVEL_SEALED|MAP_LEVEL_PLAYER|MAP_LEVEL_CONTACT

/datum/map_template/cetus_lateload/transit
	name = Z_NAME_CETUS_TRANSIT
	mappath = "modular_chomp/maps/cetus/cetus-8.dmm"
	associated_map_datum = /datum/map_z_level/cetus_lateload/transit

//Thor Z-Level
/datum/map_z_level/cetus_lateload/thor
	name = Z_NAME_PLANET_THOR_CH
	flags = MAP_LEVEL_PLAYER|MAP_LEVEL_SEALED
	base_turf = /turf/simulated/floor/outdoors/rocks

/datum/map_template/common_lateload/thor
	associated_map_datum = /datum/map_z_level/cetus_lateload/thor

// Tyr Z-Level
/datum/map_z_level/cetus_lateload/valley
	name = Z_NAME_PLANET_TYR_CH
	flags = MAP_LEVEL_PLAYER|MAP_LEVEL_SEALED
	base_turf = /turf/simulated/floor/outdoors/rocks

/datum/map_template/common_lateload/tyr
	associated_map_datum = /datum/map_z_level/cetus_lateload/valley
