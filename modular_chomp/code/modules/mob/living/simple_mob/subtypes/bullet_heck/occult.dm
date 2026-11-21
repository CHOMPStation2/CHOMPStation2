/mob/living/simple_mob/mechanical/mecha/eclipse/occult
	name = "Occult Construct"
	desc = "A strange robotic creature."
	health = 900
	maxHealth = 900

	armor = list(melee = 30, bullet = 30, laser = 30, energy = 30, bomb = 30, bio = 100, rad = 100)

	mob_class = MOB_CLASS_ABERRATION
	pilot_type = /mob/living/simple_mob/humanoid/cultist/tesh
	wreckage = /obj/item/cell/device/weapon/recharge/cult

	faction = FACTION_CULT

	icon_state = "bloodguardian"
	icon_living = "bloodguardian"

	icon = 'icons/mob/ghost.dmi'

	size_multiplier = 2.5
	movement_cooldown = 4

	projectiletype = /obj/item/projectile/energy/blood_bullet

	loot_list = list(/obj/item/stock_parts/scanning_module/omni = 80,
		/obj/item/stock_parts/micro_laser/omni = 80,
		/obj/item/stock_parts/capacitor/omni = 80,
		/obj/item/stock_parts/manipulator/omni = 80,
		/obj/item/stock_parts/matter_bin/omni = 80,
		/obj/item/stock_parts/scanning_module/hyper = 80,
		/obj/item/stock_parts/micro_laser/hyper = 80,
		/obj/item/stock_parts/capacitor/hyper = 80,
		/obj/item/stock_parts/manipulator/hyper = 80,
		/obj/item/stock_parts/matter_bin/hyper = 80,
		/obj/item/prop/deconstructable/gigacell = 100
		)


/obj/item/projectile/energy/blood_bullet
	name = "blood bolt"
	icon_state = "red_pellet"
	damage = 8 //A little more then 12 hits to kill
	armor_penetration = 60 //And due to the low low base damage, will ignore most armors
	speed = 8
	crawl_destroy = TRUE
	hits_phased = TRUE //because the wierd redspace stuff being able to touch the other extradimensional thing seems intresting

/mob/living/simple_mob/mechanical/mecha/eclipse/occult
	icon_state = "bloodguardian"
	icon_living = "bloodguardian"
	specialattackprojectile = /obj/item/projectile/energy/blood_bullet

/mob/living/simple_mob/mechanical/mecha/eclipse/occult/do_special_attack(atom/A)
	rng_cycle = rand(1,2)
	switch(attackcycle)
		if(1)
			addtimer(CALLBACK(src, PROC_REF(summon_puddles), A, 3, /datum/modifier/mmo_drop/lingering/blood_flower), 0.5 SECONDS, TIMER_DELETE_ME)
			attackcycle = 0
		if(2)
			addtimer(CALLBACK(src, PROC_REF(summon_puddles), A, 3, /datum/modifier/mmo_drop/occult_fireball), 0.5 SECONDS, TIMER_DELETE_ME)
			attackcycle = 0
		if(3)
			addtimer(CALLBACK(src, PROC_REF(cross_spin), A, rng_cycle, 3), 1.5 SECONDS, TIMER_DELETE_ME)
			attackcycle = 0
