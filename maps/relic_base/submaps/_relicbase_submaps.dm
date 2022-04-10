// This causes submap maps to get 'checked' and compiled, when undergoing a unit test.
// This is so Travis can validate PoIs, and ensure future changes don't break PoIs, as PoIs are loaded at runtime and the compiler can't catch errors.

///////////////////////////////////////////////////////////////////////////////
// Primary Load - these are areas that will ALWAYS be in play.
/*
// TL;DR: _submaps.dm holds the templates. _areas.dm holds the areas. _things.dm holds SUBMAP-SPECIFIC things, such as a knife that only appears in underground-specific POIs.
#include "mining/_mining_submaps.dm" // These go underground, for mining.
#include "mining/_mining_areas.dm" // The areas, separated from the actual submaps file.
// #include "mining/mining_things.dm" // - This is not in use, but other submaps may want their own specific _things folder for, say, mining-specific stuff.

#include "outpost/_outpost_submaps.dm" // These go on the MAIN map, Z2.
#include "outpost/_outpost_areas.dm" // The areas, separated from the actual submaps file.
// #include "outpost/_outpost_things.dm" // - This is not in use, but other submaps may want their own specific _things folder for, say, mining-specific stuff.

#include "wilderness/_wilderness_submaps.dm" // These go in wilderness, north of the main outpost.
#include "wilderness/_wilderness_areas.dm" // The areas, separated from the actual submaps file.
// #include "wilderness/_wilderness_things.dm" // - This is not in use, but other submaps may want their own specific _things folder for, say, mining-specific stuff.

#include "ocean/_ocean_submaps.dm" // These go on the ocean Z-level, south of main outpost.
#include "ocean/_ocean_areas.dm" // The areas, separated from the actual submaps file.
// #include "ocean/_ocean_things.dm" // - This is not in use, but other submaps may want their own specific _things folder for, say, mining-specific stuff.

// Inserting this here, but this is where all our submap /area/'s draw from.
/area/submap/thor
	name = "Submap Area"
	icon_state = "submap"
	flags = RAD_SHIELDED
	ambience = AMBIENCE_RUINS
	secret_name = TRUE
	forbid_events = TRUE
	flags = AREA_FLAG_IS_NOT_PERSISTENT
*/
//////////////////////////////////////////////////////////////////////////////
/// Away Missions
/// If you're reading this and want to add a new away mission, reference /tether/submaps/_tether_submaps.dm or existing away missions for how to set it up.

/*
#if AWAY_MISSION_TEST
#include "beach/beach.dmm"
#include "beach/cave.dmm"
#include "alienship/alienship.dmm"
#include "aerostat/aerostat.dmm"
#include "aerostat/surface.dmm"
#include "space/debrisfield.dmm"
#endif
*/

// Commented out until we either port or replace away missions, but this is the framework for loading each away mission.

//////////////////////////////////////////////////////////////////////////////////////

// Gateway submaps go here
/datum/map_template/thor_lateload/gateway
	name = "Gateway Submap"
	desc = "Please do not use this."
	mappath = null
	associated_map_datum = null

/datum/map_z_level/thor_lateload/gateway_destination
	name = "Gateway Destination"
	z = Z_LEVEL_GATEWAY

#include "gateway/snowfield.dm"
/datum/map_template/thor_lateload/gateway/snowfield
	name = "Snow Field"
	desc = "An old base in middle of snowy wasteland"
	mappath = 'gateway/snowfield.dmm'
	associated_map_datum = /datum/map_z_level/thor_lateload/gateway_destination

#include "gateway/carpfarm.dm"
/datum/map_template/thor_lateload/gateway/carpfarm
	name = "Carp Farm"
	desc = "Asteroid base surrounded by carp"
	mappath = 'gateway/carpfarm.dmm'
	associated_map_datum = /datum/map_z_level/thor_lateload/gateway_destination


//Space submaps/sectors/POIs/whatever you wanna freaking call it, go here.
#include "../../expedition_vr/space/_fueldepot.dm"
/datum/map_template/thor_lateload/away_fueldepot
	name = "Fuel Depot - Z1 Space"
	desc = "An unmanned fuel depot floating in space."
	mappath = 'maps/expedition_vr/space/fueldepot.dmm'
	associated_map_datum = /datum/map_z_level/thor_lateload/away_fueldepot

/datum/map_z_level/thor_lateload/away_fueldepot
	name = "Away Mission - Fuel Depot"
	z = Z_LEVEL_FUELDEPOT


//////////////////////////////////////////////////////////////////////////////////////
// Code Shenanigans for lateload maps

/datum/map_template/thor_lateload
	allow_duplicates = FALSE
	var/associated_map_datum

/datum/map_template/thor_lateload/on_map_loaded(z)
	if(!associated_map_datum || !ispath(associated_map_datum))
		log_game("Extra z-level [src] has no associated map datum")
		return

	new associated_map_datum(using_map, z)

/datum/map_z_level/thor_lateload
	z = 0
	flags = MAP_LEVEL_SEALED

/datum/map_z_level/thor_lateload/New(var/datum/map/map, mapZ)
	if(mapZ && !z)
		z = mapZ
	return ..(map)

/turf/unsimulated/wall/seperator //to block vision between transit zones
	name = ""
	icon = 'icons/effects/effects.dmi'
	icon_state = "1"

/obj/effect/step_trigger/zlevel_fall/beach
	var/static/target_z

/obj/effect/step_trigger/zlevel_fall //Don't ever use this, only use subtypes.Define a new var/static/target_z on each
	affect_ghosts = 1

/obj/effect/step_trigger/zlevel_fall/Initialize()
	. = ..()

	if(istype(get_turf(src), /turf/simulated/floor))
		src:target_z = z
		return INITIALIZE_HINT_QDEL

/obj/effect/step_trigger/zlevel_fall/Trigger(var/atom/movable/A) //mostly from /obj/effect/step_trigger/teleporter/planetary_fall, step_triggers.dm L160
	if(!src:target_z)
		return

	var/attempts = 100
	var/turf/simulated/T
	while(attempts && !T)
		var/turf/simulated/candidate = locate(rand(5,world.maxx-5),rand(5,world.maxy-5),src:target_z)
		if(candidate.density)
			attempts--
			continue

		T = candidate
		break

	if(!T)
		return

	if(isobserver(A))
		A.forceMove(T) // Harmlessly move ghosts.
		return

	A.forceMove(T)
	if(isliving(A)) // Someday, implement parachutes.  For now, just turbomurder whoever falls.
		message_admins("\The [A] fell out of the sky.")
		var/mob/living/L = A
		L.fall_impact(T, 42, 90, FALSE, TRUE)	//You will not be defibbed from this.


/////////////////////////////////////////////////////////////////////////////////////
// Add objects that will be used in ALL away missions. Keep area specific stuff separate.

/obj/structure/old_roboprinter
	name = "old drone fabricator"
	desc = "Built like a tank, still working after so many years."
	icon = 'icons/obj/machines/drone_fab.dmi'
	icon_state = "drone_fab_idle"
	anchored = TRUE
	density = TRUE

/obj/sc_away_spawner
	name = "RENAME ME, JERK"
	desc = "Spawns the mobs!"
	icon = 'icons/mob/screen1.dmi'
	icon_state = "x"
	invisibility = 101
	mouse_opacity = 0
	density = 0
	anchored = 1

	//Weighted with values (not %chance, but relative weight)
	//Can be left value-less for all equally likely
	var/list/mobs_to_pick_from

	//When the below chance fails, the spawner is marked as depleted and stops spawning
	var/prob_spawn = 100	//Chance of spawning a mob whenever they don't have one
	var/prob_fall = 5		//Above decreases by this much each time one spawns

	//Settings to help mappers/coders have their mobs do what they want in this case
	var/faction				//To prevent infighting if it spawns various mobs, set a faction
	var/atmos_comp			//TRUE will set all their survivability to be within 20% of the current air
	//var/guard				//# will set the mobs to remain nearby their spawn point within this dist

	//Internal use only
	var/mob/living/simple_mob/my_mob
	var/depleted = FALSE

/obj/sc_away_spawner/Initialize()
	. = ..()

	if(!LAZYLEN(mobs_to_pick_from))
		error("Mob spawner at [x],[y],[z] ([get_area(src)]) had no mobs_to_pick_from set on it!")
		initialized = TRUE
		return INITIALIZE_HINT_QDEL
	START_PROCESSING(SSobj, src)

/obj/sc_away_spawner/process()
	if(my_mob && my_mob.stat != DEAD)
		return //No need

	if(LAZYLEN(loc.human_mobs(world.view)))
		return //I'll wait.

	if(prob(prob_spawn))
		prob_spawn -= prob_fall
		var/picked_type = pickweight(mobs_to_pick_from)
		my_mob = new picked_type(get_turf(src))
		my_mob.low_priority = TRUE

		if(faction)
			my_mob.faction = faction

		if(atmos_comp)
			var/turf/T = get_turf(src)
			var/datum/gas_mixture/env = T.return_air()
			if(env)
				my_mob.minbodytemp = env.temperature * 0.8
				my_mob.maxbodytemp = env.temperature * 1.2

				var/list/gaslist = env.gas
				my_mob.min_oxy = gaslist["oxygen"] * 0.8
				my_mob.min_tox = gaslist["phoron"] * 0.8
				my_mob.min_n2 = gaslist["nitrogen"] * 0.8
				my_mob.min_co2 = gaslist["carbon_dioxide"] * 0.8
				my_mob.max_oxy = gaslist["oxygen"] * 1.2
				my_mob.max_tox = gaslist["phoron"] * 1.2
				my_mob.max_n2 = gaslist["nitrogen"] * 1.2
				my_mob.max_co2 = gaslist["carbon_dioxide"] * 1.2
/* //VORESTATION AI TEMPORARY REMOVAL
		if(guard)
			my_mob.returns_home = TRUE
			my_mob.wander_distance = guard
*/
		return
	else
		STOP_PROCESSING(SSobj, src)
		depleted = TRUE
		return
