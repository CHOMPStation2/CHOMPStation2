// This causes cryogaia submap maps to get 'checked' and compiled, when undergoing a unit test.
// This is so Travis can validate PoIs, and ensure future changes don't break PoIs, as PoIs are loaded at runtime and the compiler can't catch errors.

//////////////////////////////////////////////////////////////////////////////
/// Static Load
/datum/map_template/cryogaia_lateload/cryogaia_plains
	name = "Snow plains"
	desc = "The Borealis away mission."
	mappath = "maps/yw/submaps/cryogaia_plains/cryogaia_plains.dmm"
	annihilate = TRUE
	associated_map_datum = /datum/map_z_level/cryogaia_lateload/cryogaia_plains

/datum/map_z_level/cryogaia_lateload/cryogaia_plains
	name = "Away Mission - Plains"
	flags = MAP_LEVEL_CONTACT|MAP_LEVEL_PLAYER
	base_turf = /turf/simulated/mineral/floor/
	z = Z_LEVEL_PLAINS

/datum/map_template/cryogaia_lateload/cryogaia_plains/on_map_loaded(z)
	. = ..()
	seed_submaps(list(Z_LEVEL_PLAINS), 240, /area/cryogaia/outpost/exploration_plains, /datum/map_template/surface/plains)

#include "../../submaps/surface_submaps/plains_yw/plains.dm"
#include "../../submaps/surface_submaps/plains_yw/plains_areas.dm"
#include "../../submaps/surface_submaps/plains_yw/plains_turfs.dm"

//////////////////////////////////////////////////////////////////////////////
/// Away Missions
#ifdef AWAY_MISSION_TEST
#include "cryogaia_plains/cryogaia_plains.dmm"
#endif

#include "beach/_beach.dm"
/datum/map_template/cryogaia_lateload/away_beach
	name = "Desert Planet - Z1 Beach"
	desc = "The beach away mission."
	mappath = "maps/yw/submaps/beach/beach.dmm"
	associated_map_datum = /datum/map_z_level/cryogaia_lateload/away_beach

/datum/map_z_level/cryogaia_lateload/away_beach
	name = "Away Mission - Desert Beach"
	z = Z_LEVEL_BEACH

/datum/map_template/cryogaia_lateload/away_beach_cave
	name = "Desert Planet - Z2 Cave"
	desc = "The beach away mission's cave."
	mappath = "maps/yw/submaps/beach/cave.dmm"
	associated_map_datum = /datum/map_z_level/cryogaia_lateload/away_beach_cave

/datum/map_template/cryogaia_lateload/away_beach_cave/on_map_loaded(z)
	. = ..()
	seed_submaps(list(Z_LEVEL_BEACH_CAVE), 120, /area/tether_away/cave/unexplored/normal, /datum/map_template/surface/mountains/normal)
	//seed_submaps(list(Z_LEVEL_BEACH_CAVE), 70, /area/tether_away/cave/unexplored/normal, /datum/map_template/surface/mountains/deep)

	// Now for the tunnels.
	new /datum/random_map/automata/cave_system/no_cracks(null, 3, 3, Z_LEVEL_BEACH_CAVE, world.maxx - 4, world.maxy - 4)
	new /datum/random_map/noise/ore/beachmine(null, 1, 1, Z_LEVEL_BEACH_CAVE, 64, 64)

/datum/map_z_level/cryogaia_lateload/away_beach_cave
	name = "Away Mission - Desert Cave"
	z = Z_LEVEL_BEACH_CAVE

//////////////////////////////////////////////////////////////////////////////////////
// Admin-use z-levels for loading whenever an admin feels like
#ifdef AWAY_MISSION_TEST
#include "admin_use/spa.dmm"
#endif

#include "admin_use/fun.dm"
/datum/map_template/cryogaia_lateload/fun/spa
	name = "Space Spa"
	desc = "A pleasant spa located in a spaceship."
	mappath = "maps/yw/submaps/admin_use/spa.dmm"

	associated_map_datum = /datum/map_z_level/cryogaia_lateload/fun/spa

/datum/map_z_level/cryogaia_lateload/fun/spa
	name = "Spa"
	flags = MAP_LEVEL_PLAYER|MAP_LEVEL_SEALED

//////////////////////////////////////////////////////////////////////////////////////
// Code Shenanigans for Cryogaia lateload maps
/datum/map_template/cryogaia_lateload
	allow_duplicates = FALSE
	var/associated_map_datum

/datum/map_template/cryogaia_lateload/on_map_loaded(z)
	if(!associated_map_datum || !ispath(associated_map_datum))
		log_game("Extra z-level [src] has no associated map datum")
		return

	new associated_map_datum(using_map, z)

/datum/map_z_level/cryogaia_lateload
	z = 0
	flags = MAP_LEVEL_SEALED

/datum/map_z_level/cryogaia_lateload/New(var/datum/map/map, mapZ)
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


#include "admin_ships/adminship.dm"

//////////////////////////////////////////////////////////////////////////////
//Rogue Mines Stuff

/datum/map_template/cryogaia_lateload/cryogaia_roguemines1
	name = "Asteroid Belt 1"
	desc = "Mining, but rogue. Zone 1"
	mappath = "maps/yw/submaps/rogue_mines/rogue_mine1.dmm"

	associated_map_datum = /datum/map_z_level/cryogaia_lateload/roguemines1

/datum/map_z_level/cryogaia_lateload/roguemines1
	name = "Belt 1"
	flags = MAP_LEVEL_CONTACT|MAP_LEVEL_PLAYER
	z = Z_LEVEL_ROGUEMINE_1

/datum/map_template/cryogaia_lateload/cryogaia_roguemines2
	name = "Asteroid Belt 2"
	desc = "Mining, but rogue. Zone 2"
	mappath = "maps/yw/submaps/rogue_mines/rogue_mine2.dmm"

	associated_map_datum = /datum/map_z_level/cryogaia_lateload/roguemines2

/datum/map_z_level/cryogaia_lateload/roguemines2
	name = "Belt 2"
	flags = MAP_LEVEL_CONTACT|MAP_LEVEL_PLAYER
	z = Z_LEVEL_ROGUEMINE_2

//////////////////////////////////////////////////////////////////////////////
//Underdark
#include "underdark_pois/_templates.dm"
#include "underdark_pois/underdark_things.dm"
/datum/map_template/cryogaia_lateload/cryogaia_underdark
	name = "Cryogaia - Underdark"
	desc = "Mining, but harder."
	mappath = "maps/yw/submaps/cryogaia_underdark.dmm"

	associated_map_datum = /datum/map_z_level/cryogaia_lateload/underdark

/datum/map_z_level/cryogaia_lateload/underdark
	name = "Underdark"
	flags = MAP_LEVEL_CONTACT|MAP_LEVEL_PLAYER|MAP_LEVEL_SEALED
	base_turf = /turf/simulated/mineral/floor
	z = Z_LEVEL_UNDERDARK

/datum/map_template/cryogaia_lateload/cryogaia_underdark/on_map_loaded(z)
	. = ..()
	seed_submaps(list(Z_LEVEL_UNDERDARK), 100, /area/mine/unexplored/underdark, /datum/map_template/underdark)
	new /datum/random_map/automata/cave_system/no_cracks(null, 3, 3, Z_LEVEL_UNDERDARK, world.maxx - 4, world.maxy - 4) // Create the mining Z-level.
	new /datum/random_map/noise/ore(null, 1, 1, Z_LEVEL_UNDERDARK, 64, 64)         // Create the mining ore distribution map.

//////////////////////////////////////////////////////////////////////////////
//Offmap Spawn Locations
#include "../../offmap_vr/talon/talon_v2.dm"
#include "../../offmap_vr/talon/talon_v2_areas.dm"

#ifdef MAP_TEST
#include "../../offmap_vr/talon/talon_v2.dmm"
#endif

//////////////////////////////////////////////////////////////////////////////
//Overmap ship spawns

#include "../../offmap_vr/om_ships/hybridshuttle.dm"
#include "../../offmap_vr/om_ships/screebarge.dm"
#include "../../offmap_vr/om_ships/aro.dm"
#include "../../offmap_vr/om_ships/aro2.dm"
#include "../../offmap_vr/om_ships/aro3.dm"
#include "../../offmap_vr/om_ships/bearcat.dm"
#include "../../offmap_vr/om_ships/vespa.dm"
#include "../../offmap_vr/om_ships/generic_shuttle.dm"
#include "../../offmap_vr/om_ships/salamander.dm"
#include "../../offmap_vr/om_ships/geckos.dm"
#include "../../offmap_vr/om_ships/mackerels.dm"
#include "../../offmap_vr/om_ships/mercenarybase.dm"
#include "../../offmap_vr/om_ships/mercship.dm"
#include "../../offmap_vr/om_ships/curashuttle.dm"
#include "../../offmap_vr/om_ships/itglight.dm"
#include "../../offmap_vr/om_ships/abductor.dm"
#include "../../offmap_vr/om_ships/lunaship.dm"
#include "../../offmap_vr/om_ships/sdf_corvettes.dm"

//////////////////////////////////////////////////////////////////////////////
//Capsule deployed ships
#include "../../offmap_vr/om_ships/shelter_5.dm"

// Talon offmap spawn
/datum/map_template/cryogaia_lateload/offmap/talon_v2
	name = "Offmap Ship - Talon V2"
	desc = "Offmap spawn ship, the Talon."
	mappath = "maps/offmap_vr/talon/talon_v2.dmm"
	associated_map_datum = /datum/map_z_level/cryogaia_lateload/talon_v2

/datum/map_z_level/cryogaia_lateload/talon_v2
	name = "Talon"
	flags = MAP_LEVEL_PLAYER|MAP_LEVEL_PERSIST|MAP_LEVEL_MAPPABLE
	base_turf = /turf/space
	z = Z_LEVEL_OFFMAP1
