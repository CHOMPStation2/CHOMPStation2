/mob/living/simple_mob/mechanical/mecha/eclipse
	health = 875
	maxHealth = 875
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
	movement_cooldown = 10
	var/specialattackprojectile = /obj/item/projectile/energy/phase/bolt
	var/attackcycle = 1

/mob/living/simple_mob/mechanical/mecha/eclipse/do_special_attack(atom/A)
	upfour_leftfour(A)
	upfour_leftthree(A)
	upfour_lefttwo(A)
	upfour_leftone(A)
	upfour(A)
	upfour_rightone(A)
	upfour_righttwo(A)
	upfour_rightthree(A)
	upfour_rightfour(A)
	upthree_rightfour(A)
	uptwo_rightfour(A)
	upone_rightfour(A)
	rightfour(A)
	downone_rightfour(A)
	downtwo_rightfour(A)
	downthree_rightfour(A)
	downfour_rightfour(A)
	downfour_rightthree(A)
	downfour_righttwo(A)
	downfour_rightone(A)
	downfour(A)
	downfour_leftone(A)
	downfour_lefttwo(A)
	downfour_leftthree(A)
	downfour_leftfour(A)
	downthree_leftfour(A)
	downtwo_leftfour(A)
	downone_leftfour(A)
	leftfour(A)
	upone_leftfour(A)
	uptwo_leftfour(A)
	upthree_leftfour(A)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/upfour_leftfour(atom/target)
	var/obj/item/projectile/P = new specialattackprojectile(get_turf(src))
	var/turf = locate(src.x+4, src.y+4, src.z)
	target = turf
	P.launch_projectile(target, BP_TORSO, src)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/upfour_leftthree(atom/target)
	var/obj/item/projectile/P = new specialattackprojectile(get_turf(src))
	var/turf = locate(src.x+3, src.y+4, src.z)
	target = turf
	P.launch_projectile(target, BP_TORSO, src)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/upfour_lefttwo(atom/target)
	var/obj/item/projectile/P = new specialattackprojectile(get_turf(src))
	var/turf = locate(src.x+2, src.y+4, src.z)
	target = turf
	P.launch_projectile(target, BP_TORSO, src)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/upfour_leftone(atom/target)
	var/obj/item/projectile/P = new specialattackprojectile(get_turf(src))
	var/turf = locate(src.x+1, src.y+4, src.z)
	target = turf
	P.launch_projectile(target, BP_TORSO, src)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/upfour(atom/target)
	var/obj/item/projectile/P = new specialattackprojectile(get_turf(src))
	var/turf = locate(src.x, src.y+4, src.z)
	target = turf
	P.launch_projectile(target, BP_TORSO, src)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/upfour_rightone(atom/target)
	var/obj/item/projectile/P = new specialattackprojectile(get_turf(src))
	var/turf = locate(src.x-1, src.y+4, src.z)
	target = turf
	P.launch_projectile(target, BP_TORSO, src)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/upfour_righttwo(atom/target)
	var/obj/item/projectile/P = new specialattackprojectile(get_turf(src))
	var/turf = locate(src.x-2, src.y+4, src.z)
	target = turf
	P.launch_projectile(target, BP_TORSO, src)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/upfour_rightthree(atom/target)
	var/obj/item/projectile/P = new specialattackprojectile(get_turf(src))
	var/turf = locate(src.x-3, src.y+4, src.z)
	target = turf
	P.launch_projectile(target, BP_TORSO, src)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/upfour_rightfour(atom/target)
	var/obj/item/projectile/P = new specialattackprojectile(get_turf(src))
	var/turf = locate(src.x-4, src.y+4, src.z)
	target = turf
	P.launch_projectile(target, BP_TORSO, src)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/upthree_rightfour(atom/target)
	var/obj/item/projectile/P = new specialattackprojectile(get_turf(src))
	var/turf = locate(src.x-4, src.y+3, src.z)
	target = turf
	P.launch_projectile(target, BP_TORSO, src)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/uptwo_rightfour(atom/target)
	var/obj/item/projectile/P = new specialattackprojectile(get_turf(src))
	var/turf = locate(src.x-4, src.y+2, src.z)
	target = turf
	P.launch_projectile(target, BP_TORSO, src)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/upone_rightfour(atom/target)
	var/obj/item/projectile/P = new specialattackprojectile(get_turf(src))
	var/turf = locate(src.x-4, src.y+1, src.z)
	target = turf
	P.launch_projectile(target, BP_TORSO, src)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/rightfour(atom/target)
	var/obj/item/projectile/P = new specialattackprojectile(get_turf(src))
	var/turf = locate(src.x-4, src.y, src.z)
	target = turf
	P.launch_projectile(target, BP_TORSO, src)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/downone_rightfour(atom/target)
	var/obj/item/projectile/P = new specialattackprojectile(get_turf(src))
	var/turf = locate(src.x-4, src.y-1, src.z)
	target = turf
	P.launch_projectile(target, BP_TORSO, src)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/downtwo_rightfour(atom/target)
	var/obj/item/projectile/P = new specialattackprojectile(get_turf(src))
	var/turf = locate(src.x-4, src.y-2, src.z)
	target = turf
	P.launch_projectile(target, BP_TORSO, src)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/downthree_rightfour(atom/target)
	var/obj/item/projectile/P = new specialattackprojectile(get_turf(src))
	var/turf = locate(src.x-4, src.y-3, src.z)
	target = turf
	P.launch_projectile(target, BP_TORSO, src)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/downfour_rightfour(atom/target)
	var/obj/item/projectile/P = new specialattackprojectile(get_turf(src))
	var/turf = locate(src.x-4, src.y-4, src.z)
	target = turf
	P.launch_projectile(target, BP_TORSO, src)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/downfour_rightthree(atom/target)
	var/obj/item/projectile/P = new specialattackprojectile(get_turf(src))
	var/turf = locate(src.x-3, src.y-4, src.z)
	target = turf
	P.launch_projectile(target, BP_TORSO, src)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/downfour_righttwo(atom/target)
	var/obj/item/projectile/P = new specialattackprojectile(get_turf(src))
	var/turf = locate(src.x-2, src.y-4, src.z)
	target = turf
	P.launch_projectile(target, BP_TORSO, src)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/downfour_rightone(atom/target)
	var/obj/item/projectile/P = new specialattackprojectile(get_turf(src))
	var/turf = locate(src.x-1, src.y-4, src.z)
	target = turf
	P.launch_projectile(target, BP_TORSO, src)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/downfour(atom/target)
	var/obj/item/projectile/P = new specialattackprojectile(get_turf(src))
	var/turf = locate(src.x, src.y-4, src.z)
	target = turf
	P.launch_projectile(target, BP_TORSO, src)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/downfour_leftone(atom/target)
	var/obj/item/projectile/P = new specialattackprojectile(get_turf(src))
	var/turf = locate(src.x+1, src.y-4, src.z)
	target = turf
	P.launch_projectile(target, BP_TORSO, src)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/downfour_lefttwo(atom/target)
	var/obj/item/projectile/P = new specialattackprojectile(get_turf(src))
	var/turf = locate(src.x+2, src.y-4, src.z)
	target = turf
	P.launch_projectile(target, BP_TORSO, src)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/downfour_leftthree(atom/target)
	var/obj/item/projectile/P = new specialattackprojectile(get_turf(src))
	var/turf = locate(src.x+3, src.y-4, src.z)
	target = turf
	P.launch_projectile(target, BP_TORSO, src)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/downfour_leftfour(atom/target)
	var/obj/item/projectile/P = new specialattackprojectile(get_turf(src))
	var/turf = locate(src.x+4, src.y-4, src.z)
	target = turf
	P.launch_projectile(target, BP_TORSO, src)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/downthree_leftfour(atom/target)
	var/obj/item/projectile/P = new specialattackprojectile(get_turf(src))
	var/turf = locate(src.x+4, src.y-3, src.z)
	target = turf
	P.launch_projectile(target, BP_TORSO, src)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/downtwo_leftfour(atom/target)
	var/obj/item/projectile/P = new specialattackprojectile(get_turf(src))
	var/turf = locate(src.x+4, src.y-2, src.z)
	target = turf
	P.launch_projectile(target, BP_TORSO, src)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/downone_leftfour(atom/target)
	var/obj/item/projectile/P = new specialattackprojectile(get_turf(src))
	var/turf = locate(src.x+4, src.y-1, src.z)
	target = turf
	P.launch_projectile(target, BP_TORSO, src)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/leftfour(atom/target)
	var/obj/item/projectile/P = new specialattackprojectile(get_turf(src))
	var/turf = locate(src.x+4, src.y, src.z)
	target = turf
	P.launch_projectile(target, BP_TORSO, src)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/upone_leftfour(atom/target)
	var/obj/item/projectile/P = new specialattackprojectile(get_turf(src))
	var/turf = locate(src.x+4, src.y+1, src.z)
	target = turf
	P.launch_projectile(target, BP_TORSO, src)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/uptwo_leftfour(atom/target)
	var/obj/item/projectile/P = new specialattackprojectile(get_turf(src))
	var/turf = locate(src.x+4, src.y+2, src.z)
	target = turf
	P.launch_projectile(target, BP_TORSO, src)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/upthree_leftfour(atom/target)
	var/obj/item/projectile/P = new specialattackprojectile(get_turf(src))
	var/turf = locate(src.x+4, src.y+3, src.z)
	target = turf
	P.launch_projectile(target, BP_TORSO, src)

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

//Each mecha has a strange defense mechanism.
//High defense at the start that falters the more the battle goes on
/mob/living/simple_mob/mechanical/mecha/eclipse/antipersonal_unit //Melts folks with lasers
	name = "Eclipse Expirmental Anti-Infantary Unit"
	specialattackprojectile = /obj/item/projectile/energy/eclipse/lorge
	armor = list(melee = 60, bullet = 60, laser = 60, energy = 60, bomb = 90, bio = 100, rad = 100)
	damage_threshold = 0 //So the wierd armor mechanic works
	icon_state = "orb"
	wreckage = /obj/structure/loot_pile/mecha/odd_gygax

/*
/mob/living/simple_mob/mechanical/mecha/eclipse/antipersonal_unit/updatehealth()
	. = ..()

	if(health < maxHealth*0.3)
		armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 100, rad = 100)
	else if(health < maxHealth*0.6)
		armor = list(melee = 30, bullet = 30, laser = 30, energy = 30, bomb = 30, bio = 100, rad = 100)
	else if (health < maxHealth*0.9)
		armor = list(melee = 60, bullet = 60, laser = 60, energy = 50, bomb = 60, bio = 100, rad = 100)
*/

/mob/living/simple_mob/mechanical/mecha/eclipse/antipersonal_unit/do_special_attack(atom/A)
	. = TRUE // So we don't fire a bolt as well.
	switch(a_intent)
		if(I_DISARM) // Phase 3
			if(attackcycle == 1)
				phasethree_cycleone(A)
			else if(attackcycle == 2)
				phasethree_cycletwo(A)
			else if(attackcycle == 3)
				phasethree_cyclethree(A)
		if(I_HURT) // Phase 1
			if(attackcycle == 1)
				phaseone_cycleone(A)
			else if(attackcycle == 2)
				phaseone_cycletwo(A)
		if(I_GRAB) // Phase 2
			if(attackcycle == 1)
				phasetwo_cycleone(A)
			else if(attackcycle == 2)
				phasetwo_cycletwo(A)
			else if(attackcycle == 3)
				phasetwo_cyclethree(A)

/mob/living/simple_mob/mechanical/mecha/eclipse/antipersonal_unit/proc/phaseone_cycleone(atom/target)
	addtimer(CALLBACK(src, PROC_REF(dualsweep_one), target, 1), 1 SECOND, TIMER_DELETE_ME)
	attackcycle = 0

/mob/living/simple_mob/mechanical/mecha/eclipse/antipersonal_unit/proc/phaseone_cycletwo(atom/target)
	addtimer(CALLBACK(src, PROC_REF(dualsweep_one_r), target, 2), 1 SECOND, TIMER_DELETE_ME)
	attackcycle = 0

//phase 2
/mob/living/simple_mob/mechanical/mecha/eclipse/antipersonal_unit/proc/phasetwo_cycleone(atom/target)
	addtimer(CALLBACK(src, PROC_REF(dualsweep_one), target, 2), 1 SECOND, TIMER_DELETE_ME)
	attackcycle = 0

/mob/living/simple_mob/mechanical/mecha/eclipse/antipersonal_unit/proc/phasetwo_cycletwo(atom/target)
	addtimer(CALLBACK(src, PROC_REF(dualsweep_one_r), target, 3), 1 SECOND, TIMER_DELETE_ME)
	attackcycle = 0

/mob/living/simple_mob/mechanical/mecha/eclipse/antipersonal_unit/proc/phasetwo_cyclethree(atom/target)
	addtimer(CALLBACK(src, PROC_REF(zone_control_one), target, 1), 0.5 SECONDS, TIMER_DELETE_ME)
	attackcycle = 0

//phase 3
/mob/living/simple_mob/mechanical/mecha/eclipse/antipersonal_unit/proc/phasethree_cycleone(atom/target)
	addtimer(CALLBACK(src, PROC_REF(spin_to_win), target, 2), 1 SECONDS, TIMER_DELETE_ME)
	attackcycle = 0

/mob/living/simple_mob/mechanical/mecha/eclipse/antipersonal_unit/proc/phasethree_cycletwo(atom/target)
	addtimer(CALLBACK(src, PROC_REF(zone_control_one), target, 3), 0.5 SECONDS, TIMER_DELETE_ME)
	attackcycle = 0

/mob/living/simple_mob/mechanical/mecha/eclipse/antipersonal_unit/proc/phasethree_cyclethree(atom/target)
	addtimer(CALLBACK(src, PROC_REF(random_firing), target, 12, 1, 0.5 SECONDS), 0.5 SECONDS, TIMER_DELETE_ME)
	attackcycle = 0

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/spin_to_win(atom/target, var/next_cycle)
	if(!target)
		return
	upfour_leftfour(target)
	upfour_rightfour(target)
	downfour_rightfour(target)
	downfour_leftfour(target)
	addtimer(CALLBACK(src, PROC_REF(spin_to_win_a), target, next_cycle), 0.5 SECONDS, TIMER_DELETE_ME)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/spin_to_win_a(atom/target, var/next_cycle)
	if(!target)
		return
	upfour_leftthree(target)
	upthree_rightfour(target)
	downfour_rightthree(target)
	downthree_leftfour(target)
	addtimer(CALLBACK(src, PROC_REF(spin_to_win_b), target, next_cycle), 0.5 SECONDS, TIMER_DELETE_ME)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/spin_to_win_b(atom/target, var/next_cycle)
	if(!target)
		return
	upfour_lefttwo(target)
	uptwo_rightfour(target)
	downfour_righttwo(target)
	downtwo_leftfour(target)
	addtimer(CALLBACK(src, PROC_REF(spin_to_win_c), target, next_cycle), 0.5 SECONDS, TIMER_DELETE_ME)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/spin_to_win_c(atom/target, var/next_cycle)
	if(!target)
		return
	upfour_leftone(target)
	upone_rightfour(target)
	downfour_rightone(target)
	downone_leftfour(target)
	addtimer(CALLBACK(src, PROC_REF(spin_to_win_d), target, next_cycle), 0.5 SECONDS, TIMER_DELETE_ME)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/spin_to_win_d(atom/target, var/next_cycle)
	if(!target)
		return
	upfour(target)
	rightfour(target)
	downfour(target)
	leftfour(target)
	addtimer(CALLBACK(src, PROC_REF(spin_to_win_e), target, next_cycle), 0.5 SECONDS, TIMER_DELETE_ME)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/spin_to_win_e(atom/target, var/next_cycle)
	if(!target)
		return
	upfour_rightone(target)
	downone_rightfour(target)
	downfour_leftone(target)
	upone_leftfour(target)
	addtimer(CALLBACK(src, PROC_REF(spin_to_win_f), target, next_cycle), 0.5 SECONDS, TIMER_DELETE_ME)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/spin_to_win_f(atom/target, var/next_cycle)
	if(!target)
		return
	upfour_righttwo(target)
	downtwo_rightfour(target)
	downfour_lefttwo(target)
	uptwo_leftfour(target)
	addtimer(CALLBACK(src, PROC_REF(spin_to_win_g), target, next_cycle), 0.5 SECONDS, TIMER_DELETE_ME)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/spin_to_win_g(atom/target, var/next_cycle)
	if(!target)
		return
	upfour_rightthree(target)
	downthree_rightfour(target)
	downfour_leftthree(target)
	upthree_leftfour(target)
	addtimer(CALLBACK(src, PROC_REF(spin_to_win_h), target, next_cycle), 0.5 SECONDS, TIMER_DELETE_ME)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/spin_to_win_h(atom/target, var/next_cycle)
	if(!target)
		return
	upfour_rightfour(target)
	downfour_rightfour(target)
	downfour_leftfour(target)
	upfour_leftfour(target)
	addtimer(CALLBACK(src, PROC_REF(spin_to_win_ra), target, next_cycle), 0.5 SECONDS, TIMER_DELETE_ME)


/mob/living/simple_mob/mechanical/mecha/eclipse/proc/spin_to_win_ra(atom/target, var/next_cycle)//Now we reverse
	if(!target)
		return
	upfour_rightthree(target)
	downthree_rightfour(target)
	downfour_leftthree(target)
	upthree_leftfour(target)
	addtimer(CALLBACK(src, PROC_REF(spin_to_win_rb), target, next_cycle), 0.5 SECONDS, TIMER_DELETE_ME)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/spin_to_win_rb(atom/target, var/next_cycle)
	if(!target)
		return
	upfour_righttwo(target)
	downtwo_rightfour(target)
	downfour_lefttwo(target)
	uptwo_leftfour(target)
	addtimer(CALLBACK(src, PROC_REF(spin_to_win_rc), target, next_cycle), 0.5 SECONDS, TIMER_DELETE_ME)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/spin_to_win_rc(atom/target, var/next_cycle)
	if(!target)
		return
	upfour_rightone(target)
	downone_rightfour(target)
	downfour_leftone(target)
	upone_leftfour(target)
	addtimer(CALLBACK(src, PROC_REF(spin_to_win_rd), target, next_cycle), 0.5 SECONDS, TIMER_DELETE_ME)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/spin_to_win_rd(atom/target, var/next_cycle)
	if(!target)
		return
	upfour(target)
	rightfour(target)
	downfour(target)
	leftfour(target)
	addtimer(CALLBACK(src, PROC_REF(spin_to_win_re), target, next_cycle), 0.5 SECONDS, TIMER_DELETE_ME)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/spin_to_win_re(atom/target, var/next_cycle)
	if(!target)
		return
	upfour_leftone(target)
	upone_rightfour(target)
	downfour_rightone(target)
	downone_leftfour(target)
	addtimer(CALLBACK(src, PROC_REF(spin_to_win_rf), target, next_cycle), 0.5 SECONDS, TIMER_DELETE_ME)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/spin_to_win_rf(atom/target, var/next_cycle)
	if(!target)
		return
	upfour_lefttwo(target)
	uptwo_rightfour(target)
	downfour_righttwo(target)
	downtwo_leftfour(target)
	addtimer(CALLBACK(src, PROC_REF(spin_to_win_rg), target, next_cycle), 0.5 SECONDS, TIMER_DELETE_ME)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/spin_to_win_rg(atom/target, var/next_cycle)
	if(!target)
		return
	upfour_leftthree(target)
	upthree_rightfour(target)
	downfour_rightthree(target)
	downthree_leftfour(target)
	addtimer(CALLBACK(src, PROC_REF(spin_to_win_rh), target, next_cycle), 0.5 SECONDS, TIMER_DELETE_ME)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/spin_to_win_rh(atom/target, var/next_cycle)
	if(!target)
		return
	upfour_leftfour(target)
	upfour_rightfour(target)
	downfour_rightfour(target)
	downfour_leftfour(target)
	attackcycle = next_cycle

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/random_firing(atom/target, var/amount, var/next_cycle, var/fire_delay)
	var/deathdir = rand(1,32)
	if(!target)
		return
	switch(deathdir)
		if(1)
			upfour_leftfour(target)
		if(2)
			upfour_leftthree(target)
		if(3)
			upfour_lefttwo(target)
		if(4)
			upfour_leftone(target)
		if(5)
			upfour(target)
		if(6)
			upfour_rightone(target)
		if(7)
			upfour_righttwo(target)
		if(8)
			upfour_rightthree(target)
		if(9)
			upfour_rightfour(target)
		if(10)
			upthree_rightfour(target)
		if(11)
			uptwo_rightfour(target)
		if(12)
			upone_rightfour(target)
		if(13)
			rightfour(target)
		if(14)
			downone_rightfour(target)
		if(15)
			downtwo_rightfour(target)
		if(16)
			downthree_rightfour(target)
		if(17)
			downfour_rightfour(target)
		if(18)
			downfour_rightthree(target)
		if(19)
			downfour_righttwo(target)
		if(20)
			downfour_rightone(target)
		if(21)
			downfour(target)
		if(22)
			downfour_leftone(target)
		if(23)
			downfour_lefttwo(target)
		if(24)
			downfour_leftthree(target)
		if(25)
			downfour_leftfour(target)
		if(26)
			downthree_leftfour(target)
		if(27)
			downtwo_leftfour(target)
		if(28)
			downone_leftfour(target)
		if(29)
			leftfour(target)
		if(30)
			upone_leftfour(target)
		if(31)
			uptwo_leftfour(target)
		if(32)
			upthree_leftfour(target)
	amount--
	if(amount > 0)
		addtimer(CALLBACK(src, PROC_REF(random_firing), target, amount, next_cycle, fire_delay), fire_delay, TIMER_DELETE_ME)
	else
		attackcycle = next_cycle

//Nigh unbreakable defenses except during certian attack phases.
/mob/living/simple_mob/mechanical/mecha/eclipse/mining_guard //Explosive death
	name = "Eclipse Expirmental Mining Mecha"
	specialattackprojectile = /obj/item/projectile/energy/eclipse/lorgealien
	armor = list(melee = 90, bullet = 90, laser = 90, energy = 90, bomb = 90, bio = 100, rad = 100)
	armor_soak = list(melee = 25, bullet = 25, laser = 25, energy = 25, bomb = 0, bio = 0, rad = 0)
	icon_state = "shielded_mining_mecha"
	shock_resist = 1
	wreckage = /obj/structure/loot_pile/mecha/odd_ripley
	attackcycle = 1

/mob/living/simple_mob/mechanical/mecha/eclipse/mining_guard/do_special_attack(atom/A)
	. = TRUE // So we don't fire a bolt as well.
	switch(a_intent)
		if(I_DISARM) // Phase 3
			if(attackcycle == 1)
				phasethree_cycleone(A)
			else if(attackcycle == 2)
				phasethree_cycletwo(A)
			else if(attackcycle == 3)
				phasethree_cyclethree(A)
		if(I_HURT) // Phase 1
			if(attackcycle == 1)
				phaseone_cycleone(A)
			else if(attackcycle == 2)
				phaseone_cycletwo(A)
			else if(attackcycle == 3)
				phaseone_cyclethree(A)
		if(I_GRAB) // Phase 2
			if(attackcycle == 1)
				phasetwo_cycleone(A)
			else if(attackcycle == 2)
				phasetwo_cycletwo(A)
			else if(attackcycle == 3)
				phasetwo_cyclethree(A)

//phase one. We begin the long drawn out endurance boute
/mob/living/simple_mob/mechanical/mecha/eclipse/mining_guard/proc/phaseone_cycleone(atom/target) //four seconds
	armor = list(melee = 90, bullet = 90, laser = 90, energy = 90, bomb = 90, bio = 100, rad = 100)
	armor_soak = list(melee = 25, bullet = 25, laser = 25, energy = 25, bomb = 0, bio = 0, rad = 0)
	icon_state = "shielded_mining_mecha"
	addtimer(CALLBACK(src, PROC_REF(zone_control_one), target, 2), 0.5 SECONDS, TIMER_DELETE_ME)
	attackcycle = 0


/mob/living/simple_mob/mechanical/mecha/eclipse/mining_guard/proc/phaseone_cycletwo(atom/target) //four seconds
	armor = list(melee = 90, bullet = 90, laser = 90, energy = 90, bomb = 90, bio = 100, rad = 100)
	armor_soak = list(melee = 25, bullet = 25, laser = 25, energy = 25, bomb = 0, bio = 0, rad = 0)
	icon_state = "shielded_mining_mecha"
	addtimer(CALLBACK(src, PROC_REF(random_firing), target, 12, 3, 0.5 SECONDS), 0.5 SECONDS, TIMER_DELETE_ME)
	attackcycle = 0

/mob/living/simple_mob/mechanical/mecha/eclipse/mining_guard/proc/phaseone_cyclethree(atom/target) //eight seconds where it's vunerable
	armor = list(melee = 50, bullet = 50, laser = 50, energy = 50, bomb = 50, bio = 100, rad = 100)
	armor_soak = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 0)
	icon_state = "mining_mecha"
	addtimer(CALLBACK(src, PROC_REF(random_firing), target, 12, 1, 0.5 SECONDS), 0.5 SECONDS, TIMER_DELETE_ME)
	attackcycle = 0


/mob/living/simple_mob/mechanical/mecha/eclipse/proc/summon_drones(atom/target, var/amount, var/next_cycle, var/fire_delay)
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
		addtimer(CALLBACK(src, PROC_REF(summon_drones), target, amount, next_cycle, fire_delay), fire_delay, TIMER_DELETE_ME)
	else
		attackcycle = next_cycle

//phase two now we begin the bullet hell
/mob/living/simple_mob/mechanical/mecha/eclipse/mining_guard/proc/phasetwo_cycleone(atom/target) //Seven seconds
	armor = list(melee = 90, bullet = 90, laser = 90, energy = 90, bomb = 90, bio = 100, rad = 100)
	armor_soak = list(melee = 25, bullet = 25, laser = 25, energy = 25, bomb = 0, bio = 0, rad = 0)
	icon_state = "shielded_mining_mecha"
	visible_message(span_danger("The [src] is preparing a deadly attack!"))
	addtimer(CALLBACK(src, PROC_REF(thewall), target), 2.5 SECONDS, TIMER_DELETE_ME)
	attackcycle = 0

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/thewall(atom/target)
	if(!target)
		return
	upfour_rightfour(target)
	upthree_rightfour(target)
	uptwo_rightfour(target)
	upone_rightfour(target)
	rightfour(target)
	downone_rightfour(target)
	downtwo_rightfour(target)
	downthree_rightfour(target)
	downfour_rightfour(target)
	upfour_leftfour(target)
	upthree_leftfour(target)
	uptwo_leftfour(target)
	upone_leftfour(target)
	leftfour(target)
	downone_leftfour(target)
	downtwo_leftfour(target)
	downthree_leftfour(target)
	downfour_leftfour(target)
	addtimer(CALLBACK(src, PROC_REF(thehall), target), 2.5 SECONDS, TIMER_DELETE_ME)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/thehall(atom/target)
	if(!target)
		return
	upfour_leftfour(target)
	upfour_leftthree(target)
	upfour_lefttwo(target)
	upfour_leftone(target)
	upfour(target)
	upfour_rightone(target)
	upfour_righttwo(target)
	upfour_rightthree(target)
	upfour_rightfour(target)
	downfour_leftfour(target)
	downfour_leftthree(target)
	downfour_lefttwo(target)
	downfour_leftone(target)
	downfour(target)
	downfour_rightone(target)
	downfour_righttwo(target)
	downfour_rightthree(target)
	downfour_rightfour(target)
	attackcycle = 2

/mob/living/simple_mob/mechanical/mecha/eclipse/mining_guard/proc/phasetwo_cycletwo(atom/target) //Seven seconds
	armor = list(melee = 90, bullet = 90, laser = 90, energy = 90, bomb = 90, bio = 100, rad = 100)
	armor_soak = list(melee = 25, bullet = 25, laser = 25, energy = 25, bomb = 0, bio = 0, rad = 0)
	icon_state = "shielded_mining_mecha"
	addtimer(CALLBACK(src, PROC_REF(beglaser), target, 3), 1 SECOND, TIMER_DELETE_ME)
	attackcycle = 0

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/beglaser(atom/target, var/next_cycle)
	upfour_leftone(target)
	upfour(target)
	upfour_rightone(target)
	addtimer(CALLBACK(src, PROC_REF(beglaser_1), target, next_cycle), 1 SECOND, TIMER_DELETE_ME)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/beglaser_1(atom/target, var/next_cycle)
	upfour_rightone(target)
	upfour_righttwo(target)
	upfour_rightthree(target)
	addtimer(CALLBACK(src, PROC_REF(beglaser_2), target, next_cycle), 1 SECOND, TIMER_DELETE_ME)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/beglaser_2(atom/target, var/next_cycle)
	upfour_rightfour(target)
	upthree_rightfour(target)
	uptwo_rightfour(target)
	addtimer(CALLBACK(src, PROC_REF(beglaser_3), target, next_cycle), 1 SECOND, TIMER_DELETE_ME)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/beglaser_3(atom/target, var/next_cycle)
	upone_rightfour(target)
	rightfour(target)
	downone_rightfour(target)
	addtimer(CALLBACK(src, PROC_REF(beglaser_4), target, next_cycle), 1 SECOND, TIMER_DELETE_ME)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/beglaser_4(atom/target, var/next_cycle)
	downone_rightfour(target)
	downtwo_rightfour(target)
	downthree_rightfour(target)
	addtimer(CALLBACK(src, PROC_REF(beglaser_5), target, next_cycle), 1 SECOND, TIMER_DELETE_ME)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/beglaser_5(atom/target, var/next_cycle)
	downthree_rightfour(target)
	downfour_rightfour(target)
	downfour_rightthree(target)
	addtimer(CALLBACK(src, PROC_REF(beglaser_6), target, next_cycle), 1 SECOND, TIMER_DELETE_ME)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/beglaser_6(atom/target, var/next_cycle)
	downfour_rightthree(target)
	downfour_righttwo(target)
	downfour_rightone(target)
	addtimer(CALLBACK(src, PROC_REF(beglaser_7), target, next_cycle), 1 SECOND, TIMER_DELETE_ME)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/beglaser_7(atom/target, var/next_cycle)
	downfour_rightone(target)
	downfour(target)
	downfour_leftone(target)
	addtimer(CALLBACK(src, PROC_REF(beglaser_8), target, next_cycle), 1 SECOND, TIMER_DELETE_ME)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/beglaser_8(atom/target, var/next_cycle)
	downfour_leftone(target)
	downfour_lefttwo(target)
	downfour_leftthree(target)
	addtimer(CALLBACK(src, PROC_REF(beglaser_9), target, next_cycle), 1 SECOND, TIMER_DELETE_ME)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/beglaser_9(atom/target, var/next_cycle)
	downfour_leftfour(target)
	downthree_leftfour(target)
	downtwo_leftfour(target)
	addtimer(CALLBACK(src, PROC_REF(beglaser_10), target, next_cycle), 1 SECOND, TIMER_DELETE_ME)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/beglaser_10(atom/target, var/next_cycle)
	downtwo_leftfour(target)
	downone_leftfour(target)
	leftfour(target)
	addtimer(CALLBACK(src, PROC_REF(beglaser_11), target, next_cycle), 1 SECOND, TIMER_DELETE_ME)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/beglaser_11(atom/target, var/next_cycle)
	leftfour(target)
	upone_leftfour(target)
	uptwo_leftfour(target)
	addtimer(CALLBACK(src, PROC_REF(beglaser_12), target, next_cycle), 1 SECOND, TIMER_DELETE_ME)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/beglaser_12(atom/target, var/next_cycle)
	uptwo_leftfour(target)
	upthree_leftfour(target)
	upfour_leftfour(target)
	addtimer(CALLBACK(src, PROC_REF(beglaser_13), target, next_cycle), 1 SECOND, TIMER_DELETE_ME)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/beglaser_13(atom/target, var/next_cycle)
	upfour_leftfour(target)
	upfour_leftthree(target)
	upfour_lefttwo(target)
	if(prob(20))
		addtimer(CALLBACK(src, PROC_REF(beglaser), target, next_cycle), 1 SECOND, TIMER_DELETE_ME)
	else
		attackcycle = next_cycle

/mob/living/simple_mob/mechanical/mecha/eclipse/mining_guard/proc/phasetwo_cyclethree(atom/target) //seven seconds
	armor = list(melee = 50, bullet = 50, laser = 50, energy = 50, bomb = 50, bio = 100, rad = 100)
	armor_soak = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 0)
	icon_state = "mining_mecha"
	addtimer(CALLBACK(src, PROC_REF(spin_to_win), target, 1), 2 SECONDS, TIMER_DELETE_ME)
	attackcycle = 0

//phase three
/mob/living/simple_mob/mechanical/mecha/eclipse/mining_guard/proc/phasethree_cycleone(atom/target) //seven seconds
	armor = list(melee = 90, bullet = 90, laser = 90, energy = 90, bomb = 90, bio = 100, rad = 100)
	armor_soak = list(melee = 25, bullet = 25, laser = 25, energy = 25, bomb = 0, bio = 0, rad = 0)
	icon_state = "shielded_mining_mecha"
	addtimer(CALLBACK(src, PROC_REF(spin_to_win), target, 2), 2 SECONDS, TIMER_DELETE_ME)
	attackcycle = 0

/mob/living/simple_mob/mechanical/mecha/eclipse/mining_guard/proc/phasethree_cycletwo(atom/target) //seven seconds
	armor = list(melee = 90, bullet = 90, laser = 90, energy = 90, bomb = 90, bio = 100, rad = 100)
	armor_soak = list(melee = 25, bullet = 25, laser = 25, energy = 25, bomb = 0, bio = 0, rad = 0)
	icon_state = "shielded_mining_mecha"
	addtimer(CALLBACK(src, PROC_REF(beglaser), target, 3), 1 SECOND, TIMER_DELETE_ME)
	attackcycle = 0

/mob/living/simple_mob/mechanical/mecha/eclipse/mining_guard/proc/phasethree_cyclethree(atom/target) //two seconds
	armor = list(melee = 50, bullet = 50, laser = 50, energy = 50, bomb = 50, bio = 100, rad = 100)
	armor_soak = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 0)
	icon_state = "mining_mecha"
	addtimer(CALLBACK(src, PROC_REF(random_firing), target, 20, 1, 0.2 SECONDS), 0.5 SECONDS, TIMER_DELETE_ME)
	attackcycle = 0

//High overall defense, swaps between Burn and brute defense based off what was just used.
/mob/living/simple_mob/mechanical/mecha/eclipse/darkmatter_assualt //The final boss
	name = "Eclipse Expirmental Janus"
	armor = list(melee = 60, bullet = 60, laser = 60, energy = 60, bomb = 80, bio = 100, rad = 100)
	specialattackprojectile = /obj/item/projectile/energy/eclipse/janusjavelin
	pilot_type = /mob/living/simple_mob/humanoid/eclipse/head/tyrlead
	icon_state = "eclipse_janus"
	attackcycle = 1


/mob/living/simple_mob/mechanical/mecha/eclipse/darkmatter_assualt/bullet_act(obj/item/projectile/P)
	.= ..()
	if(istype(P, /obj/item/projectile/bullet))
		armor = list(melee = 80, bullet = 80, laser = 40, energy = 40, bomb = 80, bio = 100, rad = 100)
		armor_soak = list(melee = 10, bullet = 10, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 0)
		icon_state = "eclipse_janus_red"
	else
		armor = list(melee = 40, bullet = 40, laser = 80, energy = 80, bomb = 80, bio = 100, rad = 100)
		armor_soak = list(melee = 0, bullet = 0, laser = 10, energy = 10, bomb = 0, bio = 0, rad = 0)
		icon_state = "eclipse_janus_orange"

/mob/living/simple_mob/mechanical/mecha/eclipse/darkmatter_assualt/do_special_attack(atom/A)
	. = TRUE // So we don't fire a bolt as well.
	switch(a_intent)
		if(I_DISARM) // Phase 3
			if(attackcycle == 1)
				specialattackprojectile = /obj/item/projectile/arc/explosive_rocket
				attackcycle = 0
				if(prob(50))
					addtimer(CALLBACK(src, PROC_REF(miniburst_a), A, 1), 0.5 SECONDS, TIMER_DELETE_ME)
				else
					addtimer(CALLBACK(src, PROC_REF(miniburst_b), A, 1), 0.5 SECONDS, TIMER_DELETE_ME)
			else if(attackcycle == 2)
				addtimer(CALLBACK(src, PROC_REF(random_firing), A, 10, 2, 0.75 SECONDS), 0.5 SECONDS, TIMER_DELETE_ME)
				attackcycle = 0
			else if(attackcycle == 3)
				say("Hypercharge laser burst!")
				specialattackprojectile = /obj/item/projectile/beam/heavylaser
				addtimer(CALLBACK(src, PROC_REF(burst), A, 3), 6 SECONDS, TIMER_DELETE_ME)
				attackcycle = 0
			else if(attackcycle == 4)
				specialattackprojectile = /obj/item/projectile/energy/eclipse/janusjavelin
				addtimer(CALLBACK(src, PROC_REF(random_firing), A, 10, 1, 0.75 SECONDS), 0.5 SECONDS, TIMER_DELETE_ME)
				attackcycle = 0
		if(I_HURT) // Phase 1
			specialattackprojectile = /obj/item/projectile/energy/eclipse/janusjavelin
			if(attackcycle == 1)
				addtimer(CALLBACK(src, PROC_REF(spin_to_win), A, 2), 2 SECONDS, TIMER_DELETE_ME)
				attackcycle = 0
			else if(attackcycle == 2)
				addtimer(CALLBACK(src, PROC_REF(random_firing), A, 10, 3, 0.75 SECONDS), 0.5 SECONDS, TIMER_DELETE_ME)
				attackcycle = 0
			else if(attackcycle == 3)
				addtimer(CALLBACK(src, PROC_REF(beglaser), A, 4), 1 SECOND, TIMER_DELETE_ME)
				attackcycle = 0
			else if(attackcycle == 4)
				addtimer(CALLBACK(src, PROC_REF(random_firing), A, 10, 1, 0.75 SECONDS), 0.5 SECONDS, TIMER_DELETE_ME)
				attackcycle = 0
		if(I_GRAB) // Phase 2
			if(attackcycle == 1)
				addtimer(CALLBACK(src, PROC_REF(teleport_attack), A, 2), 0.5 SECONDS, TIMER_DELETE_ME)
				attackcycle = 0
			else if(attackcycle == 2)
				say("Activating laser surge")
				specialattackprojectile = /obj/item/projectile/energy/burninglaser/boss
				addtimer(CALLBACK(src, PROC_REF(miniburst_a), A, 2), 3 SECONDS, TIMER_DELETE_ME)
			else if(attackcycle == 3)
				specialattackprojectile = /obj/item/projectile/energy/eclipse/janusjavelin
				addtimer(CALLBACK(src, PROC_REF(random_firing), A, 10, 4, 0.75 SECONDS), 0.5 SECONDS, TIMER_DELETE_ME)
				attackcycle = 0
			else if(attackcycle == 4)
				specialattackprojectile = /obj/item/projectile/bullet/gyro
				Beam(A, icon_state = "solar_beam", time = 2.5 SECONDS, maxdistance = INFINITY)
				addtimer(CALLBACK(src, PROC_REF(singleproj), A, 1), 3 SECONDS, TIMER_DELETE_ME)
				attackcycle = 0

/mob/living/simple_mob/mechanical/mecha/eclipse/engimecha
	name = "Eclipse Expirmental Enginering Mecha"
	health = 300
	maxHealth = 300
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

	special_attack_cooldown = 120

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

//Jank code?
/obj/item/projectile/energy/spintowin
	name = "burning plasma"
	icon = 'modular_chomp/icons/obj/guns/precursor/tyr.dmi'
	icon_state = "plasma"
	damage = 50
	speed = 15
	ignore_source_check = TRUE
	trajectory_ignore_forcemove = TRUE
	var/spinvaule = 120

/obj/item/projectile/energy/spintowin/Move()
	. = ..()
	Angle += spinvaule

/obj/item/gun/energy/curse_tyrshotgun/debuggun
	projectile_type = /obj/item/projectile/energy/spintowin

/obj/item/projectile/energy/randospeed
	name = "burning plasma"
	icon = 'modular_chomp/icons/obj/guns/precursor/tyr.dmi'
	icon_state = "plasma"
	damage = 50
	speed = 15
	var/spinvaule = 3

/obj/item/projectile/energy/randospeed/Move()
	. = ..()
	if(prob(50))
		speed += spinvaule
	else
		speed -= spinvaule

/mob/living/simple_mob/mechanical/mecha/eclipse/eventplaceholder //So I can use the random fire BH for one time event mobs
	name = "Expirmental Mecha Unit"
	specialattackprojectile = /obj/item/projectile/beam/midlaser
	armor = list(melee = 40, bullet = 40, laser = 40, energy = 40, bomb = 40, bio = 100, rad = 100)
	icon_state = "orb"
	wreckage = /obj/structure/loot_pile/mecha/odd_gygax
	special_attack_cooldown = 320

/mob/living/simple_mob/mechanical/mecha/eclipse/do_special_attack(atom/A)
	addtimer(CALLBACK(src, PROC_REF(random_firing), A, 12, 3, 0.5 SECONDS), 0.5 SECONDS, TIMER_DELETE_ME)


//Revamped special attacks
/mob/living/simple_mob/mechanical/mecha/eclipse/proc/dualsweep_one(atom/target, var/next_cycle)
	if(!target)
		return
	upfour(target)
	downfour(target)
	addtimer(CALLBACK(src, PROC_REF(dualsweep_two), target, next_cycle), 0.5 SECONDS, TIMER_DELETE_ME)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/dualsweep_two(atom/target, var/next_cycle)
	if(!target)
		return
	upfour_leftone(target)
	downfour_rightone(target)
	addtimer(CALLBACK(src, PROC_REF(dualsweep_three), target, next_cycle), 0.5 SECONDS, TIMER_DELETE_ME)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/dualsweep_three(atom/target, var/next_cycle)
	if(!target)
		return
	upfour_lefttwo(target)
	downfour_righttwo(target)
	addtimer(CALLBACK(src, PROC_REF(dualsweep_four), target, next_cycle), 0.5 SECONDS, TIMER_DELETE_ME)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/dualsweep_four(atom/target, var/next_cycle)
	if(!target)
		return
	upfour_leftthree(target)
	downfour_rightthree(target)
	addtimer(CALLBACK(src, PROC_REF(dualsweep_five), target, next_cycle), 0.5 SECONDS, TIMER_DELETE_ME)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/dualsweep_five(atom/target, var/next_cycle)
	if(!target)
		return
	upfour_leftfour(target)
	downfour_rightfour(target)
	addtimer(CALLBACK(src, PROC_REF(dualsweep_six), target, next_cycle), 0.5 SECONDS, TIMER_DELETE_ME)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/dualsweep_six(atom/target, var/next_cycle)
	if(!target)
		return
	upthree_leftfour(target)
	downthree_rightfour(target)
	addtimer(CALLBACK(src, PROC_REF(dualsweep_seven), target, next_cycle), 0.5 SECONDS, TIMER_DELETE_ME)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/dualsweep_seven(atom/target, var/next_cycle)
	if(!target)
		return
	uptwo_leftfour(target)
	downtwo_rightfour(target)
	addtimer(CALLBACK(src, PROC_REF(dualsweep_eight), target, next_cycle), 0.5 SECONDS, TIMER_DELETE_ME)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/dualsweep_eight(atom/target, var/next_cycle)
	if(!target)
		return
	upone_leftfour(target)
	downone_rightfour(target)
	addtimer(CALLBACK(src, PROC_REF(dualsweep_nine), target, next_cycle), 0.5 SECONDS, TIMER_DELETE_ME)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/dualsweep_nine(atom/target, var/next_cycle)
	if(!target)
		return
	leftfour(target)
	rightfour(target)
	addtimer(CALLBACK(src, PROC_REF(dualsweep_ten), target, next_cycle), 0.5 SECONDS, TIMER_DELETE_ME)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/dualsweep_ten(atom/target, var/next_cycle)
	if(!target)
		return
	downone_leftfour(target)
	upone_rightfour(target)
	addtimer(CALLBACK(src, PROC_REF(dualsweep_eleven), target, next_cycle), 0.5 SECONDS, TIMER_DELETE_ME)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/dualsweep_eleven(atom/target, var/next_cycle)
	if(!target)
		return
	downtwo_leftfour(target)
	uptwo_rightfour(target)
	addtimer(CALLBACK(src, PROC_REF(dualsweep_twelve), target, next_cycle), 0.5 SECONDS, TIMER_DELETE_ME)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/dualsweep_twelve(atom/target, var/next_cycle)
	if(!target)
		return
	downthree_leftfour(target)
	upthree_rightfour(target)
	attackcycle = next_cycle

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/dualsweep_one_r(atom/target, var/next_cycle)
	if(!target)
		return
	upfour(target)
	downfour(target)
	addtimer(CALLBACK(src, PROC_REF(dualsweep_two_r), target, next_cycle), 0.5 SECONDS, TIMER_DELETE_ME)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/dualsweep_two_r(atom/target, var/next_cycle)
	if(!target)
		return
	upfour_rightone(target)
	downfour_leftone(target)
	addtimer(CALLBACK(src, PROC_REF(dualsweep_three_r), target, next_cycle), 0.5 SECONDS, TIMER_DELETE_ME)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/dualsweep_three_r(atom/target, var/next_cycle)
	if(!target)
		return
	upfour_righttwo(target)
	downfour_lefttwo(target)
	addtimer(CALLBACK(src, PROC_REF(dualsweep_four_r), target, next_cycle), 0.5 SECONDS, TIMER_DELETE_ME)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/dualsweep_four_r(atom/target, var/next_cycle)
	if(!target)
		return
	upfour_rightthree(target)
	downfour_leftthree(target)
	addtimer(CALLBACK(src, PROC_REF(dualsweep_five_r), target, next_cycle), 0.5 SECONDS, TIMER_DELETE_ME)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/dualsweep_five_r(atom/target, var/next_cycle)
	if(!target)
		return
	upfour_rightfour(target)
	downfour_leftfour(target)
	addtimer(CALLBACK(src, PROC_REF(dualsweep_six_r), target, next_cycle), 0.5 SECONDS, TIMER_DELETE_ME)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/dualsweep_six_r(atom/target, var/next_cycle)
	if(!target)
		return
	upthree_rightfour(target)
	downthree_leftfour(target)
	addtimer(CALLBACK(src, PROC_REF(dualsweep_seven_r), target, next_cycle), 0.5 SECONDS, TIMER_DELETE_ME)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/dualsweep_seven_r(atom/target, var/next_cycle)
	if(!target)
		return
	uptwo_rightfour(target)
	downtwo_leftfour(target)
	addtimer(CALLBACK(src, PROC_REF(dualsweep_eight_r), target, next_cycle), 0.5 SECONDS, TIMER_DELETE_ME)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/dualsweep_eight_r(atom/target, var/next_cycle)
	if(!target)
		return
	upone_rightfour(target)
	downone_leftfour(target)
	addtimer(CALLBACK(src, PROC_REF(dualsweep_nine_r), target, next_cycle), 0.5 SECONDS, TIMER_DELETE_ME)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/dualsweep_nine_r(atom/target, var/next_cycle)
	if(!target)
		return
	rightfour(target)
	leftfour(target)
	addtimer(CALLBACK(src, PROC_REF(dualsweep_ten_r), target, next_cycle), 0.5 SECONDS, TIMER_DELETE_ME)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/dualsweep_ten_r(atom/target, var/next_cycle)
	if(!target)
		return
	downone_rightfour(target)
	upone_leftfour(target)
	addtimer(CALLBACK(src, PROC_REF(dualsweep_eleven_r), target, next_cycle), 0.5 SECONDS, TIMER_DELETE_ME)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/dualsweep_eleven_r(atom/target, var/next_cycle)
	if(!target)
		return
	downtwo_rightfour(target)
	uptwo_leftfour(target)
	addtimer(CALLBACK(src, PROC_REF(dualsweep_twelve_r), target, next_cycle), 0.5 SECONDS, TIMER_DELETE_ME)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/dualsweep_twelve_r(atom/target, var/next_cycle)
	if(!target)
		return
	downthree_rightfour(target)
	upthree_leftfour(target)
	attackcycle = next_cycle

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/zone_control_one(atom/target, var/next_cycle)
	if(!target)
		return
	rightfour(target)
	leftfour(target)
	addtimer(CALLBACK(src, PROC_REF(zone_control_two), target, next_cycle), 0.5 SECONDS, TIMER_DELETE_ME)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/zone_control_two(atom/target, var/next_cycle)
	if(!target)
		return
	rightfour(target)
	leftfour(target)
	upfour(target)
	downfour(target)
	addtimer(CALLBACK(src, PROC_REF(zone_control_three), target, next_cycle), 0.5 SECONDS, TIMER_DELETE_ME)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/zone_control_three(atom/target, var/next_cycle)
	if(!target)
		return
	rightfour(target)
	leftfour(target)
	addtimer(CALLBACK(src, PROC_REF(zone_control_four), target, next_cycle), 0.5 SECONDS, TIMER_DELETE_ME)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/zone_control_four(atom/target, var/next_cycle)
	if(!target)
		return
	rightfour(target)
	leftfour(target)
	upfour_leftone(target)
	upfour_rightone(target)
	downfour_leftone(target)
	downfour_rightone(target)
	addtimer(CALLBACK(src, PROC_REF(zone_control_five), target, next_cycle), 0.5 SECONDS, TIMER_DELETE_ME)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/zone_control_five(atom/target, var/next_cycle)
	if(!target)
		return
	rightfour(target)
	leftfour(target)
	addtimer(CALLBACK(src, PROC_REF(zone_control_six), target, next_cycle), 0.5 SECONDS, TIMER_DELETE_ME)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/zone_control_six(atom/target, var/next_cycle)
	if(!target)
		return
	rightfour(target)
	leftfour(target)
	upfour_lefttwo(target)
	upfour_righttwo(target)
	downfour_lefttwo(target)
	downfour_righttwo(target)
	addtimer(CALLBACK(src, PROC_REF(zone_control_seven), target, next_cycle), 0.5 SECONDS, TIMER_DELETE_ME)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/zone_control_seven(atom/target, var/next_cycle)
	if(!target)
		return
	rightfour(target)
	leftfour(target)
	addtimer(CALLBACK(src, PROC_REF(zone_control_eight), target, next_cycle), 0.5 SECONDS, TIMER_DELETE_ME)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/zone_control_eight(atom/target, var/next_cycle)
	if(!target)
		return
	rightfour(target)
	leftfour(target)
	upfour_leftthree(target)
	upfour_rightthree(target)
	downfour_leftthree(target)
	downfour_rightthree(target)
	addtimer(CALLBACK(src, PROC_REF(zone_control_nine), target, next_cycle), 0.5 SECONDS, TIMER_DELETE_ME)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/zone_control_nine(atom/target, var/next_cycle)
	if(!target)
		return
	rightfour(target)
	leftfour(target)
	addtimer(CALLBACK(src, PROC_REF(zone_control_ten), target, next_cycle), 0.5 SECONDS, TIMER_DELETE_ME)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/zone_control_ten(atom/target, var/next_cycle)
	if(!target)
		return
	rightfour(target)
	leftfour(target)
	upfour_leftthree(target)
	upfour_rightthree(target)
	downfour_leftthree(target)
	downfour_rightthree(target)
	addtimer(CALLBACK(src, PROC_REF(zone_control_eleven), target, next_cycle), 0.5 SECONDS, TIMER_DELETE_ME)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/zone_control_eleven(atom/target, var/next_cycle)
	if(!target)
		return
	rightfour(target)
	leftfour(target)
	addtimer(CALLBACK(src, PROC_REF(zone_control_twelve), target, next_cycle), 0.5 SECONDS, TIMER_DELETE_ME)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/zone_control_twelve(atom/target, var/next_cycle)
	if(!target)
		return
	rightfour(target)
	leftfour(target)
	upfour_leftfour(target)
	upfour_rightfour(target)
	downfour_leftfour(target)
	downfour_rightfour(target)
	addtimer(CALLBACK(src, PROC_REF(zone_control_thirteen), target, next_cycle), 0.5 SECONDS, TIMER_DELETE_ME)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/zone_control_thirteen(atom/target, var/next_cycle)
	if(!target)
		return
	rightfour(target)
	leftfour(target)
	addtimer(CALLBACK(src, PROC_REF(zone_control_fourteen), target, next_cycle), 0.5 SECONDS, TIMER_DELETE_ME)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/zone_control_fourteen(atom/target, var/next_cycle)
	if(!target)
		return
	rightfour(target)
	leftfour(target)
	upthree_leftfour(target)
	upthree_rightfour(target)
	downthree_leftfour(target)
	downthree_rightfour(target)
	addtimer(CALLBACK(src, PROC_REF(zone_control_fifteen), target, next_cycle), 0.5 SECONDS, TIMER_DELETE_ME)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/zone_control_fifteen(atom/target, var/next_cycle)
	if(!target)
		return
	rightfour(target)
	leftfour(target)
	addtimer(CALLBACK(src, PROC_REF(zone_control_sixteen), target, next_cycle), 0.5 SECONDS, TIMER_DELETE_ME)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/zone_control_sixteen(atom/target, var/next_cycle)
	if(!target)
		return
	rightfour(target)
	leftfour(target)
	uptwo_leftfour(target)
	uptwo_rightfour(target)
	downtwo_leftfour(target)
	downtwo_rightfour(target)
	attackcycle = next_cycle


/mob/living/simple_mob/mechanical/mecha/eclipse/proc/singleproj/(atom/target, var/next_cycle)
	if(!target)
		return
	var/obj/item/projectile/P = new specialattackprojectile(get_turf(src))
	P.launch_projectile(target, BP_TORSO, src)
	attackcycle = next_cycle

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/burst(atom/target, var/next_cycle)
	if(!target)
		return
	upfour_leftfour(target)
	upfour_leftthree(target)
	upfour_lefttwo(target)
	upfour_leftone(target)
	upfour(target)
	upfour_rightone(target)
	upfour_righttwo(target)
	upfour_rightthree(target)
	upfour_rightfour(target)
	upthree_rightfour(target)
	uptwo_rightfour(target)
	upone_rightfour(target)
	rightfour(target)
	downone_rightfour(target)
	downtwo_rightfour(target)
	downthree_rightfour(target)
	downfour_rightfour(target)
	downfour_rightthree(target)
	downfour_righttwo(target)
	downfour_rightone(target)
	downfour(target)
	downfour_leftone(target)
	downfour_lefttwo(target)
	downfour_leftthree(target)
	downfour_leftfour(target)
	downthree_leftfour(target)
	downtwo_leftfour(target)
	downone_leftfour(target)
	leftfour(target)
	upone_leftfour(target)
	uptwo_leftfour(target)
	upthree_leftfour(target)
	attackcycle = next_cycle

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/miniburst_a(atom/target, var/next_cycle)
	if(!target)
		return
	upfour_leftfour(target)
	upfour_rightfour(target)
	downfour_rightfour(target)
	downfour_leftfour(target)
	attackcycle = next_cycle

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/miniburst_b(atom/target, var/next_cycle)
	if(!target)
		return
	upfour_leftfour(target)
	upfour_rightfour(target)
	downfour_rightfour(target)
	downfour_leftfour(target)
	attackcycle = next_cycle

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/teleport_attack(atom/target, var/next_cycle)
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
	attackcycle = next_cycle

/mob/living/simple_mob/mechanical/mecha/eclipse/sniper
	name = "Eclipse Lead Pilot"
	icon_state = "captian"
	icon_living = "captian"
	health = 100
	maxHealth = 100
	ai_holder_type = /datum/ai_holder/simple_mob/intentional/three_phases
	armor = list(melee = 70, bullet = 70, laser = 70, energy = 70, bomb = 50, bio = 100, rad = 100)
	specialattackprojectile = /obj/item/projectile/arc/explosive_rocket
	wreckage = /obj/item/prop/tyrlore/monodisc

/mob/living/simple_mob/mechanical/mecha/eclipse/sniper/do_special_attack(atom/A)
	. = TRUE // So we don't fire a bolt as well.
	if(attackcycle == 1)
		addtimer(CALLBACK(src, PROC_REF(teleport_attack), A, 2), 0.5 SECONDS, TIMER_DELETE_ME)
		attackcycle = 0
	else if(attackcycle == 2)
		specialattackprojectile = /obj/item/projectile/beam/heavylaser/cannon
		Beam(A, icon_state = "solar_beam", time = 0.75 SECONDS, maxdistance = INFINITY)
		addtimer(CALLBACK(src, PROC_REF(singleproj), A, 1), 1 SECOND, TIMER_DELETE_ME)
		attackcycle = 0

