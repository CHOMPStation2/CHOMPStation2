/datum/preferences
	//Our OOC Metadata additions
	var/metadata_maybes = ""
	var/metadata_favs = ""
	var/matadata_ooc_style = FALSE

	var/job_other_low = 0
	var/job_other_med = 0
	var/job_other_high = 0

/datum/preferences/proc/vanity_copy_to(var/mob/living/carbon/human/character, var/copy_name, var/copy_flavour = TRUE, var/copy_ooc_notes = FALSE, var/convert_to_prosthetics = FALSE)
	//snowflake copy_to, does not copy anything but the vanity things
	//does not check if the name is the same, do that in any proc that calls this proc
	/*
	name, nickname, flavour, OOC notes
	gender, sex
	custom species name, custom bodytype, weight, scale, scaling center, sound type, sound freq
	custom say verbs
	ears, wings, tail, hair, facial hair
	ears colors, wings colors, tail colors
	body color, prosthetics (if they're a protean) (convert to DSI if protean and not prosthetic), eye color, hair color etc
	markings
	custom synth markings toggle, custom synth color toggle
	digitigrade
	blood color
	*/
	if (copy_name)
		if(CONFIG_GET(flag/humans_need_surnames)) // CHOMPEdit
			var/firstspace = findtext(real_name, " ")
			var/name_length = length(real_name)
			if(!firstspace)	//we need a surname
				real_name += " [pick(last_names)]"
			else if(firstspace == name_length)
				real_name += "[pick(last_names)]"
		character.real_name = real_name
		character.name = character.real_name
		if(character.dna)
			character.dna.real_name = character.real_name
		character.nickname = nickname
	character.gender = biological_gender
	character.identifying_gender = identifying_gender

	character.r_eyes	= r_eyes
	character.g_eyes	= g_eyes
	character.b_eyes	= b_eyes
	character.h_style	= h_style
	character.r_hair	= r_hair
	character.g_hair	= g_hair
	character.b_hair	= b_hair
	character.r_grad	= r_grad
	character.g_grad	= g_grad
	character.b_grad	= b_grad
	character.f_style	= f_style
	character.r_facial	= r_facial
	character.g_facial	= g_facial
	character.b_facial	= b_facial
	character.r_skin	= r_skin
	character.g_skin	= g_skin
	character.b_skin	= b_skin
	character.s_tone	= s_tone
	character.h_style	= h_style
	character.grad_style= grad_style
	character.f_style	= f_style
	character.grad_style= grad_style
	character.b_type	= b_type
	character.synth_color = synth_color
	character.r_synth	= r_synth
	character.g_synth	= g_synth
	character.b_synth	= b_synth
	character.synth_markings = synth_markings

	var/list/ear_styles = get_available_styles(global.ear_styles_list)
	character.ear_style =  ear_styles[ear_style]
	character.r_ears =     r_ears
	character.b_ears =     b_ears
	character.g_ears =     g_ears
	character.r_ears2 =    r_ears2
	character.b_ears2 =    b_ears2
	character.g_ears2 =    g_ears2
	character.r_ears3 =    r_ears3
	character.b_ears3 =    b_ears3
	character.g_ears3 =    g_ears3

	var/list/tail_styles = get_available_styles(global.tail_styles_list)
	character.tail_style = tail_styles[tail_style]
	character.r_tail =     r_tail
	character.b_tail =     b_tail
	character.g_tail =     g_tail
	character.r_tail2 =    r_tail2
	character.b_tail2 =    b_tail2
	character.g_tail2 =    g_tail2
	character.r_tail3 =    r_tail3
	character.b_tail3 =    b_tail3
	character.g_tail3 =    g_tail3

	var/list/wing_styles = get_available_styles(global.wing_styles_list)
	character.wing_style = wing_styles[wing_style]
	character.r_wing =     r_wing
	character.b_wing =     b_wing
	character.g_wing =     g_wing
	character.r_wing2 =    r_wing2
	character.b_wing2 =    b_wing2
	character.g_wing2 =    g_wing2
	character.r_wing3 =    r_wing3
	character.b_wing3 =    b_wing3
	character.g_wing3 =    g_wing3

	character.set_gender(biological_gender)

	// Destroy/cyborgize organs and limbs.
	if (convert_to_prosthetics) //should only really be run for proteans
		var/list/organs_to_edit = list()
		for (var/name in list(BP_TORSO, BP_HEAD, BP_GROIN, BP_L_ARM, BP_R_ARM, BP_L_HAND, BP_R_HAND, BP_L_LEG, BP_R_LEG, BP_L_FOOT, BP_R_FOOT))
			var/obj/item/organ/external/O = character.organs_by_name[name]
			if (O)
				var/x = organs_to_edit.Find(O.parent_organ)
				if (x == 0)
					organs_to_edit += name
				else
					organs_to_edit.Insert(x+(O.robotic == ORGAN_NANOFORM ? 1 : 0), name)
		for(var/name in organs_to_edit)
			var/status = organ_data[name]
			var/obj/item/organ/external/O = character.organs_by_name[name]
			if(O)
				if(status == "amputated")
					continue
				else if(status == "cyborg")
					O.robotize(rlimb_data[name])
				else
					var/bodytype
					var/datum/species/selected_species = GLOB.all_species[species]
					if(selected_species.selects_bodytype)
						bodytype = custom_base
					else
						bodytype = selected_species.get_bodytype()
					var/dsi_company = GLOB.dsi_to_species[bodytype]
					if (!dsi_company)
						dsi_company = "DSI - Adaptive"
					O.robotize(dsi_company)

	for(var/N in character.organs_by_name)
		var/obj/item/organ/external/O = character.organs_by_name[N]
		O.markings.Cut()

	var/priority = 0
	for(var/M in body_markings)
		priority += 1
		var/datum/sprite_accessory/marking/mark_datum = body_marking_styles_list[M]

		for(var/BP in mark_datum.body_parts)
			var/obj/item/organ/external/O = character.organs_by_name[BP]
			if(O)
				O.markings[M] = list("color" = body_markings[M][BP]["color"], "datum" = mark_datum, "priority" = priority, "on" = body_markings[M][BP]["on"])
	character.markings_len = priority

	var/list/last_descriptors = list()
	if(islist(body_descriptors))
		last_descriptors = body_descriptors.Copy()
	body_descriptors = list()

	var/datum/species/mob_species = GLOB.all_species[species]
	if(LAZYLEN(mob_species.descriptors))
		for(var/entry in mob_species.descriptors)
			var/datum/mob_descriptor/descriptor = mob_species.descriptors[entry]
			if(istype(descriptor))
				if(isnull(last_descriptors[entry]))
					body_descriptors[entry] = descriptor.default_value // Species datums have initial default value.
				else
					body_descriptors[entry] = CLAMP(last_descriptors[entry], 1, LAZYLEN(descriptor.standalone_value_descriptors))
	character.descriptors = body_descriptors

	if (copy_flavour)
		character.flavor_texts["general"]	= flavor_texts["general"]
		character.flavor_texts["head"]		= flavor_texts["head"]
		character.flavor_texts["face"]		= flavor_texts["face"]
		character.flavor_texts["eyes"]		= flavor_texts["eyes"]
		character.flavor_texts["torso"]		= flavor_texts["torso"]
		character.flavor_texts["arms"]		= flavor_texts["arms"]
		character.flavor_texts["hands"]		= flavor_texts["hands"]
		character.flavor_texts["legs"]		= flavor_texts["legs"]
		character.flavor_texts["feet"]		= flavor_texts["feet"]
	if (copy_ooc_notes)
		character.ooc_notes 				= metadata

	character.weight			= weight_vr
	character.weight_gain		= weight_gain
	character.weight_loss		= weight_loss
	character.fuzzy				= fuzzy
	character.offset_override	= offset_override //CHOMPEdit
	character.voice_freq		= voice_freq
	character.resize(size_multiplier, animate = FALSE, ignore_prefs = TRUE)

	var/list/traits_to_copy = list(/datum/trait/neutral/tall,
									/datum/trait/neutral/taller,
									/datum/trait/neutral/short,
									/datum/trait/neutral/shorter,
									/datum/trait/neutral/obese,
									/datum/trait/neutral/fat,
									/datum/trait/neutral/thin,
									/datum/trait/neutral/thinner,
									/datum/trait/neutral/micro_size_down,
									/datum/trait/neutral/micro_size_up)
	//reset all the above trait vars
	if (character.species)
		character.species.micro_size_mod = 0
		character.species.icon_scale_x = 1
		character.species.icon_scale_y = 1
		for (var/trait in neu_traits)
			if (trait in traits_to_copy)
				var/datum/trait/instance = all_traits[trait]
				if (!instance)
					continue
				for (var/to_edit in instance.var_changes)
					character.species.vars[to_edit] = instance.var_changes[to_edit]
	character.update_transform()
	if(!voice_sound)
		character.voice_sounds_list = talk_sound
	else
	/* CHOMPREMOVAL, redundant list
		switch(voice_sound)
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
	*/ //CHOMPREMOVAL, redundant list
		character.voice_sounds_list = get_talk_sound(voice_sound)

	character.species?.blood_color = blood_color

	var/datum/species/selected_species = GLOB.all_species[species]
	var/bodytype_selected
	if(selected_species.selects_bodytype)
		bodytype_selected = custom_base
	else
		bodytype_selected = selected_species.get_bodytype(character)

	character.dna.base_species = bodytype_selected
	character.species.base_species = bodytype_selected
	character.species.vanity_base_fit = bodytype_selected
	if (istype(character.species, /datum/species/shapeshifter))
		wrapped_species_by_ref["\ref[character]"] = bodytype_selected

	character.custom_species	= custom_species
	character.custom_say		= lowertext(trim(custom_say))
	character.custom_ask		= lowertext(trim(custom_ask))
	character.custom_whisper	= lowertext(trim(custom_whisper))
	character.custom_exclaim	= lowertext(trim(custom_exclaim))

	character.digitigrade = selected_species.digi_allowed ? digitigrade : 0

	character.dna.ResetUIFrom(character)
	character.force_update_limbs()
	character.regenerate_icons()
