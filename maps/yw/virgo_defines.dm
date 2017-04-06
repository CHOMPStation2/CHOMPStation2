
//#define Z_LEVEL_BASEMENT_YW					1
#define Z_LEVEL_MAIN_YW						2
#define Z_LEVEL_CENTCOM_YW					3
#define Z_LEVEL_TELECOMMS_YW				4
#define Z_LEVEL_ABANDONED_ASTEROID_YW		5
#define Z_LEVEL_MINING_YW					6
#define Z_LEVEL_EMPTY_YW					7
#define Z_LEVEL_ABELT_YW					8

/datum/map/yw
	name = "Yawn"
	full_name = "Yawn Wider Station"
	path = "yw"

	lobby_icon = 'icons/misc/title_vr.dmi'
	lobby_screens = list("title")

	station_levels = list(
		//Z_LEVEL_BASEMENT_YW,
		Z_LEVEL_MAIN_YW,
		Z_LEVEL_MINING_YW
		)

	admin_levels = list(Z_LEVEL_CENTCOM_YW)
	contact_levels = list(
		//Z_LEVEL_BASEMENT_YW,
		Z_LEVEL_MAIN_YW,
		Z_LEVEL_CENTCOM_YW,
		Z_LEVEL_MINING_YW
		)

	player_levels = list(
		//Z_LEVEL_BASEMENT_YW,
		Z_LEVEL_MAIN_YW,
		Z_LEVEL_TELECOMMS_YW,
		Z_LEVEL_ABANDONED_ASTEROID_YW,
		Z_LEVEL_MINING_YW,
		Z_LEVEL_EMPTY_YW
		)

	sealed_levels = list(Z_LEVEL_ABELT_YW)
	empty_levels = list()
	accessible_z_levels = list(/*"1" = 20,*/ "2" = 25, "4" = 25, "5" = 25, "6" = 25) // The defines can't be used here sadly.
	base_turf_by_z = list(
		"1" = /turf/simulated/mineral/floor,
		"2" = /turf/simulated/mineral/floor,
		"5" = /turf/simulated/mineral/floor,
		"6" = /turf/simulated/mineral/floor
	)

	station_name  = "Yawn Station"
	station_short = "YAWN"
	dock_name     = "Yawn-Station Central Command"
	boss_name     = "Central Command"
	boss_short    = "CentCom"
	company_name  = "NanoTrasen"
	company_short = "NT"
	starsys_name  = "Virgo-Erigone"

	shuttle_docked_message = "The scheduled shuttle to the %dock_name% has docked with the station at docks one and two. It will depart in approximately %ETD%."
	shuttle_leaving_dock = "The Crew Transfer Shuttle has left the station. Estimate %ETA% until the shuttle docks at %dock_name%."
	shuttle_called_message = "A crew transfer to %Dock_name% has been scheduled. The shuttle has been called. Those leaving should procede to docks one and two in approximately %ETA%"
	shuttle_recall_message = "The scheduled crew transfer has been cancelled."
	emergency_shuttle_docked_message = "The Emergency Shuttle has docked with the station at docks one and two. You have approximately %ETD% to board the Emergency Shuttle."
	emergency_shuttle_leaving_dock = "The Emergency Shuttle has left the station. Estimate %ETA% until the shuttle docks at %dock_name%."
	emergency_shuttle_called_message = "An emergency evacuation shuttle has been called. It will arrive at docks one and two in approximately %ETA%"
	emergency_shuttle_recall_message = "The emergency shuttle has been recalled."

	station_networks = list(
							NETWORK_CARGO,
							NETWORK_CIVILIAN,
							NETWORK_COMMAND,
							NETWORK_ENGINE,
							NETWORK_ENGINEERING,
							NETWORK_ENGINEERING_OUTPOST,
							NETWORK_DEFAULT,
							NETWORK_MEDICAL,
							NETWORK_MINE,
							NETWORK_NORTHERN_STAR,
							NETWORK_RESEARCH,
							NETWORK_RESEARCH_OUTPOST,
							NETWORK_ROBOTS,
							NETWORK_PRISON,
							NETWORK_SECURITY,
							NETWORK_INTERROGATION
							)

	allowed_spawns = list("Arrivals Shuttle","Gateway","Cryogenic Storage","Cyborg Storage","Elevator")


/datum/map/yw/perform_map_generation()
	new /datum/random_map/automata/cave_system(null, 1, 1, Z_LEVEL_MAIN_YW, world.maxx, world.maxy) // Create the mining Z-level.
	new /datum/random_map/noise/ore(null, 1, 1, Z_LEVEL_MAIN_YW, 64, 64)         // Create the mining ore distribution map.

	new /datum/random_map/automata/cave_system(null, 1, 1, Z_LEVEL_ABANDONED_ASTEROID_YW, world.maxx, world.maxy) // Create the mining Z-level.
	new /datum/random_map/noise/ore(null, 1, 1, Z_LEVEL_ABANDONED_ASTEROID_YW, 64, 64)         // Create the mining ore distribution map.

	new /datum/random_map/automata/cave_system(null, 1, 1, Z_LEVEL_MINING_YW, world.maxx, world.maxy) // Create the mining Z-level.
	new /datum/random_map/noise/ore(null, 1, 1, Z_LEVEL_MINING_YW, 64, 64)         // Create the mining ore distribution map.
	return 1