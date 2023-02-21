/datum/species/vox
	icobase = 'icons/mob/human_races/r_vox_ch.dmi'
	tail = "voxtail"
	tail_animation = 'icons/mob/species/vox/tail.dmi'
	speech_chance = 50 // As long as we're making the option to disable it, might as well bump up the chances when it is enabled
	inherent_verbs = list(
		/mob/living/carbon/human/proc/toggle_speech_sounds
	)
