/mob/living/simple_mob/mechanical/combat_drone
	projectiletype = /obj/item/projectile/energy/mob/drone

/mob/living/simple_mob/mechanical/combat_drone/lesser/aerostat
	desc = "A Vir System Authority automated combat drone with an aged apperance."
	movement_cooldown = 10
	say_list_type = /datum/say_list/malf_drone/drone_aerostat
	ai_holder_type = /datum/ai_holder/simple_mob/ranged/kiting/threatening/drone_aerostat

/datum/say_list/malf_drone/drone_aerostat
	speak = list("ALERT.","Hostile-ile-ile entities dee-twhoooo-wected.","Threat parameterszzzz- szzet.","Bring sub-sub-sub-systems uuuup to combat alert alpha-a-a.")
	emote_see = list("beeps menacingly","whirrs threateningly","scans its immediate vicinity")

	say_understood = list("Affirmative.", "Positive.")
	say_cannot = list("Denied.", "Negative.")
	say_maybe_target = list("Possible threat detected. Investigating.", "Motion detected.", "Investigating.")
	say_got_target = list("Threat detected.", "New task: Remove threat.", "Threat removal engaged.", "Engaging target.")
	say_threaten = list("This area is condemned by Vir System Authority. Please leave immediately. You have 20 seconds to comply.")
	say_stand_down = list("Visual lost.", "Error: Target not found.")
	say_escalate = list("Intruder is tresspassing. Maximum force authorized by Vir System Suthority.")
	threaten_sound = 'sound/mob/robots/DroneFreezeLong.ogg'
	stand_down_sound = 'sound/mob/robots/DroneLostTarget.ogg'

/datum/ai_holder/simple_mob/ranged/kiting/threatening/drone_aerostat
	threaten_delay = 10 SECOND
	threaten_timeout = 30 SECONDS
/* Combat refactor walkback
/mob/living/simple_mob/mechanical/combat_drone
	maxHealth = 25
	health = 25

/mob/living/simple_mob/mechanical/mining_drone
	maxHealth = 25
	health = 25

//Are this things close enough to drones?
/mob/living/simple_mob/mechanical/viscerator
	maxHealth = 7
	health = 7
*/
/obj/item/shield_projector/rectangle/automatic/drone
	shield_health = 75
	max_shield_health = 75
	shield_regen_delay = 10 SECONDS
	shield_regen_amount = 10
	size_x = 1
	size_y = 1
