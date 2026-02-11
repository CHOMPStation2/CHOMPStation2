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
#define Z_LEVEL_OFFMAP1					13
#define Z_LEVEL_PLAINS					14
#define Z_LEVEL_UNDERDARK				15
#define Z_LEVEL_BEACH					16
#define Z_LEVEL_BEACH_CAVE				17
#define Z_LEVEL_AEROSTAT				18
#define Z_LEVEL_AEROSTAT_SURFACE		19
#define Z_LEVEL_DEBRISFIELD				20
#define Z_LEVEL_FUELDEPOT				21
#define Z_LEVEL_GATEWAY					22
#define Z_LEVEL_OM_ADVENTURE			23
#define Z_LEVEL_REDGATE					24
#define Z_LEVEL_VRWORLD					25

//Camera networks
#define NETWORK_CRYOGAIA "Cryogaia"
// Defined in another file #define NETWORK_TCOMMS "Telecommunications" //Using different from Polaris one for better name
// defined in another file #define NETWORK_OUTSIDE "Outside"
// defined in another file #define NETWORK_EXPLORATION "Exploration"
// defined in another file #define NETWORK_XENOBIO "Xenobiology"

/datum/map/cryogaia
	name = "Cryogaia"
	full_name = "NSB Cryogaia"
	path = "cryogaia"

	zlevel_datum_type = /datum/map_z_level/cryogaia

	use_overmap = TRUE
	overmap_z = Z_LEVEL_CRYOGAIA_MISC
	overmap_size = 25
	overmap_event_areas = 18

	usable_email_tlds = list("cryogaia.nt")
	lobby_icon = 'icons/misc/title_yw.dmi'
	lobby_screens = list("cryogaia")
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
							NETWORK_ALARM_FIRE,
							NETWORK_TALON_HELMETS,
							NETWORK_TALON_SHIP
							)

	bot_patrolling = FALSE

	allowed_spawns = list("Arrivals Shuttle","Gateway","Cryogenic Storage","Cyborg Storage","NCS Serenity Residential","ITV Talon Cryo")
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
		/area/cryogaia/outpost/elevator/medbasement,
		/area/cryogaia/outpost/elevator/medbay,
		/area/cryogaia/outpost/elevator/medupper,
		/area/cryogaia/outpost/elevator/scicargo,
		/area/cryogaia/outpost/elevator/scimining,
		/area/cryogaia/outpost/elevator/uppermining,
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

	lateload_z_levels = list(
		//list("Alien Ship - Z1 Ship"),
		list("Asteroid Belt 1","Asteroid Belt 2"),
		list("Offmap Ship - Talon V2"),
		list("Snow plains"),
		list("Cryogaia - Underdark"),
		list("Desert Planet - Z1 Beach","Desert Planet - Z2 Cave"),
		list("Remmi Aerostat - Z1 Aerostat","Remmi Aerostat - Z2 Surface"),
		list("Debris Field - Z1 Space"),
		list("Fuel Depot - Z1 Space"),
		list("VR World")
		)

	lateload_overmap = list(
		list("Grass Cave")
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
	belter_belt_z = 		list(Z_LEVEL_ROGUEMINE_1, Z_LEVEL_ROGUEMINE_2)

	lateload_gateway = list(
		list("Gateway - Carp Farm"),
		list("Gateway - Snow Field"),
		list("Gateway - Listening Post"),
		list(list("Gateway - Honleth Highlands A", "Gateway - Honleth Highlands B")),
		list("Gateway - Arynthi Lake Underground A","Gateway - Arynthi Lake A"),
		list("Gateway - Arynthi Lake Underground B","Gateway - Arynthi Lake B"),
		list("Gateway - Wild West")
		)

	lateload_gateway = null //Nothing right now.

	lateload_redgate = list(
		list("Redgate - Teppi Ranch"),
		list("Redgate - Innland"),
//		list("Redgate - Abandoned Island"),	//This will come back later
		list("Redgate - Dark Adventure"),
		list("Redgate - Eggnog Town Underground","Redgate - Eggnog Town"),
		list("Redgate - Star Dog"),
		list("Redgate - Hotsprings"),
		list("Redgate - Rain City"),
		list("Redgate - Islands Underwater","Redgate - Islands"),
		list("Redgate - Moving Train", "Redgate - Moving Train Upper Level"),
		list("Redgate - Fantasy Dungeon", "Redgate - Fantasy Town"),
		list("Redgate - Laserdome"),
		list("Redgate - Cascading Falls")
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
	extra_z_levels = list(Z_LEVEL_PLAINS,
		Z_LEVEL_CRYOGAIA_WILDERNESS,
		Z_LEVEL_CRYOGAIA_CAVES,
		Z_LEVEL_UNDERDARK
	)

	levels_for_distress = list(Z_LEVEL_OFFMAP1, Z_LEVEL_BEACH, Z_LEVEL_AEROSTAT, Z_LEVEL_DEBRISFIELD, Z_LEVEL_FUELDEPOT)
	var/mob_announce_cooldown = 0

/obj/effect/overmap/visitable/sector/cryogaia/Crossed(var/atom/movable/AM)
	. = ..()
	announce_atc(AM,going = FALSE)

/obj/effect/overmap/visitable/sector/cryogaia/Uncrossed(var/atom/movable/AM)
	. = ..()
	announce_atc(AM,going = TRUE)

/obj/effect/overmap/visitable/sector/cryogaia/proc/announce_atc(var/atom/movable/AM, var/going = FALSE)
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
			atc.msg(message)

	//For ships, it's safe to assume they're big enough to not be sneaky
	else if(istype(AM, /obj/effect/overmap/visitable/ship))
		atc.msg(message)

/obj/effect/overmap/visitable/sector/cryogaia/get_space_zlevels()
	return list() //None!

/obj/effect/overmap/visitable/sector/virgo3b
	var/mob_announce_cooldown = 0
/obj/effect/overmap/visitable/sector/virgo3b/proc/announce_atc(var/atom/movable/AM, var/going = FALSE)
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
			atc.msg(message)

	//For ships, it's safe to assume they're big enough to not be sneaky
	else if(istype(AM, /obj/effect/overmap/visitable/ship))
		atc.msg(message)


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
	flags = MAP_LEVEL_STATION|MAP_LEVEL_CONTACT|MAP_LEVEL_PLAYER|MAP_LEVEL_CONSOLES|MAP_LEVEL_SEALED|MAP_LEVEL_PERSIST|MAP_LEVEL_TEMPERATURE_CHANGEABLE
	base_turf = /turf/simulated/open // /turf/simulated/floor/outdoors/rocks/cryogaia
	holomap_legend_x = 220
	holomap_legend_y = 160
	holomap_offset_x = CRYOGAIA_HOLOMAP_MARGIN_X + CRYOGAIA_MAP_SIZE*1
	holomap_offset_y = CRYOGAIA_HOLOMAP_MARGIN_Y + CRYOGAIA_MAP_SIZE*0

/datum/map_z_level/cryogaia/main
	z = Z_LEVEL_CRYOGAIA_MAIN
	name = "Surface level"
	flags = MAP_LEVEL_STATION|MAP_LEVEL_CONTACT|MAP_LEVEL_PLAYER|MAP_LEVEL_CONSOLES|MAP_LEVEL_SEALED|MAP_LEVEL_PERSIST|MAP_LEVEL_TEMPERATURE_CHANGEABLE
	base_turf = /turf/simulated/open
	holomap_legend_x = 220
	holomap_legend_y = 160
	holomap_offset_x = CRYOGAIA_HOLOMAP_MARGIN_X
	holomap_offset_y = CRYOGAIA_HOLOMAP_MARGIN_Y

/datum/map_z_level/cryogaia/upper
	z = Z_LEVEL_CRYOGAIA_UPPER
	name = "Upper level"
	flags = MAP_LEVEL_STATION|MAP_LEVEL_CONTACT|MAP_LEVEL_PLAYER|MAP_LEVEL_CONSOLES|MAP_LEVEL_SEALED|MAP_LEVEL_PERSIST|MAP_LEVEL_TEMPERATURE_CHANGEABLE
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


//No idea
#include "../expedition_vr/aerostat/_aerostat.dm"
/datum/map_template/common_lateload/away_aerostat
	name = "Remmi Aerostat - Z1 Aerostat"
	desc = "The Virgo 2 Aerostat away mission."
	mappath = "maps/expedition_vr/aerostat/aerostat.dmm"
	associated_map_datum = /datum/map_z_level/common_lateload/away_aerostat
