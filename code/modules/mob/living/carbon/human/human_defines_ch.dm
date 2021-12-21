/mob/living/carbon/human
	var/gender_change_cooldown = 0 // A cooldown for gender and gender indentify changing procs to make it easy to avoid spam of gender change
	var/loneliness_stage = 0
	var/next_loneliness_time = 0
	var/digitigrade = 0 // 0 = no digi, 1 = default, 2+ = digi styles... (Not used yet)
