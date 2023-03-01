/client/verb/toggle_looping_alarms()
	set name = "Looping Alarms"
	set category = "Preferences"
	set desc = "Toggles alarm sound loops."

	var/pref_path = /datum/client_preference/looping_alarms

	toggle_preference(pref_path)

	to_chat(src, "You will [ (is_preference_enabled(pref_path)) ? "now" : "no longer"] hear alarm sounds looping.")

	SScharacter_setup.queue_preferences_save(prefs)

	feedback_add_details("admin_verb","TAlarmLoops") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!
