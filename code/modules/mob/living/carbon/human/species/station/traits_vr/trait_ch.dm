/datum/trait
	custom_only = FALSE
	var/special_env = FALSE
	var/trait_flags = NO_TRAIT_FLAGS
	var/species_flags = 0

/datum/trait/proc/handle_environment_special(var/mob/living/carbon/human/H)
	return

/datum/trait/apply(var/datum/species/S,var/mob/living/carbon/human/H)
	ASSERT(S)
	S.flags = S.flags | species_flags
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

/datum/trait/proc/can_take_trait(var/species)
	if(custom_only && (species != SPECIES_CUSTOM))
		return FALSE
	if(species in banned_species)
		return FALSE
	if(LAZYLEN(allowed_species) && !(species in allowed_species))
		return FALSE
	var/datum/species/S = GLOB.all_species[species]
	if(S.disallowed_traits & trait_flags)
		return FALSE
	return TRUE