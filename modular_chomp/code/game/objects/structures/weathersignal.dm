/obj/structure/prop/weather_signal
	name = "odd device"
	desc = "A strange machine that has a button but no clear purpose. Seems to hum during certian weathers."
	icon = 'modular_chomp/icons/mob/starbeast.dmi'
	icon_state = "machine_working"
	density = FALSE //Anti-cheese purposes.
	anchored = TRUE
	var/uses = 1

/obj/structure/prop/weather_signal/proc/get_planet()
	var/turf/T = get_turf(src)
	if(!T)
		return

	if(!T.is_outdoors())
		return

	var/datum/planet/P = SSplanets.z_to_planet[T.z]
	if(!P)
		return
	return P

/obj/structure/prop/weather_signal/attack_hand(mob/living/user)
	var/datum/planet/P = get_planet()
	if(user.is_incorporeal())
		return
	to_chat(user, "You push on the [src].")
	if(uses == 0)
		to_chat(user, "The machine is destroyed.")

	if(P.weather_holder == /datum/weather/sif/sandstorm)
		visible_message(span_bolddanger(span_orange("The [src] begins to tremble before something emerges!.")))
		uses = 0
		new /mob/living/simple_mob/vore/weatherbeast/sandstorm (src.loc)

	if(P.weather_holder == /datum/weather/sif/toxinrain)
		visible_message(span_bolddanger(span_orange("The [src] begins to tremble before something emerges!.")))
		uses = 0
		new /mob/living/simple_mob/vore/weatherbeast/acidrain (src.loc)

	if(P.weather_holder == /datum/weather/sif/midnightfog)
		visible_message(span_bolddanger(span_orange("The [src] begins to tremble before something emerges!.")))
		uses = 0
		new /mob/living/simple_mob/vore/weatherbeast/darkmist (src.loc)

	if(P.weather_holder == /datum/weather/sif/starryrift)
		visible_message(span_bolddanger(span_orange("The [src] begins to tremble before something emerges!.")))
		uses = 0
		new /mob/living/simple_mob/vore/weatherbeast/starsky (src.loc)
