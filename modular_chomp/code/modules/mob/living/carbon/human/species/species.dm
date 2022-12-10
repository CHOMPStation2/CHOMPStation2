/datum/species
	var/crit_mod = 1
	var/vore_belly_default_variant = "H"

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