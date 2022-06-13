/client/verb/toggle_random_emote_pitch()
	set name = "Toggle Random Emote Pitch"
	set category = "Preferences"
	set desc = "Toggles whether or not emotes with sound you make will have random pitch."

	var/pref_path = /datum/client_preference/random_emote_pitch

	toggle_preference(pref_path)

	to_chat(src, "Audible emotes you make will [ (is_preference_enabled(pref_path)) ? "now" : "no longer"] have a random pitch applied to them.")

	SScharacter_setup.queue_preferences_save(prefs)

	feedback_add_details("admin_verb","TRandomEmotePitch") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!
