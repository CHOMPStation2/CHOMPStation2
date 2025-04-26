/mob/living/Initialize(mapload)
	. = ..()

	deaf_loop = new(list(src), FALSE)
	firesoundloop = new(list(src), FALSE)
	// stunnedloop = new(list(src), FALSE)
	if(firesoundloop) // Partly safety, partly so we can have different probs for randomization
		if(prob(40)) // Randomize our end_sound. Can't really do this easily in looping_sound without some work
			if(prob(30))
				firesoundloop.end_sound = 'sound/effects/mob_effects/on_fire/fire_extinguish2.ogg'
			else if(prob(20))
				firesoundloop.end_sound = 'sound/effects/mob_effects/on_fire/fire_extinguish3.ogg'
			else
				firesoundloop.end_sound = 'sound/effects/mob_effects/on_fire/fire_extinguish4.ogg'

/mob/living/Destroy()
	. = ..()

	QDEL_NULL(deaf_loop)
	QDEL_NULL(firesoundloop)
	// QDEL_NULL(stunnedloop)

/*
Maybe later, gotta figure out a way to click yourself when in a locker etc.

/mob/living/proc/click_self()
	set name = "Click Self"
	set desc = "Clicks yourself. Useful when you can't see yourself."
	set category = "IC.Game"

	ClickOn(src)

/mob/living/Initialize(mapload)
	. = ..()
	add_verb(src,/mob/living/proc/click_self) //CHOMPEdit TGPanel
*/

/mob/living/proc/handle_vorefootstep(m_intent, turf/T) // Moved from living_ch.dm
	return FALSE

//ChompEDIT START - Removal of usr
/mob/living/proc/set_metainfo_favs(var/mob/user, var/reopen = TRUE)
	if(user != src)
		return
	var/new_metadata = strip_html_simple(tgui_input_text(user, "Enter any information you'd like others to see relating to your FAVOURITE roleplay preferences. This will not be saved permanently unless you click save in the OOC notes panel! Type \"!clear\" to empty.", "Game Preference" , html_decode(ooc_notes_favs), multiline = TRUE,  prevent_enter = TRUE))
	if(new_metadata && CanUseTopic(user))
		if(new_metadata == "!clear")
			new_metadata = ""
		ooc_notes_favs = new_metadata
		client.prefs.update_preference_by_type(/datum/preference/text/living/ooc_notes_favs, new_metadata)
		to_chat(user, span_filter_notice("OOC note favs have been updated. Don't forget to save!"))
		log_admin("[key_name(user)] updated their OOC note favs mid-round.")
		if(reopen)
			ooc_notes_window(user)

/mob/living/proc/set_metainfo_maybes(var/mob/user, var/reopen = TRUE)
	if(user != src)
		return
	var/new_metadata = strip_html_simple(tgui_input_text(user, "Enter any information you'd like others to see relating to your MAYBE roleplay preferences. This will not be saved permanently unless you click save in the OOC notes panel! Type \"!clear\" to empty.", "Game Preference" , html_decode(ooc_notes_maybes), multiline = TRUE,  prevent_enter = TRUE))
	if(new_metadata && CanUseTopic(user))
		if(new_metadata == "!clear")
			new_metadata = ""
		ooc_notes_maybes = new_metadata
		client.prefs.update_preference_by_type(/datum/preference/text/living/ooc_notes_maybes, new_metadata)
		to_chat(user, span_filter_notice("OOC note maybes have been updated. Don't forget to save!"))
		log_admin("[key_name(user)] updated their OOC note maybes mid-round.")
		if(reopen)
			ooc_notes_window(user)

/mob/living/proc/set_metainfo_ooc_style(var/mob/user, var/reopen = TRUE)
	if(user != src)
		return
	ooc_notes_style = !ooc_notes_style
	client.prefs.update_preference_by_type(/datum/preference/toggle/living/ooc_notes_style, ooc_notes_style)
	if(reopen)
		ooc_notes_window(user)
//ChompEDIT END - Removal of usr
