/mob/living/simple_mob/mechanical/mecha/eclipse/tyrbosses
	faction = FACTION_TYR
	icon = 'modular_chomp/icons/mob/tyr.dmi'
	size_multiplier = 2
	swallowTime = 2 SECONDS
	vore_active = 1
	vore_capacity = 5
	vore_bump_chance = 10
	vore_stomach_name = "Stomach"
	vore_default_item_mode = IM_DIGEST
	vore_pounce_chance = 50
	vore_pounce_cooldown = 10
	vore_pounce_successrate	= 75
	vore_pounce_falloff = 0
	vore_pounce_maxhealth = 100
	vore_standing_too = TRUE
	unacidable = TRUE

	projectiletype = /obj/item/projectile/energy/eclipse_boss/tyrjavelin
	specialattackprojectile = /obj/item/projectile/energy/eclipse_boss/tyrjavelin

	loot_list = list(/obj/item/gun/energy/tyr_rifle  = 30,
		/obj/item/tool/wirecutters/hybrid/alien  = 30,
		/obj/item/tool/wrench/hybrid/alien  = 30,
		/obj/item/tool/crowbar/hybrid/alien  = 30,
		/obj/item/tool/screwdriver/hybrid/alien  = 30,
		/obj/item/pickaxe/diamonddrill/alien = 30,
		/obj/item/shield_projector/rectangle/automatic/tyrbarrier = 0.1,
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
		/obj/item/reagent_containers/food/snacks/meat = 100,
		/obj/item/melee/energy/tyr_sabre = 30,
		/obj/item/melee/energy/tyr_hammer = 30,
		/obj/item/melee/energy/tyr_katar = 30,
		/obj/item/prop/deconstructable/gigacell = 100,
		)

//So tyr mobs, Two types, the robots, and the expirments.
//Expirments will have less health but some defensive mechanic or the like
/mob/living/simple_mob/mechanical/mecha/eclipse/tyrbosses/ai_cores
	health = 3300
	maxHealth = 3300 //TG has megafauna with 2500 HP. Yet to see folks call those overly tanky. Tyr gun can deal 504 with a full clip of the single shot mode. Wanting longer fights, and this are meant for groups of three

/mob/living/simple_mob/mechanical/mecha/eclipse/tyrbosses/expirments
	mob_class = MOB_CLASS_ABERRATION
	health = 2100
	maxHealth = 2100
	armor = list(melee = 30, bullet = 30, laser = 30, energy = 30, bomb = 30, bio = 100, rad = 100)
	movement_cooldown = 40

//Watch the ground. No seriously, 2/3s of it is glowing red
//phase 1 is rather simple, simple lines, bomb drop, limit the area, then another bomb drop
//phase 2 the normal BH stuff is gone. Arti lines of plus or X, then bomb drop, then randomized arti, then another bomb drop
//phase 3 alters things. Random arti, x or plus arti, bomb drop, bomb drop
//each phase speeds things up
/mob/living/simple_mob/mechanical/mecha/eclipse/tyrbosses/ai_cores/sec_core
	name = "defense core"
	desc = "A mechanical weaponized ai core."
	icon_state = "sec_core"
	icon_living = "sec_core"
	projectiletype = /obj/item/projectile/bullet/astral_blade
	specialattackprojectile = /obj/item/projectile/bullet/astral_blade

/mob/living/simple_mob/mechanical/mecha/eclipse/tyrbosses/ai_cores/sec_core/do_special_attack(atom/A)
	switch(attackcycle)
		if(1)
			attackcycle = 0
			switch(a_intent)
				if(I_HURT)
					addtimer(CALLBACK(src, PROC_REF(bomb_lines), A, 2), 1.5 SECONDS, TIMER_DELETE_ME)
				if(I_GRAB)
					addtimer(CALLBACK(src, PROC_REF(bomb_lines), A, 2), 1 SECOND, TIMER_DELETE_ME)
				if(I_DISARM)
					addtimer(CALLBACK(src, PROC_REF(bomb_chaos), A, 2), 0.75 SECONDS, TIMER_DELETE_ME)
		if(2)
			attackcycle = 0
			switch(a_intent)
				if(I_HURT)
					addtimer(CALLBACK(src, PROC_REF(summon_puddles), A, 3, /datum/modifier/mmo_drop/blade_boss_long), 1.5 SECONDS, TIMER_DELETE_ME)
				if(I_GRAB)
					addtimer(CALLBACK(src, PROC_REF(summon_puddles), A, 3, /datum/modifier/mmo_drop/blade_boss_long), 1.5 SECONDS, TIMER_DELETE_ME)
				if(I_DISARM)
					addtimer(CALLBACK(src, PROC_REF(bomb_lines), A, 3), 0.75 SECONDS, TIMER_DELETE_ME)
		if(3)
			attackcycle = 0
			switch(a_intent)
				if(I_HURT)
					addtimer(CALLBACK(src, PROC_REF(cutoff), A, 4, 5, 10), 0.5 SECONDS, TIMER_DELETE_ME)
				if(I_GRAB)
					addtimer(CALLBACK(src, PROC_REF(bomb_chaos), A, 3), 1.5 SECONDS, TIMER_DELETE_ME)
				if(I_DISARM)
					addtimer(CALLBACK(src, PROC_REF(summon_puddles), A, 4, /datum/modifier/mmo_drop/blade_boss_long), 1 SECOND, TIMER_DELETE_ME)
		if(4)
			attackcycle = 0
			switch(a_intent)
				if(I_HURT)
					addtimer(CALLBACK(src, PROC_REF(summon_puddles), A, 1, /datum/modifier/mmo_drop/blade_boss_short), 1.5 SECONDS, TIMER_DELETE_ME)
				if(I_GRAB)
					addtimer(CALLBACK(src, PROC_REF(summon_puddles), A, 1, /datum/modifier/mmo_drop/blade_boss_short), 1.5 SECONDS, TIMER_DELETE_ME)
				if(I_DISARM)
					addtimer(CALLBACK(src, PROC_REF(summon_puddles), A, 1, /datum/modifier/mmo_drop/blade_boss_short), 1 SECOND, TIMER_DELETE_ME)

//The eletrical boss
//Has some issues since lighting damage causes stuns, so never dirrectly attacks you with lighting

/mob/living/simple_mob/mechanical/mecha/eclipse/tyrbosses/ai_cores/engi_core //Tries to limit your movement opitions
	name = "power core"
	desc = "A mechanical weaponized ai core."
	icon_state = "engi_core"
	icon_living = "engi_core"
	specialattackprojectile = /obj/item/projectile/energy/agate_lighting

/mob/living/simple_mob/mechanical/mecha/eclipse/tyrbosses/ai_cores/engi_core/do_special_attack(atom/A)
	switch(attackcycle)
		if(1)
			attackcycle = 0
			switch(a_intent)
				if(I_HURT)
					addtimer(CALLBACK(src, PROC_REF(cutoff), A, 2, 5, 10), 0.5 SECONDS, TIMER_DELETE_ME)
				if(I_GRAB)
					addtimer(CALLBACK(src, PROC_REF(cross_spin), A, 2, 7), 0.5 SECONDS, TIMER_DELETE_ME)
				if(I_DISARM)
					addtimer(CALLBACK(src, PROC_REF(quad_random_firing), A, 6, 2, 12), 0.5 SECONDS, TIMER_DELETE_ME)
		if(2)
			attackcycle = 0
			switch(a_intent)
				if(I_HURT)
					addtimer(CALLBACK(src, PROC_REF(cutoff), A, 3, 5, 10), 0.5 SECONDS, TIMER_DELETE_ME)
				if(I_GRAB)
					addtimer(CALLBACK(src, PROC_REF(dual_spin), A, 3, 7), 0.5 SECONDS, TIMER_DELETE_ME)
				if(I_DISARM)
					addtimer(CALLBACK(src, PROC_REF(quad_random_firing), A, 6, 3, 9), 0.5 SECONDS, TIMER_DELETE_ME)
		if(3)
			attackcycle = 0
			switch(a_intent)
				if(I_HURT)
					addtimer(CALLBACK(src, PROC_REF(cutoff_ulti), A, 1, 5, 10), 0.5 SECONDS, TIMER_DELETE_ME)
				if(I_GRAB)
					addtimer(CALLBACK(src, PROC_REF(triple_lines), A, 1, 7), 0.5 SECONDS, TIMER_DELETE_ME)
				if(I_DISARM)
					addtimer(CALLBACK(src, PROC_REF(quad_random_firing), A, 6, 1, 6), 0.5 SECONDS, TIMER_DELETE_ME)

/mob/living/simple_mob/mechanical/mecha/eclipse/tyrbosses/ai_cores/ark_core
	name = "master core"
	desc = "A mechanical weaponized ai core."
	icon_state = "final_core"
	icon_living = "final_core"
	health = 4200
	maxHealth = 4200

/mob/living/simple_mob/mechanical/mecha/eclipse/tyrbosses/ai_cores/engi_core/do_special_attack(atom/A)
	switch(attackcycle)
		if(1)
			specialattackprojectile = /obj/item/projectile/energy/eclipse_boss/tyrjavelin
			attackcycle = 0
			addtimer(CALLBACK(src, PROC_REF(quad_random_firing), A, 6, 2, 6), 0.5 SECONDS, TIMER_DELETE_ME)
		if(2)
			attackcycle = 0
			addtimer(CALLBACK(src, PROC_REF(triple_lines), A, 3, 7), 0.5 SECONDS, TIMER_DELETE_ME)
		if(3)
			attackcycle = 0
			addtimer(CALLBACK(src, PROC_REF(cutoff_ulti), A, 4, 5, 10), 0.5 SECONDS, TIMER_DELETE_ME)
		if(4)
			attackcycle = 0
			addtimer(CALLBACK(src, PROC_REF(dual_spin), A, 5, 7), 0.5 SECONDS, TIMER_DELETE_ME)
		if(5)
			attackcycle = 0
			addtimer(CALLBACK(src, PROC_REF(hole_in_wall), A, 6, 15), 0.5 SECONDS, TIMER_DELETE_ME)
		if(6)
			attackcycle = 0
			addtimer(CALLBACK(src, PROC_REF(rising_star), A, 7, 12), 0.5 SECONDS, TIMER_DELETE_ME)
		if(7)
			attackcycle = 0
			addtimer(CALLBACK(src, PROC_REF(bullet_blossom), A, 8, 8), 0.5 SECONDS, TIMER_DELETE_ME)
		if(8)
			attackcycle = 0
			addtimer(CALLBACK(src, PROC_REF(summon_puddles), A, 9, /datum/modifier/mmo_drop/blade_boss_short), 0.75 SECONDS, TIMER_DELETE_ME)
		if(9)
			attackcycle = 0
			addtimer(CALLBACK(src, PROC_REF(bomb_lines), A, 10), 0.75 SECONDS, TIMER_DELETE_ME)
		if(10)
			attackcycle = 0
			addtimer(CALLBACK(src, PROC_REF(summon_puddles), A, 11, /datum/modifier/mmo_drop/blade_boss_long), 0.75 SECONDS, TIMER_DELETE_ME)
		if(11)
			attackcycle = 0
			addtimer(CALLBACK(src, PROC_REF(bomb_chaos), A, 12), 0.75 SECONDS, TIMER_DELETE_ME)
		if(12)
			attackcycle = 0
			addtimer(CALLBACK(src, PROC_REF(dual_spin), A, 13, 5), 0.5 SECONDS, TIMER_DELETE_ME)
		if(13)
			addtimer(CALLBACK(src, PROC_REF(summon_puddles), A, 2, /datum/modifier/mmo_drop/metal_tomb), 0.5 SECONDS, TIMER_DELETE_ME)
			attackcycle = 0
		if(14)
			specialattackprojectile = /obj/item/projectile/beam/heavylaser
			Beam(A, icon_state = "sat_beam", time = 13 SECONDS, maxdistance = INFINITY)
			addtimer(CALLBACK(src, PROC_REF(gattlingfire), A, 15, 2, 25), 5.5 SECONDS, TIMER_DELETE_ME)
			attackcycle = 0
		if(15)
			specialattackprojectile = /obj/item/projectile/arc/blue_energy/precusor
			addtimer(CALLBACK(src, PROC_REF(vertical_double_laser), A, 16, 5), 0.5 SECONDS, TIMER_DELETE_ME)
			attackcycle = 0
		if(16)
			addtimer(CALLBACK(src, PROC_REF(checker_board), A, 17), 0.5 SECONDS, TIMER_DELETE_ME)
			attackcycle = 0
		if(17)
			addtimer(CALLBACK(src, PROC_REF(chain_burst), A, 1, 8), 0.5 SECONDS, TIMER_DELETE_ME)
			attackcycle = 0


/mob/living/simple_mob/mechanical/mecha/eclipse/tyrbosses/expirments/slime //summons a lot of adds slime_boss
	name = "farm expirment"
	icon_state = "slime_boss"
	icon_living = "slime_boss"
	health = 1200
	maxHealth = 1200
	special_attack_cooldown = 3 SECONDS

/mob/living/simple_mob/mechanical/mecha/eclipse/tyrbosses/expirments/slime/bullet_act(obj/item/projectile/P)
	for(var/i =1 to 4)
		new /obj/effect/spider/spiderling/antling/created(src.loc)
	..()

/mob/living/simple_mob/mechanical/mecha/eclipse/tyrbosses/expirments/slime/attackby(var/obj/item/O as obj, var/mob/user as mob)
	for(var/i =1 to 4)
		new /obj/effect/spider/spiderling/antling/created(src.loc)
	..()

/mob/living/simple_mob/mechanical/mecha/eclipse/tyrbosses/expirments/slime/do_special_attack(atom/A)
	for(var/i =1 to 4)
		new /obj/effect/spider/spiderling/antling/created(src.loc)

/mob/living/simple_mob/mechanical/mecha/eclipse/tyrbosses/expirments/barrier //has a regenerating shield
	name = "spacial expirment"
	icon_state = "UPshield_boss"
	icon_living = "UPshield_boss"
	var/fullshield = 300
	var/shieldrage = 300

/mob/living/simple_mob/mechanical/mecha/eclipse/tyrbosses/expirments/barrier/bullet_act(obj/item/projectile/P)
	if(fullshield > 0)
		fullshield -= P.damage
		if(P == /obj/item/projectile/ion)
			fullshield -= 300
			visible_message(span_boldwarning(span_orange("[P] breaks the shield!!.")))
			icon_state = "shield_boss"
		if(fullshield > 0)
			visible_message(span_boldwarning(span_orange("[P] is absorbed by the shield!.")))
		else
			visible_message(span_boldwarning(span_orange("[P] breaks the shield!!.")))
			icon_state = "shield_boss"
	else
		..()
		shieldrage -= P.damage
		if(shieldrage < 0)
			shieldrage = 300
			fullshield = 300
			visible_message(span_boldwarning(span_orange("The shield reactivates!!.")))
			icon_state = "UPshield_boss"

/mob/living/simple_mob/mechanical/mecha/eclipse/tyrbosses/expirments/barrier/do_special_attack(atom/A)
	rng_cycle = rand(1,4)
	switch(attackcycle)
		if(1)
			addtimer(CALLBACK(src, PROC_REF(quad_random_firing), A, 20, rng_cycle, 20), 0.5 SECONDS, TIMER_DELETE_ME)
			attackcycle = 0
		if(2)
			addtimer(CALLBACK(src, PROC_REF(hole_in_wall), A, rng_cycle, 15), 0.5 SECONDS, TIMER_DELETE_ME)
			attackcycle = 0
		if(3)
			addtimer(CALLBACK(src, PROC_REF(rising_star), A, rng_cycle, 15), 0.5 SECONDS, TIMER_DELETE_ME)
			attackcycle = 0
		if(4)
			addtimer(CALLBACK(src, PROC_REF(gattlingfire), A, rng_cycle, 8, 7), 0.5 SECONDS, TIMER_DELETE_ME)
			attackcycle = 0

/mob/living/simple_mob/mechanical/mecha/eclipse/tankyboss/crystal_boss //immune to projectiles
	name = "crystalized expirment"
	icon = 'modular_chomp/icons/mob/tyr.dmi'
	icon_state = "crystalized"
	icon_living = "crystalized"
	health = 400
	maxHealth = 400 //15ish hits with E sword
	melee_damage_lower = 40
	melee_damage_upper = 40
	attack_armor_pen = 40
	melee_attack_delay = 2.5 SECONDS
	movement_cooldown = 4
	special_attack_cooldown = 8 SECONDS
	var/parry_chance = 100

/mob/living/simple_mob/mechanical/mecha/eclipse/tankyboss/crystal_boss/load_default_bellies()
	. = ..()
	var/obj/belly/B = vore_selected
	B.name = "flora gut"
	B.desc = "You have been devoured by the crystaline vulpine. A mix of flesh and flora surrond you, purple bubbling fluid soaking into your body. The beast effortlessly carrying your body, it's motions seemingly exaggerated, alien words spoken, the beast trying to taunt you."
	B.digest_brute = 1
	B.digest_burn = 1
	B.digestchance = 0
	B.absorbchance = 0
	B.escapechance = 15

/mob/living/simple_mob/mechanical/mecha/eclipse/tankyboss/crystal_boss/bullet_act(obj/item/projectile/P)
	if(prob(parry_chance))
		visible_message(span_danger("The [P.name] gets reflected by [src]'s armor!"), \
						span_userdanger("The [P.name] gets reflected by [src]'s armor!"))

		// Find a turf near or on the original location to bounce to
		if(P.starting)
			var/new_x = P.starting.x + pick(0, 0, -1, 1, -2, 2, -2, 2, -2, 2, -3, 3, -3, 3)
			var/new_y = P.starting.y + pick(0, 0, -1, 1, -2, 2, -2, 2, -2, 2, -3, 3, -3, 3)
			var/turf/curloc = get_turf(src)

			// redirect the projectile
			P.redirect(new_x, new_y, curloc, src)
			P.reflected = 1

			return -1 // complete projectile permutation

	return (..(P))

/mob/living/simple_mob/mechanical/mecha/eclipse/tankyboss/crystal_boss/do_special_attack(atom/A)
	addtimer(CALLBACK(src, PROC_REF(bomb_chaos), A, 4), 0.5 SECONDS, TIMER_DELETE_ME)
