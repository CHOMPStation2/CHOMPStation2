/mob/living/simple_mob/mechanical/mecha/eclipse/tankyboss
	health = 1000
	maxHealth = 1000 //I don't like four digits, but the intended weapon has 30 damage, and desired player count is 3 with a length of 3 mins, doing the math adds up to 1080 but going to do 1k
	faction = FACTION_TYR
	armor = list(melee = 30, bullet = 30, laser = 30, energy = 30, bomb = 30, bio = 100, rad = 100)
	movement_cooldown = 40
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
	special_attack_min_range = 0
	special_attack_max_range = 7
	wreckage = /obj/item/prop/tyrlore/drones

	loot_list = list(/obj/item/gun/energy/curse_tyrshotgun  = 30,
		/obj/item/gun/energy/energyballchain  = 30,
		/obj/item/tool/wirecutters/hybrid/alien  = 30,
		/obj/item/tool/wrench/hybrid/alien  = 30,
		/obj/item/tool/crowbar/hybrid/alien  = 30,
		/obj/item/tool/screwdriver/hybrid/alien  = 30,
		/obj/item/pickaxe/diamonddrill/alien = 30,
		/obj/item/melee/energy/sword/dualsaber = 30,
		/obj/item/shield_projector/rectangle/automatic/tyrbarrier = 1,
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
		/obj/item/melee/energy/tyr_sabre = 30
		)

/mob/living/simple_mob/mechanical/mecha/eclipse/tankyboss/acid_boss
	name = "experiment 5"
	desc = "A strange furball fused with plant life."
	icon_state = "poison_boss"
	icon_living = "poison_boss"
	wreckage = /obj/item/prop/tyrlore/basicflora
	projectiletype = /obj/item/projectile/energy/neurotoxin/toxic/tyr_flora
	var/regeneration_strength = -30

/mob/living/simple_mob/mechanical/mecha/eclipse/tankyboss/acid_boss/load_default_bellies()
	. = ..()
	var/obj/belly/B = vore_selected
	B.name = "flora gut"
	B.desc = "You have been devoured by the vulpakin like plant beast. A mix of flesh and flora surrond you, purple bubbling fluid soaking into your body. The beast effortlessly carrying your body, it's motions seemingly exaggerated, alien words spoken, the beast trying to taunt you."
	B.digest_brute = 1
	B.digest_burn = 1
	B.digestchance = 0
	B.absorbchance = 0
	B.escapechance = 15

/mob/living/simple_mob/mechanical/mecha/eclipse/tankyboss/acid_boss/bullet_act(obj/item/projectile/P) //removal of E net cheese
	if(P == /obj/item/projectile/energy/neurotoxin/toxic/tyr_flora)
		return
	if(P.damage_type && P.damage_type == BURN && P.damage)
		visible_message(span_boldwarning(span_orange("The beast regenerates some of the damage!.")))
		adjustBruteLoss(regeneration_strength)
		adjustFireLoss(regeneration_strength)
	..()


/mob/living/simple_mob/mechanical/mecha/eclipse/tankyboss/acid_boss/do_special_attack(atom/A)
	rng_cycle = rand(1,4)
	switch(attackcycle)
		if(1)
			addtimer(CALLBACK(src, PROC_REF(quad_random_firing), A, 20, rng_cycle, 20), 0.5 SECONDS, TIMER_DELETE_ME)
			attackcycle = 0
		if(2)
			addtimer(CALLBACK(src, PROC_REF(dual_spin), A, rng_cycle, 15), 0.5 SECONDS, TIMER_DELETE_ME)
			attackcycle = 0
		if(3)
			attackcycle = 0
			addtimer(CALLBACK(src, PROC_REF(summon_puddles), A, rng_cycle, /datum/modifier/mmo_drop/tyr_flora), 2.5 SECONDS, TIMER_DELETE_ME)
		if(4)
			addtimer(CALLBACK(src, PROC_REF(bullet_blossom), A, rng_cycle, 10), 0.5 SECONDS, TIMER_DELETE_ME)
			attackcycle = 0

/mob/living/simple_mob/mechanical/mecha/eclipse/tankyboss/sonic_boss
	name = "experiment 10"
	desc = "A strange furball, the air vibrating around it."
	specialattackprojectile = /obj/item/projectile/knockback/slow
	icon_state = "sonic_boss"
	icon_living = "sonic_boss"
	projectiletype = /obj/item/projectile/knockback/slow
	wreckage = /obj/item/prop/tyrlore/basicsonic

/mob/living/simple_mob/mechanical/mecha/eclipse/tankyboss/sonic_boss/load_default_bellies()
	. = ..()
	var/obj/belly/B = vore_selected
	B.name = "alien gut"
	B.desc = "Your ears ring as the stomach groans to life around you. The constant ringing mixing with acidic gurgling, and gutteral groans. Silver flesh kneading at your figure, whilst the beast ignores you stewing in it's gut."
	B.digest_brute = 1.5
	B.digest_burn = 0.5
	B.digestchance = 0
	B.absorbchance = 0
	B.escapechance = 15

/obj/item/projectile/knockback/slow
	speed = 10

/mob/living/simple_mob/mechanical/mecha/eclipse/tankyboss/sonic_boss/do_special_attack(atom/A)
	rng_cycle = rand(1,4)
	switch(attackcycle)
		if(1)
			addtimer(CALLBACK(src, PROC_REF(quad_random_firing), A, 20, rng_cycle, 10), 0.5 SECONDS, TIMER_DELETE_ME)
			attackcycle = 0
		if(2)
			addtimer(CALLBACK(src, PROC_REF(dual_spin), A, rng_cycle, 5), 0.5 SECONDS, TIMER_DELETE_ME)
			attackcycle = 0
		if(3)
			addtimer(CALLBACK(src, PROC_REF(rising_star), A, rng_cycle, 10), 0.5 SECONDS, TIMER_DELETE_ME)
			attackcycle = 0
		if(4)
			addtimer(CALLBACK(src, PROC_REF(hole_in_wall), A, rng_cycle, 10), 0.5 SECONDS, TIMER_DELETE_ME)
			attackcycle = 0

/mob/living/simple_mob/mechanical/mecha/eclipse/tankyboss/shield_boss
	name = "experiment 15"
	desc = "A strange furball gaurded by a transparent barrier."
	specialattackprojectile = /obj/item/projectile/energy/eclipse/tyrjavelin
	health = 450
	maxHealth = 450 //shield mechanic
	icon_state = "UPshield_boss"
	icon_living = "UPshield_boss"
	projectiletype = /obj/item/projectile/energy/eclipse/tyrjavelin
	wreckage = /obj/item/prop/tyrlore/basicshield
	var/fullshield = 200
	var/shieldrage = 200

/mob/living/simple_mob/mechanical/mecha/eclipse/tankyboss/shield_boss/load_default_bellies()
	. = ..()
	var/obj/belly/B = vore_selected
	B.name = "alien gut"
	B.desc = "You are dunked into a multi-colored, or maybe multi-fluid, stew. Blues, purples, oranges, and greens, all swishing around you as the alien creature contunies it's mindless guarding.."
	B.digest_brute = 0.5
	B.digest_burn = 1.5
	B.digestchance = 0
	B.absorbchance = 0
	B.escapechance = 15

/mob/living/simple_mob/mechanical/mecha/eclipse/tankyboss/shield_boss/bullet_act(obj/item/projectile/P)
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
		if(shieldrage > 0)
			shieldrage = 200
			fullshield = 200
			visible_message(span_boldwarning(span_orange("The shield reactivates!!.")))
			icon_state = "UPshield_boss"

/mob/living/simple_mob/mechanical/mecha/eclipse/tankyboss/shield_boss/do_special_attack(atom/A)
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

/mob/living/simple_mob/mechanical/mecha/eclipse/tankyboss/crystal_boss
	name = "experiment 20"
	icon_state = "crystalized"
	icon_living = "crystalized"
	specialattackprojectile = /obj/item/projectile/arc/fragmentation/tyr_mortar

/mob/living/simple_mob/mechanical/mecha/eclipse/tankyboss/crystal_boss/do_special_attack(atom/A)
	rng_cycle = rand(1,3)
	switch(attackcycle)
		if(1)
			addtimer(CALLBACK(src, PROC_REF(quad_random_firing), A, 20, rng_cycle, 10), 0.5 SECONDS, TIMER_DELETE_ME)
			attackcycle = 0
		if(2)
			addtimer(CALLBACK(src, PROC_REF(dual_spin), A, rng_cycle, 5), 0.5 SECONDS, TIMER_DELETE_ME)
			attackcycle = 0
		if(3)
			addtimer(CALLBACK(src, PROC_REF(gattlingfire), A, rng_cycle, 8, 7), 0.5 SECONDS, TIMER_DELETE_ME)
			attackcycle = 0

/mob/living/simple_mob/mechanical/mecha/eclipse/tankyboss/naga_boss
	name = "experiment 25"
	icon_state = "naga_boss"
	icon_living = "naga_boss"

/mob/living/simple_mob/mechanical/mecha/eclipse/tankyboss/naga_boss/do_special_attack(atom/A)
	rng_cycle = rand(1,3)
	switch(attackcycle)
		if(1)
			addtimer(CALLBACK(src, PROC_REF(dual_spin), A, rng_cycle, 5), 0.5 SECONDS, TIMER_DELETE_ME)
			attackcycle = 0
		if(2)
			addtimer(CALLBACK(src, PROC_REF(gravity_surge), A, rng_cycle, 7, 1), 0.5 SECONDS, TIMER_DELETE_ME)
			attackcycle = 0
		if(3)
			addtimer(CALLBACK(src, PROC_REF(rising_star), A, rng_cycle, 15), 0.5 SECONDS, TIMER_DELETE_ME)
			attackcycle = 0

//The Ai control units of Tyr
/mob/living/simple_mob/mechanical/mecha/eclipse/tankyboss/defense_ai
	name = "defense automaton"
	desc = "A large, very important looking ai. Plating appears similiar to albative plating."
	icon = 'modular_chomp/icons/mob/hivebot.dmi'
	icon_state = "cyan"
	icon_living = "cyan"
	size_multiplier = 3
	projectiletype = /obj/item/projectile/bullet/tyr_bladeburst
	wreckage = /obj/item/prop/tyrlore/ants
	specialattackprojectile = /obj/item/projectile/bullet/astral_blade

/mob/living/simple_mob/mechanical/mecha/eclipse/tankyboss/defense_ai/do_special_attack(atom/A)
	switch(attackcycle)
		if(1)
			addtimer(CALLBACK(src, PROC_REF(bomb_lines), A, 3), 1.5 SECONDS, TIMER_DELETE_ME)
			attackcycle = 0
		if(2)
			attackcycle = 0
			addtimer(CALLBACK(src, PROC_REF(cutoff_ulti), A, 4, 5, 10), 0.5 SECONDS, TIMER_DELETE_ME)
		if(3)
			attackcycle = 0
			addtimer(CALLBACK(src, PROC_REF(summon_puddles), A, 2, /datum/modifier/mmo_drop/blade_boss_long), 2.5 SECONDS, TIMER_DELETE_ME)
		if(4)
			attackcycle = 0
			addtimer(CALLBACK(src, PROC_REF(summon_puddles), A, 1, /datum/modifier/mmo_drop/blade_boss_short), 2.5 SECONDS, TIMER_DELETE_ME)


/mob/living/simple_mob/mechanical/mecha/eclipse/tankyboss/engi_ai //the enginer robot's fighting style is quite simple, restrain your movement so it can hit you with it's main projectile
	name = "engineering automaton"
	desc = "A large important looking robot, crackling with lighting."
	icon = 'modular_chomp/icons/mob/hivebot.dmi'
	icon_state = "yellow"
	icon_living = "yellow"
	size_multiplier = 3
	wreckage = /obj/item/prop/tyrlore/basicpower
	specialattackprojectile = /obj/item/projectile/energy/lightingspark/nanoweave
	projectiletype = /obj/item/projectile/energy/lightingspark/nanoweave

/mob/living/simple_mob/mechanical/mecha/eclipse/tankyboss/engi_ai/do_special_attack(atom/A)
	switch(attackcycle)
		if(1)
			addtimer(CALLBACK(src, PROC_REF(dual_spin), A, 3, 10), 0.5 SECONDS, TIMER_DELETE_ME)
			attackcycle = 0
		if(2)
			addtimer(CALLBACK(src, PROC_REF(bomb_chaos), A, 4), 1.5 SECONDS, TIMER_DELETE_ME)
			attackcycle = 0
		if(3)
			attackcycle = 0
			addtimer(CALLBACK(src, PROC_REF(cutoff), A, 2, 5, 15), 0.5 SECONDS, TIMER_DELETE_ME)
		if(4)
			attackcycle = 0
			addtimer(CALLBACK(src, PROC_REF(cutoff_ulti), A, 1, 5, 15), 0.5 SECONDS, TIMER_DELETE_ME)

/mob/living/simple_mob/mechanical/mecha/eclipse/tankyboss/swarm_ai
	name = "swarm controler"
	desc = "A massive hivebot that has shifting bits of metal upon it's body."
	health = 600
	maxHealth = 600
	icon_state = "bright_green"
	icon_living = "bright_green"
	icon = 'modular_chomp/icons/mob/hivebot.dmi'
	size_multiplier = 3
	wreckage = /obj/item/prop/tyrlore/drones
	special_attack_cooldown = 8 SECONDS
	melee_damage_lower = 20
	melee_damage_upper = 20
	attack_armor_pen = 50
	movement_cooldown = 4

/mob/living/simple_mob/mechanical/mecha/eclipse/tankyboss/swarm_ai/bullet_act(obj/item/projectile/P)
	for(var/i =1 to 3)
		new /mob/living/simple_mob/mechanical/hivebot/tyr/swarm(src.loc)
	..()

/mob/living/simple_mob/mechanical/mecha/eclipse/tankyboss/swarm_ai/attackby(var/obj/item/O as obj, var/mob/user as mob)
	for(var/i =1 to 3)
		new /mob/living/simple_mob/mechanical/hivebot/tyr/swarm(src.loc)
	..()

/mob/living/simple_mob/mechanical/mecha/eclipse/tankyboss/swarm_ai/do_special_attack(atom/A)
	for(var/i =1 to 3)
		new /mob/living/simple_mob/mechanical/hivebot/tyr/swarm(src.loc)

/mob/living/simple_mob/mechanical/mecha/eclipse/tankyboss/meteor_ai
	name = "swarm controler"
	desc = "A massive hivebot that has shifting bits of metal upon it's body."
	icon_state = "orange"
	icon_living = "orange"
	icon = 'modular_chomp/icons/mob/hivebot.dmi'
	size_multiplier = 3
	specialattackprojectile = /obj/item/projectile/arc/blue_energy/precusor
	projectiletype = /obj/item/projectile/arc/blue_energy/precusor

/mob/living/simple_mob/mechanical/mecha/eclipse/tankyboss/meteor_ai/do_special_attack(atom/A, var/strike_downx, var/strikedowny)
	strike_downx = rand(-7,7)
	strikedowny = rand(-7,7)
	bullet_heck(A, strike_downx, strikedowny)
