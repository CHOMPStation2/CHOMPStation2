//Normal YW map defs
#define Z_LEVEL_CRYOGAIA_CENTCOM		1
#define Z_LEVEL_CRYOGAIA_MINE			2
#define Z_LEVEL_CRYOGAIA_TRANSIT		3 //added due to explosions jumping from mine leve to lower.
#define Z_LEVEL_CRYOGAIA_LOWER			4
#define Z_LEVEL_CRYOGAIA_MAIN			5
#define Z_LEVEL_CRYOGAIA_UPPER			6
#define Z_LEVEL_CRYOGAIA_MISC			7
#define Z_LEVEL_CRYOGAIA_WILDERNESS		8
#define Z_LEVEL_CRYOGAIA_CAVES			9
#define Z_LEVEL_CRYOGAIA_RESIDENTIAL	10
#define Z_LEVEL_ROGUEMINE_1				11
#define Z_LEVEL_ROGUEMINE_2				12
#define Z_LEVEL_ROGUEMINE_3				13
#define Z_LEVEL_ROGUEMINE_4				14
#define Z_LEVEL_PLAINS					15
#define Z_LEVEL_BEACH					16
#define Z_LEVEL_BEACH_CAVE				17
#define Z_LEVEL_AEROSTAT				18
#define Z_LEVEL_AEROSTAT_SURFACE		19
#define Z_LEVEL_DEBRISFIELD				20
#define Z_LEVEL_UNDERDARK				21
#define Z_LEVEL_GUTTERSITE				22
#define Z_LEVEL_FUELDEPOT				23
#define Z_LEVEL_GATEWAY					24

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

	use_overmap = TRUE
	overmap_z = Z_LEVEL_CRYOGAIA_MISC
	overmap_size = 20
	overmap_event_areas = 10

	usable_email_tlds = list("cryogaia.nt")
	lobby_icon = 'icons/misc/title_yw.dmi'
	lobby_screens = list("cryogaia")
	id_hud_icons = 'icons/mob/hud_jobs_vr.dmi'

	holomap_smoosh = list(list(
		Z_LEVEL_CRYOGAIA_MINE,
		Z_LEVEL_CRYOGAIA_LOWER,
		Z_LEVEL_CRYOGAIA_MAIN,
		Z_LEVEL_CRYOGAIA_UPPER))

	station_name  = "Cryogaia Outpost"
	station_short = "Yawn Wider"
	dock_name     = "NCS Serenity"
	boss_name     = "Central Command"
	boss_short    = "CentCom"
	company_name  = "NanoTrasen"
	company_short = "NT"
	starsys_name  = "Borealis"

	shuttle_docked_message = "The scheduled Shuttle to %dock_name% has arrived. It will depart in approximately %ETD%."
	shuttle_leaving_dock = "The Shuttle has left the Outpost. Estimate %ETA% until the shuttle arrives at %dock_name%."
	shuttle_called_message = "A scheduled crew transfer to %dock_name% is occuring. The shuttle will be arriving shortly. Those departing should proceed to the shuttle docking station within %ETA%."
	shuttle_recall_message = "The scheduled crew transfer has been cancelled."
	shuttle_name = "NAS |Faraday|"
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
							NETWORK_SUBSTATIONS,
							NETWORK_EXPLORATION,
							NETWORK_DEFAULT,
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

	allowed_spawns = list("Arrivals Shuttle","Gateway","Cryogenic Storage","Cyborg Storage","NCS Serenity Residential")
	spawnpoint_died = /datum/spawnpoint/tram
	spawnpoint_left = /datum/spawnpoint/tram
	spawnpoint_stayed = /datum/spawnpoint/cryo

	meteor_strike_areas = list(/area/borealis2/outdoors/grounds,
		/area/borealis2/outdoors/exterior)

	unit_test_exempt_areas = list(
		/area/crew_quarters/sleep/Dorm_1/holo,
		/area/crew_quarters/sleep/Dorm_3/holo,
		/area/crew_quarters/sleep/Dorm_5/holo,
		/area/crew_quarters/sleep/Dorm_7/holo,
		/area/outpost/mining_main/maintenance,
		/area/outpost/research/power,
		/area/borealis2/elevator/scimining,
		/area/vacant/vacant_site/east,
		/area/tcommsat/chamber,
		/area/tcomfoyer,
		/area/maintenance/dorm,
		/area/vacant/vacant_site,
		/area/maintenance/maintroom1,
		/area/maintenance/maintroom2,
		/area/maintenance/maintroom3,
		/area/maintenance/maintroom4,
		/area/maintenance/maintroom5,
		/area/maintenance/maintroom8,
		/area/vacant/vacant_site/private,
		/area/borealis2/elevator/medbasement,
		/area/maintenance/lowfloor2,
		/area/borealis2/outdoors,
		/area/borealis2/outdoors/exterior/explore3,
		/area/borealis2/outdoors/exterior,
		/area/borealis2/outdoors/exterior/upper,
		/area/borealis2/outdoors/exterior/explore2,
		/area/borealis2/outdoors/exterior/lake,
		/area/cryogaia/outpost/exploration_shed,
		/area/borealis2/outdoors/grounds,
		/area/borealis2/outdoors/grounds/traderpad,
		/area/borealis2/elevator/scicargo,
		/area/borealis2/outdoors/grounds/power,
		/area/borealis2/outdoors/grounds/upper/solars,
		/area/borealis2/outdoors/exterior/explore1,
		/area/security/airlock,
		/area/borealis2/elevator/medbay,
		/area/storage/auxillary,
		/area/vacant/vacant_site/locker,
		/area/tcommsat/powercontrol,
		/area/constructionsite/medical,
		/area/borealis2/outdoors/grounds/entrance,
		/area/security/vacantoffice,
		/area/borealis2/outdoors/grounds/tower/southwest,
		/area/borealis2/outdoors/grounds/tower/south,
		/area/borealis2/outdoors/grounds/tower/southeast,
		/area/borealis2/outdoors/grounds/tower/east,
		/area/borealis2/outdoors/grounds/tower/west,
		/area/borealis2/outdoors/grounds/tower/northwest,
		/area/borealis2/outdoors/grounds/tower/northeast,
		/area/borealis2/outdoors/grounds/checkpoint,
		/area/borealis2/outdoors/grounds/wall,
		/area/borealis2/outdoors/grounds/upper,
		/area/cryogaia/station/ert_arrival,
		/area/borealis2/elevator/uppermining,
		/area/borealis2/elevator/medupper,
		/area/borealis2/outdoors/grounds/walkway,
		/area/cryogaia/station/excursion_overhang
		)

	unit_test_exempt_from_atmos = list(
//		/area/engineering/atmos/intake
		)

	unit_test_z_levels = list(2,4,5,6)

	lateload_z_levels = list(
		//list("Alien Ship - Z1 Ship"),
		list("Asteroid Belt 1","Asteroid Belt 2","Asteroid Belt 3","Asteroid Belt 4"),
		list("Snow plains"),
		list("Desert Planet - Z1 Beach","Desert Planet - Z2 Cave"),
		list("Remmi Aerostat - Z1 Aerostat","Remmi Aerostat - Z2 Surface"),
		list("Debris Field - Z1 Space"),
		list("Gutter Site - Z1 Space"),
		list("Fuel Depot - Z1 Space")
		)

	ai_shell_restricted = TRUE
	ai_shell_allowed_levels = list(
		Z_LEVEL_CRYOGAIA_MINE,
		Z_LEVEL_CRYOGAIA_LOWER,
		Z_LEVEL_CRYOGAIA_TRANSIT,
		Z_LEVEL_CRYOGAIA_MAIN,
		Z_LEVEL_CRYOGAIA_UPPER,
		Z_LEVEL_CRYOGAIA_CENTCOM
		)

	belter_docked_z = 		list(Z_LEVEL_CRYOGAIA_UPPER)
	belter_transit_z =	 	list(Z_LEVEL_CRYOGAIA_MISC)
	belter_belt_z = 		list(Z_LEVEL_ROGUEMINE_1,
									Z_LEVEL_ROGUEMINE_2,
									Z_LEVEL_ROGUEMINE_3,
									Z_LEVEL_ROGUEMINE_4)

	lateload_single_pick = list( //Gateway missions
		list("Snow Outpost"),
		list("Carp Farm"),
		list("Snow Field"),
		list("Listening Post")
		)

	planet_datums_to_make = list(/datum/planet/borealis2)

/datum/map/cryogaia/perform_map_generation()

	new /datum/random_map/automata/cave_system/no_cracks(null, 1, 1, Z_LEVEL_CRYOGAIA_MINE, world.maxx, world.maxy) // Create the mining Z-level.
	new /datum/random_map/noise/ore(null, 1, 1, Z_LEVEL_CRYOGAIA_MINE, 64, 64)         // Create the mining ore distribution map.

	return 1

/datum/planet/borealis2
	expected_z_levels = list(
		Z_LEVEL_CRYOGAIA_MINE,
		Z_LEVEL_CRYOGAIA_LOWER,
		Z_LEVEL_CRYOGAIA_MAIN,
		Z_LEVEL_CRYOGAIA_UPPER,
		Z_LEVEL_PLAINS,
		Z_LEVEL_CRYOGAIA_WILDERNESS,
		Z_LEVEL_CRYOGAIA_CAVES
	)

// Commented out due to causing a lot of bugs. The base proc plus overmap achieves this functionality anyways.
/*
// Short range computers see only the six main levels, others can see the surrounding surface levels.
/datum/map/cryogaia/get_map_levels(var/srcz, var/long_range = TRUE)
	if (long_range && (srcz in map_levels))
		return map_levels
	else if (srcz == Z_LEVEL_CRYOGAIA_CENTCOM)
		return list() // Nothing on transit!
	else if (srcz >= Z_LEVEL_CRYOGAIA_MINE && srcz <= Z_LEVEL_CRYOGAIA_UPPER)
		return list(
			Z_LEVEL_CRYOGAIA_MINE,
			Z_LEVEL_CRYOGAIA_LOWER,
			Z_LEVEL_CRYOGAIA_MAIN,
			Z_LEVEL_CRYOGAIA_UPPER
			)

	else if (srcz == Z_LEVEL_CRYOGAIA_RESIDENTIAL)
		return list(Z_LEVEL_CRYOGAIA_RESIDENTIAL)
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
*/

// Overmap represetation of cryogaia
/obj/effect/overmap/visitable/sector/cryogaia
	name = "Borealis Majoris"
	desc = "Home to coldness, and your workplace."
	base = TRUE
	icon_state = "globe"
	color = "#00AAFF"
	initial_generic_waypoints = list(
		"cryogaia_excursion_hangar",
		"cryogaia_security_hangar"
	)
	//Despite not being in the multi-z complex, these levels are part of the overmap sector
	extra_z_levels = list(Z_LEVEL_PLAINS,
						  Z_LEVEL_CRYOGAIA_WILDERNESS,
						  Z_LEVEL_CRYOGAIA_CAVES,
						  Z_LEVEL_CRYOGAIA_MISC)/*Temporary change to fix arrivals*/

/obj/effect/overmap/visitable/sector/cryogaia/Crossed(var/atom/movable/AM)
	. = ..()
	announce_atc(AM,going = FALSE)

/obj/effect/overmap/visitable/sector/cryogaia/Uncrossed(var/atom/movable/AM)
	. = ..()
	announce_atc(AM,going = TRUE)

/obj/effect/overmap/visitable/sector/cryogaia/announce_atc(var/atom/movable/AM, var/going = FALSE)
	var/message = "Sensor contact for vessel '[AM.name]' has [going ? "left" : "entered"] ATC control area."
	//For landables, we need to see if their shuttle is cloaked
	if(istype(AM, /obj/effect/overmap/visitable/ship/landable))
		var/obj/effect/overmap/visitable/ship/landable/SL = AM //Phew
		var/datum/shuttle/autodock/multi/shuttle = SSshuttles.shuttles[SL.shuttle]
		if(!istype(shuttle) || !shuttle.cloaked) //Not a multishuttle (the only kind that can cloak) or not cloaked
			SSatc.msg(message)

	//For ships, it's safe to assume they're big enough to not be sneaky
	else if(istype(AM, /obj/effect/overmap/visitable/ship))
		SSatc.msg(message)

/obj/effect/overmap/visitable/sector/cryogaia/get_space_zlevels()
	return list() //None!

/obj/effect/overmap/visitable/sector/virgo3b/announce_atc(var/atom/movable/AM, var/going = FALSE)
	var/message = "Sensor contact for vessel '[AM.name]' has [going ? "left" : "entered"] ATC control area."
	//For landables, we need to see if their shuttle is cloaked
	if(istype(AM, /obj/effect/overmap/visitable/ship/landable))
		var/obj/effect/overmap/visitable/ship/landable/SL = AM //Phew
		var/datum/shuttle/autodock/multi/shuttle = SSshuttles.shuttles[SL.shuttle]
		if(!istype(shuttle) || !shuttle.cloaked) //Not a multishuttle (the only kind that can cloak) or not cloaked
			SSatc.msg(message)

	//For ships, it's safe to assume they're big enough to not be sneaky
	else if(istype(AM, /obj/effect/overmap/visitable/ship))
		SSatc.msg(message)


// For making the 6-in-1 holomap, we calculate some offsets ((Disabled because I don't have a clue to how to start making this for Cryogaia))
#define CRYOGAIA_MAP_SIZE 160 // Width and height of compiled in Southern Cross z levels.
#define CRYOGAIA_HOLOMAP_CENTER_GUTTER 40 // 40px central gutter between columns
#define CRYOGAIA_HOLOMAP_MARGIN_X ((HOLOMAP_ICON_SIZE - (2*CRYOGAIA_MAP_SIZE) - CRYOGAIA_HOLOMAP_CENTER_GUTTER) / 2) // 100
#define CRYOGAIA_HOLOMAP_MARGIN_Y ((HOLOMAP_ICON_SIZE - (3*CRYOGAIA_MAP_SIZE)) / 2) // 60

// We have a bunch of stuff common to the station z levels

/datum/map_z_level/cryogaia/mining
	z = Z_LEVEL_CRYOGAIA_MINE
	name = "Subterranian depths"
	flags = MAP_LEVEL_STATION|MAP_LEVEL_CONTACT|MAP_LEVEL_PLAYER|MAP_LEVEL_CONSOLES|MAP_LEVEL_SEALED
	base_turf = /turf/simulated/floor/indoorrocks
	holomap_legend_x = 220
	holomap_legend_y = 160
	holomap_offset_x = CRYOGAIA_HOLOMAP_MARGIN_X + CRYOGAIA_MAP_SIZE*1
	holomap_offset_y = CRYOGAIA_HOLOMAP_MARGIN_Y + CRYOGAIA_MAP_SIZE*1

/datum/map_z_level/cryogaia/transit
	z = Z_LEVEL_CRYOGAIA_TRANSIT
	name = "Transit"
	flags = MAP_LEVEL_SEALED|MAP_LEVEL_PLAYER|MAP_LEVEL_CONTACT|MAP_LEVEL_XENOARCH_EXEMPT


/datum/map_z_level/cryogaia/lower
	name = "Subfloor"
	z = Z_LEVEL_CRYOGAIA_LOWER
	flags = MAP_LEVEL_STATION|MAP_LEVEL_CONTACT|MAP_LEVEL_PLAYER|MAP_LEVEL_CONSOLES|MAP_LEVEL_SEALED
	base_turf = /turf/simulated/open // /turf/simulated/floor/outdoors/rocks/cryogaia
	holomap_legend_x = 220
	holomap_legend_y = 160
	holomap_offset_x = CRYOGAIA_HOLOMAP_MARGIN_X + CRYOGAIA_MAP_SIZE*1
	holomap_offset_y = CRYOGAIA_HOLOMAP_MARGIN_Y + CRYOGAIA_MAP_SIZE*0

/datum/map_z_level/cryogaia/main
	z = Z_LEVEL_CRYOGAIA_MAIN
	name = "Surface level"
	flags = MAP_LEVEL_STATION|MAP_LEVEL_CONTACT|MAP_LEVEL_PLAYER|MAP_LEVEL_CONSOLES|MAP_LEVEL_SEALED
	base_turf = /turf/simulated/open
	holomap_legend_x = 220
	holomap_legend_y = 160
	holomap_offset_x = CRYOGAIA_HOLOMAP_MARGIN_X
	holomap_offset_y = CRYOGAIA_HOLOMAP_MARGIN_Y

/datum/map_z_level/cryogaia/upper
	z = Z_LEVEL_CRYOGAIA_UPPER
	name = "Upper level"
	flags = MAP_LEVEL_STATION|MAP_LEVEL_CONTACT|MAP_LEVEL_PLAYER|MAP_LEVEL_CONSOLES|MAP_LEVEL_SEALED
	base_turf = /turf/simulated/open
	holomap_legend_x = 220
	holomap_legend_y = 160
	holomap_offset_x = CRYOGAIA_HOLOMAP_MARGIN_X
	holomap_offset_y = CRYOGAIA_HOLOMAP_MARGIN_Y

/datum/map_z_level/cryogaia/centcom
	z = Z_LEVEL_CRYOGAIA_CENTCOM
	name = "Central Command"
	flags = MAP_LEVEL_ADMIN|MAP_LEVEL_CONTACT|MAP_LEVEL_XENOARCH_EXEMPT

/datum/map_z_level/cryogaia/residential
	z = Z_LEVEL_CRYOGAIA_RESIDENTIAL
	name = "Residential"
	flags = MAP_LEVEL_PLAYER|MAP_LEVEL_CONTACT|MAP_LEVEL_XENOARCH_EXEMPT|MAP_LEVEL_CONSOLES

/datum/map_z_level/cryogaia/misc
	z = Z_LEVEL_CRYOGAIA_MISC
	name = "Misc"
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
