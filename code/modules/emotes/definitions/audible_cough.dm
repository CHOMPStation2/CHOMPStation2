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
// CHOMPEdit Start: Standardize Species Sounds
	// emote_sound_synthetic = list()

/decl/emote/audible/cough/get_emote_sound(var/atom/user)
	if(ishuman(user) && !check_synthetic(user))
		var/mob/living/carbon/human/H = user
		var/vol = H.species.cough_volume
		return list(
				"sound" = get_species_sound(get_gendered_sound(H))["cough"],
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
	return ..()
