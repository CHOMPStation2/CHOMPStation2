/datum/trait/linguist
	name = "Master Linguist"
	desc = "You are a master of languages! For whatever reason you might have, you are able to learn many more languages than others."
	cost = 2
	var_changes = list("num_alternate_languages" = 12)

/datum/trait/densebones
	name = "Dense bones"
	desc = "Your bones are more dense then what is considered normal. It is much harder to fracture your bones, yet pain from fractures is much more intense."
	cost = 2

/datum/trait/densebones/apply(var/datum/species/S,var/mob/living/carbon/human/H)
	..(S,H)
	for(var/obj/item/organ/external/organ in H.organs)
		if(istype(organ))
			organ.min_broken_damage *= 1.5
			organ.brokenpain *= 2

/datum/trait/lowpressureres
	name = "Low Pressure Resistance"
	desc = "Your body is more resistant to low pressures. Pretty simple."
	cost = 3
	var_changes = list("hazard_low_pressure" = HAZARD_LOW_PRESSURE*0.66, "warning_low_pressure" = WARNING_LOW_PRESSURE*0.66, "minimum_breath_pressure" = 16*0.66)

/datum/trait/highpressureres
	name = "High Pressure Resistance"
	desc = "Your body is more resistant to high pressures. Pretty simple."
	cost = 3
	var_changes = list("hazard_high_pressure" = HAZARD_HIGH_PRESSURE*1.5, "warning_high_pressure" = WARNING_HIGH_PRESSURE*1.5)

/datum/trait/photosynth
	name = "Photosynthesis"
	desc = "Your body is able to produce nutrition from being in light."
	cost = 3
	var_changes = list("photosynthesizing" = TRUE)