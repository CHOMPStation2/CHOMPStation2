/mob/living/simple_mob/humanoid/obsidianscale
	name = "Obsidianscale Miner"
	tt_desc = "E Homo sapiens"
	desc = "It's a kobold coming for shinies."
	icon = 'modular_chomp/icons/mob/obsidianscale.dmi'
	icon_state = "sun"
	icon_living = "sun"
	icon_dead = "statisgem"
	icon_gib = "syndicate_gib"
	taser_kill = 0

	faction = "obisdianscale"
	movement_cooldown = 0

	status_flags = 0

	response_help = "pokes"
	response_disarm = "shoves"
	response_harm = "hits"

	health = 50
	maxHealth = 50
	harm_intent_damage = 5
	melee_damage_lower = 10	//Tac Knife damage
	melee_damage_upper = 10
	attack_sharp = 1	//CHOMPEdit
	attack_edge = 1
	attacktext = list("slashed", "stabbed")
	projectile_dispersion = 0
	armor = list(melee = 20, bullet = 20, laser = 20, energy = 70, bomb = 80, bio = 100, rad = 100)	//Phase weapons aren't supposed to work on humanoid simple mobs but issues so ahhh
	ranged_cooldown = 5

	can_be_drop_prey = FALSE //CHOMP Add

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

	threshold = 0.4 //Lizard tanky

	projectiletype = /obj/item/projectile/bullet/pistol/hp
	ai_holder_type = /datum/ai_holder/simple_mob/merc/ranged

	special_attack_cooldown = 10 SECONDS
	special_attack_min_range = 2
	special_attack_max_range = 7

	needs_reload = TRUE
	reload_max = 6
	reload_time = 4 SECONDS

	loot_list = list(/obj/item/weapon/bone/skull = 100,
			)

/mob/living/simple_mob/humanoid/obsidianscale/melee
	projectiletype = null
	ai_holder_type = /datum/ai_holder/simple_mob/merc
	icon_state = "miner"
	icon_living = "miner"
	var/tunnel_warning = 0.5 SECONDS	// How long the dig telegraphing is.
	var/tunnel_tile_speed = 2

/mob/living/simple_mob/humanoid/obsidianscale/melee/should_special_attack(atom/A)
	// Make sure its possible for the spider to reach the target so it doesn't try to go through a window.
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


/mob/living/simple_mob/humanoid/obsidianscale/melee/do_special_attack(atom/A)
	set waitfor = FALSE
	set_AI_busy(TRUE)

	// Save where we're gonna go soon.
	var/turf/destination = get_turf(A)
	var/turf/starting_turf = get_turf(src)

	// Telegraph to give a small window to dodge if really close.
	do_windup_animation(A, tunnel_warning)
	sleep(tunnel_warning) // For the telegraphing.

	// Do the dig!
	visible_message(span("danger","\The [src] tunnels towards \the [A]!"))
	submerge()

	if(handle_tunnel(destination) == FALSE)
		set_AI_busy(FALSE)
		emerge()
		return FALSE

	// Did we make it?
	if(!(src in destination))
		set_AI_busy(FALSE)
		emerge()
		return FALSE

	var/overshoot = TRUE

	// Test if something is at destination.
	for(var/mob/living/L in destination)
		if(L == src)
			continue

		visible_message(span("danger","\The [src] erupts from underneath, and hits \the [L]!"))
		playsound(src, 'sound/weapons/heavysmash.ogg', 75, 1)
		L.add_modifier(/datum/modifier/entangled, 3 SECONDS) //L.Weaken(3) CHOMPedit: Removal of stuns
		overshoot = FALSE

	if(!overshoot) // We hit the target, or something, at destination, so we're done.
		set_AI_busy(FALSE)
		emerge()
		return TRUE

	// Otherwise we need to keep going.
	to_chat(src, span("warning", "You overshoot your target!"))
	playsound(src, 'sound/weapons/punchmiss.ogg', 75, 1)
	var/dir_to_go = get_dir(starting_turf, destination)
	for(var/i = 1 to rand(2, 4))
		destination = get_step(destination, dir_to_go)

	if(handle_tunnel(destination) == FALSE)
		set_AI_busy(FALSE)
		emerge()
		return FALSE

	set_AI_busy(FALSE)
	emerge()
	return FALSE



// Does the tunnel movement, stuns enemies, etc.
/mob/living/simple_mob/humanoid/obsidianscale/melee/proc/handle_tunnel(turf/destination)
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

		// Stun anyone in our way.
		for(var/mob/living/L in T)
			playsound(src, 'sound/weapons/heavysmash.ogg', 75, 1)
			L.Weaken(2)

		// Get into the tile.
		forceMove(T)

		// Visuals and sound.
		dig_under_floor(get_turf(src))
		playsound(src, 'sound/effects/break_stone.ogg', 75, 1)
		sleep(tunnel_tile_speed)

// For visuals.
/mob/living/simple_mob/humanoid/obsidianscale/melee/proc/submerge()
	alpha = 0
	dig_under_floor(get_turf(src))
	new /obj/effect/temporary_effect/tunneler_hole(get_turf(src))

// Ditto.
/mob/living/simple_mob/humanoid/obsidianscale/melee/proc/emerge()
	alpha = 255
	dig_under_floor(get_turf(src))
	new /obj/effect/temporary_effect/tunneler_hole(get_turf(src))

/mob/living/simple_mob/humanoid/obsidianscale/melee/proc/dig_under_floor(turf/T)
	new /obj/item/weapon/ore/glass(T)

/mob/living/simple_mob/humanoid/obsidianscale/bouncer
	name = "Obsidianscale Bouncer"
	projectiletype = /obj/item/projectile/bullet/shotgun
	icon_state = "bouncer"
	icon_living = "bouncer"
	reload_max = 2
	reload_time = 1 SECONDS

/mob/living/simple_mob/humanoid/obsidianscale/demo
	name = "Obsidianscale Demolitionist"
	projectiletype = /obj/item/projectile/bullet/gyro
	icon_state = "explode"
	icon_living = "expode"
	reload_max = 4
	reload_time = 6 SECONDS
	var/explosion_dev_range		= 0
	var/explosion_heavy_range	= 0
	var/explosion_light_range	= 1
	var/explosion_flash_range	= 1

/mob/living/simple_mob/humanoid/obsidianscale/demo/death()
	visible_message(span("critical", "\The [src]'s armor explodes!"))
	explosion(src.loc, explosion_dev_range, explosion_heavy_range, explosion_light_range, explosion_flash_range)

/mob/living/simple_mob/humanoid/obsidianscale/hacker
	name = "Obsidianscale Technician"
	projectiletype = /obj/item/projectile/ion/small
	icon_state = "ion"
	icon_living = "ion"
	reload_max = 20
	reload_time = 3 SECONDS

/mob/living/simple_mob/humanoid/obsidianscale/hacker/do_special_attack(atom/A)
	var/obj/item/projectile/P = new /obj/item/projectile/arc/emp_blast/weak(get_turf(src))
	P.launch_projectile(A, BP_TORSO, src)

/mob/living/simple_mob/humanoid/obsidianscale/melee/diamond
	icon_state = "miner_dia"
	icon_living = "miner_dia"
	tunnel_warning = 0.1 SECONDS	// How long the dig telegraphing is.
	tunnel_tile_speed = 0.5

/mob/living/simple_mob/humanoid/obsidianscale/melee/green
	icon_state = "miner_rad"
	icon_living = "miner_rad"
	tunnel_warning = 0.1 SECONDS	// How long the dig telegraphing is.
	tunnel_tile_speed = 4

/mob/living/simple_mob/humanoid/obsidianscale/melee/silver
	icon_state = "miner_silver"
	icon_living = "miner_silver"
	tunnel_warning = 3.5 SECONDS	// How long the dig telegraphing is.
	tunnel_tile_speed = 0.1