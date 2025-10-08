/mob/living/simple_mob/mechanical/mecha/eclipse
	health = 600
	maxHealth = 600
	faction = FACTION_ECLIPSE
	icon = 'modular_chomp/icons/mob/eclipse.dmi'
	has_repair_droid = TRUE
	ai_holder_type = /datum/ai_holder/simple_mob/intentional/three_phases
	armor = list(melee = 50, bullet = 50, laser = 50, energy = 50, bomb = 50, bio = 100, rad = 100)
	armor_soak = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 0)
	special_attack_min_range = 1
	special_attack_max_range = 7
	special_attack_cooldown = 10 //This things attack soley via speical attacks hence basically no cooldown
	grab_resist = 100
	shock_resist = -0.2
	deflect_chance = 0
	movement_cooldown = 10
	status_flags = null
	var/specialattackprojectile = /obj/item/projectile/energy/phase/bolt
	var/attackcycle = 1
	var/artidrop = /obj/effect/artillery_attack
	var/rng_cycle = 0

/mob/living/simple_mob/mechanical/mecha/eclipse/do_special_attack(atom/A)
	bullet_heck(A, 3, 3)

/datum/ai_holder/simple_mob/intentional/three_phases
	use_astar = TRUE
	wander = FALSE
	respect_confusion = FALSE
	var/closest_desired_distance = 6

/datum/ai_holder/simple_mob/intentional/three_phases/on_engagement(atom/A)
	if(get_dist(holder, A) > closest_desired_distance)
		holder.IMove(get_step_towards(holder, A))

/datum/ai_holder/simple_mob/intentional/three_phases/pre_special_attack(atom/A)
	if(isliving(A))
		if((holder.health / holder.getMaxHealth()) <= 0.35) //Phase three!
			holder.a_intent = I_DISARM

		else if((holder.health / holder.getMaxHealth()) <= 0.7) //Phase two
			holder.a_intent = I_GRAB

		else
			holder.a_intent = I_HURT

//Most mechas have a strange defense mechanism
//This one however, is the simplest one, more meant as an intro
/mob/living/simple_mob/mechanical/mecha/eclipse/antipersonal_unit //Melts folks with lasers
	name = "Eclipse Expirmental Anti-Infantary Unit"
	health = 400
	maxHealth = 400
	specialattackprojectile = /obj/item/projectile/energy/eclipse/lorge
	armor = list(melee = 60, bullet = 60, laser = 60, energy = 60, bomb = 90, bio = 100, rad = 100)
	icon_state = "orb"
	wreckage = /obj/structure/loot_pile/mecha/odd_gygax

/mob/living/simple_mob/mechanical/mecha/eclipse/antipersonal_unit/do_special_attack(atom/A)
	switch(a_intent)
		if(I_DISARM) //phase3
			if(attackcycle == 1)
				rng_cycle = rand(1,3)
				addtimer(CALLBACK(src, PROC_REF(random_firing), A, 20, rng_cycle, 10), 0.5 SECONDS, TIMER_DELETE_ME)
				attackcycle = 0
			else if(attackcycle == 2)
				rng_cycle = rand(1,3)
				addtimer(CALLBACK(src, PROC_REF(dual_spin), A, rng_cycle, 10), 0.5 SECONDS, TIMER_DELETE_ME)
				attackcycle = 0
			else if(attackcycle == 3)
				rng_cycle = rand(1,3)
				Beam(A, icon_state = "solar_beam", time = 2 SECONDS, maxdistance = INFINITY)
				addtimer(CALLBACK(src, PROC_REF(singleproj), A, rng_cycle), 2 SECONDS, TIMER_DELETE_ME)
				attackcycle = 0

		if(I_HURT) //phase1
			if(attackcycle == 1)
				rng_cycle = rand(1,3)
				addtimer(CALLBACK(src, PROC_REF(random_firing), A, 8, rng_cycle, 15), 0.5 SECONDS, TIMER_DELETE_ME)
				attackcycle = 0
			else if(attackcycle == 2)
				rng_cycle = rand(1,3)
				addtimer(CALLBACK(src, PROC_REF(cross_spin), A, rng_cycle, 15), 0.5 SECONDS, TIMER_DELETE_ME)
				attackcycle = 0
			else if(attackcycle == 3)
				rng_cycle = rand(1,3)
				Beam(A, icon_state = "solar_beam", time = 2 SECONDS, maxdistance = INFINITY)
				addtimer(CALLBACK(src, PROC_REF(singleproj), A, rng_cycle), 2 SECONDS, TIMER_DELETE_ME)
				attackcycle = 0
		if(I_GRAB) // Phase 2
			if(attackcycle == 1)
				rng_cycle = rand(1,3)
				addtimer(CALLBACK(src, PROC_REF(random_firing), A, 12, rng_cycle, 10), 0.5 SECONDS, TIMER_DELETE_ME)
				attackcycle = 0
			else if(attackcycle == 2)
				rng_cycle = rand(1,3)
				addtimer(CALLBACK(src, PROC_REF(cross_spin), A, rng_cycle, 10), 0.5 SECONDS, TIMER_DELETE_ME)
				attackcycle = 0
			else if(attackcycle == 3)
				rng_cycle = rand(1,3)
				Beam(A, icon_state = "solar_beam", time = 1.5 SECONDS, maxdistance = INFINITY)
				addtimer(CALLBACK(src, PROC_REF(singleproj), A, rng_cycle), 1 SECONDS, TIMER_DELETE_ME)
				attackcycle = 0



//Nigh unbreakable defenses except during certian attack phases.
/mob/living/simple_mob/mechanical/mecha/eclipse/mining_guard //Explosive death
	name = "Eclipse Expirmental Mining Mecha"
	desc = "You mecha guarded by a powerful shield. Perhaps it will drop at some point."
	specialattackprojectile = /obj/item/projectile/energy/eclipse/lorgealien
	armor = list(melee = 90, bullet = 90, laser = 90, energy = 90, bomb = 90, bio = 100, rad = 100)
	armor_soak = list(melee = 25, bullet = 25, laser = 25, energy = 25, bomb = 0, bio = 0, rad = 0)
	icon_state = "shielded_mining_mecha"
	shock_resist = 1
	wreckage = /obj/structure/loot_pile/mecha/odd_ripley
	attackcycle = 1

/mob/living/simple_mob/mechanical/mecha/eclipse/mining_guard/do_special_attack(atom/A)
	switch(a_intent)
		if(I_DISARM) //phase3
			if(attackcycle == 1)
				specialattackprojectile = /obj/item/projectile/energy/eclipse/lorgealien
				addtimer(CALLBACK(src, PROC_REF(quad_random_firing), A, 12, 2, 10), 1 SECOND, TIMER_DELETE_ME)
				armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 100, rad = 100)
				armor_soak = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 0)
				icon_state = "mining_mecha"
				attackcycle = 0
			else if(attackcycle == 2)
				specialattackprojectile = /obj/item/projectile/energy/eclipse/lorgealien
				addtimer(CALLBACK(src, PROC_REF(hole_in_wall), A, 3, 15), 0.5 SECONDS, TIMER_DELETE_ME)
				armor = list(melee = 90, bullet = 90, laser = 90, energy = 90, bomb = 90, bio = 100, rad = 100)
				armor_soak = list(melee = 25, bullet = 25, laser = 25, energy = 25, bomb = 0, bio = 0, rad = 0)
				icon_state = "shielded_mining_mecha"
				attackcycle = 0
			else if(attackcycle == 3)
				specialattackprojectile = /obj/item/projectile/arc/blue_energy/precusor
				addtimer(CALLBACK(src, PROC_REF(chain_burst), A, 1, 15), 0.5 SECONDS, TIMER_DELETE_ME)
				armor = list(melee = 90, bullet = 90, laser = 90, energy = 90, bomb = 90, bio = 100, rad = 100)
				armor_soak = list(melee = 25, bullet = 25, laser = 25, energy = 25, bomb = 0, bio = 0, rad = 0)
				icon_state = "shielded_mining_mecha"
				attackcycle = 0
		if(I_HURT) //phase1
			if(attackcycle == 1)
				specialattackprojectile = /obj/item/projectile/energy/eclipse/lorgealien
				addtimer(CALLBACK(src, PROC_REF(random_firing), A, 6, 2, 10), 1 SECOND, TIMER_DELETE_ME)
				armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 100, rad = 100)
				armor_soak = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 0)
				icon_state = "mining_mecha"
				attackcycle = 0
			else if(attackcycle == 2)
				specialattackprojectile = /obj/item/projectile/energy/eclipse/lorgealien
				addtimer(CALLBACK(src, PROC_REF(hole_in_wall), A, 3, 20), 0.5 SECONDS, TIMER_DELETE_ME)
				armor = list(melee = 90, bullet = 90, laser = 90, energy = 90, bomb = 90, bio = 100, rad = 100)
				armor_soak = list(melee = 25, bullet = 25, laser = 25, energy = 25, bomb = 0, bio = 0, rad = 0)
				icon_state = "shielded_mining_mecha"
				attackcycle = 0
			else if(attackcycle == 3)
				specialattackprojectile = /obj/item/projectile/arc/blue_energy/precusor
				addtimer(CALLBACK(src, PROC_REF(chain_burst), A, 1, 20), 0.5 SECONDS, TIMER_DELETE_ME)
				armor = list(melee = 90, bullet = 90, laser = 90, energy = 90, bomb = 90, bio = 100, rad = 100)
				armor_soak = list(melee = 25, bullet = 25, laser = 25, energy = 25, bomb = 0, bio = 0, rad = 0)
				icon_state = "shielded_mining_mecha"
				attackcycle = 0
		if(I_GRAB) // Phase 2
			if(attackcycle == 1)
				specialattackprojectile = /obj/item/projectile/energy/eclipse/lorgealien
				addtimer(CALLBACK(src, PROC_REF(random_firing), A, 8, 2, 10), 1 SECOND, TIMER_DELETE_ME)
				armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 100, rad = 100)
				armor_soak = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 0)
				icon_state = "mining_mecha"
				attackcycle = 0
			else if(attackcycle == 2)
				specialattackprojectile = /obj/item/projectile/energy/eclipse/lorgealien
				addtimer(CALLBACK(src, PROC_REF(hole_in_wall), A, 3, 15), 0.5 SECONDS, TIMER_DELETE_ME)
				armor = list(melee = 90, bullet = 90, laser = 90, energy = 90, bomb = 90, bio = 100, rad = 100)
				armor_soak = list(melee = 25, bullet = 25, laser = 25, energy = 25, bomb = 0, bio = 0, rad = 0)
				icon_state = "shielded_mining_mecha"
				attackcycle = 0
			else if(attackcycle == 3)
				specialattackprojectile = /obj/item/projectile/arc/blue_energy/precusor
				addtimer(CALLBACK(src, PROC_REF(chain_burst), A, 1, 15), 0.5 SECONDS, TIMER_DELETE_ME)
				armor = list(melee = 90, bullet = 90, laser = 90, energy = 90, bomb = 90, bio = 100, rad = 100)
				armor_soak = list(melee = 25, bullet = 25, laser = 25, energy = 25, bomb = 0, bio = 0, rad = 0)
				icon_state = "shielded_mining_mecha"
				attackcycle = 0


//radidation gimmick go brrrr
/mob/living/simple_mob/mechanical/mecha/eclipse/engimecha
	name = "Eclipse Expirmental Enginering Mecha"
	health = 300
	maxHealth = 300
	desc = "A mecha made for enginering purposes, with several alterations to be an odd ball combat unit."
	specialattackprojectile = /obj/item/projectile/energy/excavate/weak
	armor = list(melee = 30, bullet = 30, laser = 30, energy = 40, bomb = 90, bio = 100, rad = 100)
	armor_soak = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 0)
	icon_state = "engi_spider"
	shock_resist = 1
	projectiletype = /obj/item/projectile/beam/chain_lightning
	reload_max = 1
	reload_time = 0.5 SECONDS
	ranged_attack_delay = 2 SECONDS

	glow_color = "#14ff20"
	light_color = "#14ff20"
	glow_range = 5
	glow_intensity = 3

	special_attack_cooldown = 60

	pilot_type = /mob/living/simple_mob/humanoid/eclipse/head/engineer

	var/rads = 5

/mob/living/simple_mob/mechanical/mecha/eclipse/engimecha/do_special_attack(atom/A)
	rads += 15

/mob/living/simple_mob/mechanical/mecha/eclipse/engimecha/handle_special()
	if(stat != DEAD)
		irradiate()
	..()

/mob/living/simple_mob/mechanical/mecha/eclipse/engimecha/proc/irradiate()
	SSradiation.radiate(src, rads)

/mob/living/simple_mob/mechanical/mecha/eclipse/engimecha/ranged_pre_animation(atom/A)
	Beam(get_turf(A), icon_state = "sniper_beam", time = 2 SECONDS, maxdistance = 15)
	. = ..()

/mob/living/simple_mob/mechanical/mecha/eclipse/engimecha/shoot_target(atom/A)
	set waitfor = FALSE

	if(!istype(A) || QDELETED(A))
		return

	setClickCooldown(get_attack_speed())

	face_atom(A)

	var/atom/orig_targ = A

	if(ranged_attack_delay)
		A = get_turf(orig_targ)
		ranged_pre_animation(A)
		handle_attack_delay(A, ranged_attack_delay) // This will sleep this proc for a bit, which is why waitfor is false.

	if(needs_reload)
		if(reload_count >= reload_max)
			try_reload()
			return FALSE

	/*
	 * CHOMP Addition: This section here is (duplicated) special snowflake code because sniper does not call parent. Basically, this is a non-stupid version of the above intended for ranged mobs.
	 * ranged_attack_delay is stupid because it sleeps the entire mob.
	 * This new ranged_cooldown_time is smarter in the sense that it is an internalized timer. Try not to confuse the names.
	*/
	if(ranged_cooldown_time) //If you have a non-zero number in a mob's variables, this pattern begins.
		if(ranged_cooldown <= world.time) //Further down, a timer keeps adding to the ranged_cooldown variable automatically.
			visible_message(span_bolddanger("\The [src]") + " fires at \the [A]!") //Leave notice of shooting.
			shoot(A) //Perform the shoot action
			if(casingtype) //If the mob is designated to leave casings...
				new casingtype(loc) //... leave the casing.
			ranged_cooldown = world.time + ranged_cooldown_time + ((injury_level / 2) SECONDS) //Special addition here. This is a timer. Keeping updating the time after shooting. Add that ranged cooldown time specified in the mob to the world time.
		return TRUE	//End these commands here.
	// CHOMPAddition End

	visible_message(span_bolddanger("\The [src]") + " fires at \the [orig_targ]!")
	shoot(A)
	if(casingtype)
		new casingtype(loc)

	if(ranged_attack_delay)
		ranged_post_animation(A)

	return TRUE

//High overall defense, swaps between Burn and brute defense based off what was just used.
/mob/living/simple_mob/mechanical/mecha/eclipse/darkmatter_assualt/armored //The final boss
	name = "Eclipse Expirmental Janus"
	desc = "A powerful looking mecha, it's shield appears to swap to protect itself against the most rescent damage type."
	armor = list(melee = 60, bullet = 60, laser = 60, energy = 60, bomb = 80, bio = 100, rad = 100)
	specialattackprojectile = /obj/item/projectile/energy/eclipse/janusjavelin
	pilot_type =/mob/living/simple_mob/mechanical/mecha/eclipse/darkmatter_assualt/phasetwo
	wreckage = /obj/item/prop/tyrlore/monodisc
	icon_state = "eclipse_janus"
	attackcycle = 1


/mob/living/simple_mob/mechanical/mecha/eclipse/darkmatter_assualt/armored/bullet_act(obj/item/projectile/P)
	.= ..()
	if(istype(P, /obj/item/projectile/bullet))
		armor = list(melee = 80, bullet = 80, laser = 30, energy = 30, bomb = 80, bio = 100, rad = 100)
		armor_soak = list(melee = 10, bullet = 10, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 0)
		icon_state = "eclipse_janus_red"
		visible_message(span_cult("[P] has been adapted too!."))
	else
		armor = list(melee = 30, bullet = 30, laser = 80, energy = 80, bomb = 80, bio = 100, rad = 100)
		armor_soak = list(melee = 0, bullet = 0, laser = 10, energy = 10, bomb = 0, bio = 0, rad = 0)
		icon_state = "eclipse_janus_orange"
		visible_message(span_cult("[P] has been adapted too!."))

/mob/living/simple_mob/mechanical/mecha/eclipse/darkmatter_assualt/armored/do_special_attack(atom/A)
	switch(a_intent)
		if(I_DISARM) //phase3
			if(attackcycle == 1)
				rng_cycle = rand(1,4)
				addtimer(CALLBACK(src, PROC_REF(teleport_attack), A, rng_cycle, 2), 0.5 SECONDS, TIMER_DELETE_ME)
				attackcycle = 0
			else if(attackcycle == 2)
				rng_cycle = rand(1,4)
				specialattackprojectile = /obj/item/projectile/arc/blue_energy/precusor
				addtimer(CALLBACK(src, PROC_REF(dual_burst), A, rng_cycle), 0.5 SECONDS, TIMER_DELETE_ME)
				attackcycle = 0
			else if(attackcycle == 3)
				rng_cycle = rand(1,4)
				specialattackprojectile = /obj/item/projectile/energy/eclipse/janusjavelin
				addtimer(CALLBACK(src, PROC_REF(quad_random_firing), A, 8, rng_cycle, 5), 0.5 SECONDS, TIMER_DELETE_ME)
				attackcycle = 0
			else if(attackcycle == 4)
				rng_cycle = rand(1,4)
				specialattackprojectile = /obj/item/projectile/arc/blue_energy/precusor
				addtimer(CALLBACK(src, PROC_REF(chain_burst), A, rng_cycle), 1 SECOND, TIMER_DELETE_ME)
				attackcycle = 0
		if(I_HURT) //phase1 simple projectiles
			if(attackcycle == 1)
				rng_cycle = rand(1,4)
				specialattackprojectile = /obj/item/projectile/energy/eclipse/janusjavelin
				addtimer(CALLBACK(src, PROC_REF(random_firing), A, 8, rng_cycle, 5), 0.5 SECONDS, TIMER_DELETE_ME)
				attackcycle = 0
			else if(attackcycle == 2)
				rng_cycle = rand(1,4)
				specialattackprojectile = /obj/item/projectile/energy/eclipse/janusjavelin
				addtimer(CALLBACK(src, PROC_REF(cross_spin), A, rng_cycle, 5), 0.5 SECONDS, TIMER_DELETE_ME)
				attackcycle = 0
			else if(attackcycle == 3)
				rng_cycle = rand(1,4)
				specialattackprojectile = /obj/item/projectile/energy/eclipse/janusjavelin
				Beam(A, icon_state = "solar_beam", time = 2 SECONDS, maxdistance = INFINITY)
				addtimer(CALLBACK(src, PROC_REF(singleproj), A, rng_cycle), 2 SECONDS, TIMER_DELETE_ME)
				attackcycle = 0
			else if(attackcycle == 4)
				rng_cycle = rand(1,4)
				addtimer(CALLBACK(src, PROC_REF(teleport_attack), A, rng_cycle, 3), 0.5 SECONDS, TIMER_DELETE_ME)
				attackcycle = 0
		if(I_GRAB) // Phase 2
			if(attackcycle == 1)
				rng_cycle = rand(1,4)
				specialattackprojectile = /obj/item/projectile/energy/eclipse/janusjavelin
				addtimer(CALLBACK(src, PROC_REF(quad_random_firing), A, 8, rng_cycle, 5), 0.5 SECONDS, TIMER_DELETE_ME)
				attackcycle = 0
			else if(attackcycle == 2)
				rng_cycle = rand(1,4)
				specialattackprojectile = /obj/item/projectile/energy/eclipse/janusjavelin
				addtimer(CALLBACK(src, PROC_REF(dual_spin), A, rng_cycle, 5), 0.5 SECONDS, TIMER_DELETE_ME)
				attackcycle = 0
			else if(attackcycle == 3)
				rng_cycle = rand(1,4)
				addtimer(CALLBACK(src, PROC_REF(teleport_attack), A, rng_cycle, 2), 0.5 SECONDS, TIMER_DELETE_ME)
				attackcycle = 0
			else if(attackcycle == 4)
				rng_cycle = rand(1,4)
				specialattackprojectile = /obj/item/projectile/arc/blue_energy/precusor
				addtimer(CALLBACK(src, PROC_REF(checker_board), A, rng_cycle), 1 SECOND, TIMER_DELETE_ME)
				attackcycle = 0

/mob/living/simple_mob/mechanical/mecha/eclipse/darkmatter_assualt/phasetwo //we ain't done yet
	name = "Collapsing Janus"
	armor = list(melee = 30, bullet = 30, laser = 30, energy = 30, bomb = 80, bio = 100, rad = 100) //our shielding is gone
	health = 400
	maxHealth = 400
	desc = "The mecha is smoking, it's drone and shield is broken, but it's pilot is pushing it further."
	specialattackprojectile = /obj/item/projectile/energy/eclipse/janusjavelin
	wreckage = /obj/item/prop/tyrlore/neonjanus
	pilot_type = /mob/living/simple_mob/mechanical/mecha/eclipse/sniper
	has_repair_droid = FALSE //broken mecha
	icon_state = "eclipse_janus"

/mob/living/simple_mob/mechanical/mecha/eclipse/darkmatter_assualt/phasetwo/do_special_attack(atom/A)
	if(attackcycle == 1)
		attackcycle = rand(4,6)
		addtimer(CALLBACK(src, PROC_REF(random_firing), A, 14, attackcycle, 5), 0.5 SECONDS, TIMER_DELETE_ME)
	else if(attackcycle == 2)
		addtimer(CALLBACK(src, PROC_REF(cross_spin), A, attackcycle, 5), 0.5 SECONDS, TIMER_DELETE_ME)
		attackcycle = rand(4,6)
	else if(attackcycle == 3)
		addtimer(CALLBACK(src, PROC_REF(hole_in_wall), A, attackcycle, 15), 0.5 SECONDS, TIMER_DELETE_ME)
		attackcycle = rand(4,6)
	else if(attackcycle == 4)
		rng_cycle = rand(1,3)
		addtimer(CALLBACK(src, PROC_REF(dual_spin), A, rng_cycle, 5), 0.5 SECONDS, TIMER_DELETE_ME)
		attackcycle = 0
	else if(attackcycle == 5)
		rng_cycle = rand(1,3)
		addtimer(CALLBACK(src, PROC_REF(quad_random_firing), A, 7, rng_cycle, 15), 0.5 SECONDS, TIMER_DELETE_ME)
		attackcycle = 0
	else if(attackcycle == 6)
		rng_cycle = rand(1,3)
		addtimer(CALLBACK(src, PROC_REF(teleport_attack), A, rng_cycle, 5), 3 SECONDS, TIMER_DELETE_ME)
		attackcycle = 0


/mob/living/simple_mob/mechanical/mecha/eclipse/sniper //one last stand
	name = "Eclipse Lead Pilot"
	icon_state = "captian"
	icon_living = "captian"
	health = 200
	maxHealth = 200
	ai_holder_type = /datum/ai_holder/simple_mob/intentional/three_phases
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 50, bio = 100, rad = 100)
	specialattackprojectile = /obj/item/projectile/arc/explosive_rocket
	wreckage = /obj/item/prop/tyrlore/truegoal
	has_repair_droid = FALSE

/mob/living/simple_mob/mechanical/mecha/eclipse/sniper/do_special_attack(atom/A)
	. = TRUE
	if(attackcycle == 1)
		addtimer(CALLBACK(src, PROC_REF(teleport_attack), A, 2, 4), 0.5 SECONDS, TIMER_DELETE_ME)
		attackcycle = 0
	else if(attackcycle == 2)
		specialattackprojectile = /obj/item/projectile/beam/heavylaser/cannon
		Beam(A, icon_state = "solar_beam", time = 0.75 SECONDS, maxdistance = INFINITY)
		addtimer(CALLBACK(src, PROC_REF(singleproj), A, 1), 1 SECOND, TIMER_DELETE_ME)
		attackcycle = 0

/mob/living/simple_mob/mechanical/mecha/eclipse/battle_top
	name = "eclipse cryo top"
	icon_state = "mecha_top"
	icon_living = "mecha_top"
	wreckage = /obj/item/melee/energy/sword/top_shield
	specialattackprojectile = /obj/item/projectile/energy/eclipse/chillingwind
	desc = "It appears to be spinning at rapid speeds; enough to deflect projectiles. The air around it feels frigid.."

/mob/living/simple_mob/mechanical/mecha/eclipse/battle_top/do_special_attack(atom/A)
	var/rng_cycle
	switch(a_intent)
		if(I_DISARM) //phase3
			if(attackcycle == 1)
				rng_cycle = rand(1,3)
				addtimer(CALLBACK(src, PROC_REF(quad_random_firing), A, 20, rng_cycle, 20), 0.5 SECONDS, TIMER_DELETE_ME)
				attackcycle = 0
			else if(attackcycle == 2)
				rng_cycle = rand(1,3)
				addtimer(CALLBACK(src, PROC_REF(bomb_chaos), A, rng_cycle), 2.5 SECONDS, TIMER_DELETE_ME)
				attackcycle = 0
			else if(attackcycle == 3)
				rng_cycle = rand(1,3)
				addtimer(CALLBACK(src, PROC_REF(dual_spin), A, rng_cycle, 15), 0.5 SECONDS, TIMER_DELETE_ME)
				attackcycle = 0

		if(I_HURT) //phase1
			if(attackcycle == 1)
				rng_cycle = rand(1,3)
				addtimer(CALLBACK(src, PROC_REF(random_firing), A, 20, rng_cycle, 20), 0.5 SECONDS, TIMER_DELETE_ME)
				attackcycle = 0
			else if(attackcycle == 2)
				rng_cycle = rand(1,3)
				addtimer(CALLBACK(src, PROC_REF(bomb_lines), A, rng_cycle), 2.5 SECONDS, TIMER_DELETE_ME)
				attackcycle = 0
			else if(attackcycle == 3)
				rng_cycle = rand(1,3)
				addtimer(CALLBACK(src, PROC_REF(cross_spin), A, rng_cycle, 15), 0.5 SECONDS, TIMER_DELETE_ME)
				attackcycle = 0

		if(I_GRAB) // Phase 2
			if(attackcycle == 1)
				rng_cycle = rand(1,3)
				addtimer(CALLBACK(src, PROC_REF(quad_random_firing), A, 20, rng_cycle, 25), 0.5 SECONDS, TIMER_DELETE_ME)
				attackcycle = 0
			else if(attackcycle == 2)
				rng_cycle = rand(1,3)
				addtimer(CALLBACK(src, PROC_REF(bomb_lines), A, rng_cycle), 2.5 SECONDS, TIMER_DELETE_ME)
				attackcycle = 0
			else if(attackcycle == 3)
				rng_cycle = rand(1,3)
				addtimer(CALLBACK(src, PROC_REF(cross_spin), A, rng_cycle, 15), 0.5 SECONDS, TIMER_DELETE_ME)
				attackcycle = 0



/mob/living/simple_mob/mechanical/mecha/eclipse/battle_top/handle_special()
	if(stat != DEAD)
		frozen_aura()
	..()

/mob/living/simple_mob/mechanical/mecha/eclipse/battle_top/proc/frozen_aura()
	for(var/mob/living/L in view(src, 14))
		if(!IIsAlly(L))
			L.add_modifier(/datum/modifier/chilled, 3, src)

/mob/living/simple_mob/mechanical/mecha/eclipse/excavate_head
	name = "Xenoarch Lead"
	desc = "A unathi wearing what appears to be a modified breacher suit. Something seems off though"
	icon_state = "cursor_guard"
	icon_living = "cursor_guard"
	armor = list(melee = 80, bullet = 80, laser = 80, energy = 80, bomb = 80, bio = 100, rad = 100)
	wreckage = /obj/item/prop/tyrlore/stolenbreacher
	specialattackprojectile = /obj/item/projectile/energy/eclipse/mining
	desc = "A being wearing what appears to be a modified breacher outfit."
	projectiletype = /obj/item/projectile/arc/explosive_rocket
	ranged_cooldown = 50


/mob/living/simple_mob/mechanical/mecha/eclipse/excavate_head/updatehealth()
	. = ..()
	if(health < maxHealth*0.3)
		armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 100, rad = 100)
	else if(health < maxHealth*0.6)
		armor = list(melee = 30, bullet = 30, laser = 30, energy = 30, bomb = 30, bio = 100, rad = 100)
	else if (health < maxHealth*0.9)
		armor = list(melee = 60, bullet = 60, laser = 60, energy = 50, bomb = 60, bio = 100, rad = 100)


/mob/living/simple_mob/mechanical/mecha/eclipse/excavate_head/do_special_attack(atom/A)
	var/rng_cycle
	switch(a_intent)
		if(I_DISARM) //phase3
			if(attackcycle == 1)
				rng_cycle = rand(1,3)
				addtimer(CALLBACK(src, PROC_REF(random_firing), A, 20, rng_cycle, 10), 0.5 SECONDS, TIMER_DELETE_ME)
				attackcycle = 0
			else if(attackcycle == 2)
				rng_cycle = rand(1,3)
				addtimer(CALLBACK(src, PROC_REF(dual_spin), A, rng_cycle, 10), 0.5 SECONDS, TIMER_DELETE_ME)
				attackcycle = 0
			else if(attackcycle == 3)
				rng_cycle = rand(1,3)
				Beam(A, icon_state = "solar_beam", time = 2 SECONDS, maxdistance = INFINITY)
				addtimer(CALLBACK(src, PROC_REF(singleproj), A, rng_cycle), 2 SECONDS, TIMER_DELETE_ME)
				attackcycle = 0

		if(I_HURT) //phase1
			if(attackcycle == 1)
				rng_cycle = rand(1,3)
				addtimer(CALLBACK(src, PROC_REF(random_firing), A, 8, rng_cycle, 15), 0.5 SECONDS, TIMER_DELETE_ME)
				attackcycle = 0
			else if(attackcycle == 2)
				rng_cycle = rand(1,3)
				addtimer(CALLBACK(src, PROC_REF(cross_spin), A, rng_cycle, 15), 0.5 SECONDS, TIMER_DELETE_ME)
				attackcycle = 0
			else if(attackcycle == 3)
				rng_cycle = rand(1,3)
				Beam(A, icon_state = "solar_beam", time = 2 SECONDS, maxdistance = INFINITY)
				addtimer(CALLBACK(src, PROC_REF(singleproj), A, rng_cycle), 2 SECONDS, TIMER_DELETE_ME)
				attackcycle = 0
		if(I_GRAB) // Phase 2
			if(attackcycle == 1)
				rng_cycle = rand(1,3)
				addtimer(CALLBACK(src, PROC_REF(random_firing), A, 12, rng_cycle, 10), 0.5 SECONDS, TIMER_DELETE_ME)
				attackcycle = 0
			else if(attackcycle == 2)
				rng_cycle = rand(1,3)
				addtimer(CALLBACK(src, PROC_REF(cross_spin), A, rng_cycle, 10), 0.5 SECONDS, TIMER_DELETE_ME)
				attackcycle = 0
			else if(attackcycle == 3)
				rng_cycle = rand(1,3)
				Beam(A, icon_state = "solar_beam", time = 1.5 SECONDS, maxdistance = INFINITY)
				addtimer(CALLBACK(src, PROC_REF(singleproj), A, rng_cycle), 1 SECONDS, TIMER_DELETE_ME)
				attackcycle = 0

//Awoken Tyr Update
/mob/living/simple_mob/mechanical/mecha/eclipse/tankyboss
	health = 1000
	maxHealth = 1000 //I don't like four digits, but the intended weapon has 30 damage, and desired player count is 3 with a length of 3 mins, doing the math adds up to 1080 but going to do 1k
	faction = FACTION_TYR
	armor = list(melee = 30, bullet = 30, laser = 30, energy = 30, bomb = 30, bio = 100, rad = 100)
	movement_cooldown = 40
	icon = 'modular_chomp/icons/mob/tyr.dmi'
	size_multiplier = 2
	swallowTime = 0.5 SECONDS
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

/mob/living/simple_mob/mechanical/mecha/eclipse/tankyboss/chambera //poison boss
	name = "experiment 20"
	desc = "A strange furball fused with plant life."
	icon_state = "poison_boss"
	icon_living = "poison_boss"
	wreckage = /obj/item/prop/tyrlore/basicflora
	size_multiplier = 0.8

/mob/living/simple_mob/mechanical/mecha/eclipse/tankyboss/chambera/load_default_bellies()
	. = ..()
	var/obj/belly/B = vore_selected
	B.name = "flora gut"
	B.desc = "You have been devoured by the vulpakin like plant beast. A mix of flesh and flora surrond you, purple bubbling fluid soaking into your body. The beast effortlessly carrying your body, it's motions seemingly exaggerated, alien words spoken, the beast trying to taunt you."
	B.digest_brute = 1
	B.digest_burn = 1
	B.digestchance = 0
	B.absorbchance = 0
	B.escapechance = 15

/mob/living/simple_mob/mechanical/mecha/eclipse/tankyboss/chamberc/bullet_act(obj/item/projectile/P)
	if(istype(P,/obj/item/projectile/beam) || istype(P, /obj/item/projectile/energy))
		nutrition += 5
		if(size_multiplier > 1.95)
			visible_message(span_boldwarning(span_orange("[P] heals the beast!.")))
			adjustBruteLoss(-nutrition)
			adjustFireLoss(-nutrition)
			nutrition -= 5
		else
			size_multiplier += 0.05
			..()
	else
		..()

/mob/living/simple_mob/mechanical/mecha/eclipse/tankyboss/chambera/do_special_attack(atom/A)
	var/rng_cycle = rand(1,6)
	if(attackcycle == 1)
		addtimer(CALLBACK(src, PROC_REF(quad_random_firing), A, 20, rng_cycle, 20), 0.5 SECONDS, TIMER_DELETE_ME)
		attackcycle = 0
	else if(attackcycle == 2)
		addtimer(CALLBACK(src, PROC_REF(dual_spin), A, rng_cycle, 15), 0.5 SECONDS, TIMER_DELETE_ME)
		attackcycle = 0
	else if(attackcycle == 3)
		addtimer(CALLBACK(src, PROC_REF(cross_spin), A, rng_cycle, 15), 0.5 SECONDS, TIMER_DELETE_ME)
		attackcycle = 0
	else if(attackcycle == 4)
		addtimer(CALLBACK(src, PROC_REF(hole_in_wall), A, rng_cycle, 15), 0.5 SECONDS, TIMER_DELETE_ME)
		attackcycle = 0
	else if(attackcycle == 5)
		addtimer(CALLBACK(src, PROC_REF(bomb_lines), A, rng_cycle), 2.5 SECONDS, TIMER_DELETE_ME)
		attackcycle = 0
	else if(attackcycle == 6)
		addtimer(CALLBACK(src, PROC_REF(bomb_chaos), A, rng_cycle), 2.5 SECONDS, TIMER_DELETE_ME)
		attackcycle = 0

/mob/living/simple_mob/mechanical/mecha/eclipse/tankyboss/chamberb //knock back boss
	name = "experiment 3"
	desc = "A strange furball, the air vibrating around it."
	specialattackprojectile = /obj/item/projectile/knockback/slow
	icon_state = "sonic_boss"
	icon_living = "sonic_boss"
	projectiletype = /obj/item/projectile/knockback/slow
	wreckage = /obj/item/prop/tyrlore/basicsonic

/mob/living/simple_mob/mechanical/mecha/eclipse/tankyboss/chamberb/load_default_bellies()
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

/mob/living/simple_mob/mechanical/mecha/eclipse/tankyboss/chamberb/do_special_attack(atom/A)
	rng_cycle = rand(1,6)
	if(attackcycle == 1)
		addtimer(CALLBACK(src, PROC_REF(quad_random_firing), A, 20, rng_cycle, 10), 0.5 SECONDS, TIMER_DELETE_ME)
		attackcycle = 0
	else if(attackcycle == 2)
		addtimer(CALLBACK(src, PROC_REF(dual_spin), A, rng_cycle, 5), 0.5 SECONDS, TIMER_DELETE_ME)
		attackcycle = 0
	else if(attackcycle == 3)
		addtimer(CALLBACK(src, PROC_REF(cross_spin), A, rng_cycle, 10), 0.5 SECONDS, TIMER_DELETE_ME)
		attackcycle = 0
	else if(attackcycle == 4)
		addtimer(CALLBACK(src, PROC_REF(hole_in_wall), A, rng_cycle, 10), 0.5 SECONDS, TIMER_DELETE_ME)
		attackcycle = 0
	else if(attackcycle == 5)
		addtimer(CALLBACK(src, PROC_REF(bomb_lines), A, rng_cycle), 2.5 SECONDS, TIMER_DELETE_ME)
		attackcycle = 0
	else if(attackcycle == 6)
		addtimer(CALLBACK(src, PROC_REF(bomb_chaos), A, rng_cycle), 2.5 SECONDS, TIMER_DELETE_ME)
		attackcycle = 0

/mob/living/simple_mob/mechanical/mecha/eclipse/tankyboss/chamberc //wierd shields
	name = "experiment 7"
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

/mob/living/simple_mob/mechanical/mecha/eclipse/tankyboss/chamberc/load_default_bellies()
	. = ..()
	var/obj/belly/B = vore_selected
	B.name = "alien gut"
	B.desc = "You are dunked into a multi-colored, or maybe multi-fluid, stew. Blues, purples, oranges, and greens, all swishing around you as the alien creature contunies it's mindless guarding.."
	B.digest_brute = 0.5
	B.digest_burn = 1.5
	B.digestchance = 0
	B.absorbchance = 0
	B.escapechance = 15

/mob/living/simple_mob/mechanical/mecha/eclipse/tankyboss/chamberc/bullet_act(obj/item/projectile/P)
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

/mob/living/simple_mob/mechanical/mecha/eclipse/tankyboss/chamberc/do_special_attack(atom/A)
	rng_cycle = rand(1,5)
	if(attackcycle == 1)
		addtimer(CALLBACK(src, PROC_REF(quad_random_firing), A, 20, rng_cycle, 20), 0.5 SECONDS, TIMER_DELETE_ME)
		attackcycle = 0
	else if(attackcycle == 2)
		addtimer(CALLBACK(src, PROC_REF(dual_spin), A, rng_cycle, 15), 0.5 SECONDS, TIMER_DELETE_ME)
		attackcycle = 0
	else if(attackcycle == 3)
		addtimer(CALLBACK(src, PROC_REF(hole_in_wall), A, rng_cycle, 15), 0.5 SECONDS, TIMER_DELETE_ME)
		attackcycle = 0
	else if(attackcycle == 4)
		addtimer(CALLBACK(src, PROC_REF(rising_star), A, rng_cycle, 15), 0.5 SECONDS, TIMER_DELETE_ME)
		attackcycle = 0
	else if(attackcycle == 4)
		attackcycle = 0
		addtimer(CALLBACK(src, PROC_REF(gattlingfire), A, rng_cycle, 8, 7), 0.5 SECONDS, TIMER_DELETE_ME)

/mob/living/simple_mob/mechanical/mecha/eclipse/tankyboss/chambere
	name = "defense automaton"
	desc = "A large, very important looking ai. Plating appears similiar to albative plating."
	icon = 'modular_chomp/icons/mob/hivebot.dmi'
	icon_state = "cyan"
	icon_living = "cyan"
	size_multiplier = 3
	projectiletype = /obj/item/projectile/arc/blue_energy
	wreckage = /obj/item/prop/tyrlore/ants
	specialattackprojectile = /obj/item/projectile/energy/eclipse/tyrjavelin

/mob/living/simple_mob/mechanical/mecha/eclipse/tankyboss/chambere/do_special_attack(atom/A)
	rng_cycle = rand(1,6)
	if(attackcycle == 1)
		addtimer(CALLBACK(src, PROC_REF(quad_random_firing), A, 20, rng_cycle, 20), 0.5 SECONDS, TIMER_DELETE_ME)
		attackcycle = 0
	else if(attackcycle == 2)
		addtimer(CALLBACK(src, PROC_REF(dual_spin), A, rng_cycle, 15), 0.5 SECONDS, TIMER_DELETE_ME)
		attackcycle = 0
	else if(attackcycle == 3)
		addtimer(CALLBACK(src, PROC_REF(hole_in_wall), A, rng_cycle, 15), 0.5 SECONDS, TIMER_DELETE_ME)
		attackcycle = 0
	else if(attackcycle == 4)
		addtimer(CALLBACK(src, PROC_REF(rising_star), A, rng_cycle, 15), 0.5 SECONDS, TIMER_DELETE_ME)
		attackcycle = 0
	else if(attackcycle == 4)
		attackcycle = 0
		addtimer(CALLBACK(src, PROC_REF(gattlingfire), A, rng_cycle, 8, 7), 0.5 SECONDS, TIMER_DELETE_ME)
	else if(attackcycle == 5)
		attackcycle = 0
		addtimer(CALLBACK(src, PROC_REF(cutoff), A, rng_cycle, 5, 15), 0.5 SECONDS, TIMER_DELETE_ME)
	else if(attackcycle == 6)
		attackcycle = 0
		addtimer(CALLBACK(src, PROC_REF(cutoff_ulti), A, rng_cycle, 5, 15), 0.5 SECONDS, TIMER_DELETE_ME)


/mob/living/simple_mob/mechanical/mecha/eclipse/tankyboss/chamberf
	name = "engineering automaton"
	desc = "A large important looking robot, crackling with lighting."
	icon = 'modular_chomp/icons/mob/hivebot.dmi'
	icon_state = "yellow"
	icon_living = "yellow"
	size_multiplier = 3
	wreckage = /obj/item/prop/tyrlore/basicpower
	specialattackprojectile = /obj/item/projectile/energy/lightingspark/nanoweave
	projectiletype = /obj/item/projectile/energy/lightingspark/nanoweave

/mob/living/simple_mob/mechanical/mecha/eclipse/tankyboss/chamberf/do_special_attack(atom/A)
	rng_cycle = rand(1,6)
	if(attackcycle == 1)
		addtimer(CALLBACK(src, PROC_REF(quad_random_firing), A, 20, rng_cycle, 20), 0.5 SECONDS, TIMER_DELETE_ME)
		attackcycle = 0
	else if(attackcycle == 2)
		addtimer(CALLBACK(src, PROC_REF(dual_spin), A, rng_cycle, 15), 0.5 SECONDS, TIMER_DELETE_ME)
		attackcycle = 0
	else if(attackcycle == 3)
		addtimer(CALLBACK(src, PROC_REF(hole_in_wall), A, rng_cycle, 15), 0.5 SECONDS, TIMER_DELETE_ME)
		attackcycle = 0
	else if(attackcycle == 4)
		addtimer(CALLBACK(src, PROC_REF(rising_star), A, rng_cycle, 15), 0.5 SECONDS, TIMER_DELETE_ME)
		attackcycle = 0
	else if(attackcycle == 4)
		attackcycle = 0
		addtimer(CALLBACK(src, PROC_REF(gattlingfire), A, rng_cycle, 8, 7), 0.5 SECONDS, TIMER_DELETE_ME)
	else if(attackcycle == 5)
		attackcycle = 0
		addtimer(CALLBACK(src, PROC_REF(cutoff), A, rng_cycle, 5, 15), 0.5 SECONDS, TIMER_DELETE_ME)
	else if(attackcycle == 6)
		attackcycle = 0
		addtimer(CALLBACK(src, PROC_REF(cutoff_ulti), A, rng_cycle, 5, 15), 0.5 SECONDS, TIMER_DELETE_ME)

/mob/living/simple_mob/mechanical/mecha/eclipse/tankyboss/chamberg //wierd shields
	name = "expirement 28"
	desc = "A strange furball gaurded by a transparent barrier."
	specialattackprojectile = /obj/item/projectile/energy/eclipse/tyrjavelin
	resistance = 10
	icon_state = "UPshield_boss"
	icon_living = "UPshield_boss"
	color = "#FF0000"
	wreckage = /obj/item/prop/tyrlore/advanceshield
	projectiletype = /obj/item/projectile/energy/eclipse/tyrjavelin

/mob/living/simple_mob/mechanical/mecha/eclipse/tankyboss/chamberg/do_special_attack(atom/A)
	rng_cycle = rand(1,6)
	if(attackcycle == 1)
		addtimer(CALLBACK(src, PROC_REF(quad_random_firing), A, 20, rng_cycle, 20), 0.5 SECONDS, TIMER_DELETE_ME)
		attackcycle = 0
	else if(attackcycle == 2)
		addtimer(CALLBACK(src, PROC_REF(dual_spin), A, rng_cycle, 15), 0.5 SECONDS, TIMER_DELETE_ME)
		attackcycle = 0
	else if(attackcycle == 3)
		addtimer(CALLBACK(src, PROC_REF(hole_in_wall), A, rng_cycle, 15), 0.5 SECONDS, TIMER_DELETE_ME)
		attackcycle = 0
	else if(attackcycle == 4)
		addtimer(CALLBACK(src, PROC_REF(rising_star), A, rng_cycle, 15), 0.5 SECONDS, TIMER_DELETE_ME)
		attackcycle = 0
	else if(attackcycle == 4)
		attackcycle = 0
		addtimer(CALLBACK(src, PROC_REF(gattlingfire), A, rng_cycle, 8, 7), 0.5 SECONDS, TIMER_DELETE_ME)
	else if(attackcycle == 5)
		attackcycle = 0
		addtimer(CALLBACK(src, PROC_REF(cutoff), A, rng_cycle, 5, 15), 0.5 SECONDS, TIMER_DELETE_ME)
	else if(attackcycle == 6)
		attackcycle = 0
		addtimer(CALLBACK(src, PROC_REF(cutoff_ulti), A, rng_cycle, 5, 15), 0.5 SECONDS, TIMER_DELETE_ME)
	else if(attackcycle == 7)
		addtimer(CALLBACK(src, PROC_REF(bomb_chaos), A, rng_cycle), 2.5 SECONDS, TIMER_DELETE_ME)
		attackcycle = 0
	else if(attackcycle == 8)
		addtimer(CALLBACK(src, PROC_REF(bomb_lines), A, rng_cycle), 2.5 SECONDS, TIMER_DELETE_ME)
		attackcycle = 0

/mob/living/simple_mob/mechanical/mecha/eclipse/tankyboss/chamberg/bullet_act(obj/item/projectile/P)
	if((P == /obj/item/projectile/ion) && (resistance > 0))
		resistance = 0
		say("Shields destroyed, rerouting power")
		specialattackprojectile = /obj/item/projectile/energy/eclipse/tyrjavelin/speed
		projectiletype = /obj/item/projectile/energy/eclipse/tyrjavelin/speed
		icon_state = "shield_boss"
		icon_living = "shield_boss"
	..()

/mob/living/simple_mob/mechanical/mecha/eclipse/tankyboss/massswarm
	name = "swarm controler"
	desc = "A massive hivebot that has shifting bits of metal upon it's body."
	health = 600
	maxHealth = 600
	icon_state = "bright_green"
	icon_living = "bright_green"
	icon = 'modular_chomp/icons/mob/hivebot.dmi'
	size_multiplier = 3
	wreckage = /obj/item/prop/tyrlore/drones
	special_attack_min_range = 1
	special_attack_max_range = 7
	special_attack_cooldown = 5 SECONDS
	melee_damage_lower = 25
	melee_damage_upper = 25
	attack_armor_pen = 50
	grab_resist = 100
	movement_cooldown = 3

/mob/living/simple_mob/mechanical/mecha/eclipse/tankyboss/massswarm/bullet_act(obj/item/projectile/P)
	for(var/i =1 to 3)
		new /mob/living/simple_mob/mechanical/hivebot/nanoevent/bright_green/tyr(src.loc)
	..()

/mob/living/simple_mob/mechanical/mecha/eclipse/tankyboss/massswarm/attackby(var/obj/item/O as obj, var/mob/user as mob)
	for(var/i =1 to 3)
		new /mob/living/simple_mob/mechanical/hivebot/nanoevent/bright_green/tyr(src.loc)
	..()

/mob/living/simple_mob/mechanical/mecha/eclipse/tankyboss/massswarm/do_special_attack(atom/A)
	for(var/i =1 to 3)
		new /mob/living/simple_mob/mechanical/hivebot/nanoevent/bright_green/tyr(src.loc)

/*
/mob/living/simple_mob/mechanical/mecha/eclipse/tankyboss/finale //finale
	name = "guardian program"
	health = 1200
	maxHealth = 1200
	specialattackprojectile = /obj/item/projectile/bullet/astral_blade
	icon_state = "guardian"
	icon_living = "guardian"
	wreckage = /obj/item/prop/tyrlore/drones

/mob/living/simple_mob/mechanical/mecha/eclipse/tankyboss/finale/bullet_act(obj/item/projectile/P)
	if(P == /obj/item/projectile/bullet/astral_blade) //no friendly fire
		return
	else
		..()


/mob/living/simple_mob/mechanical/mecha/eclipse/tankyboss/finale/do_special_attack(atom/A)
	rng_cycle = rand(1,4)
	if(attackcycle == 1)
		addtimer(CALLBACK(src, PROC_REF(quad_random_firing), A, 20, rng_cycle, 10), 0.5 SECONDS, TIMER_DELETE_ME)
		attackcycle = 0
	else if(attackcycle == 2)
		addtimer(CALLBACK(src, PROC_REF(dual_spin), A, rng_cycle, 5), 0.5 SECONDS, TIMER_DELETE_ME)
		attackcycle = 0
	else if(attackcycle == 3)
		addtimer(CALLBACK(src, PROC_REF(bomb_chaos), A, rng_cycle), 2.5 SECONDS, TIMER_DELETE_ME)
		attackcycle = 0
	else if(attackcycle == 4)
		addtimer(CALLBACK(src, PROC_REF(bomb_lines), A, rng_cycle), 2.5 SECONDS, TIMER_DELETE_ME)
		attackcycle = 0
*/
