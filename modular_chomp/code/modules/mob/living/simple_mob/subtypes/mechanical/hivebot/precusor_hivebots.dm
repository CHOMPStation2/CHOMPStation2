//This hivebots are meant to be high threats, and a tad more fitting of the alien places they tend to be in. Aka mini-bosses.

/mob/living/simple_mob/mechanical/hivebot/precusor
	name = "Precursor Hivebot"
	icon = 'modular_chomp/icons/mob/hivebot.dmi'
	icon_state = "precursorhive"
	icon_living = "precursorhive"
	attacktext = list("prodded")
	maxHealth = 3 LASERS_TO_KILL // 150 health
	health = 3 LASERS_TO_KILL
	movement_cooldown = 4
	melee_damage_lower = 15
	melee_damage_upper = 15

	var/obj/item/shield_projector/shields = null

	loot_list = list(/obj/item/prop/alien/junk = 20,
			/obj/item/prop/alien/junk = 20
			)

/mob/living/simple_mob/mechanical/hivebot/precusor/Initialize(mapload)
	shields = new /obj/item/shield_projector/rectangle/automatic/hivebot_drone(src)
	return ..()


/mob/living/simple_mob/mechanical/hivebot/precusor/machinegun
	projectiletype = /obj/item/projectile/bullet/hivebot
	base_attack_cooldown = 0 // Extremly rapid fire with rather weak bullets.

/mob/living/simple_mob/mechanical/hivebot/precusor/laser
	projectiletype = /obj/item/projectile/energy/mob/precursor
	projectile_dispersion = 5
	projectile_accuracy = -30

/mob/living/simple_mob/mechanical/hivebot/precusor/lobber
	projectiletype = /obj/item/projectile/arc/blue_energy/precusor


/obj/item/projectile/arc/blue_energy/precusor
	name = "energy missile"
	icon_state = "force_missile"
	armor_penetration = 10
	damage = 50 // Mimics the precusor laser damage and armor peircing with a tad more damage because of the lobbying style.
	damage_type = BURN
	color = "#A020F0"

/obj/item/shield_projector/rectangle/automatic/hivebot_drone
	shield_health = 100 //Old 50
	max_shield_health = 100 //Old 50
	shield_regen_delay = 5 SECONDS
	shield_regen_amount = 20
	size_x = 3
	size_y = 3
	color = "#A020F0"
	high_color = "#A020F0"
	low_color = "#A020F0"
