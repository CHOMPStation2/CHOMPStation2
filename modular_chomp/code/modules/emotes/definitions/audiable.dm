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
	return list(
			"sound" = get_species_sound(get_gendered_sound(H))["gasp"],
			"vol" = vol,
			"volchannel" = VOLUME_CHANNEL_SPECIES_SOUNDS
		)
