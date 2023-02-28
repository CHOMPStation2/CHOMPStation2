/decl/emote/audible/scream/get_emote_sound(var/atom/user)
	..()
	var/mob/living/carbon/human/H = user
	if(H.get_gender() == FEMALE)
		return list(
			"sound" = H.species.female_scream_sound,
			"vol" = 60,
			"exr" = 20,
			"volchannel" = VOLUME_CHANNEL_INJ_DEATH
		)
	else
		return list(
			"sound" = H.species.male_scream_sound,
			"vol" = 60,
			"exr" = 20,
			"volchannel" = VOLUME_CHANNEL_INJ_DEATH
		)
