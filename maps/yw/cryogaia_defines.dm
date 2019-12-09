//Normal YW map defs
#define Z_LEVEL_CRYOGAIA_CENTCOM	1
#define Z_LEVEL_CRYOGAIA_MINE		2
#define Z_LEVEL_CRYOGAIA_TRANSIT	3 //added due to explosions jumping from mine leve to lower.
#define Z_LEVEL_CRYOGAIA_LOWER		4
#define Z_LEVEL_CRYOGAIA_MAIN		5
#define Z_LEVEL_SHIPS				6
#define Z_LEVEL_ALIENSHIP			7
#define Z_LEVEL_BEACH				8
#define Z_LEVEL_BEACH_CAVE			9
#define Z_LEVEL_AEROSTAT			10
#define Z_LEVEL_AEROSTAT_SURFACE	11
#define Z_LEVEL_DEBRISFIELD			12
#define Z_LEVEL_UNDERDARK			13
#define Z_LEVEL_PLAINS				14

//Camera networks
#define NETWORK_CRYOGAIA "Cryogaia"
#define NETWORK_TCOMMS "Telecommunications" //Using different from Polaris one for better name
#define NETWORK_OUTSIDE "Outside"
#define NETWORK_EXPLORATION "Exploration"
#define NETWORK_XENOBIO "Xenobiology"

/datum/map/cryogaia
	name = "Cryogaia"
	full_name = "NSB Cryogaia"
	path = "cryogaia"

	zlevel_datum_type = /datum/map_z_level/cryogaia

	lobby_icon = 'icons/misc/title_yw2.dmi'
	lobby_screens = list("cryogaia")
	id_hud_icons = 'icons/mob/hud_jobs_vr.dmi'

/*	holomap_smoosh = list(list(
		Z_LEVEL_SURFACE_LOW,
		Z_LEVEL_SURFACE_MID,
		Z_LEVEL_SURFACE_HIGH,
		Z_LEVEL_SPACE_LOW,
		Z_LEVEL_SPACE_MID,
		Z_LEVEL_SPACE_HIGH)) */

	station_name  = "Cryogaia Outpost"
	station_short = "Yawn Wider"
	dock_name     = "NAS Midgard"
	boss_name     = "Central Command"
	boss_short    = "CentCom"
	company_name  = "NanoTrasen"
	company_short = "NT"
	starsys_name  = "Borealis Majoris"

	shuttle_docked_message = "The scheduled Shuttle to %dock_name% has arrived. It will depart in approximately %ETD%."
	shuttle_leaving_dock = "The Shuttle has left the Outpost. Estimate %ETA% until the tram arrives at %dock_name%."
	shuttle_called_message = "A scheduled crew transfer to %dock_name% is occuring. The tram will be arriving shortly. Those departing should proceed to the shuttle docking station within %ETA%."
	shuttle_recall_message = "The scheduled crew transfer has been cancelled."
	emergency_shuttle_docked_message = "The evacuation shuttle has arrived at the shuttle docking station. You have approximately %ETD% to board the shuttle."
	emergency_shuttle_leaving_dock = "The emergency shuttle has left the station. Estimate %ETA% until the shuttle arrives at %dock_name%."
	emergency_shuttle_called_message = "An emergency evacuation has begun, and an off-schedule shuttle has been called. It will arrive at the shuttle docking station in approximately %ETA%."
	emergency_shuttle_recall_message = "The evacuation shuttle has been recalled."

	station_networks = list(
							NETWORK_CARGO,
							NETWORK_CIRCUITS,
							NETWORK_CIVILIAN,
							NETWORK_COMMAND,
							NETWORK_CRYOGAIA,
							NETWORK_ENGINE,
							NETWORK_ENGINEERING,
							NETWORK_EXPLORATION,
							//NETWORK_DEFAULT,  //Is this even used for anything? Robots show up here, but they show up in ROBOTS network too,
							NETWORK_MEDICAL,
							NETWORK_MINE,
							NETWORK_OUTSIDE,
							NETWORK_RESEARCH,
							NETWORK_RESEARCH_OUTPOST,
							NETWORK_ROBOTS,
							NETWORK_PRISON,
							NETWORK_SECURITY,
							NETWORK_INTERROGATION,
							NETWORK_TCOMMS
							)
	secondary_networks = list(
							NETWORK_ERT,
							NETWORK_MERCENARY,
							NETWORK_THUNDER,
							NETWORK_COMMUNICATORS,
							NETWORK_ALARM_ATMOS,
							NETWORK_ALARM_POWER,
							NETWORK_ALARM_FIRE
							)

	bot_patrolling = FALSE

	allowed_spawns = list("Arrivals Shuttle","Gateway","Cryogenic Storage","Cyborg Storage")
	spawnpoint_died = /datum/spawnpoint/tram
	spawnpoint_left = /datum/spawnpoint/tram
	spawnpoint_stayed = /datum/spawnpoint/cryo

	meteor_strike_areas = list(/area/borealis2/outdoors/grounds,
		/area/borealis2/outdoors/exterior)

	unit_test_exempt_areas = list(
		/area/crew_quarters/sleep/Dorm_1/holo,
		/area/crew_quarters/sleep/Dorm_3/holo,
		/area/crew_quarters/sleep/Dorm_5/holo,
		/area/crew_quarters/sleep/Dorm_7/holo)
	unit_test_exempt_from_atmos = list(
		/area/engineering/atmos/intake
		)

	lateload_z_levels = list(
		list("Tether - Ships"/*",Tether - Plains"*/), //Stock Tether lateload maps
		list("Alien Ship - Z1 Ship"),
		list("Desert Planet - Z1 Beach","Desert Planet - Z2 Cave"),
		list("Remmi Aerostat - Z1 Aerostat","Remmi Aerostat - Z2 Surface"),
		list("Debris Field - Z1 Space")
		)

	ai_shell_restricted = TRUE
	ai_shell_allowed_levels = list(
		Z_LEVEL_CRYOGAIA_MINE,
		Z_LEVEL_CRYOGAIA_LOWER,
		Z_LEVEL_CRYOGAIA_MAIN,
		Z_LEVEL_CRYOGAIA_CENTCOM
		)

	lateload_single_pick = null //Nothing right now.

/datum/map/cryogaia/perform_map_generation()

	new /datum/random_map/automata/cave_system/no_cracks(null, 1, 1, Z_LEVEL_CRYOGAIA_MINE, world.maxx, world.maxy) // Create the mining Z-level.
	new /datum/random_map/noise/ore(null, 1, 1, Z_LEVEL_CRYOGAIA_MINE, 64, 64)         // Create the mining ore distribution map.

	return 1

/datum/planet/borealis2
	expected_z_levels = list(
		Z_LEVEL_CRYOGAIA_MINE,
		Z_LEVEL_CRYOGAIA_LOWER,
		Z_LEVEL_CRYOGAIA_MAIN
	)

// Short range computers see only the six main levels, others can see the surrounding surface levels.
/datum/map/cryogaia/get_map_levels(var/srcz, var/long_range = TRUE)
	if (long_range && (srcz in map_levels))
		return map_levels
	else if (srcz == Z_LEVEL_CRYOGAIA_CENTCOM)
		return list() // Nothing on transit!
	else if (srcz >= Z_LEVEL_CRYOGAIA_MINE && srcz <= Z_LEVEL_CRYOGAIA_MAIN)
		return list(
			Z_LEVEL_CRYOGAIA_MINE,
			Z_LEVEL_CRYOGAIA_LOWER,
			Z_LEVEL_CRYOGAIA_MAIN,
			)
	else if(srcz >= Z_LEVEL_BEACH && srcz <= Z_LEVEL_BEACH_CAVE) //Zs 16-17
		return list(
			Z_LEVEL_BEACH,
			Z_LEVEL_BEACH_CAVE)
	else if(srcz >= Z_LEVEL_AEROSTAT && srcz <= Z_LEVEL_AEROSTAT_SURFACE) //Zs 18-19
		return list(
			Z_LEVEL_AEROSTAT,
			Z_LEVEL_AEROSTAT_SURFACE)
	else
		return list(srcz) //prevents runtimes when using CMC. any Z-level not defined above will be 'isolated' and only show to GPSes/CMCs on that same Z (e.g. CentCom).


// For making the 6-in-1 holomap, we calculate some offsets ((Disabled because I don't have a clue to how to start making this for Cryogaia))

// We have a bunch of stuff common to the station z levels

/datum/map_z_level/cryogaia/mining
	z = Z_LEVEL_CRYOGAIA_MINE
	name = "Subterranian depths"
	flags = MAP_LEVEL_STATION|MAP_LEVEL_CONTACT|MAP_LEVEL_PLAYER|MAP_LEVEL_CONSOLES|MAP_LEVEL_SEALED
	base_turf = /turf/simulated/floor/indoorrocks

/datum/map_z_level/cryogaia/transit
	z = Z_LEVEL_CRYOGAIA_TRANSIT
	name = "Transit"
	flags = MAP_LEVEL_SEALED|MAP_LEVEL_PLAYER|MAP_LEVEL_CONTACT|MAP_LEVEL_XENOARCH_EXEMPT

/datum/map_z_level/cryogaia/lower
	name = "Subfloor"
	z = Z_LEVEL_CRYOGAIA_LOWER
	flags = MAP_LEVEL_STATION|MAP_LEVEL_CONTACT|MAP_LEVEL_PLAYER|MAP_LEVEL_CONSOLES|MAP_LEVEL_SEALED
	base_turf = /turf/simulated/open // /turf/simulated/floor/outdoors/rocks/cryogaia

/datum/map_z_level/cryogaia/main
	z = Z_LEVEL_CRYOGAIA_MAIN
	name = "Surface level"
	flags = MAP_LEVEL_STATION|MAP_LEVEL_CONTACT|MAP_LEVEL_PLAYER|MAP_LEVEL_CONSOLES|MAP_LEVEL_SEALED
	base_turf = /turf/simulated/open
/*	holomap_offset_x = TETHER_HOLOMAP_MARGIN_X
	holomap_offset_y = TETHER_HOLOMAP_MARGIN_Y + TETHER_MAP_SIZE*0 */

/datum/map_z_level/cryogaia/centcom
	z = Z_LEVEL_CRYOGAIA_CENTCOM
	name = "Central Command"
	flags = MAP_LEVEL_ADMIN|MAP_LEVEL_CONTACT|MAP_LEVEL_XENOARCH_EXEMPT
/*
/datum/map_z_level/tether/wilderness
	name = "Wilderness"
	flags = MAP_LEVEL_PLAYER
	var/activated = 0
	var/list/frozen_mobs = list()

/datum/map_z_level/tether/wilderness/proc/activate_mobs()
	if(activated && isemptylist(frozen_mobs))
		return
	activated = 1
	for(var/mob/living/simple_mob/M in frozen_mobs)
		M.life_disabled = 0
		frozen_mobs -= M
	frozen_mobs.Cut()

/datum/map_z_level/tether/wilderness/wild_1
	z = Z_LEVEL_SURFACE_WILDERNESS_1

/datum/map_z_level/tether/wilderness/wild_2
	z = Z_LEVEL_SURFACE_WILDERNESS_2

/datum/map_z_level/tether/wilderness/wild_3
	z = Z_LEVEL_SURFACE_WILDERNESS_3

/datum/map_z_level/tether/wilderness/wild_4
	z = Z_LEVEL_SURFACE_WILDERNESS_4

/datum/map_z_level/tether/wilderness/wild_5
	z = Z_LEVEL_SURFACE_WILDERNESS_5

/datum/map_z_level/tether/wilderness/wild_6
	z = Z_LEVEL_SURFACE_WILDERNESS_6

/datum/map_z_level/tether/wilderness/wild_crash
	z = Z_LEVEL_SURFACE_WILDERNESS_CRASH

/datum/map_z_level/tether/wilderness/wild_ruins
	z = Z_LEVEL_SURFACE_WILDERNESS_RUINS
*/
