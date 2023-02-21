/datum/preferences
	var/digitigrade = 0 // 0 = no digi, 1 = default, 2+ = digi styles... (Not used yet)

	var/job_other_low = 0
	var/job_other_med = 0
	var/job_other_high = 0

/client/verb/toggle_random_emote_pitch()
	set name = "Toggle Random Emote Pitch"
	set category = "Preferences"
	set desc = "Toggles whether or not emotes with sound you make will have random pitch."

	var/pref_path = /datum/client_preference/random_emote_pitch

	toggle_preference(pref_path)

	to_chat(src, "Audible emotes you make will [ (is_preference_enabled(pref_path)) ? "now" : "no longer"] have a random pitch applied to them.")

	SScharacter_setup.queue_preferences_save(prefs)

	feedback_add_details("admin_verb","TRandomEmotePitch") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/client/verb/toggle_autotranscore()
	set name = "Toggle Automatic Transcore Notification"
	set category = "Preferences"
	set desc = "Toggles whether or not your death with a backup implant will automatically trigger a transcore notification after a few minutes."

	var/pref_path = /datum/client_preference/autotranscore

	toggle_preference(pref_path)

	to_chat(src, "Your death with a backup implant will [ (is_preference_enabled(pref_path)) ? "now" : "no longer"] trigger an automatic transcore notification.")

	SScharacter_setup.queue_preferences_save(prefs)

	feedback_add_details("admin_verb","TAutoTranscore") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!
