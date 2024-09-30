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
	if(user.nutrition < 70) //CHOMPEdit Set minimum nutrition to be the same as in fitness_machines_vr.dm
		to_chat(user, "<span class='warning'>You need more energy to use the punching bag. Go eat something.</span>")
	else if(user.weight < 70) // CHOMPAdd Begin Add weight loss to old fitness equipment
		to_chat(user, "<span class='notice'>You're too skinny to risk losing any more weight!</span>") // CHOMPAdd End
	else
		if(user.a_intent == I_HURT)
			user.setClickCooldown(user.get_attack_speed())
			flick("[icon_state]_hit", src)
			playsound(src, 'sound/effects/woodhit.ogg', 25, 1, -1)
			user.do_attack_animation(src)
			user.adjust_nutrition(-10) //CHOMPEdit Set nutrition drain to be the same as in fitness_machines_vr.dm
			user.weight -= 0.1 * (0.01 * user.weight_loss) // CHOMPAdd Add weight loss to old fitness equipment
			to_chat(user, "<span class='warning'>You [pick(hit_message)] \the [src].</span>")

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
		to_chat(user, "<span class='warning'>You must be on the weight machine to use it.</span>")
		return
	if(user.nutrition < 70) //CHOMPEdit Set minimum nutrition to be the same as in fitness_machines_vr.dm
		to_chat(user, "<span class='warning'>You need more energy to lift weights. Go eat something.</span>")
		return
	if(user.weight < 70) //CHOMPAdd Begin Add weight loss to old fitness equipment
		to_chat(user, "<span class='notice'>You're too skinny to risk losing any more weight!</span>")
		return //CHOMPAdd End
	if(being_used)
		to_chat(user, "<span class='warning'>The weight machine is already in use by somebody else.</span>")
		return
	else
		being_used = 1
		playsound(src, 'sound/effects/weightlifter.ogg', 50, 1)
		user.set_dir(SOUTH)
		flick("[icon_state]_[weight]", src)
		if(do_after(user, 30 + (weight * 10))) //CHOMPEdit Set timer to be similar to the machines in fitness_machines_vr.dm
			playsound(src, 'sound/effects/weightdrop.ogg', 25, 1)
			user.adjust_nutrition(weight * -10)
			user.weight -= 0.1 * weight * (0.01 * user.weight_loss) // CHOMPAdd Add weight loss to old fitness equipment
			to_chat(user, "<span class='notice'>You lift the weights [qualifiers[weight]].</span>")
			being_used = 0
		else
			to_chat(user, "<span class='notice'>Against your previous judgement, perhaps working out is not for you.</span>")
			being_used = 0
