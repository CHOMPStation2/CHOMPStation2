/mob/living/simple_mob/humanoid/astral_collective
	name = "Astral Collective Unit"
	tt_desc = "E Homo sapiens"
	desc = "An armored hostile."
	icon = 'modular_chomp/icons/mob/eclipse.dmi'
	icon_state = "medi"
	icon_living = "medi"
	icon_dead = "medi"
	taser_kill = 0
	catalogue_data = list(/datum/category_item/catalogue/fauna/astralcollective)
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
	melee_attack_delay = 1.25 SECONDS
	evasion = 20
	attack_sharp = 1
	attack_edge = 1
	attacktext = list("slashed", "stabbed")
	projectile_dispersion = 0
	armor = list(melee = 20, bullet = 20, laser = 20, energy = 60, bomb = 20, bio = 100, rad = 100)	// Simple mob immunuties plus minour armor

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

	movement_cooldown = 3

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
	devourable = FALSE

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
		/obj/item/slime_extract/bluespace = 10,
		/obj/item/slime_extract/ruby = 10,
		/obj/item/slime_extract/sapphire = 10,
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

/datum/category_item/catalogue/fauna/astralcollective
	name = "Astral Collective"
	desc = "A faction that lingers upon and beyond the frontier of space. Abnormal obsessive over precursor technology and \
	things that seem abnormal."
	value = CATALOGUER_REWARD_EASY

/mob/living/simple_mob/humanoid/astral_collective/Initialize(mapload)
	. = ..()
	expirmental = rand(1,4)
	expirmentresult()

/datum/modifier/astralcollect_swift
	slowdown = -0.5
	evasion = 20

/datum/modifier/astralcollect_regen
	mob_overlay_state = "pink_sparkles"

/datum/modifier/astralcollect_regen/tick()
	holder.adjustBruteLoss(-8)
	holder.adjustFireLoss(-8)
	holder.adjustToxLoss(-8)
	holder.adjustOxyLoss(-8)
	holder.adjustCloneLoss(-8)

/datum/modifier/astralcollect_titan
	max_health_percent = 1.5
	slowdown = 3

/datum/modifier/astralcollect_mistake
	mob_overlay_state = "poisoned"
	incoming_damage_percent = 1.35
	slowdown = 1
	max_health_percent = 0.75

/datum/modifier/astralcollect_solar
	mob_overlay_state = "red_electricity_constant"
	incoming_fire_damage_percent = 0.7

/datum/modifier/astralcollect_lunar
	mob_overlay_state = "blue_electricity_constant"
	incoming_brute_damage_percent = 0.7

/datum/modifier/aura/astralcollect_church
	mob_overlay_state = "redspace_aura"
	incoming_brute_damage_percent = 0.6
	incoming_fire_damage_percent = 0.6

/mob/living/simple_mob/humanoid/astral_collective/proc/expirmentresult()
	switch(expirmental)
		if(1)
			add_modifier(/datum/modifier/astralcollect_swift, null, src)
			size_multiplier -= 0.4
		if(2)
			add_modifier(/datum/modifier/astralcollect_regen, null, src)
		if(3)
			add_modifier(/datum/modifier/astralcollect_titan, null, src)
			size_multiplier += 0.5
		if(4)
			add_modifier(/datum/modifier/astralcollect_mistake, null, src)

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

	health = 100
	maxHealth = 100

	special_attack_cooldown = 7 SECONDS
	special_attack_min_range = 0
	special_attack_max_range = 2

/mob/living/simple_mob/humanoid/astral_collective/purity/do_special_attack(atom/A)
	playsound(src, 'sound/effects/ghost2.ogg', 20, 1)
	for(var/mob/living/M in orange(src, 2))
		if(M.get_ear_protection() == 0)
			M.Confuse(10)


//the basic ranged mobs
/mob/living/simple_mob/humanoid/astral_collective/ranged
	name = "Astral Collective Unit"
	projectile_accuracy = 10
	needs_reload = TRUE
	special_attack_cooldown = 10 SECONDS
	reload_max = 7
	reload_time = 1.5 SECONDS
	ranged_cooldown = 65
	projectiletype = /obj/item/projectile/energy/astral_collective/basic

/mob/living/simple_mob/humanoid/astral_collective/ranged/do_special_attack(atom/A)
	switch(expirmental)
		if(1)
			burn_beam(A)
		if(2)
			heal_beam(A)
		if(3)
			brute_beam(A)
		if(4)
			adjustBruteLoss(-40)
			adjustFireLoss(-40)

//snake creature
/mob/living/simple_mob/humanoid/astral_collective/ranged/noodle
	desc = "A naga wrapped up in strange glowing armour."
	icon_state = "noodle"
	icon_living = "noodle"

//taur creature
/mob/living/simple_mob/humanoid/astral_collective/ranged/taur
	desc = "A quadrapel creature with expirmental gear."
	icon_state = "taur"
	icon_living = "taur"
	health = 125
	maxHealth = 125

	special_attack_cooldown = 20 SECONDS
	reload_max = 15
	reload_time = 3.5 SECONDS
	ranged_cooldown = 85
	movement_cooldown = 1

//teshari
/mob/living/simple_mob/humanoid/astral_collective/ranged/tesh
	desc = "A teshari contained within prototype equipment."
	icon_state = "tesh"
	icon_living = "tesh"
	health = 50
	maxHealth = 50

	special_attack_cooldown = 5 SECONDS
	reload_max = 2
	reload_time = 2 SECONDS
	ranged_cooldown = 40
	movement_cooldown = -1

//cannine
/mob/living/simple_mob/humanoid/astral_collective/ranged/wolf
	desc = "A humanoid armored cannine folk."
	icon_state = "wolf"
	icon_living = "wolf"
	special_attack_cooldown = 13 SECONDS
	reload_max = 5
	reload_time = 0.5 SECONDS
	ranged_cooldown = 70

//lizard
/mob/living/simple_mob/humanoid/astral_collective/ranged/lizard
	desc = "A humanoid heavily armoured lizardfolk."
	icon_state = "breacher"
	icon_living = "breacher"
	health = 150
	maxHealth = 150

	needs_reload = FALSE
	special_attack_cooldown = 20 SECONDS
	ranged_cooldown = 90
	movement_cooldown = 5

//zaddat
/mob/living/simple_mob/humanoid/astral_collective/ranged/zaddat
	desc = "An armoured zaddat."
	icon_state = "zaddat"
	icon_living = "zaddat"
	needs_reload = FALSE
	special_attack_cooldown = 6 SECONDS
	ranged_cooldown = 30

/mob/living/simple_mob/humanoid/astral_collective/ranged/zaddat/bullet_act(obj/item/projectile/Proj)
	if(!Proj)
		return
	if(prob(60))
		visible_message(span_boldwarning(span_orange("[Proj] is blocked by the shield.")))
		if(Proj.firer)
			ai_holder.react_to_attack(Proj.firer)
		return
	else
		..()

/mob/living/simple_mob/humanoid/astral_collective/proc/heal_beam(atom/target)
	if(!target)
		return FALSE
	for(var/mob/living/L in orange(src, 5))
		if(IIsAlly(L))
			Beam(L, icon_state = "g_beam", time = 2.5 SECONDS, maxdistance = INFINITY)
			L.adjustBruteLoss(-30)
			L.adjustFireLoss(-30)

/mob/living/simple_mob/humanoid/astral_collective/proc/burn_beam(atom/target)
	if(!target)
		return FALSE
	for(var/mob/living/L in orange(src, 5))
		if(IIsAlly(L))
			Beam(L, icon_state = "g_beam", time = 2.5 SECONDS, maxdistance = INFINITY)
			L.add_modifier(/datum/modifier/astralcollect_solar, null, src)

/mob/living/simple_mob/humanoid/astral_collective/proc/brute_beam(atom/target)
	if(!target)
		return FALSE
	for(var/mob/living/L in orange(src, 5))
		if(IIsAlly(L))
			Beam(L, icon_state = "g_beam", time = 2.5 SECONDS, maxdistance = INFINITY)
			L.add_modifier(/datum/modifier/astralcollect_lunar, null, src)

/mob/living/simple_mob/humanoid/astral_collective/proc/teleport_attack(atom/target)
	// Teleport attack.
	if(!target)
		to_chat(src, span_warning("There's nothing to teleport to."))
		return FALSE

	var/list/nearby_things = range(5, src)
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

//specialized units
//This names are wierd but corespond to the differing branches
//Body is the security branches. Their goal is to effecitly kill you, or CC via area dsamage
/mob/living/simple_mob/humanoid/astral_collective/body
	name = "Astral Collective Enforcement"
	projectiletype = /obj/item/projectile/energy/astral_collective/basic
	health = 125
	maxHealth = 125

/mob/living/simple_mob/humanoid/astral_collective/body/dagger
	projectiletype = /obj/item/projectile/energy/astral_collective/dagger
	special_attack_cooldown = 15 SECONDS
	icon_state = "blade_tosser"
	icon_living = "blade_tosser"

/mob/living/simple_mob/humanoid/astral_collective/body/dagger/attackby(obj/item/O as obj, mob/user as mob)
	if(prob(50))
		teleport_attack(src)
	..()

/mob/living/simple_mob/humanoid/astral_collective/body/dagger/bullet_act(obj/item/projectile/Proj)
	if(prob(50))
		teleport_attack(src)
	..()

/mob/living/simple_mob/humanoid/astral_collective/body/dagger/do_special_attack(atom/A)
	for(var/mob/living/L in orange(src, 7))
		if(L.stat != DEAD && !IIsAlly(L))
			L.add_modifier(/datum/modifier/mmo_drop/eclipse_dagger, 3, src)

/mob/living/simple_mob/humanoid/astral_collective/body/juggernaught
	icon_state = "breaker"
	icon_living = "breaker"
	special_attack_min_range = 0
	special_attack_max_range = 3
	special_attack_cooldown = 18 SECONDS

/mob/living/simple_mob/humanoid/astral_collective/body/juggernaught/do_special_attack(atom/A)
	playsound(src, 'sound/effects/ghost2.ogg', 20, 1)
	for(var/mob/living/M in orange(src, 3))
		if(M.get_ear_protection() == 0)
			M.Stun(0.5)

//The mind is the science branch. Their goal is to limit or disable your options
/mob/living/simple_mob/humanoid/astral_collective/mind
	name = "Astral Collective Researcher"
	health = 125
	maxHealth = 125

/mob/living/simple_mob/humanoid/astral_collective/mind/gravity
	icon_state = "space"
	icon_living = "space"
	projectiletype = /obj/item/projectile/energy/astral_collective/basic
	special_attack_cooldown = 10 SECONDS

//Gravity shield. Hit it with melee, and a sudden gravity surge may tear your weapon to the ground
/mob/living/simple_mob/humanoid/astral_collective/mind/gravity/attackby(obj/item/O as obj, mob/user as mob)
	if(O.force)
		if(prob(30))
			visible_message(span_boldwarning(span_orange("[O] is pulled to the ground!.")))
			user.drop_item()
			return
		else
			..()
	else
		..()

/mob/living/simple_mob/humanoid/astral_collective/mind/gravity/do_special_attack(atom/A)
	for(var/mob/living/L in orange(src, 7)) //despite the attack range being 6 we do 7 so folks don't wander in then get confused why they are getting hit by it
		Beam(L, icon_state = "chain", time = 1.5 SECONDS, maxdistance = 6)
	addtimer(CALLBACK(src, PROC_REF(super_move), A), 2.5 SECONDS, TIMER_DELETE_ME)

/mob/living/simple_mob/humanoid/astral_collective/mind/gravity/proc/super_move(atom/target)
	if(!target)
		return FALSE
	for(var/mob/living/L in orange(src, 6))
		L.throw_at(get_edge_target_turf(L, L.dir), rand(2,6), 10)

/mob/living/simple_mob/humanoid/astral_collective/mind/fire
	desc = "An armored vox wielding a flamethrower. The phoron tank seems explosive."
	icon_state = "flamer"
	icon_living = "flamer"
	projectiletype = /obj/item/projectile/energy/astral_collective/fire

/mob/living/simple_mob/humanoid/astral_collective/mind/fire/death()
	explosion(src.loc, 0, 2, 0, 0)
	return ..()

//The soul is the relogious branch. Their goal is to limit your offense
/mob/living/simple_mob/humanoid/astral_collective/soul
	name = "Astral Collective Soulspeaker" //I swear if anyone takes this name litterally
	health = 150
	maxHealth = 150

/mob/living/simple_mob/humanoid/astral_collective/soul/spear_bearer
	ai_holder_type = /datum/ai_holder/simple_mob/melee/evasive/astral_collective
	melee_damage_lower = 27 //25ish with explo voidsuit
	melee_damage_upper = 27
	attack_armor_pen = 40
	melee_attack_delay = 1.5 SECONDS
	special_attack_cooldown = 10 SECONDS
	icon_state = "clock_cat_shield"
	icon_living = "clock_cat_shield"
	var/barrier_health = 3

/mob/living/simple_mob/humanoid/astral_collective/soul/spear_bearer/do_special_attack(atom/A)
	barrier_health ++
	icon_state = "clock_cat_shield"

/mob/living/simple_mob/humanoid/astral_collective/soul/spear_bearer/bullet_act(obj/item/projectile/Proj)
	if(!Proj)
		return
	if(barrier_health > 0)
		barrier_health --
		visible_message(span_boldwarning(span_orange("[Proj] is blocked by the shield.")))
		if(Proj.firer)
			ai_holder.react_to_attack(Proj.firer)
		if(barrier_health == 0)
			icon_state = "clock_cat"
		return
	else
		..()

/mob/living/simple_mob/humanoid/astral_collective/soul/shield_projector
	projectiletype = /obj/item/projectile/energy/astral_collective/spear
	special_attack_cooldown = 40 SECONDS
	icon_state = "clock_sergal"
	icon_living = "clock_sergal"

/mob/living/simple_mob/humanoid/astral_collective/soul/shield_projector/do_special_attack(atom/A)
	adjustBruteLoss(-200)
	adjustFireLoss(-200)

/mob/living/simple_mob/humanoid/astral_collective/soul/shield_projector/handle_special()
	if(stat != DEAD)
		protection_aura()
	..()

/mob/living/simple_mob/humanoid/astral_collective/soul/shield_projector/proc/protection_aura()
	for(var/mob/living/L in view(src, 5))
		if(L.stat == DEAD || !IIsAlly(L))
			continue
			L.add_modifier(/datum/modifier/aura/astralcollect_church, null, src)
