
/////////////////////////////////////////////
// Confetti and Glitter
// Uses same system as smoke so can have directional travel
/////////////////////////////////////////////

/obj/effect/effect/confetti
	name = "confetti"
	icon = 'icons/effects/effects.dmi'
	icon_state = "confetti"
	opacity = 0
	anchored = 0.0
	mouse_opacity = 0
	var/amount = 6.0
	var/time_to_live = 500

/obj/effect/effect/confetti/New()
	..()
	if(time_to_live)
		spawn (time_to_live)
			if(!QDELETED(src))
				qdel(src)
				//make confetti on ground cleanable decal to spawn

/datum/effect/effect/system/confetti_spread
	var/total_confetti = 0 // To stop it being spammed and lagging!
	var/direction
	var/confetti_type = /obj/effect/effect/confetti

/datum/effect/effect/system/confetti_spread/set_up(n = 5, c = 0, loca, direct)
	if(n > 10)
		n = 10
	number = n
	cardinals = c
	if(istype(loca, /turf/))
		location = loca
	else
		location = get_turf(loca)
	if(direct)
		direction = direct

/datum/effect/effect/system/confetti_spread/start(var/I)
	var/i = 0
	for(i=0, i<src.number, i++)
		if(src.total_confetti > 20)
			return
		spawn(0)
			if(holder)
				src.location = get_turf(holder)
			var/obj/effect/effect/confetti/confetti = new confetti_type(src.location)
			src.total_confetti++
			if(I)
				confetti.color = I	//Allows us to do differently colored confetti
			var/direction = src.direction
			if(!direction)
				if(src.cardinals)
					direction = pick(cardinal)
				else
					direction = pick(alldirs)
			for(i=0, i<pick(0,1,1,1,2,2,2,3), i++)
				sleep(10)
				step(confetti,direction)
			spawn(confetti.time_to_live*0.75+rand(10,30))
				if (confetti) qdel(confetti)
				src.total_confetti--

/////////////////////////////////////////////
// Snow fall
// Permanent mood snow
/////////////////////////////////////////////

/obj/effect/effect/snow
	name = "light snowfall"
	icon = 'icons/effects/weather.dmi'
	icon_state = "snowfall_light"

	layer = 4.2
	opacity = 0
	anchored = 0.0
	mouse_opacity = 0

/obj/effect/effect/snow/medium
	name = "medium snowfall"
	icon_state = "snowfall_med"

/obj/effect/effect/snow/heavy
	name = "heavy snowfall"
	icon_state = "snowfall_heavy"
