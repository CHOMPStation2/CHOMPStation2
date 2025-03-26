// This causes submap maps to get 'checked' and compiled, when undergoing a unit test.
// This is so Travis can validate PoIs, and ensure future changes don't break PoIs, as PoIs are loaded at runtime and the compiler can't catch errors.

///////////////////////////////////////////////////////////////////////////////
// Primary Load - these are areas that will ALWAYS be in play.


//////////////////////////////////////////////////////////////////////////////
/// Away Missions
/// If you're reading this and want to add a new away mission, reference /tether/submaps/_tether_submaps.dm or existing away missions for how to set it up.

// This is for integration tests only.
// Always add any new away missions/gateways/lateloaded maps that are not PoIs here.
#ifdef AWAY_MISSION_TEST
//#include "../overmap/planets/kara/aerostat/aerostat.dmm" //Disabled due to low usage
//#include "../overmap/planets/kara/northern_star/northern_star_mine.dmm" //Disabled due to low usage
#include "../overmap/space/fueldepot.dmm"
#include "../overmap/planets/thor/thor.dmm" //The datum is in southern_cross_defines.dm
#include "../overmap/planets/tyr/tyr.dmm"
#include "gateway/BaseBlep.dmm"
#include "gateway/maddnesslab.dmm"
#include "gateway/snowfield.dmm"
// #include "gateway/hiddeneclipse.dmm" //needs remaping and energy is low.
#include "../../virtual_reality/constructVR.dmm"
#endif


//////////////////////////////////////////////////////////////////////////////////////

// Gateway submaps go here
/datum/map_template/sc_lateload/gateway
	name = "Gateway Submap"
	desc = "Please do not use this."
	mappath = null
	associated_map_datum = null

/datum/map_z_level/sc_lateload/gateway_destination
	name = "Gateway Destination"
	z = Z_LEVEL_GATEWAY

#include "gateway/snowfield_ch.dm" //CHOMPEDIT - Use the good one instead
/datum/map_template/sc_lateload/gateway/snowfield
	name = "Snow Field"
	desc = "An old base in middle of snowy wasteland"
	mappath = "modular_chomp/maps/southern_cross/submaps/gateway/snowfield.dmm"

#include "gateway/darkrps.dm"
/datum/map_template/sc_lateload/gateway/darkrps
	name = "Abandoned City"
	desc = "An abandoned city overrun with piracy and mercernaries."
	mappath = "modular_chomp/maps/southern_cross/submaps/gateway/darkrps.dmm"
	associated_map_datum = /datum/map_z_level/sc_lateload/gateway_destination

#include "gateway/diescraper.dm"
/datum/map_template/sc_lateload/gateway/diescraper
	name = "Skyscraper"
	desc = "A skyscraper of various businesses, apartments, and recreations. Do not fall"
	mappath = "modular_chomp/maps/southern_cross/submaps/gateway/diescraper.dmm"
	associated_map_datum = /datum/map_z_level/sc_lateload/gateway_destination

#include "gateway/BaseBlep.dm"
/datum/map_template/sc_lateload/gateway/baseblep
	name = "Base Blep"
	desc = "A brand new but already lost base at the end of a squishy canyon"

	mappath = "modular_chomp/maps/southern_cross/submaps/gateway/BaseBlep.dmm"
	associated_map_datum = /datum/map_z_level/sc_lateload/gateway_destination

#include "gateway/maddnesslab.dm"
/datum/map_template/sc_lateload/gateway/maddnesslab
	name = "Maddness Lab"
	desc = "An ancient base brimming with creations of maddness"
	mappath = "modular_chomp/maps/southern_cross/submaps/gateway/maddnesslab.dmm"
	associated_map_datum = /datum/map_z_level/sc_lateload/gateway_destination

#include "gateway/carpfarm.dm"
/datum/map_template/sc_lateload/gateway/carpfarm
	name = "Carp Farm"
	desc = "Asteroid base surrounded by carp"
	mappath = "modular_chomp/maps/southern_cross/submaps/gateway/carpfarm.dmm"
	associated_map_datum = /datum/map_z_level/sc_lateload/gateway_destination
/*
#include "gateway/hiddeneclipse.dm"
/datum/map_template/sc_lateload/gateway/hiddeneclipse
	name = "Distant Mining Facility"
	desc = "Asteroid mining facility, lost to unknown horrors"
	mappath = "modular_chomp/maps/southern_cross/submaps/gateway/hiddeneclipse.dmm"
	associated_map_datum = /datum/map_z_level/sc_lateload/gateway_destination
*/
//VR maps go here, tell me if theres a better way to load this
// #include "virtual_reality/constructVR.dm" Virtual Reality areas included by default.
//#include "maps/virtual_reality/constructVR.dm" //Included in .dme
/datum/map_template/sc_lateload/vr_world
	name = "VR World"
	desc = "A dynamic, virtual world."
	mappath = "modular_chomp/maps/virtual_reality/constructVR.dmm" //Use modular
	associated_map_datum = /datum/map_z_level/sc_lateload/vr_world

/datum/map_z_level/sc_lateload/vr_world
	name = "VR World"
	z = Z_LEVEL_VR_REALM

/datum/map_template/sc_lateload/thor
	name = "Thor Surface"
	desc = "The jungle like surface of Sif's moon"
	mappath = "modular_chomp/maps/southern_cross/overmap/planets/thor/thor.dmm"
	associated_map_datum = /datum/planet/thor

/datum/map_template/sc_lateload/tyr
	name = "Desert Valley"
	desc = "An anomalous valley within tyr"
	mappath = "modular_chomp/maps/southern_cross/overmap/planets/tyr/tyr.dmm"
	associated_map_datum = /datum/planet/tyr


//Space submaps/sectors/POIs/whatever you wanna freaking call it, go here.
/* Pretty sure we don't use this.
#include "../../expedition_vr/space/_fueldepot.dm"
/datum/map_template/sc_lateload/away_fueldepot
	name = "Fuel Depot - Z1 Space"
	desc = "An unmanned fuel depot floating in space."
	mappath = "maps/expedition_vr/space/fueldepot.dmm"
	associated_map_datum = /datum/map_z_level/sc_lateload/away_fueldepot

/datum/map_z_level/sc_lateload/away_fueldepot
	name = "Away Mission - Fuel Depot"
	z = Z_LEVEL_FUELDEPOT
*/

//////////////////////////////////////////////////////////////////////////////////////
// Code Shenanigans for lateload maps

/datum/map_template/sc_lateload
	allow_duplicates = FALSE
	var/associated_map_datum

/datum/map_template/sc_lateload/on_map_loaded(z)
	if(!associated_map_datum || !ispath(associated_map_datum))
		log_game("Extra z-level [src] has no associated map datum")
		return

	new associated_map_datum(using_map, z)

/datum/map_z_level/sc_lateload
	z = 0
	flags = MAP_LEVEL_SEALED

/datum/map_z_level/sc_lateload/New(var/datum/map/map, mapZ)
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

/obj/effect/step_trigger/zlevel_fall/Initialize(mapload)
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

/obj/sc_away_spawner/Initialize(mapload)
	. = ..()

	if(!LAZYLEN(mobs_to_pick_from))
		error("Mob spawner at [x],[y],[z] ([get_area(src)]) had no mobs_to_pick_from set on it!")
		flags |= ATOM_INITIALIZED //CHOMPEdit
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
				my_mob.min_oxy = gaslist[GAS_O2] * 0.8
				my_mob.min_tox = gaslist[GAS_PHORON] * 0.8
				my_mob.min_n2 = gaslist[GAS_N2] * 0.8
				my_mob.min_co2 = gaslist[GAS_CO2] * 0.8
				my_mob.max_oxy = gaslist[GAS_O2] * 1.2
				my_mob.max_tox = gaslist[GAS_PHORON] * 1.2
				my_mob.max_n2 = gaslist[GAS_N2] * 1.2
				my_mob.max_co2 = gaslist[GAS_CO2] * 1.2
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
