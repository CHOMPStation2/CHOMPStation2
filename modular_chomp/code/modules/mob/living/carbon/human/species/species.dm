/datum/species
	var/crit_mod = 1
	var/list/env_traits = list()
	var/dirtslip = FALSE
	var/photosynthesizing = FALSE
	var/grows = FALSE
	var/shrinks = FALSE
	var/rad_levels = list("safe" = 2.5, "danger_1" = 50, "danger_2" = 75, "danger_3" = 150)
	var/rad_removal_mod = 1
	var/bite_mod = 1
	var/grab_resist_divisor_victims = 1
	var/grab_resist_divisor_self = 1
	var/grab_power_victims = 0
	var/grab_power_self = 0
	var/waking_speed = 1
	var/mudking = FALSE
	var/vanity_base_fit //when shapeshifting using vanity_copy_to, this allows you to have add something so they can go back to their original species fit
	var/lightweight_light = 0

// Handles non-standard eyes when using a species that utilizes a custom base icon set.
// Eye data is stored in the head organ, and this needs to be handled specially.
/datum/species/proc/handle_base_eyes(var/mob/living/carbon/human/H, var/custom_base)
	if(selects_bodytype && custom_base) // only bother if our src species datum allows bases and one is assigned
		var/datum/species/S = GLOB.all_species[custom_base]

		//extract default eye data from species datum
		var/baseHeadPath = S.has_limbs[BP_HEAD]["path"] //has_limbs is a list of lists

		if(!baseHeadPath)
			return // exit if we couldn't find a head path from the base.

		var/obj/item/organ/external/head/baseHead = new baseHeadPath()
		if(!baseHead)
			return // exit if we didn't create the base properly

		var/obj/item/organ/external/head/targetHead = H.get_organ(BP_HEAD)
		if(!targetHead)
			return // don't bother if target mob has no head for whatever reason

		targetHead.eye_icon = baseHead.eye_icon
		targetHead.eye_icon_location = baseHead.eye_icon_location

		if(!QDELETED(baseHead) && baseHead)
			qdel(baseHead)
	return

/datum/species/handle_environment_special(var/mob/living/carbon/human/H)
	for(var/datum/trait/env_trait in env_traits)
		env_trait.handle_environment_special(H)
	return
