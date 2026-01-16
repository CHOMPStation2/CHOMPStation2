/mob/living/simple_mob/mechanical/mecha/eclipse/bomb_mauler
	name = "damaged mauler"
	desc = "A strange robotic creature."
	health = 700
	maxHealth = 700

	armor = list(melee = 30, bullet = 30, laser = 30, energy = 30, bomb = 30, bio = 100, rad = 100)

	pilot_type = /mob/living/simple_mob/humanoid/merc/melee/sword/space
	wreckage = /obj/structure/loot_pile/mecha/gygax/dark/adv

	icon = 'icons/mecha/mecha.dmi'
	icon_state = "mauler"
	icon_living = "mauler"

	size_multiplier = 1.5
	movement_cooldown = 4

	faction = FACTION_SYNDICATE

	specialattackprojectile = /obj/item/projectile/energy/merc_boss

	projectiletype = /obj/item/projectile/energy/merc_boss

	loot_list = list(/obj/item/melee/energy/sword/dualsaber = 100,
		/obj/item/stock_parts/scanning_module/omni = 80,
		/obj/item/stock_parts/micro_laser/omni = 80,
		/obj/item/stock_parts/capacitor/omni = 80,
		/obj/item/stock_parts/manipulator/omni = 80,
		/obj/item/stock_parts/matter_bin/omni = 80,
		/obj/item/stock_parts/scanning_module/hyper = 80,
		/obj/item/stock_parts/micro_laser/hyper = 80,
		/obj/item/stock_parts/capacitor/hyper = 80,
		/obj/item/stock_parts/manipulator/hyper = 80,
		/obj/item/stock_parts/matter_bin/hyper = 80,
		/obj/item/prop/deconstructable/gigacell = 100,
		)


/obj/item/projectile/energy/merc_boss
	name = "phoronic bolt"
	icon_state = "arcane_barrage"
	icon_state = "red_pellet"
	check_armour = "laser"
	damage = 30
	armor_penetration = 0
	speed = 8
	crawl_destroy = TRUE

/mob/living/simple_mob/mechanical/mecha/eclipse/bomb_mauler/do_special_attack(atom/A)
	rng_cycle = rand(1,2)
	switch(attackcycle)
		if(1)
			addtimer(CALLBACK(src, PROC_REF(bomb_lines), A, 3), 0.5 SECONDS, TIMER_DELETE_ME)
			attackcycle = 0
		if(2)
			addtimer(CALLBACK(src, PROC_REF(bomb_chaos), A, 3, 5), 0.5 SECONDS, TIMER_DELETE_ME)
			attackcycle = 0
		if(3)
			addtimer(CALLBACK(src, PROC_REF(gattlingfire), A, rng_cycle, 9, 2), 0.5 SECONDS, TIMER_DELETE_ME)
			attackcycle = 0
