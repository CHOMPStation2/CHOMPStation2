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
	if(H.get_gender() == FEMALE)
		return list(
			"sound" = H.species.female_gasp_sound,
			"vol" = 60,
			"exr" = 10,
			"volchannel" = VOLUME_CHANNEL_INJ_DEATH
		)
	else
		return list(
			"sound" = H.species.male_gasp_sound,
			"vol" = 60,
			"exr" = 10,
			"volchannel" = VOLUME_CHANNEL_INJ_DEATH
		)
