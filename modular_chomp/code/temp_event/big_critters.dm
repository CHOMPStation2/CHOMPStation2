/mob/living/simple_mob/mechanical/mecha/eclipse/occult
	name = "Occult Construct"
	desc = "A strange robotic creature."
	health = 4500
	maxHealth = 4500

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


/obj/item/projectile/energy/event_mob/inversion
	name = "blood bolt"
	icon_state = "red_pellet"
	damage = 8
	armor_penetration = 100
	speed = 6

/obj/item/projectile/energy/event_mob/inversion/short
	range = 5


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
	spread_range = 3
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
	speed = 6

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
	speed = 6

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


/mob/living/simple_mob/vore/fossiltank/mark_two
	name = "rolling crematorium mark 2 prototype"
	desc = "A large metal tank."
	health = 800
	maxHealth = 800
	armor = list(melee = 75, bullet = 75, laser = 75, energy = 75, bomb = 0, bio = 100, rad = 100)
	size_multiplier = 3
	damage_fatigue_mult = 0
	movement_cooldown = 15
	special_attack_cooldown = 20 SECONDS
	status_flags = null

/mob/living/simple_mob/vore/fossiltank/mark_two/handle_special()
	if(stat != DEAD)
		flame_aura()
	..()

/mob/living/simple_mob/vore/fossiltank/mark_two/proc/flame_aura()
	adjustBruteLoss(-15)
	adjustFireLoss(-15)
	adjustToxLoss(-15)
	adjustOxyLoss(-15)
	for(var/mob/living/L in view(src, 5))
		if(L.stat != DEAD || !IIsAlly(L))
			L.ignite_mob()

/mob/living/simple_mob/vore/fossiltank/mark_two/do_special_attack(atom/A)
	for(var/mob/living/L in view(src, 25))
		if(L.stat != DEAD || !IIsAlly(L))
			L.add_modifier(/datum/modifier/mmo_drop/fossil_tank, 3, src)

/datum/modifier/mmo_drop/fossil_tank
	puddleitem = /obj/item/grenade/shooter/auto_explode/astral_firebomb

/obj/item/grenade/shooter/auto_explode/astral_firebomb
	spread_range = 3
	projectile_types = list(/obj/item/projectile/energy/astral_collective/flame)
