#include "submaps/virgo2.dm"

/obj/effect/overmap/visitable/sector/borealis4
	name = "Borealis 4"
	desc = "Includes the Remmi Aerostat and associated ground mining complexes."
	icon_state = "globe"
	color = "#dfff3f" //Bright yellow
	initial_generic_waypoints = list("aerostat_west","aerostat_east","aerostat_south","aerostat_northwest","aerostat_northeast")

/datum/shuttle/autodock/ferry/aerostat
	name = "Aerostat Ferry"
	shuttle_area = /area/shuttle/aerostat
	warmup_time = 10	//want some warmup time so people can cancel.
	location = FERRY_LOCATION_STATION
	landmark_station = "aerostat_west"
	landmark_offsite = "aerostat_surface"


/obj/effect/shuttle_landmark/premade/aerostat/aerostat_west
	name = "Aerostat (West Dock)"
	landmark_tag = "aerostat_west"
	base_turf = /turf/unsimulated/floor/sky/bor4_sky //Starts with a shuttle on top of it, so nice to remind it.
	base_area = /area/cryogaia_away/aerostat
/obj/effect/shuttle_landmark/premade/aerostat/aerostat_east
	name = "Aerostat (East Dock)"
	landmark_tag = "aerostat_east"
/obj/effect/shuttle_landmark/premade/aerostat/aerostat_south
	name = "Aerostat (South Dock)"
	landmark_tag = "aerostat_south"
/obj/effect/shuttle_landmark/premade/aerostat/aerostat_northwest
	name = "Aerostat (Northwest Dock)"
	landmark_tag = "aerostat_northwest"
/obj/effect/shuttle_landmark/premade/aerostat/aerostat_northeast
	name = "Aerostat (Northeast Dock)"
	landmark_tag = "aerostat_northeast"
/obj/effect/shuttle_landmark/premade/aerostat_surface
	name = "Borealis 4 Surface"
	landmark_tag = "aerostat_surface"


/datum/random_map/noise/ore/bor4
	descriptor = "borealis 4 ore distribution map"
	deep_val = 0.2
	rare_val = 0.1

/datum/random_map/noise/ore/BOR4/check_map_sanity()
	return 1 //Totally random, but probably beneficial.

// -- Objs -- //

/obj/machinery/computer/shuttle_control/aerostat_shuttle
	name = "aerostat ferry control console"
	shuttle_tag = "Aerostat Ferry"

/obj/cryogaia_away_spawner/aerostat_inside
	name = "Aerostat Indoors Spawner"
	faction = "aerostat_inside"
	atmos_comp = TRUE
	prob_spawn = 100
	prob_fall = 50
	//guard = 20
	mobs_to_pick_from = list(
		/mob/living/simple_mob/mechanical/hivebot/ranged_damage/basic = 3,
		/mob/living/simple_mob/mechanical/hivebot/ranged_damage/ion = 1,
		/mob/living/simple_mob/mechanical/hivebot/ranged_damage/laser = 3,
		/mob/living/simple_mob/vore/aggressive/corrupthound = 1
	)

/obj/cryogaia_away_spawner/aerostat_surface
	name = "Aerostat Surface Spawner"
	faction = "aerostat_surface"
	atmos_comp = TRUE
	prob_spawn = 100
	prob_fall = 50
	//guard = 20
	mobs_to_pick_from = list(
		/mob/living/simple_mob/vore/aggressive/corrupthound = 3,
		/mob/living/simple_mob/mechanical/viscerator = 2,
		/mob/living/simple_mob/vore/aggressive/corrupthound = 1
	)

/obj/structure/old_roboprinter
	name = "old drone fabricator"
	desc = "Built like a tank, still working after so many years."
	icon = 'icons/obj/machines/drone_fab.dmi'
	icon_state = "drone_fab_idle"
	anchored = TRUE
	density = TRUE

/obj/structure/metal_edge
	name = "metal underside"
	desc = "A metal wall that extends downwards."
	icon = 'icons/turf/cliff.dmi'
	icon_state = "metal"
	anchored = TRUE
	density = FALSE

// -- Turfs -- //

//Atmosphere properties
#define BOR4_ONE_ATMOSPHERE	312.1 //kPa
#define BOR4_AVG_TEMP			612 //kelvin

#define BOR4_PER_N2		0.10 //percent
#define BOR4_PER_O2		0.03
#define BOR4_PER_N2O		0.00 //Currently no capacity to 'start' a turf with this. See turf.dm
#define BOR4_PER_CO2		0.87
#define BOR4_PER_PHORON	0.00

//Math only beyond this point
#define BOR4_MOL_PER_TURF		(BOR4_ONE_ATMOSPHERE*CELL_VOLUME/(BOR4_AVG_TEMP*R_IDEAL_GAS_EQUATION))
#define BOR4_MOL_N2				(BOR4_MOL_PER_TURF * BOR4_PER_N2)
#define BOR4_MOL_O2				(BOR4_MOL_PER_TURF * BOR4_PER_O2)
#define BOR4_MOL_N2O			(BOR4_MOL_PER_TURF * BOR4_PER_N2O)
#define BOR4_MOL_CO2			(BOR4_MOL_PER_TURF * BOR4_PER_CO2)
#define BOR4_MOL_PHORON			(BOR4_MOL_PER_TURF * BOR4_PER_PHORON)

//Turfmakers
#define BOR4_SET_ATMOS	nitrogen=BOR4_MOL_N2;oxygen=BOR4_MOL_O2;carbon_dioxide=BOR4_MOL_CO2;phoron=BOR4_MOL_PHORON;temperature=BOR4_AVG_TEMP
#define BOR4_TURF_CREATE(x)	x/bor4/nitrogen=BOR4_MOL_N2;x/bor4/oxygen=BOR4_MOL_O2;x/bor4/carbon_dioxide=BOR4_MOL_CO2;x/bor4/phoron=BOR4_MOL_PHORON;x/bor4/temperature=BOR4_AVG_TEMP;x/bor4/color="#eacd7c"

/turf/unsimulated/floor/sky/bor4_sky
	name = "borealis 4 atmosphere"
	desc = "Be careful where you step!"
	color = "#eacd7c"
	BOR4_SET_ATMOS

/turf/unsimulated/floor/sky/bor4_sky/Initialize(mapload)
	skyfall_levels = list(z+1)
	. = ..()

/turf/simulated/shuttle/wall/voidcraft/green/bor4
	BOR4_SET_ATMOS
	color = "#eacd7c"

/turf/simulated/shuttle/wall/voidcraft/green/bor4/nocol
	color = null

BOR4_TURF_CREATE(/turf/unsimulated/wall/planetary)

BOR4_TURF_CREATE(/turf/simulated/wall)
BOR4_TURF_CREATE(/turf/simulated/floor/plating)
BOR4_TURF_CREATE(/turf/simulated/floor/bluegrid)
BOR4_TURF_CREATE(/turf/simulated/floor/tiled/techfloor)

BOR4_TURF_CREATE(/turf/simulated/mineral)
/turf/simulated/mineral/bor4/make_ore()
	if(mineral)
		return

	var/mineral_name = pickweight(list(ORE_MARBLE = 5, ORE_URANIUM = 5, ORE_PLATINUM = 10, ORE_HEMATITE = 5, ORE_CARBON = 5, ORE_DIAMOND = 10, ORE_GOLD = 20, ORE_SILVER = 20, ORE_LEAD = 10, ORE_VERDANTIUM = 5))

	if(mineral_name && (mineral_name in ore_data))
		mineral = ore_data[mineral_name]
		UpdateMineral()
	update_icon()

BOR4_TURF_CREATE(/turf/simulated/mineral/ignore_mapgen)
BOR4_TURF_CREATE(/turf/simulated/mineral/floor)
BOR4_TURF_CREATE(/turf/simulated/mineral/floor/ignore_mapgen)

// -- Areas -- //
// The aerostat shuttle
/area/shuttle/aerostat
	name = "\improper Aerostat Shuttle"
	base_turf = /turf/unsimulated/floor/sky/bor4_sky

//The aerostat itself
/area/cryogaia_away/aerostat
	name = "\improper Away Mission - Aerostat Outside"
	icon_state = "away"
	base_turf = /turf/unsimulated/floor/sky/bor4_sky
	requires_power = FALSE
	dynamic_lighting = FALSE

/area/cryogaia_away/aerostat/inside
	name = "\improper Away Mission - Aerostat Inside"
	icon_state = "crew_quarters"
	base_turf = /turf/simulated/floor/plating/bor4
	dynamic_lighting = TRUE

/area/cryogaia_away/aerostat/surface
	flags = RAD_SHIELDED
	ambience = list('sound/ambience/ambimine.ogg', 'sound/ambience/song_game.ogg')
	base_turf = /turf/simulated/mineral/floor/ignore_mapgen/bor4

/area/cryogaia_away/aerostat/surface/explored
	name = "Away Mission - Aerostat Surface (E)"
	icon_state = "explored"

/area/cryogaia_away/aerostat/surface/unexplored
	name = "Away Mission - Aerostat Surface (UE)"
	icon_state = "unexplored"
