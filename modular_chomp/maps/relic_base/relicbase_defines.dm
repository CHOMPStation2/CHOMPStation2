// To be filled out when more progress on the new map occurs.
/datum/map/relicbase
	name = "Relic Base"
	full_name = "NLS Relic Base"
	path = "relicbase"

	lobby_screens = list('modular_chomp/html/lobby/chompstation.webp')
	id_hud_icons = 'icons/mob/hud_jobs_vr.dmi'

	holomap_smoosh = list(list(
		Z_LEVEL_RB_UNDERGROUND,
		Z_LEVEL_RB_SURFACE,
		Z_LEVEL_RB_UPPER_FLOORS,
		))

	zlevel_datum_type = /datum/map_z_level/relicbase

	station_name  = "NLS Forbearance"
	station_short = "Forbearance"
	dock_name     = "NCS Lambda" // NCC - Nanotrasen Command Colony
	boss_name     = "Central Command"
	boss_short    = "Centcom"
	company_name  = "NanoTrasen"
	company_short = "NT"
	starsys_name  = "Vir"
	use_overmap = TRUE
	overmap_size = 50
	overmap_event_areas = 44

	shuttle_docked_message = "The scheduled tram to the %dock_name% has arrived at departures. It will depart in approximately %ETD%."
	shuttle_leaving_dock = "The Crew Transfer Tram has left the colony. Estimate %ETA% until the tram arrives at %dock_name%."
	shuttle_called_message = "A crew transfer to %dock_name% has been scheduled. The tram has been called. Those leaving should proceed to the departures tram station in approximately %ETA%."
	shuttle_recall_message = "The scheduled crew transfer has been cancelled."
	emergency_shuttle_docked_message = "The Emergency Tram has arrived to the Forbearance's tram station. You have approximately %ETD% to board the Emergency Tram."
	emergency_shuttle_leaving_dock = "The Emergency Tram has left the colony. Estimate %ETA% until the tram docks at %dock_name%."
	emergency_shuttle_called_message = "An emergency evacuation tram has been called. It will arrive at the Forbearance tram station in approximately %ETA%."
	emergency_shuttle_recall_message = "The emergency tram has been recalled."

	// Networks that will show up as options in the camera monitor program
	station_networks = list(
							NETWORK_CARGO,
							NETWORK_CIRCUITS,
							NETWORK_CIVILIAN,
							NETWORK_COMMAND,
							NETWORK_ENGINE,
							NETWORK_ENGINEERING,
							NETWORK_EXTERIOR,
							NETWORK_MEDICAL,
							NETWORK_MINE,
							NETWORK_RESEARCH,
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
	allowed_spawns = list("Arrivals Shuttle","Gateway", "Cryogenic Storage", "Cyborg Storage", "Station gateway")
	default_skybox = /datum/skybox_settings/relicbase
	unit_test_exempt_areas = list(/area/ninja_dojo, /area/shuttle/ninja)
	unit_test_exempt_from_atmos = list(/area/tcomm/chamber)

	planet_datums_to_make = list(/datum/planet/thor) //This must be added to load maps at round start otherwise they will have weather or sun.

	unit_test_z_levels = list(
		Z_LEVEL_RB_CATACOMBS,
		Z_LEVEL_RB_UNDERGROUND,
		Z_LEVEL_RB_SURFACE,
		Z_LEVEL_RB_UPPER_FLOORS,
		Z_LEVEL_RB_THE_SKY,
		)

	lateload_z_levels = list(
		list(Z_NAME_RB_UNDERMINES),
		list(Z_NAME_RB_SURFACE_WILDS),
		list(Z_NAME_RB_WILDERNESS_SKY),
		list(Z_NAME_RB_SURFACE_OCEAN),
		list(Z_NAME_RB_SURFACE_MINES),
		list(Z_NAME_RB_CARRIER),
		list(Z_NAME_RB_CENTCOM),
		list(Z_NAME_RB_TRANSIT),
		list(Z_NAME_FUELDEPOT_CH),
		)

	lateload_gateway = list(
		list(Z_NAME_GATEWAY_SNOW_FIELD_CH),
		list(list(Z_NAME_GATEWAY_HONLETH_A, Z_NAME_GATEWAY_HONLETH_B)),
		list(Z_NAME_GATEWAY_ARYNTHI_CAVE_A, Z_NAME_GATEWAY_ARYNTHI_A),
		list(Z_NAME_GATEWAY_ARYNTHI_CAVE_B, Z_NAME_GATEWAY_ARYNTHI_B),
		list(Z_NAME_GATEWAY_WILD_WEST),
		list(Z_NAME_GATEWAY_MADNESS_LAB_CH),
		list(Z_NAME_GATEWAY_ABANDONED_CITY_CH),
		)

	lateload_redgate = list(
		list(Z_NAME_REDGATE_TEPPI_RANCH),
		list(Z_NAME_REDGATE_INNLAND),
		list(Z_NAME_REDGATE_DARK_ADVENTURE),
		list(Z_NAME_REDGATE_EGGNOG_CAVE, Z_NAME_REDGATE_EGGNOG_TOWN),
		list(Z_NAME_REDGATE_STAR_DOG),
		list(Z_NAME_REDGATE_HOTSPRINGS),
		list(Z_NAME_REDGATE_RAIN_CITY),
		list(Z_NAME_REDGATE_ISLANDS_UNDERWATER, Z_NAME_REDGATE_ISLANDS),
		list(Z_NAME_REDGATE_MOVING_TRAIN, Z_NAME_REDGATE_MOVING_TRAIN_UPPER),
		list(Z_NAME_REDGATE_FANTASY_DUNGEON, Z_NAME_REDGATE_FANTASY_TOWN),
		list(Z_NAME_REDGATE_LASERDOME),
		list(Z_NAME_REDGATE_CASCADING_FALLS),
		list(Z_NAME_REDGATE_JUNGLE_CAVE, Z_NAME_REDGATE_JUNGLE),
		)


// Commented out due to causing a lot of bugs. The base proc plus overmap achieves this functionality anyways.
/*
// Short range computers see only the six main levels, others can see the surrounding surface levels.
/datum/map/southern_cross/get_map_levels(var/srcz, var/long_range = TRUE)
	if (long_range && (srcz in map_levels))
		return map_levels
	else if (srcz == Z_LEVEL_RB_TRANSIT && !long_range)
		return list() // Nothing on these z-levels- sensors won't show, and GPSes won't see each other.
	else if (srcz >= Z_LEVEL_STATION_ONE && srcz <= Z_LEVEL_STATION_THREE) // Station can see other decks.
		return list(
			Z_LEVEL_STATION_ONE,
			Z_LEVEL_STATION_TWO,
			Z_LEVEL_STATION_THREE,
			Z_LEVEL_RB_SURFACE,
			Z_LEVEL_RB_SURFACE_MINE,
			Z_LEVEL_RB_SURFACE_WILD)
	else if(srcz in list(Z_LEVEL_RB_SURFACE, Z_LEVEL_RB_SURFACE_MINE, Z_LEVEL_RB_SURFACE_WILD)) // Being on the surface lets you see other surface Zs.
		return list(
			Z_LEVEL_RB_SURFACE,
			Z_LEVEL_RB_SURFACE_MINE,
			Z_LEVEL_RB_SURFACE_WILD)
	else
		return list(srcz) //prevents runtimes when using CMC. any Z-level not defined above will be 'isolated' and only show to GPSes/CMCs on that same Z (e.g. CentCom).
*/
/datum/map/relicbase/perform_map_generation()
	// First, place a bunch of submaps. This comes before tunnel/forest generation as to not interfere with the submap.(This controls POI limit generation, increase or lower its values to have more or less POI's)

	// Cave submaps are first.
	var/undermines_z = GLOB.map_templates_loaded[Z_NAME_RB_UNDERMINES]
	var/surface_mines_z = GLOB.map_templates_loaded[Z_NAME_ALIAS_SURFACE_MINES]
	seed_submaps(list(undermines_z), 140, /area/surface/cave/unexplored/normal, datum/map_template/surface/mountain_ch/normal)
	seed_submaps(list(undermines_z), 140, /area/surface/cave/unexplored/deep, datum/map_template/surface/mountain_ch/deep)
	seed_submaps(list(surface_mines_z), 140, /area/surface/outside/wilderness/mountains, datum/map_template/surface/mountain_ch/normal)

	// Plains to make them less plain.
	var/surface_ocean_z = GLOB.map_templates_loaded[Z_NAME_ALIAS_SURFACE]
	seed_submaps(list(Z_LEVEL_RB_SURFACE), 220, /area/surface/outside/plains/normal, /datum/map_template/surface/plains_ch) // Both of these will need a massive POI overhaul. The framework is in, and tiles will be mass-edited to match, but better POIs are wanted.
	seed_submaps(list(surface_ocean_z), 220, /area/surface/outside/plains/normal, /datum/map_template/surface/plains_ch) // Both of these will need a massive POI overhaul. The framework is in, and tiles will be mass-edited to match, but better POIs are wanted.

	// Wilderness is next.
	var/surface_wilds_z = GLOB.map_templates_loaded[Z_NAME_ALIAS_SURFACE_WILDS]
	seed_submaps(list(surface_wilds_z), 240, /area/surface/outside/wilderness/normal, /datum/map_template/surface/wilderness_ch/normal)
	seed_submaps(list(surface_wilds_z), 240, /area/surface/outside/wilderness/deep, /datum/map_template/surface/wilderness_ch/deep)
	// If Space submaps are made, add a line to make them here as well.

	// Now for the tunnels. (This decides the load order of ore generation and cave generation. Check Random_Map to see % )
	new /datum/random_map/automata/cave_system/no_cracks(null, 1, 1, undermines_z, world.maxx, world.maxy) // Create the mining Z-level.
	new /datum/random_map/noise/ore(null, 1, 1, undermines_z, 64, 64)         // Create the mining ore distribution map.
	new /datum/random_map/automata/cave_system/no_cracks(null, 1, 1, surface_mines_z, world.maxx, world.maxy) // Create the mining Z-level.
	new /datum/random_map/noise/ore(null, 1, 1, surface_mines_z, 64, 64)
	// Todo: Forest generation.
	return 1

/datum/map/relicbase/get_map_info()
	. = list()
	. +=  "The NTCS [full_name] is a small mining colony on Sif's lush, earthlike moon, Thor. NTCS [full_name] was previously an SGC Military installation, established originally in 2405.<br>"
	. +=  "Though Vir is typically peaceful, the system has seen its fair share of conflict in the face of technological extremists, rogue drone intelligence, and worse.<br>"
	. +=  "As an employee of NanoTrasen, operators of the Relic Base and one of the galaxy's largest research corporations, you're probably just here to do a job."
	return jointext(., "<br>")

// Skybox Settings
/datum/skybox_settings/relicbase
	icon_state = "dyable"
	random_color = TRUE

// Lateload handling
/datum/map_template/relicbase_lateload
	allow_duplicates = FALSE
	var/associated_map_datum

/datum/map_template/relicbase_lateload/on_map_loaded(z)
	if(!associated_map_datum || !ispath(associated_map_datum))
		log_game("Extra z-level [src] has no associated map datum")
		return

	new associated_map_datum(using_map, z)
	return ..()

/datum/map_z_level/relicbase_lateload/New(datum/map/map, mapZ)
	z = mapZ
	return ..(map)

// For making the 6-in-1 holomap, we calculate some offsets
#define SOUTHERN_CROSS_MAP_SIZE 160 // Width and height of compiled in Southern Cross z levels.
#define SOUTHERN_CROSS_HOLOMAP_CENTER_GUTTER 40 // 40px central gutter between columns
#define SOUTHERN_CROSS_HOLOMAP_MARGIN_X ((HOLOMAP_ICON_SIZE - (2*SOUTHERN_CROSS_MAP_SIZE) - SOUTHERN_CROSS_HOLOMAP_CENTER_GUTTER) / 2) // 100
#define SOUTHERN_CROSS_HOLOMAP_MARGIN_Y ((HOLOMAP_ICON_SIZE - (3*SOUTHERN_CROSS_MAP_SIZE)) / 2) // 60

// Station Z-Levels
/datum/map_z_level/relicbase/station
	flags = MAP_LEVEL_STATION|MAP_LEVEL_CONTACT|MAP_LEVEL_PLAYER|MAP_LEVEL_CONSOLES|MAP_LEVEL_VORESPAWN|MAP_LEVEL_XENOARCH_EXEMPT
	holomap_legend_x = 220
	holomap_legend_y = 160

/datum/map_z_level/relicbase/station/catacombs
	z = Z_LEVEL_RB_CATACOMBS
	name = "Catacombs"
	base_turf = /turf/simulated/mineral/floor/cave
	transit_chance = 10

/datum/map_z_level/relicbase/station/station_one
	z = Z_LEVEL_RB_UNDERGROUND
	name = "Underground"
	base_turf = /turf/simulated/mineral/floor/cave
	transit_chance = 10
	holomap_offset_x = SOUTHERN_CROSS_HOLOMAP_MARGIN_X - 40
	holomap_offset_y = SOUTHERN_CROSS_HOLOMAP_MARGIN_Y //+ SOUTHERN_CROSS_MAP_SIZE*0

/datum/map_z_level/relicbase/station/station_two
	z = Z_LEVEL_RB_SURFACE
	name = "Surface"
	base_turf = /turf/simulated/open
	transit_chance = 10
	holomap_offset_x = SOUTHERN_CROSS_HOLOMAP_MARGIN_X - 40
	holomap_offset_y = SOUTHERN_CROSS_HOLOMAP_MARGIN_Y + SOUTHERN_CROSS_MAP_SIZE

/datum/map_z_level/relicbase/station/station_three
	z = Z_LEVEL_RB_UPPER_FLOORS
	name = "Upper Levels"
	base_turf = /turf/simulated/open
	transit_chance = 10
	holomap_offset_x = HOLOMAP_ICON_SIZE - SOUTHERN_CROSS_HOLOMAP_MARGIN_X - SOUTHERN_CROSS_MAP_SIZE - 40
	holomap_offset_y = SOUTHERN_CROSS_HOLOMAP_MARGIN_Y + SOUTHERN_CROSS_MAP_SIZE

/datum/map_z_level/relicbase/station/thesky
	z = Z_LEVEL_RB_THE_SKY
	name = "Sky"
	base_turf = /turf/simulated/open
	transit_chance = 10

/* //CHOMPedit: Disabling empty space map level as overmap generation now generates this as needed.
/datum/map_z_level/southern_cross/empty_space
	z = Z_LEVEL_EMPTY_SPACE
	name = "Empty"
	flags = MAP_LEVEL_PLAYER
	transit_chance = 60
*/
/*
/datum/map_z_level/relicbase/surface
	z = Z_LEVEL_RB_SURFACE
	name = "Plains"
	flags = MAP_LEVEL_CONTACT|MAP_LEVEL_PLAYER|MAP_LEVEL_SEALED|MAP_LEVEL_CONSOLES|MAP_LEVEL_VORESPAWN
	base_turf = /turf/simulated/floor/outdoors/rocks
*/

// Underground Mine Z-Level
/datum/map_z_level/relicbase_lateload/undeground_mine
	name = Z_NAME_RB_UNDERMINES //"Underground Mines"
	flags = MAP_LEVEL_CONTACT|MAP_LEVEL_PLAYER|MAP_LEVEL_SEALED|MAP_LEVEL_CONSOLES
	base_turf = /turf/simulated/floor/outdoors/rocks

/datum/map_template/relicbase_lateload/undeground_mine
	name = Z_NAME_RB_UNDERMINES
	mappath = "modular_chomp/maps/relic_base/relicbase-6.dmm"
	associated_map_datum = /datum/map_z_level/relicbase_lateload/undeground_mine

// Surface Wilds Z-Level
/datum/map_z_level/relicbase_lateload/surface_wild
	name = Z_NAME_RB_SURFACE_WILDS //"Wilderness"
	flags = MAP_LEVEL_PLAYER|MAP_LEVEL_SEALED|MAP_LEVEL_CONTACT|MAP_LEVEL_CONSOLES|MAP_LEVEL_VORESPAWN|MAP_LEVEL_XENOARCH_EXEMPT
	base_turf = /turf/simulated/floor/outdoors/rocks

/datum/map_template/relicbase_lateload/surface_wild
	name = Z_NAME_RB_SURFACE_WILDS
	name_alias = Z_NAME_ALIAS_SURFACE_WILDS
	mappath = "modular_chomp/maps/relic_base/relicbase-7.dmm"
	associated_map_datum = /datum/map_z_level/relicbase_lateload/surface_wild

// Wilderness Sky Z-Level
/datum/map_z_level/relicbase_lateload/wilderness_sky
	name = Z_NAME_RB_WILDERNESS_SKY //"Wilderness Sky"
	flags = MAP_LEVEL_PLAYER|MAP_LEVEL_SEALED|MAP_LEVEL_XENOARCH_EXEMPT
	base_turf = /turf/simulated/open

/datum/map_template/relicbase_lateload/wilderness_sky
	name = Z_NAME_RB_WILDERNESS_SKY
	mappath = "modular_chomp/maps/relic_base/relicbase-8.dmm"
	associated_map_datum = /datum/map_z_level/relicbase_lateload/wilderness_sky

// Surface Ocean Z-Level
/datum/map_z_level/relicbase_lateload/surface_ocean
	name = Z_NAME_RB_SURFACE_OCEAN //"Ocean"
	flags = MAP_LEVEL_PLAYER|MAP_LEVEL_SEALED|MAP_LEVEL_CONTACT|MAP_LEVEL_CONSOLES|MAP_LEVEL_VORESPAWN|MAP_LEVEL_XENOARCH_EXEMPT
	base_turf = /turf/simulated/floor/outdoors/rocks

/datum/map_template/relicbase_lateload/surface_ocean
	name = Z_NAME_RB_SURFACE_OCEAN
	name_alias = Z_NAME_ALIAS_SURFACE
	mappath = "modular_chomp/maps/relic_base/relicbase-9.dmm"
	associated_map_datum = /datum/map_z_level/relicbase_lateload/surface_ocean

// Surface Mine Z-Level
/datum/map_z_level/relicbase_lateload/surface_mine
	name = Z_NAME_RB_SURFACE_MINES //"Surface Mines"
	flags = MAP_LEVEL_CONTACT|MAP_LEVEL_PLAYER|MAP_LEVEL_SEALED|MAP_LEVEL_CONSOLES
	base_turf = /turf/simulated/floor/outdoors/rocks

/datum/map_template/relicbase_lateload/surface_mine
	name = Z_NAME_RB_SURFACE_MINES
	name_alias = Z_NAME_ALIAS_SURFACE_MINES
	mappath = "modular_chomp/maps/relic_base/relicbase-10.dmm"
	associated_map_datum = /datum/map_z_level/relicbase_lateload/surface_mine

// Misc Z-Level
/datum/map_z_level/relicbase_lateload/carrier
	name = Z_NAME_RB_CARRIER //"Misc"
	flags = MAP_LEVEL_PLAYER|MAP_LEVEL_VORESPAWN
	transit_chance = 10

/datum/map_template/relicbase_lateload/carrier
	name = Z_NAME_RB_CARRIER
	name_alias = Z_NAME_ALIAS_MISC
	mappath = "modular_chomp/maps/relic_base/relicbase-11.dmm"
	associated_map_datum = /datum/map_z_level/relicbase_lateload/carrier

// Centcom Z-Level
/datum/map_z_level/relicbase_lateload/centcom
	name = Z_NAME_RB_CENTCOM //"Centcom"
	flags = MAP_LEVEL_ADMIN|MAP_LEVEL_CONTACT|MAP_LEVEL_XENOARCH_EXEMPT

/datum/map_template/relicbase_lateload/centcom
	name = Z_NAME_RB_CENTCOM
	name_alias = Z_NAME_ALIAS_CENTCOM
	mappath = "modular_chomp/maps/relic_base/relicbase-12.dmm"
	associated_map_datum = /datum/map_z_level/relicbase_lateload/centcom

// Transit Z-Level
/datum/map_z_level/relicbase_lateload/transit
	name = Z_NAME_RB_TRANSIT //"Transit"
	flags = MAP_LEVEL_ADMIN|MAP_LEVEL_SEALED|MAP_LEVEL_PLAYER|MAP_LEVEL_CONTACT|MAP_LEVEL_XENOARCH_EXEMPT

/datum/map_template/relicbase_lateload/transit
	name = Z_NAME_RB_TRANSIT
	mappath = "modular_chomp/maps/relic_base/relicbase-13.dmm"
	associated_map_datum = /datum/map_z_level/relicbase_lateload/transit

/datum/planet/thor
	expected_z_levels = list(
		Z_LEVEL_RB_CATACOMBS,
		Z_LEVEL_RB_UNDERGROUND,
		Z_LEVEL_RB_SURFACE,
		Z_LEVEL_RB_UPPER_FLOORS,
		Z_LEVEL_RB_THE_SKY,
		Z_NAME_RB_UNDERMINES,
		Z_NAME_ALIAS_SURFACE_WILDS,
		Z_NAME_RB_WILDERNESS_SKY,
		Z_NAME_ALIAS_SURFACE,
		Z_NAME_ALIAS_SURFACE_MINES,
	)
