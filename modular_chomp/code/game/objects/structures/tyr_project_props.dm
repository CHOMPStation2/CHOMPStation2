/obj/structure/prop/blackbox/tyr_precursor_a
	catalogue_data = list(/datum/category_item/catalogue/information/blackbox/tyr_precursor_a)

/datum/category_item/catalogue/information/blackbox/tyr_precursor_a

/obj/structure/prop/blackbox/tyr_precursor_b
	catalogue_data = list(/datum/category_item/catalogue/information/blackbox/tyr_precursor_b)

/datum/category_item/catalogue/information/blackbox/tyr_precursor_b

/obj/structure/prop/blackbox/tyr_precursor_c
	catalogue_data = list(/datum/category_item/catalogue/information/blackbox/tyr_precursor_c)

/datum/category_item/catalogue/information/blackbox/tyr_precursor_c

//oooh, shiny
/obj/structure/prop/tyr_elevator //This won't function for a while, if ever
	name = "odd elevator"
	desc = "A strange metal cylandir. Seems sealed shut."
	icon = 'modular_chomp/icons/obj/tribal_gear.dmi'
	icon_state = "elevator"
	anchored = TRUE



/obj/structure/prop/weatherdoor
	name = "strange door"
	icon = 'modular_chomp/icons/obj/weather_ruins.dmi'
	icon_state = "star_door"
	anchored = TRUE
	var/weather_requirment = /datum/weather/tyr/starrynight


/obj/structure/prop/weatherdoor/proc/get_planet()
	var/turf/T = get_turf(src)
	if(!T)
		return

	if(!T.is_outdoors())
		return

	var/datum/planet/P = SSplanets.z_to_planet[T.z]
	if(!P)
		return
	return P

/obj/structure/prop/weatherdoor/attack_hand(mob/living/user)
	var/datum/planet/P = get_planet()
	if(user.is_incorporeal())
		return
	to_chat(user, "You push on the [src].")
	if(P.weather_holder == weather_requirment)
		visible_message(span_warning(span_orange("<B>The [src] slowly opens!.</B>")))
		density = FALSE
		icon_state = "open_door"


/obj/structure/prop/weatherdoor/tyrblizz
	icon_state = "blizzard_door"
	weather_requirment = /datum/weather/tyr/blizzard

/obj/structure/prop/weatherdoor/tyrstorm
	icon_state = "storm_door"
	weather_requirment = /datum/weather/tyr/storm

/obj/structure/prop/weatherdoor/tyrfog
	icon_state = "fog_door"
	weather_requirment = /datum/weather/tyr/fog
