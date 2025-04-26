/mob/living/simple_mob/mechanical/infectionbot //This literally just adds onto the base robot at /code/modules/mob/living/simple_mob/subtypes/mechanical/disbot_vr.dm
	say_list_type = /datum/say_list/disbot
	ai_holder_type = /datum/ai_holder/simple_mob/melee/disbot


/datum/say_list/disbot
	threaten_sound = 'sound/mob/robots/infector.ogg'

/datum/ai_holder/simple_mob/melee/disbot
	threaten = TRUE
	threaten_delay = 1 SECOND
	threaten_timeout = 30 SECONDS
