/mob/living/simple_mob/vore/smokestar
	name = "strange creature"
	desc = "What is that?"
	icon = 'modular_chomp/icons/mob/smokestar.dmi'
	icon_state = "drone0"
	icon_living = "drone0"
	icon_dead = "drone0"

	mob_class = MOB_CLASS_ABERRATION
	ai_holder_type = /datum/ai_holder/simple_mob/melee

	faction = "smokestar"

	maxHealth = 200
	health = 200
	movement_cooldown = 0
	melee_attack_delay = 1.5 SECOND
	can_be_drop_prey = TRUE
	unsuitable_atoms_damage = 0
	melee_miss_chance = 0
	hovering = TRUE
	pass_flags = PASSTABLE

	melee_damage_lower = 8
	melee_damage_upper = 15
	damage_fatigue_mult = 0
	armor = list(
				"melee"		= 30,
				"bullet"	= 30,
				"laser"		= 30,
				"energy"	= 30,
				"bomb"		= 30,
				"bio"		= 100,
				"rad"		= 100
				)

/*
/mob/living/simple_mob/vore/smokestar/wendigo
/mob/living/simple_mob/vore/smokestar/behemoth
/mob/living/simple_mob/vore/smokestar/banshee
*/

//All the Ai and such is place holder.
/mob/living/simple_mob/vore/smokestar/drider
	icon_state = "drideralive"
	icon_living = "drideralive"
	icon_dead = "driderdead"

	glow_color = "#1F000F"
	light_color = "#1F000F"
	glow_range = 5
	glow_intensity = -1
	ai_holder_type = /datum/ai_holder/simple_mob/melee/hit_and_run
