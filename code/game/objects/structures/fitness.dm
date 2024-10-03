/obj/structure/fitness
	icon = 'icons/obj/stationobjs.dmi'
	anchored = TRUE
	var/being_used = 0

/obj/structure/fitness/punchingbag
	name = "punching bag"
	desc = "A punching bag."
	icon_state = "punchingbag"
	density = TRUE
	var/list/hit_message = list("hit", "punch", "kick", "robust")

/obj/structure/fitness/punchingbag/attack_hand(var/mob/living/carbon/human/user)
	if(!istype(user))
		..()
		return
<<<<<<< HEAD
	if(user.nutrition < 70) //CHOMPEdit Set minimum nutrition to be the same as in fitness_machines_vr.dm
		to_chat(user, "<span class='warning'>You need more energy to use the punching bag. Go eat something.</span>")
	else if(user.weight < 70) // CHOMPAdd Begin Add weight loss to old fitness equipment
		to_chat(user, "<span class='notice'>You're too skinny to risk losing any more weight!</span>") // CHOMPAdd End
=======
	if(user.nutrition < 20)
		to_chat(user, span_warning("You need more energy to use the punching bag. Go eat something."))
>>>>>>> 7b5dfe54be... Merge pull request #16413 from Kashargul/span_rework
	else
		if(user.a_intent == I_HURT)
			user.setClickCooldown(user.get_attack_speed())
			flick("[icon_state]_hit", src)
			playsound(src, 'sound/effects/woodhit.ogg', 25, 1, -1)
			user.do_attack_animation(src)
<<<<<<< HEAD
			user.adjust_nutrition(-10) //CHOMPEdit Set nutrition drain to be the same as in fitness_machines_vr.dm
			user.weight -= 0.1 * (0.01 * user.weight_loss) // CHOMPAdd Add weight loss to old fitness equipment
			to_chat(user, "<span class='warning'>You [pick(hit_message)] \the [src].</span>")
=======
			user.nutrition = user.nutrition - 5
			to_chat(user, span_warning("You [pick(hit_message)] \the [src]."))
>>>>>>> 7b5dfe54be... Merge pull request #16413 from Kashargul/span_rework

/obj/structure/fitness/weightlifter
	name = "weightlifting machine"
	desc = "A machine used to lift weights."
	icon_state = "weightlifter"
	blocks_emissive = EMISSIVE_BLOCK_UNIQUE
	var/weight = 1
	var/list/qualifiers = list("with ease", "without any trouble", "with great effort")

/obj/structure/fitness/weightlifter/attackby(obj/item/W as obj, mob/user as mob)
	if(W.has_tool_quality(TOOL_WRENCH))
		playsound(src, 'sound/items/Deconstruct.ogg', 75, 1)
		weight = ((weight) % qualifiers.len) + 1
		to_chat(user, "You set the machine's weight level to [weight].")

/obj/structure/fitness/weightlifter/attack_hand(var/mob/living/carbon/human/user)
	if(!istype(user))
		return
	if(user.loc != src.loc)
		to_chat(user, span_warning("You must be on the weight machine to use it."))
		return
<<<<<<< HEAD
	if(user.nutrition < 70) //CHOMPEdit Set minimum nutrition to be the same as in fitness_machines_vr.dm
		to_chat(user, "<span class='warning'>You need more energy to lift weights. Go eat something.</span>")
=======
	if(user.nutrition < 50)
		to_chat(user, span_warning("You need more energy to lift weights. Go eat something."))
>>>>>>> 7b5dfe54be... Merge pull request #16413 from Kashargul/span_rework
		return
	if(user.weight < 70) //CHOMPAdd Begin Add weight loss to old fitness equipment
		to_chat(user, "<span class='notice'>You're too skinny to risk losing any more weight!</span>")
		return //CHOMPAdd End
	if(being_used)
		to_chat(user, span_warning("The weight machine is already in use by somebody else."))
		return
	else
		being_used = 1
		playsound(src, 'sound/effects/weightlifter.ogg', 50, 1)
		user.set_dir(SOUTH)
		flick("[icon_state]_[weight]", src)
		if(do_after(user, 30 + (weight * 10))) //CHOMPEdit Set timer to be similar to the machines in fitness_machines_vr.dm
			playsound(src, 'sound/effects/weightdrop.ogg', 25, 1)
			user.adjust_nutrition(weight * -10)
<<<<<<< HEAD
			user.weight -= 0.1 * weight * (0.01 * user.weight_loss) // CHOMPAdd Add weight loss to old fitness equipment
			to_chat(user, "<span class='notice'>You lift the weights [qualifiers[weight]].</span>")
=======
			to_chat(user, span_notice("You lift the weights [qualifiers[weight]]."))
>>>>>>> 7b5dfe54be... Merge pull request #16413 from Kashargul/span_rework
			being_used = 0
		else
			to_chat(user, span_notice("Against your previous judgement, perhaps working out is not for you."))
			being_used = 0
