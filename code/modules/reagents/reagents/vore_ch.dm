//Vore/kink reagents go here.

/datum/reagent/aphrodisiac
	name = REAGENT_APHRODISIAC
	id = REAGENT_ID_APHRODISIAC
	description = "You so horny."
	taste_description = "sweetness"
	reagent_state = LIQUID
	color = "#FF9999"
	scannable = 1

/datum/reagent/aphrodisiac/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	if(!M)	return

	if(prob(3))
		M.emote(pick("blush", "moan", "moan", "giggle"))

/datum/reagent/sorbitol
	name = REAGENT_SORBITOL
	id = REAGENT_ID_SORBITOL
	description = "A frothy green liquid, for causing cellular-level hetrogenous structure merging."
	reagent_state = LIQUID
	color = "#10881A"
	overdose = REAGENTS_OVERDOSE

/datum/reagent/sorbitol/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	M.make_dizzy(1)

	for(var/obj/belly/B as anything in M.vore_organs)

		if(B.digest_mode == DM_UNABSORB) //Don't affect bellies set to unabsorb
			continue

		for(var/mob/living/P in B)
			if(P.absorbed || !P.absorbable)
				continue

			else if(prob(10))
				B.absorb_living(P)
				//absorption reagent production
				if(B.show_liquids && B.reagent_mode_flags & DM_FLAG_REAGENTSABSORB && B.reagents.total_volume < B.reagents.maximum_volume)
					B.GenerateBellyReagents_absorbed()

/datum/reagent/radium/concentrated
	name = REAGENT_CONCENTRATEDRADIUM
	id = REAGENT_ID_CONCENTRATEDRADIUM
	description = "Concentrated Radium is a more potent variant of regular radium, able to pierce and irradiate a subject through their skin."
	taste_mult = 0	//Apparently radium is tasteless
	reagent_state = SOLID
	color = "#C7C7C7"

/datum/reagent/radium/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	if(issmall(M)) removed *= 2
	M.apply_effect(10 * removed, IRRADIATE, 0) // Radium may increase your chances to cure a disease

/datum/reagent/radium/affect_touch(var/mob/living/carbon/M, var/alien, var/removed)
	if(issmall(M)) removed *= 2
	M.apply_effect(10 * removed, IRRADIATE, 0) // Radium may increase your chances to cure a disease
