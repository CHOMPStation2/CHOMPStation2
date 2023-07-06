//Parent of this place is kara.dm
// -- Datums -- //

/datum/map_template/sc_lateload/away_aerostat
	name = "Kara Aerostat - Z1 Aerostat"
	desc = "The Kara Aerostat away mission."
	mappath = 'maps/southern_cross/overmap/planets/kara/aerostat/aerostat.dmm'
	associated_map_datum = /datum/map_z_level/sc_lateload/away_aerostat

/datum/map_z_level/sc_lateload/away_aerostat
	name = "Away Mission - Aerostat"
	z = Z_LEVEL_AEROSTAT


// -- Overmap -- //
/* // Moved to kara.dm as this is part of the planet and future planet z-levels are planned. Also seems important for overmap to run properly.
/obj/effect/overmap/visitable/sector/aerostat
	name = "Aerostat"
	desc = "Abandoned aerostat installation, floating in the low stratosphere."
	scanner_desc = @{"[i]Registration[/i]: Vir System Authority
[i]Class[/i]: Installation
[i]Transponder[/i]: Transmitting (CIV), Vir IFF
[b]Notice[/b]: CONDEMNED! NO ENTRY! -Vir System Authority"}
	map_z = list(Z_LEVEL_AEROSTAT)
	initial_generic_waypoints = list("aerostat_west","aerostat_east","aerostat_south","aerostat_northwest","aerostat_northeast")
	icon_state = "object"
	unknown_state = "object"
	known = FALSE
	in_space = 0
	start_x =  14
	start_y =  15
*/


//	extra_z_levels = list(Z_LEVEL_AEROSTAT_2) //SOON


// -- Areas -- //

/area/sc_away/aerostat
	name = "\improper Away Mission - Aerostat Outside"
	icon_state = "away"
	base_turf = /turf/unsimulated/floor/sky/kara_sky
	requires_power = FALSE
	dynamic_lighting = FALSE
	flags = RAD_SHIELDED

/area/sc_away/aerostat/inside
	name = "\improper Away Mission - Aerostat Inside"
	icon_state = "crew_quarters"
	base_turf = /turf/simulated/floor/plating/kara
	requires_power = TRUE
	dynamic_lighting = TRUE
	forced_ambience = list('sound/ambience/tension/tension.ogg', 'sound/ambience/tension/argitoth.ogg', 'sound/ambience/tension/burning_terror.ogg')

/area/sc_away/aerostat/solars
	name = "\improper Away Mission - Aerostat Solars"
	icon_state = "crew_quarters"
	base_turf = /turf/simulated/floor/plating/kara
	dynamic_lighting = TRUE


// -- Landmarks -- //

/obj/effect/shuttle_landmark/premade/aerostat/aerostat_west
	name = "Aerostat - West Dock (Baby Mammoth, Stargazer,Needle, Ursula)"
	landmark_tag = "aerostat_west"

/obj/effect/shuttle_landmark/premade/aerostat/aerostat_east
	name = "Aerostat - East Dock (Echidna)"
	landmark_tag = "aerostat_east"

/obj/effect/shuttle_landmark/premade/aerostat/aerostat_south
	name = "Aerostat - South Dock"
	landmark_tag = "aerostat_south"

/obj/effect/shuttle_landmark/premade/aerostat/aerostat_northwest
	name = "Aerostat - Northwest Dock (Baby Mammoth, Stargazer,Needle, Ursula)"
	landmark_tag = "aerostat_northwest"

/obj/effect/shuttle_landmark/premade/aerostat/aerostat_northeast
	name = "Aerostat - Northeast Dock (Echidna)"
	landmark_tag = "aerostat_northeast"


// -- Objs -- //

/obj/sc_away_spawner/aerostat_inside //This spawner BS is proceeded by some BS in _southern_cross_submaps.dm
	name = "Aerostat Indoors Spawner"
	faction = "aerostat_inside"
	prob_spawn = 100
	prob_fall = 50
	//guard = 20
	mobs_to_pick_from = list(
		/mob/living/simple_mob/mechanical/hivebot/ranged_damage/basic = 3,
		/mob/living/simple_mob/mechanical/hivebot/ranged_damage/ion = 1,
		/mob/living/simple_mob/mechanical/hivebot/ranged_damage/laser = 3,
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
// Most turfs moved to kara.dm for use in future kara maps.

/*
KARA_TURF_CREATE(/turf/simulated/mineral)
/turf/simulated/mineral/kara/make_ore()
	if(mineral)
		return

	var/mineral_name = pickweight(list("marble" = 5, "uranium" = 5, "platinum" = 5, "hematite" = 5, "carbon" = 5, "diamond" = 5, "gold" = 5, "silver" = 5, "lead" = 5, "verdantium" = 5, "rutile" = 20))

	if(mineral_name && (mineral_name in GLOB.ore_data))
		mineral = GLOB.ore_data[mineral_name]
		UpdateMineral()
	update_icon()

KARA_TURF_CREATE(/turf/simulated/mineral/ignore_mapgen)
KARA_TURF_CREATE(/turf/simulated/mineral/floor)
KARA_TURF_CREATE(/turf/simulated/mineral/floor/ignore_mapgen)
*/

// -- Areas -- //


/*
/area/offmap/aerostat/surface
	flags = RAD_SHIELDED
	ambience = list('sound/ambience/ambimine.ogg', 'sound/ambience/song_game.ogg')
	base_turf = /turf/simulated/mineral/floor/ignore_mapgen/kara

/area/offmap/aerostat/surface/explored
	name = "Away Mission - Aerostat Surface (E)"
	icon_state = "explored"
	dynamic_lighting = FALSE

/area/offmap/aerostat/surface/shuttleconsole
	name = "Away Mission - Aerostat Surface Console"
	icon_state = "explored"
	dynamic_lighting = FALSE
	requires_power = FALSE

/area/offmap/aerostat/surface/unexplored
	name = "Away Mission - Aerostat Surface (UE)"
	icon_state = "unexplored"
	dynamic_lighting = FALSE

KARA_TURF_CREATE(/turf/simulated/floor/hull)

/area/offmap/aerostat/surface/outpost
	requires_power = TRUE
	dynamic_lighting = TRUE
	ambience = null

/area/offmap/aerostat/surface/outpost/backroom
	name = "V4 Outpost - Research Area"
/area/offmap/aerostat/surface/outpost/hallway
	name = "V4 Outpost - Hallway"
/area/offmap/aerostat/surface/outpost/cafe
	name = "V4 Outpost - Cafe"
/area/offmap/aerostat/surface/outpost/park
	name = "V4 Outpost - Park"
/area/offmap/aerostat/surface/outpost/officerone
	name = "V4 Outpost - Officer's Quarters 1"
/area/offmap/aerostat/surface/outpost/officertwo
	name = "V4 Outpost - Officer's Quarters 2"
/area/offmap/aerostat/surface/outpost/barracks
	name = "V4 Outpost - Barracks"
/area/offmap/aerostat/surface/outpost/airlock
	name = "V4 Outpost - Airlock"
/area/offmap/aerostat/surface/outpost/powerroom
	name = "V4 Outpost - Power Room"
/area/offmap/aerostat/surface/outpost/guardpost
	name = "V4 Outpost - Guard Post"
*/
