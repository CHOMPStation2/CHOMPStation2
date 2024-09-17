// Body weight limits on a character.
#define WEIGHT_MIN 70
#define WEIGHT_MAX 500
#define WEIGHT_CHANGE_MIN 0
#define WEIGHT_CHANGE_MAX 100

// Define a place to save in character setup
/datum/preferences
	var/size_multiplier = RESIZE_NORMAL
	// Body weight stuff.
	var/weight_vr = 137		// bodyweight of character (pounds, because I'm not doing the math again -Spades)
	var/weight_gain = 100	// Weight gain rate.
	var/weight_loss = 50	// Weight loss rate.
	var/fuzzy = 0			// Preference toggle for sharp/fuzzy icon. Default sharp.
	var/offset_override = FALSE
	var/voice_freq = 42500	//CHOMPEdit - Why was the default 0
	var/voice_sound = "goon speak 1"	//CHOMPEdit - Changed the default voice to one less jarring
	var/custom_speech_bubble = "default"
	var/custom_footstep = "Default"	// CHOMPAdd
	var/species_sound = "Unset"		// CHOMPEdit: Use default species pain/scream sounds based off icon base if none set, override otherwise

// Definition of the stuff for Sizing
/datum/category_item/player_setup_item/vore/size
	name = "Size"
	sort_order = 2

/datum/category_item/player_setup_item/vore/size/load_character(list/save_data)
	pref.size_multiplier	= save_data["size_multiplier"]
	pref.weight_vr			= save_data["weight_vr"]
	pref.weight_gain		= save_data["weight_gain"]
	pref.weight_loss		= save_data["weight_loss"]
	pref.fuzzy				= save_data["fuzzy"]
	pref.offset_override	= save_data["offset_override"]
	pref.voice_freq			= save_data["voice_freq"]
	pref.voice_sound		= save_data["voice_sound"]
	pref.custom_speech_bubble	= save_data["custom_speech_bubble"]
	//CHOMPAdd Start
	pref.custom_footstep	= save_data["custom_footstep"]
	pref.species_sound		= save_data["species_sound"]
	//CHOMPAdd End

/datum/category_item/player_setup_item/vore/size/save_character(list/save_data)
	save_data["size_multiplier"]	= pref.size_multiplier
	save_data["weight_vr"]			= pref.weight_vr
	save_data["weight_gain"]		= pref.weight_gain
	save_data["weight_loss"]		= pref.weight_loss
	save_data["fuzzy"]				= pref.fuzzy
	save_data["offset_override"]	= pref.offset_override
	save_data["voice_freq"]			= pref.voice_freq
	save_data["voice_sound"]		= pref.voice_sound
	save_data["custom_speech_bubble"]		= pref.custom_speech_bubble
	//CHOMPAdd Start
	save_data["custom_footstep"]	= pref.custom_footstep
	save_data["species_sound"]		= pref.species_sound
	//CHOMPAdd End

/datum/category_item/player_setup_item/vore/size/sanitize_character()
	pref.weight_vr			= sanitize_integer(pref.weight_vr, WEIGHT_MIN, WEIGHT_MAX, initial(pref.weight_vr))
	pref.weight_gain		= sanitize_integer(pref.weight_gain, WEIGHT_CHANGE_MIN, WEIGHT_CHANGE_MAX, initial(pref.weight_gain))
	pref.weight_loss		= sanitize_integer(pref.weight_loss, WEIGHT_CHANGE_MIN, WEIGHT_CHANGE_MAX, initial(pref.weight_loss))
	pref.fuzzy				= sanitize_integer(pref.fuzzy, 0, 1, initial(pref.fuzzy))
	pref.offset_override	= sanitize_integer(pref.offset_override, 0, 1, initial(pref.offset_override))
	if(pref.voice_freq != 0)
		pref.voice_freq			= sanitize_integer(pref.voice_freq, MIN_VOICE_FREQ, MAX_VOICE_FREQ, initial(pref.voice_freq)) //CHOMPEdit
	if(pref.size_multiplier == null || pref.size_multiplier < RESIZE_TINY || pref.size_multiplier > RESIZE_HUGE)
		pref.size_multiplier = initial(pref.size_multiplier)
	if(!(pref.custom_speech_bubble in selectable_speech_bubbles))
		pref.custom_speech_bubble = "default"
	if(!(pref.custom_footstep))	// CHOMPAdd
		pref.custom_footstep = "Default"
	// var/datum/species/selected_species = GLOB.all_species[pref.species] // CHOMPEdit
	if(!(pref.species_sound)) // CHOMPEdit // && selected_species.selects_bodytype
		pref.species_sound = "Unset" // CHOMPEdit - otherwise, we leave this as null or w/e the default is

/datum/category_item/player_setup_item/vore/size/copy_to_mob(var/mob/living/carbon/human/character)
	character.weight			= pref.weight_vr
	character.weight_gain		= pref.weight_gain
	character.weight_loss		= pref.weight_loss
	character.fuzzy				= pref.fuzzy
	character.offset_override	= pref.offset_override
	character.voice_freq		= pref.voice_freq
	character.resize(pref.size_multiplier, animate = FALSE, ignore_prefs = TRUE)

	//CHOMPEDIT Global voice lookup
	if(!pref.voice_sound)
		character.voice_sounds_list = talk_sound
	else
		character.voice_sounds_list = get_talk_sound(pref.voice_sound)
	/*if(!pref.voice_sound)
		character.voice_sounds_list = talk_sound
	else
		switch(pref.voice_sound)
			if("beep-boop")
				character.voice_sounds_list = talk_sound
			if("goon speak 1")
				character.voice_sounds_list = goon_speak_one_sound
			if("goon speak 2")
				character.voice_sounds_list = goon_speak_two_sound
			if("goon speak 3")
				character.voice_sounds_list = goon_speak_three_sound
			if("goon speak 4")
				character.voice_sounds_list = goon_speak_four_sound
			if("goon speak blub")
				character.voice_sounds_list = goon_speak_blub_sound
			if("goon speak bottalk")
				character.voice_sounds_list = goon_speak_bottalk_sound
			if("goon speak buwoo")
				character.voice_sounds_list = goon_speak_buwoo_sound
			if("goon speak cow")
				character.voice_sounds_list = goon_speak_cow_sound
			if("goon speak lizard")
				character.voice_sounds_list = goon_speak_lizard_sound
			if("goon speak pug")
				character.voice_sounds_list = goon_speak_pug_sound
			if("goon speak pugg")
				character.voice_sounds_list = goon_speak_pugg_sound
			if("goon speak roach")
				character.voice_sounds_list = goon_speak_roach_sound
			if("goon speak skelly")
				character.voice_sounds_list = goon_speak_skelly_sound
				*/ //CHOMPEDIT Global voice lookup
	character.custom_speech_bubble = pref.custom_speech_bubble
	character.custom_footstep = pref.custom_footstep

/datum/category_item/player_setup_item/vore/size/content(var/mob/user)
	. += "<br>"
	. += "<b>Scale:</b> <a href='?src=\ref[src];size_multiplier=1'>[round(pref.size_multiplier*100)]%</a><br>"
	. += "<b>Scaled Appearance:</b> <a [pref.fuzzy ? "" : ""] href='?src=\ref[src];toggle_fuzzy=1'><b>[pref.fuzzy ? "Fuzzy" : "Sharp"]</b></a><br>"
	. += "<b>Scaling Center:</b> <a [pref.offset_override ? "" : ""] href='?src=\ref[src];toggle_offset_override=1'><b>[pref.offset_override ? "Odd" : "Even"]</b></a><br>"
	. += "<br>" // CHOMPEdit: Fancy:tm:
	. += "<b>Mob Speech/Noise Customization</b>" // CHOMPEdit: Fancy:tm:
	. += "<br>"  // CHOMPEdit
	. += "<b>Voice Frequency:</b> <a href='?src=\ref[src];voice_freq=1'>[pref.voice_freq]</a><br>"
	. += "<b>Voice Sounds:</b> <a href='?src=\ref[src];voice_sounds_list=1'>[pref.voice_sound]</a><br>"
	. += "<a href='?src=\ref[src];voice_test=1'><b>Test Selected Voice</b></a><br>"
	. += "<b>Custom Speech Bubble:</b> <a href='?src=\ref[src];customize_speech_bubble=1'>[pref.custom_speech_bubble]</a><br>"
	. += "<b>Custom Footstep Sounds:</b><a href='?src=\ref[src];customize_footsteps=1'>[pref.custom_footstep]</a><br>"
	// CHOMPEdit Start: Pain/Scream/Death Custom Sounds
	// var/datum/species/selected_species = GLOB.all_species[pref.species]
	// if(selected_species.selects_bodytype)
	. += "<br>"
	. += "<b>Species Sounds:</b> <a href='?src=\ref[src];species_sound_options=1'>[pref.species_sound]</a><br>"
	. += "<a href='?src=\ref[src];cough_test=1'><b>Test Cough Sounds</b></a><br>"
	. += "<a href='?src=\ref[src];sneeze_test=1'><b>Test Sneeze Sounds</b></a><br>"
	. += "<a href='?src=\ref[src];scream_test=1'><b>Test Scream Sounds</b></a><br>"
	. += "<a href='?src=\ref[src];pain_test=1'><b>Test Pain Sounds</b></a><br>"
	. += "<a href='?src=\ref[src];gasp_test=1'><b>Test Gasp Sounds</b></a><br>"
	. += "<a href='?src=\ref[src];death_test=1'><b>Test Death Sounds</b></a><br>"
	// CHOMPEdit End: Pain/Scream/Death Custom Sounds
	. += "<br>"
	. += "<b>Relative Weight:</b>  <a href='?src=\ref[src];weight=1'>[pref.weight_vr]</a><br>"
	. += "<b>Weight Gain Rate:</b> <a href='?src=\ref[src];weight_gain=1'>[pref.weight_gain]</a><br>"
	. += "<b>Weight Loss Rate:</b> <a href='?src=\ref[src];weight_loss=1'>[pref.weight_loss]</a><br>"

/datum/category_item/player_setup_item/vore/size/OnTopic(var/href, var/list/href_list, var/mob/user)
	if(href_list["size_multiplier"])
		var/new_size = tgui_input_number(user, "Choose your character's size, ranging from 25% to 200%", "Set Size", null, 200, 25)
		if (!ISINRANGE(new_size,25,200))
			pref.size_multiplier = 1
			to_chat(user, "<span class='notice'>Invalid size.</span>")
			return TOPIC_REFRESH_UPDATE_PREVIEW
		else if(new_size)
			pref.size_multiplier = (new_size/100)
			return TOPIC_REFRESH_UPDATE_PREVIEW

	else if(href_list["toggle_fuzzy"])
		pref.fuzzy = pref.fuzzy ? 0 : 1;
		return TOPIC_REFRESH_UPDATE_PREVIEW

	else if(href_list["toggle_offset_override"])
		pref.offset_override = pref.offset_override ? 0 : 1;
		return TOPIC_REFRESH_UPDATE_PREVIEW

	else if(href_list["weight"])
		var/new_weight = tgui_input_number(user, "Choose your character's relative body weight.\n\
			This measurement should be set relative to a normal 5'10'' person's body and not the actual size of your character.\n\
			If you set your weight to 500 because you're a naga or have metal implants then complain that you're a blob I\n\
			swear to god I will find you and I will punch you for not reading these directions!\n\
			([WEIGHT_MIN]-[WEIGHT_MAX])", "Character Preference", null, WEIGHT_MAX, WEIGHT_MIN, round_value=FALSE)
		if(new_weight)
			var/unit_of_measurement = tgui_alert(user, "Is that number in pounds (lb) or kilograms (kg)?", "Confirmation", list("Pounds", "Kilograms"))
			if(!unit_of_measurement)
				return TOPIC_NOACTION
			if(unit_of_measurement == "Pounds")
				new_weight = round(text2num(new_weight),4)
			if(unit_of_measurement == "Kilograms")
				new_weight = round(2.20462*text2num(new_weight),4)
			pref.weight_vr = sanitize_integer(new_weight, WEIGHT_MIN, WEIGHT_MAX, pref.weight_vr)
			return TOPIC_REFRESH

	else if(href_list["weight_gain"])
		var/weight_gain_rate = tgui_input_number(user, "Choose your character's rate of weight gain between 100% \
			(full realism body fat gain) and 0% (no body fat gain).\n\
			(If you want to disable weight gain, set this to 0.01 to round it to 0%.)\
			([WEIGHT_CHANGE_MIN]-[WEIGHT_CHANGE_MAX])", "Character Preference", pref.weight_gain, WEIGHT_CHANGE_MAX, WEIGHT_CHANGE_MIN, round_value=FALSE)
		if(weight_gain_rate)
			pref.weight_gain = round(text2num(weight_gain_rate),1)
			return TOPIC_REFRESH

	else if(href_list["weight_loss"])
		var/weight_loss_rate = tgui_input_number(user, "Choose your character's rate of weight loss between 100% \
			(full realism body fat loss) and 0% (no body fat loss).\n\
			(If you want to disable weight loss, set this to 0.01 round it to 0%.)\
			([WEIGHT_CHANGE_MIN]-[WEIGHT_CHANGE_MAX])", "Character Preference", pref.weight_loss, WEIGHT_CHANGE_MAX, WEIGHT_CHANGE_MIN, round_value=FALSE)
		if(weight_loss_rate)
			pref.weight_loss = round(text2num(weight_loss_rate),1)
			return TOPIC_REFRESH

	else if(href_list["voice_freq"])
		var/list/preset_voice_freqs = list("high" = MAX_VOICE_FREQ, "middle-high" = 56250, "middle" = 42500, "middle-low"= 28750, "low" = MIN_VOICE_FREQ, "custom" = 1, "random" = 0)
		var/choice = tgui_input_list(user, "What would you like to set your voice frequency to? ([MIN_VOICE_FREQ] - [MAX_VOICE_FREQ])", "Voice Frequency", preset_voice_freqs) //ChompEDIT - usr removal
		if(!choice)
			return
		choice = preset_voice_freqs[choice]
		if(choice == 0)
			pref.voice_freq = 42500 //CHOMPEdit
			return TOPIC_REFRESH
		else if(choice == 1)
			choice = tgui_input_number(user, "Choose your character's voice frequency, ranging from [MIN_VOICE_FREQ] to [MAX_VOICE_FREQ]", "Custom Voice Frequency", null, MAX_VOICE_FREQ, MIN_VOICE_FREQ)
		if(choice > MAX_VOICE_FREQ)
			choice = MAX_VOICE_FREQ
		else if(choice < MIN_VOICE_FREQ)
			choice = MIN_VOICE_FREQ

		pref.voice_freq = choice
		return TOPIC_REFRESH
	else if(href_list["voice_sounds_list"])
		var/list/possible_voice_types = list(
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
			"goon speak skelly",
			"xeno speak") // CHOMPedit
		var/choice = tgui_input_list(user, "Which set of sounds would you like to use for your character's speech sounds?", "Voice Sounds", possible_voice_types)
		if(!pref.voice_sound)
			pref.voice_sound = "goon speak 1"	//CHOMPEdit - Defaults voice to a less jarring sound
		else if(!choice)
			return TOPIC_REFRESH  // CHOMPEdit
		else
			pref.voice_sound = choice
		return TOPIC_REFRESH
	// CHOMPAdd Start
	else if(href_list["customize_footsteps"])
		var/list/footstep_choice = selectable_footstep
		var/choice = tgui_input_list(user, "What footstep sounds would your character make?", "Custom Foostep Sounds", footstep_choice)
		if(choice)
			pref.custom_footstep = footstep_choice[choice]
			return TOPIC_REFRESH
	// CHOMPAdd End
	else if(href_list["customize_speech_bubble"])
		var/choice = tgui_input_list(user, "What speech bubble style do you want to use? (default for automatic selection)", "Custom Speech Bubble", selectable_speech_bubbles)
		if(!choice)
			pref.custom_speech_bubble = "default"
		else
			pref.custom_speech_bubble = choice
		return TOPIC_REFRESH

	else if(href_list["voice_test"])
		var/sound/S
		switch(pref.voice_sound)
			if("beep-boop")
				S = sound(pick(talk_sound))
			if("goon speak 1")
				S = sound(pick(goon_speak_one_sound))
			if("goon speak 2")
				S = sound(pick(goon_speak_two_sound))
			if("goon speak 3")
				S = sound(pick(goon_speak_three_sound))
			if("goon speak 4")
				S = sound(pick(goon_speak_four_sound))
			if("goon speak blub")
				S = sound(pick(goon_speak_blub_sound))
			if("goon speak bottalk")
				S = sound(pick(goon_speak_bottalk_sound))
			if("goon speak buwoo")
				S = sound(pick(goon_speak_buwoo_sound))
			if("goon speak cow")
				S = sound(pick(goon_speak_cow_sound))
			if("goon speak lizard")
				S = sound(pick(goon_speak_lizard_sound))
			if("goon speak pug")
				S = sound(pick(goon_speak_pug_sound))
			if("goon speak pugg")
				S = sound(pick(goon_speak_pugg_sound))
			if("goon speak roach")
				S = sound(pick(goon_speak_roach_sound))
			if("goon speak skelly")
				S = sound(pick(goon_speak_skelly_sound))
//CHOMPedit start.
			if("xeno speak")
				S = sound(pick(xeno_speak_sound))
//CHOMPedit end.
		if(S)
			S.frequency = pick(pref.voice_freq)
			S.volume = 50
			SEND_SOUND(user, S)
	// CHOMPEdit Start: Pain/Scream/Death sounds
	else if(href_list["species_sound_options"]) // You shouldn't be able to see this option if you don't have the option to select a custom icon base, so we don't need to re-check for safety here.
		var/list/possible_species_sound_types = species_sound_map
		var/choice = tgui_input_list(user, "Which set of sounds would you like to use for your character's species sounds? (Cough, Sneeze, Scream, Pain, Gasp, Death)", "Species Sounds", possible_species_sound_types)
		if(!choice)
			return TOPIC_REFRESH // No choice? Don't reset our selection
		else
			pref.species_sound = choice
			return TOPIC_REFRESH
	else if(href_list["cough_test"])
		var/sound/S
		var/ourpref = pref.species_sound
		var/oursound = get_species_sound(ourpref)["cough"]
		S = sound(pick(oursound))
		if(pref.species_sound == "Unset")
			oursound = get_species_sound(select_default_species_sound(pref))["cough"]
			S = sound(pick(oursound))
		if(pref.species_sound == "None" || oursound == null)
			to_chat(user, "<span class='warning'>This set does not have cough sounds!</span>")
			return TOPIC_REFRESH
		S.frequency = pick(pref.voice_freq)
		S.volume = 20
		SEND_SOUND(user, S)
		return TOPIC_REFRESH
	else if(href_list["sneeze_test"])
		var/sound/S
		var/ourpref = pref.species_sound
		var/oursound = get_species_sound(ourpref)["sneeze"]
		S = sound(pick(oursound))
		if(pref.species_sound == "Unset")
			oursound = get_species_sound(select_default_species_sound(pref))["sneeze"]
			S = sound(pick(oursound))
		if(pref.species_sound == "None" || oursound == null)
			to_chat(user, "<span class='warning'>This set does not have sneeze sounds!</span>")
			return TOPIC_REFRESH
		S.frequency = pick(pref.voice_freq)
		S.volume = 20
		SEND_SOUND(user, S)
		return TOPIC_REFRESH
	else if(href_list["scream_test"])
		var/sound/S
		var/ourpref = pref.species_sound
		var/oursound = get_species_sound(ourpref)["scream"]
		S = sound(pick(oursound))
		if(pref.species_sound == "Unset")
			oursound = get_species_sound(select_default_species_sound(pref))["scream"]
			S = sound(pick(oursound))
		if(pref.species_sound == "None" || oursound == null)
			to_chat(user, "<span class='warning'>This set does not have scream sounds!</span>")
			return TOPIC_REFRESH
		S.frequency = pick(pref.voice_freq)
		S.volume = 20
		SEND_SOUND(user, S)
		return TOPIC_REFRESH
	else if(href_list["pain_test"])
		var/sound/S
		var/ourpref = pref.species_sound
		var/oursound = get_species_sound(ourpref)["pain"]
		S = sound(pick(oursound))
		if(pref.species_sound == "Unset")
			oursound = get_species_sound(select_default_species_sound(pref))["pain"]
			S = sound(pick(oursound))
		if(pref.species_sound == "None" || oursound == null)
			to_chat(user, "<span class='warning'>This set does not have pain sounds!</span>")
			return TOPIC_REFRESH
		S.frequency = pick(pref.voice_freq)
		S.volume = 20
		SEND_SOUND(user, S)
		return TOPIC_REFRESH
	else if(href_list["gasp_test"])
		var/sound/S
		var/ourpref = pref.species_sound
		var/oursound = get_species_sound(ourpref)["gasp"]
		S = sound(pick(oursound))
		if(pref.species_sound == "Unset")
			oursound = get_species_sound(select_default_species_sound(pref))["gasp"]
			S = sound(pick(oursound))
		if(pref.species_sound == "None" || oursound == null)
			to_chat(user, "<span class='warning'>This set does not have gasp sounds!</span>")
			return TOPIC_REFRESH
		S.frequency = pick(pref.voice_freq)
		S.volume = 20
		SEND_SOUND(user, S)
		return TOPIC_REFRESH
	else if(href_list["death_test"])
		var/sound/S
		var/ourpref = pref.species_sound
		var/oursound = get_species_sound(ourpref)["death"]
		S = sound(pick(oursound))
		if(pref.species_sound == "Unset")
			oursound = get_species_sound(select_default_species_sound(pref))["death"]
			S = sound(pick(oursound))
		if(pref.species_sound == "None" || oursound == null)
			to_chat(user, "<span class='warning'>This set does not have death sounds!</span>")
			return TOPIC_REFRESH
		S.frequency = pick(pref.voice_freq)
		S.volume = 20
		SEND_SOUND(user, S)
		return TOPIC_REFRESH
	// CHOMPEdit End
	return ..();

#undef WEIGHT_MIN
#undef WEIGHT_MAX
#undef WEIGHT_CHANGE_MIN
#undef WEIGHT_CHANGE_MAX
