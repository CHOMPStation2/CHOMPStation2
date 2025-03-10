/decl/emote/audible/cough
	key = "cough"
	emote_message_1p = "You cough!"
	emote_message_1p_target = "You cough on TARGET!"
	emote_message_3p = "coughs!"
	emote_message_3p_target = "coughs on TARGET!"
	emote_message_synthetic_1p_target = "You emit a robotic cough towards TARGET."
	emote_message_synthetic_1p = "You emit a robotic cough."
	emote_message_synthetic_3p_target = "emits a robotic cough towards TARGET."
	emote_message_synthetic_3p = "emits a robotic cough."
	emote_volume = 120
	emote_volume_synthetic = 50

	conscious = FALSE
<<<<<<< HEAD
// CHOMPEdit Start: Standardize Species Sounds
	// emote_sound_synthetic = list()
=======
	emote_sound_synthetic = list(
		FEMALE = list(
			'sound/effects/mob_effects/f_machine_cougha.ogg',
			'sound/effects/mob_effects/f_machine_coughb.ogg'
		),
		MALE = list(
			'sound/effects/mob_effects/m_machine_cougha.ogg',
			'sound/effects/mob_effects/m_machine_coughb.ogg',
			'sound/effects/mob_effects/m_machine_coughc.ogg'
		),
		NEUTER = list(
			'sound/effects/mob_effects/m_machine_cougha.ogg',
			'sound/effects/mob_effects/m_machine_coughb.ogg',
			'sound/effects/mob_effects/m_machine_coughc.ogg'
		),
		PLURAL = list(
			'sound/effects/mob_effects/m_machine_cougha.ogg',
			'sound/effects/mob_effects/m_machine_coughb.ogg',
			'sound/effects/mob_effects/m_machine_coughc.ogg'
		)
	)
>>>>>>> 1def015bad (end of file Fix (#17308))

/decl/emote/audible/cough/get_emote_sound(var/atom/user)
	if(ishuman(user) && !check_synthetic(user))
		var/mob/living/carbon/human/H = user
<<<<<<< HEAD
		var/vol = H.species.cough_volume
		var/s = get_species_sound(get_gendered_sound(H))["cough"]
		if(!s && !(get_species_sound(H.species.species_sounds) == "None")) // Failsafe, so we always use the default cough/etc sounds. None will cancel out anyways.
			if(H.identifying_gender == FEMALE)
				s = get_species_sound("Human Female")["cough"]
			else // Update this if we ever get herm/etc sounds.
				s = get_species_sound("Human Male")["cough"]
		return list(
				"sound" = s,
				"vol" = vol,
				"volchannel" = VOLUME_CHANNEL_SPECIES_SOUNDS
			)
	if(check_synthetic(user))
		return list(
			"sound" = get_species_sound("Robotic")["cough"],
			"vol" = emote_volume,
			"volchannel" = VOLUME_CHANNEL_SPECIES_SOUNDS
		)
// CHOMPEdit End
=======
		if(H.get_gender() == FEMALE)
			if(length(H.species.female_cough_sounds))
				return list(
					"sound" = H.species.female_cough_sounds,
					"vol" = emote_volume
				)
		else
			if(length(H.species.male_cough_sounds))
				return list(
					"sound" = H.species.male_cough_sounds,
					"vol" = emote_volume
				)
>>>>>>> 1def015bad (end of file Fix (#17308))
	return ..()
