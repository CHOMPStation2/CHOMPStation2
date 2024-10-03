/obj/item/stack/nanopaste
	name = "nanopaste"
	singular_name = "nanite swarm"
	desc = "A tube of paste containing swarms of repair nanites. Very effective in repairing robotic machinery."
	icon = 'icons/obj/stacks_vr.dmi' //VOREStation Edit
	icon_state = "nanopaste"
	origin_tech = list(TECH_MATERIAL = 4, TECH_ENGINEERING = 3)
	amount = 10
	toolspeed = 0.75 //Used in surgery, shouldn't be the same speed as a normal screwdriver on mechanical organ repair.
	w_class = ITEMSIZE_SMALL
	no_variants = FALSE

/obj/item/stack/nanopaste/attack(mob/living/M as mob, mob/user as mob)
	if (!istype(M) || !istype(user))
		return 0
	if (istype(M,/mob/living/silicon/robot))	//Repairing cyborgs
		var/mob/living/silicon/robot/R = M
		if (R.getBruteLoss() || R.getFireLoss())
			if(do_after(user, 7 * toolspeed, R, exclusive = TASK_ALL_EXCLUSIVE))
				R.adjustBruteLoss(-15)
				R.adjustFireLoss(-15)
				R.updatehealth()
				use(1)
<<<<<<< HEAD
				user.balloon_alert_visible("\The [user] applied some [src] on [R]'s damaged areas.",\
				"You apply some [src] at [R]'s damaged areas.") // CHOMPEdit - Balloon Alerts
		else
			balloon_alert(user, "All [R]'s systems are nominal.") // CHOMPEdit - Balloon Alerts
=======
				user.visible_message(span_notice("\The [user] applied some [src] on [R]'s damaged areas."),\
				span_notice("You apply some [src] at [R]'s damaged areas."))
		else
			to_chat(user, span_notice("All [R]'s systems are nominal."))
>>>>>>> 7b5dfe54be... Merge pull request #16413 from Kashargul/span_rework

	if (istype(M,/mob/living/carbon/human))		//Repairing robolimbs
		var/mob/living/carbon/human/H = M
		var/obj/item/organ/external/S = H.get_organ(user.zone_sel.selecting)
		if(!S)
<<<<<<< HEAD
			balloon_alert(user, "No body part there to work on!") // CHOMPEdit - Balloon Alerts
=======
			to_chat(user, span_warning("No body part there to work on!"))
>>>>>>> 7b5dfe54be... Merge pull request #16413 from Kashargul/span_rework
			return 1

		if(S.organ_tag == BP_HEAD)
			if(H.head && istype(H.head,/obj/item/clothing/head/helmet/space))
<<<<<<< HEAD
				balloon_alert(user, "You can't apply [src] through [H.head]!") // CHOMPEdit - Balloon Alerts
				return 1
		else
			if(H.wear_suit && istype(H.wear_suit,/obj/item/clothing/suit/space))
				balloon_alert(user, "You can't apply [src] through [H.wear_suit]!") // CHOMPEdit - Balloon Alerts
=======
				to_chat(user, span_warning("You can't apply [src] through [H.head]!"))
				return 1
		else
			if(H.wear_suit && istype(H.wear_suit,/obj/item/clothing/suit/space))
				to_chat(user, span_warning("You can't apply [src] through [H.wear_suit]!"))
>>>>>>> 7b5dfe54be... Merge pull request #16413 from Kashargul/span_rework
				return 1

		//VOREStation Edit Start
		if (S && (S.robotic >= ORGAN_ROBOT))
			if(!S.get_damage())
<<<<<<< HEAD
				balloon_alert(user, "Nothing to fix here.") // CHOMPEdit - Balloon Alerts
			else if((S.open < 2) && (S.brute_dam + S.burn_dam >= S.min_broken_damage) && !repair_external)
				balloon_alert(user, "The damage is too extensive for this nanite swarm to handle.") // CHOMPEdit - Balloon Alerts
=======
				to_chat(user, span_notice("Nothing to fix here."))
			else if((S.open < 2) && (S.brute_dam + S.burn_dam >= S.min_broken_damage) && !repair_external)
				to_chat(user, span_notice("The damage is too extensive for this nanite swarm to handle."))
>>>>>>> 7b5dfe54be... Merge pull request #16413 from Kashargul/span_rework
			else if(can_use(1))
				user.setClickCooldown(user.get_attack_speed(src))
				if(S.open >= 2)
					if(do_after(user, 5 * toolspeed, S, exclusive = TASK_ALL_EXCLUSIVE))
						S.heal_damage(restoration_internal, restoration_internal, robo_repair = 1)
				else if(do_after(user, 5 * toolspeed, S, exclusive = TASK_ALL_EXCLUSIVE))
					S.heal_damage(restoration_external,restoration_external, robo_repair =1)
				H.updatehealth()
				use(1)
<<<<<<< HEAD
				user.balloon_alert_visible("\The [user] applies some nanite paste on [user != M ? "[M]'s [S.name]" : "[S]"] with [src].",\
				"You apply some nanite paste on [user == M ? "your" : "[M]'s"] [S.name].") // CHOMPEdit - Balloon Alerts
=======
				user.visible_message(span_notice("\The [user] applies some nanite paste on [user != M ? "[M]'s [S.name]" : "[S]"] with [src]."),\
				span_notice("You apply some nanite paste on [user == M ? "your" : "[M]'s"] [S.name]."))
>>>>>>> 7b5dfe54be... Merge pull request #16413 from Kashargul/span_rework
		//VOREStation Edit End
