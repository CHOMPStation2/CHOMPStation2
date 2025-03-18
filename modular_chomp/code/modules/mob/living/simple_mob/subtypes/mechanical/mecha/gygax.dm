/mob/living/simple_mob/mechanical/mecha/combat/gygax
	movement_cooldown = 0 //Because normal Gygaxes are tougher then ths boss version with 0 speed
	projectiletype = /obj/item/projectile/energy/mob/midlaser

/mob/living/simple_mob/mechanical/mecha/combat/gygax/dark/advanced
	movement_cooldown = -2 //Because AADG needs all the help it can get.

/mob/living/simple_mob/mechanical/mecha/combat/gygax/aerostat
	desc = "A Vir System Authority automated combat mech with an aged apperance."
	ai_holder_type = /datum/ai_holder/simple_mob/intentional/adv_dark_gygax
	say_list = /datum/say_list/gygax_aerostat

/datum/say_list/gygax_aerostat
	speak = list("ALERT.","Hostile-ile-ile entities dee-twhoooo-wected.","Threat parameterszzzz- szzet.","Bring sub-sub-sub-systems uuuup to combat alert alpha-a-a.")
	emote_see = list("beeps menacingly","whirrs threateningly","scans its immediate vicinity")

	say_understood = list("Affirmative.", "Positive.")
	say_cannot = list("Denied.", "Negative.")
	say_maybe_target = list("Possible threat detected. Investigating.", "Motion detected.", "Investigating.")
	say_got_target = list("Threat detected.", "New task: Remove threat.", "Threat removal engaged.", "Engaging target.")
	say_threaten = list("This area is condemned by Vir System Authority. Please leave immediately. You have 20 seconds to comply.")
	say_stand_down = list("Visual lost.", "Error: Target not found.")
	say_escalate = list("Intruder is tresspassing. Maximum force authorized by Vir System Suthority.")
	threaten_sound = 'modular_chomp/sound/mob/robots/GygaxIntruder4.ogg'
	stand_down_sound = 'modular_chomp/sound/mob/robots/GygaxDanger.ogg'

/datum/ai_holder/simple_mob/ranged/kiting/threatening/drone_aerostat
	threaten_delay = 20 SECOND
	threaten_timeout = 30 SECONDS
