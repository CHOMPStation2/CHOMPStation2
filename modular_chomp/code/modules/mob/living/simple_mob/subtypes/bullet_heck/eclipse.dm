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
