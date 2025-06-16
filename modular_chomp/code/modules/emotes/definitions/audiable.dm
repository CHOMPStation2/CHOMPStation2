/decl/emote/audible/wheeze
	emote_sound = 'sound/voice/wheeze.ogg'

/decl/emote/audible/prbt2
	key = "prbt2"
	emote_message_1p = "You prbt."
	emote_message_3p = "prbts."
	emote_message_1p_target = "You prbt at TARGET."
	emote_message_3p_target = "prbts at TARGET."
	emote_sound = 'sound/voice/prbt2.ogg'

/decl/emote/audible/gasp/get_emote_sound(var/atom/user)
	..()
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		// CHOMPEdit: Standardize Species Sounds Getters
		var/vol = H.species.gasp_volume
		var/s = get_species_sound(get_gendered_sound(H))["gasp"]
		if(!s && !(get_species_sound(H.species.species_sounds) == "None")) // Failsafe, so we always use the default gasp/etc sounds. None will cancel out anyways.
			if(H.identifying_gender == FEMALE)
				s = get_species_sound("Human Female")["gasp"]
			else // Update this if we ever get herm/etc sounds.
				s = get_species_sound("Human Male")["gasp"]
		return list(
				"sound" = s,
				"vol" = vol,
				"volchannel" = VOLUME_CHANNEL_SPECIES_SOUNDS
			)

/decl/emote/audible/mgeow
	key = "mgeow"
	emote_message_1p = "You mgeow."
	emote_message_3p = "mgeows."
	emote_message_1p_target = "You mgeow at TARGET."
	emote_message_3p_target = "mgeow at TARGET."
	emote_sound = 'sound/voice/mgeow.ogg'

/decl/emote/audible/xenogrowl
	key = "xenogrowl"
	emote_message_1p = "You growl unnervingly."
	emote_message_3p = "growls unnervingly."
	emote_message_1p_target = "You growl unnervingly at TARGET."
	emote_message_3p_target = "growls unnervingly at TARGET."
	emote_sound = 'sound/voice/emotes/xenogrowl.ogg'

/decl/emote/audible/xenohiss
	key = "xenohiss"
	emote_message_1p = "You hiss unnervingly."
	emote_message_3p = "hisses unnervingly."
	emote_message_1p_target = "You hiss unnervingly at TARGET."
	emote_message_3p_target = "hisses unnervingly at TARGET."
	emote_sound = 'sound/voice/emotes/xenohiss.ogg'

/decl/emote/audible/xenopurr
	key = "xenopurr"
	emote_message_1p = "You purr unnervingly."
	emote_message_3p = "purrs unnervingly."
	emote_message_1p_target = "You purr unnervingly at TARGET."
	emote_message_3p_target = "purrs unnervingly at TARGET."
	emote_sound = 'sound/voice/emotes/xenopurr.ogg'

/decl/emote/audible/gwah
	key = "gwah"
	emote_message_1p = "You gwah."
	emote_message_3p = "gwahs."
	emote_message_1p_target = "You gwah at TARGET."
	emote_message_3p_target = "gwahs at TARGET."
	emote_sound = 'sound/voice/emotes/gwah.ogg'

/decl/emote/audible/caw
	key = "caw"
	emote_message_1p = "You caw!"
	emote_message_3p = "caws!"
	emote_message_1p_target = "You caw at TARGET."
	emote_message_3p_target = "caws at TARGET."
	emote_sound = 'sound/voice/emotes/caw.ogg' // Copyright Sampling+ 1.0 Vixuxx (freesound.org) for the source audio.

/decl/emote/audible/wawa
	key = "wawa"
	emote_message_1p = "You wawa."
	emote_message_3p = "wawas."
	emote_message_1p_target = "You wawa at TARGET."
	emote_message_3p_target = "wawas at TARGET."
	emote_sound = 'sound/voice/emotes/wawa.ogg'

/decl/emote/audible/scientist //placeholder, do not use in anything
	key = "hlscientist"
	emote_message_3p = "does science."

/decl/emote/audible/scientist/scream
	key = "hlscream"
	emote_message_1p = "You scream."
	emote_message_3p = "screams."
	emote_message_1p_target = "You scream at TARGET."
	emote_message_3p_target = "screams at TARGET."
	emote_sound = list (
		'sound/voice/scream/scientist/scream01.ogg',
		'sound/voice/scream/scientist/scream02.ogg',
		'sound/voice/scream/scientist/scream06.ogg',
		'sound/voice/scream/scientist/scream08.ogg',
		'sound/voice/scream/scientist/scream25.ogg',
	)

/decl/emote/audible/scientist/pain
	key = "hlpain"
	emote_message_1p = "You shout in pain."
	emote_message_3p = "shouts in pain."
	emote_message_1p_target = "You shout in pain at TARGET."
	emote_message_3p_target = "shouts in pain at TARGET."
	emote_sound = list (
		'sound/voice/pain/scientist/sci_pain1.ogg',
		'sound/voice/pain/scientist/sci_pain4.ogg',
		'sound/voice/pain/scientist/sci_pain5.ogg',
	)

/decl/emote/audible/scientist/get_emote_sound(var/atom/user)
	. = ..()
	.["vol"] *= 0.4 //these boys are pretty loud on their own lol

/decl/emote/audible/yip // sounds sourced from: https://introdile.itch.io/kobold-generator with permission from the creator
	key = "yip"
	emote_message_1p = "You yip."
	emote_message_3p = "yips!"
	emote_message_1p_target = "You yip at TARGET!"
	emote_message_3p_target = "yips at TARGET!"
	emote_sound = list (
		'sound/voice/emotes/yip1.ogg',
		'sound/voice/emotes/yip2.ogg',
		'sound/voice/emotes/yip3.ogg',
	)

/decl/emote/audible/squeal // Sound sourced from: https://github.com/Baystation12/Baystation12/blob/bd2f0bd5e38cf2bb0888e3ae879708bed20243b4/sound/voice/LizardSqueal.ogg, licensed Creative Commons 3.0 BY-SA.
	key = "squeal"
	emote_message_1p = "You squeal."
	emote_message_3p = "squeals."
	emote_message_1p_target = "You squeal at TARGET."
	emote_message_3p_target = "squeals at TARGET."
	emote_sound = 'sound/voice/emotes/squealemote.ogg'

/decl/emote/audible/tailthump // Sound sourced from https://freesound.org/s/389665/ Licensed Creative Commons 0
	key = "tailthump"
	emote_message_1p = "You thump your tail."
	emote_message_3p = "thumps their tail."
	emote_message_1p_target = "You thump your tail at TARGET."
	emote_message_3p_target = "thumps their tail at TARGET."
	emote_sound = 'sound/voice/emotes/tailthumpemote.ogg'
