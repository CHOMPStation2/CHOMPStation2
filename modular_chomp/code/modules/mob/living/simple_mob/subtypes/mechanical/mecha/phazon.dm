/mob/living/simple_mob/mechanical/mecha/combat/phazon
	projectiletype = /obj/item/projectile/bullet/magnetic/fuelrod


/mob/living/simple_mob/mechanical/mecha/combat/phazon/advanced
	name = "Advanced phazon"
	movement_cooldown = 1
	wreckage = /obj/structure/loot_pile/mecha/phazon
	color = "#ffffff"

	health = 500 //Old 250
	maxHealth = 500
	evasion = 10

	special_attack_min_range = 1
	special_attack_max_range = 9
	special_attack_cooldown = 30 SECONDS
	ai_holder_type = /datum/ai_holder/simple_mob/intentional/adv_dark_gygax
	size_multiplier = 1.25
	shock_resist = 0.5
	ranged_attack_delay = 1 SECONDS
	projectilesound = 'sound/weapons/gauss_shoot.ogg'
	damage_fatigue_mult = 0

	projectiletype = /obj/item/projectile/bullet/rifle/a545/ap

/mob/living/simple_mob/mechanical/mecha/combat/phazon/advanced/do_special_attack(atom/A)
	. = TRUE // So we don't fire a bolt as well.
	switch(a_intent)
		if(I_DISARM) // Side gun
			electric_defense(A)
		if(I_HURT) // Rockets
			launch_rockets(A)
		if(I_GRAB) // Micro-singulo
			launch_microsingularity(A)

/mob/living/simple_mob/mechanical/mecha/combat/phazon/advanced/proc/electric_defense(atom/target)
	set waitfor = FALSE

	// Telegraph our next move.
	Beam(target, icon_state = "sat_beam", time = 3.5 SECONDS, maxdistance = INFINITY)
	visible_message(span_warning("\The [src] deploys a red missile rack!"))
	playsound(src, 'sound/effects/turret/move1.wav', 50, 1)
	sleep(0.5 SECONDS)

	for(var/i = 1 to 2)
		if(target) // Might get deleted in the meantime.
			var/turf/T = get_turf(target)
			if(T)
				visible_message(span_warning("\The [src] fires a rocket into the air!"))
				playsound(src, 'sound/weapons/rpg.ogg', 70, 1)
				face_atom(T)
				var/obj/item/projectile/arc/explosive_rocket/big/rocket = new(loc)
				rocket.old_style_target(T, src)
				rocket.fire()
				sleep(1 SECOND)

	visible_message(span_warning("\The [src] retracts the red missile rack."))
	playsound(src, 'sound/effects/turret/move2.wav', 50, 1)

/obj/item/projectile/arc/explosive_rocket/big
	name = "rocket"
	icon_state = "mortar"
	color = "#FF0000"

/obj/item/projectile/arc/explosive_rocket/big/on_impact(turf/T)
	new /obj/effect/explosion(T) // Weak explosions don't produce this on their own, apparently.
	explosion(T, 1, 1, 1, adminlog = FALSE)

/mob/living/simple_mob/mechanical/mecha/combat/phazon/advanced/proc/launch_rockets(atom/target)
	set waitfor = FALSE

	// Telegraph our next move.
	Beam(target, icon_state = "sat_beam", time = 3.5 SECONDS, maxdistance = INFINITY)
	visible_message(span_warning("\The [src] deploys a blue missile rack!"))
	playsound(src, 'sound/effects/turret/move1.wav', 50, 1)
	sleep(0.5 SECONDS)

	for(var/i = 1 to 2)
		if(target) // Might get deleted in the meantime.
			var/turf/T = get_turf(target)
			if(T)
				visible_message(span_warning("\The [src] fires a rocket into the air!"))
				playsound(src, 'sound/weapons/rpg.ogg', 70, 1)
				face_atom(T)
				var/obj/item/projectile/arc/explosive_rocket/rocket = new(loc)
				rocket.old_style_target(T, src)
				rocket.fire()
				sleep(1 SECOND)

	visible_message(span_warning("\The [src] retracts the blue missile rack."))
	playsound(src, 'sound/effects/turret/move2.wav', 50, 1)

/obj/item/projectile/arc/explosive_rocket/blue
	name = "rocket"
	icon_state = "mortar"
	color = "#000066"

/obj/item/projectile/arc/explosive_rocket/blue/on_impact(turf/T)
	new /obj/effect/explosion(T) // Weak explosions don't produce this on their own, apparently.
	empulse(T, 1, 2, 3, 4)

/mob/living/simple_mob/mechanical/mecha/combat/phazon/advanced/proc/launch_microsingularity(atom/target)
	set waitfor = FALSE

	// Telegraph our next move.
	Beam(target, icon_state = "sat_beam", time = 3.5 SECONDS, maxdistance = INFINITY)
	visible_message(span_warning("\The [src] deploys a yellow missile rack!"))
	playsound(src, 'sound/effects/turret/move1.wav', 50, 1)
	sleep(0.5 SECONDS)

	for(var/i = 1 to 2)
		if(target) // Might get deleted in the meantime.
			var/turf/T = get_turf(target)
			if(T)
				visible_message(span_warning("\The [src] fires a rocket into the air!"))
				playsound(src, 'sound/weapons/rpg.ogg', 70, 1)
				face_atom(T)
				var/obj/item/projectile/arc/explosive_rocket/spread/rocket = new(loc)
				rocket.old_style_target(T, src)
				rocket.fire()
				sleep(1 SECOND)

	visible_message(span_warning("\The [src] retracts the yellow missile rack."))
	playsound(src, 'sound/effects/turret/move2.wav', 50, 1)

/obj/item/projectile/arc/explosive_rocket/spread
	name = "rocket"
	icon_state = "mortar"
	color = "#FFFF00"

/obj/item/projectile/arc/explosive_rocket/spread/on_impact(turf/T)
	new /obj/effect/explosion(T) // Weak explosions don't produce this on their own, apparently.
	explosion(T, 0, 0, 2, adminlog = FALSE)
