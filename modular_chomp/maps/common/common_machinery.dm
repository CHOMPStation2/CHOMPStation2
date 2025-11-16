// Garage Doors:
/obj/machinery/door/blast/shutters/garage
	name = "Garage Door"
	open_sound = 'sound/machines/door/garagedooropen.ogg'
	close_sound = 'sound/machines/door/garagedoorclose.ogg'

/obj/machinery/camera/network/exterior
	network = list(NETWORK_EXTERIOR)

/* Smol thing for funsies: Players will explore the tram tunnels.
 * However, Arrivals' South tunnel is cut off by mapping stuff, whereas departures and arrivals north isn't.
 * So! We'll tell players when they get there to go those directions.
*/

/obj/effect/step_trigger/tramblock
	invisibility = INVISIBILITY_BADMIN // nope cant see this shit
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

/obj/machinery/suit_cycler/exploration
	name = "Explorer suit cycler"
	model_text = "Exploration"
	req_one_access = list(ACCESS_PILOT,ACCESS_EXPLORER)

/obj/machinery/suit_cycler/pilot
	name = "Pilot suit cycler"
	model_text = "Pilot"
	req_access = null
	req_one_access = list(ACCESS_PILOT,ACCESS_EXPLORER)
