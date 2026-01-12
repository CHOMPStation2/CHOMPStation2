/mob/living/simple_mob/humanoid/astral_collective
	name = "Astral Collective Unit"
	tt_desc = "E Homo sapiens"
	desc = "You shouldn't be seeing this."
	icon = 'modular_chomp/icons/mob/starhunters.dmi'
	icon_state = "medi"
	icon_living = "medi"
	icon_dead = "medi"
	taser_kill = 0

	faction = FACTION_ECLIPSE
	movement_cooldown = 0

	status_flags = 0

	response_help = "pokes"
	response_disarm = "shoves"
	response_harm = "hits"

	health = 100
	maxHealth = 100
	harm_intent_damage = 0
	melee_damage_lower = 25
	melee_damage_upper = 25
	melee_attack_delay = 0.75 SECONDS
	evasion = 20
	attack_sharp = 1
	attack_edge = 1
	attacktext = list("slashed", "stabbed")
	projectile_dispersion = 0
	armor = list(melee = 20, bullet = 20, laser = 20, energy = 20, bomb = 20, bio = 100, rad = 100)	// Simple mob immunuties plus minour armor

	can_be_drop_prey = FALSE //CHOMP Add
	pass_flags = PASSTABLE //mostly for the melee mobs.
	softfall = TRUE //highly advanced spacesuit stuff

	loot_list = list(/obj/item/slime_extract/sepia  = 35,
		/obj/item/bone/skull = 100,
		/obj/item/seeds/random = 20,
		/obj/random/powercell = 20,
		/obj/random/medical/pillbottle = 20,
		/obj/random/firstaid = 5,
		/obj/random/grenade/box = 5,
		/obj/random/tool/power = 20,
		/obj/random/tool/alien = 10,
		/obj/random/tech_supply/component/nofail = 40,
		/obj/random/medical = 15,
		/obj/random/cash/big = 15,
		/obj/random/material = 40,
		/obj/random/material/refined = 30,
		/obj/random/material/precious = 20,
		/obj/random/janusmodule = 3,
		/obj/item/dnainjector/random_verygood = 10,
		/obj/item/dnainjector/random_verybad = 10,
		/obj/item/stock_parts/scanning_module/omni = 20,
		/obj/item/stock_parts/micro_laser/omni = 20,
		/obj/item/stock_parts/capacitor/omni = 20,
		/obj/item/stock_parts/manipulator/omni = 20,
		/obj/item/stock_parts/matter_bin/omni = 20,
		/obj/item/stock_parts/scanning_module/hyper = 20,
		/obj/item/stock_parts/micro_laser/hyper = 20,
		/obj/item/stock_parts/capacitor/hyper = 20,
		/obj/item/stock_parts/manipulator/hyper = 20,
		/obj/item/stock_parts/matter_bin/hyper = 20
			)

	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0
	minbodytemp = 0
	heat_damage_per_tick = 0

	projectilesound = 'sound/weapons/Gunshot_light.ogg'

	ai_holder_type = /datum/ai_holder/simple_mob/ranged/astral_collective

	special_attack_cooldown = 15 SECONDS
	special_attack_min_range = 0
	special_attack_max_range = 14

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

/datum/ai_holder/simple_mob/ranged/astral_collective
	pointblank = TRUE
	can_breakthrough = TRUE
	violent_breakthrough = TRUE
	unconscious_vore = TRUE
	handle_corpse = TRUE
	hostile = TRUE
	mauling = TRUE
	destructive = TRUE

/datum/ai_holder/simple_mob/ranged/astral_collective/pre_ranged_attack(atom/A)
	holder.IMove(get_step(holder, pick(GLOB.alldirs)))
	holder.face_atom(A)


/datum/ai_holder/simple_mob/ranged/astral_collective/post_ranged_attack(atom/A)
	holder.IMove(get_step(holder, pick(GLOB.alldirs)))
	holder.face_atom(A)

/datum/ai_holder/simple_mob/ranged/astral_collective/post_melee_attack(atom/A)
	holder.IMove(get_step_away(holder, A))
	holder.face_atom(A)

/datum/ai_holder/simple_mob/melee/evasive/astral_collective

/datum/ai_holder/simple_mob/melee/evasive/astral_collective/pre_special_attack(atom/A)
	holder.IMove(get_step(holder, pick(GLOB.alldirs)))
	holder.face_atom(A)


/datum/ai_holder/simple_mob/melee/evasive/astral_collective/post_special_attack(atom/A)
	holder.IMove(get_step(holder, pick(GLOB.alldirs)))
	holder.face_atom(A)

/mob/living/simple_mob/humanoid/astral_collective/purity
	name = "Astral Collective Bioweapon"
	desc = "You shouldn't be seeing this."
	icon_state = "purity"
	icon_living = "purity"
	ai_holder_type = /datum/ai_holder/simple_mob/melee/evasive/astral_collective
	melee_damage_lower = 26 //20 with explo voidsuit
	melee_damage_upper = 26
	attack_armor_pen = 20

	special_attack_cooldown = 3 SECONDS
	special_attack_min_range = 0
	special_attack_max_range = 14

/mob/living/simple_mob/humanoid/astral_collective/purity/do_special_attack(atom/A)
	adjustBruteLoss(-3)
	adjustFireLoss(-3)
	adjustToxLoss(-3)
	adjustOxyLoss(-3)
	adjustCloneLoss(-3)

//projectiles
/obj/item/projectile/energy/astral_collective
	name = "abnormal energy"
	speed = 2
	damage = 17 //roughly 15 with intended armour
	damage_type = BURN //BRUTE, BURN, TOX, OXY, CLONE, HALLOSS, ELECTROCUTE, BIOACID, SEARING are the only things that should be in here
	check_armour = "laser" //Defines what armor to use when it hits things.  Must be set to bullet, laser, energy,or bomb	//Cael - bio and rad are also valid

/obj/item/projectile/energy/astral_collective/anti_mecha
	damage_type = BIOACID
	icon_state = "declone"

/obj/item/projectile/energy/astral_collective/armour_breaker
	damage = 8
	dephasing = TRUE
	hits_phased = TRUE
	icon_state = "plasma_stun"
	penetrating = 10

/obj/item/projectile/energy/astral_collective/searing
	damage_type = SEARING
	icon_state = "bolter"

/obj/item/projectile/energy/astral_collective/green
	damage = 10
	icon_state = "energy"
	irradiate = 30

/obj/item/projectile/energy/astral_collective/damage
	damage = 20
	icon_state = "shell"
	damage_type = BRUTE
	check_armour = "bullet"

/obj/item/projectile/energy/astral_collective/flame
	damage = 10
	icon_state = "fireball"
	range = 4

/obj/item/projectile/energy/astral_collective/flame/Move()
	. = ..()
	var/turf/T = get_turf(src)
	if(T)
		new /obj/effect/decal/cleanable/liquid_fuel(T,0.2,1)
		T.hotspot_expose(500, 50, 1)
		T.create_fire(700)


//the ranged mobs
/mob/living/simple_mob/humanoid/astral_collective/ranged
	name = "Astral Collective Unit"
	projectile_accuracy = 10
	needs_reload = TRUE
	var/geartype
	var/secondaryweapon
	var/expirmental

/mob/living/simple_mob/humanoid/astral_collective/ranged/Initialize(mapload)
	projectiletype = pick(/obj/item/projectile/energy/astral_collective/anti_mecha, /obj/item/projectile/energy/astral_collective/armour_breaker, /obj/item/projectile/energy/astral_collective/searing, /obj/item/projectile/energy/astral_collective/green, /obj/item/projectile/energy/astral_collective/damage)
	projectile_dispersion = pick(0, 15, 30, 45)
	geartype = rand(1.5)
	secondaryweapon = rand(1.5)
	expirmental = rand(1,5)
	expirmentresult()
	gearup()
	. = ..()

/mob/living/simple_mob/humanoid/astral_collective/ranged/proc/gearup()
	switch(geartype)
		if(1)
			ranged_cooldown = 10
			reload_max = 10
			reload_time = 6 SECONDS
			special_attack_cooldown = 7 SECONDS
		if(2)
			ranged_cooldown = 300
			reload_max = 3
			reload_time = 3 SECONDS
			special_attack_cooldown = 2 SECONDS
		if(3)
			ranged_cooldown = 60
			reload_max = 5
			reload_time = 2.5 SECONDS
			special_attack_cooldown = 5 SECONDS
		if(4)
			ranged_cooldown = 40
			reload_max = 6
			reload_time = 2 SECONDS
			special_attack_cooldown = 10 SECONDS
		if(5)
			ranged_cooldown = 30
			reload_max = 3
			reload_time = 1.5 SECONDS
			special_attack_cooldown = 4 SECONDS

/mob/living/simple_mob/humanoid/astral_collective/ranged/proc/expirmentresult()
	switch(expirmental)
		if(1)
			add_modifier(/datum/modifier/astralcollect_swift, null, src)
		if(2)
			add_modifier(/datum/modifier/astralcollect_regen, null, src)
		if(3)
			add_modifier(/datum/modifier/astralcollect_titan, null, src)
		if(4)
			add_modifier(/datum/modifier/astralcollect_armour, null, src)
		if(5)
			add_modifier(/datum/modifier/astralcollect_mistake, null, src)

/datum/modifier/astralcollect_swift
	icon_scale_x_percent = 0.7
	icon_scale_y_percent = 0.7
	slowdown = -0.5
	evasion = 20

/datum/modifier/astralcollect_regen/tick()
	holder.adjustBruteLoss(-8)
	holder.adjustFireLoss(-8)
	holder.adjustToxLoss(-8)
	holder.adjustOxyLoss(-8)
	holder.adjustCloneLoss(-8)

/datum/modifier/astralcollect_titan
	icon_scale_x_percent = 1.6
	icon_scale_y_percent = 1.6
	max_health_percent = 1.5

/datum/modifier/astralcollect_armour
	icon_scale_x_percent = 1.3
	icon_scale_y_percent = 1.3
	incoming_damage_percent = 0.65

/datum/modifier/astralcollect_mistake
	incoming_damage_percent = 1.35
	slowdown = 1
	max_health_percent = 0.75

/mob/living/simple_mob/humanoid/astral_collective/ranged/do_special_attack(atom/A)
	switch(secondaryweapon)
		if(1)
			visible_message(span_boldwarning(span_orange("The unit's equipment sparks!.")))
			secondaryweapon = rand(1.5)
		if(2)
			heal_self(A)
		if(3)
			rockect_fire(A)
		if(4)
			gravity_surge(A)
		if(5)
			teleport_attack(A)

/mob/living/simple_mob/humanoid/astral_collective/ranged/proc/heal_self(atom/target)
	visible_message(span_boldwarning(span_orange("The unit tends to their wounds!.")))
	adjustBruteLoss(-8)
	adjustFireLoss(-8)
	adjustToxLoss(-8)
	adjustOxyLoss(-8)
	adjustCloneLoss(-8)

/mob/living/simple_mob/humanoid/astral_collective/ranged/proc/rockect_fire(atom/target)
	var/obj/item/projectile/P = new /obj/item/projectile/energy/astral_collective/damage(get_turf(src))
	P.launch_projectile(target, BP_TORSO, src)

/mob/living/simple_mob/humanoid/astral_collective/ranged/proc/gravity_surge(atom/target)
	playsound(src, 'sound/weapons/wave.ogg', 75, 1)
	for(target in range(7, src))
		target.singularity_pull(src, 3)

/mob/living/simple_mob/humanoid/astral_collective/ranged/proc/teleport_attack(atom/target)
	// Teleport attack.
	if(!target)
		to_chat(src, span_warning("There's nothing to teleport to."))
		return FALSE

	var/list/nearby_things = range(4, target)
	var/list/valid_turfs = list()

	// All this work to just go to a non-dense tile.
	for(var/turf/potential_turf in nearby_things)
		var/valid_turf = TRUE
		if(potential_turf.density)
			continue
		for(var/atom/movable/AM in potential_turf)
			if(AM.density)
				valid_turf = FALSE
		if(valid_turf)
			valid_turfs.Add(potential_turf)

	if(!(valid_turfs.len))
		to_chat(src, span_warning("There wasn't an unoccupied spot to teleport to."))
		return FALSE

	var/turf/target_turf = pick(valid_turfs)
	var/turf/T = get_turf(src)

	var/datum/effect/effect/system/spark_spread/s1 = new /datum/effect/effect/system/spark_spread
	s1.set_up(5, 1, T)
	var/datum/effect/effect/system/spark_spread/s2 = new /datum/effect/effect/system/spark_spread
	s2.set_up(5, 1, target_turf)


	T.visible_message(span_warning("\The [src] vanishes!"))
	s1.start()

	forceMove(target_turf)
	playsound(target_turf, 'sound/effects/phasein.ogg', 50, 1)
	to_chat(src, span_notice("You teleport to \the [target_turf]."))

	target_turf.visible_message(span_warning("\The [src] appears!"))
	s2.start()

/mob/living/simple_mob/humanoid/astral_collective/ranged/noodle
	health = 125
	maxHealth = 125
	desc = "A naga wrapped up in strange glowing armour."
	icon_state = "noodle"
	icon_living = "noodle"

/mob/living/simple_mob/humanoid/astral_collective/ranged/taur
	health = 125
	maxHealth = 125
	desc = "A quadrapel creature with expirmental gear.."
	icon_state = "taur"
	icon_living = "taur"

/mob/living/simple_mob/humanoid/astral_collective/ranged/tesh
	health = 50
	maxHealth = 50
	desc = "A teshari contained within prototype equipment."
	icon_state = "tesh"
	icon_living = "tesh"

/mob/living/simple_mob/humanoid/astral_collective/ranged/wolf
	health = 100
	maxHealth = 100
	desc = "A humanoid armored cannine folk."
	icon_state = "wolf"
	icon_living = "wolf"
