/mob/living/simple_mob/vore/fossiltank //slow but endless hunter
	name = "rolling crematorium"
	desc = "A large metal tank."
	health = 500
	maxHealth = 500
	armor = list(melee = 40, bullet = 40, laser = 40, energy = 40, bomb = 50, bio = 100, rad = 100)  //No thematics but I like boss critters to take a bit
	icon_state = "rex"
	melee_attack_delay = 2 SECONDS
	melee_damage_lower = 40
	melee_damage_upper = 40
	attack_armor_pen = 40
	damage_fatigue_mult = 1 //Does slowly pick up speed.
	injury_enrages = TRUE
	movement_cooldown = 3 //Kind of slow.
	ai_holder_type = /datum/ai_holder/simple_mob/fossiltank
	movement_shake_radius = 8
	taser_kill = FALSE
	poison_resist = 1.0
	shock_resist = -0.2
	icon = 'modular_chomp/icons/mob/tyr.dmi'
	special_attack_min_range = 1
	special_attack_max_range = 14 //The special attacks are more meant to pin you down or provide a healing to this tank.
	special_attack_cooldown = 10 SECONDS
	swallowTime = 1.5 SECONDS
	vore_active = 1
	vore_capacity = 1
	vore_bump_chance = 10
	vore_pounce_chance = 50
	vore_pounce_cooldown = 10
	vore_pounce_successrate	= 75
	vore_pounce_falloff = 0
	vore_pounce_maxhealth = 100
	vore_standing_too = TRUE
	unacidable = TRUE
	grab_resist = 100
	devourable = FALSE
	faction = FACTION_ECLIPSE
	size_multiplier = 2

	loot_list = list(/obj/item/personal_shield_generator/belt/fossiltank  = 100,
		/obj/item/prop/tyrlore/fossiltank = 100,
		)

/mob/living/simple_mob/vore/fossiltank/load_default_bellies()
	. = ..()
	var/obj/belly/B = vore_selected
	B.name = "furnace"
	B.desc = "Turns out the skull head opens, and you have been consumed into the beast's furnace! Sweltering heat rages around you as your metal confines rumble with the rurr of strange machinery. The chamber jostling you about as you may attempt to escape, or perhaps accept your fate."
	B.digest_brute = 0
	B.digest_burn = 3
	B.digestchance = 0
	B.absorbchance = 0
	B.escapechance = 15

/datum/ai_holder/simple_mob/fossiltank
	use_astar = TRUE
	hostile = TRUE
	retaliate = TRUE
	mauling = TRUE
	unconscious_vore = TRUE
	vision_range = 25 //The entire gimmick of this thing is a slow moving, endless hunter. You shall not escape.
	respect_alpha = FALSE
	destructive = TRUE
	forgive_resting = FALSE

/mob/living/simple_mob/vore/fossiltank/updatehealth()
	. = ..()

	if(health < maxHealth*0.25)
		icon_state = "rex_25"
		icon_living = "rex_25"
	else if(health < maxHealth*0.5)
		icon_state = "rex_50"
		icon_living = "rex_50"
	else if (health < maxHealth*0.75)
		icon_state = "rex_75"
		icon_living = "rex_75"
	else if (health > maxHealth*0.75)
		icon_state = "rex"
		icon_living = "rex"

/mob/living/simple_mob/vore/fossiltank/do_special_attack(atom/A)
	if(health < maxHealth*0.25)
		visible_message(span_bolddanger(span_orange("The fossil tank begins self repairs!.")))
		addtimer(CALLBACK(src, PROC_REF(cycle_heal), 8), 1 SECOND, TIMER_DELETE_ME)
	else
		Beam(A, icon_state = "sat_beam", time = 3.5 SECONDS, maxdistance = INFINITY)
		addtimer(CALLBACK(src, PROC_REF(sniper_shot), A), 4 SECONDS, TIMER_DELETE_ME)

/mob/living/simple_mob/vore/fossiltank/proc/cycle_heal(var/healamount)
	adjustBruteLoss(-100)
	adjustFireLoss(-100)
	if(healamount > 0)
		healamount -= 1
		addtimer(CALLBACK(src, PROC_REF(cycle_heal), 8), 1 SECOND, TIMER_DELETE_ME)

/mob/living/simple_mob/vore/fossiltank/proc/sniper_shot(atom/target)
	if(!target)
		return
	var/obj/item/projectile/P = new /obj/item/projectile/beam/lightning(get_turf(src))
	P.launch_projectile(target, BP_TORSO, src)

/mob/living/simple_mob/vore/boss_jellyfish
	name = "expirmental jellyfish"
	desc = "A glowing green jellyfish"
	health = 600
	maxHealth = 600
	armor = list(melee = 30, bullet = 30, laser = 30, energy = 30, bomb = 50, bio = 100, rad = 100) //So, it's made of jelly. Bullets and melee bounces off of it. The 20 laser and energy are for a smidge extra tankny because I savour endurance fights
	icon = 'modular_chomp/icons/mob/tyr.dmi'
	icon_state = "jellyfish"
	icon_living = "jellyfish"
	icon_dead = "jelltdish_dead"
	movement_cooldown = 1
	damage_fatigue_mult = 0 //It's a mutant jellyfish boss mob.
	melee_attack_delay = 1.5 SECOND
	melee_damage_lower = 17 //designed to deal 17ish damage when wearing explo voidsuit
	melee_damage_upper = 17
	attack_armor_pen = 20
	glow_color = "#14ff20"
	light_color = "#14ff20"
	glow_range = 7
	glow_intensity = 3
	special_attack_min_range = 1
	special_attack_max_range = 7
	special_attack_cooldown = 13 SECONDS
	ai_holder_type = /datum/ai_holder/simple_mob/melee/evasive/jellyfish


	swallowTime = 1.5 SECONDS
	vore_active = 1
	vore_capacity = 1
	vore_bump_chance = 10
	vore_pounce_chance = 50
	vore_pounce_cooldown = 10
	vore_pounce_successrate	= 75
	vore_pounce_falloff = 0
	vore_pounce_maxhealth = 100
	vore_standing_too = TRUE
	unacidable = TRUE
	grab_resist = 100
	devourable = FALSE

	faction = FACTION_TYR_ANT

	loot_list = list(/obj/item/melee/jellyfishwhip  = 100,
		/obj/item/cell/slime/jellyfish  = 100,
		)

	var/leech = 50
	var/chain_number = 0

/mob/living/simple_mob/vore/boss_jellyfish/load_default_bellies()
	. = ..()
	var/obj/belly/B = vore_selected
	B.name = "internal chamber"
	B.desc = "It's smooth and translucent. You can see the world around you distort and wobble with the movement of the space jellyfish. It floats casually, while the delicate flesh seems to form to you. It's surprisingly cool, and flickers with its own light. You're on display for all to see, trapped within the confines of this strange space alien!"
	B.digest_brute = 1
	B.digest_burn = 1
	B.digestchance = 0
	B.absorbchance = 0
	B.escapechance = 15


/mob/living/simple_mob/vore/boss_jellyfish/apply_melee_effects(var/atom/A) //Not a real threat unless multiple hits. It acts a timer for special traits.
	if(isliving(A))
		var/mob/living/L = A
		if(L.nutrition)
			L.adjust_nutrition(-leech)
			adjust_nutrition(leech)

/mob/living/simple_mob/vore/boss_jellyfish/do_special_attack(atom/A)
	if(nutrition > 500)
		Beam(A, icon_state = "sat_beam", time = 3.5 SECONDS, maxdistance = INFINITY)
		addtimer(CALLBACK(src, PROC_REF(sniper_shot), A), 4 SECONDS, TIMER_DELETE_ME)
	else if(health < maxHealth*0.25) //phase 4 where it teleports then chains 3 attacks
		chain_number = 3
		addtimer(CALLBACK(src, PROC_REF(astral_sea_warp), A), 3 SECONDS, TIMER_DELETE_ME)
		icon_state = "jellyfish_blue"
		icon_living = "jellyfish_blue"
	else if(health < maxHealth*0.5) //teleports then chains 2 attacks
		chain_number = 2
		addtimer(CALLBACK(src, PROC_REF(astral_sea_warp), A), 3 SECONDS, TIMER_DELETE_ME)
		icon_state = "jellyfish_blue"
		icon_living = "jellyfish_blue"
	else if(health < maxHealth*0.75) //teleports then attacks
		chain_number = 1
		icon_state = "jellyfish_blue"
		icon_living = "jellyfish_blue"
		addtimer(CALLBACK(src, PROC_REF(astral_sea_warp), A), 3 SECONDS, TIMER_DELETE_ME)
	else //attacks once
		if(prob(50))
			icon_state = "jellyfish_yellow"
			icon_living = "jellyfish_yellow"
			addtimer(CALLBACK(src, PROC_REF(dash_attack), A), 4 SECONDS, TIMER_DELETE_ME)
		else
			icon_state = "jellyfish_red"
			icon_living = "jellyfish_red"
			addtimer(CALLBACK(src, PROC_REF(summon_puddles), A), 4 SECONDS, TIMER_DELETE_ME)

/mob/living/simple_mob/vore/boss_jellyfish/proc/dash_attack(atom/A) //spider dash attack
	set waitfor = FALSE
	set_AI_busy(TRUE)
	if(!A)
		return

	status_flags |= LEAPING
	visible_message(span_danger("\The [src] leaps at \the [A]!"))
	throw_at(get_step(get_turf(A), get_turf(src)), special_attack_max_range+1, 1, src)

	sleep(5) // For the throw to complete. It won't hold up the AI ticker due to waitfor being false.

	if(status_flags & LEAPING)
		status_flags &= ~LEAPING // Revert special passage ability.

	var/turf/T = get_turf(src) // Where we landed. This might be different than A's turf.

	. = FALSE

	// Now for the stun.
	var/mob/living/victim = null
	for(var/mob/living/L in T) // So player-controlled spiders only need to click the tile to stun them.
		if(L == src)
			continue

		if(ishuman(L))
			var/mob/living/carbon/human/H = L
			if(H.check_shields(damage = 0, damage_source = src, attacker = src, def_zone = null, attack_text = "the leap"))
				continue // We were blocked.

		victim = L
		break

	if(victim)
		victim.Weaken(2)
		victim.visible_message(span_danger("\The [src] knocks down \the [victim]!"))
		to_chat(victim, span_critical("\The [src] jumps on you!"))
		. = TRUE

	set_AI_busy(FALSE)
	if(chain_number > 0)
		chain_number -= 1
		if(prob(50))
			icon_state = "jellyfish_yellow"
			icon_living = "jellyfish_yellow"
			addtimer(CALLBACK(src, PROC_REF(dash_attack), A), 4 SECONDS, TIMER_DELETE_ME)
		else
			icon_state = "jellyfish_red"
			icon_living = "jellyfish_red"
			addtimer(CALLBACK(src, PROC_REF(summon_puddles), A), 4 SECONDS, TIMER_DELETE_ME)
	else
		icon_state = "jellyfish"
		icon_living = "jellyfish"

/mob/living/simple_mob/vore/boss_jellyfish/proc/sniper_shot(atom/target)
	var/obj/item/projectile/P = new /obj/item/projectile/beam/nutrition_gigabeam(get_turf(src))
	P.launch_projectile(target, BP_TORSO, src)

/mob/living/simple_mob/vore/boss_jellyfish/proc/summon_puddles(atom/A)
	for(var/mob/living/L in view(src, 7))
		if(L.stat != DEAD || !IIsAlly(L))
			L.add_modifier(/datum/modifier/mmo_drop/jelly_fish, 3, src)
		if(chain_number > 0)
			chain_number -= 1
			if(prob(50))
				icon_state = "jellyfish_yellow"
				icon_living = "jellyfish_yellow"
				addtimer(CALLBACK(src, PROC_REF(dash_attack), A), 4 SECONDS, TIMER_DELETE_ME)
			else
				icon_state = "jellyfish_red"
				icon_living = "jellyfish_red"
				addtimer(CALLBACK(src, PROC_REF(summon_puddles), A), 4 SECONDS, TIMER_DELETE_ME)
		else
			icon_state = "jellyfish"
			icon_living = "jellyfish"

/obj/item/projectile/beam/nutrition_gigabeam
	damage = 40
	armor_penetration = 90

/mob/living/simple_mob/vore/boss_jellyfish/proc/astral_sea_warp(atom/target)
	if(!target)
		to_chat(src, span_warning("There's nothing to teleport to."))
		return FALSE

	var/list/nearby_things = range(3, target)
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

	var/datum/effect/effect/system/spark_spread/s1 = new /datum/effect/effect/system/smoke_spread
	s1.set_up(5, 1, T)
	var/datum/effect/effect/system/spark_spread/s2 = new /datum/effect/effect/system/smoke_spread
	s2.set_up(5, 1, target_turf)


	T.visible_message(span_notice("\The [src] vanishes!"))
	s1.start()

	forceMove(target_turf)
	playsound(target_turf, 'sound/effects/phasein.ogg', 50, 1)
	to_chat(src, span_notice("You teleport to \the [target_turf]."))

	target_turf.visible_message(span_warning("\The [src] appears!"))
	s2.start()
	if(chain_number > 0)
		chain_number -= 1
		if(prob(50))
			icon_state = "jellyfish_yellow"
			icon_living = "jellyfish_yellow"
			addtimer(CALLBACK(src, PROC_REF(dash_attack), target), 4 SECONDS, TIMER_DELETE_ME)
		else
			icon_state = "jellyfish_red"
			icon_living = "jellyfish_red"
			addtimer(CALLBACK(src, PROC_REF(summon_puddles), target), 4 SECONDS, TIMER_DELETE_ME)
