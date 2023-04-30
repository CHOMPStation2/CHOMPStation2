/client/verb/toggle_looping_alarms()
	set name = "Looping Alarms"
	set category = "Preferences"
	set desc = "Toggles alarm sound loops."

	var/pref_path = /datum/client_preference/looping_alarms

	toggle_preference(pref_path)

	to_chat(src, "You will [ (is_preference_enabled(pref_path)) ? "now" : "no longer"] hear alarm sounds looping.")

	SScharacter_setup.queue_preferences_save(prefs)

	feedback_add_details("admin_verb","TAlarmLoops") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/client/verb/toggle_sleep_music()
	set name = "Toggle Sleeping Music"
	set category = "Preferences"
	set desc = "When enabled, you will hear cozy music played during surgery, cryo, and sleeper pod usage."

	var/pref_path = /datum/client_preference/sleep_music

	toggle_preference(pref_path)

	to_chat(src, "You are [ (is_preference_enabled(pref_path)) ? "now" : "no longer"] hearing sleeping music while in cryo/surgery/sleeper.")

	SScharacter_setup.queue_preferences_save(prefs)

	feedback_add_details("admin_verb", "TSleepMusic")
