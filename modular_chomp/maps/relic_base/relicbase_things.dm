// Relicbase-specific object subtypes.
// Garage Doors:
/obj/machinery/door/blast/shutters/garage
	name = "Garage Door"
	open_sound = 'modular_chomp/sound/machines/door/garagedooropen.ogg'
	close_sound = 'modular_chomp/sound/machines/door/garagedoorclose.ogg'

/obj/machinery/door/blast/gate/thin
	open_sound = 'modular_chomp/sound/machines/door/gateopen.ogg'
	close_sound = 'modular_chomp/sound/machines/door/gateclose.ogg'

/obj/machinery/camera/network/exterior
	network = list(NETWORK_EXTERIOR)

/* Smol thing for funsies: Players will explore the tram tunnels.
 * However, Arrivals' South tunnel is cut off by mapping stuff, whereas departures and arrivals north isn't.
 * So! We'll tell players when they get there to go those directions.
*/

/obj/effect/step_trigger/tramblock
	invisibility = 99 // nope cant see this shit
	plane = ABOVE_PLANE
	anchored = TRUE
	icon = 'icons/mob/screen1.dmi' //VS Edit
	icon_state = "centermarker" //VS Edit

/obj/effect/step_trigger/tramblock/Trigger(var/atom/movable/A)
	if(istype(A, /mob/living/carbon/human))
		to_chat(A, span_notice("OOC Notice: You have an itch to explore, it seems! \
		This tunnel does not go any further past the doors, thanks to game limitations and stuff in the way! \
		However, north and the departures tram line extend the entire length of the map! \
		There's also other areas you can explore. Have fun. <3")
		)
	else
		return 0

// The tram's electrified maglev tracks
/turf/simulated/floor/maglev // These WILL shock you.
	name = "maglev track"
	desc = "Magnetic levitation tram tracks. Caution! Electrified!"
	icon = 'icons/turf/flooring/maglevs.dmi'
	icon_state = "maglevup"

	var/area/shock_area = /area/hallway/primary // We use this, given our current tram /areas/ are set to this. Clean this up later if we give tram halls their own dedicated /area/

/turf/simulated/floor/maglev/Initialize(mapload)
	. = ..()
	shock_area = locate(shock_area)

// Walking on maglev tracks will shock you! Horray!
/turf/simulated/floor/maglev/Entered(var/atom/movable/AM, var/atom/old_loc)
	if(isliving(AM) && !(AM.is_incorporeal()) && prob(50))
		track_zap(AM)

/turf/simulated/floor/maglev/attack_hand(var/mob/user)
	if(prob(75))
		track_zap(user)

/turf/simulated/floor/maglev/proc/track_zap(var/mob/living/user)
	if(!istype(user))
		return
	if(electrocute_mob(user, shock_area, src))
		var/datum/effect/effect/system/spark_spread/s = new /datum/effect/effect/system/spark_spread
		s.set_up(5, 1, src)
		s.start()

/turf/simulated/floor/maglev/unpowered
	desc = "Magnetic levitation tram tracks. Unpowered? Looks like it. Safe? Your try."

/turf/simulated/floor/maglev/unpowered/Entered(var/atom/movable/AM, var/atom/old_loc)
	return // No zappy.

// Override for relicbase.
// Base Mineral turf override, for testing.
/turf/simulated/mineral/thor
	name = "dark rock"
	floor_name = "deeprock"
	sand_icon_state = "basalt"
	rock_icon_state = "deeprock"
	sand_icon_path = 'modular_chomp/icons/turf/thor.dmi'
	rock_icon_path = 'modular_chomp/icons/turf/thor.dmi'
	rock_side_icon_state = "deeprock_side"
	desc = "Dark black basalt. Rich in exotic minerals."
	icon = 'modular_chomp/icons/turf/thor.dmi'
	icon_state = "deeprock"

/turf/simulated/mineral/thor/ignore_oregen
	ignore_oregen = TRUE

/turf/simulated/mineral/thor/ignore_cavegen
	ignore_cavegen = TRUE

/turf/simulated/mineral/thor/ignore_mapgen
	ignore_mapgen = TRUE

/turf/simulated/mineral/thor/floor
	name = "basalt"
	floor_name = "basalt"
	desc = "Loose, rocky basalt. It crumbles to sand under the slightest bit of force."
	icon = 'modular_chomp/icons/turf/thor.dmi'
	icon_state = "basalt0"
	temperature = 393.15
	density = FALSE
	opacity = 0
	blocks_air = 0
	can_build_into_floor = TRUE

/turf/simulated/mineral/thor/floor/ignore_oregen
	ignore_oregen = TRUE

/turf/simulated/mineral/thor/floor/ignore_cavegen
	ignore_cavegen = TRUE

/turf/simulated/mineral/thor/floor/ignore_mapgen
	ignore_mapgen = TRUE

/turf/simulated/mineral/thor/floor/cave
	name = "basalt"
	desc = "Loose, rocky basalt. It crumbles to sand under the slightest bit of force."
	icon_state = "basalt0"
	icon = 'modular_chomp/icons/turf/thor.dmi'

/turf/simulated/mineral/thor/mines
	name = "dark rock"
	desc = "Dark black basalt. Rich in exotic minerals."
	icon_state = "deeprock"
	icon = 'modular_chomp/icons/turf/thor.dmi'
	temperature = 393.15

/turf/unsimulated/mineral/thor/mines
	name = "impassable dark rock"
	desc = "Dark black basalt. Packed impossibly tightly, no way to get past this."
	icon_state = "deeprock-solid"
	icon = 'modular_chomp/icons/turf/thor.dmi'
	temperature = 393.15

/turf/simulated/mineral/thor/floor/ignore_mapgen/cave
	name = "basalt"

/turf/simulated/mineral/thor/ignore_mapgen/cave
	name = "dark rock"
