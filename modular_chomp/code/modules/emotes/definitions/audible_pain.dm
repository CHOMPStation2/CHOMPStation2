/decl/emote/audible/pain
	key = "pain"
	emote_message_1p = "You yell in pain!"
	emote_message_3p = "yells in pain!"

/decl/emote/audible/pain/get_emote_message_1p(var/atom/user, var/atom/target, var/extra_params)
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		return "You [pick(H.species.pain_verb_1p)] in pain!"
	. = ..()

/decl/emote/audible/pain/get_emote_message_3p(var/atom/user, var/atom/target, var/extra_params)
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		return "[pick(H.species.pain_verb_3p)] in pain!"
	. = ..()

/decl/emote/audible/pain/get_emote_sound(var/atom/user)
	..()
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
