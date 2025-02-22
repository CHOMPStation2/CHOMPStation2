/mob/living/carbon/human
	var/gender_change_cooldown = 0 // A cooldown for gender and gender indentify changing procs to make it easy to avoid spam of gender change
	var/hide_headset = FALSE
	var/hide_glasses = FALSE
	var/speech_sound_enabled = TRUE
	var/nutrition_hidden = FALSE

/mob/living/carbon/human/ai_controlled
	low_priority = TRUE
