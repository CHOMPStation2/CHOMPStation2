/mob/living/carbon/human/handle_mutations_and_radiation()
	if(inStasisNow())
		return

	if(getFireLoss())
		if((COLD_RESISTANCE in mutations) || (prob(1)))
			heal_organ_damage(0,1)

	// DNA2 - Gene processing.
	// The HULK stuff that was here is now in the hulk gene.
	if(!isSynthetic())
		for(var/datum/dna/gene/gene in dna_genes)
			if(!gene.block)
				continue
			if(gene.is_active(src))
				gene.OnMobLife(src)

	radiation = CLAMP(radiation,0,250)

	if(!radiation)
		if(species.appearance_flags & RADIATION_GLOWS)
			set_light(0)
	else
		if(species.appearance_flags & RADIATION_GLOWS)
			set_light(max(1,min(5,radiation/15)), max(1,min(10,radiation/25)), species.get_flesh_colour(src))
		// END DOGSHIT SNOWFLAKE

		var/obj/item/organ/internal/diona/nutrients/rad_organ = locate() in internal_organs
		if(rad_organ && !rad_organ.is_broken())
			var/rads = radiation/25
			radiation -= rads
			adjust_nutrition(rads)
			adjustBruteLoss(-(rads))
			adjustFireLoss(-(rads))
			adjustOxyLoss(-(rads))
			adjustToxLoss(-(rads))
			updatehealth()
			return

		var/obj/item/organ/internal/brain/slime/core = locate() in internal_organs
		if(core)
			return

		//VOREStation Addition start: shadekin
		var/obj/item/organ/internal/brain/shadekin/s_brain = locate() in internal_organs
		if(s_brain)
			return
		//VOREStation Addition end: shadekin
		var/rad_mult = RADIATION_SPEED_COEFFICIENT * species.rad_removal_mod
		var/damage = 0
		radiation -= 1 * rad_mult
		if(radiation > species.rad_levels["safe"] && prob(25)) // Safe for a little over 2m at the recommended maximum safe dosage of 0.05Bq
			damage = 1

		if (radiation > species.rad_levels["danger_1"])
			damage = 1
			radiation -= 1 * rad_mult
			if(!isSynthetic())
				if(prob(5) && prob(100 * RADIATION_SPEED_COEFFICIENT))
					radiation -= 5 * rad_mult
					to_chat(src, span_warning("You feel weak."))
					Weaken(3)
					if(!lying)
						emote("collapse")
				if(prob(5) && prob(100 * RADIATION_SPEED_COEFFICIENT) && species.get_bodytype() == SPECIES_HUMAN) //apes go bald
					if((h_style != "Bald" || f_style != "Shaved" ))
						to_chat(src, span_warning("Your hair falls out."))
						h_style = "Bald"
						f_style = "Shaved"
						update_hair()

		if (radiation > species.rad_levels["danger_2"])
			damage = 3
			radiation -= 1 * rad_mult
			if(!isSynthetic())
				if(prob(5))
					take_overall_damage(0, 5 * RADIATION_SPEED_COEFFICIENT, used_weapon = "Radiation Burns")
				if(prob(1))
					to_chat(src, span_warning("You feel strange!"))
					adjustCloneLoss(5 * RADIATION_SPEED_COEFFICIENT)
					emote("gasp")

		if (radiation > species.rad_levels["danger_3"])
			damage = 6
			radiation -= 4 * rad_mult

		if(damage)
			damage *= species.radiation_mod
			adjustToxLoss(damage * RADIATION_SPEED_COEFFICIENT)
			updatehealth()
			if(!isSynthetic() && organs.len)
				var/obj/item/organ/external/O = pick(organs)
				if(istype(O)) O.add_autopsy_data("Radiation Poisoning", damage)
