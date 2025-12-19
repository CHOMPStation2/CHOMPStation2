
/datum/trait/negative/breathes
	custom_only = FALSE
	banned_species = list(SPECIES_VOX)

/datum/trait/negative/schizophrenia
	can_take = ORGANICS|SYNTHETICS //synths can't medicate for this, but it stands to reason a lifelike synth could experience hallucination-like bugs

//edits below open certain traits to custom species, based on whether a human(which is not custom) could have that trait
/datum/trait/negative/less_blood
	custom_only = FALSE
	banned_species = list(SPECIES_PROMETHEAN, SPECIES_SHADEKIN)

/datum/trait/negative/less_blood_extreme
	custom_only = FALSE
	banned_species = list(SPECIES_PROMETHEAN, SPECIES_SHADEKIN)

/datum/trait/negative/low_blood_sugar
	custom_only = FALSE

/datum/trait/negative/agoraphobia
	custom_only = FALSE

/datum/trait/negative/lonely
	custom_only = FALSE

/datum/trait/negative/endurance_glass
	custom_only = FALSE

/datum/trait/negative/light_sensitivity
	custom_only = FALSE
	banned_species = (SPECIES_ZADDAT)

/datum/trait/negative/haemophilia_plus
	custom_only = FALSE
	banned_species = list(SPECIES_PROMETHEAN, SPECIES_SHADEKIN)

/datum/trait/negative/pain_intolerance_basic
	custom_only = FALSE
	can_take = ORGANICS
	banned_species = list(SPECIES_PROTEAN, SPECIES_DIONA)

/datum/trait/negative/pain_intolerance_advanced
	custom_only = FALSE
	can_take = ORGANICS
	banned_species = list(SPECIES_PROTEAN, SPECIES_DIONA)

/datum/trait/negative/scrawny
	custom_only = FALSE
