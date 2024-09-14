/datum/trait/neutral/hardfeet
	custom_only = FALSE

/datum/trait/positive/linguist
	custom_only = FALSE

/datum/trait/positive/toxin_gut
	custom_only = FALSE

/datum/trait/positive/light_breather
	name ="Light Breather"
	desc = "You need less air for your lungs to properly work.."
	cost = 1

	custom_only = FALSE
	can_take = ORGANICS
	var_changes = list("minimum_breath_pressure" = 12)
	excludes = list(/datum/trait/negative/deep_breather)


/datum/trait/positive/virus_immune
	name = "Virus Immune"
	desc = "You are immune to viruses."
	cost = 1

	can_take = ORGANICS //no reason to clog up synth selection
	var_changes = list("virus_immune" = 1)

/datum/trait/positive/emp_resist
	name = "EMP Resistance"
	desc = "You are resistant to EMPs"
	cost = 3

	can_take = SYNTHETICS
	custom_only = FALSE
	var_changes = list("emp_dmg_mod" = 0.7)
	excludes = list(/datum/trait/negative/faultwires, /datum/trait/negative/poorconstruction, /datum/trait/positive/emp_resist_major)

/datum/trait/positive/emp_resist/apply(var/datum/species/S,var/mob/living/carbon/human/H)
	..()
	H.add_modifier(/datum/modifier/trait/empresist)

/datum/trait/positive/emp_resist_major
	name = "Major EMP Resistance"
	desc = "You are very resistant to EMPs"
	cost = 5

	can_take = SYNTHETICS
	custom_only = FALSE
	var_changes = list("emp_dmg_mod" = 0.5)
	excludes = list(/datum/trait/negative/faultwires, /datum/trait/negative/poorconstruction, /datum/trait/positive/emp_resist)

/datum/trait/positive/emp_resist_major/apply(var/datum/species/S,var/mob/living/carbon/human/H)
	..()
	H.add_modifier(/datum/modifier/trait/empresistb)

/datum/trait/positive/weaver
	allowed_species = null
	custom_only = FALSE //Let species use the webs for wierd stuff like metal webs, slime creations, etc.
