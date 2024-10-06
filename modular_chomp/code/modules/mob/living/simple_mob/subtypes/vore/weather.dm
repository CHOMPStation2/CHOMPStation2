/mob/living/simple_mob/vore/weatherbeast //Mostly so mappers don't have to scroll through even more things
	icon = 'modular_chomp/icons/mob/starbeast.dmi'
	melee_damage_lower = 25
	melee_damage_upper = 25
	attack_armor_pen = 30
	heat_resist = 1
	cold_resist = 1
	melee_attack_delay = 1 SECOND
	grab_resist = 100
	devourable = 0
	faction = "Weather_Boss"
	var/weatherprojectile = /obj/item/projectile/energy/phase/bolt

/mob/living/simple_mob/vore/weatherbeast/proc/up_up(atom/target)
	var/obj/item/projectile/P = new weatherprojectile(get_turf(src))
	var/turf = locate(src.x, src.y+2, src.z)
	target = turf
	P.launch_projectile(target, BP_TORSO, src)

/mob/living/simple_mob/vore/weatherbeast/proc/up_up_left(atom/target)
	var/obj/item/projectile/P = new weatherprojectile(get_turf(src))
	var/turf = locate(src.x-1, src.y+2, src.z)
	target = turf
	P.launch_projectile(target, BP_TORSO, src)

/mob/living/simple_mob/vore/weatherbeast/proc/up_up_left_left(atom/target)
	var/obj/item/projectile/P = new weatherprojectile(get_turf(src))
	var/turf = locate(src.x-2, src.y+2, src.z)
	target = turf
	P.launch_projectile(target, BP_TORSO, src)

/mob/living/simple_mob/vore/weatherbeast/proc/up_up_right(atom/target)
	var/obj/item/projectile/P = new weatherprojectile(get_turf(src))
	var/turf = locate(src.x+1, src.y+2, src.z)
	target = turf
	P.launch_projectile(target, BP_TORSO, src)

/mob/living/simple_mob/vore/weatherbeast/proc/up_up_right_right(atom/target)
	var/obj/item/projectile/P = new weatherprojectile(get_turf(src))
	var/turf = locate(src.x+2, src.y+2, src.z)
	target = turf
	P.launch_projectile(target, BP_TORSO, src)

/mob/living/simple_mob/vore/weatherbeast/proc/up_right_right(atom/target)
	var/obj/item/projectile/P = new weatherprojectile(get_turf(src))
	var/turf = locate(src.x+2, src.y+1, src.z)
	target = turf
	P.launch_projectile(target, BP_TORSO, src)

/mob/living/simple_mob/vore/weatherbeast/proc/up_left_left(atom/target)
	var/obj/item/projectile/P = new weatherprojectile(get_turf(src))
	var/turf = locate(src.x-2, src.y+1, src.z)
	target = turf
	P.launch_projectile(target, BP_TORSO, src)

/mob/living/simple_mob/vore/weatherbeast/proc/left_left(atom/target)
	var/obj/item/projectile/P = new weatherprojectile(get_turf(src))
	var/turf = locate(src.x-2, src.y, src.z)
	target = turf
	P.launch_projectile(target, BP_TORSO, src)

/mob/living/simple_mob/vore/weatherbeast/proc/right_right(atom/target)
	var/obj/item/projectile/P = new weatherprojectile(get_turf(src))
	var/turf = locate(src.x+2, src.y, src.z)
	target = turf
	P.launch_projectile(target, BP_TORSO, src)

/mob/living/simple_mob/vore/weatherbeast/proc/down_down(atom/target)
	var/obj/item/projectile/P = new weatherprojectile(get_turf(src))
	var/turf = locate(src.x, src.y-2, src.z)
	target = turf
	P.launch_projectile(target, BP_TORSO, src)

/mob/living/simple_mob/vore/weatherbeast/proc/down_down_left(atom/target)
	var/obj/item/projectile/P = new weatherprojectile(get_turf(src))
	var/turf = locate(src.x-1, src.y-2, src.z)
	target = turf
	P.launch_projectile(target, BP_TORSO, src)

/mob/living/simple_mob/vore/weatherbeast/proc/down_down_left_left(atom/target)
	var/obj/item/projectile/P = new weatherprojectile(get_turf(src))
	var/turf = locate(src.x-2, src.y-2, src.z)
	target = turf
	P.launch_projectile(target, BP_TORSO, src)

/mob/living/simple_mob/vore/weatherbeast/proc/down_down_right(atom/target)
	var/obj/item/projectile/P = new weatherprojectile(get_turf(src))
	var/turf = locate(src.x+1, src.y-2, src.z)
	target = turf
	P.launch_projectile(target, BP_TORSO, src)

/mob/living/simple_mob/vore/weatherbeast/proc/down_down_right_right(atom/target)
	var/obj/item/projectile/P = new weatherprojectile(get_turf(src))
	var/turf = locate(src.x+2, src.y-2, src.z)
	target = turf
	P.launch_projectile(target, BP_TORSO, src)

/mob/living/simple_mob/vore/weatherbeast/proc/down_right_right(atom/target)
	var/obj/item/projectile/P = new weatherprojectile(get_turf(src))
	var/turf = locate(src.x+2, src.y-1, src.z)
	target = turf
	P.launch_projectile(target, BP_TORSO, src)

/mob/living/simple_mob/vore/weatherbeast/proc/down_left_left(atom/target)
	var/obj/item/projectile/P = new weatherprojectile(get_turf(src))
	var/turf = locate(src.x-2, src.y-1, src.z)
	target = turf
	P.launch_projectile(target, BP_TORSO, src)

//Sup, trying to be better with commenting of my code and explain the oddities behind myself. Several may seem off
//A bit ago I added rare anomalous weather with the intent to add some creatures to summon during them, and well here they are.
//The device to summon them, and a potential anomalous weather summoner is a diffrent file/pr.
//Now the design goals.
//The dark mist boss, a strange cloaked furball. Bullet hellish with a fair bit of tell.
//The star sky boss, a mechanical worm. Trying to alter the work on the old worm code to make it function. May need it's own file.
//The sandstorm boss. Dinosaur.
//The acidrain boss. Either summoner, or ranged.
/mob/living/simple_mob/vore/weatherbeast/sandstorm //slow but endless hunter
	name = "fossil tank"
	desc = "A large metal tank."
	health = 800
	maxHealth = 800
	armor = list(melee = 40, bullet = 40, laser = 40, energy = 40, bomb = 50, bio = 100, rad = 100)  //No thematics but I like boss critters to take a bit
	icon_state = "rex"
	melee_attack_delay = 0.5 SECOND
	melee_damage_lower = 40 //Will murder you if you get within melee.
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
	special_attack_min_range = 1
	special_attack_max_range = 14 //The special attacks are more meant to pin you down or provide a healing to this tank.
	special_attack_cooldown = 10 SECONDS

/datum/ai_holder/simple_mob/fossiltank
	use_astar = TRUE
	hostile = TRUE
	retaliate = TRUE
	mauling = TRUE
	unconscious_vore = TRUE
	vision_range = 100 //The entire gimmick of this thing is a slow moving, endless hunter. You shall not escape.
	respect_alpha = FALSE
	destructive = TRUE
	forgive_resting = FALSE

/mob/living/simple_mob/vore/weatherbeast/sandstorm/updatehealth()
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

/mob/living/simple_mob/vore/weatherbeast/sandstorm/do_special_attack(atom/A)
	if(health < maxHealth*0.25)
		visible_message(span_orange("<B>The fossil tank begins self repairs!.</B>"))
		sleep(30)
		for(var/i =1 to 10)
			adjustBruteLoss(-100)
			adjustFireLoss(-100)
			sleep(15)
		adjustBruteLoss(-100)
		adjustFireLoss(-100)
	else
		Beam(A, icon_state = "sat_beam", time = 2.5 SECONDS, maxdistance = INFINITY)
		sleep(30)
		var/obj/item/projectile/P = new /obj/item/projectile/beam/lightning(get_turf(src))
		P.launch_projectile(A, BP_TORSO, src)


/mob/living/simple_mob/vore/weatherbeast/acidrain //acidrain
	name = "toxic jellyfish"
	desc = "A glowing green jellyfish"
	health = 700 //15 laser shots
	maxHealth = 700 //15 laser shots, assuming no armor
	armor = list(melee = 60, bullet = 60, laser = 20, energy = 20, bomb = 50, bio = 100, rad = 100) //So, it's made of jelly. Bullets and melee bounces off of it. The 20 laser and energy are for a smidge extra tankny because I savour endurance fights
	icon_state = "jellyfish"
	icon_state = "jellyfish_dead"
	movement_cooldown = -2
	damage_fatigue_mult = 0 //It's a mutant jellyfish boss mob.
	glow_color = "#14ff20"
	light_color = "#14ff20"
	glow_range = 7
	glow_intensity = 3
	special_attack_min_range = 1
	special_attack_max_range = 7
	special_attack_cooldown = 30 SECONDS

	ai_holder_type = /datum/ai_holder/simple_mob/melee/evasive/jellyfish
	//So this guy is gonna be funky. Their special attacks depend on their nutrition.
	nutrition = 250

/mob/living/simple_mob/vore/weatherbeast/acidrain/apply_melee_effects(var/atom/A)
	if(isliving(A))
		var/mob/living/L = A
		if(L.nutrition)
			L.adjust_nutrition(-250)
			adjust_nutrition(250)
		if(prob(25))
			L.adjustHalLoss(20)

/mob/living/simple_mob/vore/weatherbeast/acidrain/do_special_attack(atom/A)
	if(nutrition > 1100)
		visible_message(span_orange("<B>The giant jellyfish begins to regenerate!.</B>"))
		adjustBruteLoss(-300)
		adjustFireLoss(-300)
		adjust_nutrition(-500)
	else
		return

/mob/living/simple_mob/vore/weatherbeast/acidrain/bullet_act(obj/item/projectile/P)
	..()
	if(istype(P, /obj/item/projectile/energy))
		projectiletype = /obj/item/projectile/energy/declone
		adjust_nutrition(-50)
	if(istype(P, /obj/item/projectile/bullet))
		projectiletype = /obj/item/projectile/energy/bolt
		adjust_nutrition(-50)
	if(istype(P, /obj/item/projectile/beam))
		projectiletype = /obj/item/projectile/beam/gamma
		adjust_nutrition(-50)

/mob/living/simple_mob/vore/weatherbeast/acidrain/handle_special()
	if(stat != DEAD)
		acid_aura()
	..()

/mob/living/simple_mob/vore/weatherbeast/acidrain/proc/acid_aura()
	for(var/mob/living/L in view(7, src))
		if(L.stat == DEAD)
			continue
		if(IIsAlly(L))
			continue
		if(ishuman(L))
			var/mob/living/carbon/human/H = L
			if(H.isSynthetic())
				continue
			L.add_modifier(/datum/modifier/poisoned/weak/acid, 12, src)

/datum/modifier/poisoned/weak/acid //Getting multiple of this will destroy you swiftly.
	incoming_tox_damage_percent = 1.5

/datum/ai_holder/simple_mob/intentional/dark_stranger
	use_astar = TRUE
	var/closest_desired_distance = 4
	var/close_range_radius = 3

/datum/ai_holder/simple_mob/intentional/dark_stranger/on_engagement(atom/A)
	if(get_dist(holder, A) > closest_desired_distance)
		holder.IMove(get_step_towards(holder, A))

/datum/ai_holder/simple_mob/intentional/dark_stranger/pre_special_attack(atom/A)
	if(isliving(A))
		var/mob/living/target = A
		if(flee_when_dying && (holder.health / holder.getMaxHealth()) <= 0.4) //Phase two baby lets ago
			holder.a_intent = I_GRAB

		if(get_dist(target, holder) <= close_range_radius) //So doing a BH tradditonally when they're super close would feel a smidge unfair so get away attacks
			holder.a_intent = I_DISARM

		else
			holder.a_intent = I_HURT


/mob/living/simple_mob/vore/weatherbeast/darkmist //the dark mist
	name = "strange figure"
	desc = "A figure cloaked in purple."
	health = 700
	maxHealth = 700
	armor = list(melee = 20, bullet = 20, laser = 60, energy = 60, bomb = 50, bio = 100, rad = 100) //Is use to manpulation of strange energies
	icon_state = "stranger"
	icon_dead = "stranger_dead"
	ai_holder_type = /datum/ai_holder/simple_mob/intentional/dark_stranger
	damage_fatigue_mult = 0
	movement_cooldown = -1
	special_attack_min_range = 1
	special_attack_max_range = 7
	special_attack_cooldown = 3.5 SECONDS
	projectiletype = /obj/item/projectile/energy/mob/precursor
	weatherprojectile = /obj/item/projectile/energy/mob/precursor
	var/attack_cycle = 1

/obj/item/projectile/bullet/precursorburst
	use_submunitions = 1
	only_submunitions = 1
	range = 0
	embed_chance = 0
	submunition_spread_max = 1200
	submunition_spread_min = 500
	submunitions = list(/obj/item/projectile/energy/mob/precursor = 4)

/obj/item/projectile/bullet/precursorburst/on_range()
	qdel(src)

/obj/item/projectile/bullet/precursorburst/shotgun
	submunition_spread_max = 600
	submunition_spread_min = 100

/mob/living/simple_mob/vore/weatherbeast/darkmist/do_special_attack(atom/A)
	. = TRUE
	switch(a_intent)
		if(I_DISARM)
			close_range(A)
		if(I_HURT) //
			bullet_wave(A)
		if(I_GRAB)
			phase_two(A)


//The way too many special attacks for one boss
/mob/living/simple_mob/vore/weatherbeast/darkmist/proc/close_range(atom/target) //when things are close, going to do pure lasers
	weatherprojectile = /obj/item/projectile/beam/precursor
	if(attack_cycle == 1)
		close_one(target)
	else if(attack_cycle == 2)
		close_two(target)
	else if(attack_cycle == 3)
		close_three(target)

/mob/living/simple_mob/vore/weatherbeast/darkmist/proc/normal_one(atom/target) //we attempt to be a machine gun
	icon_state = "stranger_one"
	Beam(target, icon_state = "sat_beam", time = 5 SECONDS, maxdistance = INFINITY)
	var/obj/item/projectile/P = new /obj/item/projectile/energy/mob/precursor(get_turf(src))
	sleep(5)
	for(var/i =1 to 5)
		P.launch_projectile(target, BP_TORSO, src)
		sleep(5)
	P.launch_projectile(, BP_TORSO, src)
	attack_cycle = 2

/mob/living/simple_mob/vore/weatherbeast/darkmist/proc/normal_two(atom/target) //Get up/down or to the side
	attack_cycle = 3
	icon_state = "stranger_three"
	sleep(10)
	if(prob(50))
		up_up(target)
		up_up_left(target)
		up_up_right(target)
		down_down(target)
		down_down_right(target)
		down_down_left(target)
	else
		up_left_left(target)
		left_left(target)
		down_left_left(target)
		down_right_right(target)
		up_right_right(target)
		right_right(target)

/mob/living/simple_mob/vore/weatherbeast/darkmist/proc/normal_three(atom/target) //Yes
	icon_state = "stranger_five"
	sleep(10)
	up_left_left(target)
	left_left(target)
	down_left_left(target)
	down_right_right(target)
	up_right_right(target)
	right_right(target)
	up_up(target)
	up_up_left(target)
	up_up_right(target)
	down_down(target)
	down_down_right(target)
	down_down_left(target)
	down_down_left_left(target)
	down_down_right_right(target)
	up_up_right_right(target)
	up_up_left_left(target)
	attack_cycle = 1

/mob/living/simple_mob/vore/weatherbeast/darkmist/proc/bullet_wave(atom/target) //when long away, projectiles.
	weatherprojectile = /obj/item/projectile/energy/mob/precursor
	if(attack_cycle == 1)
		normal_one(target)
	else if(attack_cycle == 2)
		normal_two(target)
	else if(attack_cycle == 3)
		normal_three(target)

/mob/living/simple_mob/vore/weatherbeast/darkmist/proc/close_one(atom/target) //Firing a laser
	icon_state = "stranger_two"
	Beam(target, icon_state = "sat_beam", time = 5 SECONDS, maxdistance = INFINITY)
	var/obj/item/projectile/P = new /obj/item/projectile/beam/precursor(get_turf(src))
	sleep(25)
	P.launch_projectile(target, BP_TORSO, src)
	attack_cycle = 2

/mob/living/simple_mob/vore/weatherbeast/darkmist/proc/close_two(atom/target) //Does either an X or a cross
	attack_cycle = 3
	icon_state = "stranger_four"
	sleep(10)
	if(prob(50))
		up_up_left_left(target)
		up_up_right_right(target)
		down_down_left_left(target)
		down_down_right_right(target)
	else
		up_up(target)
		down_down(target)
		left_left(target)
		right_right(target)

/mob/living/simple_mob/vore/weatherbeast/darkmist/proc/close_three(atom/target)
	icon_state = "stranger_six"
	sleep(10)
	up_up_left_left(target)
	down_down_right_right(target)
	sleep(5)
	up_left_left(target)
	down_right_right(target)
	sleep(5)
	left_left(target)
	right_right(target)
	sleep(5)
	down_left_left(target)
	up_right_right(target)
	sleep(5)
	down_down_left_left(target)
	up_up_right_right(target)
	sleep(5)
	down_down_left(target)
	up_up_right(target)
	sleep(5)
	down_down(target)
	up_up(target)
	sleep(5)
	down_down_left(target)
	up_up_right(target)
	attack_cycle = 1

/mob/living/simple_mob/vore/weatherbeast/darkmist/proc/phase_two(atom/target) //phase two we just mix and and match.
	if(attack_cycle == 1)
		phasetwo_one(target)
	else if(attack_cycle == 2)
		phasetwo_two(target)
	else if(attack_cycle == 3)
		phasetwo_three(target)

/mob/living/simple_mob/vore/weatherbeast/darkmist/proc/phasetwo_one(atom/target) //Lighting
	icon_state = "stranger_eight"
	Beam(target, icon_state = "sat_beam", time = 5 SECONDS, maxdistance = INFINITY)
	var/obj/item/projectile/P = new /obj/item/projectile/beam/chain_lightning(get_turf(src))
	sleep(5)
	P.launch_projectile(target, BP_TORSO, src)
	attack_cycle = 2

/mob/living/simple_mob/vore/weatherbeast/darkmist/proc/phasetwo_two(atom/target) //four spinny lasers. However lesser damage projectile
	weatherprojectile = /obj/item/projectile/beam/inversion
	icon_state = "stranger_seven"
	sleep(10)
	up_up_left_left(target)
	down_down_right_right(target)
	down_down_left_left(target)
	up_up_right_right(target)
	sleep(5)
	up_left_left(target)
	down_right_right(target)
	down_down_left_left(target)
	up_up_right(target)
	sleep(5)
	down_down(target)
	up_up(target)
	left_left(target)
	right_right(target)
	sleep(5)
	down_left_left(target) //test
	up_right_right(target)
	down_down_left(target)
	up_up_right(target)
	sleep(5)
	up_up_left_left(target)
	down_down_right_right(target)
	down_down_left_left(target)
	up_up_right_right(target)
	sleep(5)
	up_left_left(target)
	down_right_right(target)
	down_down_left_left(target)
	up_up_right_right(target)
	sleep(5)
	down_down(target)
	up_up(target)
	left_left(target)
	right_right(target)
	sleep(5)
	down_left_left(target)
	up_right_right(target)
	down_down_left(target)
	up_up_right(target)
	attack_cycle = 3

/mob/living/simple_mob/vore/weatherbeast/darkmist/proc/phasetwo_three(atom/target) //and reverse with a dangerous projectile
	weatherprojectile = /obj/item/projectile/beam/crippling_beam
	icon_state = "stranger_nine"
	sleep(10)
	down_left_left(target)
	up_right_right(target)
	down_down_left(target)
	up_up_right(target)
	sleep(5)
	down_down(target)
	up_up(target)
	left_left(target)
	right_right(target)
	sleep(5)
	up_left_left(target)
	down_right_right(target)
	down_down_left_left(target)
	up_up_right_right(target)
	sleep(5)
	up_up_left_left(target)
	down_down_right_right(target)
	down_down_left_left(target)
	up_up_right_right(target)
	sleep(5)
	down_left_left(target)
	up_right_right(target)
	down_down_left(target)
	up_up_right(target)
	sleep(5)
	down_down(target)
	up_up(target)
	left_left(target)
	right_right(target)
	sleep(5)
	up_left_left(target)
	down_right_right(target)
	down_down_left(target)
	up_up_right(target)
	sleep(5)
	up_up_left_left(target)
	down_down_right_right(target)
	down_down_left_left(target)
	up_up_right_right(target)
	attack_cycle = 1

//Note to future self, alter this one later to match the one up above when energy returns.
/mob/living/simple_mob/vore/weatherbeast/starsky //starry skies
	name = "guardian unit"
	desc = "A strange robotic being."
	health = 300
	maxHealth = 300
	armor = list(melee = 40, bullet = 40, laser = 40, energy = 40, bomb = 50, bio = 100, rad = 100)
	icon_state = "astral_sniper"
	icon_dead = "astral_sniper_dead"
	ai_holder_type = /datum/ai_holder/simple_mob/intentional/dark_stranger
	damage_fatigue_mult = 0
	movement_cooldown = -1
	special_attack_min_range = 1
	special_attack_max_range = 7
	special_attack_cooldown = 10 SECONDS
	projectiletype = /obj/item/projectile/energy/astralrail
	weatherprojectile = /obj/item/projectile/energy/astralrail


/mob/living/simple_mob/vore/weatherbeast/starsky/do_special_attack(atom/A)
	. = TRUE
	switch(a_intent)
		if(I_DISARM)
			close_wave(A)
		if(I_HURT) //
			far_wave(A)
		if(I_GRAB)
			phase_two(A)


/mob/living/simple_mob/vore/weatherbeast/starsky/proc/close_wave(atom/target) //bullet pattern when folks up close
	down_down_right_right(target)
	down_down_left_left(target)
	up_up_left_left(target)
	up_up_left_left(target)
	sleep(20)
	right_right(target)
	left_left(target)
	up_up(target)
	down_down(target)
	sleep(20)
	down_down_left(target)
	down_down_right(target)
	down_left_left(target)
	down_right_right(target)
	up_up_right(target)
	up_up_left(target)
	up_left_left(target)
	up_right_right(target)


/mob/living/simple_mob/vore/weatherbeast/starsky/proc/far_wave(atom/target) //Bullet pattern when folks are far away
	down_down_left_left(target)
	down_down_left(target)
	down_down(target)
	down_down_right(target)
	down_down_right_right(target)
	up_up_left_left(target)
	up_up_left(target)
	up_up(target)
	up_up_right(target)
	up_up_right_right(target)
	sleep(20)
	up_up_right_right(target)
	up_right_right(target)
	right_right(target)
	down_right_right(target)
	down_down_right_right(target)
	up_up_left_left(target)
	up_left_left(target)
	left_left(target)
	down_left_left(target)
	down_down_left_left(target)
	sleep(20)
	down_down_left_left(target)
	down_down_left(target)
	down_down(target)
	down_down_right(target)
	down_down_right_right(target)
	up_up_left_left(target)
	up_up_left(target)
	up_up(target)
	up_up_right(target)
	up_up_right_right(target)
	sleep(20)
	up_up_right_right(target)
	up_right_right(target)
	right_right(target)
	down_right_right(target)
	down_down_right_right(target)
	up_up_left_left(target)
	up_left_left(target)
	left_left(target)
	down_left_left(target)
	down_down_left_left(target)

/mob/living/simple_mob/vore/weatherbeast/starsky/proc/phase_two(atom/target) //Phase two bullet pattern
	up_up_left_left(target)
	down_down_right_right(target)
	sleep(10)
	up_up_left(target)
	down_down_right(target)
	sleep(10)
	up_up(target)
	down_down(target)
	sleep(10)
	up_up_right(target)
	down_down_left(target)
	sleep(10)
	up_up_right_right(target)
	down_down_left_left(target)
	sleep(10)
	up_right_right(target)
	down_left_left(target)
	sleep(10)
	right_right(target)
	left_left(target)
	sleep(10)
	down_right_right(target)
	up_left_left(target)
	sleep(10)
	down_down_right_right(target)
	up_up_left_left(target)
	sleep(30)
	up_up_right(target)
	up_up(target)
	up_up_left(target)
	down_down_right(target)
	down_down(target)
	down_down_left(target)
	left_left(target)
	up_left_left(target)
	down_left_left(target)
	right_right(target)
	up_right_right(target)
	down_right_right(target)
	sleep(30)
	up_up_left_left(target)
	up_up_left(target)
	up_up(target)
	up_up_right(target)
	up_up_right_right(target)
	down_down_left_left(target)
	down_down_left(target)
	down_down(target)
	down_down_right(target)
	down_down_right_right(target)
	sleep(30)
	up_up_left_left(target)
	up_up_right_right(target)
	down_down_right_right(target)
	down_down_left_left(target)
	sleep(10)
	up_left_left(target)
	up_up_right(target)
	down_down_left(target)
	down_right_right(target)
	sleep(10)
	left_left(target)
	up_up(target)
	down_down(target)
	right_right(target)
	sleep(10)
	down_left_left(target)
	up_up_left(target)
	down_down_right(target)
	up_right_right(target)
	sleep(10)
	up_up_left_left(target)
	up_up_right_right(target)
	down_down_right_right(target)
	down_down_left_left(target)
	sleep(50) //False sense of security for the finale
	up_up_left_left(target)
	up_up_left(target)
	up_up(target)
	up_up_right(target)
	up_up_right_right(target)
	up_right_right(target)
	up_left_left(target)
	right_right(target)
	left_left(target)
	down_right_right(target)
	down_left_left(target)
	down_down_left_left(target)
	down_down_left(target)
	down_down(target)
	down_down_right(target)
	down_down_right_right(target)
