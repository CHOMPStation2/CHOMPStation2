/mob/living/carbon/human/verb/hide_nutrition()
	set name = "Show/Hide Nutrition Levels"
	set category = "IC.Settings"
	set desc = "Allow other player to see your current nutrition level or not."
	nutrition_hidden = !nutrition_hidden
	to_chat(src, "Players will [nutrition_hidden ? "no longer" : "now"] see your nutrition levels.")

/mob/living/carbon/human/proc/toggle_speech_sounds()
	set name = "Toggle Species Speech Sounds"
	set desc = "Toggle if your species defined speech sound has a chance of playing on a Say"
	set category = "IC.Settings"

	if(stat)
		to_chat(src, span_warning("You must be awake and standing to perform this action!"))
		return

	speech_sound_enabled = !speech_sound_enabled
	to_chat(src, "You will [speech_sound_enabled ? "now" : "no longer"] have a chance to play your species defined speech sound on a Say.")

	return TRUE
