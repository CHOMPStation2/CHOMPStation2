/mob/living/simple_mob/horror/Master/aerostat

	say_list_type = /datum/say_list/cyber_horror/master
	ai_holder_type = /datum/ai_holder/simple_mob/ranged/kiting/horrormaster //The final boss of every Gradius game

/datum/say_list/cyber_horror/master
	threaten_sound = 'sound/mob/robots/MasterSee.ogg'

/datum/ai_holder/simple_mob/ranged/kiting/horrormaster
	threaten = TRUE
	threaten_delay = 1 SECOND
	threaten_timeout = 30 SECONDS
