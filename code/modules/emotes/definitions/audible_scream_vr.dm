/decl/emote/audible/scream/get_emote_sound(var/atom/user)
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		// CHOMPEdit Start: Commenting out bc _ch calls parent.
		/*
		if(H.get_gender() == FEMALE)
			return list(
				"sound" = H.species.female_scream_sound,
				"vol" = emote_volume
			)
		else
			return list(
				"sound" = H.species.male_scream_sound,
				"vol" = emote_volume
		*/
		var/vol = H.species.scream_volume
		return list(
				"sound" = get_species_sound(get_gendered_sound(H))["scream"],
				"vol" = vol,
				"exr" = 20,
				"volchannel" = VOLUME_CHANNEL_SPECIES_SOUNDS
			)
