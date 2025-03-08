//Trying to explain Jasper's attempt at a super boss
//Phase 1 Dark Gygax but diffrent
//Phase 2 All of it's attacks are meant to be some form of CC, with a single ion attack
//Phase 3 Orginally was meant to be a timed phase but couldn't get the debuff to work. Instead melee based phase?
//Phase 4 A mix of phases 1 through 3
//Phase 5, it stands there with increased defense and shields. Bullet hell, highly rewarding if you can get melee in

/mob/living/simple_mob/mechanical/mecha/imperion
	name = "imperion"
	icon = 'icons/mecha/mecha.dmi'
	icon_state = "imperion"
	icon_living = "imperion"
	desc = "A strange precursor mecha"
	maxHealth = 400
	health = 400
	movement_cooldown = -1
	unsuitable_atoms_damage = 0
	projectiletype = /obj/item/projectile/energy/gaussrifle
	melee_attack_delay = 4 SECOND
	damage_fatigue_mult = 0
	has_repair_droid = TRUE

	size_multiplier = 2.50

	ai_holder_type = /datum/ai_holder/simple_mob/intentional/adv_dark_gygax

	ranged_attack_delay = 1.5 SECONDS

	wreckage = null
	pilot_type = null

	armor = list(
				"melee"		= 35,
				"bullet"	= 35,
				"laser"		= 35,
				"energy"	= 35,
				"bomb"		= 35,
				"bio"		= 100,
				"rad"		= 100
				)

/mob/living/simple_mob/mechanical/mecha/imperion/phase1/do_special_attack(atom/A)
	. = TRUE // So we don't fire a bolt as well.
	switch(a_intent)
		if(I_DISARM) // Side gun
			electric_defense(A)
		if(I_HURT) // Rockets
			launch_rockets(A)
		if(I_GRAB) // Micro-singulo
			launch_microsingularity(A)

/mob/living/simple_mob/mechanical/mecha/imperion/phase2/do_special_attack(atom/A)
	. = TRUE // So we don't fire a bolt as well.
	switch(a_intent)
		if(I_DISARM) // Side gun
			electric_defense(A)
		if(I_HURT) // Rockets
			launch_rockets(A)
		if(I_GRAB) // Micro-singulo
			launch_microsingularity(A)

/mob/living/simple_mob/mechanical/mecha/imperion/phase4/do_special_attack(atom/A)
	. = TRUE // So we don't fire a bolt as well.
	switch(a_intent)
		if(I_DISARM) // Side gun
			electric_defense(A)
		if(I_HURT) // Rockets
			launch_rockets(A)
		if(I_GRAB) // Micro-singulo
			launch_microsingularity(A)

/mob/living/simple_mob/mechanical/mecha/imperion/phase5/do_special_attack(atom/A)
	. = TRUE // So we don't fire a bolt as well.
	switch(a_intent)
		if(I_DISARM) // Side gun
			electric_defense(A)
		if(I_HURT) // Rockets
			launch_rockets(A)
		if(I_GRAB) // Micro-singulo
			launch_microsingularity(A)

/mob/living/simple_mob/mechanical/mecha/imperion/phase1 //Simple phase that is mostly dodge rockects
	movement_cooldown = -1
	projectiletype = /obj/item/projectile/arc/explosive_rocket
	melee_attack_delay = 4 SECOND
	ranged_attack_delay = 2.5 SECONDS

	ai_holder_type = /datum/ai_holder/simple_mob/intentional/adv_dark_gygax

	size_multiplier = 2.50

	wreckage = null
	pilot_type = /mob/living/simple_mob/mechanical/mecha/imperion/phase2

	special_attack_min_range = 1
	special_attack_max_range = 9
	special_attack_cooldown = 15 SECONDS

/mob/living/simple_mob/mechanical/mecha/imperion/phase1/proc/electric_defense(atom/target)
	set waitfor = FALSE

	// Telegraph our next move.
	Beam(target, icon_state = "sat_beam", time = 3.5 SECONDS, maxdistance = INFINITY)
	visible_message(span_warning("\The [src] deploys a missile rack!"))
	playsound(src, 'sound/effects/turret/move1.wav', 50, 1)
	sleep(0.5 SECONDS)

	for(var/i = 1 to 3)
		if(target) // Might get deleted in the meantime.
			var/turf/T = get_turf(target)
			if(T)
				visible_message(span_warning("\The [src] fires a rocket into the air!"))
				playsound(src, 'sound/weapons/rpg.ogg', 70, 1)
				face_atom(T)
				var/obj/item/projectile/arc/explosive_rocket/rocket = new(loc)
				rocket.old_style_target(T, src)
				rocket.fire()
				sleep(1 SECOND)

	visible_message(span_warning("\The [src] retracts the missile rack."))
	playsound(src, 'sound/effects/turret/move2.wav', 50, 1)

/mob/living/simple_mob/mechanical/mecha/imperion/phase1/proc/launch_rockets(atom/target)
	var/obj/item/projectile/P = new /obj/item/projectile/energy/excavate(get_turf(src))
	P.launch_projectile(target, BP_TORSO, src)

/mob/living/simple_mob/mechanical/mecha/imperion/phase1/proc/launch_microsingularity(atom/target)
	var/obj/item/projectile/P = new /obj/item/projectile/bullet/pistol/medium/hp(get_turf(src))
	P.launch_projectile(target, BP_TORSO, src)

/mob/living/simple_mob/mechanical/mecha/imperion/phase2 //Boss uses crowd control.
	movement_cooldown = -1
	projectiletype = /obj/item/projectile/mobbola
	melee_attack_delay = 4 SECOND
	alpha = 215

	ai_holder_type = /datum/ai_holder/simple_mob/intentional/adv_dark_gygax
	size_multiplier = 2.25

	wreckage = null
	pilot_type = /mob/living/simple_mob/mechanical/mecha/imperion/phase3

	special_attack_min_range = 1
	special_attack_max_range = 9
	special_attack_cooldown = 15 SECONDS

/mob/living/simple_mob/mechanical/mecha/imperion/phase2/proc/electric_defense(atom/target)
	var/turf/T = get_turf(target)
	visible_message(span_warning("\The [src] fires an energetic sphere into the air!"))
	playsound(src, 'sound/weapons/Laser.ogg', 50, 1)
	face_atom(T)
	var/obj/item/projectile/arc/microsingulo/sphere = new(loc)
	sphere.old_style_target(T, src)
	sphere.fire()

/mob/living/simple_mob/mechanical/mecha/imperion/phase2/proc/launch_rockets(atom/target)
	var/obj/item/projectile/P = new /obj/item/projectile/arc/spore(get_turf(src))
	P.launch_projectile(target, BP_TORSO, src)

/mob/living/simple_mob/mechanical/mecha/imperion/phase2/proc/launch_microsingularity(atom/target)
	var/obj/item/projectile/P = new /obj/item/projectile/ion/small(get_turf(src))
	P.launch_projectile(target, BP_TORSO, src)


/mob/living/simple_mob/mechanical/mecha/imperion/phase3 //DPS check
	movement_cooldown = -1
	projectiletype = null
	melee_attack_delay = 2 SECOND

	ai_holder_type = /datum/ai_holder/simple_mob/ranged/aggressive/meleeimperion
	size_multiplier = 2.00

	wreckage = null
	pilot_type = /mob/living/simple_mob/mechanical/mecha/imperion/phase4

	special_attack_min_range = 3
	special_attack_max_range = 14 //this thing will not let you recover during phase 3. It blitz you down, or you blitz it down.
	special_attack_cooldown = 2 SECONDS

/mob/living/simple_mob/mechanical/mecha/imperion/phase3/do_special_attack(atom/A)
	// Teleport attack.
	if(!A)
		to_chat(src, span_warning("There's nothing to teleport to."))
		return FALSE

	var/list/nearby_things = range(1, A)
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


	T.visible_message(span_notice("\The [src] vanishes!"))
	s1.start()

	forceMove(target_turf)
	playsound(target_turf, 'sound/effects/phasein.ogg', 50, 1)
	to_chat(src, span_notice("You teleport to \the [target_turf]."))

	target_turf.visible_message(span_warning("\The [src] appears!"))
	s2.start()

/datum/ai_holder/simple_mob/ranged/aggressive/meleeimperion
	home_low_priority = TRUE
	vision_range = 28 //cheesy Ai for absurdly aggressive phase

/datum/ai_holder/simple_mob/ranged/aggressive/meleeimperion/react_to_attack()
	var/obj/item/projectile/P = new /obj/item/projectile/forcebolt(get_turf(src))
	P.launch_projectile(target, BP_TORSO, src)

//Phase four, fusion time.
/mob/living/simple_mob/mechanical/mecha/imperion/phase4 //Starts to slow down
	movement_cooldown = 0
	projectiletype = /obj/item/projectile/energy/homing_bolt
	melee_attack_delay = 4 SECOND

	ai_holder_type = /datum/ai_holder/simple_mob/intentional/adv_dark_gygax

	size_multiplier = 1.75

	wreckage = null
	pilot_type = /mob/living/simple_mob/mechanical/mecha/imperion/phase5

	special_attack_min_range = 1
	special_attack_max_range = 9
	special_attack_cooldown = 12 SECONDS
	melee_attack_delay = 2 SECOND

/mob/living/simple_mob/mechanical/mecha/imperion/phase4/proc/electric_defense(atom/target)
	set waitfor = FALSE

	// Telegraph our next move.
	Beam(target, icon_state = "sat_beam", time = 3.5 SECONDS, maxdistance = INFINITY)
	visible_message(span_warning("\The [src] deploys a missile rack!"))
	playsound(src, 'sound/effects/turret/move1.wav', 50, 1)
	sleep(0.5 SECONDS)

	for(var/i = 1 to 3)
		if(target) // Might get deleted in the meantime.
			var/turf/T = get_turf(target)
			if(T)
				visible_message(span_warning("\The [src] fires a rocket into the air!"))
				playsound(src, 'sound/weapons/rpg.ogg', 70, 1)
				face_atom(T)
				var/obj/item/projectile/arc/explosive_rocket/rocket = new(loc)
				rocket.old_style_target(T, src)
				rocket.fire()
				sleep(1 SECOND)

	visible_message(span_warning("\The [src] retracts the missile rack."))
	playsound(src, 'sound/effects/turret/move2.wav', 50, 1)

/mob/living/simple_mob/mechanical/mecha/imperion/phase4/proc/launch_rockets(atom/target)
	if(!target)
		to_chat(src, span_warning("There's nothing to teleport to."))
		return FALSE

	var/list/nearby_things = range(1, target)
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


	T.visible_message(span_notice("\The [src] vanishes!"))
	s1.start()

	forceMove(target_turf)
	playsound(target_turf, 'sound/effects/phasein.ogg', 50, 1)
	to_chat(src, span_notice("You teleport to \the [target_turf]."))

	target_turf.visible_message(span_warning("\The [src] appears!"))
	s2.start()

/mob/living/simple_mob/mechanical/mecha/imperion/phase4/proc/launch_microsingularity(atom/target)
	var/turf/T = get_turf(target)
	visible_message(span_warning("\The [src] fires an energetic sphere into the air!"))
	playsound(src, 'sound/weapons/Laser.ogg', 50, 1)
	face_atom(T)
	var/obj/item/projectile/arc/microsingulo/sphere = new(loc)
	sphere.old_style_target(T, src)
	sphere.fire()



/mob/living/simple_mob/mechanical/mecha/imperion/phase5 //Final stand
	icon_state = "imperion-phase"
	icon_living = "imperion-phase"
	icon_dead = "imperion-phase"
	desc = "A precursor mecha on it's last legs, sparking, seeming vunerable up close"
	movement_cooldown = 60
	projectiletype = /obj/item/projectile/energy/homing_bolt/missile
	ranged_attack_delay = 0.5 SECONDS
	special_attack_min_range = 1
	special_attack_max_range = 9
	special_attack_cooldown = 5 SECONDS
	melee_attack_delay = 1 SECOND

	size_multiplier = 1.50

	ai_holder_type = /datum/ai_holder/simple_mob/intentional/adv_dark_gygax

	wreckage = null
	pilot_type = null
	var/obj/item/shield_projector/shields = null

	armor = list(
				"melee"		= -500,
				"bullet"	= 75,
				"laser"		= 75,
				"energy"	= 75,
				"bomb"		= 75,
				"bio"		= 100,
				"rad"		= 100
				)

	loot_list = list(/obj/item/clothing/suit/armor/alien = 60,
			/obj/item/clothing/suit/armor/alien/tank = 60,
			/obj/item/prop/alien/junk = 60,
			/obj/item/prop/alien/junk = 60,
			/obj/item/prop/alien/junk = 60,
			/obj/item/prop/alien/junk = 60,
			/obj/item/prop/alien/junk = 60,
			/obj/item/gun/energy/alien = 60,
			/obj/item/gun/energy/alien = 60,
			/obj/random/tool/alien = 60,
			/obj/random/tool/alien = 60,
			/obj/item/cell/device/weapon/recharge/alien = 60,
			/obj/item/cell/device/weapon/recharge/alien = 60,
			/obj/item/clothing/suit/armor/alien = 60,
			/obj/item/clothing/suit/armor/alien/tank = 60,
			/obj/item/prop/alien/junk = 50,
			/obj/item/prop/alien/junk = 50,
			/obj/item/prop/alien/junk = 50,
			/obj/item/prop/alien/junk = 50,
			/obj/item/prop/alien/junk = 50,
			/obj/item/gun/energy/alien = 60,
			/obj/item/gun/energy/alien = 60,
			/obj/random/tool/alien = 60,
			/obj/random/tool/alien = 60,
			/obj/item/cell/device/weapon/recharge/alien = 60,
			/obj/item/cell/device/weapon/recharge/alien = 60,
			/obj/item/clothing/suit/armor/reactive/vistor = 50,
			/obj/item/clothing/suit/armor/reactive/vistor = 50,
			/obj/item/clothing/suit/armor/protectionbubble = 50,
			/obj/item/clothing/suit/armor/protectionbubble = 50,
			/obj/item/clothing/suit/armor/tesla/vistor = 60,
			/obj/item/clothing/suit/armor/tesla/vistor = 60,
			/obj/item/shield_projector/rectangle/automatic/orange = 10,
			/obj/item/shield_projector/rectangle/automatic/imperion = 0.5,
			/obj/item/clothing/head/vrwizard = 60,
			/obj/item/clothing/suit/vrwizard = 60,
			/obj/item/gun/magic/firestaff/vrwizard/fire = 60,
			/obj/item/gun/magic/firestaff/vrwizard/frost = 60,
			/obj/item/gun/magic/firestaff/vrwizard/poison = 60,
			/obj/item/gun/magic/firestaff/vrwizard/lighting = 60,
			/obj/item/clothing/head/psy_crown/candycrown = 60,
			/obj/item/clothing/gloves/stamina = 60,
			/obj/item/clothing/suit/armor/buffvest = 60,
			/obj/item/melee/cullingcane = 60,
			/obj/item/bluespace_harpoon = 60,
			/obj/item/flame/lighter/supermatter/syndismzippo = 60,
			/obj/item/gun/energy/vepr/plasma = 60,
			/obj/item/gun/energy/medigun = 60
			)

/mob/living/simple_mob/mechanical/mecha/imperion/phase5/proc/electric_defense(atom/target)
	var/obj/item/projectile/P = new /obj/item/projectile/bullet/imperionblaster(get_turf(src))
	P.launch_projectile(target, BP_TORSO, src)
	if(prob(50))
		var/obj/item/projectile/B = new /obj/item/projectile/bullet/imperionspear(get_turf(src))
		B.launch_projectile(target, BP_TORSO, src)
	else
		var/obj/item/projectile/A = new /obj/item/projectile/bullet/imperiontesla(get_turf(src))
		A.launch_projectile(target, BP_TORSO, src)


/mob/living/simple_mob/mechanical/mecha/imperion/phase5/proc/launch_rockets(atom/target)
	var/obj/item/projectile/P = new /obj/item/projectile/bullet/imperionblaster(get_turf(src))
	P.launch_projectile(target, BP_TORSO, src)
	sleep(1.5 SECONDS)
	var/obj/item/projectile/B = new /obj/item/projectile/bullet/imperionspear(get_turf(src))
	B.launch_projectile(target, BP_TORSO, src)
	sleep(1.5 SECONDS)
	var/obj/item/projectile/A = new /obj/item/projectile/bullet/imperiontesla(get_turf(src))
	A.launch_projectile(target, BP_TORSO, src)

/mob/living/simple_mob/mechanical/mecha/imperion/phase5/proc/launch_microsingularity(atom/target)
	set waitfor = FALSE

	// Telegraph our next move.
	Beam(target, icon_state = "sat_beam", time = 3.5 SECONDS, maxdistance = INFINITY)
	visible_message(span_warning("\The [src] deploys a missile rack!"))
	playsound(src, 'sound/effects/turret/move1.wav', 50, 1)
	sleep(0.5 SECONDS)

	for(var/i = 1 to 3)
		if(target) // Might get deleted in the meantime.
			var/turf/T = get_turf(target)
			if(T)
				visible_message(span_warning("\The [src] fires a rocket into the air!"))
				playsound(src, 'sound/weapons/rpg.ogg', 70, 1)
				face_atom(T)
				var/obj/item/projectile/arc/explosive_rocket/rocket = new(loc)
				rocket.old_style_target(T, src)
				rocket.fire()
				sleep(1 SECOND)

	visible_message(span_warning("\The [src] retracts the missile rack."))
	playsound(src, 'sound/effects/turret/move2.wav', 50, 1)
	var/obj/item/projectile/P = new /obj/item/projectile/bullet/imperiontesla(get_turf(src))
	P.launch_projectile(target, BP_TORSO, src)
	if(prob(50))
		sleep(1.5)
		var/obj/item/projectile/B = new /obj/item/projectile/bullet/imperionblaster(get_turf(src))
		B.launch_projectile(target, BP_TORSO, src)
	else
		sleep(1.5)
		var/obj/item/projectile/A = new /obj/item/projectile/bullet/imperionspear(get_turf(src))
		A.launch_projectile(target, BP_TORSO, src)

/mob/living/simple_mob/mechanical/mecha/imperion/phase5/Initialize(mapload)
	shields = new /obj/item/shield_projector/rectangle/automatic/imperion(src)
	return ..()

/obj/item/shield_projector/rectangle/automatic/imperion
	shield_health = 250
	max_shield_health = 250
	shield_regen_delay = 60 SECONDS
	shield_regen_amount = 50
	size_x = 2
	size_y = 2
	color = "#631644"
	high_color = "#631644"
	low_color = "#631644"

//projectile time, mostly for phase five
/obj/item/projectile/bullet/imperionspear
	use_submunitions = 1
	only_submunitions = 1
	range = 0
	embed_chance = 0
	submunition_spread_max = 700
	submunition_spread_min = 200
	submunitions = list(/obj/item/projectile/energy/imperionspear = 5)

/obj/item/projectile/bullet/imperionspear/on_range()
	qdel(src)

/obj/item/projectile/energy/imperionspear
	name = "energy spear"
	icon_state = "arcane_barrage"
	damage = 35
	armor_penetration = 35
	damage_type = BURN
	check_armour = "laser"
	speed = 7.0

	flash_strength = 0

/obj/item/projectile/bullet/imperionblaster
	use_submunitions = 1
	only_submunitions = 1
	range = 0
	embed_chance = 0
	submunition_spread_max = 1500
	submunition_spread_min = 300
	submunitions = list(/obj/item/projectile/energy/imperionblaster = 8)

/obj/item/projectile/bullet/imperionblaster/on_range()
	qdel(src)

/obj/item/projectile/energy/imperionblaster
	name = "energy pellet"
	icon_state = "dark_pellet"
	damage = 15
	armor_penetration = 100
	damage_type = BURN
	check_armour = "laser"
	speed = 4.5

	flash_strength = 0

/obj/item/projectile/bullet/imperiontesla
	use_submunitions = 1
	only_submunitions = 1
	range = 0
	embed_chance = 0
	submunition_spread_max = 400
	submunition_spread_min = 50
	submunitions = list(/obj/item/projectile/energy/imperiontesla = 2)

/obj/item/projectile/bullet/imperiontesla/on_range()
	qdel(src)

/obj/item/projectile/energy/imperiontesla
	name = "energy sphere"
	icon_state = "tesla_projectile"
	damage = 50
	armor_penetration = 50
	damage_type = BURN
	check_armour = "energy"
	agony = 50
	speed = 10.0

	flash_strength = 0

/obj/item/projectile/energy/homing_bolt/missile
	name = "homing rocket"
	icon_state = "atrocket"
	damage = 40
	damage_type = BURN
	check_armour = "bullet"

/obj/item/projectile/energy/homing_bolt/missile/on_hit(atom/target, blocked=0)
	explosion(target, 0, 0, 2, 4)//No need to have a question.
	return 1

/obj/item/projectile/energy/homing_bolt/missile/throw_impact(atom/target, var/speed)
	explosion(target, 0, 0, 2, 4)//No need to have a question.
	qdel(src)

//Cool boss visuals, auras, and me saying no to stun.

/obj/item/grenade/shooter/laserpellet
	name = "laser pellet grenade"
	desc = "Unleashes not hit scan lasers."
	projectile_types = list(/obj/item/projectile/energy/mob/midlaser)

//te,porarly removing 	mob_overlay_state = "red_electricity_constant" to try and fix the visual bug
/datum/modifier/bossbuff
	name = "boss_buff"

	on_created_text = span_critical("You feel an intense and overwhelming rage overtake you as you go berserk!")
	on_expired_text = span_notice("The blaze of rage inside you has ran out.")
	stacks = MODIFIER_STACK_EXTEND

	disable_duration_percent = 0

/mob/living/simple_mob/mechanical/mecha/imperion/Initialize(mapload)
	add_modifier(/datum/modifier/bossbuff, null, src) // Slime is always swole.
	return ..()

/datum/modifier/aura/despair
	name = "ruin"
	mob_overlay_state = "cult_aura"

	aura_max_distance = 28

	on_created_text = span_critical("You feel like you're falling into ruin!")
	on_expired_text = span_notice("The ruin feeling is gone.")
	stacks = MODIFIER_STACK_EXTEND

/datum/modifier/aura/despair/tick()
	if(holder.stat == DEAD)
		expire()

	if(ishuman(holder)) // Robolimbs need this code sadly.
		var/mob/living/carbon/human/H = holder
		for(var/obj/item/organ/external/E in H.organs)
			var/obj/item/organ/external/O = E
			O.heal_damage(-0.1, -0.1, 0, 0)
	else
		holder.adjustBruteLoss(0.1)
		holder.adjustFireLoss(0,1)

/mob/living/simple_mob/mechanical/mecha/imperion/phase3/proc/heal_aura()
	for(var/mob/living/L in view(src, 28))
		if(L.stat == DEAD)
			continue
		L.add_modifier(/datum/modifier/aura/despair, null, src)
