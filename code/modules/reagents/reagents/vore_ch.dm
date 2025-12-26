//Vore/kink reagents go here.
/datum/reagent/sorbitol
	name = REAGENT_SORBITOL
	id = REAGENT_ID_SORBITOL
	description = "A frothy green liquid, for causing cellular-level hetrogenous structure merging."
	reagent_state = LIQUID
	color = "#10881A"
	scannable = SCANNABLE_BENEFICIAL
	overdose = REAGENTS_OVERDOSE
	supply_conversion_value = REFINERYEXPORT_VALUE_RARE
	industrial_use = REFINERYEXPORT_REASON_ILLDRUG

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
