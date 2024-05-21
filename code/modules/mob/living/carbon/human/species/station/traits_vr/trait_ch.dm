/datum/trait
	var/special_env = FALSE

/datum/trait/proc/handle_environment_special(var/mob/living/carbon/human/H)
	return

/datum/trait/apply(var/datum/species/S,var/mob/living/carbon/human/H)
	. = ..()
	if(special_env)
		S.env_traits += src

/datum/trait/remove(var/datum/species/S)
	. = ..()
	if(special_env)
		S.env_traits -= src
