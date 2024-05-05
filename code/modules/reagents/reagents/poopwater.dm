/datum/reagent/poopwater
	name = "Poop water"
	id = "poopwater"
	description = "Poop mixed with water"
	taste_description = "Poop with a little bit of water"
	taste_mult = 20 //Poop

	reagent_state = LIQUID

	color = "#806b3f"
	color_weight = 2

	glass_icon_file = 'modular_chomp/icons/obj/poopwater.dmi'
	glass_icon_state = "poopwater"
	glass_name = "Poop water"
	glass_desc = "My famous poop water"
	var/strength = 5

/datum/reagent/poopwater/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	if(alien == IS_DIONA) //Plant goodmeal
		var/chem_effective = strength * M.species.chem_strength_heal
		M.adjustOxyLoss(-3 * removed * chem_effective) //Stolen from tricord. This means they get a chem that actually works on them. Imagine if this actually gets merged and changes explo balance lmao.
		M.heal_organ_damage(1.5 * removed, 1.5 * removed * chem_effective)
		M.adjustToxLoss(-1.5 * removed * chem_effective)
		return

	strength *= M.species.chem_strength_tox
	if(strength)
		if(issmall(M)) strength *= 2 // Small bodymass, more effect from lower volume.

		M.adjustToxLoss(strength * removed)
		if(prob(50 + (strength * 2)))
			M.vomit()

/datum/reagent/toxin/poop //Essential ingredient of poopwater
	name = "Poop"
	id = "poop"
	taste_description = "Poop"
	taste_mult = 50 //Higher than poopwater

	reagent_state = SOLID //Log

	color = "#4b3411"
	color_weight = 5

/datum/reagent/toxin/poop/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	if(alien == IS_DIONA) //Plant creature likes poop yum
		var/chem_effective = 1 * M.species.chem_strength_heal
		M.adjustOxyLoss(-3 * removed * chem_effective) //Stolen from tricord. This means they get a chem that actually works on them. Imagine if this actually gets merged and changes explo balance lmao.
		M.heal_organ_damage(1.5, 1.5 * removed * chem_effective)
		M.adjustToxLoss(-1.5 * chem_effective)
		return

	strength *= M.species.chem_strength_tox
	if(strength)
		if(issmall(M)) removed *= 2 // Small bodymass, more effect from lower volume.
		if(alien == IS_SLIME)
			removed *= 0.25 // Results in half the standard tox as normal. Prometheans are 'Small' for flaps.
			if(dose >= 10)
				M.adjust_nutrition(strength * removed) // Body has to deal with the massive influx of toxins, rather than try using them to repair.
			else
				M.heal_organ_damage((10/strength) * removed, (10/strength) * removed) //Doses of toxins below 10 units, and 10 strength, are capable of providing useful compounds for repair.
		M.adjustToxLoss(strength * removed)
