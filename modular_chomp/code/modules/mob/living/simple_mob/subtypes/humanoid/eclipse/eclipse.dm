///////////////////////////////
//		Eclipse Mobs Go Here
///////////////////////////////

// Basic Version, the knife merc, or blood ininiate. Don't use them, or the eclipsesolar, lunar base versions either.
/mob/living/simple_mob/humanoid/eclipse
	name = "Eclipse Initiate"
	tt_desc = "E Homo sapiens"
	desc = "You shouldn't be seeing this."
	icon = 'modular_chomp/icons/mob/eclipse.dmi'
	icon_state = "sun"
	icon_living = "sun"
	icon_dead = "statisgem"
	icon_gib = "syndicate_gib"
	taser_kill = 0

	faction = FACTION_ECLIPSE
	movement_cooldown = 0

	status_flags = 0

	response_help = "pokes"
	response_disarm = "shoves"
	response_harm = "hits"

	health = 100 //old 40
	maxHealth = 100
	harm_intent_damage = 5
	melee_damage_lower = 15		//Tac Knife damage
	melee_damage_upper = 15
	attack_sharp = 1	//CHOMPEdit
	attack_edge = 1
	attacktext = list("slashed", "stabbed")
	projectile_dispersion = 0
	ranged_cooldown = 10
	armor = list(melee = 50, bullet = 50, laser = 50, energy = 50, bomb = 50, bio = 100, rad = 100)	// Simple mob immunuties plus base Eclipse foe stuff

	can_be_drop_prey = FALSE //CHOMP Add
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

	projectiletype = /obj/item/projectile/bullet/pistol/medium
	projectilesound = 'sound/weapons/Gunshot_light.ogg'

	needs_reload = TRUE
	reload_max = 7		// Not the best default, but it fits the pistol
	reload_time = 1.5 SECONDS
	ai_holder_type = /datum/ai_holder/simple_mob/intentional/eclipse

	special_attack_cooldown = 15 SECONDS
	special_attack_min_range = 2
	special_attack_max_range = 7
	var/has_heal_droid = FALSE
	var/specialattackprojectile = /obj/item/projectile/energy/phase/bolt
	var/artidrop = /obj/effect/artillery_attack

//Want a self heal for a spefic dude, and to increase diffculty of some POIs
/mob/living/simple_mob/humanoid/eclipse/handle_special()
	if(has_heal_droid)
		adjustBruteLoss(-1.0)
		adjustFireLoss(-1.0)
		adjustToxLoss(-1.0)
		adjustOxyLoss(-1.0)
		adjustCloneLoss(-1.0)
	..()

/mob/living/simple_mob/humanoid/eclipse/update_icon()
	..() // Cuts everything else, so do that first.
	if(has_heal_droid)
		add_overlay(image(icon = 'modular_chomp/icons/mob/eclipse.dmi', icon_state = "heal_droid"))

////////////////////////////////
//		Stealing Merc AI Types
////////////////////////////////
/datum/ai_holder/simple_mob/intentional/eclipse
	conserve_ammo = TRUE
	vision_range = 7
	conserve_ammo = TRUE
	intelligence_level = AI_SMART
	use_astar = TRUE
	pointblank = TRUE
	firing_lanes = TRUE
	call_distance = 2
	wander = FALSE
	var/closest_desired_distance = 4
	var/multiplayer_threshold = 3

/datum/ai_holder/simple_mob/intentional/eclipse/on_engagement(atom/A)
	if(get_dist(holder, A) <= closest_desired_distance)
		holder.IMove(get_step_away(holder, A, closest_desired_distance))
	else if(get_dist(holder, A) > closest_desired_distance)
		holder.IMove(get_step_towards(holder, A))

/datum/ai_holder/simple_mob/intentional/eclipse/pre_special_attack(atom/A)
	if(isliving(A))
		var/tally = 0
		var/list/potential_targets = list_targets()
		for(var/atom/movable/AM in potential_targets)
			if(!can_attack(AM))
				continue
			tally++
		if(tally >= multiplayer_threshold)
			holder.a_intent = I_DISARM
			return
		else
			holder.a_intent = I_HURT

/datum/ai_holder/simple_mob/intentional/eclipse/closerange
	closest_desired_distance = 1


////////////////////////////////
//The solar part of the faction, highly resistant to burns and stuff
/mob/living/simple_mob/humanoid/eclipse/solar
	name = "Solar Eclipse Initiate"
	desc = "You shouldn't be seeing this. But don't use lasers or energy weapons"
	health = 100
	maxHealth = 100
	projectiletype = /obj/item/projectile/energy/eclipse

	armor = list(melee = -100, bullet = -100, laser = 40, energy = 40, bomb = 50, bio = 100, rad = 100) //Solar members are nigh immune to burns.
	armor_soak = list(melee = 0, bullet = 0, laser = 20, energy = 20, bomb = 0, bio = 0, rad = 0)

/mob/living/simple_mob/humanoid/eclipse/solar/bullet_act(obj/item/projectile/P)
	..()
	if(istype(P, /obj/item/projectile/energy) || istype(P, /obj/item/projectile/beam))
		visible_message(span_cult("[P] seems ineffective!."))

/mob/living/simple_mob/humanoid/eclipse/solar/snipertesh
	name = "Solar Eclipse Sniper"
	desc = "An armored teshari with a sniper, protected from laser and energy based attacks"
	health = 50 //old 20
	maxHealth = 50
	movement_cooldown = -1

	icon_state = "eclipse_snipertesh"
	icon_living = "eclipse_snipertesh"

	projectiletype = /obj/item/projectile/bullet/tyrshotburst

	projectile_accuracy = 100

	reload_max = 1
	reload_time = 2.5 SECONDS
	ranged_attack_delay = 1.5 SECONDS
	var/cloaked_alpha = 60			// Lower = Harder to see.
	var/cloak_cooldown = 5 SECONDS	// Amount of time needed to re-cloak after losing it.
	var/last_uncloak = 0

	loot_list = list(/obj/item/slime_extract/sepia  = 1,
		/obj/item/bone/skull = 100,
		/obj/item/gun/energy/lasershotgun = 10
			)

/mob/living/simple_mob/humanoid/eclipse/solar/snipertesh/cloak()
	if(cloaked)
		return
	animate(src, alpha = cloaked_alpha, time = 1 SECOND)
	cloaked = TRUE


/mob/living/simple_mob/humanoid/eclipse/solar/snipertesh/uncloak()
	last_uncloak = world.time // This is assigned even if it isn't cloaked already, to 'reset' the timer if the spider is continously getting attacked.
	if(!cloaked)
		return
	animate(src, alpha = initial(alpha), time = 1 SECOND)
	cloaked = FALSE

// Check if cloaking if possible.
/mob/living/simple_mob/humanoid/eclipse/solar/snipertesh/proc/can_cloak()
	if(stat)
		return FALSE
	if(last_uncloak + cloak_cooldown > world.time)
		return FALSE

	return TRUE

// Called by things that break cloaks, like Technomancer wards.
/mob/living/simple_mob/humanoid/eclipse/solar/snipertesh/break_cloak()
	uncloak()

/mob/living/simple_mob/humanoid/eclipse/solar/snipertesh/is_cloaked()
	return cloaked

/mob/living/simple_mob/humanoid/eclipse/solar/snipertesh/is_cloaked()
	return cloaked

/mob/living/simple_mob/humanoid/eclipse/solar/snipertesh/ranged_pre_animation(atom/A)
	Beam(get_turf(A), icon_state = "sniper_beam", time = 2 SECONDS, maxdistance = 5)
	. = ..()

/mob/living/simple_mob/humanoid/eclipse/solar/snipertesh/shoot_target(atom/A)
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

	if(ranged_cooldown_time) //If you have a non-zero number in a mob's variables, this pattern begins.
		if(ranged_cooldown <= world.time) //Further down, a timer keeps adding to the ranged_cooldown variable automatically.
			visible_message(span_bolddanger("\The [src]") + " fires at \the [A]!") //Leave notice of shooting.
			shoot(A) //Perform the shoot action
			if(casingtype) //If the mob is designated to leave casings...
				new casingtype(loc) //... leave the casing.
			ranged_cooldown = world.time + ranged_cooldown_time + ((injury_level / 2) SECONDS) //Special addition here. This is a timer. Keeping updating the time after shooting. Add that ranged cooldown time specified in the mob to the world time.
		return TRUE	//End these commands here.
	// CHOMPAddition End

	visible_message(span_danger(span_bold("\The [src]") + " fires at \the [orig_targ]!"))
	shoot(A)
	if(casingtype)
		new casingtype(loc)

	if(ranged_attack_delay)
		ranged_post_animation(A)

	return TRUE

/mob/living/simple_mob/humanoid/eclipse/solar/snipertesh/handle_special()
	if(!cloaked && can_cloak())
		cloak()


/mob/living/simple_mob/humanoid/eclipse/solar/plant
	name = "Solar Eclipse Bioexpirment"
	desc = "A strange armored looking plant."
	reload_max = 6
	reload_time = 1 SECOND
	movement_cooldown = 1

	icon_state = "eclipse_plant"
	icon_living = "eclipse_plant"

	projectiletype = /obj/item/projectile/energy/blob/toxic
	specialattackprojectile = /obj/item/projectile/arc/spore
	special_attack_cooldown = 7 SECONDS
	special_attack_min_range = 1
	special_attack_max_range = 7

	loot_list = list(/obj/item/slime_extract/sepia  = 1,
		/obj/item/bone/skull = 100,
		/obj/item/seeds/random = 20
			)

/mob/living/simple_mob/humanoid/eclipse/solar/plant/do_special_attack(atom/A)
	. = TRUE // So we don't fire a bolt as well.
	switch(a_intent)
		if(I_DISARM)
			visible_message(span_warning("\The a flower begins to sprout from [src]'s back!"))
			Beam(A, icon_state = "sat_beam", time = 2.5 SECONDS, maxdistance = INFINITY)
			addtimer(CALLBACK(src, PROC_REF(special_projectile), A), 3 SECONDS, TIMER_DELETE_ME)
		else
			visible_message(span_warning("\The [src]'s vines spread out!"))
			Beam(A, icon_state = "vine", time = 3 SECONDS, maxdistance = INFINITY)
			if(ishuman(A))
				addtimer(CALLBACK(src, PROC_REF(itemyoink), A), 3 SECONDS, TIMER_DELETE_ME)


/mob/living/simple_mob/humanoid/eclipse/solar/disablernoodle //If you have a Nif, or are a borg you get hit with confusion and adds Edit, can't currently figure out NIF targeting
	name = "Solar Eclipse Disabler Serpent"
	desc = "A naga cladded in strange orange armor, seemingly guarded from lasers and energy based weaponry."
	icon_state = "eclipse_disabler"
	icon_living = "eclipse_disabler"
	reload_max = 5
	movement_cooldown = 1

	special_attack_cooldown = 30 SECONDS
	special_attack_min_range = 1
	special_attack_max_range = 7

	projectiletype = /obj/item/projectile/energy/eclipse
	specialattackprojectile = /obj/item/projectile/energy/flash

	loot_list = list(/obj/item/slime_extract/sepia  = 1,
		/obj/item/bone/skull = 100,
		/obj/item/cell/device/weapon/empproof = 10
			)

/mob/living/simple_mob/humanoid/eclipse/solar/disablernoodle/do_special_attack(atom/A)
	. = TRUE // So we don't fire a bolt as well.
	switch(a_intent)
		if(I_DISARM)
			specialattackprojectile = /obj/item/projectile/beam/stun
			visible_message(span_warning("\The [src] begins to aim a strange gun!"))
			Beam(A, icon_state = "sat_beam", time = 4.5 SECONDS, maxdistance = INFINITY)
			addtimer(CALLBACK(src, PROC_REF(special_projectile), A), 5 SECONDS, TIMER_DELETE_ME)
		else
			specialattackprojectile = /obj/item/projectile/energy/flash
			visible_message(span_warning("\The [src] begins to aim a flare gun!"))
			Beam(A, icon_state = "sat_beam", time = 3 SECONDS, maxdistance = INFINITY)
			addtimer(CALLBACK(src, PROC_REF(special_projectile), A), 3 SECONDS, TIMER_DELETE_ME)


/mob/living/simple_mob/humanoid/eclipse/solar/froststalker //teleporting stalker
	name = "Solar Eclipse Froststalker"
	desc = "A somewhat see through being wearing a burn resistaint coat."
	melee_damage_lower = 10
	melee_damage_upper = 10
	attack_armor_pen = 40
	special_attack_cooldown = 7 SECONDS
	special_attack_min_range = 1
	special_attack_max_range = 7
	projectiletype = null
	ai_holder_type = /datum/ai_holder/simple_mob/intentional/adv_dark_gygax
	icon_state = "froststalker"
	icon_living = "froststalker"
	cold_resist = 1.0
	melee_attack_delay = 1.5
	loot_list = list(/obj/item/slime_extract/sepia  = 1,
		/obj/item/bone/skull = 100,
		/obj/item/stack/material/valhollide = 10
			)

/mob/living/simple_mob/humanoid/eclipse/solar/froststalker/do_special_attack(atom/A)
	teleport(A)

/mob/living/simple_mob/humanoid/eclipse/solar/nuclear
	name = "Solar Eclipse Technician"
	desc = "A strange being wearing a burn resistaint coat."
	icon_state = "eclipse_nuke"
	projectiletype = /obj/item/projectile/energy/lightingspark
	special_attack_cooldown = 15 SECONDS
	special_attack_min_range = 1
	special_attack_max_range = 9
	specialattackprojectile = /obj/item/projectile/bullet/magnetic/fuelrod/tritium
	loot_list = list(/obj/item/slime_extract/sepia  = 1,
		/obj/item/bone/skull = 100,
		/obj/item/stock_parts/matter_bin/hyper = 10,
		/obj/item/stock_parts/manipulator/hyper = 10,
		/obj/item/stock_parts/capacitor/hyper = 10,
		/obj/item/stock_parts/scanning_module/hyper = 10,
		/obj/item/stock_parts/micro_laser/hyper = 10
			)

/mob/living/simple_mob/humanoid/eclipse/solar/nuclear/do_special_attack(atom/A)
	. = TRUE // So we don't fire a bolt as well.
	switch(a_intent)
		if(I_DISARM)
			specialattackprojectile = /obj/item/projectile/bullet/magnetic/fuelrod/tritium
			visible_message(span_warning("\The [src] begins to mess with a fuel rod cannon!"))
			Beam(A, icon_state = "sat_beam", time = 4.5 SECONDS, maxdistance = INFINITY)
			addtimer(CALLBACK(src, PROC_REF(special_projectile), A), 5 SECONDS, TIMER_DELETE_ME)
		else
			specialattackprojectile = /obj/item/projectile/beam/lightning
			visible_message(span_warning("\The [src] pulls out a lighting rod!"))
			Beam(A, icon_state = "sat_beam", time = 1.5 SECONDS, maxdistance = INFINITY)
			addtimer(CALLBACK(src, PROC_REF(special_projectile), A), 2 SECONDS, TIMER_DELETE_ME)

/mob/living/simple_mob/humanoid/eclipse/solar/medicalsquish
	name = "Lunar Eclipse Medic"
	desc = "A strange being wearing a burn resistaint coat."
	special_attack_cooldown = 5 SECONDS
	special_attack_min_range = 1
	special_attack_max_range = 7
	projectiletype = /obj/item/projectile/energy/eclipse
	icon_state = "guardian"
	icon_living = "guardian"
	reload_max = 4
	var/reflectmode = 0

	loot_list = list(/obj/item/slime_extract/sepia  = 1,
		/obj/item/slime_extract/pink = 100,
		/obj/item/xenobio/monkey_gun = 15
			)

/mob/living/simple_mob/humanoid/eclipse/solar/medicalsquish/bullet_act(var/obj/item/projectile/P, var/def_zone)
	if(reflectmode == 1)
		if(istype(P,/obj/item/projectile/beam) || istype(P, /obj/item/projectile/energy))
			visible_message(span_danger("\The [src] reflects \the [P]!"))

			// Find a turf near or on the original location to bounce to
			var/new_x = P.starting.x + pick(0, 0, 0, -1, 1, -2, 2)
			var/new_y = P.starting.y + pick(0, 0, 0, -1, 1, -2, 2)
			var/turf/curloc = get_turf(src)

			// redirect the projectile
			P.redirect(new_x, new_y, curloc, src)
			P.reflected = TRUE
			return PROJECTILE_CONTINUE // complete projectile permutation
		else
			..()
	else
		..()

/mob/living/simple_mob/humanoid/eclipse/solar/medicalsquish/do_special_attack(atom/A)
	. = TRUE // So we don't fire a bolt as well.
	switch(a_intent)
		if(I_DISARM)
			visible_message(span_warning("\The [src] turns silver!!"))
			icon_state = "silver"
			icon_living = "silver"
			reflectmode = 1
			addtimer(CALLBACK(src, PROC_REF(change_back), A), 5 SECONDS, TIMER_DELETE_ME)
		else
			visible_message(span_warning("\The [src] regenerates!!")) //completly lying the mob does nothing in single player mode

/mob/living/simple_mob/humanoid/eclipse/solar/medicalsquish/proc/change_back()
	icon_state = "guardian"
	icon_living = "guardian"

/mob/living/simple_mob/humanoid/eclipse/solar/medicalsquish/handle_special()
	if(stat != DEAD)
		heal_aura()
	..()

/mob/living/simple_mob/humanoid/eclipse/solar/medicalsquish/proc/heal_aura()
	for(var/mob/living/L in view(src, 7))
		if(L.stat == DEAD || !IIsAlly(L))
			continue
		L.add_modifier(/datum/modifier/aura/slime_heal, null, src)

//The lunar mobs, highly resistant to brute based damage.
/mob/living/simple_mob/humanoid/eclipse/lunar
	name = "Lunar Eclipse Initiate"
	desc = "You shouldn't be seeing this, but don't use melee weapons or bullets."
	health = 100
	maxHealth = 100
	projectiletype = /obj/item/projectile/bullet/crystaline
	armor = list(melee = 40, bullet = 40, laser = -100, energy = -100, bomb = 50, bio = 100, rad = 100) //Lunar members are nigh immune to burns.
	armor_soak = list(melee = 20, bullet = 20, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 0) //15 because every melee weapon has dumb amount of AP

/mob/living/simple_mob/humanoid/eclipse/lunar/bullet_act(obj/item/projectile/P)
	..()
	if(istype(P, /obj/item/projectile/bullet))
		visible_message(span_cult("[P] seems ineffective!."))

/mob/living/simple_mob/humanoid/eclipse/lunar/attackby(var/obj/item/O as obj, var/mob/user as mob)
	to_chat(user, span_cult("This weapon is ineffective, it does no damage."))
	.=..()

/mob/living/simple_mob/humanoid/eclipse/lunar/bulletstorm //tesh got a gun
	name = "Lunar Eclipse Judge"
	desc = "A teshari wildly wielding a pistol, wearing bullet and sword protective gear."
	health = 50
	maxHealth = 50
	icon_state = "eclipse_shottesh"
	icon_living = "eclipse_shottesh"
	movement_cooldown = -1


	projectiletype = /obj/item/projectile/bullet/crystalineburst
	reload_max = 1
	reload_time = 2.5 SECONDS
	ranged_attack_delay = 1.5 SECONDS
	var/cloaked_alpha = 40			// Lower = Harder to see.
	var/cloak_cooldown = 1 SECONDS	// Amount of time needed to re-cloak after losing it.
	var/last_uncloak = 0

	loot_list = list(/obj/item/slime_extract/sepia  = 1,
		/obj/item/bone/skull = 100,
		/obj/item/ammo_magazine/ammo_box/b12g/pellet = 15
			)

/mob/living/simple_mob/humanoid/eclipse/lunar/bulletstorm/cloak()
	if(cloaked)
		return
	animate(src, alpha = cloaked_alpha, time = 1 SECOND)
	cloaked = TRUE


/mob/living/simple_mob/humanoid/eclipse/lunar/bulletstorm/uncloak()
	last_uncloak = world.time // This is assigned even if it isn't cloaked already, to 'reset' the timer if the spider is continously getting attacked.
	if(!cloaked)
		return
	animate(src, alpha = initial(alpha), time = 1 SECOND)
	cloaked = FALSE

// Check if cloaking if possible.
/mob/living/simple_mob/humanoid/eclipse/lunar/bulletstorm/proc/can_cloak()
	if(stat)
		return FALSE
	if(last_uncloak + cloak_cooldown > world.time)
		return FALSE

	return TRUE

// Called by things that break cloaks, like Technomancer wards.
/mob/living/simple_mob/humanoid/eclipse/lunar/bulletstorm/break_cloak()
	uncloak()


/mob/living/simple_mob/humanoid/eclipse/lunar/bulletstorm/is_cloaked()
	return cloaked

/mob/living/simple_mob/humanoid/eclipse/lunar/bulletstorm/is_cloaked()
	return cloaked

/mob/living/simple_mob/humanoid/eclipse/lunar/bulletstorm/ranged_pre_animation(atom/A)
	Beam(get_turf(A), icon_state = "sniper_beam", time = 2 SECONDS, maxdistance = 5)
	. = ..()

/mob/living/simple_mob/humanoid/eclipse/lunar/bulletstorm/shoot_target(atom/A)
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

	if(ranged_cooldown_time) //If you have a non-zero number in a mob's variables, this pattern begins.
		if(ranged_cooldown <= world.time) //Further down, a timer keeps adding to the ranged_cooldown variable automatically.
			visible_message(span_bolddanger("\The [src]") + " fires at \the [A]!") //Leave notice of shooting.
			shoot(A) //Perform the shoot action
			if(casingtype) //If the mob is designated to leave casings...
				new casingtype(loc) //... leave the casing.
			ranged_cooldown = world.time + ranged_cooldown_time + ((injury_level / 2) SECONDS) //Special addition here. This is a timer. Keeping updating the time after shooting. Add that ranged cooldown time specified in the mob to the world time.
		return TRUE	//End these commands here.
	// CHOMPAddition End

	visible_message(span_danger(span_bold("\The [src]") + " fires at \the [orig_targ]!"))
	shoot(A)
	if(casingtype)
		new casingtype(loc)

	if(ranged_attack_delay)
		ranged_post_animation(A)

	return TRUE

/mob/living/simple_mob/humanoid/eclipse/lunar/bulletstorm/handle_special()
	if(!cloaked && can_cloak())
		cloak()

/mob/living/simple_mob/mechanical/mining_drone/scavenger/eclipse
	health = 1
	maxHealth = 1
	faction = "eclipse"

/mob/living/simple_mob/humanoid/eclipse/lunar/silvernoodle //Bouncing bullet extreme
	name = "Lunar Eclipse Silver Serpent"
	desc = "A hungry looking naga, their strange armor protecting them from ballistics and physical weaponry."
	reload_max = 6
	movement_cooldown = 1

	icon_state = "eclipse_silver"
	icon_living = "eclipse_silver"

	special_attack_cooldown = 30 SECONDS
	special_attack_min_range = 1
	special_attack_max_range = 7
	specialattackprojectile = /obj/item/projectile/beam/energy_net

	loot_list = list(/obj/item/slime_extract/sepia  = 1,
		/obj/item/bone/skull = 100,
		/obj/item/archaeological_find = 15
			)

/mob/living/simple_mob/humanoid/eclipse/lunar/silvernoodle/do_special_attack(atom/A) //I am bringing back the netgun attack. 4 seconds
	. = TRUE // So we don't fire a bolt as well.
	switch(a_intent)
		if(I_DISARM)
			specialattackprojectile = /obj/item/projectile/bullet/srmrocket/weak
			visible_message(span_warning("\The [src] begins to mess with a rockect launcher!"))
			Beam(A, icon_state = "sat_beam", time = 4.5 SECONDS, maxdistance = INFINITY)
			addtimer(CALLBACK(src, PROC_REF(special_projectile), A), 5 SECONDS, TIMER_DELETE_ME)
		else
			specialattackprojectile = /obj/item/projectile/temp/hot
			visible_message(span_warning("\The [src] pulls out a tempature gun!"))
			Beam(A, icon_state = "sat_beam", time = 1.5 SECONDS, maxdistance = INFINITY)
			addtimer(CALLBACK(src, PROC_REF(special_projectile), A), 2 SECONDS, TIMER_DELETE_ME)


/obj/item/grenade/chem_grenade/frost
	name = "frost grenade"
	desc = "Currently in the testing phase, pratical purposes are unknown."
	icon_state = "foam"
	path = 1
	stage = 2
	sealed = TRUE

/obj/item/grenade/chem_grenade/frost/Initialize(mapload)
	. = ..()
	var/obj/item/reagent_containers/glass/beaker/bluespace/B1 = new(src)
	var/obj/item/reagent_containers/glass/beaker/bluespace/B2 = new(src)

	B1.reagents.add_reagent(REAGENT_ID_CRYOSLURRY, 150)
	B1.reagents.add_reagent(REAGENT_ID_POTASSIUM, 150)
	B2.reagents.add_reagent(REAGENT_ID_PHOSPHORUS, 150)
	B2.reagents.add_reagent(REAGENT_ID_SUGAR, 150)

	detonator = new/obj/item/assembly_holder/timer_igniter(src)

	beakers += B1

/obj/item/projectile/bullet/frostshotgun
	use_submunitions = 1
	only_submunitions = 1
	range = 0
	embed_chance = 0
	submunition_spread_max = 1200
	submunition_spread_min = 500
	submunitions = list(/obj/item/projectile/energy/frostsphere = 4)

	hud_state = "plasma_sphere"

/obj/item/projectile/bullet/frostshotgun/on_range()
	qdel(src)

/obj/item/projectile/energy/frostsphere
	name = "frost sphere"
	icon_state = "ice_2"
	fire_sound = 'sound/weapons/pulse3.ogg'
	damage = 20
	modifier_type_to_apply = /datum/modifier/cryogelled
	modifier_duration = 0.25 MINUTE
	speed = 2.5
	range = 12
	hud_state = "water"

/mob/living/simple_mob/humanoid/eclipse/lunar/experimenter
	name = "Lunar Eclipse Experimenter"
	desc = "A lizard cladded in strange red-purple armor, seemingly guarded from lasers and energy based weaponry."
	icon_state = "eclipse_gravliz"
	icon_living = "eclipse_gravliz"
	reload_max = 1
	movement_cooldown = 1

	special_attack_cooldown = 7 SECONDS
	special_attack_min_range = 1
	special_attack_max_range = 7

	projectiletype = /obj/item/projectile/energy/wp_shotgun //using the weapon found upon tyr
	specialattackprojectile = /obj/item/projectile/arc/microsingulo

	loot_list = list(/obj/item/slime_extract/sepia  = 1,
		/obj/item/bone/skull = 100,
		/obj/item/research_sample/bluespace = 15
			)

/mob/living/simple_mob/humanoid/eclipse/lunar/experimenter/do_special_attack(atom/A)
	. = TRUE // So we don't fire a bolt as well.
	switch(a_intent)
		if(I_DISARM)
			visible_message(span_warning("\The [src]'s armor deploys a shoulder mounted turret!"))
			Beam(A, icon_state = "sat_beam", time = 3 SECONDS, maxdistance = INFINITY)
			addtimer(CALLBACK(src, PROC_REF(special_projectile), A), 3.5 SECONDS, TIMER_DELETE_ME)
		else
			visible_message(span_danger("The [src]'s gauntlet glows silver!"))
			if(isliving(A))
				addtimer(CALLBACK(src, PROC_REF(gravity_pull), A), 3 SECOND, TIMER_DELETE_ME)

//The Precursor intative big folks
/mob/living/simple_mob/humanoid/eclipse/lunar/titanhunter //lunar melee unit
	name = "Lunar Eclipse Titan Hunter"
	desc = "A strange being with resistance to brunt force trauma."
	icon_state = "eclipse_titan"
	icon_living = "eclipse_titan"
	melee_damage_lower = 20
	melee_damage_upper = 20
	attack_armor_pen = 20
	projectiletype = null
	ai_holder_type = /datum/ai_holder/simple_mob/intentional/adv_dark_gygax

	loot_list = list(/obj/item/slime_extract/sepia  = 1,
		/obj/item/bone/skull = 100,
		/obj/item/melee/energy/spear = 15
			)

/mob/living/simple_mob/humanoid/eclipse/lunar/titanhunter/apply_melee_effects(atom/A)
	if(isliving(A))
		var/mob/living/L = A
		L.add_modifier(/datum/modifier/deep_wounds, 10 SECONDS)
		if(L.mob_size <= MOB_MEDIUM)
			visible_message(span_danger("\The [src] sends \the [L] flying with the impact!"))
			playsound(src, "punch", 50, 1)
			L.Weaken(1)
			var/throwdir = get_dir(src, L)
			L.throw_at(get_edge_target_turf(L, throwdir), 3, 1, src)
		else
			to_chat(L, span_warning("\The [src] hits you with incredible force, but you remain in place."))
			visible_message(span_danger("\The [src] hits \the [L] with incredible force, to no visible effect!"))
			playsound(src, "punch", 50, 1)

/mob/living/simple_mob/humanoid/eclipse/lunar/abyssdiver
	name = "Lunar Eclipse Abyss Diver"
	desc = "A strange being wearing a blunt resistaint coat."
	projectiletype = /obj/item/projectile/ion/pistol
	icon_state = "eclipse_diver" //note to self try to redo this sprite sometime
	reload_max = 1
	reload_time = 1.5 SECOND

	specialattackprojectile = /obj/item/projectile/energy/mechahack

	loot_list = list(/obj/item/slime_extract/sepia  = 1,
		/obj/item/bone/skull = 100,
		/obj/item/disposable_teleporter = 15
			)

/mob/living/simple_mob/humanoid/eclipse/lunar/abyssdiver/do_special_attack(atom/A)
	visible_message(span_danger("\The [src] begins to mess with a wrist mounted device."))
	if(istype(A, /obj/mecha))
		addtimer(CALLBACK(src, PROC_REF(special_projectile), A), 3 SECONDS, TIMER_DELETE_ME)

/mob/living/simple_mob/humanoid/eclipse/lunar/servicesquish
	name = "Lunar Eclipse Service"
	desc = "A strange being wearing a blunt resistaint coat."
	icon_state = "miner"
	icon_living = "miner"

	loot_list = list(/obj/item/slime_extract/sepia  = 1,
		/obj/item/slime_extract/ruby = 100,
		/obj/item/slime_extract/amber = 15
			)

/mob/living/simple_mob/humanoid/eclipse/lunar/servicesquish/handle_special()
	if(stat != DEAD)
		heal_aura()
	..()

/mob/living/simple_mob/humanoid/eclipse/lunar/servicesquish/proc/heal_aura()
	for(var/mob/living/L in view(src, 4))
		if(L.stat == DEAD || !IIsAlly(L))
			continue
		L.add_modifier(/datum/modifier/technomancer/repel_missiles, 4, src)


/mob/living/simple_mob/mechanical/ward/monitor/eclipse
	faction = FACTION_ECLIPSE
//Spcial attacks

/mob/living/simple_mob/humanoid/eclipse/proc/remote_shutdown(var/mob/living/silicon/robot/L)
	if(!L)
		return
	L.Weaken(10)


/mob/living/simple_mob/humanoid/eclipse/proc/remote_eject(obj/mecha/M)
	if(!M)
		return
	visible_message(span_critical("\The [M] is remotly hacked and ejects [M.occupant]!"))
	M.go_out()


/mob/living/simple_mob/humanoid/eclipse/proc/special_projectile(atom/A)
	if(!A)
		return
	var/obj/item/projectile/P = new specialattackprojectile(get_turf(src))
	P.launch_projectile(A, BP_TORSO, src)

/mob/living/simple_mob/humanoid/eclipse/proc/gravity_pull(mob/living/L)
	if(!L)
		return
	L.throw_at(src, 2, 4) // Just yoinked.

/mob/living/simple_mob/humanoid/eclipse/proc/itemyoink(mob/living/carbon/human/H)
	if(!H)
		return
	var/obj/item/I = H.get_active_hand()
	H.drop_item()
	if(I)
		I.throw_at(src, 2, 4) // Just yoinked.
		src.visible_message(span_danger("The [name] heaves, pulling \the [H]'s weapon from their hands!"))
