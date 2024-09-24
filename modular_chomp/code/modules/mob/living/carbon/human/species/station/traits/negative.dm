/datum/trait/negative/deep_sleeper
	custom_only = FALSE

/datum/trait/negative/deep_breather
	name ="Deep Breather"
	desc = "You need more air for your lungs to properly work.."
	cost = -1

	custom_only = FALSE
	can_take = ORGANICS

	var_changes = list("minimum_breath_pressure" = 18)
	excludes = list(/datum/trait/positive/light_breather)

/datum/trait/negative/thick_digits
	name = "Thick Digits"
	desc = "Your hands are not shaped in a way that allows useage of guns."
	cost = -4
	custom_only = FALSE

/datum/trait/negative/thick_digits/apply(var/datum/species/S,var/mob/living/carbon/human/H)
	..()
	H.add_modifier(/datum/modifier/trait/thickdigits)

/datum/trait/negative/faultwires
	name = "Faulty Wires"
	desc = "Due to poor construction, you have an unfortante weakness to EMPs."
	cost = -3
	custom_only = FALSE
	can_take = SYNTHETICS
	var_changes = list("emp_dmg_mod" = 1.3)
	excludes = list(/datum/trait/negative/poorconstruction, /datum/trait/positive/emp_resist, /datum/trait/positive/emp_resist_major)

/datum/trait/negative/faultwires/apply(var/datum/species/S,var/mob/living/carbon/human/H)
	..()
	H.add_modifier(/datum/modifier/trait/empweakness)

/datum/trait/negative/poorconstruction
	name = "Poor Construction"
	desc = "Due to poor construction, you have an hefty weakness to EMPs."
	cost = -5
	custom_only = FALSE
	can_take = SYNTHETICS
	var_changes = list("emp_dmg_mod" = 1.6)
	excludes = list(/datum/trait/negative/faultwires, /datum/trait/positive/emp_resist, /datum/trait/positive/emp_resist_major)

/datum/trait/negative/poorconstruction/apply(var/datum/species/S,var/mob/living/carbon/human/H)
	..()
	H.add_modifier(/datum/modifier/trait/majorempweakness)

/datum/trait/negative/nodefib
	name = "Unreviveable"
	desc = "For whatever strange genetic reason, defibs cannot restart your heart."
	cost = 0
	custom_only = FALSE
	var_changes = list("flags" = NO_DEFIB)
	can_take = ORGANICS //Mostly because I think synth code bypasses the no defib thing. Or maybe that is just vox
	excludes = list(/datum/trait/negative/noresleeve) //No, just, no

/datum/trait/negative/noresleeve
	name = "Unsleeveable"
	desc = "Your genetics have been ruined, to the point where resleeving can no longer bring you back, including the autoresleever."
	cost = -1
	custom_only = TRUE
	var_changes = list("flags" = NO_SCAN)
	excludes = list(/datum/trait/negative/nodefib) //No, just, no

/datum/trait/negative/meltable
	name = "Water Weakness"
	desc = "Due to your biology, water is harmful to you."
	cost = -1
	custom_only = TRUE
	var_changes = list("water_resistance" = 0, "water_damage_mod" = 0.3)
	excludes = list(/datum/trait/negative/meltable_major)

/datum/trait/negative/meltable_major
	name = "Extreme Water Weakness"
	desc = "Due to your biology, water is very harmful to you."
	cost = -3
	custom_only = TRUE
	var_changes = list("water_resistance" = 0, "water_damage_mod" = 0.8)
	excludes = list(/datum/trait/negative/meltable)

/datum/trait/negative/onelife
	name = "One Life"
	desc = "For whatever reason, once you dead, that is final."
	cost = -2
	custom_only = TRUE
	var_changes = list("flags" = NO_SCAN | NO_DEFIB)
	excludes = list(/datum/trait/negative/nodefib, /datum/trait/negative/noresleeve)

/datum/trait/negative/lightweight_light
	name = "Lesser Lightweight"
	desc = "Your light weight and poor balance make you very susceptible to unhelpful bumping if you are unprepared)"
	cost = -1
	var_changes = list("lightweight_light" = 1)
	excludes = list(/datum/trait/negative/lightweight)
	custom_only = FALSE
