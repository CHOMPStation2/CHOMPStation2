/obj/structure/gargoyle
	name = "statue"
	desc = "A very lifelike carving."
	density = TRUE
	anchored = TRUE
	var/mob/living/carbon/human/gargoyle
	var/initial_sleep
	var/initial_blind
	var/initial_is_shifted
	var/initial_lying
	var/initial_lying_prev
	var/wagging
	var/flapping
	var/obj_integrity = 100
	var/original_int = 100
	var/max_integrity = 100
	var/stored_examine

/obj/structure/gargoyle/Initialize(mapload, var/mob/living/carbon/human/H)
	. = ..()
	if (isspace(loc) || isopenspace(loc))
		anchored = FALSE
	if (!istype(H) || !isturf(H.loc))
		return
	var/datum/component/gargoyle/comp = H.GetComponent(/datum/component/gargoyle)
	if (comp)
		comp.cooldown = world.time + (15 SECONDS)
		comp.statue = src
		comp.transformed = TRUE
		comp.paused = FALSE
	gargoyle = H

	max_integrity = H.getMaxHealth() + 100
	obj_integrity = H.health + 100
	original_int = obj_integrity
	name = "statue of [H.name]"
	desc = "A very lifelike statue of [H.name]."
	stored_examine = H.examine()
	description_fluff = H.get_description_fluff()

	if (H.buckled)
		H.buckled.unbuckle_mob(H, TRUE)
	icon = H.icon
	copy_overlays(H)
	color = list(rgb(77,77,77), rgb(150,150,150), rgb(28,28,28), rgb(0,0,0))
	initial_sleep = H.sleeping
	initial_blind = H.eye_blind
	initial_is_shifted = H.is_shifted
	transform = H.transform
	layer = H.layer
	pixel_x = H.pixel_x
	pixel_y = H.pixel_y
	dir = H.dir
	initial_lying = H.lying
	initial_lying_prev = H.lying_prev
	H.sdisabilities |= MUTE
	if (H.appearance_flags & PIXEL_SCALE)
		appearance_flags |= PIXEL_SCALE
	wagging = H.wagging
	H.transforming = TRUE
	flapping = H.flapping
	H.toggle_tail(FALSE, FALSE)
	H.toggle_wing(FALSE, FALSE)
	H.visible_message("<span class='warning'>[H]'s skin rapidly turns to stone!</span>", "<span class='warning'>Your skin abruptly hardens as you turn to stone!</span>")
	H.forceMove(src)
	H.SetBlinded(0)
	H.SetSleeping(0)
	H.status_flags |= GODMODE
	H.updatehealth()
	H.canmove = 0

/obj/structure/gargoyle/Destroy()
	unpetrify()
	. = ..()

/obj/structure/gargoyle/get_description_info()
	if (gargoyle)
		if (isspace(loc) || isopenspace(loc))
			return
		return "It can be [anchored ? "un" : ""]anchored with a wrench."

/obj/structure/gargoyle/examine(mob/user)
	if (gargoyle && stored_examine)
		return stored_examine
	return ..()

/obj/structure/gargoyle/proc/unpetrify()
	if (!gargoyle)
		return
	var/datum/component/gargoyle/comp = gargoyle.GetComponent(/datum/component/gargoyle)
	if (comp)
		comp.cooldown = world.time + (15 SECONDS)
		comp.statue = null
		comp.transformed = FALSE
	gargoyle.forceMove(loc)
	gargoyle.transform = transform
	gargoyle.pixel_x = pixel_x
	gargoyle.pixel_y = pixel_y
	gargoyle.is_shifted = initial_is_shifted
	gargoyle.dir = dir
	gargoyle.lying = initial_lying
	gargoyle.lying_prev = initial_lying_prev
	gargoyle.toggle_tail(wagging, FALSE)
	gargoyle.toggle_wing(flapping, FALSE)
	gargoyle.sdisabilities &= ~MUTE //why is there no ADD_TRAIT etc here that's actually ussssed
	gargoyle.status_flags &= ~GODMODE
	gargoyle.SetBlinded(initial_blind)
	gargoyle.SetSleeping(initial_sleep)
	gargoyle.transforming = FALSE
	gargoyle.canmove = 1
	gargoyle.update_canmove()
	var/hurtmessage = ""
	if (obj_integrity < original_int)
		var/f = (original_int - obj_integrity) / 10
		for (var/x in 1 to 10)
			gargoyle.adjustBruteLoss(f)
		hurtmessage = " <b>You feel your body take the damage that was dealt while being stone!</b>"
	gargoyle.updatehealth()
	alpha = 0
	gargoyle.visible_message("<span class='warning'>[gargoyle]'s skin rapidly softens, returning them to normal!</span>", "<span class='warning'>Your skin softens, freeing your movement once more![hurtmessage]</span>")

/obj/structure/gargoyle/return_air()
	return return_air_for_internal_lifeform()

/obj/structure/gargoyle/return_air_for_internal_lifeform(var/mob/living/lifeform)
	var/air_type = /datum/gas_mixture/belly_air
	if(istype(lifeform))
		air_type = lifeform.get_perfect_belly_air_type()
	var/air = new air_type(1000)
	return air

/obj/structure/gargoyle/proc/damage(var/damage)
	obj_integrity = min(obj_integrity-damage, max_integrity)
	if(obj_integrity <= 0)
		qdel(src)

/obj/structure/gargoyle/take_damage(var/damage)
	damage(damage)

/obj/structure/gargoyle/attack_generic(var/mob/user, var/damage, var/attack_message = "hits")
	user.do_attack_animation(src)
	visible_message("<span class='danger'>[user] [attack_message] the [src]!</span>")
	damage(damage)

/obj/structure/gargoyle/attackby(var/obj/item/weapon/W as obj, var/mob/user as mob)
	if(W.is_wrench())
		if (isspace(loc) || isopenspace(loc))
			to_chat(user, "<span class='warning'>You can't anchor that here!</span>")
			anchored = FALSE
			return ..()
		playsound(src, W.usesound, 50, 1)
		if (do_after(user, (2 SECONDS) * W.toolspeed, target = src))
			to_chat("<span class='notice'>You [anchored ? "un" : ""]anchor the [src].</span>")
			anchored = !anchored
	else if (!(W.flags & NOBLUDGEON))
		user.setClickCooldown(user.get_attack_speed(W))
		if(W.damtype == BRUTE || W.damtype == BURN)
			user.do_attack_animation(src)
			playsound(src, W.hitsound, 50, 1)
			damage(W.force)
	else
		return ..()