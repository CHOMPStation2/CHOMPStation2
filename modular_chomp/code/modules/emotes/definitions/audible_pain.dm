/decl/emote/audible/pain
	key = "pain"
	emote_message_1p = "You yell in pain!"
	emote_message_3p = "yells in pain!"

/decl/emote/audible/pain/get_emote_message_1p(var/atom/user, var/atom/target, var/extra_params)
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		return "You [pick(H.species.pain_verb_1p)] in pain!"
	else
		var/mob/living/M = user
		if(M.pain_emote_1p) // Sanity
			return "You [pick(M.pain_emote_1p)]!"
	. = ..()

/decl/emote/audible/pain/get_emote_message_3p(var/atom/user, var/atom/target, var/extra_params)
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		return "[pick(H.species.pain_verb_3p)] in pain!"
	else
		var/mob/living/M = user
		if(M.pain_emote_3p) // Sanity
			return "[pick(M.pain_emote_3p)]!"
	. = ..()

/decl/emote/audible/pain/get_emote_sound(var/atom/user)
	..()
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(H.get_gender() == FEMALE)
			return list(
				"sound" = H.species.female_pain_sound,
				"vol" = 60,
				"exr" = 10,
				"volchannel" = VOLUME_CHANNEL_INJ_DEATH
			)
		else
			return list(
				"sound" = H.species.male_pain_sound,
				"vol" = 60,
				"exr" = 10,
				"volchannel" = VOLUME_CHANNEL_INJ_DEATH
			)
	else
		var/mob/living/M = user
		if((M.get_gender() == FEMALE) && M.female_pain_sound) // If our mob has custom sounds per-gender defined, most won't.
			return list(
				"sound" = M.female_pain_sound,
				"vol" = 80,
				"volchannel" = VOLUME_CHANNEL_INJ_DEATH
			)
		else if((M.get_gender() == MALE) && M.male_pain_sound) // If our mob has custom sounds per-gender defined, most won't.
			return list(
				"sound" = M.male_pain_sound,
				"vol" = 80,
				"volchannel" = VOLUME_CHANNEL_INJ_DEATH
			)
		else
			return list(
				"sound" = M.pain_sound,
				"vol" = 80,
				"volchannel" = VOLUME_CHANNEL_INJ_DEATH
			)
