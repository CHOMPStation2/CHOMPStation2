/client/verb/toggle_looping_alarms()
	set name = "Looping Alarms"
	set category = "Preferences.Sounds" //CHOMPEdit
	set desc = "Toggles alarm sound loops."

	var/pref_path = /datum/client_preference/looping_alarms

	toggle_preference(pref_path)

	to_chat(src, "You will [ (is_preference_enabled(pref_path)) ? "now" : "no longer"] hear alarm sounds looping.")

	SScharacter_setup.queue_preferences_save(prefs)

	feedback_add_details("admin_verb","TAlarmLoops") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/client/verb/toggle_sleep_music()
	set name = "Toggle Sleeping Music"
	set category = "Preferences.Sounds" //CHOMPEdit
	set desc = "When enabled, you will hear cozy music played during surgery, cryo, and sleeper pod usage."

	var/pref_path = /datum/client_preference/sleep_music

	toggle_preference(pref_path)

	to_chat(src, "You are [ (is_preference_enabled(pref_path)) ? "now" : "no longer"] hearing sleeping music while in cryo/surgery/sleeper.")

	SScharacter_setup.queue_preferences_save(prefs)

	feedback_add_details("admin_verb", "TSleepMusic")

/* // Up-ported to Virgo, disabling here
/datum/preferences/proc/update_character_previews(var/mob/living/carbon/human/mannequin)
	if(!client)
		return

	var/obj/screen/setup_preview/pm_helper/PMH = LAZYACCESS(char_render_holders, "PMH")
	if(!PMH)
		PMH = new
		LAZYSET(char_render_holders, "PMH", PMH)
		client.screen |= PMH
	PMH.screen_loc = preview_screen_locs["PMH"]

	var/obj/screen/setup_preview/bg/BG = LAZYACCESS(char_render_holders, "BG")
	if(!BG)
		BG = new
		BG.plane = TURF_PLANE
		BG.icon = 'icons/effects/setup_backgrounds_vr.dmi'
		BG.pref = src
		LAZYSET(char_render_holders, "BG", BG)
		client.screen |= BG
	BG.icon_state = bgstate
	BG.screen_loc = preview_screen_locs["BG"]

	for(var/D in global.cardinal)
		var/obj/screen/setup_preview/O = LAZYACCESS(char_render_holders, "[D]")
		if(!O)
			O = new
			O.pref = src
			LAZYSET(char_render_holders, "[D]", O)
			client.screen |= O
		mannequin.set_dir(D)
		mannequin.update_tail_showing()
		mannequin.ImmediateOverlayUpdate()
		var/mutable_appearance/MA = new(mannequin)
		O.appearance = MA
		O.screen_loc = preview_screen_locs["[D]"]
*/
