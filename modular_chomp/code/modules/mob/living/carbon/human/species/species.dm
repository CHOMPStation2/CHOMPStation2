/datum/species
	var/crit_mod = 1
	var/vore_belly_default_variant = "H"
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
	var/icodigi = 'modular_chomp/icons/mob/human_races/r_digi.dmi'
	var/digi_allowed = FALSE
	var/vanity_base_fit //when shapeshifting using vanity_copy_to, this allows you to have add something so they can go back to their original species fit

	male_scream_sound = list('modular_chomp/sound/voice/scream/generic/male/male_scream_1.ogg', 'modular_chomp/sound/voice/scream/generic/male/male_scream_2.ogg', 'modular_chomp/sound/voice/scream/generic/male/male_scream_3.ogg', 'modular_chomp/sound/voice/scream/generic/male/male_scream_4.ogg', 'modular_chomp/sound/voice/scream/generic/male/male_scream_5.ogg', 'modular_chomp/sound/voice/scream/generic/male/male_scream_6.ogg')
	female_scream_sound = list('modular_chomp/sound/voice/scream/generic/female/female_scream_1.ogg', 'modular_chomp/sound/voice/scream/generic/female/female_scream_2.ogg', 'modular_chomp/sound/voice/scream/generic/female/female_scream_3.ogg', 'modular_chomp/sound/voice/scream/generic/female/female_scream_4.ogg', 'modular_chomp/sound/voice/scream/generic/female/female_scream_5.ogg')
	var/male_gasp_sound = list('modular_chomp/sound/voice/gasp/generic/male/male_gasp1.ogg', 'modular_chomp/sound/voice/gasp/generic/male/male_gasp2.ogg', 'modular_chomp/sound/voice/gasp/generic/male/male_gasp3.ogg')
	var/female_gasp_sound = list('modular_chomp/sound/voice/gasp/generic/female/female_gasp1.ogg', 'modular_chomp/sound/voice/gasp/generic/female/female_gasp2.ogg')
	var/male_pain_sound = list('modular_chomp/sound/voice/pain/generic/male/male_pain_1.ogg', 'modular_chomp/sound/voice/pain/generic/male/male_pain_2.ogg', 'modular_chomp/sound/voice/pain/generic/male/male_pain_3.ogg', 'modular_chomp/sound/voice/pain/generic/male/male_pain_4.ogg', 'modular_chomp/sound/voice/pain/generic/male/male_pain_5.ogg', 'modular_chomp/sound/voice/pain/generic/male/male_pain_6.ogg', 'modular_chomp/sound/voice/pain/generic/male/male_pain_7.ogg', 'modular_chomp/sound/voice/pain/generic/male/male_pain_8.ogg')
	var/female_pain_sound = list('modular_chomp/sound/voice/pain/generic/female/female_pain_1.ogg', 'modular_chomp/sound/voice/pain/generic/female/female_pain_2.ogg', 'modular_chomp/sound/voice/pain/generic/female/female_pain_3.ogg')
	var/male_death_sound = list('modular_chomp/sound/voice/death/generic/male/male_death_1.ogg', 'modular_chomp/sound/voice/death/generic/male/male_death_2.ogg', 'modular_chomp/sound/voice/death/generic/male/male_death_3.ogg', 'modular_chomp/sound/voice/death/generic/male/male_death_4.ogg', 'modular_chomp/sound/voice/death/generic/male/male_death_5.ogg', 'modular_chomp/sound/voice/death/generic/male/male_death_6.ogg', 'modular_chomp/sound/voice/death/generic/male/male_death_7.ogg')
	var/female_death_sound = list('modular_chomp/sound/voice/death/generic/female/female_death_1.ogg', 'modular_chomp/sound/voice/death/generic/female/female_death_2.ogg', 'modular_chomp/sound/voice/death/generic/female/female_death_3.ogg', 'modular_chomp/sound/voice/death/generic/female/female_death_4.ogg', 'modular_chomp/sound/voice/death/generic/female/female_death_5.ogg', 'modular_chomp/sound/voice/death/generic/female/female_death_6.ogg')

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
