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
	var/closest_desired_distance = 4

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
	specialattackprojectile = /obj/item/projectile/beam/midlaser
	armor = list(melee = 90, bullet = 90, laser = 90, energy = 90, bomb = 90, bio = 100, rad = 100)
	damage_threshold = 0 //So the wierd armor mechanic works
	icon_state = "gygax_adv"
	wreckage = /obj/structure/loot_pile/mecha/odd_gygax
	special_attack_cooldown = 320


/mob/living/simple_mob/mechanical/mecha/eclipse/antipersonal_unit/updatehealth()
	. = ..()

	if(health < maxHealth*0.3)
		armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 100, rad = 100)
	else if(health < maxHealth*0.6)
		armor = list(melee = 30, bullet = 30, laser = 30, energy = 30, bomb = 30, bio = 100, rad = 100)
	else if (health < maxHealth*0.9)
		armor = list(melee = 60, bullet = 60, laser = 60, energy = 50, bomb = 60, bio = 100, rad = 100)

/mob/living/simple_mob/mechanical/mecha/eclipse/antipersonal_unit/do_special_attack(atom/A)
	. = TRUE // So we don't fire a bolt as well.
	switch(a_intent)
		if(I_DISARM) // Phase 3
			phase_three(A)
		if(I_HURT) // Phase 1
			phase_one(A)
		if(I_GRAB) // Phase 2
			phase_two(A)

/mob/living/simple_mob/mechanical/mecha/eclipse/antipersonal_unit/proc/phase_one(atom/target) //Basic pattern whilst the defense is high
	addtimer(CALLBACK(src, PROC_REF(atkonea), target), 1.5 SECONDS, TIMER_DELETE_ME)

/mob/living/simple_mob/mechanical/mecha/eclipse/antipersonal_unit/proc/atkonea(atom/target)
	if(!target)
		return
	upfour_leftfour(target)
	upfour_rightfour(target)
	downfour_rightfour(target)
	downfour_leftfour(target)
	addtimer(CALLBACK(src, PROC_REF(atkoneb), target), 1.5 SECONDS, TIMER_DELETE_ME)

/mob/living/simple_mob/mechanical/mecha/eclipse/antipersonal_unit/proc/atkoneb(atom/target)
	if(!target)
		return
	upfour(target)
	downfour(target)
	rightfour(target)
	leftfour(target)
	addtimer(CALLBACK(src, PROC_REF(atkonec), target), 1.5 SECONDS, TIMER_DELETE_ME)

/mob/living/simple_mob/mechanical/mecha/eclipse/antipersonal_unit/proc/atkonec(atom/target)
	if(!target)
		return
	upfour_leftfour(target)
	upfour_rightfour(target)
	downfour_rightfour(target)
	downfour_leftfour(target)
	addtimer(CALLBACK(src, PROC_REF(atkoned), target), 1.5 SECONDS, TIMER_DELETE_ME)

/mob/living/simple_mob/mechanical/mecha/eclipse/antipersonal_unit/proc/atkoned(atom/target)
	if(!target)
		return
	upfour(target)
	downfour(target)
	rightfour(target)
	leftfour(target)
	addtimer(CALLBACK(src, PROC_REF(atkonee), target), 1.5 SECONDS, TIMER_DELETE_ME)

/mob/living/simple_mob/mechanical/mecha/eclipse/antipersonal_unit/proc/atkonee(atom/target)
	if(!target)
		return
	upfour_leftfour(target)
	upfour_rightfour(target)
	downfour_rightfour(target)
	downfour_leftfour(target)
	upfour(target)
	downfour(target)
	rightfour(target)
	leftfour(target)

/mob/living/simple_mob/mechanical/mecha/eclipse/antipersonal_unit/proc/phase_two(atom/target) //SPIIIIN TO WIN
	visible_message(span_danger("The [src] is preparing a deadly attack!"))
	addtimer(CALLBACK(src, PROC_REF(spin_to_win), target, 1), 2 SECONDS, TIMER_DELETE_ME)

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


/mob/living/simple_mob/mechanical/mecha/eclipse/antipersonal_unit/proc/phase_three(atom/target) //The strangest pattern but a last stand at 0 defense.
	addtimer(CALLBACK(src, PROC_REF(random_firing), target, 12, 3, 0.5 SECONDS), 0.5 SECONDS, TIMER_DELETE_ME)

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
	specialattackprojectile = /obj/item/projectile/energy/excavate/weak
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
	addtimer(CALLBACK(src, PROC_REF(summon_drones), target, 3, 2, 0.5 SECONDS), 0.5 SECONDS, TIMER_DELETE_ME)
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
	if(prob(50))
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
	specialattackprojectile = /obj/item/projectile/energy/darkspike
	pilot_type = /mob/living/simple_mob/humanoid/merc/ranged
	icon_state = "eclipse_janus"
	attackcycle = 1

/obj/item/projectile/energy/darkspike //This will end you
	name = "gravity well"
	icon = 'modular_chomp/icons/obj/guns/precursor/tyr.dmi'
	icon_state = "gravity_well"
	damage = 70
	armor_penetration = 30
	speed = 15 //Note to self, may need to slow down even further.

/obj/item/projectile/energy/infernosphere
	name = "burning plasma"
	icon = 'modular_chomp/icons/obj/guns/precursor/tyr.dmi'
	icon_state = "plasma"
	damage = 70
	armor_penetration = 30
	speed = 15

/obj/item/projectile/energy/infernosphere/Move()
	. = ..()
	var/turf/T = get_turf(src)
	if(prob(10))
		if(T)
			new /obj/effect/decal/cleanable/liquid_fuel(T,0.2,1)
			T.hotspot_expose(500, 50, 1)
			T.create_fire(700)

/obj/item/projectile/bullet/eclipsejanus
	use_submunitions = 1
	range = 0
	embed_chance = 0
	submunition_spread_max = 900
	submunition_spread_min = 100
	submunitions = list(/obj/item/projectile/energy/darkspike = 3, /obj/item/projectile/energy/infernosphere = 3)

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

//Phase One. Appears random but isn't. Scales higher.
/mob/living/simple_mob/mechanical/mecha/eclipse/darkmatter_assualt/proc/phaseone_cycleone(atom/target)
	specialattackprojectile = /obj/item/projectile/energy/darkspike
	addtimer(CALLBACK(src, PROC_REF(spin_to_win), target, 2), 2 SECONDS, TIMER_DELETE_ME)
	attackcycle = 0

/mob/living/simple_mob/mechanical/mecha/eclipse/darkmatter_assualt/proc/phaseone_cycletwo(atom/target)
	specialattackprojectile = /obj/item/projectile/energy/darkspike
	addtimer(CALLBACK(src, PROC_REF(beglaser), target, 3), 1 SECOND, TIMER_DELETE_ME)
	attackcycle = 0

/mob/living/simple_mob/mechanical/mecha/eclipse/darkmatter_assualt/proc/phaseone_cyclethree(atom/target)
	specialattackprojectile = /obj/item/projectile/energy/darkspike
	addtimer(CALLBACK(src, PROC_REF(random_firing), target, 20, 1, 0.2 SECONDS), 0.5 SECONDS, TIMER_DELETE_ME)
	attackcycle = 0

//Phase Two where we change things up a bit.
/mob/living/simple_mob/mechanical/mecha/eclipse/darkmatter_assualt/proc/phasetwo_cycleone(atom/target) //shows a laser then fires a rockect
	specialattackprojectile = /obj/item/projectile/energy/infernosphere
	addtimer(CALLBACK(src, PROC_REF(spin_to_win), target, 2), 2 SECONDS, TIMER_DELETE_ME)
	attackcycle = 0

/mob/living/simple_mob/mechanical/mecha/eclipse/darkmatter_assualt/proc/phasetwo_cycletwo(atom/target) //summon the most useless horde
	specialattackprojectile = /obj/item/projectile/energy/infernosphere
	addtimer(CALLBACK(src, PROC_REF(beglaser), target, 3), 1 SECOND, TIMER_DELETE_ME)
	attackcycle = 0

/mob/living/simple_mob/mechanical/mecha/eclipse/darkmatter_assualt/proc/phasetwo_cyclethree(atom/target) //turns out the horde is meant to be a shield for the next attack.
	specialattackprojectile = /obj/item/projectile/energy/infernosphere
	addtimer(CALLBACK(src, PROC_REF(random_firing), target, 20, 1, 0.2 SECONDS), 0.5 SECONDS, TIMER_DELETE_ME)
	attackcycle = 0

//Phase three 2 wierd patterns, and 1 strange attack.
/mob/living/simple_mob/mechanical/mecha/eclipse/darkmatter_assualt/proc/phasethree_cycleone(atom/target)
	specialattackprojectile = /obj/item/projectile/energy/infernosphere
	addtimer(CALLBACK(src, PROC_REF(spin_to_win), target, 2), 2 SECONDS, TIMER_DELETE_ME)
	attackcycle = 0

/mob/living/simple_mob/mechanical/mecha/eclipse/darkmatter_assualt/proc/phasethree_cycletwo(atom/target)
	specialattackprojectile = /obj/item/projectile/energy/homing_bolt
	addtimer(CALLBACK(src, PROC_REF(beglaser), target, 3), 1 SECOND, TIMER_DELETE_ME)
	attackcycle = 0

/mob/living/simple_mob/mechanical/mecha/eclipse/darkmatter_assualt/proc/phasethree_cyclethree(atom/target) //eight spinning death beams
	specialattackprojectile = /obj/item/projectile/energy/darkspike
	addtimer(CALLBACK(src, PROC_REF(random_firing), target, 20, 1, 0.2 SECONDS), 0.5 SECONDS, TIMER_DELETE_ME)
	attackcycle = 0