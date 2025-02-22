////////////////////////////
//		Construct AI
////////////////////////////

/mob/living/simple_mob/construct
	icon = 'modular_chomp/icons/mob/animal_ch.dmi'
	ai_holder_type = /datum/ai_holder/simple_mob/melee

/mob/living/simple_mob/construct/artificer
	ai_holder_type = /datum/ai_holder/mimic

/mob/living/simple_mob/construct/harvester
	ai_holder_type = /datum/ai_holder/simple_mob/melee/evasive
	attack_edge = 1

/mob/living/simple_mob/construct/juggernaut
	ai_holder_type = /datum/ai_holder/simple_mob/destructive

////////////////////////////
//		Wraith special attack stuff
////////////////////////////


/mob/living/simple_mob/construct/wraith
	ai_holder_type = /datum/ai_holder/simple_mob/melee/evasive
	var/jaunt_warning = 0.5 SECONDS	// How long the jaunt telegraphing is.
	var/jaunt_tile_speed = 20		// How long to wait between each tile. Higher numbers result in an easier to dodge tunnel attack.
	special_attack_min_range = 2
	special_attack_max_range = 6
	special_attack_cooldown = 10 SECONDS

/mob/living/simple_mob/construct/wraith/jaunt_spam
	special_attack_cooldown = 5 SECONDS

/mob/living/simple_mob/construct/wraith/fast_jaunt //Teleports behind you
	jaunt_tile_speed = 2

/mob/living/simple_mob/construct/wraith/do_special_attack(atom/A)
	set waitfor = FALSE
	set_AI_busy(TRUE)

	// Save where we're gonna go soon.
	var/turf/destination = get_turf(A)
	var/turf/starting_turf = get_turf(src)

	// Telegraph to give a small window to dodge if really close.
	flick("phase_shift",A)
	icon_state = "phase_shift"
	sleep(jaunt_warning) // For the telegraphing.

	// Do the dig!
	visible_message(span_danger("\The [src] vanishes into thin air \the [A]!"))
	flick("phase_shift",A)
	icon_state = "phase_shift"

	if(handle_jaunt(destination) == FALSE)
		set_AI_busy(FALSE)
		flick("phase_shift2",A)
		icon_state = "phase_shift2"
		return FALSE

	// Did we make it?
	if(!(src in destination))
		set_AI_busy(FALSE)
		icon_state = "phase_shift2"
		flick("phase_shift2",A)
		return FALSE

	var/overshoot = TRUE

	// Test if something is at destination.
	for(var/mob/living/L in destination)
		if(L == src)
			continue

		visible_message(span_danger("\The [src] appears in a flurry of slashes \the [L]!"))
		playsound(L, 'sound/weapons/heavysmash.ogg', 75, 1)
		L.add_modifier(/datum/modifier/entangled, 1 SECONDS) //L.Weaken(3) CHOMPedit: Trying to remove hardstuns
		overshoot = FALSE

	if(!overshoot) // We hit the target, or something, at destination, so we're done.
		set_AI_busy(FALSE)
		icon_state = "phase_shift2"
		flick("phase_shift2",A)
		return TRUE

	// Otherwise we need to keep going.
	to_chat(src, span_warning("You overshoot your target!"))
	playsound(src, 'sound/weapons/punchmiss.ogg', 75, 1)
	var/dir_to_go = get_dir(starting_turf, destination)
	for(var/i = 1 to rand(2, 4))
		destination = get_step(destination, dir_to_go)

	if(handle_jaunt(destination) == FALSE)
		set_AI_busy(FALSE)
		icon_state = "phase_shift2"
		flick("phase_shift2",A)
		return FALSE

	set_AI_busy(FALSE)
	icon_state = "phase_shift2"
	flick("phase_shift2",A)
	return FALSE

// Does the jaunt movement
/mob/living/simple_mob/construct/wraith/proc/handle_jaunt(turf/destination)
	var/turf/T = get_turf(src) // Hold our current tile.

	// Regular tunnel loop.
	for(var/i = 1 to get_dist(src, destination))
		if(stat)
			return FALSE // We died or got knocked out on the way.
		if(loc == destination)
			break // We somehow got there early.

		// Update T.
		T = get_step(src, get_dir(src, destination))
		if(T.check_density(ignore_mobs = TRUE))
			to_chat(src, span_critical("You hit something really solid!"))
			playsound(src, "punch", 75, 1)
			Weaken(5)
			add_modifier(/datum/modifier/tunneler_vulnerable, 10 SECONDS)
			return FALSE // Hit a wall.

		// Get into the tile.
		forceMove(T)


/mob/living/simple_mob/construct/wraith/should_special_attack(atom/A)
	// Make sure its possible for the wraith to reach the target so it doesn't try to go through a window.
	var/turf/destination = get_turf(A)
	var/turf/starting_turf = get_turf(src)
	var/turf/T = starting_turf
	for(var/i = 1 to get_dist(starting_turf, destination))
		if(T == destination)
			break

		T = get_step(T, get_dir(T, destination))
		if(T.check_density(ignore_mobs = TRUE))
			return FALSE
	return T == destination


////////////////////////////
//		Ranged Artificer
////////////////////////////

/mob/living/simple_mob/construct/artificer/caster
	name = "Artificer"
	real_name = "Artificer"
	construct_type = "artificer"
	desc = "A bulbous construct dedicated to building and maintaining temples to their otherworldly lords. Its central eye glows with unknowable power."
	icon_state = "caster_artificer"
	icon_living = "caster_artificer"
	ai_holder_type = /datum/ai_holder/simple_mob/ranged/kiting
	projectiletype = /obj/item/projectile/beam/inversion
	projectilesound = 'sound/weapons/spiderlunge.ogg'

////////////////////////////
//		Greater Harvester
////////////////////////////

/mob/living/simple_mob/construct/harvester/greater
	name = "Greater Harvester"
	real_name = "Chosen"
	construct_type = "Chosen"
	desc = "A infanthomable mass of tentacles and claws ripping and tearing through all that oppose it."
	icon_state = "chosen"
	icon_living = "chosen"
	maxHealth = 100
	health = 100
	melee_damage_lower = 40 //Glass Cannon Mini-Boss/Semi-Boss large. Few hits is enough to end you.
	melee_damage_upper = 50
	attack_armor_pen = 60 //No Armor Shall Save you
	attack_sharp = 1
	attack_edge = 1
	attacktext = list("violently stabbed")
	friendly = list("caresses")
	movement_cooldown = 0

	ai_holder_type = /datum/ai_holder/simple_mob/melee/evasive

	//	environment_smash = 1	// Whatever this gets renamed to, Harvesters need to break things

	attack_sound = 'sound/weapons/pierce.ogg'

////////////////////////////
//		Artificer
////////////////////////////

/mob/living/simple_mob/construct/proteon //Weak Swarm Attacker can be safely dumped on players in large numbers without too many injuries
	name = "Proteon"
	real_name = "proton"
	construct_type = "artificer"
	desc = "A weak but speedy construction designed to assist other constructs rather than fight. Still seems bloodthirtsy though."
	icon_state = "proteon"
	icon_living = "proteon"
	maxHealth = 50
	health = 50
	response_harm = "viciously beaten"
	harm_intent_damage = 5
	melee_damage_lower = 8 //It's not the strongest of the bunch, but that doesn't mean it can't hurt you.
	melee_damage_upper = 10
	attack_armor_pen = 50 // Does so little damage already, that this can be justified.
	attacktext = list("rammed")
	attack_sound = 'sound/weapons/rapidslice.ogg'
	movement_cooldown = 0

	ai_holder_type = /datum/ai_holder/simple_mob/melee/evasive
