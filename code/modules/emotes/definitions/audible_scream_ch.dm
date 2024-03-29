/decl/emote/audible/scream/get_emote_sound(var/atom/user)
	..()
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		var/vol = H.species.scream_volume
		return list(
				"sound" = get_species_sound(get_gendered_sound(H))["scream"],
				"vol" = vol,
				"exr" = 20,
				"volchannel" = VOLUME_CHANNEL_SPECIES_SOUNDS
			)
	/* // Not sure if needed, screams are a carbon-only thing rn.
	else
		var/mob/living/M = user
		if((M.get_gender() == FEMALE) && female_scream_sound) // If our mob has custom sounds per-gender defined, most won't.
			return list(
				"sound" = female_scream_sound,
				"vol" = 60,
				"volchannel" = VOLUME_CHANNEL_SPECIES_SOUNDS
			)
		else if((M.get_gender() == MALE) && male_scream_sound) // If our mob has custom sounds per-gender defined, most won't.
			return list(
				"sound" = male_scream_sound,
				"vol" = 60,
				"volchannel" = VOLUME_CHANNEL_SPECIES_SOUNDS
			)
		else
			return list(
				"sound" = scream_sound,
				"vol" = 60,
				"volchannel" = VOLUME_CHANNEL_SPECIES_SOUNDS
			)
	*/

/decl/emote/audible/malehumanscream
	key = "malehumanscream"
	emote_message_3p = "screams!"
	emote_sound = 'sound/voice/malescream_2.ogg'
