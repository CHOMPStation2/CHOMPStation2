/mob/living/simple_mob/humanoid/astral_collective
	name = "Astral Collective Unit"
	tt_desc = "E Homo sapiens"
	desc = "You shouldn't be seeing this."
	icon = 'modular_chomp/icons/mob/eclipse.dmi'
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
	armor = list(melee = 30, bullet = 30, laser = 30, energy = 60, bomb = 20, bio = 100, rad = 100)	// Simple mob immunuties plus minour armor

	can_be_drop_prey = FALSE
	can_be_drop_pred = TRUE
	pass_flags = PASSTABLE //mostly for the melee mobs.
	softfall = TRUE //highly advanced spacesuit stuff

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

	movement_cooldown = 0

	loot_list = list(/obj/item/slime_extract/sepia  = 75,
		/obj/item/bone/skull = 100,
		/obj/item/seeds/random = 60,
		/obj/random/powercell = 20,
		/obj/random/medical/pillbottle = 7,
		/obj/random/firstaid = 3,
		/obj/random/grenade/box = 5,
		/obj/random/tool/power = 30,
		/obj/random/tool/alien = 20,
		/obj/random/tech_supply/component/nofail = 40,
		/obj/random/medical = 12,
		/obj/random/cash/big = 25,
		/obj/random/material = 60,
		/obj/random/material/refined = 50,
		/obj/random/material/precious = 40,
		/obj/random/janusmodule = 3,
		/obj/item/dnainjector/random_verybad = 10,
		/obj/item/stock_parts/scanning_module/omni = 10,
		/obj/item/stock_parts/micro_laser/omni = 10,
		/obj/item/stock_parts/capacitor/omni = 10,
		/obj/item/stock_parts/manipulator/omni = 10,
		/obj/item/stock_parts/matter_bin/omni = 10,
		/obj/item/stock_parts/scanning_module/hyper = 25,
		/obj/item/stock_parts/micro_laser/hyper = 25,
		/obj/item/stock_parts/capacitor/hyper = 25,
		/obj/item/stock_parts/manipulator/hyper = 25,
		/obj/item/stock_parts/matter_bin/hyper = 25,
		/obj/item/assembly/signaler/anomaly/flux = 7,
		/obj/item/assembly/signaler/anomaly/bluespace = 7,
		/obj/item/assembly/signaler/anomaly/grav = 7,
		/obj/item/assembly/signaler/anomaly/dimensional = 7,
		/obj/item/assembly/signaler/anomaly/bioscrambler = 7,
		/obj/item/assembly/signaler/anomaly/hallucination = 7,
		/obj/item/assembly/signaler/anomaly/pyro = 7,
		/obj/item/assembly/signaler/anomaly/weather = 7,
		)


	var/expirmental

/mob/living/simple_mob/humanoid/astral_collective/Initialize(mapload)
	. = ..()
	expirmental = rand(1,7)
	expirmentresult()

/datum/modifier/astralcollect_swift
	slowdown = -0.5
	evasion = 20

/datum/modifier/astralcollect_regen
	mob_overlay_state = "poisoned"

/datum/modifier/astralcollect_regen/tick()
	holder.adjustBruteLoss(-8)
	holder.adjustFireLoss(-8)
	holder.adjustToxLoss(-8)
	holder.adjustOxyLoss(-8)
	holder.adjustCloneLoss(-8)

/datum/modifier/astralcollect_titan
	max_health_percent = 1.8

/datum/modifier/astralcollect_armour
	incoming_damage_percent = 0.65

/datum/modifier/astralcollect_mistake
	mob_overlay_state = "poisoned"
	incoming_damage_percent = 1.35
	slowdown = 1
	max_health_percent = 0.75

/datum/modifier/astralcollect_solar
	mob_overlay_state = "red_electricity_constant"
	incoming_brute_damage_percent = 2
	incoming_fire_damage_percent = 0.3

/datum/modifier/astralcollect_lunar
	mob_overlay_state = "blue_electricity_constant"
	incoming_brute_damage_percent = 0.3
	incoming_fire_damage_percent = 2

/mob/living/simple_mob/humanoid/astral_collective/proc/expirmentresult()
	switch(expirmental)
		if(1)
			add_modifier(/datum/modifier/astralcollect_swift, null, src)
			size_multiplier -= 0.3
		if(2)
			add_modifier(/datum/modifier/astralcollect_regen, null, src)
		if(3)
			add_modifier(/datum/modifier/astralcollect_titan, null, src)
			size_multiplier += 0.6
		if(4)
			add_modifier(/datum/modifier/astralcollect_armour, null, src)
			size_multiplier += 0.3
		if(5)
			add_modifier(/datum/modifier/astralcollect_mistake, null, src)
		if(6)
			add_modifier(/datum/modifier/astralcollect_solar, null, src)
		if(7)
			add_modifier(/datum/modifier/astralcollect_lunar, null, src)
		if(8)
			ai_holder_type = /datum/ai_holder/hostile/ranged/robust
		if(9)
			ai_holder_type = /datum/ai_holder/simple_mob/intentional/adv_dark_gygax
		if(10)
			projectile_dispersion = 10

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
	name = "Astral Collective Purity"
	desc = "A strange living bioweapon"
	icon_state = "purity"
	icon_living = "purity"
	ai_holder_type = /datum/ai_holder/simple_mob/melee/evasive/astral_collective
	melee_damage_lower = 32 //25ish with explo voidsuit
	melee_damage_upper = 32
	attack_armor_pen = 20
	melee_attack_delay = 1.5 SECONDS

	health = 200
	maxHealth = 200

	special_attack_cooldown = 3 SECONDS
	special_attack_min_range = 0
	special_attack_max_range = 14

/mob/living/simple_mob/humanoid/astral_collective/purity/do_special_attack(atom/A)
	adjustBruteLoss(-3)
	adjustFireLoss(-3)
	adjustToxLoss(-3)
	adjustOxyLoss(-3)
	adjustCloneLoss(-3)

//the ranged mobs
/mob/living/simple_mob/humanoid/astral_collective/ranged
	name = "Astral Collective Unit"
	projectile_accuracy = 10
	needs_reload = TRUE
	special_attack_cooldown = 7 SECONDS
	reload_max = 7
	reload_time = 1.5 SECONDS
	ranged_cooldown = 65

//snake creature
/mob/living/simple_mob/humanoid/astral_collective/ranged/noodle
	desc = "A naga wrapped up in strange glowing armour."
	icon_state = "noodle"
	icon_living = "noodle"
	projectiletype = /obj/item/projectile/energy/astral_collective/anti_mecha

/mob/living/simple_mob/humanoid/astral_collective/ranged/noodle/do_special_attack(atom/A)
	if((health / maxHealth) <= 0.5)
		alpha = 180
	teleport_self(A)

//taur creature
/mob/living/simple_mob/humanoid/astral_collective/ranged/taur
	desc = "A quadrapel creature with expirmental gear."
	icon_state = "taur"
	icon_living = "taur"
	projectiletype = /obj/item/projectile/energy/astral_collective/armour_breaker
	health = 125
	maxHealth = 125

/mob/living/simple_mob/humanoid/astral_collective/ranged/taur/do_special_attack(atom/A)
	expirmental = rand(1,5)
	switch(expirmental)
		if(1)
			teleport_attack(A)
		if(2)
			gravity_surge(A)
		if(3)
			air_strike(A)
		if(4)
			repair_self(A)
		if(5)
			teleport_self(A)

//teshari
/mob/living/simple_mob/humanoid/astral_collective/ranged/tesh
	desc = "A teshari contained within prototype equipment."
	icon_state = "tesh"
	icon_living = "tesh"
	projectiletype = /obj/item/projectile/energy/astral_collective/particle
	health = 75
	maxHealth = 75

/mob/living/simple_mob/humanoid/astral_collective/ranged/tesh/do_special_attack(atom/A)
	if((health / maxHealth) <= 0.5)
		selfexplode_attack(A)
	else
		teleport_attack(A)

//cannine
/mob/living/simple_mob/humanoid/astral_collective/ranged/wolf
	desc = "A humanoid armored cannine folk."
	icon_state = "wolf"
	icon_living = "wolf"
	projectiletype = /obj/item/projectile/energy/astral_collective/green

/mob/living/simple_mob/humanoid/astral_collective/ranged/wolf/do_special_attack(atom/A)
	gravity_surge(A)

//lizard
/mob/living/simple_mob/humanoid/astral_collective/ranged/lizard
	desc = "A humanoid heavily armoured lizardfolk."
	icon_state = "breacher"
	icon_living = "breacher"
	projectiletype = /obj/item/projectile/energy/astral_collective/searing
	health = 150
	maxHealth = 150

/mob/living/simple_mob/humanoid/astral_collective/ranged/lizard/do_special_attack(atom/A)
	if((health / maxHealth) <= 0.5)
		repair_self(A)
	air_strike(A)

//zaddat
/mob/living/simple_mob/humanoid/astral_collective/ranged/zaddat
	desc = "An armoured zaddat."
	icon_state = "zaddat"
	icon_living = "zaddat"
	special_attack_cooldown = 1 SECOND

/mob/living/simple_mob/humanoid/astral_collective/ranged/zaddat/do_special_attack(atom/A)
	projectiletype = pick(/obj/item/projectile/energy/astral_collective/anti_mecha, /obj/item/projectile/energy/astral_collective/armour_breaker, /obj/item/projectile/energy/astral_collective/searing, /obj/item/projectile/energy/astral_collective/green, /obj/item/projectile/energy/astral_collective/particle)

/mob/living/simple_mob/humanoid/astral_collective/ranged/zaddat/bullet_act(var/obj/item/projectile/Proj)
	if(!Proj)
		return
	if(prob(60))
		visible_message(span_bolddanger("[Proj] is blocked by the shield."))
		if(Proj.firer)
			ai_holder.react_to_attack(Proj.firer)
		return
	else
		..()

/mob/living/simple_mob/humanoid/astral_collective/proc/teleport_attack(atom/target)
	// Teleport attack.
	if(!target)
		to_chat(src, span_warning("There's nothing to teleport to."))
		return FALSE

	var/list/nearby_things = range(2, src)
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

	do_teleport(target, target_turf, channel = TELEPORT_CHANNEL_QUANTUM)

/mob/living/simple_mob/humanoid/astral_collective/proc/selfexplode_attack(atom/target)
	if(!target)
		return FALSE
	explosion(src.loc, 2, 3, 4, 5)

/mob/living/simple_mob/humanoid/astral_collective/proc/gravity_surge(atom/target)
	if(!target)
		return FALSE
	playsound(src, 'sound/weapons/wave.ogg', 75, 1)
	for(target in range(7, src))
		target.singularity_pull(src, 3)

/mob/living/simple_mob/humanoid/astral_collective/proc/air_strike(atom/target)
	if(!target)
		return FALSE
	for(var/mob/living/L in orange(src, 14))
		if(L.stat != DEAD && !IIsAlly(L))
			L.add_modifier(/datum/modifier/mmo_drop/blade_boss_short, 3, src)

/mob/living/simple_mob/humanoid/astral_collective/proc/repair_self(atom/target)
	if(!target)
		return FALSE
	adjustBruteLoss(-70)
	adjustFireLoss(-70)
	adjustToxLoss(-70)
	adjustOxyLoss(-70)
	adjustCloneLoss(-70)

/mob/living/simple_mob/humanoid/astral_collective/proc/teleport_self(atom/A)
	// Teleport attack.
	if(!A)
		to_chat(src, span_warning("There's nothing to teleport to."))
		return FALSE

	var/list/nearby_things = range(4, A)
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
