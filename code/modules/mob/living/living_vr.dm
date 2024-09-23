/mob/living/Check_Shoegrip()
	if(flying)
		return 1
	..()

/mob/living/verb/customsay()
	set category = "IC.Settings" //CHOMPEdit
	set name = "Customize Speech Verbs"
	set desc = "Customize the text which appears when you type- e.g. 'says', 'asks', 'exclaims'."

	if(src.client)
		var/sayselect = tgui_alert(src, "Which say-verb do you wish to customize?", "Select Verb", list("Say","Whisper","Ask (?)","Exclaim/Shout/Yell (!)","Cancel"))

		if(sayselect == "Say")
			custom_say =  lowertext(sanitize(tgui_input_text(usr, "This word or phrase will appear instead of 'says': [src] says, \"Hi.\"", "Custom Say", null)))
		else if(sayselect == "Whisper")
			custom_whisper =  lowertext(sanitize(tgui_input_text(usr, "This word or phrase will appear instead of 'whispers': [src] whispers, \"Hi...\"", "Custom Whisper", null)))
		else if(sayselect == "Ask (?)")
			custom_ask =  lowertext(sanitize(tgui_input_text(usr, "This word or phrase will appear instead of 'asks': [src] asks, \"Hi?\"", "Custom Ask", null)))
		else if(sayselect == "Exclaim/Shout/Yell (!)")
			custom_exclaim =  lowertext(sanitize(tgui_input_text(usr, "This word or phrase will appear instead of 'exclaims', 'shouts' or 'yells': [src] exclaims, \"Hi!\"", "Custom Exclaim", null)))
		else
			return

/mob/living/verb/set_metainfo()
	set name = "Set OOC Metainfo"
	set desc = "Sets OOC notes about yourself or your RP preferences or status."
	set category = "OOC.Game Settings" //CHOMPEdit

	if(usr != src)
		return
	var/new_metadata = strip_html_simple(tgui_input_text(usr, "Enter any information you'd like others to see, such as Roleplay-preferences. This will not be saved permanently unless you click save in the OOC notes panel!", "Game Preference" , html_decode(ooc_notes), multiline = TRUE,  prevent_enter = TRUE))
	if(new_metadata && CanUseTopic(usr))
		ooc_notes = new_metadata
		client.prefs.metadata = new_metadata
		to_chat(usr, "<span class='filter_notice'>OOC notes updated. Don't forget to save!</span>")
		log_admin("[key_name(usr)] updated their OOC notes mid-round.")
		ooc_notes_window(usr)
		//CHOMPEdit Start
		set_metainfo_likes(usr, FALSE)
		set_metainfo_dislikes(usr, FALSE)
		set_metainfo_favs(usr, FALSE)
		set_metainfo_maybes(usr, FALSE)
		set_metainfo_ooc_style(usr, FALSE)
		//CHOMPEdit End

//ChompEDIT START - Removal of usr
/mob/living/proc/set_metainfo_panel(var/mob/user)
	if(user != src)
		return
	var/new_metadata = strip_html_simple(tgui_input_text(user, "Enter any information you'd like others to see, such as Roleplay-preferences. This will not be saved permanently unless you click save in the OOC notes panel!", "Game Preference" , html_decode(ooc_notes), multiline = TRUE,  prevent_enter = TRUE))
	if(new_metadata && CanUseTopic(user))
		ooc_notes = new_metadata
		client.prefs.metadata = new_metadata
		to_chat(user, "<span class='filter_notice'>OOC notes updated. Don't forget to save!</span>")
		log_admin("[key_name(user)] updated their OOC notes mid-round.")
		ooc_notes_window(user)

/mob/living/proc/set_metainfo_likes(var/mob/user, var/reopen = TRUE)
	if(user != src)
		return
	var/new_metadata = strip_html_simple(tgui_input_text(user, "Enter any information you'd like others to see relating to your LIKED roleplay preferences. This will not be saved permanently unless you click save in the OOC notes panel! Type \"!clear\" to empty.", "Game Preference" , html_decode(ooc_notes_likes), multiline = TRUE,  prevent_enter = TRUE))
	if(new_metadata && CanUseTopic(user))
		if(new_metadata == "!clear")
			new_metadata = ""
		ooc_notes_likes = new_metadata
		client.prefs.metadata_likes = new_metadata
		to_chat(user, "<span class='filter_notice'>OOC note likes have been updated. Don't forget to save!</span>")
		log_admin("[key_name(user)] updated their OOC note likes mid-round.")
		if(reopen)
			ooc_notes_window(user)

/mob/living/proc/set_metainfo_dislikes(var/mob/user, var/reopen = TRUE)
	if(user != src)
		return
	var/new_metadata = strip_html_simple(tgui_input_text(user, "Enter any information you'd like others to see relating to your DISLIKED roleplay preferences. This will not be saved permanently unless you click save in the OOC notes panel! Type \"!clear\" to empty.", "Game Preference" , html_decode(ooc_notes_dislikes), multiline = TRUE,  prevent_enter = TRUE))
	if(new_metadata && CanUseTopic(user))
		if(new_metadata == "!clear")
			new_metadata = ""
		ooc_notes_dislikes = new_metadata
		client.prefs.metadata_dislikes = new_metadata
		to_chat(user, "<span class='filter_notice'>OOC note dislikes have been updated. Don't forget to save!</span>")
		log_admin("[key_name(user)] updated their OOC note dislikes mid-round.")
		if(reopen)
			ooc_notes_window(user)

/mob/living/proc/save_ooc_panel(var/mob/user)
	if(user != src)
		return
	if(client.prefs.real_name != real_name)
		to_chat(user, "<span class='danger'>Your selected character slot name is not the same as your character's name. Aborting save. Please select [real_name]'s character slot in character setup before saving.</span>")
		return
	if(client.prefs.save_character())
		to_chat(user, "<span class='filter_notice'>Character preferences saved.</span>")

/mob/living/proc/print_ooc_notes_to_chat(var/mob/user)
	if(!ooc_notes)
		return
	var/msg = ooc_notes
	//CHOMPEdit Start
	if(ooc_notes_style && (ooc_notes_favs || ooc_notes_likes || ooc_notes_maybes || ooc_notes_dislikes) && !user.client?.prefs?.read_preference(/datum/preference/toggle/vchat_enable)) // Oldchat hates proper formatting
		msg += "<br><br>"
		msg += "<table><tr>"
		if(ooc_notes_favs)
			msg += "<th><b>\t[span_blue("FAVOURITES")]</b></th>"
		if(ooc_notes_likes)
			msg += "<th><b>\t[span_green("LIKES")]</b></th>"
		if(ooc_notes_maybes)
			msg += "<th><b>\t[span_yellow("MAYBES")]</b></th>"
		if(ooc_notes_dislikes)
			msg += "<th><b>\t[span_red("DISLIKES")]</b></th>"
		msg += "</tr><tr>"
		if(ooc_notes_favs)
			msg += "<td>"
			for(var/line in splittext(ooc_notes_favs, "\n"))
				msg += "\t[line]\n"
			msg += "</td>"
		if(ooc_notes_likes)
			msg += "<td>"
			for(var/line in splittext(ooc_notes_likes, "\n"))
				msg += "\t[line]\n"
			msg += "</td>"
		if(ooc_notes_maybes)
			msg += "<td>"
			for(var/line in splittext(ooc_notes_maybes, "\n"))
				msg += "\t[line]\n"
			msg += "</td>"
		if(ooc_notes_dislikes)
			msg += "<td>"
			for(var/line in splittext(ooc_notes_dislikes, "\n"))
				msg += "\t[line]\n"
			msg += "</td>"
		msg += "</tr></table>"
	else
		if(ooc_notes_favs)
			msg += "<br><br><b>[span_blue("FAVOURITES")]</b><br>[ooc_notes_favs]"
		if(ooc_notes_likes)
			msg += "<br><br><b>[span_green("LIKES")]</b><br>[ooc_notes_likes]"
		if(ooc_notes_maybes)
			msg += "<br><br><b>[span_yellow("MAYBES")]</b><br>[ooc_notes_maybes]"
		if(ooc_notes_dislikes)
			msg += "<br><br><b>[span_red("DISLIKES")]</b><br>[ooc_notes_dislikes]"
	to_chat(user, "<span class='chatexport'><b>[src]'s Metainfo:</b><br>[msg]</span>")
	//CHOMPEdit End
//ChompEDIT END - Removal of usr
/mob/living/verb/set_custom_link()
	set name = "Set Custom Link"
	set desc = "Set a custom link to show up with your examine text."
	set category = "IC.Settings" //CHOMPEdit

	if(usr != src)
		return
	var/new_link = strip_html_simple(tgui_input_text(usr, "Enter a link to add on to your examine text! This should be a related image link/gallery, or things like your F-list. This is not the place for memes.", "Custom Link" , html_decode(custom_link), max_length = 100, encode = TRUE,  prevent_enter = TRUE))
	if(new_link && CanUseTopic(usr))
		if(length(new_link) > 100)
			to_chat(usr, "<span class = 'warning'>Your entry is too long, it must be 100 characters or less.</span>")
			return

		custom_link = new_link
		to_chat(usr, "<span class = 'notice'>Link set: [custom_link]</span>")
		log_admin("[usr]/[usr.ckey] set their custom link to [custom_link]")

/mob/living/verb/set_voice_freq()
	set name = "Set Voice Frequency"
	set desc = "Sets your voice frequency to be higher or lower pitched!"
	set category = "OOC.Game Settings" //CHOMPEdit
	var/list/preset_voice_freqs = list("high" = MAX_VOICE_FREQ, "middle-high" = 56250, "middle" = 425000, "middle-low"= 28750, "low" = MIN_VOICE_FREQ, "custom" = 1, "random" = 0)
	var/choice = tgui_input_list(src, "What would you like to set your voice frequency to?", "Voice Frequency", preset_voice_freqs)
	if(!choice)
		return
	choice = preset_voice_freqs[choice]
	if(choice == 0)
		voice_freq = choice
		return
	else if(choice == 1)
		choice = tgui_input_number(src, "Choose your character's voice frequency, ranging from [MIN_VOICE_FREQ] to [MAX_VOICE_FREQ]", "Custom Voice Frequency", null, MAX_VOICE_FREQ, MIN_VOICE_FREQ)
	else if(choice > MAX_VOICE_FREQ)
		choice = MAX_VOICE_FREQ
	else if(choice < MIN_VOICE_FREQ)
		choice = MIN_VOICE_FREQ
	voice_freq = choice

/mob/living/verb/set_voice_type()
	set name = "Set Voice Type"
	set desc = "Sets your voice style!"
	set category = "OOC.Game Settings" //CHOMPEdit

	//CHOMPEDIT START, Global Talk Sounds
	var/list/possible_voice_types = get_talk_sound()/*list(
		"beep-boop",
		"goon speak 1",
		"goon speak 2",
		"goon speak 3",
		"goon speak 4",
		"goon speak blub",
		"goon speak bottalk",
		"goon speak buwoo",
		"goon speak cow",
		"goon speak lizard",
		"goon speak pug",
		"goon speak pugg",
		"goon speak roach",
		"goon speak skelly")
	*/ //CHOMPEDIT END, Global Talk Sounds
	var/choice = tgui_input_list(usr, "Which set of sounds would you like to use for your character's speech sounds?", "Voice Sounds", possible_voice_types)
	if(!choice)
		voice_sounds_list = talk_sound
	switch(choice)
		if("beep-boop")
			voice_sounds_list = talk_sound
		if("goon speak 1")
			voice_sounds_list = goon_speak_one_sound
		if("goon speak 2")
			voice_sounds_list = goon_speak_two_sound
		if("goon speak 3")
			voice_sounds_list = goon_speak_three_sound
		if("goon speak 4")
			voice_sounds_list = goon_speak_four_sound
		if("goon speak blub")
			voice_sounds_list = goon_speak_blub_sound
		if("goon speak bottalk")
			voice_sounds_list = goon_speak_bottalk_sound
		if("goon speak buwoo")
			voice_sounds_list = goon_speak_buwoo_sound
		if("goon speak cow")
			voice_sounds_list = goon_speak_cow_sound
		if("goon speak lizard")
			voice_sounds_list = goon_speak_lizard_sound
		if("goon speak pug")
			voice_sounds_list = goon_speak_pug_sound
		if("goon speak pugg")
			voice_sounds_list = goon_speak_pugg_sound
		if("goon speak roach")
			voice_sounds_list = goon_speak_roach_sound
		if("goon speak skelly")
			voice_sounds_list = goon_speak_skelly_sound
//CHOMPedit start.
		if("xeno speak")
			voice_sounds_list = xeno_speak_sound
//CHOMPedit end.
