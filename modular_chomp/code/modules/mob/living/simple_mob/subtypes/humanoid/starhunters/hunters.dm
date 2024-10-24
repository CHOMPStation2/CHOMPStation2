//beg critters
//kitsune is bullet hell esque in a traditonal sense
//naga does a bunch of spawning and CoC
//This are both training for the bigger dude I'll make later
/mob/living/simple_mob/humanoid/starhunter/hunter/druid
	name = "Starhunter Druid"
	health = 200 //20 hits from 20 damage
	maxHealth = 200 //20 hits from 20 damage
	damage_fatigue_mult = 0
	icon_state = "snekdruid"
	icon_living = "snekdruid"

/mob/living/simple_mob/humanoid/starhunter/hunter/druid/do_special_attack(atom/A)
	if(prob(50))
		lightpillar(A)
	else
		fire_lines(A)

/mob/living/simple_mob/humanoid/starhunter/hunter/bullet_act(obj/item/projectile/P)
	if(istype(P, /obj/item/projectile/energy/lightpillar))
		visible_message(span_bolddanger(span_orange("[P] seems ineffective!."))) //immune to their own attack
	else
		..()

/mob/living/simple_mob/humanoid/starhunter/hunter/proc/lightpillar(atom/A)
	var/list/potential_targets = ai_holder.list_targets()
	for(var/atom/entry in potential_targets)
		if(istype(entry, /mob/living/simple_mob/humanoid/starhunter/hunter))
			potential_targets -= entry
	if(potential_targets.len)
		var/iteration = clamp(potential_targets.len, 1, 3)
		for(var/i = 0, i < iteration, i++)
			if(!(potential_targets.len))
				break
			var/mob/target = pick(potential_targets)
			potential_targets -= target
			spawn_lightpillar(target)

/mob/living/simple_mob/humanoid/starhunter/hunter/proc/spawn_lightpillar(atom/target)
	var/list/bomb_range = block(locate(target.x-4, target.y-4, target.z), locate(target.x+4, target.y+4, target.z))
	new /obj/effect/calldown_attack(get_turf(target))
	bomb_range -= get_turf(target)
	for(var/i = 0, i < 4, i++)
		var/turf/T = pick(bomb_range)
		new /mob/living/simple_mob/humanoid/starhunter/hunter/prop(T)
		bomb_range -= T

/mob/living/simple_mob/humanoid/starhunter/hunter/prop //This ain't a mob to spawn, but something apart of other mobs attacks and self deletes
	health = 1000
	maxHealth = 1000
	projectile_dispersion = 0
	projectile_accuracy = 100
	armor = list(melee = 100, bullet = 100, laser = 100, energy = 100, bomb = 100, bio = 100, rad = 100)
	projectiletype = /obj/item/projectile/energy/lightpillar
	ranged_attack_delay = 1.5 SECONDS
	icon_state = "prism"
	icon_living = "prism"

/mob/living/simple_mob/humanoid/starhunter/hunter/prop/ranged_pre_animation(atom/A)
	Beam(get_turf(A), icon_state = "sniper_beam", time = 2 SECONDS, maxdistance = 10)
	. = ..()

/mob/living/simple_mob/humanoid/starhunter/hunter/prop/shoot_target(atom/A)
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
			visible_message(span_danger(span_bold("\The [src]") + " fires at \the [A]!")) //Leave notice of shooting.
			shoot(A) //Perform the shoot action
			if(casingtype) //If the mob is designated to leave casings...
				new casingtype(loc) //... leave the casing.
			ranged_cooldown = world.time + ranged_cooldown_time + ((injury_level / 2) SECONDS) //Special addition here. This is a timer. Keeping updating the time after shooting. Add that ranged cooldown time specified in the mob to the world time.
			qdel(src)
		return TRUE	//End these commands here.
	// CHOMPAddition End

	visible_message(span_danger(span_bold("\The [src]") + " fires at \the [orig_targ]!"))
	shoot(A)
	if(casingtype)
		new casingtype(loc)

	if(ranged_attack_delay)
		ranged_post_animation(A)

	return TRUE

/mob/living/simple_mob/humanoid/starhunter/hunter/proc/fire_lines(atom/A)
	var/list/potential_targets = ai_holder.list_targets()
	for(var/atom/entry in potential_targets)
		if(istype(entry, /mob/living/simple_mob/humanoid/starhunter/hunter))
			potential_targets -= entry
	if(potential_targets.len)
		var/iteration = clamp(potential_targets.len, 1, 3)
		for(var/i = 0, i < iteration, i++)
			if(!(potential_targets.len))
				break
			var/mob/target = pick(potential_targets)
			potential_targets -= target
			spawn_fire(target)

/mob/living/simple_mob/humanoid/starhunter/hunter/proc/spawn_fire(atom/target)
	var/alignment = rand(1,2)	// 1 for vertical, 2 for horizontal
	var/list/line_range = list()
	var/turf/T = get_turf(target)
	line_range += T
	for(var/i = 1, i <= 7, i++)
		switch(alignment)
			if(1)
				if(T.x-i > 0)
					line_range += locate(T.x-i, T.y, T.z)
				if(T.x+i <= world.maxx)
					line_range += locate(T.x+i, T.y, T.z)
			if(2)
				if(T.y-i > 0)
					line_range += locate(T.x, T.y-i, T.z)
				if(T.y+i <= world.maxy)
					line_range += locate(T.x, T.y+i, T.z)
	for(var/turf/dropspot in line_range)
		new /obj/effect/calldown_attack_fire(dropspot)


/obj/effect/calldown_attack_fire
	anchored = TRUE
	density = FALSE
	unacidable = TRUE
	mouse_opacity = 0
	icon = 'icons/effects/effects.dmi'
	icon_state = "drop_marker"

/obj/effect/calldown_attack_fire/Initialize(mapload)
	..()
	return INITIALIZE_HINT_LATELOAD

/obj/effect/calldown_attack_fire/LateInitialize()
	var/delay = rand(25, 30)
	spawn(delay-7)
		new /obj/fire(src.loc)
	spawn(delay)
		qdel(src)


//Kitsune Stuff
/mob/living/simple_mob/humanoid/starhunter/hunter/champion
	name = "Starhunter Starweilder"
	health = 200 //10 hits from 20 damage
	maxHealth = 200
	damage_fatigue_mult = 0
	projectiletype = /obj/item/projectile/energy/ninjastar
	icon_state = "suneswift"
	icon_living = "suneswift"

/mob/living/simple_mob/humanoid/starhunter/hunter/champion/do_special_attack(atom/A)
	if(prob(50))
		bullethell(A)
	else
		rapidfire_windup(A)

/mob/living/simple_mob/humanoid/starhunter/hunter/proc/bullethell(atom/A)
	set waitfor = FALSE

	var/sd = dir2angle(dir)
	var/list/offsets = list(45, 45, 20, 10)

	for(var/i = 0, i<4, i++)
		for(var/j = 0, j <4, j++)
			var/obj/item/projectile/energy/slow_orb/shot = new(get_turf(src))
			shot.firer = src
			shot.fire(sd)
			sd += 90
		sd += pick(offsets)
		sleep(20)

/mob/living/simple_mob/humanoid/starhunter/hunter/proc/rapidfire_windup(atom/A)
	var/list/potential_targets = ai_holder.list_targets()
	for(var/atom/entry in potential_targets)
		if(istype(entry, /mob/living/simple_mob/humanoid/starhunter/hunter))
			potential_targets -= entry
	if(potential_targets.len)
		var/iteration = clamp(potential_targets.len, 1, 3)
		for(var/i = 0, i < iteration, i++)
			if(!(potential_targets.len))
				break
			var/mob/target = pick(potential_targets)
			potential_targets -= target
			rapidfire(target)

/mob/living/simple_mob/humanoid/starhunter/hunter/proc/rapidfire(atom/target)
	var/list/bomb_range = block(locate(target.x-4, target.y-4, target.z), locate(target.x+4, target.y+4, target.z))
	var/obj/item/projectile/P = new /obj/item/projectile/energy/ninjastar(get_turf(src))
	bomb_range -= get_turf(target)
	for(var/i = 0, i < 4, i++)
		var/turf/T = pick(bomb_range)
		P.launch_projectile(target, BP_TORSO, src)
		bomb_range -= T


/obj/item/projectile/energy/lightpillar
	name = "Light Pillar"
	icon = 'modular_chomp/icons/mob/starhunters.dmi' //commiting sin
	icon_state = "lightpillar"
	damage = 30 //DIVINE JUDGMENT
	armor_penetration = 50 //DIVINE JUDGMENT
	light_range = 5
	light_power = 5
	damage_type = BURN
	check_armour = "laser"
	light_color = "#FF6600"
	range = 7
	speed = 13

/obj/item/projectile/energy/ninjastar
	name = "Energy Star"
	icon = 'modular_chomp/icons/mob/starhunters.dmi' //commiting sin
	icon_state = "ninjastar"
	damage = 15
	armor_penetration = 25 //Gets into the gaps
	damage_type = BURN
	check_armour = "laser"
