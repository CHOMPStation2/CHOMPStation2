/mob/living/simple_mob/mechanical/mecha/eclipse/occult
	name = "Occult Construct"
	desc = "A strange robotic creature."
	health = 1000
	maxHealth = 1000

	wreckage = /obj/item/soulstone
	mob_class = MOB_CLASS_ABERRATION
	pilot_type = /mob/living/simple_mob/humanoid/cultist/tesh
	wreckage = /obj/item/cell/device/weapon/recharge/cult

	icon_state = "lightguardian"
	icon_living = "lightguardian"

	icon = 'icons/mob/ghost.dmi'

	loot_list = list(/obj/item/stock_parts/scanning_module/omni = 80,
		/obj/item/stock_parts/micro_laser/omni = 80,
		/obj/item/stock_parts/capacitor/omni = 80,
		/obj/item/stock_parts/manipulator/omni = 80,
		/obj/item/stock_parts/matter_bin/omni = 80,
		/obj/item/stock_parts/scanning_module/hyper = 80,
		/obj/item/stock_parts/micro_laser/hyper = 80,
		/obj/item/stock_parts/capacitor/hyper = 80,
		/obj/item/stock_parts/manipulator/hyper = 80,
		/obj/item/stock_parts/matter_bin/hyper = 80
		)

	armor = list(
				"melee" = 0,
				"bullet" = 0,
				"laser" = 0,
				"energy" = 0,
				"bomb" = 0,
				"bio" = 100,
				"rad" = 100
				)

/obj/item/projectile/energy/event_mob/inversion
	name = "blood bolt"
	icon_state = "red_pellet"
	damage = 8
	armor_penetration = 100
	range = 14
	speed = 8

/obj/item/projectile/energy/event_mob/inversion/short
	range = 3

/obj/item/projectile/energy/event_mob/inversion/short/spawner

/obj/item/projectile/energy/event_mob/inversion/short/spawner/on_range()
	new /obj/item/grenade/shooter/auto_explode/blood_bossB(src)

/mob/living/simple_mob/mechanical/mecha/eclipse/occult/blood
	icon_state = "bloodguardian"
	icon_living = "bloodguardian"
	specialattackprojectile = /obj/item/projectile/energy/event_mob/inversion

/mob/living/simple_mob/mechanical/mecha/eclipse/occult/blood/do_special_attack(atom/A)
	rng_cycle = rand(1,4)
	switch(attackcycle)
		if(1)
			addtimer(CALLBACK(src, PROC_REF(summon_puddles), A, rng_cycle, /datum/modifier/mmo_drop/blood_flower), 0.5 SECONDS, TIMER_DELETE_ME)
			attackcycle = 0
		if(2)
			addtimer(CALLBACK(src, PROC_REF(dual_spin), A, rng_cycle, 5), 1.5 SECONDS, TIMER_DELETE_ME)
			attackcycle = 0
		if(3)
			addtimer(CALLBACK(src, PROC_REF(cross_spin), A, rng_cycle, 3), 1.5 SECONDS, TIMER_DELETE_ME)
			attackcycle = 0
		if(4)
			addtimer(CALLBACK(src, PROC_REF(bullet_blossom), A, rng_cycle, 8), 1.5 SECONDS, TIMER_DELETE_ME)
			attackcycle = 0

/obj/item/grenade/shooter/auto_explode/blood_bossA
	spread_range = 1
	projectile_types = list(/obj/item/projectile/energy/event_mob/inversion/short/spawner)

/obj/item/grenade/shooter/auto_explode/blood_bossB
	spread_range = 1
	projectile_types = list(/obj/item/projectile/energy/event_mob/inversion/short)

/datum/modifier/mmo_drop/blood_flower
	puddleitem = /obj/item/grenade/shooter/auto_explode/blood_bossA

/mob/living/simple_mob/mechanical/mecha/eclipse/occult/orange
	icon_state = "magicOrange"
	icon_living = "magicOrange"
	specialattackprojectile = /obj/item/projectile/energy/event_mob/fire_bolt

/obj/item/projectile/energy/event_mob/fire_bolt
	name = "fireball"
	icon_state = "fireball"
	incendiary = 1
	damage = 5
	armor_penetration = 50
	range = 14
	speed = 10

/mob/living/simple_mob/mechanical/mecha/eclipse/occult/orange/do_special_attack(atom/A)
	rng_cycle = rand(1,4)
	switch(attackcycle)
		if(1)
			addtimer(CALLBACK(src, PROC_REF(hole_in_wall), A, rng_cycle, 8), 0.5 SECONDS, TIMER_DELETE_ME)
			attackcycle = 0
		if(2)
			addtimer(CALLBACK(src, PROC_REF(rising_star), A, rng_cycle, 5), 0.5 SECONDS, TIMER_DELETE_ME)
			attackcycle = 0
		if(3)
			addtimer(CALLBACK(src, PROC_REF(gattlingfire), A, rng_cycle, 10, 3), 0.5 SECONDS, TIMER_DELETE_ME)
			attackcycle = 0
		if(4)
			addtimer(CALLBACK(src, PROC_REF(bullet_blossom), A, rng_cycle, 8), 0.5 SECONDS, TIMER_DELETE_ME)
			attackcycle = 0

/mob/living/simple_mob/mechanical/mecha/eclipse/occult/pink
	icon_state = "magicPink"
	icon_living = "magicPink"
	specialattackprojectile = /obj/item/projectile/energy/event_mob/arcane_bolt

/obj/item/projectile/energy/event_mob/arcane_bolt
	name = "energy bolt"
	icon_state = "arcane_barrage"
	damage = 10
	armor_penetration = 50
	range = 14
	speed = 10

/mob/living/simple_mob/mechanical/mecha/eclipse/occult/pink/do_special_attack(atom/A)
	rng_cycle = rand(1,4)
	switch(attackcycle)
		if(1)
			addtimer(CALLBACK(src, PROC_REF(bomb_lines), A, rng_cycle), 0.5 SECONDS, TIMER_DELETE_ME)
			attackcycle = 0
		if(2)
			addtimer(CALLBACK(src, PROC_REF(bomb_chaos), A, rng_cycle, 5), 0.5 SECONDS, TIMER_DELETE_ME)
			attackcycle = 0
		if(3)
			addtimer(CALLBACK(src, PROC_REF(gattlingfire), A, rng_cycle, 6, 1), 0.5 SECONDS, TIMER_DELETE_ME)
			attackcycle = 0
		if(4)
			addtimer(CALLBACK(src, PROC_REF(quad_random_firing), A, rng_cycle, 4, 7), 0.5 SECONDS, TIMER_DELETE_ME)
			attackcycle = 0
