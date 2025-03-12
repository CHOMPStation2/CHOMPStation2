/mob/living/simple_mob/humanoid/eclipse/head
	name = "Eclipse Head"
	desc = "You shouldn't be seeing this. This is going to be rough"
	health = 315
	maxHealth = 315 //A 20 damae shot will need to land 35 times
	projectile_dispersion = 8
	projectile_accuracy = 0
	ranged_cooldown = 5
	grab_resist = 100

	damage_fatigue_mult = 0

	armor = list(melee = 20, bullet = 20, laser = 20, energy = 20, bomb = 100, bio = 100, rad = 100)
	armor_soak = list(melee = 7, bullet = 7, laser = 7, energy = 7, bomb = 0, bio = 0, rad = 0)
	has_heal_droid = TRUE

/mob/living/simple_mob/humanoid/eclipse/head/security
	name = "Eclipse Head Of Security"
	icon_state = "fleetsec"
	projectiletype = /obj/item/projectile/energy/flamecrystal
	special_attack_cooldown = 10 SECONDS
	special_attack_min_range = 1
	special_attack_max_range = 8
	has_heal_droid = TRUE
	specialattackprojectile = /obj/item/projectile/bullet/dragon
	loot_list = list(/obj/item/gun/energy/flamegun = 100,
		/obj/item/bone/skull = 100
			)

/mob/living/simple_mob/humanoid/eclipse/head/security/do_special_attack(atom/A)
	if(vore_fullness > 3)
		bomb_chaos(A)
	else if(vore_fullness > 0)
		visible_message(span_warning("\The [src]'s maw glows!"))
		Beam(A, icon_state = "sat_beam", time = 2.5 SECONDS, maxdistance = INFINITY)
		addtimer(CALLBACK(src, PROC_REF(special_projectile), A), 3 SECONDS, TIMER_DELETE_ME)
	else
		if(prob(50))
			visible_message(span_warning("\The [src] throws out a chain!"))
			Beam(A, icon_state = "chain", time = 3 SECONDS, maxdistance = INFINITY)
			addtimer(CALLBACK(src, PROC_REF(gravity_pull), A), 3 SECOND, TIMER_DELETE_ME)
		else
			visible_message(span_warning("\The [src] throws out a chain!"))
			Beam(A, icon_state = "chain", time = 3 SECONDS, maxdistance = INFINITY)
			addtimer(CALLBACK(src, PROC_REF(itemyoink), A), 3 SECOND, TIMER_DELETE_ME)

/obj/item/projectile/energy/flamecrystal
	name = "Flame Crystal"
	icon = 'modular_chomp/icons/mob/eclipse.dmi' //commiting sin
	icon_state = "firecrystal"
	damage = 15
	armor_penetration = 40 //Large pointy crystal
	damage_type = BRUTE
	check_armour = "bullet"
	modifier_type_to_apply = /datum/modifier/fire/weak
	modifier_duration = 0.05 MINUTE
	range = 12
	hud_state = "laser_sniper"

/obj/item/projectile/bullet/flamegun
	use_submunitions = 1
	only_submunitions = 1
	range = 0
	embed_chance = 0
	submunition_spread_max = 800
	submunition_spread_min = 200
	submunitions = list(/obj/item/projectile/energy/flamecrystal = 3)
	hud_state = "laser_heat"

/obj/item/projectile/bullet/flamegun/on_range()
	qdel(src)

/mob/living/simple_mob/humanoid/eclipse/head/scientist
	name = "Eclipse Lead Researcher"
	icon_state = "fleetsci"
	maxHealth = 60
	health = 60
	special_attack_cooldown = 5 SECONDS
	special_attack_min_range = 1
	special_attack_max_range = 10
	projectiletype = /obj/item/projectile/bullet/pistol/ap

	loot_list = list(/obj/item/circuitboard/mecha/imperion/targeting = 60,
		/obj/item/circuitboard/mecha/gygax/peripherals = 60,
		/obj/item/prop/alien/phasecoil = 60,
		/obj/item/circuitboard/mecha/durand/peripherals = 60,
		/obj/item/bluespace_harpoon = 10,
		/obj/item/bone/skull = 100
			)

	var/obj/item/shield_projector/shield1 = null
	var/obj/item/shield_projector/shield2 = null
	var/obj/item/shield_projector/shield3 = null

/mob/living/simple_mob/humanoid/eclipse/head/scientist/Initialize(mapload)
	shield1 = new /obj/item/shield_projector/rectangle/automatic/eclipse(src)
	shield2 = new /obj/item/shield_projector/rectangle/automatic/eclipse/medium(src)
	shield3 = new /obj/item/shield_projector/rectangle/automatic/eclipse/big(src)
	return ..()

/obj/item/shield_projector/rectangle/automatic/eclipse
	name = "cult shield stone"
	icon = 'icons/obj/device.dmi'
	icon_state = "implant_melted"
	shield_health = 100
	max_shield_health = 100
	shield_regen_delay = 120 SECONDS
	shield_regen_amount = 100
	size_x = 1
	size_y = 1
	color = "#FF6600"
	high_color = "#0099CC"
	low_color = "#660066"

/obj/item/shield_projector/rectangle/automatic/eclipse/medium
	size_x = 2
	size_y = 2

/obj/item/shield_projector/rectangle/automatic/eclipse/big
	size_x = 3
	size_y = 3

/mob/living/simple_mob/mechanical/hivebot/swarm/eclipse
	faction = FACTION_ECLIPSE

/mob/living/simple_mob/mechanical/combat_drone/artillery
	faction = FACTION_ECLIPSE
	projectiletype = /obj/item/projectile/arc/blue_energy

/mob/living/simple_mob/humanoid/eclipse/head/captain
	name = "Eclipse Expedition Leader"
	icon_state = "captain"

/mob/living/simple_mob/humanoid/eclipse/head/tyrlead
	name = "Eclipse Precursor Overseer"
	icon_state = "overseer_shield"
	icon_living = "overseer_shield"
	special_attack_cooldown = 4 SECONDS
	special_attack_min_range = 1
	special_attack_max_range = 8
	projectiletype = /obj/item/projectile/energy/homing_bolt
	ai_holder_type = /datum/ai_holder/simple_mob/intentional/adv_dark_gygax
	var/fullshield = 4
	var/shieldrage = 4

/mob/living/simple_mob/humanoid/eclipse/head/tyrlead/bullet_act(obj/item/projectile/P) //Projectiles will be absorbed by the shield. Note to self do funky sprite. 4 hits to remove
	if(fullshield > 0)
		fullshield--
		if(P == /obj/item/projectile/ion)
			fullshield = 0
			visible_message(span_boldwarning(span_orange("[P] breaks the shield!!.")))
			icon_state = "overseer"
		if(fullshield > 0)
			visible_message(span_boldwarning(span_orange("[P] is absorbed by the shield!.")))
		else
			visible_message(span_boldwarning(span_orange("[P] breaks the shield!!.")))
			icon_state = "overseer"
	else
		..()
		shieldrage--
		if(shieldrage == 0)
			shieldrage = 4
			fullshield = 4
			visible_message(span_boldwarning(span_orange("The shield reactivates!!.")))
			icon_state = "overseer_shield"

/mob/living/simple_mob/humanoid/eclipse/head/tyrlead/do_special_attack(atom/A)
	var/deathdir = rand(1,3)
	switch(deathdir)
		if(1)
			teleport(A)
		if(2)
			bomb_chaos(A)
		if(3)
			bomb_lines(A)

/mob/living/simple_mob/humanoid/eclipse/head/engineer //teshari
	name = "Eclipse Chief Engineer"
	icon_state = "engi"
	icon_living = "engi"
	health = 50
	maxHealth = 50
	melee_damage_lower = 60 //Durasteel fireaxe
	melee_damage_upper = 60
	projectiletype = null

	loot_list = list(/obj/item/stock_parts/matter_bin/omni = 60,
		/obj/item/material/twohanded/fireaxe  = 60,
		/obj/item/storage/toolbox/syndicate/powertools = 60,
		/obj/item/rig/ce = 60,
		/obj/item/rig_module/teleporter = 5
			)

/mob/living/simple_mob/humanoid/eclipse/head/engineer/Initialize(mapload)
	add_modifier(/datum/modifier/technomancer/haste, null, src) // tesh goes nyooooom
	return ..()

/mob/living/simple_mob/humanoid/eclipse/head/medical
	name = "Eclipse Chief Medical Officer"
	icon_state = "medi"
	icon_living = "medi"
	health = 150
	maxHealth = 150
	special_attack_cooldown = 5 SECONDS
	special_attack_min_range = 0
	special_attack_max_range = 7
	melee_damage_lower = 15 //Durasteel fireaxe
	melee_damage_upper = 15
	attack_armor_pen = 60
	projectiletype = null

	loot_list = list(/obj/item/rig_module/atmos_shield  = 60,
		/obj/item/rig_module/rad_shield/advanced = 60,
		/obj/item/rig/baymed = 60,
		/obj/item/ammo_casing/microbattery/medical/brute3 = 15,
		/obj/item/ammo_casing/microbattery/medical/burn3 = 15,
		/obj/item/ammo_casing/microbattery/medical/toxin3 = 15,
		/obj/item/ammo_casing/microbattery/medical/omni3 = 5
			)

	var/cloaked_alpha = 45			// Lower = Harder to see.
	var/cloak_cooldown = 5 SECONDS	// Amount of time needed to re-cloak after losing it.
	var/last_uncloak = 0			// world.time
	var/poison_type = REAGENT_ID_STOXIN
	var/poison_per_bite = 8
	var/poison_chance = 80

/mob/living/simple_mob/humanoid/eclipse/head/medical/apply_melee_effects(var/atom/A)
	if(isliving(A))
		var/mob/living/L = A
		if(L.reagents)
			var/target_zone = pick(BP_TORSO,BP_TORSO,BP_TORSO,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_HEAD)
			if(L.can_inject(src, null, target_zone))
				inject_poison(L, target_zone)

/mob/living/simple_mob/humanoid/eclipse/head/medical/proc/inject_poison(mob/living/L, target_zone)
	if(prob(poison_chance))
		to_chat(L, span_warning("You feel a tiny prick."))
		L.reagents.add_reagent(poison_type, poison_per_bite)

/mob/living/simple_mob/humanoid/eclipse/head/medical/cloak()
	if(cloaked)
		return
	animate(src, alpha = cloaked_alpha, time = 1 SECOND)
	cloaked = TRUE


/mob/living/simple_mob/humanoid/eclipse/head/medical/uncloak()
	last_uncloak = world.time // This is assigned even if it isn't cloaked already, to 'reset' the timer if the spider is continously getting attacked.
	if(!cloaked)
		return
	animate(src, alpha = initial(alpha), time = 1 SECOND)
	cloaked = FALSE

// Check if cloaking if possible.
/mob/living/simple_mob/humanoid/eclipse/head/medical/proc/can_cloak()
	if(stat)
		return FALSE
	if(last_uncloak + cloak_cooldown > world.time)
		return FALSE

	return TRUE

// Called by things that break cloaks, like Technomancer wards.
/mob/living/simple_mob/humanoid/eclipse/head/medical/break_cloak()
	uncloak()


/mob/living/simple_mob/humanoid/eclipse/head/medical/is_cloaked()
	return cloaked


// Cloaks the spider automatically, if possible.
/mob/living/simple_mob/humanoid/eclipse/head/medical/handle_special()
	if(!cloaked && can_cloak())
		cloak()


//special attack things
/mob/living/simple_mob/humanoid/eclipse/head/scientist/do_special_attack(atom/A)
	addtimer(CALLBACK(src, PROC_REF(summon_drones), A, 3, 0.5 SECONDS), 0.5 SECONDS, TIMER_DELETE_ME)

/mob/living/simple_mob/humanoid/eclipse/proc/summon_drones(atom/target, var/amount, var/fire_delay)
	if(!target)
		return
	var/deathdir = rand(1,3)
	switch(deathdir)
		if(1)
			new /mob/living/simple_mob/mechanical/mining_drone/scavenger/eclipse (src.loc)
		if(2)
			new /mob/living/simple_mob/mechanical/hivebot/swarm/eclipse (src.loc)
		if(3)
			new /mob/living/simple_mob/mechanical/combat_drone/artillery
	amount--
	if(amount > 0)
		addtimer(CALLBACK(src, PROC_REF(summon_drones), target, amount, fire_delay), fire_delay, TIMER_DELETE_ME)


/mob/living/simple_mob/humanoid/eclipse/head/medical/do_special_attack(atom/A)
	if(!cloaked)
		teleport(A)

/mob/living/simple_mob/humanoid/eclipse/proc/teleport(atom/A)
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

/mob/living/simple_mob/humanoid/eclipse/head/cargomaster //Naga
	name = "Eclipse Cargo Master"


/mob/living/simple_mob/humanoid/eclipse/proc/bomb_lines(atom/A)
	if(!A)
		return
	var/list/potential_targets = ai_holder.list_targets()
	for(var/atom/entry in potential_targets)
		if(istype(entry, /mob/living/simple_mob/humanoid/eclipse))
			potential_targets -= entry
	if(potential_targets.len)
		var/iteration = clamp(potential_targets.len, 1, 3)
		for(var/i = 0, i < iteration, i++)
			if(!(potential_targets.len))
				break
			var/mob/target = pick(potential_targets)
			potential_targets -= target
			spawn_lines(target)


/mob/living/simple_mob/humanoid/eclipse/proc/spawn_lines(atom/target)
	var/alignment = rand(1,2)	// 1 for vertical, 2 for horizontal
	var/list/line_range = list()
	var/turf/T = get_turf(target)
	line_range += T
	for(var/i = 1, i <= 7, i++)
		switch(alignment)
			if(1)
				if(T.x-i > 0)
					line_range += locate(T.x-i, T.y-i, T.z)
				if(T.x+i <= world.maxx)
					line_range += locate(T.x+i, T.y+i, T.z)
				if(T.y-i > 0)
					line_range += locate(T.x+i, T.y-i, T.z)
				if(T.y+i <= world.maxy)
					line_range += locate(T.x-i, T.y+i, T.z)
			if(2)
				if(T.x-i > 0)
					line_range += locate(T.x-i, T.y, T.z)
				if(T.x+i <= world.maxx)
					line_range += locate(T.x+i, T.y, T.z)
				if(T.y-i > 0)
					line_range += locate(T.x, T.y-i, T.z)
				if(T.y+i <= world.maxy)
					line_range += locate(T.x, T.y+i, T.z)
	for(var/turf/dropspot in line_range)
		new artidrop(dropspot)


/mob/living/simple_mob/humanoid/eclipse/proc/bomb_chaos(atom/A)
	if(!A)
		return
	var/list/potential_targets = ai_holder.list_targets()
	for(var/atom/entry in potential_targets)
		if(istype(entry, /mob/living/simple_mob/humanoid/eclipse))
			potential_targets -= entry
	if(potential_targets.len)
		var/iteration = clamp(potential_targets.len, 1, 3)
		for(var/i = 0, i < iteration, i++)
			if(!(potential_targets.len))
				break
			var/mob/target = pick(potential_targets)
			potential_targets -= target
			chaos_lines(target)


/mob/living/simple_mob/humanoid/eclipse/proc/chaos_lines(atom/target)
	var/alignment = rand(1,2)
	var/list/line_range = list()
	var/turf/T = get_turf(target)
	line_range += T
	for(var/i = 1, i <= 7, i++)
		switch(alignment)
			if(1)
				if(T.x-i > 0)
					var/zed = rand(1,3)
					line_range += locate(T.x+zed, T.y-i, T.z)
				if(T.x+i <= world.maxx)
					var/zed = rand(1,3)
					line_range += locate(T.x+zed, T.y+i, T.z)
				if(T.y-i > 0)
					var/zed = rand(1,3)
					line_range += locate(T.x+i, T.y+zed, T.z)
				if(T.y+i <= world.maxy)
					var/zed = rand(1,3)
					line_range += locate(T.x-i, T.y+zed, T.z)
			if(2)
				if(T.x-i > 0)
					var/zed = rand(1,3)
					line_range += locate(T.x-i, T.y-zed, T.z)
				if(T.x+i <= world.maxx)
					var/zed = rand(1,3)
					line_range += locate(T.x+i, T.y-zed, T.z)
				if(T.y-i > 0)
					var/zed = rand(1,3)
					line_range += locate(T.x-zed, T.y-i, T.z)
				if(T.y+i <= world.maxy)
					var/zed = rand(1,3)
					line_range += locate(T.x-zed, T.y+i, T.z)
	for(var/turf/dropspot in line_range)
		new artidrop(dropspot)


/obj/effect/artillery_attack
	anchored = TRUE
	density = FALSE
	unacidable = TRUE
	mouse_opacity = 0
	icon = 'icons/effects/effects.dmi'
	icon_state = "drop_marker"
	var/ammmotype = /obj/effect/falling_effect/callstrike_bomb

/obj/effect/artillery_attack/Initialize(mapload)
	..()
	return INITIALIZE_HINT_LATELOAD

/obj/effect/artillery_attack/LateInitialize()
	var/delay = rand(25, 30)
	addtimer(CALLBACK(src, PROC_REF(spawner)), delay, TIMER_DELETE_ME)

/obj/effect/artillery_attack/proc/spawner()
	new ammmotype(src.loc)
	addtimer(CALLBACK(GLOBAL_PROC, GLOBAL_PROC_REF(qdel), src), 0.7 SECONDS, TIMER_DELETE_ME)

/obj/effect/falling_effect/callstrike_bomb
	falling_type = /obj/effect/callstrike
	crushing = FALSE

/obj/effect/callstrike
	anchored = TRUE
	density = FALSE
	mouse_opacity = 0
	icon ='modular_chomp/icons/obj/guns/precursor/tyr.dmi'

/obj/effect/callstrike/Initialize(mapload)
	.=..()
	icon_state = "arti"

/obj/effect/callstrike/end_fall(var/crushing = FALSE)
	for(var/mob/living/L in loc)
		var/target_zone = ran_zone()
		var/blocked = L.run_armor_check(target_zone, "laser")
		var/soaked = L.get_armor_soak(target_zone, "laser")

		if(!L.apply_damage(70, BURN, target_zone, blocked, soaked))
			break
	playsound(src, 'sound/effects/clang2.ogg', 50, 1)
	addtimer(CALLBACK(GLOBAL_PROC, GLOBAL_PROC_REF(qdel), src), 0.25 SECONDS, TIMER_DELETE_ME)

//Spacing
/obj/effect/falling_effect/callstrike_slime
	falling_type = /obj/effect/callstrike_slime
	crushing = FALSE

/obj/effect/callstrike_slime
	anchored = TRUE
	density = FALSE
	mouse_opacity = 0
	icon ='modular_chomp/icons/obj/guns/precursor/tyr.dmi'

/obj/effect/callstrike_slime/Initialize(mapload)
	.=..()
	icon_state = "squish"

/obj/effect/callstrike_slime/end_fall(var/crushing = FALSE)
	for(var/mob/living/L in loc)
		var/target_zone = ran_zone()
		var/blocked = L.run_armor_check(target_zone, "energy")
		var/soaked = L.get_armor_soak(target_zone, "energy")

		if(!L.apply_damage(50, BURN, target_zone, blocked, soaked))
			break
	playsound(src, 'sound/effects/squelch1.ogg', 50, 1)
	addtimer(CALLBACK(GLOBAL_PROC, GLOBAL_PROC_REF(qdel), src), 0.25 SECONDS, TIMER_DELETE_ME)


/obj/effect/artillery_attack/goop
	ammmotype = /obj/effect/falling_effect/callstrike_slime

/obj/effect/falling_effect/callstrike_slimezone
	falling_type = /obj/effect/slimeattack
	crushing = FALSE

/obj/effect/slimeattack
	name = "slime goop"
	desc = "A pool of acidic slime"
	icon_state = "pool"
	icon ='modular_chomp/icons/obj/guns/precursor/tyr.dmi'
	var/health = 5
	var/modifiertype = /datum/modifier/poisoned/weak

/obj/effect/slimeattack/Crossed(atom/movable/AM as mob|obj)
	if(AM.is_incorporeal())
		return
	Bumped(AM)

/obj/effect/slimeattack/attackby(var/obj/item/W, var/mob/user)
	user.setClickCooldown(user.get_attack_speed(W))

	if(LAZYLEN(W.attack_verb))
		visible_message(span_warning("\The [src] has been [pick(W.attack_verb)] with \the [W][(user ? " by [user]." : ".")]"))
	else
		visible_message(span_warning("\The [src] has been attacked with \the [W][(user ? " by [user]." : ".")]"))

	var/damage = W.force / 4.0

	health -= damage
	healthcheck()


/obj/effect/slimeattack/bullet_act(var/obj/item/projectile/Proj)
	..()
	health -= Proj.get_structure_damage()
	healthcheck()

/obj/effect/slimeattack/proc/die()
	qdel(src)

/obj/effect/slimeattack/proc/healthcheck()
	if(health <= 0)
		die()

/obj/effect/slimeattack/Bumped(mob/M as mob|obj)
	if(istype(M, /obj/mecha))
		return

	if(istype(M, /mob/living/))
		var/mob/living/mob = M
		if(!mob.hovering || !mob.flying)
			attack_mob(M)


/obj/effect/slimeattack/proc/attack_mob(mob/living/L)
	var/target_zone = pick(BP_ALL)
	var/amount_blocked = L.run_armor_check(target_zone, "bio")
	var/amount_soaked = L.get_armor_soak(target_zone, "bio")

	var/damage = rand(5,5)

	if(amount_blocked >= 40)
		return

	if(amount_soaked >= damage)
		return

	L.apply_damage(damage, BURN, target_zone, amount_blocked, amount_soaked, used_weapon = "slime")
	L.add_modifier(modifiertype, 5 SECONDS)

/mob/living/simple_mob/humanoid/eclipse/minion
	name = "Eclipse Expirment"
	desc = "A being in an armored spacesuit"

/mob/living/simple_mob/humanoid/eclipse/minion/squish_sphere
	name = "Eclipse Bio-Sphere"
	desc = "A floating orb of slime"
	health = 7
	maxHealth = 7
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 100, rad = 100)
	armor_soak = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 0)
	icon_state = "squishblob"
	icon_living = "squishblob"
	ai_holder_type = /datum/ai_holder/simple_mob/intentional/adv_dark_gygax
	melee_damage_lower = 1
	melee_damage_upper = 1
	attack_armor_pen = 100 //90% sure we need damage for the application of mods to proc

/mob/living/simple_mob/humanoid/eclipse/minion/squish_sphere/apply_melee_effects(var/atom/A) //bring curea, a synth or gamble hard enough.
	if(isliving(A))
		var/mob/living/L = A
		L.add_modifier(/datum/modifier/poisoned, 120 SECONDS)


/mob/living/simple_mob/humanoid/eclipse/head/stargazer //starhunter boss replacement
	name = "Eclipse Stargazer"
	desc = "A being in an armored spacesuit"
	icon_state = "medi" //place holdery
	icon_living = "medi" //place holdery
	health = 600
	maxHealth = 600
	armor = list(melee = 35, bullet = 35, laser = 35, energy = 35, bomb = 100, bio = 100, rad = 100)
	armor_soak = list(melee = 7, bullet = 7, laser = 7, energy = 7, bomb = 0, bio = 0, rad = 0)
	projectiletype = /obj/item/projectile/energy/homing_bolt
	ai_holder_type = /datum/ai_holder/simple_mob/intentional/adv_dark_gygax
	loot_list = list(/obj/item/slime_extract/sepia  = 25,
		/obj/item/slime_extract/ruby  = 25,
		/obj/item/slime_extract/bluespace  = 25,
		/obj/item/slime_extract/light_pink  = 25,
		/obj/item/slime_extract/yellow  = 25,
		/obj/item/slime_extract/oil  = 25,
			)

/mob/living/simple_mob/humanoid/eclipse/head/stargazer/bullet_act(obj/item/projectile/P)
	..()
	for(var/i =1 to 3)
		new /mob/living/simple_mob/humanoid/eclipse/minion/squish_sphere

/mob/living/simple_mob/humanoid/eclipse/head/stargazer/attackby(var/obj/item/O as obj, var/mob/user as mob)
	..()
	new /mob/living/simple_mob/humanoid/eclipse/minion/squish_sphere

/mob/living/simple_mob/humanoid/eclipse/head/stargazer/do_special_attack(atom/A)
	if(prob(50))
		artidrop = /obj/effect/artillery_attack/goop
		if(prob(50))
			bomb_lines(A)
		else
			chaos_lines(A)
	else
		artidrop = /obj/effect/falling_effect/callstrike_slime
		if(prob(50))
			bomb_lines(A)
		else
			chaos_lines(A)
