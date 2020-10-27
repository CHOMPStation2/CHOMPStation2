/datum/species
	var/list/env_traits = list()
	var/dirtslip = FALSE
	var/photosynthesizing = FALSE
	var/grows = FALSE

/datum/species/handle_environment_special(var/mob/living/carbon/human/H)
	for(var/datum/trait/env_trait in env_traits)
		env_trait.handle_environment_special(H)
	return