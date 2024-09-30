/mob/living/simple_mob/mechanical/mecha/vistor/vistorblue/shielded
	name = "vistor blue"
	icon = 'icons/mob/animal_vg.dmi'
	icon_state = "drone3"
	icon_living = "drone3"
	maxHealth = 50 //Old 25
	health = 50
	movement_cooldown = 0
	unsuitable_atoms_damage = 0
	projectiletype = /obj/item/projectile/energy/homing_bolt
	melee_attack_delay = 4 SECOND

	melee_damage_lower = 25
	melee_damage_upper = 25
	ai_holder_type = /datum/ai_holder/simple_mob/ranged/kiting

	wreckage = null
	pilot_type = /mob/living/simple_mob/mechanical/mecha/vistor/vistorblue

/mob/living/simple_mob/mechanical/mecha/vistor/vistorblue/shielded/bullet_act(var/obj/item/projectile/P)
	var/reflectchance = 100
	if(prob(reflectchance))
		var/damage_mod = rand(2,4)
		var/projectile_dam_type = P.damage_type
		var/incoming_damage = (round(P.damage / damage_mod) - (round((P.damage / damage_mod) * 0.3)))
		var/armorcheck = run_armor_check(null, P.check_armour)
		var/soakedcheck = get_armor_soak(null, P.check_armour)
		if(!(istype(P, /obj/item/projectile/energy) || istype(P, /obj/item/projectile/beam)))
			visible_message("<span class='danger'>The [P.name] bounces off of [src]'s shield!</span>", \
						"<span class='userdanger'>The [P.name] bounces off of [src]'s shield!</span>")
			new /obj/item/material/shard/shrapnel(src.loc)
			if(!(P.damage_type == BRUTE || P.damage_type == BURN))
				projectile_dam_type = BRUTE
				incoming_damage = round(incoming_damage / 4) //Damage from strange sources is converted to brute for physical projectiles, though severely decreased.
			apply_damage(incoming_damage, projectile_dam_type, null, armorcheck, soakedcheck, is_sharp(P), has_edge(P), P)
			return -1 //Doesn't reflect non-beams or non-energy projectiles. They just smack and drop with little to no effect.
		else
			visible_message("<span class='danger'>The [P.name] gets reflected by [src]'s shield!</span>", \
						"<span class='userdanger'>The [P.name] gets reflected by [src]'s shield!</span>")
			damage_mod = rand(3,5)
			incoming_damage = (round(P.damage / damage_mod) - (round((P.damage / damage_mod) * 0.3)))
			if(!(P.damage_type == BRUTE || P.damage_type == BURN))
				projectile_dam_type = BURN
				incoming_damage = round(incoming_damage / 4) //Damage from strange sources is converted to burn for energy-type projectiles, though severely decreased.
			apply_damage(incoming_damage, P.damage_type, null, armorcheck, soakedcheck, is_sharp(P), has_edge(P), P)

		// Find a turf near or on the original location to bounce to
		if(P.starting)
			var/new_x = P.starting.x + pick(0, 0, -1, 1, -2, 2, -2, 2, -2, 2, -3, 3, -3, 3)
			var/new_y = P.starting.y + pick(0, 0, -1, 1, -2, 2, -2, 2, -2, 2, -3, 3, -3, 3)
			var/turf/curloc = get_turf(src)

			// redirect the projectile
			P.redirect(new_x, new_y, curloc, src)
			P.reflected = 1

		return -1 // complete projectile permutation

	return (..(P))

/mob/living/simple_mob/mechanical/mecha/vistor/vistorblue
	name = "vistor blue"
	icon = 'icons/mob/animal_vg.dmi'
	icon_state = "drone0"
	icon_living = "drone0"

	mob_class = MOB_CLASS_ABERRATION

	faction = "vistor"

	maxHealth = 150 //Old 75
	health = 150
	movement_cooldown = 0
	unsuitable_atoms_damage = 0
	projectiletype = /obj/item/projectile/energy/homing_bolt
	melee_attack_delay = 4 SECOND

	melee_damage_lower = 25 //Old 12
	melee_damage_upper = 25
	ai_holder_type = /datum/ai_holder/simple_mob/intentional/adv_dark_gygax

	armor = list(
				"melee"		= 20,
				"bullet"	= 20,
				"laser"		= 20,
				"energy"	= 10,
				"bomb"		= 10,
				"bio"		= 100,
				"rad"		= 100
				)

	wreckage = null
	pilot_type = null

	var/grenade_type = /obj/item/grenade/shooter/energy/homing
	var/grenade_timer = 50	//CHOMPEdit
	special_attack_cooldown = 45 SECONDS
	special_attack_min_range = 2
	special_attack_max_range = 7

	loot_list = list(/obj/item/clothing/suit/armor/protectionbubble = 100
			)

/mob/living/simple_mob/mechanical/mecha/vistor/vistorblue/should_special_attack(atom/A)
	var/mob_count = 0				// Are there enough mobs to consider grenading?
	var/turf/T = get_turf(A)
	for(var/mob/M in range(T, 2))
		if(M.faction == faction) 	// Don't grenade our friends
			return FALSE
		if(M in oview(src, special_attack_max_range))	// And lets check if we can actually see at least two people before we throw a grenade
			if(!M.stat)			// Dead things don't warrant a grenade
				mob_count ++
	if(mob_count < 2)
		return FALSE
	else
		return TRUE

// Yes? Throw the grenade
/mob/living/simple_mob/mechanical/mecha/vistor/vistorblue/do_special_attack(atom/A)
	set waitfor = FALSE
	set_AI_busy(TRUE)

	var/obj/item/grenade/G = new grenade_type(get_turf(src))
	if(istype(G))
		G.throw_at(A, G.throw_range, G.throw_speed, src)
		G.det_time = grenade_timer	//CHOMPEdit
		G.activate(src)	//CHOMPEdit
		special_attack_charges = max(special_attack_charges-1, 0)

	set_AI_busy(FALSE)

/obj/item/grenade/shooter/energy/homing //This is a horrid idea
	name = "homing grenade"
	desc = "A horrifically dangerous rave in a can."
	projectile_types = list(/obj/item/projectile/energy/homing_bolt)

/mob/living/simple_mob/mechanical/mecha/vistor/vistorgreen
	name = "vistor green"
	icon = 'icons/mob/animal_vg.dmi'
	icon_state = "mushroom"
	icon_living = "mushroom"
	maxHealth = 200 //Old 100
	health = 200
	movement_cooldown = 0
	unsuitable_atoms_damage = 0
	projectiletype = /obj/item/projectile/arc/spore
	melee_attack_delay = 4 SECOND

	wreckage = null
	pilot_type = null

	melee_damage_lower = 25
	melee_damage_upper = 25
	ai_holder_type = /datum/ai_holder/hostile/ranged/robust

	special_attack_cooldown = 2 SECONDS
	special_attack_min_range = 2
	special_attack_max_range = 7

	loot_list = list(/obj/item/clothing/suit/armor/reactive/vistor = 100
			)

/mob/living/simple_mob/mechanical/mecha/vistor/vistorgreen/do_special_attack(atom/A)
	var/obj/item/projectile/P = new /obj/item/projectile/arc/spore(get_turf(src))
	P.launch_projectile(A, BP_TORSO, src)


/mob/living/simple_mob/mechanical/mecha/vistor/vistorpurple
	name = "vistor purple"
	icon = 'icons/mob/animal_vg.dmi'
	icon_state = "scarybat"
	icon_living = "scarybat"
	maxHealth = 200 //Old 100
	health = 200
	movement_cooldown = 0
	unsuitable_atoms_damage = 0
	projectiletype = null
	melee_attack_delay = 4 SECOND

	wreckage = null
	pilot_type = null

	melee_damage_lower = 25
	melee_damage_upper = 25
	alpha = 15

	loot_list = list(/obj/item/clothing/suit/armor/tesla/vistor = 100
			)

/mob/living/simple_mob/mechanical/mecha/vistor/vistoryellow //Combat refactor walkback: This one seems fine
	name = "vistor yellow"
	icon = 'icons/mob/animal.dmi'
	icon_state = "chick"
	icon_living = "chick"
	maxHealth = 25
	health = 25
	movement_cooldown = 0
	unsuitable_atoms_damage = 0
	projectiletype = null
	melee_attack_delay = 6 SECOND

	wreckage = null
	pilot_type = null

	attack_armor_pen = 25
	melee_damage_lower = 5
	melee_damage_upper = 20
	ai_holder_type = /datum/ai_holder/simple_mob/ranged/kiting
	mob_size = MOB_MINISCULE
	density = 0

/mob/living/simple_mob/mechanical/mecha/vistor/vistororange
	name = "vistor orange?"
	icon = 'icons/mecha/mecha.dmi'
	icon_state = "honker"
	icon_living = "honker"
	maxHealth = 300 //Old 150
	health = 300
	movement_cooldown = 0
	unsuitable_atoms_damage = 0
	projectiletype = /obj/item/projectile/energy/gaussrifle
	melee_attack_delay = 4 SECOND

	var/obj/item/shield_projector/shields = null

	armor = list(
				"melee"		= 30,
				"bullet"	= 30,
				"laser"		= 30,
				"energy"	= 30,
				"bomb"		= 30,
				"bio"		= 100,
				"rad"		= 100
				)

	wreckage = null
	pilot_type = null

	melee_damage_lower = 25
	melee_damage_upper = 25
	ai_holder_type = /datum/ai_holder/simple_mob/ranged/kiting

	ranged_attack_delay = 3 SECONDS
	loot_list = list(/obj/item/clothing/suit/armor/alien/vistor = 100
			)

/mob/living/simple_mob/mechanical/mecha/vistor/vistororange/Initialize(mapload)
	shields = new /obj/item/shield_projector/rectangle/automatic/orange(src)
	return ..()

/obj/item/shield_projector/rectangle/automatic/orange
	shield_health = 10
	max_shield_health = 10
	shield_regen_delay = 3 SECONDS
	shield_regen_amount = 10
	size_x = 2
	size_y = 2
	color = "#FF6633"
	high_color = "#FF6633"
	low_color = "#FF6633"

//obj/item/clothing/suit/armor/alien/vistor
//obj/item/clothing/suit/armor/tesla/vistor
//obj/item/clothing/suit/armor/reactive/vistor
//obj/item/clothing/suit/armor/protectionbubble

/mob/living/simple_mob/mechanical/mecha/forgotten
	name = "Forgotten"
	icon = 'icons/mecha/mecha.dmi'
	icon_state = "mime"
	icon_living = "mime"
	maxHealth = 300 //Old 150
	health = 300
	movement_cooldown = 0
	damage_fatigue_mult = 0
	alpha = 175

	armor = list(
				"melee"		= 30,
				"bullet"	= 30,
				"laser"		= 30,
				"energy"	= 30,
				"bomb"		= 30,
				"bio"		= 100,
				"rad"		= 100
				)

	wreckage = /obj/structure/loot_pile/mecha/phazon/forgotten
	pilot_type = null

	ai_holder_type = /datum/ai_holder/simple_mob/ranged/kiting/artillery

	melee_attack_delay = 3 SECOND

	melee_damage_lower = 35
	melee_damage_upper = 35

	projectiletype = /obj/item/projectile/arc/fragmentation/mortar/forgotten

	projectile_dispersion = 30
	projectile_accuracy = -100

/obj/item/projectile/arc/fragmentation/mortar/forgotten
	icon_state = "mortar"
	fragment_amount = 4
	spread_range = 5

/mob/living/simple_mob/mechanical/mecha/vistor/death()
	..()
	new /obj/effect/decal/cleanable/blood/gibs/robot(src.loc)
	var/datum/effect/effect/system/spark_spread/s = new /datum/effect/effect/system/spark_spread
	s.set_up(3, 1, src)
	s.start()
	qdel(src)

/obj/structure/loot_pile/mecha/phazon/forgotten
	name = "forgotten wreckage"
	desc = "The ruins of some unfortunate forgoten mecha type. Perhaps something is salvageable."
	icon_state = "mime-broken"

/datum/ai_holder/simple_mob/ranged/kiting/artillery
	mauling = TRUE
	run_if_this_close = 2
	min_distance_to_destination = 3
	can_flee = TRUE
	base_wander_delay = 4
