/datum/map/cryogaia
	name = "Cryogaia"
	full_name = "NSB Cryogaia"
	path = "cryogaia"

	zlevel_datum_type = /datum/map_z_level/cryogaia

	use_overmap = TRUE
	overmap_z = Z_NAME_ALIAS_MISC
	overmap_size = 25
	overmap_event_areas = 18

	usable_email_tlds = list("cryogaia.nt")
	lobby_screens = list('modular_chomp/html/lobby/cryogaia_static.png')
	id_hud_icons = 'icons/mob/hud_jobs_vr.dmi'

	holomap_smoosh = list(list(
		Z_LEVEL_CRYOGAIA_MINE,
		Z_LEVEL_CRYOGAIA_LOWER,
		Z_LEVEL_CRYOGAIA_MAIN,
		Z_LEVEL_CRYOGAIA_UPPER))

	facility_type = "Outpost"
	station_name  = "Cryogaia"
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
							NETWORK_ALARM_FIRE,
							NETWORK_TALON_HELMETS,
							NETWORK_TALON_SHIP
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
		/area/crew_quarters/sleep/Dorm_7/holo,
		/area/outpost/mining_main/maintenance,
		/area/outpost/research/power,
		/area/tcommsat/chamber,
		/area/tcommsat/powercontrol,
		/area/tcomfoyer,
		/area/vacant/vacant_site,
		/area/vacant/vacant_site/private,
		/area/vacant/vacant_site/locker,
		/area/vacant/vacant_site/east,
		/area/maintenance/dorm,
		/area/maintenance/maintroom1,
		/area/maintenance/maintroom2,
		/area/maintenance/maintroom3,
		/area/maintenance/maintroom4,
		/area/maintenance/maintroom5,
		/area/maintenance/maintroom8,
		/area/maintenance/lowfloor2,
		/area/maintenance/blueserg,
		/area/maintenance/blueserg/dorms,
		/area/maintenance/blueserg/misc,
		/area/cryogaia/outpost/bonfire,
		/area/cryogaia/outpost/checkpoint,
		/area/cryogaia/outpost/wall,
		/area/cryogaia/outpost/tower/southwest,
		/area/cryogaia/outpost/tower/south,
		/area/cryogaia/outpost/tower/southeast,
		/area/cryogaia/outpost/tower/east,
		/area/cryogaia/outpost/tower/west,
		/area/cryogaia/outpost/tower/northwest,
		/area/cryogaia/outpost/tower/northeast,
		/area/cryogaia/outpost/exploration_shed,
		/area/cryogaia/outpost/elevator/dorms,
		/area/cryogaia/outpost/elevator/medbasement,
		/area/cryogaia/outpost/elevator/medbay,
		/area/cryogaia/outpost/elevator/medupper,
		/area/cryogaia/outpost/elevator/scicargo,
		/area/cryogaia/outpost/elevator/scimining,
		/area/cryogaia/outpost/elevator/uppermining,
		/area/cryogaia/outpost/elevator/sciminingtransit,
		/area/cryogaia/outpost/exploration_plains,
		/area/borealis2/outdoors,
		/area/borealis2/outdoors/exterior,
		/area/borealis2/outdoors/exterior/upper,
		/area/borealis2/outdoors/exterior/traderpad,
		/area/borealis2/outdoors/exterior/traderpad/interior,
		/area/borealis2/outdoors/exterior/explore1,
		/area/borealis2/outdoors/exterior/explore1/interior,
		/area/borealis2/outdoors/exterior/explore2,
		/area/borealis2/outdoors/exterior/explore3,
		/area/borealis2/outdoors/exterior/lake,
		/area/borealis2/outdoors/grounds,
		/area/borealis2/outdoors/grounds/power,
		/area/borealis2/outdoors/grounds/upper/solars,
		/area/borealis2/outdoors/grounds/upper,
		/area/borealis2/outdoors/grounds/walkway,
		/area/security/airlock,
		/area/storage/auxillary,
		/area/constructionsite/medical,
		/area/security/vacantoffice,
		/area/cryogaia/station/ert_arrival,
		/area/cryogaia/station/excursion_overhang
		)

	unit_test_exempt_from_atmos = list(
//		/area/engineering/atmos/intake
		)

	unit_test_z_levels = list(2,4,5,6)

	ai_shell_restricted = TRUE
	ai_shell_allowed_levels = list(
		Z_LEVEL_CRYOGAIA_MINE,
		Z_LEVEL_CRYOGAIA_LOWER,
		Z_LEVEL_CRYOGAIA_TRANSIT,
		Z_LEVEL_CRYOGAIA_MAIN,
		Z_LEVEL_CRYOGAIA_UPPER,
		Z_NAME_CRYOGAIA_CENTCOM
		)

	belter_docked_z = 		list(Z_LEVEL_CRYOGAIA_UPPER)
	belter_transit_z =	 	list(Z_NAME_CRYOGAIA_MISC)
	belter_belt_z = 		list(Z_NAME_CRYOGAIA_ROGUEMINE_1,
									Z_NAME_CRYOGAIA_ROGUEMINE_2)

	lateload_z_levels = list(
		list(Z_NAME_CRYOGAIA_PLAINS),
		list(Z_NAME_CRYOGAIA_WILDERNESS),
		list(Z_NAME_CRYOGAIA_CENTCOM),
		list(Z_NAME_CRYOGAIA_MISC),
		list(Z_NAME_CRYOGAIA_UNDERDARK)
		)

	lateload_gateway = list(
		list(Z_NAME_GATEWAY_CARP_FARM),
		list(Z_NAME_GATEWAY_SNOW_FIELD),
		list(Z_NAME_GATEWAY_LISTENING_POST),
		list(list(Z_NAME_GATEWAY_HONLETH_A, Z_NAME_GATEWAY_HONLETH_B)),
		list(Z_NAME_GATEWAY_ARYNTHI_CAVE_A,Z_NAME_GATEWAY_ARYNTHI_A),
		list(Z_NAME_GATEWAY_ARYNTHI_CAVE_B,Z_NAME_GATEWAY_ARYNTHI_B),
		list(Z_NAME_GATEWAY_WILD_WEST),
		)

	lateload_overmap = list(
		list(Z_NAME_OM_GRASS_CAVE),
		)

	lateload_redgate = list(
		list(Z_NAME_REDGATE_TEPPI_RANCH),
		list(Z_NAME_REDGATE_INNLAND),
//		list(Z_NAME_REDGATE_ABANDONED_ISLAND),	//This will come back later
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
		list(Z_NAME_REDGATE_FACILITY),
		list(Z_NAME_REDGATE_CASINO_CANAL_LOWER, Z_NAME_REDGATE_CASINO_CANAL),
		)

	planet_datums_to_make = list(/datum/planet/borealis2)

/datum/map/cryogaia/perform_map_generation()

	new /datum/random_map/automata/cave_system/no_cracks(null, 1, 1, Z_LEVEL_CRYOGAIA_MINE, world.maxx, world.maxy) // Create the mining Z-level.
	new /datum/random_map/noise/ore(null, 1, 1, Z_LEVEL_CRYOGAIA_MINE, 64, 64)         // Create the mining ore distribution map.

	//seed_submaps(list(Z_NAME_ALIAS_SURFACE), 240, /area/cryogaia/outpost/exploration_plains, /datum/map_template/cryogaia_lateload/plains)

	return 1

/datum/planet/borealis2
	expected_z_levels = list(
		Z_LEVEL_CRYOGAIA_MINE,
		Z_LEVEL_CRYOGAIA_TRANSIT,
		Z_LEVEL_CRYOGAIA_LOWER,
		Z_LEVEL_CRYOGAIA_MAIN,
		Z_LEVEL_CRYOGAIA_UPPER,
		Z_NAME_ALIAS_SURFACE,
		Z_NAME_ALIAS_SURFACE_WILDS,
		Z_NAME_CRYOGAIA_UNDERDARK
	)


// Overmap represetation of cryogaia
/obj/effect/overmap/visitable/sector/cryogaia
	name = "Borealis Majoris"
	desc = "Home to coldness, and your workplace."
	scanner_desc = @{"[i]Registration[/i]: NSB Cryogaia
[i]Class[/i]: Installation
[i]Transponder[/i]: Transmitting (CIV), NanoTrasen IFF
[b]Notice[/b]: NanoTrasen Colony, authorized personnel only"}
	base = TRUE
	icon_state = "globe"
	color = "#00AAFF"
	initial_generic_waypoints = list(
		"cryogaia_excursion_hangar",
		"cryogaia_security_hangar"
	)
	//Despite not being in the multi-z complex, these levels are part of the overmap sector
	extra_z_levels = list(
		Z_NAME_ALIAS_SURFACE,
		Z_NAME_ALIAS_SURFACE_WILDS
	)

	levels_for_distress = list()

/obj/effect/overmap/visitable/sector/cryogaia/Crossed(atom/movable/AM)
	. = ..()
	announce_atc(AM,going = FALSE)

/obj/effect/overmap/visitable/sector/cryogaia/Uncrossed(atom/movable/AM)
	. = ..()
	announce_atc(AM,going = TRUE)

/obj/effect/overmap/visitable/sector/cryogaia/announce_atc(var/atom/movable/AM, going = FALSE)
	if(istype(AM, /obj/effect/overmap/visitable/ship/simplemob))
		if(world.time < mob_announce_cooldown)
			return
		else
			mob_announce_cooldown = world.time + 5 MINUTES
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

/obj/effect/overmap/visitable/sector/virgo3b/announce_atc(var/atom/movable/AM, going = FALSE)
	if(istype(AM, /obj/effect/overmap/visitable/ship/simplemob))
		if(world.time < mob_announce_cooldown)
			return
		else
			mob_announce_cooldown = world.time + 5 MINUTES
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

// Lateload handling
/datum/map_template/cryogaia_lateload
	allow_duplicates = FALSE
	var/associated_map_datum

/datum/map_template/cryogaia_lateload/on_map_loaded(z)
	if(!associated_map_datum || !ispath(associated_map_datum))
		log_game("Extra z-level [src] has no associated map datum")
		return

	new associated_map_datum(using_map, z)
	return ..()

/datum/map_z_level/cryogaia_lateload/New(datum/map/map, mapZ)
	z = mapZ
	return ..(map)

// For making the 6-in-1 holomap, we calculate some offsets ((Disabled because I don't have a clue to how to start making this for Cryogaia))
#define CRYOGAIA_MAP_SIZE 160 // Width and height of compiled in Southern Cross z levels.
#define CRYOGAIA_HOLOMAP_CENTER_GUTTER 40 // 40px central gutter between columns
#define CRYOGAIA_HOLOMAP_MARGIN_X ((HOLOMAP_ICON_SIZE - (2*CRYOGAIA_MAP_SIZE) - CRYOGAIA_HOLOMAP_CENTER_GUTTER) / 2) // 100
#define CRYOGAIA_HOLOMAP_MARGIN_Y ((HOLOMAP_ICON_SIZE - (3*CRYOGAIA_MAP_SIZE)) / 2) // 60

// We have a bunch of stuff common to the station z levels

/datum/map_z_level/cryogaia/mining
	z = Z_LEVEL_CRYOGAIA_MINE
	name = "Subterranian depths"
	flags = MAP_LEVEL_STATION|MAP_LEVEL_CONTACT|MAP_LEVEL_PLAYER|MAP_LEVEL_CONSOLES|MAP_LEVEL_SEALED|MAP_LEVEL_PERSIST
	base_turf = /turf/simulated/mineral/floor
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
	flags = MAP_LEVEL_STATION|MAP_LEVEL_CONTACT|MAP_LEVEL_PLAYER|MAP_LEVEL_CONSOLES|MAP_LEVEL_SEALED|MAP_LEVEL_PERSIST
	base_turf = /turf/simulated/open
	holomap_legend_x = 220
	holomap_legend_y = 160
	holomap_offset_x = CRYOGAIA_HOLOMAP_MARGIN_X + CRYOGAIA_MAP_SIZE*1
	holomap_offset_y = CRYOGAIA_HOLOMAP_MARGIN_Y + CRYOGAIA_MAP_SIZE*0

/datum/map_z_level/cryogaia/main
	z = Z_LEVEL_CRYOGAIA_MAIN
	name = "Surface level"
	flags = MAP_LEVEL_STATION|MAP_LEVEL_CONTACT|MAP_LEVEL_PLAYER|MAP_LEVEL_CONSOLES|MAP_LEVEL_SEALED|MAP_LEVEL_PERSIST
	base_turf = /turf/simulated/open
	holomap_legend_x = 220
	holomap_legend_y = 160
	holomap_offset_x = CRYOGAIA_HOLOMAP_MARGIN_X
	holomap_offset_y = CRYOGAIA_HOLOMAP_MARGIN_Y

/datum/map_z_level/cryogaia/upper
	z = Z_LEVEL_CRYOGAIA_UPPER
	name = "Upper level"
	flags = MAP_LEVEL_STATION|MAP_LEVEL_CONTACT|MAP_LEVEL_PLAYER|MAP_LEVEL_CONSOLES|MAP_LEVEL_SEALED|MAP_LEVEL_PERSIST
	base_turf = /turf/simulated/open
	holomap_legend_x = 220
	holomap_legend_y = 160
	holomap_offset_x = CRYOGAIA_HOLOMAP_MARGIN_X
	holomap_offset_y = CRYOGAIA_HOLOMAP_MARGIN_Y

/datum/map_z_level/cryogaia/residential
	z = Z_LEVEL_CRYOGAIA_RESIDENTIAL
	name = "Residential"
	flags = MAP_LEVEL_PLAYER|MAP_LEVEL_CONTACT|MAP_LEVEL_XENOARCH_EXEMPT|MAP_LEVEL_CONSOLES

// Wilderness Z-Level
/datum/map_z_level/cryogaia_lateload/wilderness
	name = Z_NAME_CRYOGAIA_WILDERNESS
	flags = MAP_LEVEL_PLAYER|MAP_LEVEL_CONTACT|MAP_LEVEL_VORESPAWN

/datum/map_template/cryogaia_lateload/wilderness
	name = Z_NAME_CRYOGAIA_WILDERNESS
	name_alias = Z_NAME_ALIAS_SURFACE_WILDS
	mappath = "modular_chomp/maps/cryogaia/cryogaia-09-wilderness.dmm"
	associated_map_datum = /datum/map_z_level/cryogaia_lateload/wilderness

// Plains Z-Level
/datum/map_z_level/cryogaia_lateload/plains
	name = Z_NAME_CRYOGAIA_PLAINS
	flags = MAP_LEVEL_PLAYER|MAP_LEVEL_CONTACT|MAP_LEVEL_VORESPAWN

/datum/map_template/cryogaia_lateload/plains
	name = Z_NAME_CRYOGAIA_PLAINS
	name_alias = Z_NAME_ALIAS_SURFACE
	mappath = "modular_chomp/maps/cryogaia/submaps/cryogaia_plains/cryogaia_plains.dmm"
	associated_map_datum = /datum/map_z_level/cryogaia_lateload/plains

// Misc Z-Level
/datum/map_z_level/cryogaia_lateload/misc
	name = Z_NAME_CRYOGAIA_MISC
	flags = MAP_LEVEL_PLAYER|MAP_LEVEL_VORESPAWN

/datum/map_template/cryogaia_lateload/misc
	name = Z_NAME_CRYOGAIA_MISC
	name_alias = Z_NAME_ALIAS_MISC
	mappath = "modular_chomp/maps/cryogaia/cryogaia-07-misc.dmm"
	associated_map_datum = /datum/map_z_level/cryogaia_lateload/misc

// Centcom Z-Level
/datum/map_z_level/cryogaia_lateload/centcom
	name = Z_NAME_CRYOGAIA_CENTCOM //"Centcom"
	flags = MAP_LEVEL_ADMIN|MAP_LEVEL_CONTACT|MAP_LEVEL_XENOARCH_EXEMPT

/datum/map_template/cryogaia_lateload/centcom
	name = Z_NAME_CRYOGAIA_CENTCOM
	name_alias = Z_NAME_ALIAS_CENTCOM
	mappath = "modular_chomp/maps/cryogaia/cryogaia-01-centcomm.dmm"
	associated_map_datum = /datum/map_z_level/cryogaia_lateload/centcom

// Underdark Z-Level
/datum/map_z_level/cryogaia_lateload/underdark
	name = Z_NAME_CRYOGAIA_UNDERDARK
	flags = MAP_LEVEL_ADMIN|MAP_LEVEL_CONTACT|MAP_LEVEL_XENOARCH_EXEMPT

/datum/map_template/cryogaia_lateload/underdark
	name = Z_NAME_CRYOGAIA_UNDERDARK
	name_alias = Z_NAME_ALIAS_SURFACE_MINES
	mappath = "modular_chomp/maps/cryogaia/submaps/cryogaia_underdark.dmm"
	associated_map_datum = /datum/map_z_level/cryogaia_lateload/centcom
