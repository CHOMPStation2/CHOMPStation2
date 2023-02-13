/mob/living/simple_mob/humanoid/cultist/human/bloodjaunt/fireball //Teleporting Cultists, now with fireballs
	name = "Burning Mage"
	desc = "An indiuval wrapped up in red robes, with orange highlights, their paws glowing.."
	icon_state = "fire-fluff"
	icon_living = "fire-fluff"
	special_attack_min_range = 4
	special_attack_max_range = 7
	special_attack_cooldown = 10 SECONDS

	harm_intent_damage = 5
	melee_damage_lower = 5
	melee_damage_upper = 10

	ai_holder_type = /datum/ai_holder/simple_mob/ranged
	projectiletype = /obj/item/projectile/energy/fireball

/mob/living/simple_mob/humanoid/cultist/noodle
	name = "Converted"
	desc = "An indiuval wrapped up in a makeshift rig, made from fallen cultist."
	icon_state = "cobra-cultist"
	icon_living = "cobra-cultist"
	maxHealth = 150
	health = 150

	faction = "cult"

	status_flags = 0

	response_help = "pokes"
	response_disarm = "shoves"
	response_harm = "hits"

	harm_intent_damage = 5
	melee_damage_lower = 15
	melee_damage_upper = 25
	attack_sharp = 1
	attack_edge = 1
	attacktext = list("slashed", "stabbed")
	armor = list(melee = 60, bullet = 40, laser = 60, energy = 80, bomb = 25, bio = 100, rad = 100)
	attack_sound = 'sound/weapons/rapidslice.ogg'
	movement_cooldown = 4
	projectiletype = /obj/item/projectile/energy/plasma/vepr
	projectilesound = 'sound/weapons/spiderlunge.ogg'
	movement_cooldown = 2
	ai_holder_type = /datum/ai_holder/simple_mob/ranged