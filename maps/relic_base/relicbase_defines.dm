// To be filled out when more progress on the new map occurs.

#define Z_LEVEL_UNDERGROUND				1
#define Z_LEVEL_SURFACE					2
#define Z_LEVEL_UPPER_FLOORS			3
#define Z_LEVEL_UNDERMINES				4
#define Z_LEVEL_SURFACE_WILDS			5
#define Z_LEVEL_SURFACE_OCEAN			6
#define Z_LEVEL_CARRIER					7
#define Z_LEVEL_CENTCOM					8
#define Z_LEVEL_TRANSIT					9
#define Z_LEVEL_SURFACE_MINE			10
#define Z_LEVEL_MISC 					11
#define Z_LEVEL_GATEWAY					12
#define Z_LEVEL_FUELDEPOT				15

/datum/map/relicbase
	name = "Relic Base"
	full_name = "NLS Relic Base"
	path = "relicbase"

	lobby_icon = 'icons/misc/CHOMPSTATION.gif'	//CHOMPStation Edit TFF 24/12/19 - _ch.dmi
	lobby_screens = list() //CHOMPStation Edit TFF 24/12/19 - CHOMPStation image
	id_hud_icons = 'icons/mob/hud_jobs_vr.dmi'	//CHOMPStation Edit 25/1/20 TFF - Job icons for off-duty/exploration

	holomap_smoosh = list(list(
		Z_LEVEL_UNDERGROUND,
		Z_LEVEL_SURFACE,
		Z_LEVEL_UPPER_FLOORS))

	zlevel_datum_type = /datum/map_z_level/relicbase

	station_name  = "NLS Relic Base"
	station_short = "Relic Base"
	dock_name     = "NCS Lambda" // NCC - Nanotrasen Command Colony
	boss_name     = "Central Command"
	boss_short    = "Centcom"
	company_name  = "NanoTrasen"
	company_short = "NT"
	starsys_name  = "Vir"
	use_overmap = TRUE
	overmap_size = 50
	overmap_event_areas = 44

	shuttle_docked_message = "The scheduled shuttle to the %dock_name% has docked with the station at docks one and two. It will depart in approximately %ETD%."
	shuttle_leaving_dock = "The Crew Transfer Tram has left the colony. Estimate %ETA% until the shuttle docks at %dock_name%."
	shuttle_called_message = "A crew transfer to %dock_name% has been scheduled. The tram has been called. Those leaving should proceed to the departures tram station in approximately %ETA%."
	shuttle_recall_message = "The scheduled crew transfer has been cancelled."
	emergency_shuttle_docked_message = "The Emergency Tram has arrived to the Relic Base tram station. You have approximately %ETD% to board the Emergency Tram."
	emergency_shuttle_leaving_dock = "The Emergency Tram has left the colony. Estimate %ETA% until the tram docks at %dock_name%."
	emergency_shuttle_called_message = "An emergency evacuation tram has been called. It will arrive at the Relic Base tram station in approximately %ETA%."
	emergency_shuttle_recall_message = "The emergency tram has been recalled."

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
	allowed_spawns = list("Arrivals Shuttle","Gateway", "Cryogenic Storage", "Cyborg Storage", "Station gateway")
	default_skybox = /datum/skybox_settings/relicbase
	unit_test_exempt_areas = list(/area/ninja_dojo, /area/shuttle/ninja)
	unit_test_exempt_from_atmos = list(/area/tcomm/chamber)

	planet_datums_to_make = list(/datum/planet/thor) //This must be added to load maps at round start otherwise they will have weather or sun.

	map_levels = list(
			Z_LEVEL_UNDERGROUND,
			Z_LEVEL_UPPER_FLOORS,
			Z_LEVEL_UNDERMINES,
			Z_LEVEL_SURFACE,
			Z_LEVEL_SURFACE_WILDS,
			Z_LEVEL_SURFACE_OCEAN
		)


	// Framework for porting Tether's lateload Z-Level system
	lateload_z_levels = list(
			list("Fuel Depot - Z1 Space") //Stock lateload maps
			)

	//CHOMPStation Addition End
	lateload_gateway = list(
		list("Carp Farm"),
		list("Snow Field")
		) //CHOMPedit: Gateway maps. For now nothing fancy, just some already existing maps while we make our own.

	lateload_gateway = null



// Commented out due to causing a lot of bugs. The base proc plus overmap achieves this functionality anyways.
/*
// Short range computers see only the six main levels, others can see the surrounding surface levels.
/datum/map/southern_cross/get_map_levels(var/srcz, var/long_range = TRUE)
	if (long_range && (srcz in map_levels))
		return map_levels
	else if (srcz == Z_LEVEL_TRANSIT && !long_range)
		return list() // Nothing on these z-levels- sensors won't show, and GPSes won't see each other.
	else if (srcz >= Z_LEVEL_STATION_ONE && srcz <= Z_LEVEL_STATION_THREE) // Station can see other decks.
		return list(
			Z_LEVEL_STATION_ONE,
			Z_LEVEL_STATION_TWO,
			Z_LEVEL_STATION_THREE,
			Z_LEVEL_SURFACE,
			Z_LEVEL_SURFACE_MINE,
			Z_LEVEL_SURFACE_WILD)
	else if(srcz in list(Z_LEVEL_SURFACE, Z_LEVEL_SURFACE_MINE, Z_LEVEL_SURFACE_WILD)) // Being on the surface lets you see other surface Zs.
		return list(
			Z_LEVEL_SURFACE,
			Z_LEVEL_SURFACE_MINE,
			Z_LEVEL_SURFACE_WILD)
	else
		return list(srcz) //prevents runtimes when using CMC. any Z-level not defined above will be 'isolated' and only show to GPSes/CMCs on that same Z (e.g. CentCom).
*/
/datum/map/relicbase/perform_map_generation()
	// First, place a bunch of submaps. This comes before tunnel/forest generation as to not interfere with the submap.(This controls POI limit generation, increase or lower its values to have more or less POI's)

	// Cave submaps are first.
	seed_submaps(list(Z_LEVEL_UNDERMINES), 60, /area/surface/cave/unexplored/normal, /datum/map_template/surface/mountains/normal)
	seed_submaps(list(Z_LEVEL_UNDERMINES), 60, /area/surface/cave/unexplored/deep, /datum/map_template/surface/mountains/deep)
	// Plains to make them less plain.
	seed_submaps(list(Z_LEVEL_SURFACE), 80, /area/surface/outside/plains/normal, /datum/map_template/surface/plains) // Center area is WIP until map editing settles down.
	seed_submaps(list(Z_LEVEL_SURFACE_OCEAN), 80, /area/surface/outside/plains/normal, /datum/map_template/surface/plains) // Center area is WIP until map editing settles down.

	// Wilderness is next.
	seed_submaps(list(Z_LEVEL_SURFACE_WILDS), 60, /area/surface/outside/wilderness/normal, /datum/map_template/surface/wilderness/normal)
	seed_submaps(list(Z_LEVEL_SURFACE_WILDS), 60, /area/surface/outside/wilderness/deep, /datum/map_template/surface/wilderness/deep)
	// If Space submaps are made, add a line to make them here as well.

	// Now for the tunnels. (This decides the load order of ore generation and cave generation. Check Random_Map to see % )
	new /datum/random_map/automata/cave_system/no_cracks(null, 1, 1, Z_LEVEL_UNDERMINES, world.maxx, world.maxy) // Create the mining Z-level.
	new /datum/random_map/noise/ore(null, 1, 1, Z_LEVEL_UNDERMINES, 64, 64)         // Create the mining ore distribution map.
	// Todo: Forest generation.
	return 1

// Skybox Settings
/datum/skybox_settings/relicbase
	icon_state = "dyable"
	random_color = TRUE
// For making the 6-in-1 holomap, we calculate some offsets
#define SOUTHERN_CROSS_MAP_SIZE 160 // Width and height of compiled in Southern Cross z levels.
#define SOUTHERN_CROSS_HOLOMAP_CENTER_GUTTER 40 // 40px central gutter between columns
#define SOUTHERN_CROSS_HOLOMAP_MARGIN_X ((HOLOMAP_ICON_SIZE - (2*SOUTHERN_CROSS_MAP_SIZE) - SOUTHERN_CROSS_HOLOMAP_CENTER_GUTTER) / 2) // 100
#define SOUTHERN_CROSS_HOLOMAP_MARGIN_Y ((HOLOMAP_ICON_SIZE - (3*SOUTHERN_CROSS_MAP_SIZE)) / 2) // 60

/datum/map_z_level/relicbase/station
	flags = MAP_LEVEL_STATION|MAP_LEVEL_CONTACT|MAP_LEVEL_PLAYER|MAP_LEVEL_CONSOLES|MAP_LEVEL_VORESPAWN
	holomap_legend_x = 220
	holomap_legend_y = 160

/datum/map_z_level/relicbase/station/station_one
	z = Z_LEVEL_UNDERGROUND
	name = "Underground"
	base_turf = /turf/space
	transit_chance = 10
	holomap_offset_x = SOUTHERN_CROSS_HOLOMAP_MARGIN_X - 40
	holomap_offset_y = SOUTHERN_CROSS_HOLOMAP_MARGIN_Y + SOUTHERN_CROSS_MAP_SIZE*0

/datum/map_z_level/relicbase/station/station_two
	z = Z_LEVEL_SURFACE
	name = "Deck 2"
	base_turf = /turf/simulated/open
	transit_chance = 10
	holomap_offset_x = SOUTHERN_CROSS_HOLOMAP_MARGIN_X - 40
	holomap_offset_y = SOUTHERN_CROSS_HOLOMAP_MARGIN_Y + SOUTHERN_CROSS_MAP_SIZE*1

/datum/map_z_level/relicbase/station/station_three
	z = Z_LEVEL_UPPER_FLOORS
	name = "Deck 3"
	base_turf = /turf/simulated/open
	transit_chance = 10
	holomap_offset_x = HOLOMAP_ICON_SIZE - SOUTHERN_CROSS_HOLOMAP_MARGIN_X - SOUTHERN_CROSS_MAP_SIZE - 40
	holomap_offset_y = SOUTHERN_CROSS_HOLOMAP_MARGIN_Y + SOUTHERN_CROSS_MAP_SIZE*1

/* //CHOMPedit: Disabling empty space map level as overmap generation now generates this as needed.
/datum/map_z_level/southern_cross/empty_space
	z = Z_LEVEL_EMPTY_SPACE
	name = "Empty"
	flags = MAP_LEVEL_PLAYER
	transit_chance = 60
*/
/datum/map_z_level/relicbase/surface
	z = Z_LEVEL_SURFACE
	name = "Plains"
	flags = MAP_LEVEL_CONTACT|MAP_LEVEL_PLAYER|MAP_LEVEL_SEALED|MAP_LEVEL_CONSOLES|MAP_LEVEL_VORESPAWN
	base_turf = /turf/simulated/floor/outdoors/rocks

/datum/map_z_level/relicbase/surface_mine
	z = Z_LEVEL_UNDERMINES
	name = "Mountains"
	flags = MAP_LEVEL_CONTACT|MAP_LEVEL_PLAYER|MAP_LEVEL_SEALED|MAP_LEVEL_CONSOLES
	base_turf = /turf/simulated/floor/outdoors/rocks

/datum/map_z_level/relicbase/surface_wild
	z = Z_LEVEL_SURFACE_WILDS
	name = "Wilderness"
	flags = MAP_LEVEL_PLAYER|MAP_LEVEL_SEALED|MAP_LEVEL_CONTACT|MAP_LEVEL_CONSOLES|MAP_LEVEL_VORESPAWN
	base_turf = /turf/simulated/floor/outdoors/rocks

/datum/map_z_level/relicbase/surface_ocean
	z = Z_LEVEL_SURFACE_OCEAN
	name = "Ocean"
	flags = MAP_LEVEL_PLAYER|MAP_LEVEL_SEALED|MAP_LEVEL_CONTACT|MAP_LEVEL_CONSOLES|MAP_LEVEL_VORESPAWN
	base_turf = /turf/simulated/floor/outdoors/rocks

/datum/map_z_level/relicbase/misc
	z = Z_LEVEL_MISC
	name = "Misc"
	flags = MAP_LEVEL_PLAYER|MAP_LEVEL_VORESPAWN
	transit_chance = 10

/datum/map_z_level/relicbase/centcom
	z = Z_LEVEL_CENTCOM
	name = "Centcom"
	flags = MAP_LEVEL_ADMIN|MAP_LEVEL_CONTACT

/datum/map_z_level/relicbase/transit
	z = Z_LEVEL_TRANSIT
	name = "Transit"
	flags = MAP_LEVEL_ADMIN|MAP_LEVEL_SEALED|MAP_LEVEL_PLAYER|MAP_LEVEL_CONTACT

/*
 KSC 9/29/20 = No longer relevant code as we have nonencludian portals to jump between outpost,caves and wilderness
//Teleport to Mine

/obj/effect/step_trigger/teleporter/mine/to_mining/New()
	..()
	teleport_x = src.x
	teleport_y = 2
	teleport_z = Z_LEVEL_SURFACE_MINE

/obj/effect/step_trigger/teleporter/mine/from_mining/New()
	..()
	teleport_x = src.x
	teleport_y = world.maxy - 1
	teleport_z = Z_LEVEL_SURFACE

//Teleport to Wild

/obj/effect/step_trigger/teleporter/wild/to_wild/New()
	..()
	teleport_x = src.x
	teleport_y = 2
	teleport_z = Z_LEVEL_SURFACE_WILD

/obj/effect/step_trigger/teleporter/wild/from_wild/New()
	..()
	teleport_x = src.x
	teleport_y = world.maxy - 1
	teleport_z = Z_LEVEL_SURFACE_MINE
*/

/datum/planet/thor
	expected_z_levels = list(
		Z_LEVEL_SURFACE,
		Z_LEVEL_UNDERGROUND,
		Z_LEVEL_UPPER_FLOORS,
		Z_LEVEL_SURFACE_WILDS,
		Z_LEVEL_UNDERMINES,
		Z_LEVEL_SURFACE_OCEAN
	)

/obj/effect/step_trigger/teleporter/bridge/east_to_west/Initialize()
	teleport_x = src.x - 4
	teleport_y = src.y
	teleport_z = src.z
	return ..()

/obj/effect/step_trigger/teleporter/bridge/east_to_west/small/Initialize()
	teleport_x = src.x - 3
	teleport_y = src.y
	teleport_z = src.z
	return ..()

/obj/effect/step_trigger/teleporter/bridge/west_to_east/Initialize()
	teleport_x = src.x + 4
	teleport_y = src.y
	teleport_z = src.z
	return ..()

/obj/effect/step_trigger/teleporter/bridge/west_to_east/small/Initialize()
	teleport_x = src.x + 3
	teleport_y = src.y
	teleport_z = src.z
	return ..()

/obj/effect/step_trigger/teleporter/bridge/north_to_south/Initialize()
	teleport_x = src.x
	teleport_y = src.y - 4
	teleport_z = src.z
	return ..()

/obj/effect/step_trigger/teleporter/bridge/south_to_north/Initialize()
	teleport_x = src.x
	teleport_y = src.y + 4
	teleport_z = src.z
	return ..()

 /* KSC 9/29/20 = Adding these as we now have nonencludian portals */

/obj/effect/map_effect/portal/master/side_a/plains_to_caves
	portal_id = "plains_caves-normal"

/obj/effect/map_effect/portal/master/side_b/caves_to_plains
	portal_id = "plains_caves-normal"

/obj/effect/map_effect/portal/master/side_a/plains_to_caves/river
	portal_id = "plains_caves-river"

/obj/effect/map_effect/portal/master/side_b/caves_to_plains/river
	portal_id = "plains_caves-river"


/obj/effect/map_effect/portal/master/side_a/caves_to_wilderness
	portal_id = "caves_wilderness-normal"

/obj/effect/map_effect/portal/master/side_b/wilderness_to_caves
	portal_id = "caves_wilderness-normal"

/obj/effect/map_effect/portal/master/side_a/caves_to_wilderness/river
	portal_id = "caves_wilderness-river"

/obj/effect/map_effect/portal/master/side_b/wilderness_to_caves/river
	portal_id = "caves_wilderness-river"

/*
//CHOMPEdit this is very much necessary for us otherwise weather sounds play on other levels
/datum/planet/sif
	expected_z_levels = list(
		Z_LEVEL_SURFACE,
		Z_LEVEL_SURFACE_MINE,
		Z_LEVEL_SURFACE_WILD
	)
*/
//Suit Storage Units

/obj/machinery/suit_cycler/exploration
	name = "Explorer suit cycler"
	model_text = "Exploration"
	req_one_access = list(access_pilot,access_explorer)

/obj/machinery/suit_cycler/pilot
	name = "Pilot suit cycler"
	model_text = "Pilot"
	req_access = null
	req_one_access = list(access_pilot,access_explorer)

/datum/map/relicbase/get_map_info()
	. = list()
	. +=  "The NTCS [full_name] is a small mining colony on Sif's lush, earthlike moon, Thor. NTCS [full_name] was previously an SGC Military installation, established originally in 2405.<br>"
	. +=  "Though Vir is typically peaceful, the system has seen its fair share of conflict in the face of technological extremists, rogue drone intelligence, and worse.<br>"
	. +=  "As an employee of NanoTrasen, operators of the Relic Base and one of the galaxy's largest research corporations, you're probably just here to do a job."
	return jointext(., "<br>")
