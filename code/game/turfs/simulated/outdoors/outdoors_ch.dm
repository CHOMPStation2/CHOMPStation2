/turf/simulated/floor/outdoors
	var/demote_to = /turf/simulated/floor/outdoors/rocks

/turf/simulated/floor/outdoors/proc/promote(var/new_turf_type)
	var/mytype = src.type
	var/list/coords = list(x, y, z)

	ChangeTurf(new_turf_type)
	var/turf/simulated/floor/outdoors/T = locate(coords[1], coords[2], coords[3])
	if(istype(T))
		T.demote_to = mytype

// This proc removes the topmost layer.
/turf/proc/demote()
	return

/turf/simulated/floor/outdoors/demote()
	if(!demote_to)
		return // Cannot demote further.

	ChangeTurf(demote_to, preserve_outdoors = TRUE)

/turf/simulated/floor/outdoors/grass
	demote_to = /turf/simulated/floor/outdoors/dirt

/turf/simulated/floor/outdoors/snow
	demote_to = /turf/simulated/floor/outdoors/dirt

/turf/simulated/floor/outdoors/fur
	demote_to = null

// General sif turf defines for unit test, overridden in map for specific values
/turf/simulated/floor/plating/sif/planetuse

/turf/simulated/mineral/floor/sif

/turf/simulated/open/sif

/turf/simulated/mineral/floor/ignore_mapgen/sif

/turf/simulated/floor/plating/sif/planetuse

/turf/simulated/floor/outdoors/snow/sif/planetuse
	name = "snow"
	icon_state = "snow"
	edge_blending_priority = 6
	movement_cost = 2
	initial_flooring = /decl/flooring/snow

/turf/simulated/floor/outdoors/snow/sif/planetuse/Entered(atom/A)
	if(isliving(A))
		var/mob/living/L = A
		if(L.hovering) // Flying things shouldn't make footprints.
			return ..()
		var/mdir = "[A.dir]"
		crossed_dirs[mdir] = 1
		update_icon()
	. = ..()

/turf/simulated/floor/outdoors/snow/sif/planetuse/update_icon()
	..()
	for(var/d in crossed_dirs)
		add_overlay(image(icon = 'icons/turf/outdoors.dmi', icon_state = "snow_footprints", dir = text2num(d)))

/turf/simulated/floor/outdoors/snow/sif/planetuse/attackby(var/obj/item/W, var/mob/user)
	if(istype(W, /obj/item/shovel))
		to_chat(user, span_notice("You begin to remove \the [src] with your [W]."))
		if(do_after(user, 4 SECONDS * W.toolspeed, src))
			to_chat(user, span_notice("\The [src] has been dug up, and now lies in a pile nearby."))
			new /obj/item/stack/material/snow(src)
			demote()
		else
			to_chat(user, span_notice("You decide to not finish removing \the [src]."))
	else
		..()

/turf/simulated/floor/outdoors/snow/sif/planetuse/attack_hand(mob/user as mob)
	visible_message("[user] starts scooping up some snow.", "You start scooping up some snow.")
	if(do_after(user, 1 SECOND, src))
		var/obj/S = new /obj/item/stack/material/snow(user.loc)
		user.put_in_hands(S)
		visible_message("[user] scoops up a pile of snow.", "You scoop up a pile of snow.")
	return

/turf/simulated/sky/moving/north/sif/planet_fall/find_planet()
	return planet_sif

/turf/simulated/floor/outdoors/dirt/sif

/turf/simulated/floor/outdoors/dirt/sif/planetuse

/turf/simulated/floor/outdoors/grass/sif/forest/planetuse

/turf/simulated/floor/outdoors/rocks/sif/planetuse

/turf/simulated/floor/outdoors/mud/sif/planetuse

/turf/simulated/mineral/sif

/turf/simulated/mineral/ignore_mapgen/sif

/turf/simulated/floor/outdoors/grass/sif/planetuse

/turf/simulated/floor/tiled/steel/sif/planetuse

/turf/simulated/floor/tiled/sif/planetuse

/obj/effect/step_trigger/teleporter/planetary_fall/sif/find_planet()
	planet = planet_sif
