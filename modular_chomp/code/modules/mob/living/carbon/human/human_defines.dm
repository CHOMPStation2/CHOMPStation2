/mob/living/carbon/human
	var/gender_change_cooldown = 0 // A cooldown for gender and gender indentify changing procs to make it easy to avoid spam of gender change
	var/loneliness_stage = 0
	var/next_loneliness_time = 0
	vore_capacity = 3
	vore_capacity_ex = list("stomach" = 3, "taur belly" = 3)
	vore_fullness_ex = list("stomach" = 0, "taur belly" = 0)
	vore_icon_bellies = list("stomach", "taur belly")
	var/struggle_anim_stomach = FALSE
	var/struggle_anim_taur = FALSE
	var/hide_headset = FALSE
	var/hide_glasses = FALSE
	var/speech_sound_enabled = TRUE
	var/nutrition_hidden = FALSE

/mob/living/carbon/human/ai_controlled
	low_priority = TRUE
