/mob/living/simple_mob/mechanical/hivebot/precusor/chrono
	name = "Advanced Precursor Hivebot"
	icon = 'modular_chomp/icons/mob/hivebot.dmi'
	icon_state = "precursorhive"
	icon_living = "precursorhive"
	attacktext = list("prodded")
	maxHealth = 15 LASERS_TO_KILL
	health = 15 LASERS_TO_KILL
	projectiletype = /obj/item/projectile/arc/blue_energy/precusor
	melee_damage_lower = 30
	melee_damage_upper = 50
	special_attack_min_range = 1
	special_attack_max_range = 7
	special_attack_cooldown = 5 SECONDS
	movement_cooldown = 0.5
	color = "#ccff4a"
	projectilesound = 'sound/weapons/wave.ogg'
	ai_holder_type = /datum/ai_holder/simple_mob/intentional/adv_dark_gygax
	var/grenade_type = /obj/item/weapon/grenade/shooter/energy/tesla
	var/grenade_timer = 10
	size_multiplier = 1.75
	shock_resist = 3
	water_resist = 3

	armor = list(melee = 0, bullet = 40, laser = 40, energy = 40, bomb = 40, bio = 100, rad = 100)

	armor_soak = list(
		"melee" = 0,
		"bullet" = 10,
		"laser" = 10,
		"energy" = 10,
		"bomb" = 0,
		"bio" = 0,
		"rad" = 0
		)

	loot_list = list(/obj/item/clothing/suit/armor/alien = 20,
			/obj/item/clothing/suit/armor/alien/tank = 20,
			/obj/item/prop/alien/junk = 20,
			/obj/item/prop/alien/junk = 20,
			/obj/item/prop/alien/junk = 20,
			/obj/item/prop/alien/junk = 20,
			/obj/item/prop/alien/junk = 20,
			/obj/item/weapon/gun/energy/alien = 20,
			/obj/item/weapon/gun/energy/alien = 20,
			/obj/random/tool/alien = 20,
			/obj/random/tool/alien = 20,
			/obj/item/weapon/cell/device/weapon/recharge/alien/omni = 20,
			/obj/item/weapon/cell/device/weapon/recharge/alien/omni = 20
			)

/mob/living/simple_mob/mechanical/hivebot/precusor/chrono/apply_melee_effects(atom/A)
	if(isliving(A))
		var/mob/living/L = A
		L.taunt(src, TRUE)
		L.add_modifier(/datum/modifier/hivebot_weaken, 3 SECONDS)

/mob/living/simple_mob/mechanical/hivebot/precusor/chrono/do_special_attack(atom/A)
	. = TRUE // So we don't fire a bolt as well.
	switch(a_intent)
		if(I_DISARM) // Side gun
			electric_defense(A)
		if(I_HURT) // Rockets
			launch_rockets(A)
		if(I_GRAB) // Micro-singulo
			launch_microsingularity(A)


/mob/living/simple_mob/mechanical/hivebot/precusor/chrono/proc/electric_defense(atom/target)
	set waitfor = FALSE

	var/obj/item/weapon/grenade/G = new grenade_type(get_turf(src))
	if(istype(G))
		G.throw_at(G.throw_range, G.throw_speed, src)
		G.det_time = grenade_timer	//CHOMPEdit
		G.activate(src)	//CHOMPEdit

	set_AI_busy(FALSE)

/mob/living/simple_mob/mechanical/hivebot/precusor/chrono/proc/launch_microsingularity(atom/target)
	set waitfor = FALSE

	// Telegraph our next move.
	Beam(target, icon_state = "sat_beam", time = 3.5 SECONDS, maxdistance = INFINITY)
	visible_message(span("warning", "\The [src] deploys a missile rack!"))
	playsound(src, 'sound/effects/turret/move1.wav', 50, 1)
	sleep(0.5 SECONDS)

	for(var/i = 1 to 4)
		if(target) // Might get deleted in the meantime.
			var/turf/T = get_turf(target)
			if(T)
				visible_message(span("warning", "\The [src] fires a rocket into the air!"))
				playsound(src, 'sound/weapons/rpg.ogg', 70, 1)
				face_atom(T)
				var/obj/item/projectile/arc/explosive_rocket/rocket = new(loc)
				rocket.old_style_target(T, src)
				rocket.fire()
				sleep(1 SECOND)

	visible_message(span("warning", "\The [src] retracts the missile rack."))
	playsound(src, 'sound/effects/turret/move2.wav', 50, 1)


/mob/living/simple_mob/mechanical/hivebot/precusor/chrono/proc/launch_rockets(atom/target)
	var/turf/T = get_turf(target)
	visible_message(span("warning", "\The [src] fires an energetic sphere into the air!"))
	playsound(src, 'sound/weapons/Laser.ogg', 50, 1)
	face_atom(T)
	var/obj/item/projectile/arc/microsingulo/sphere = new(loc)
	sphere.old_style_target(T, src)
	sphere.fire()