/mob/living/simple_mob/humanoid/cultist/magus/rift
	name = "Rift Magus"
	maxHealth = 450 //Boss Mobs should be tanky.
	health = 450

	melee_damage_lower = 30
	melee_damage_upper = 45
	attack_armor_pen = 50
	var/grenade_type = /obj/item/weapon/grenade/spawnergrenade/riftwallers
	var/grenade_timer = 5
	heat_resist = 1
	cold_resist = 1
	movement_cooldown = -1.5
	var/leap_warmup = 2 SECOND
	var/leap_sound = 'sound/weapons/gauss_shoot.ogg'
	var/jaunt_warning = 1.0 SECONDS	// How long the jaunt telegraphing is.
	var/jaunt_tile_speed = 15		// How long to wait between each tile. Higher numbers result in an easier to dodge tunnel attack.
	projectiletype = /obj/item/projectile/energy/plasma/vepr/inversion
	melee_attack_delay = 12 SECOND
	ranged_attack_delay = 1.5 SECONDS
	special_attack_min_range = 1
	special_attack_max_range = 7
	special_attack_cooldown = 7 SECONDS
	icon_state = "void-magnus"
	icon_living = "void-magnus"
	ai_holder_type = /datum/ai_holder/simple_mob/intentional/adv_dark_gygax
	vore_active = 1
	vore_capacity = 6
	vore_bump_chance = 20
	size_multiplier = 1.10
	faction = "demon"
	damage_fatigue_mult = 0.5 // We don't want to give them a flat, huge boost to attack speed, but at the same time, make them fight harder the closer they are to dying.
	injury_enrages = TRUE

	armor_soak = list(
		"melee" = 5,
		"bullet" = 5,
		"laser" = 5,
		"energy" = 5,
		"bomb" = 0,
		"bio" = 0,
		"rad" = 0
		)

	loot_list = list(/obj/item/clothing/head/culthood/void = 100,
			/obj/item/clothing/suit/cultrobes/void = 100,
			/obj/item/clothing/shoes/boots/cult/void = 100,
			/obj/item/clothing/gloves/tactical/void = 100,
			/obj/item/weapon/melee/voidblade = 25,
			/obj/item/device/soulstone = 25,
			/obj/item/device/soulstone = 25,
			/obj/item/device/soulstone = 25,
			/obj/item/capture_crystal/demon = 25,
			/obj/item/capture_crystal/wendigo = 25
			)

/mob/living/simple_mob/humanoid/cultist/magus/rift/apply_melee_effects(var/atom/A)
	if(isliving(A))
		var/mob/living/L = A
		var/leech = rand(1,100)
		if(L.nutrition)
			L.adjust_nutrition(-leech)
			adjust_nutrition(leech)
		if(prob(25))
			L.adjustHalLoss(leech)

/mob/living/simple_mob/humanoid/cultist/magus/rift/do_special_attack(atom/A)
	. = TRUE // So we don't fire a bolt as well.
	switch(a_intent)
		if(I_DISARM) // Side gun
			electric_defense(A)
		if(I_HURT) // Rockets
			launch_rockets(A)
		if(I_GRAB) // Micro-singulo
			launch_microsingularity(A)

/mob/living/simple_mob/humanoid/cultist/magus/rift/proc/launch_microsingularity(atom/target)
	set waitfor = FALSE

	var/obj/item/weapon/grenade/G = new grenade_type(get_turf(src))
	if(istype(G))
		G.throw_at(G.throw_range, G.throw_speed, src)
		G.det_time = grenade_timer	//CHOMPEdit
		G.activate(src)	//CHOMPEdit

	set_AI_busy(FALSE)

/mob/living/simple_mob/humanoid/cultist/magus/rift/proc/electric_defense(atom/target)
	set waitfor = FALSE
	set_AI_busy(TRUE)

	// Save where we're gonna go soon.
	var/turf/destination = get_turf(target)
	var/turf/starting_turf = get_turf(src)

	// Telegraph to give a small window to dodge if really close.
	flick("phase_shift",target)
	icon_state = "bloodin"
	sleep(jaunt_warning) // For the telegraphing.

	// Do the dig!
	visible_message(span("danger","\The [src] vanishes into thin air \the [target]!"))
	flick("phase_shift",target)
	icon_state = "phase_shift"

	if(handle_jaunt(destination) == FALSE)
		set_AI_busy(FALSE)
		flick("phase_shift2",target)
		icon_state = "bloodout"
		return FALSE

	// Did we make it?
	if(!(src in destination))
		set_AI_busy(FALSE)
		icon_state = "bloodout"
		flick("phase_shift2",target)
		return FALSE

	var/overshoot = TRUE

	// Test if something is at destination.
	for(var/mob/living/L in destination)
		if(L == src)
			continue

		visible_message(span("danger","\The [src] appears in a flurry of slashes \the [L]!"))
		playsound(L, 'sound/weapons/heavysmash.ogg', 75, 1)
		L.Weaken(3)
		overshoot = FALSE

	if(!overshoot) // We hit the target, or something, at destination, so we're done.
		set_AI_busy(FALSE)
		icon_state = "bloodout"
		flick("phase_shift2",target)
		return TRUE

	// Otherwise we need to keep going.
	to_chat(src, span("warning", "You overshoot your target!"))
	playsound(src, 'sound/weapons/punchmiss.ogg', 75, 1)
	var/dir_to_go = get_dir(starting_turf, destination)
	for(var/i = 1 to rand(2, 4))
		destination = get_step(destination, dir_to_go)

	if(handle_jaunt(destination) == FALSE)
		set_AI_busy(FALSE)
		icon_state = "bloodout"
		flick("phase_shift2",target)
		return FALSE

	set_AI_busy(FALSE)
	icon_state = "bloodout"
	flick("phase_shift2",target)
	return FALSE



/mob/living/simple_mob/humanoid/cultist/magus/rift/proc/launch_rockets(atom/A)
	set waitfor = FALSE
	set_AI_busy(TRUE)

	// Save where we're gonna go soon.
	var/turf/destination = get_turf(A)
	var/turf/starting_turf = get_turf(src)

	// Telegraph to give a small window to dodge if really close.
	flick("phase_shift",A)
	icon_state = "bloodin"
	sleep(jaunt_warning) // For the telegraphing.

	// Do the dig!
	visible_message(span("danger","\The [src] vanishes into thin air \the [A]!"))
	flick("phase_shift",A)
	icon_state = "bloodin"

	if(handle_jaunt(destination) == FALSE)
		set_AI_busy(FALSE)
		flick("phase_shift2",A)
		icon_state = "bloodout"
		return FALSE

	// Did we make it?
	if(!(src in destination))
		set_AI_busy(FALSE)
		icon_state = "bloodout"
		flick("phase_shift2",A)
		return FALSE

	var/overshoot = TRUE

	// Test if something is at destination.
	for(var/mob/living/L in destination)
		if(L == src)
			continue

		visible_message(span("danger","\The [src] appears in a flurry of slashes \the [L]!"))
		playsound(L, 'sound/weapons/heavysmash.ogg', 75, 1)
		L.Weaken(3)
		overshoot = FALSE

	if(!overshoot) // We hit the target, or something, at destination, so we're done.
		set_AI_busy(FALSE)
		icon_state = "phase_shift2"
		flick("phase_shift2",A)
		return TRUE

	// Otherwise we need to keep going.
	to_chat(src, span("warning", "You overshoot your target!"))
	playsound(src, 'sound/weapons/punchmiss.ogg', 75, 1)
	var/dir_to_go = get_dir(starting_turf, destination)
	for(var/i = 1 to rand(2, 4))
		destination = get_step(destination, dir_to_go)

	if(handle_jaunt(destination) == FALSE)
		set_AI_busy(FALSE)
		icon_state = "bloodout"
		flick("phase_shift2",A)
		return FALSE

	set_AI_busy(FALSE)
	icon_state = "bloodout"
	flick("phase_shift2",A)
	return FALSE

// Does the jaunt movement
/mob/living/simple_mob/humanoid/cultist/magus/rift/proc/handle_jaunt(turf/destination)
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
			to_chat(src, span("critical", "You hit something really solid!"))
			playsound(src, "punch", 75, 1)
			Weaken(5)
			add_modifier(/datum/modifier/tunneler_vulnerable, 10 SECONDS)
			return FALSE // Hit a wall.

		// Get into the tile.
		forceMove(T)


/mob/living/simple_mob/humanoid/cultist/magus/rift/should_special_attack(atom/A)
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


/obj/item/weapon/grenade/spawnergrenade/riftwallers
	name = "manhack delivery grenade"
	spawner_type = /mob/living/simple_mob/vore/demonAI
	deliveryamt = 1
	icon = 'icons/obj/device.dmi'
	icon_state = "implant_melted"
	color = "#f50202"

/obj/item/projectile/energy/plasma/vepr/inversion
	name = "inversion bolt"
	damage = 20
	eyeblur = 0
	armor_penetration = 50
	light_range = 2
	light_power = -2
	light_color = "#FFFFFF"

/mob/living/simple_mob/humanoid/cultist/magus/rift
	vore_active = 1
	vore_capacity = 6
	vore_max_size = RESIZE_HUGE
	vore_min_size = RESIZE_SMALL
	vore_pounce_chance = 0 // Beat them into crit before eating.
	vore_icons = void-magnus-belly

	can_be_drop_prey = FALSE //CHOMP Add

/mob/living/simple_mob/humanoid/cultist/magus/rift/Login()
	. = ..()
	if(!riding_datum)
		riding_datum = new /datum/riding/simple_mob(src)
	verbs |= /mob/living/simple_mob/proc/animal_mount
	verbs |= /mob/living/proc/toggle_rider_reins
	movement_cooldown = 1

/mob/living/simple_mob/humanoid/cultist/magus/rift/MouseDrop_T(mob/living/M, mob/living/user)
	return

/mob/living/simple_mob/humanoid/cultist/magus/rift/init_vore()
	if(!voremob_loaded)
		return
	.=..()
	var/obj/belly/B = vore_selected
	B.name = "stomach"
	B.desc = "The fearsome preadtor gets a firm grip upon you, before dunking you into it's maw, then with a powerful swift gulp you're sent tumbling into it's stomach.."

	B.emote_lists[DM_HOLD] = list(
		"Your surroundings are momentarily filled with tour predator's pleased rumbling, its hands stroking over the taut swell you make in its belly.",
		"Your surrondings glow with a neon red, dashes and spirals of pitch black flowing through the red gummy flesh as if it were a strange sky.",
		"Your satsified predator sways their bloated gullet happily, their warm rumbling vibrarting the stomach, and by extension you.",)

	B.emote_lists[DM_DIGEST] = list(
		"Every clench of the predator's stomach grinds powerful digestive fluids into your body, forcibly churning away your strength!",
		"The caustic red acid splashes, and washes over your frame, your sense of smell being overwhelmed by acid and sulfur as you're turned to nutrion.",
		"Every swift swap of the predator's hips sends you slamming against the glowing red sides, your vision blurring further as you contunie to weaken." ,)


//Boss loot things. Not sure if this is approriate but will be bapped if not.

/obj/item/clothing/head/culthood/void
	name = "void magnus hood"
	color = "#1C1C1C"
	armor = list(melee = 60, bullet = 50, laser = 50, energy = 80, bomb = 30, bio = 10, rad = 10)
	cold_protection = HEAD
	heat_protection = HEAD

/obj/item/clothing/suit/cultrobes/void
	name = "void magnus robes"
	color = "#1C1C1C"
	armor = list(melee = 60, bullet = 50, laser = 50, energy = 80, bomb = 30, bio = 10, rad = 10)
	cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	heat_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS

/obj/item/clothing/shoes/boots/cult/void
	name = "void magnus boots"
	color = "#1C1C1C"
	armor = list(melee = 60, bullet = 50, laser = 50, energy = 80, bomb = 30, bio = 10, rad = 10)
	cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	heat_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS

/obj/item/clothing/gloves/tactical/void
	desc = "These warm red gloves glow warmly, while making the world round them seem darker."
	name = "cult gloves"
	color = "#1C1C1C"
	icon_state = "work"
	item_state = "wgloves"
	force = 10
	punch_force = 8
	armor = list(melee = 30, bullet = 25, laser = 25, energy = 40, bomb = 30, bio = 10, rad = 10)

/obj/item/weapon/melee/voidblade
	name = "cult blade"
	desc = "An arcane weapon wielded by the followers of Nar-Sie."
	icon_state = "cultblade"
	origin_tech = list(TECH_COMBAT = 1, TECH_ARCANE = 2)
	w_class = ITEMSIZE_LARGE
	force = 40
	throwforce = 20
	defend_chance = 25
	projectile_parry_chance = 25
	armor_penetration = 25
	hitsound = 'sound/weapons/bladeslice.ogg'
	drop_sound = 'sound/items/drop/sword.ogg'
	pickup_sound = 'sound/items/pickup/sword.ogg'
	attack_verb = list("attacked", "slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	edge = TRUE
	sharp = TRUE

/obj/item/capture_crystal/demon
	spawn_mob_type = /mob/living/simple_mob/vore/demonAI

/obj/item/capture_crystal/wendigo
	spawn_mob_type = /mob/living/simple_mob/vore/demonAI/wendigo
