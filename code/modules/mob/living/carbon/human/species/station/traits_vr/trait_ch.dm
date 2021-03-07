/datum/trait
	var/special_env = FALSE
	var/list/allowed_species		// A list of species that CAN take this trait, use this if only 1 species can use it. -shark

/datum/trait/proc/handle_environment_special(var/mob/living/carbon/human/H)
	return

/datum/trait/apply(var/datum/species/S,var/mob/living/carbon/human/H)
	ASSERT(S)
	if(var_changes)
		for(var/V in var_changes)
			S.vars[V] = var_changes[V]
	if(special_env)
		S.env_traits += src
	return
/datum/trait/remove(var/datum/species/S)
	ASSERT(S)
	if(special_env)
		S.env_traits -= src
	return