/mob/living/simple_mob/vore/rebalance_event/mice
	name = "ammo mouse"
	real_name = "mouse"
	desc = "It's a small militarized rodent."
	tt_desc = "E Mus musculus"
	icon = 'icons/mob/mouse_army.dmi'
	icon_state = "mouse_ammo"
	item_state = "mouse_ammo"
	icon_living = "mouse_ammo"
	icon_dead = "mouse_ammo_dead"
	icon_rest = "mouse_ammo_sleep"
	faction = FACTION_SYNDICATE

	maxHealth = 5
	health = 5
	universal_understand = 1

	taser_kill = 0
	damage_fatigue_mult = 0

	mob_size = MOB_MINISCULE
	pass_flags = PASSTABLE
	layer = MOB_LAYER
	density = 0

	response_help  = "pets"
	response_disarm = "gently pushes aside"
	response_harm   = "stamps on"

	min_oxy = 0 //Require atleast 16kPA oxygen
	minbodytemp = 0		//Below -50 Degrees Celcius
	maxbodytemp = 5000	//Above 50 Degrees Celcius

	//Mob melee settings
	melee_damage_lower = 8
	melee_damage_upper = 8
	attacktext = list("attacked", "chomped", "gnawed on")
	friendly = list("baps", "nuzzles")
	attack_armor_type = "melee"
	attack_sharp = 1
	attack_edge = 1

	//Damage resistances
	shock_resist = 1
	armor = list(
				"melee" = 30,
				"bullet" = 20,
				"laser" = 20,
				"energy" = 10,
				"bomb" = 10,
				"bio" = 0,
				"rad" = 0)	//Standard armor vest stats, slightly dropped due to scale.

	has_langs = list("Mouse")

	holder_type = /obj/item/holder/mouse
	meat_type = /obj/item/reagent_containers/food/snacks/meat

	say_list_type = /datum/say_list/mouse

	ai_holder_type = /datum/ai_holder/simple_mob/melee/evasive

	swallowTime = 3 SECONDS
	vore_active = 1
	vore_capacity = 1
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

/mob/living/simple_mob/vore/rebalance_event/mice/stealth
	icon_state = "mouse_stealth"
	item_state = "mouse_stealth"
	icon_living = "mouse_stealth"
	icon_dead = "mouse_stealth_dead"
	icon_rest = "mouse_stealth_sleep"
	alpha = 235

/mob/living/simple_mob/vore/rebalance_event/mice/pyro
	icon_state = "mouse_pyro"
	item_state = "mouse_pyro"
	icon_living = "mouse_pyro"
	icon_dead = "mouse_pyro_dead"
	icon_rest = "mouse_pyro_sleep"
	var/exploded = FALSE
	var/explosion_delay_lower	= 1 SECOND	// Lower bound for explosion delay.
	var/explosion_delay_upper	= 2 SECONDS	// Upper bound.

/mob/living/simple_mob/vore/rebalance_event/mice/pyro/proc/explode()
	if(src && !exploded)
		visible_message(span_danger("\The [src]'s body detonates!"))
		exploded = TRUE
		explosion(src.loc, 0, 2, 0, 0)

/mob/living/simple_mob/vore/rebalance_event/mice/pyro/death()
	visible_message(span_critical("\The [src]'s body begins to rupture!"))
	var/delay = rand(explosion_delay_lower, explosion_delay_upper)
	animate(src, color = "#000000", time = 0.1 SECONDS, loop = ceil(delay/2))
	animate(color = "#FF0000", time = 0.1 SECONDS)
	addtimer(CALLBACK(src, PROC_REF(explode)), delay, TIMER_DELETE_ME)
	return ..()

//main threats
/mob/living/simple_mob/mechanical/mecha/eclipse/mouse_tank
	name = "\improper Whisker Tank"
	desc = "A shockingly functional, miniaturized tank. Its inventor is unknown, but widely reviled."
	catalogue_data = list(/datum/category_item/catalogue/technology/mouse_tank)
	icon = 'icons/mob/mouse_army.dmi'
	icon_state = "whisker"
	wreckage = /obj/structure/loot_pile/mecha/mouse_tank
	faction = FACTION_SYNDICATE

	health = 200
	maxHealth = 200
	armor = list(
				"melee" = 15,
				"bullet" = 15,
				"laser" = 15,
				"energy" = 15,
				"bomb" = 0,
				"bio" = 100,
				"rad" = 100
				)

	projectiletype = /obj/item/projectile/bullet/event_mob/mousetank_missile

	movement_cooldown = 3
	base_attack_cooldown = 50
	special_attack_cooldown = 60
	damage_fatigue_mult = 0

	ai_holder_type = /datum/ai_holder/simple_mob/ranged/kiting
	heat_resist = 1
	pilot_type = /mob/living/simple_mob/vore/rebalance_event/mice
	specialattackprojectile = /obj/item/projectile/bullet/event_mob/mousemelee

	loot_list = list(/obj/item/stock_parts/scanning_module/omni = 40,
		/obj/item/stock_parts/micro_laser/omni = 40,
		/obj/item/stock_parts/capacitor/omni = 40,
		/obj/item/stock_parts/manipulator/omni = 40,
		/obj/item/stock_parts/matter_bin/omni = 40,
		/obj/item/stock_parts/scanning_module/hyper = 40,
		/obj/item/stock_parts/micro_laser/hyper = 40,
		/obj/item/stock_parts/capacitor/hyper = 40,
		/obj/item/stock_parts/manipulator/hyper = 40,
		/obj/item/stock_parts/matter_bin/hyper = 40
		)

/mob/living/simple_mob/mechanical/mecha/eclipse/mouse_tank/do_special_attack(atom/A)
	new /mob/living/simple_mob/vore/rebalance_event/mice(src.loc)
	new /mob/living/simple_mob/vore/rebalance_event/mice/stealth(src.loc)
	new /mob/living/simple_mob/vore/rebalance_event/mice/pyro(src.loc)

/mob/living/simple_mob/mechanical/mecha/eclipse/mouse_tank/livewire
	name = "\improper Livewire Assault Tank"
	desc = "A scorched, miniaturized light tank. It is mentioned only in hushed whispers."
	catalogue_data = list(/datum/category_item/catalogue/technology/mouse_tank/livewire)
	icon_state = "livewire"
	wreckage = /obj/structure/loot_pile/mecha/mouse_tank/livewire
	pilot_type = /mob/living/simple_mob/vore/rebalance_event/mice/pyro
	special_attack_cooldown = 30

/mob/living/simple_mob/mechanical/mecha/eclipse/mouse_tank/livewire/do_special_attack(atom/A)
	switch(attackcycle)
		if(1)
			direct_say("Five.")
			attackcycle = 2
		if(2)
			direct_say("Four.")
			attackcycle = 3
		if(3)
			direct_say("Three.")
			attackcycle = 4
		if(4)
			direct_say("Two.")
			attackcycle = 5
		if(5)
			direct_say("One.")
			attackcycle = 6
		if(6)
			explosion(src.loc, 8, 11, 13, 15)

/mob/living/simple_mob/mechanical/mecha/eclipse/mouse_tank/eraticator
	name = "\improper Eraticator Artillery Platform"
	desc = "A heavy, miniaturized artillery platform. If you can hear it squeaking, you're too close."
	catalogue_data = list(/datum/category_item/catalogue/technology/mouse_tank/eraticator)
	icon_state = "eraticator"
	wreckage = /obj/structure/loot_pile/mecha/mouse_tank/eraticator
	pilot_type = /mob/living/simple_mob/vore/rebalance_event/mice/stealth
	special_attack_cooldown = 120
	attackcycle = 2

/mob/living/simple_mob/mechanical/mecha/eclipse/mouse_tank/eraticator/do_special_attack(atom/A)
	if(prob(50))
		addtimer(CALLBACK(src, PROC_REF(hole_in_wall), A, 3, 10), 1 SECONDS, TIMER_DELETE_ME)
	else
		addtimer(CALLBACK(src, PROC_REF(dual_spin), A, 3, 3), 2 SECONDS, TIMER_DELETE_ME)
