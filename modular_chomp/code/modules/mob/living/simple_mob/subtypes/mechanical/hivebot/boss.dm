/mob/living/simple_mob/mechanical/hivebot/precusor/chrono
	name = "Advanced Precursor Hivebot"
	icon = 'modular_chomp/icons/mob/hivebot.dmi'
	icon_state = "precursorhive"
	icon_living = "precursorhive"
	attacktext = list("prodded")
	maxHealth = 15 LASERS_TO_KILL
	health = 15 LASERS_TO_KILL
	projectiletype = /obj/item/projectile/arc/blue_energy/precusor
	melee_damage_lower = 30 //old 15
	melee_damage_upper = 50 //old 30
	special_attack_min_range = 1
	special_attack_max_range = 7
	special_attack_cooldown = 5 SECONDS
	movement_cooldown = 0.5
	color = "#ccff4a"
	projectilesound = 'sound/weapons/wave.ogg'
	ai_holder_type = /datum/ai_holder/simple_mob/intentional/adv_dark_gygax
	var/grenade_type = /obj/item/grenade/shooter/energy/tesla
	var/grenade_timer = 10
	var/grenade_type2 = /obj/item/grenade/shooter/rubber
	size_multiplier = 1.75
	shock_resist = 3
	water_resist = 3
	attack_armor_pen = -50

	armor = list(melee = -150, bullet = 40, laser = 40, energy = 40, bomb = 40, bio = 100, rad = 100)

	armor_soak = list(
		"melee" = 0,
		"bullet" = 10,
		"laser" = 10,
		"energy" = 10,
		"bomb" = 0,
		"bio" = 0,
		"rad" = 0
		)

	loot_list = list(/obj/item/clothing/suit/armor/alien = 30,
			/obj/item/clothing/suit/armor/alien/tank = 30,
			/obj/item/prop/alien/junk = 50,
			/obj/item/prop/alien/junk = 50,
			/obj/item/prop/alien/junk = 50,
			/obj/item/prop/alien/junk = 50,
			/obj/item/prop/alien/junk = 50,
			/obj/item/gun/energy/alien = 30,
			/obj/item/gun/energy/alien = 30,
			/obj/random/tool/alien = 30,
			/obj/random/tool/alien = 30,
			/obj/item/cell/device/weapon/recharge/alien = 30,
			/obj/item/cell/device/weapon/recharge/alien = 30
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


/mob/living/simple_mob/mechanical/hivebot/precusor/chrono/proc/launch_microsingularity(atom/target)
	set waitfor = FALSE
	visible_message(span("warning", "\The [src] drops a ticking time bomb!"))

	var/obj/item/grenade/G = new grenade_type(get_turf(src))
	if(istype(G))
		G.throw_at(G.throw_range, G.throw_speed, src)
		G.det_time = grenade_timer	//CHOMPEdit
		G.activate(src)	//CHOMPEdit

	set_AI_busy(FALSE)

/mob/living/simple_mob/mechanical/hivebot/precusor/chrono/proc/launch_rockets(atom/target)
	set waitfor = FALSE
	visible_message(span("warning", "\The [src] creates weak looking hivebots!"))

	var/obj/item/grenade/G = new grenade_type2(get_turf(src))
	if(istype(G))
		G.throw_at(G.throw_range, G.throw_speed, src)
		G.det_time = grenade_timer
		G.activate(src)

	set_AI_busy(FALSE)


/mob/living/simple_mob/mechanical/hivebot/precusor/chrono/proc/electric_defense(atom/target)
	var/turf/T = get_turf(target)
	visible_message(span("warning", "\The [src] fires an energetic sphere into the air!"))
	playsound(src, 'sound/weapons/Laser.ogg', 50, 1)
	face_atom(T)
	var/obj/item/projectile/arc/microsingulo/sphere = new(loc)
	sphere.old_style_target(T, src)
	sphere.fire()

//Screw it scuffed way
/obj/item/grenade/spawnboss
	desc = "It is set to detonate in 5 seconds. It will unleash an unspecified anomaly into the vicinity."
	name = "delivery grenade"
	icon = 'icons/obj/grenade.dmi'
	icon_state = "delivery"
	item_state = "flashbang"
	origin_tech = list(TECH_MATERIAL = 3, TECH_MAGNET = 4)
	var/banglet = 0
	var/spawner_type = null // must be an object path
	var/deliveryamt = 1 // amount of type to deliver

/obj/item/grenade/spawnergrenade/detonate()

	if(spawner_type && deliveryamt)
		// Make a quick flash
		var/turf/T = get_turf(src)
		playsound(src, 'sound/effects/phasein.ogg', 100, 1)
		for(var/i=1, i<=deliveryamt, i++)
			var/atom/movable/x = new spawner_type(T)
			if(prob(50))
				for(var/j = 1, j <= rand(1, 3), j++)
					step(x, pick(NORTH,SOUTH,EAST,WEST))
	qdel(src)
	return

/obj/item/grenade/spawnboss/hivebot
	spawner_type = /mob/living/simple_mob/mechanical/hivebot/swarm
	deliveryamt = 3
