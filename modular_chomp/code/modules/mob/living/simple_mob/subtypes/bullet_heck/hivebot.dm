/mob/living/simple_mob/mechanical/mecha/eclipse/hivebot/tyr
	name = "ai control center"
	desc = "A large, very important looking ai. It sparks as it moves to attacks."
	icon_state = "powertower"
	icon_living = "powertower"
	faction = FACTION_TYR
	movement_cooldown = 10
	size_multiplier = 2
	maxHealth = 500
	health = 500
	wreckage = /obj/item/prop/tyrlore/gatekeeper
	ai_holder_type = /datum/ai_holder/simple_mob/intentional/three_phases/no_movement
	anchored = 1
	armor = list(melee = 40, bullet = 40, laser = 40, energy = 40, bomb = 50, bio = 100, rad = 100)
	projectiletype = /obj/item/projectile/energy/eclipse_boss/tyrjavelin
	loot_list = list(/obj/item/tool/wirecutters/hybrid/alien  = 10,
		/obj/item/tool/wrench/hybrid/alien  = 10,
		/obj/item/tool/crowbar/hybrid/alien  = 10,
		/obj/item/tool/screwdriver/hybrid/alien  = 10,
		/obj/item/pickaxe/diamonddrill/alien = 10,
		/obj/item/melee/energy/sword/dualsaber = 10,
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
		/obj/item/prop/deconstructable/gigacell = 100,
		)

/mob/living/simple_mob/mechanical/mecha/eclipse/hivebot/tyr/do_special_attack(atom/A)
	. = TRUE // So we don't fire a bolt as well.
	switch(attackcycle)
		if(1)
			addtimer(CALLBACK(src, PROC_REF(bomb_lines), A, 2), 2 SECONDS, TIMER_DELETE_ME)
			attackcycle = 0
		if(2)
			specialattackprojectile = /obj/item/projectile/energy/spikeenergy_ball/boss
			addtimer(CALLBACK(src, PROC_REF(dual_spin), A, 3, 7), 1 SECOND, TIMER_DELETE_ME)
			attackcycle = 0
		if(3)
			specialattackprojectile = /obj/item/projectile/energy/eclipse_boss/tyrjavelin
			addtimer(CALLBACK(src, PROC_REF(quad_random_firing), A, 12, 1, 0.5 SECONDS), 1 SECOND, TIMER_DELETE_ME)
			attackcycle = 0

/mob/living/simple_mob/mechanical/mecha/eclipse/hivebot/nanoweavetower
	name = "ai control center"
	desc = "A large, very important looking ai."
	icon_state = "bluetower"
	icon_living = "bluetower"
	faction = FACTION_HIVEBOT
	movement_cooldown = 10
	size_multiplier = 2
	maxHealth = 600
	health = 600
	projectiletype = /obj/item/projectile/energy/wallbreaker/boss
	wreckage = /obj/structure/loot_pile/surface/alien/engineering
	ai_holder_type = /datum/ai_holder/simple_mob/intentional/three_phases/no_movement
	anchored = 1
	armor = list(melee = 60, bullet = 60, laser = 60, energy = 60, bomb = 50, bio = 100, rad = 100)
	loot_list = list(/obj/item/prop/alien/junk = 100,
		/obj/item/multitool/alien = 30,
		/obj/item/stack/cable_coil/alien = 30,
		/obj/item/tool/crowbar/alien = 30,
		/obj/item/tool/screwdriver/alien = 30,
		/obj/item/weldingtool/alien = 30,
		/obj/item/tool/wirecutters/alien = 30,
		/obj/item/tool/wrench/alien = 30,
		/obj/item/cell/device/weapon/recharge/alien = 40,
		/obj/item/prop/nanoweave/terraformers = 50,
		/obj/item/prop/nanoweave/cyan = 50,
		/obj/item/prop/nanoweave/lime = 50,
		/obj/item/perfect_tele/alien = 100,
		/obj/item/prop/deconstructable/gigacell = 100
			)

/mob/living/simple_mob/mechanical/mecha/eclipse/hivebot/nanoweavetower/do_special_attack(atom/A)
	. = TRUE // So we don't fire a bolt as well.
	switch(attackcycle)
		if(1)
			specialattackprojectile = /obj/item/projectile/beam/midlaser/shortrange
			rng_cycle = rand(1,4)
			direct_say("PROTOCOL: CROSS X.")
			addtimer(CALLBACK(src, PROC_REF(star_burst), A, rng_cycle), 2 SECONDS, TIMER_DELETE_ME)
			attackcycle = 0
		if(2)
			specialattackprojectile = /obj/item/projectile/energy/wallbreaker/boss
			rng_cycle = rand(1,4)
			direct_say("PROTOCOL: PRECISION. SWEEP.")
			addtimer(CALLBACK(src, PROC_REF(dual_spin), A, rng_cycle, 7), 2 SECONDS, TIMER_DELETE_ME)
			attackcycle = 0
		if(3)
			specialattackprojectile = /obj/item/projectile/energy/lightingspark/nanoweave
			rng_cycle = rand(1,4)
			direct_say("PROTOCOL: DISCHARGE.")
			addtimer(CALLBACK(src, PROC_REF(quad_random_firing), A, 12, rng_cycle, 15), 1 SECOND, TIMER_DELETE_ME)
			attackcycle = 0
		if(4)
			specialattackprojectile = /obj/item/projectile/arc/explosive_rocket/big
			rng_cycle = rand(1,4)
			Beam(A, icon_state = "r_beam", time = 1 SECOND, maxdistance = INFINITY)
			direct_say("PROTOCOL: MISSILE.")
			addtimer(CALLBACK(src, PROC_REF(singleproj), A, rng_cycle), 2 SECONDS, TIMER_DELETE_ME)
			attackcycle = 0
