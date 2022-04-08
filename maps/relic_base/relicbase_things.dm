// Relicbase-specific object subtypes.
// Garage Doors:
/obj/machinery/door/blast/shutters/garage
	name = "Garage Door"
	open_sound = 'sound/machines/door/garagedooropen.ogg'
	close_sound = 'sound/machines/door/garagedoorclose.ogg'
	
/obj/machinery/door/blast/gate/thin
	open_sound = 'sound/machines/door/gateopen.ogg'
	close_sound = 'sound/machines/door/gateclose.ogg'
	
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
		to_chat(A, "<span class='notice'>OOC Notice: You have an itch to explore, it seems! \
		This tunnel does not go any further past the doors, thanks to game limitations and stuff in the way! \
		However, north and the departures tram line extend the entire length of the map! \
		There's also other areas you can explore. Have fun. <3</span>"
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

/turf/simulated/floor/maglev/Initialize()
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