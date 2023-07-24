/decl/emote/audible/wheeze
	emote_sound = 'modular_chomp/sound/voice/wheeze.ogg'

/decl/emote/audible/prbt2
	key = "prbt2"
	emote_message_1p = "You prbt."
	emote_message_3p = "prbts."
	emote_message_1p_target = "You prbt at TARGET."
	emote_message_3p_target = "prbts at TARGET."
	emote_sound = 'sound/voice/prbt2.ogg'

/decl/emote/audible/gasp/get_emote_sound(var/atom/user)
	..()
	var/mob/living/carbon/human/H = user
	// CHOMPEdit: Standardize Species Sounds Getters
	var/vol = H.species.gasp_volume
	var/s = get_species_sound(get_gendered_sound(H))["gasp"]
	if(!s && !(get_species_sound(H.species.species_sounds) == "None")) // Failsafe, so we always use the default gasp/etc sounds. None will cancel out anyways.
		if(H.identifying_gender == FEMALE)
			s = get_species_sound("Human Female")["gasp"]
		else // Update this if we ever get herm/etc sounds.
			s = get_species_sound("Human Male")["gasp"]
	return list(
			"sound" = s,
			"vol" = vol,
			"volchannel" = VOLUME_CHANNEL_SPECIES_SOUNDS
		)

/decl/emote/audible/mgeow
	key = "mgeow"
	emote_message_1p = "You mgeow."
	emote_message_3p = "mgeows."
	emote_message_1p_target = "You mgeow at TARGET."
	emote_message_3p_target = "mgeow at TARGET."
	emote_sound = 'modular_chomp/sound/voice/mgeow.ogg'