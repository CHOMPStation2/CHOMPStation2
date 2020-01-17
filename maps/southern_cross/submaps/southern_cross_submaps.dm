// This is for allowing the submaps Souther Cross uses to be compiled/tested.
// This is so Travis can validate PoIs, and ensure future changes don't break PoIs, as PoIs are loaded at runtime and the compiler can't catch errors.

//////////////////////////////////////////////////////////////////////////////
/// Static Load

// Unused at this time - this is for maps like plains and tether's "ships" map

//////////////////////////////////////////////////////////////////////////////
/// Away Missions

#if AWAY_MISSION_TEST
#include "aerostat/aerostat.dmm"
#include "aerostat/surface.dmm"
#endif

#include "aerostat/_aerostat.dm"
/datum/map_template/southern_cross_lateload/away_aerostat
	name = "Remmi Aerostat - Z1 Aerostat"
	desc = "The Aerostat away mission."
	mappath = 'aerostat/aerostat.dmm'
	associated_map_datum = /datum/map_z_level/southern_cross_lateload/away_aerostat

/datum/map_z_level/southern_cross_lateload/away_aerostat
	name = "Away Mission - Aerostat"
	z = Z_LEVEL_AEROSTAT

/datum/map_template/southern_cross_lateload/away_aerostat_surface
	name = "Remmi Aerostat - Z2 Surface"
	desc = "The surface from the Aerostat."
	mappath = 'aerostat/surface.dmm'
	associated_map_datum = /datum/map_z_level/southern_cross_lateload/away_aerostat_surface

/datum/map_template/southern_cross_lateload/away_aerostat_surface/on_map_loaded(z)
	. = ..()
	seed_submaps(list(Z_LEVEL_AEROSTAT_SURFACE), 120, /area/tether_away/aerostat/surface/unexplored, /datum/map_template/virgo2)
	new /datum/random_map/automata/cave_system/no_cracks(null, 3, 3, Z_LEVEL_AEROSTAT_SURFACE, world.maxx - 4, world.maxy - 4)
	new /datum/random_map/noise/ore/virgo2(null, 1, 1, Z_LEVEL_AEROSTAT_SURFACE, 64, 64)

/datum/map_z_level/southern_cross_lateload/away_aerostat_surface
	name = "Away Mission - Aerostat Surface"
	z = Z_LEVEL_AEROSTAT_SURFACE

//////////////////////////////////////////////////////////////////////////////////////
// Code Shenanigans for lateload maps
/datum/map_template/southern_cross_lateload
	allow_duplicates = FALSE
	var/associated_map_datum

/datum/map_template/southern_cross_lateload/on_map_loaded(z)
	if(!associated_map_datum || !ispath(associated_map_datum))
		log_game("Extra z-level [src] has no associated map datum")
		return

	new associated_map_datum(using_map, z)

/datum/map_z_level/southern_cross_lateload
	z = 0
	flags = MAP_LEVEL_SEALED

/datum/map_z_level/southern_cross_lateload/New(var/datum/map/map, mapZ)
	if(mapZ && !z)
		z = mapZ
	return ..(map)

/turf/unsimulated/wall/seperator //to block vision between transit zones
	name = ""
	icon = 'icons/effects/effects.dmi'
	icon_state = "1"

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

/////////////////////////////