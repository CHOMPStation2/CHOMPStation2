/obj/structure/gargoyle
	name = "statue"
	desc = "A very lifelike carving."
	density = TRUE
	anchored = TRUE
	var/mob/living/carbon/human/gargoyle
	var/initial_sleep
	var/initial_blind

/obj/structure/gargoyle/Initialize(var/location, var/mob/living/carbon/human/H)
	. = ..()
	if (!location || !istype(H))
		return
	gargoyle = H
	if (H.buckled)
		H.buckled.unbuckle_mob(H, TRUE)
		H.click_intercept = src
		initial_sleep = H.sleeping
		intial_blind = H.eye_blind
		transform = H.transform
		layer = H.layer
		pixel_x = H.pixel_x
		pixel_y = H.pixel_y
		dir = H.dir
		H.disabilites |= MUTE
		H.forceMove(src)
		H.setBlinded(0)
		H.setSleeping(0)
		H.status_flags |= GODMODE
		H.updatehealth()
		H.canmove = 0

