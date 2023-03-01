/decl/emote/audible/scream/get_emote_sound(var/atom/user)
	..()
	if(ishuman(user))
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
	/* // Not sure if needed, screams are a carbon-only thing rn.
	else
		var/mob/living/M = user
		if((M.get_gender() == FEMALE) && female_scream_sound) // If our mob has custom sounds per-gender defined, most won't.
			return list(
				"sound" = female_scream_sound,
				"vol" = 60,
				"volchannel" = VOLUME_CHANNEL_INJ_DEATH
			)
		else if((M.get_gender() == MALE) && male_scream_sound) // If our mob has custom sounds per-gender defined, most won't.
			return list(
				"sound" = male_scream_sound,
				"vol" = 60,
				"volchannel" = VOLUME_CHANNEL_INJ_DEATH
			)
		else
			return list(
				"sound" = scream_sound,
				"vol" = 60,
				"volchannel" = VOLUME_CHANNEL_INJ_DEATH
			)
	*/
