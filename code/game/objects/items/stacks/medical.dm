/obj/item/stack/medical
	name = "medical pack"
	singular_name = "medical pack"
	icon = 'icons/obj/stacks.dmi'
	amount = 10
	max_amount = 10
	w_class = ITEMSIZE_SMALL
	throw_speed = 4
	throw_range = 20
	var/heal_brute = 0
	var/heal_burn = 0
	var/apply_sounds
	drop_sound = 'sound/items/drop/cardboardbox.ogg'
	pickup_sound = 'sound/items/pickup/cardboardbox.ogg'

	var/upgrade_to	// The type path this stack can be upgraded to.

/obj/item/stack/medical/attack(mob/living/carbon/M as mob, mob/user as mob)
	if (!istype(M))
		balloon_alert(user, "\The [src] cannot be applied to [M]!") // CHOMPEdit - Balloon Alerts
		return 1

	if (!user.IsAdvancedToolUser())
		balloon_alert(user, "You don't have the dexterity to do this!") // CHOMPEdit - Balloon Alerts
		return 1

	var/available = get_amount()
	if(!available)
		balloon_alert(user, "Not enough [uses_charge ? "charge" : "items"] left to use that!") // CHOMPEdit - Balloon Alerts
		return 1

	if (ishuman(M))
		var/mob/living/carbon/human/H = M
		var/obj/item/organ/external/affecting = H.get_organ(user.zone_sel.selecting)

		if(!affecting)
			balloon_alert(user, "No body part there to work on!") // CHOMPEdit - Balloon Alerts
			return 1

		if(affecting.organ_tag == BP_HEAD)
			if(H.head && istype(H.head,/obj/item/clothing/head/helmet/space))
				balloon_alert(user, "You can't apply [src] through [H.head]!") // CHOMPEdit - Balloon Alerts
				return 1
		else
			if(H.wear_suit && istype(H.wear_suit,/obj/item/clothing/suit/space))
				balloon_alert(user, "You can't apply [src] through [H.wear_suit]!") // CHOMPEdit - Balloon Alerts
				return 1

		if(affecting.robotic == ORGAN_ROBOT)
			balloon_alert(user, "This isn't useful at all on a robotic limb.") // CHOMPEdit - Balloon Alerts
			return 1

		if(affecting.robotic >= ORGAN_LIFELIKE)
			balloon_alert(user, "You apply the [src], but it seems to have no effect...") // CHOMPEdit - Balloon Alerts
			use(1)
			return 1

		H.UpdateDamageIcon()

	else

		M.heal_organ_damage((src.heal_brute/2), (src.heal_burn/2))
		user.balloon_alert_visible( \
			"[M] has been applied with [src] by [user].", \
			"You apply \the [src] to [M]." \
		)
		use(1)

	M.updatehealth()

/obj/item/stack/medical/proc/upgrade_stack(var/upgrade_amount)
	. = FALSE

	var/turf/T = get_turf(src)

	if(ispath(upgrade_to) && use(upgrade_amount))
		var/obj/item/stack/medical/M = new upgrade_to(T, upgrade_amount)
		return M

	return .

/obj/item/stack/medical/crude_pack
	name = "crude bandage"
	singular_name = "crude bandage length"
	desc = "Some bandages to wrap around bloody stumps."
	icon_state = "gauze"
	origin_tech = list(TECH_BIO = 1)
	no_variants = FALSE
	apply_sounds = list('sound/effects/rip1.ogg','sound/effects/rip2.ogg')

	upgrade_to = /obj/item/stack/medical/bruise_pack

/obj/item/stack/medical/crude_pack/attack(mob/living/carbon/M as mob, mob/user as mob)
	if(..())
		return 1

	if (ishuman(M))
		var/mob/living/carbon/human/H = M
		var/obj/item/organ/external/affecting = H.get_organ(user.zone_sel.selecting)

		if(affecting.open)
			balloon_alert(user, "The [affecting.name] is cut open!") // CHOMPEdit - Balloon Alerts
			return

		if(affecting.is_bandaged())
			balloon_alert(user, "[M]'s [affecting.name] is already bandaged.") // CHOMPEdit - Balloon Alerts
			return 1
		else
			var/available = get_amount()
			user.balloon_alert_visible("\The [user] starts bandaging [M]'s [affecting.name].", \
					             "Bandaging [M]'s [affecting.name]." ) // CHOMPEdit - Balloon Alerts
			var/used = 0
			for (var/datum/wound/W in affecting.wounds)
				if(W.internal)
					continue
				if(W.bandaged)
					continue
				if(used == amount)
					break
				if(!do_mob(user, M, W.damage/3, exclusive = TRUE))
					balloon_alert(user, "Stand still to bandage wounds.") // CHOMPEdit - Balloon Alerts
					break

				if(affecting.is_bandaged()) // We do a second check after the delay, in case it was bandaged after the first check.
					balloon_alert(user, "[M]'s [affecting.name] is already bandaged.") // CHOMPEdit - Balloon Alerts
					return 1

				if(used >= available)
					balloon_alert(user, "You run out of [src]!") // CHOMPEdit - Balloon Alerts
					break

				if (W.current_stage <= W.max_bleeding_stage)
					user.balloon_alert_visible("\The [user] bandages \a [W.desc] on [M]'s [affecting.name].", \
					                              "You bandage \a [W.desc] on [M]'s [affecting.name]." ) // CHOMPEdit - Balloon Alerts
				else
					user.balloon_alert_visible("\The [user] places a bandage over \a [W.desc] on [M]'s [affecting.name].", \
					                              "You place a bandage over \a [W.desc] on [M]'s [affecting.name]." ) // CHOMPEdit - Balloon Alerts
				W.bandage()
				playsound(src, pick(apply_sounds), 25)
				used++
			affecting.update_damages()
			if(used == amount)
				if(affecting.is_bandaged())
					balloon_alert(user, "\The [src] is used up.") // CHOMPEdit - Balloon Alerts
				else
					balloon_alert(user, "\The [src] is used up, but there are more wounds to treat on \the [affecting.name].") // CHOMPEdit - Balloon Alerts
			use(used)

/obj/item/stack/medical/bruise_pack
	name = "roll of gauze"
	singular_name = "gauze length"
	desc = "Some sterile gauze to wrap around bloody stumps."
	icon_state = "brutepack"
	origin_tech = list(TECH_BIO = 1)
	no_variants = FALSE
	apply_sounds = list('sound/effects/rip1.ogg','sound/effects/rip2.ogg')
	drop_sound = 'sound/items/drop/gloves.ogg'
	pickup_sound = 'sound/items/pickup/gloves.ogg'

	upgrade_to = /obj/item/stack/medical/advanced/bruise_pack

/obj/item/stack/medical/bruise_pack/attack(mob/living/carbon/M as mob, mob/user as mob)
	if(..())
		return 1

	if (ishuman(M))
		var/mob/living/carbon/human/H = M
		var/obj/item/organ/external/affecting = H.get_organ(user.zone_sel.selecting)

		if(affecting.open)
			balloon_alert(user, "The [affecting.name] is cut open!") // CHOMPEdit - Balloon Alerts
			return

		if(affecting.is_bandaged())
			balloon_alert(user, "[M]'s [affecting.name] is already bandaged.") // CHOMPEdit - Balloon Alerts
			return 1
		else
			var/available = get_amount()
			user.balloon_alert_visible("\The [user] starts treating [M]'s [affecting.name].", \
					             "Treating [M]'s [affecting.name]." ) // CHOMPEdit - Balloon Alerts
			var/used = 0
			for (var/datum/wound/W in affecting.wounds)
				if (W.internal)
					continue
				if(W.bandaged)
					continue
				if(used == amount)
					break
				if(!do_mob(user, M, W.damage/5, exclusive = TRUE))
					balloon_alert(user, "Stand still to bandage wounds.") // CHOMPEdit - Balloon Alerts
					break

				if(affecting.is_bandaged()) // We do a second check after the delay, in case it was bandaged after the first check.
					balloon_alert(user, "[M]'s [affecting.name] is already bandaged.") // CHOMPEdit - Balloon Alerts
					return 1

				if(used >= available)
					balloon_alert(user, "You run out of [src]!") // CHOMPEdit - Balloon Alerts
					break

				if (W.current_stage <= W.max_bleeding_stage)
					user.balloon_alert_visible("\The [user] bandages \a [W.desc] on [M]'s [affecting.name].", \
					                              "Bandaged \a [W.desc] on [M]'s [affecting.name]." ) // CHOMPEdit - Balloon Alerts
					//H.add_side_effect("Itch")
				else if (W.damage_type == BRUISE)
					user.balloon_alert_visible("\The [user] places a bruise patch over \a [W.desc] on [M]'s [affecting.name].", \
					                              "Placed bruise patch over \a [W.desc] on [M]'s [affecting.name]." ) // CHOMPEdit - Balloon Alerts
				else
					user.balloon_alert_visible("\The [user] places a bandaid over \a [W.desc] on [M]'s [affecting.name].", \
					                              "Placed bandaid over \a [W.desc] on [M]'s [affecting.name]." ) // CHOMPEdit - Balloon Alerts
				W.bandage()
				// W.disinfect() // VOREStation - Tech1 should not disinfect
				playsound(src, pick(apply_sounds), 25)
				used++
			affecting.update_damages()
			if(used == amount)
				if(affecting.is_bandaged())
					balloon_alert(user, "\The [src] is used up.") // CHOMPEdit - Balloon Alerts
				else
					balloon_alert(user, "\The [src] is used up, but there are more wounds to treat on \the [affecting.name].") // CHOMPEdit - Balloon Alerts
			use(used)

/obj/item/stack/medical/ointment
	name = "ointment"
	desc = "Used to treat those nasty burns."
	gender = PLURAL
	singular_name = "ointment"
	icon_state = "ointment"
	heal_burn = 1
	origin_tech = list(TECH_BIO = 1)
	no_variants = FALSE
	apply_sounds = list('sound/effects/ointment.ogg')
	drop_sound = 'sound/items/drop/herb.ogg'
	pickup_sound = 'sound/items/pickup/herb.ogg'

/obj/item/stack/medical/ointment/attack(mob/living/carbon/M as mob, mob/user as mob)
	if(..())
		return 1

	if (ishuman(M))
		var/mob/living/carbon/human/H = M
		var/obj/item/organ/external/affecting = H.get_organ(user.zone_sel.selecting)

		if(affecting.open)
			balloon_alert(user, "The [affecting.name] is cut open!") // CHOMPEdit - Balloon Alerts // CHOMPEdit - Balloon Alerts
			return

		if(affecting.is_salved())
			balloon_alert(user, "The wounds on [M]'s [affecting.name] have already been salved.") // CHOMPEdit - Balloon Alerts // CHOMPEdit - Balloon Alerts
			return 1
		else
			user.balloon_alert_visible("\The [user] starts salving wounds on [M]'s [affecting.name].", \
					             "Salving the wounds on [M]'s [affecting.name]." ) // CHOMPEdit - Balloon Alerts // CHOMPEdit - Balloon Alerts
			if(!do_mob(user, M, 10, exclusive = TRUE))
				balloon_alert(user, "Stand still to salve wounds.") // CHOMPEdit - Balloon Alerts // CHOMPEdit - Balloon Alerts
				return 1
			if(affecting.is_salved()) // We do a second check after the delay, in case it was bandaged after the first check.
				balloon_alert(user, "[M]'s [affecting.name] have already been salved.") // CHOMPEdit - Balloon Alerts // CHOMPEdit - Balloon Alerts
				return 1
			user.balloon_alert_visible("[user] salved wounds on [M]'s [affecting.name].", \
			                         "Salved wounds on [M]'s [affecting.name]." ) // CHOMPEdit - Balloon Alerts // CHOMPEdit - Balloon Alerts
			use(1)
			affecting.salve()
			playsound(src, pick(apply_sounds), 25)

/obj/item/stack/medical/ointment/simple
	name = "ointment paste"
	desc = "A simple thick paste used to salve burns."
	singular_name = "old-ointment"
	icon_state = "old-ointment"

/obj/item/stack/medical/advanced/bruise_pack
	name = "advanced trauma kit"
	singular_name = "advanced trauma kit"
	desc = "An advanced trauma kit for severe injuries."
	icon_state = "traumakit"
	heal_brute = 7 //VOREStation Edit
	origin_tech = list(TECH_BIO = 1)
	apply_sounds = list('sound/effects/rip1.ogg','sound/effects/rip2.ogg','sound/effects/tape.ogg')

/obj/item/stack/medical/advanced/bruise_pack/attack(mob/living/carbon/M as mob, mob/user as mob)
	if(..())
		return 1

	if (ishuman(M))
		var/mob/living/carbon/human/H = M
		var/obj/item/organ/external/affecting = H.get_organ(user.zone_sel.selecting)

		if(affecting.open)
			balloon_alert(user, "The [affecting.name] is cut open!") // CHOMPEdit - Balloon Alerts // CHOMPEdit - Balloon Alerts
			return

		if(affecting.is_bandaged() && affecting.is_disinfected())
			balloon_alert(user, "[M]'s [affecting.name] have already been treated.") // CHOMPEdit - Balloon Alerts // CHOMPEdit - Balloon Alerts
			return 1
		else
			var/available = get_amount()
			user.balloon_alert_visible("\The [user] starts treating [M]'s [affecting.name].", \
					             "Treating [M]'s [affecting.name]." ) // CHOMPEdit - Balloon Alerts // CHOMPEdit - Balloon Alerts
			var/used = 0
			for (var/datum/wound/W in affecting.wounds)
				if (W.internal)
					continue
				if (W.bandaged && W.disinfected)
					continue
				//if(used == amount) //VOREStation Edit
				//	break //VOREStation Edit
				if(!do_mob(user, M, W.damage/5, exclusive = TRUE))
					balloon_alert(user, "Stand still to bandage wounds.") // CHOMPEdit - Balloon Alerts // CHOMPEdit - Balloon Alerts
					break
				if(affecting.is_bandaged() && affecting.is_disinfected()) // We do a second check after the delay, in case it was bandaged after the first check.
					balloon_alert(user, "[M]'s [affecting.name] is already bandaged.") // CHOMPEdit - Balloon Alerts // CHOMPEdit - Balloon Alerts
					return 1

				if(used >= available)
					balloon_alert(user, "You run out of [src]!") // CHOMPEdit - Balloon Alerts
					break

				if (W.current_stage <= W.max_bleeding_stage)
					user.balloon_alert_visible("\The [user] cleans \a [W.desc] on [M]'s [affecting.name] and seals the edges with bioglue.", \
					                     "Cleaning and sealing \a [W.desc] on [M]'s [affecting.name]." ) // CHOMPEdit - Balloon Alerts
				else if (W.damage_type == BRUISE)
					user.balloon_alert_visible("\The [user] places a medical patch over \a [W.desc] on [M]'s [affecting.name].", \
					                              "Placed medical patch over \a [W.desc] on [M]'s [affecting.name]." ) // CHOMPEdit - Balloon Alerts
				else
					user.balloon_alert_visible("\The [user] smears some bioglue over \a [W.desc] on [M]'s [affecting.name].", \
					                              "Smeared bioglue over \a [W.desc] on [M]'s [affecting.name]." ) // CHOMPEdit - Balloon Alerts
				W.bandage()
				W.disinfect()
				W.heal_damage(heal_brute)
				playsound(src, pick(apply_sounds), 25)
				used = 1 //VOREStation Edit
				update_icon() // VOREStation Edit - Support for stack icons
			affecting.update_damages()
			if(used == amount)
				if(affecting.is_bandaged())
					balloon_alert(user, "\The [src] is used up.") // CHOMPEdit - Balloon Alerts
				else
					balloon_alert(user, "\The [src] is used up, but there are more wounds to treat on \the [affecting.name].") // CHOMPEdit - Balloon Alerts
			use(used)

/obj/item/stack/medical/advanced/ointment
	name = "advanced burn kit"
	singular_name = "advanced burn kit"
	desc = "An advanced treatment kit for severe burns."
	icon_state = "burnkit"
	heal_burn = 7 //VOREStation Edit
	origin_tech = list(TECH_BIO = 1)
	apply_sounds = list('sound/effects/ointment.ogg')

/obj/item/stack/medical/advanced/ointment/attack(mob/living/carbon/M as mob, mob/user as mob)
	if(..())
		return 1

	if (ishuman(M))
		var/mob/living/carbon/human/H = M
		var/obj/item/organ/external/affecting = H.get_organ(user.zone_sel.selecting)

		if(affecting.open)
			balloon_alert(user, "The [affecting.name] is cut open!") // CHOMPEdit - Balloon Alerts

		if(affecting.is_salved())
			balloon_alert(user, "[M]'s [affecting.name] has already been salved.") // CHOMPEdit - Balloon Alerts
			return 1
		else
			user.balloon_alert_visible("\The [user] starts salving wounds on [M]'s [affecting.name].", \
					             "Salving the wounds on [M]'s [affecting.name]." ) // CHOMPEdit - Balloon Alerts
			if(!do_mob(user, M, 10, exclusive = TRUE))
				balloon_alert(user, "Stand still to salve wounds.") // CHOMPEdit - Balloon Alerts
				return 1
			if(affecting.is_salved()) // We do a second check after the delay, in case it was bandaged after the first check.
				balloon_alert(user, "[M]'s [affecting.name] have already been salved.") // CHOMPEdit - Balloon Alerts
				return 1
			user.balloon_alert_visible("[user] covers wounds on [M]'s [affecting.name] with regenerative membrane.", \
									"Covered wounds on [M]'s [affecting.name] with regenerative membrane." ) // CHOMPEdit - Balloon Alerts
			affecting.heal_damage(0,heal_burn)
			use(1)
			affecting.salve()
			playsound(src, pick(apply_sounds), 25)
			update_icon() // VOREStation Edit - Support for stack icons

/obj/item/stack/medical/splint
	name = "medical splints"
	singular_name = "medical splint"
	desc = "Modular splints capable of supporting and immobilizing bones in all areas of the body."
	icon_state = "splint"
	amount = 5
	max_amount = 5
	drop_sound = 'sound/items/drop/hat.ogg'
	pickup_sound = 'sound/items/pickup/hat.ogg'

	var/list/splintable_organs = list(BP_HEAD, BP_L_HAND, BP_R_HAND, BP_L_ARM, BP_R_ARM, BP_L_FOOT, BP_R_FOOT, BP_L_LEG, BP_R_LEG, BP_GROIN, BP_TORSO)	//List of organs you can splint, natch.

/obj/item/stack/medical/splint/attack(mob/living/carbon/M as mob, mob/living/user as mob)
	if(..())
		return 1

	if (ishuman(M))
		var/mob/living/carbon/human/H = M
		var/obj/item/organ/external/affecting = H.get_organ(user.zone_sel.selecting)
		var/limb = affecting.name
		if(!(affecting.organ_tag in splintable_organs))
			balloon_alert(user, "You can't use \the [src] to apply a splint there!") // CHOMPEdit - Balloon Alerts
			return
		if(affecting.splinted)
			balloon_alert(user, "[M]'s [limb] is already splinted!") // CHOMPEdit - Balloon Alerts
			return
		if (M != user)
			user.balloon_alert_visible("[user] starts to apply \the [src] to [M]'s [limb].", "Applying \the [src] to [M]'s [limb].", "You hear something being wrapped.") // CHOMPEdit - Balloon Alerts
		else
			if(( !user.hand && (affecting.organ_tag in list(BP_R_ARM, BP_R_HAND)) || \
				user.hand && (affecting.organ_tag in list(BP_L_ARM, BP_L_HAND)) ))
				balloon_alert(user, "You can't apply a splint to the arm you're using!") // CHOMPEdit - Balloon Alerts
				return
			user.balloon_alert_visible("[user] starts to apply \the [src] to their [limb].", "Applying \the [src] to your [limb].", "You hear something being wrapped.") // CHOMPEdit - Balloon Alerts
		if(do_after(user, 50, M, exclusive = TASK_USER_EXCLUSIVE))
			if(affecting.splinted)
				balloon_alert(user, "[M]'s [limb] is already splinted!") // CHOMPEdit - Balloon Alerts
				return
			if(M == user && prob(75))
				user.balloon_alert_visible("\The [user] fumbles [src].", "Fumbling [src].", "You hear something being wrapped.") // CHOMPEdit - Balloon Alerts
				return
			if(ishuman(user))
				var/obj/item/stack/medical/splint/S = split(1)
				if(S)
					if(affecting.apply_splint(S))
						S.forceMove(affecting)
						if (M != user)
							user.balloon_alert_visible("\The [user] finishes applying [src] to [M]'s [limb].", "Finished applying \the [src] to [M]'s [limb].", "You hear something being wrapped.") // CHOMPEdit - Balloon Alerts
						else
							user.balloon_alert_visible("\The [user] successfully applies [src] to their [limb].", "Successfully applied \the [src] to your [limb].", "You hear something being wrapped.") // CHOMPEdit - Balloon Alerts
						return
					S.dropInto(src.loc) //didn't get applied, so just drop it
			if(isrobot(user))
				var/obj/item/stack/medical/splint/B = src
				if(B)
					if(affecting.apply_splint(B))
						B.forceMove(affecting)
						user.balloon_alert_visible("\The [user] finishes applying [src] to [M]'s [limb].", "Finish applying \the [src] to [M]'s [limb].", "You hear something being wrapped.") // CHOMPEdit - Balloon Alerts
						B.use(1)
						return
			user.balloon_alert_visible("\The [user] fails to apply [src].", "Failed to apply [src].", "You hear something being wrapped.") // CHOMPEdit - Balloon Alerts
		return


/obj/item/stack/medical/splint/ghetto
	name = "makeshift splints"
	singular_name = "makeshift splint"
	desc = "For holding your limbs in place with duct tape and scrap metal."
	icon_state = "tape-splint"
	amount = 1
	splintable_organs = list(BP_L_ARM, BP_R_ARM, BP_L_LEG, BP_R_LEG)
