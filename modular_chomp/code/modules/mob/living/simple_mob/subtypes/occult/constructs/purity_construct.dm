////////////////////////////
//	Purity Construct - Laity
////////////////////////////

/mob/living/simple_mob/construct/laity //Weak Swarm Attacker can be safely dumped on players in large numbers without too many injuries
	name = "Laity"
	real_name = "Laity"
	construct_type = "Laity"
	faction = "purity"
	desc = "A small construct of the purity worshippers mechanical followers, not hardy or particularly strong, very numerous."
	icon_state = "laity"
	icon_living = "laity"
	ui_icons = 'modular_chomp/icons/mob/screen1_purity.dmi'
	maxHealth = 75
	health = 75
	response_harm = "viciously beaten"
	harm_intent_damage = 5
	melee_damage_lower = 4 //It's not the strongest of the bunch, but that doesn't mean it can't hurt you.
	melee_damage_upper = 8
	attack_armor_pen = 50 // Does so little damage already, that this can be justified.
	attacktext = list("rammed")
	attack_sound = 'sound/weapons/rapidslice.ogg'
	movement_cooldown = 0

	ai_holder_type = /datum/ai_holder/simple_mob/retaliate/cooperative

////////////////////////////
//	Purity Construct - Deacon
////////////////////////////

/mob/living/simple_mob/construct/deacon
	name = "Deacon"
	real_name = "Deacon"
	construct_type = "Deacon"
	faction = "purity"
	desc = "A small construct of the purity worshippers mechanical followers, hardy but mostly harmless."
	icon_state = "deacon"
	icon_living = "deacon"
	ui_icons = 'modular_chomp/icons/mob/screen1_purity.dmi'
	maxHealth = 150
	health = 150
	melee_damage_lower = 8 //not meant for combat but can hold its own in a pinch
	melee_damage_upper = 12
	attack_armor_pen = 60 //used to carve stone and other metals, cuts through armor just as well
	attack_sharp = 1
	attack_edge = 1
	attacktext = list("violently stabbed")
	friendly = list("caresses")
	organ_names = /decl/mob_organ_names/harvester
	movement_cooldown = -1

	ai_holder_type = /datum/ai_holder/simple_mob/retaliate/cooperative

	//	environment_smash = 1	// Whatever this gets renamed to, Harvesters need to break things

	attack_sound = 'sound/weapons/pierce.ogg'

	armor = list(
				"melee" = 20,
				"bullet" = 10,
				"laser" = 10,
				"energy" = 10,
				"bomb" = 10,
				"bio" = 100,
				"rad" = 100)

	construct_spells = list(
			/spell/aoe_turf/knock/harvester,
			/spell/targeted/construct_advanced/force_beam,
			/spell/targeted/construct_advanced/soothing_sphere,
		)

/decl/mob_organ_names/harvester
	hit_zones = list("cephalothorax", "eye", "carapace", "energy crystal", "mandible")

////////////////////////////
//	Purity Construct - Priest
////////////////////////////

/mob/living/simple_mob/construct/priest
	name = "Priest"
	real_name = "Priest"
	construct_type = "Priest"
	faction = "purity"
	desc = "A medium sized construct of the purity worshippers mechanical followers, sturdy but lacking strength."
	icon_state = "priest"
	icon_living = "priest"
	ui_icons = 'modular_chomp/icons/mob/screen1_purity.dmi'
	maxHealth = 200
	health = 200
	response_harm = "viciously beaten"
	harm_intent_damage = 5
	melee_damage_lower = 10 //It's not the strongest of the bunch, but that doesn't mean it can't hurt you.
	melee_damage_upper = 15
	organ_names = /decl/mob_organ_names/artificer
	attacktext = list("rammed")
	attack_sound = 'sound/weapons/rapidslice.ogg'
	construct_spells = list(/spell/targeted/purity_repair_aura,
							/spell/targeted/construct_advanced/mend_purity
							)

	ai_holder_type = /datum/ai_holder/simple_mob/retaliate/cooperative

/decl/mob_organ_names/artificer
	hit_zones = list("body", "carapace", "right manipulator", "left manipulator", "upper left appendage", "upper right appendage", "eye")

////////////////////////////
//	Purity Construct - Bishop
////////////////////////////

/mob/living/simple_mob/construct/bishop
	name = "Bishop"
	real_name = "Bishop"
	construct_type = "Bishop"
	faction = "purity"
	desc = "A medium sized construct of the purity worshippers mechanical followers, sturdy and deadly, these constructs are commanded by an archbishop, tasked with patrolling and eliminating threats to their flock."
	icon_state = "bishop"
	icon_living = "bishop"
	ui_icons = 'modular_chomp/icons/mob/screen1_purity.dmi'
	maxHealth = 250
	health = 250
	melee_damage_lower = 15
	melee_damage_upper = 20
	attack_armor_pen = 15
	attack_sharp = TRUE
	attack_edge = 1
	attacktext = list("slashed")
	friendly = list("pinches")
	organ_names = /decl/mob_organ_names/wraith
	movement_cooldown = -1
	attack_sound = 'sound/weapons/rapidslice.ogg'
	construct_spells = list(/spell/targeted/construct_advanced/crippling_beam,
							/spell/targeted/construct_advanced/banishment
							)

	ai_holder_type = /datum/ai_holder/simple_mob/retaliate/cooperative

//	environment_smash = 1	// Whatever this gets renamed to, Wraiths need to break things

/mob/living/simple_mob/construct/bishop/apply_melee_effects(var/atom/A)
	if(isliving(A))
		var/mob/living/L = A
		L.add_modifier(/datum/modifier/deep_wounds, 30 SECONDS)

/decl/mob_organ_names/wraith
	hit_zones = list("body", "eye", "crystaline spike", "left claw", "right claw")

////////////////////////////
//	Purity Construct - Archbishop
////////////////////////////

/mob/living/simple_mob/construct/bishop/arch
	name = "Archbishop"
	real_name = "Archbishop"
	construct_type = "Archbishop"
	faction = "purity"
	desc = "A large sized construct of the purity worshippers mechanical followers, one of their most advanced, it is the right hand of purification, dedicated to the pursuit of eradicating those who cause harm their charge."
	icon_state = "archbishop"
	icon_living = "archbishop"
	ui_icons = 'modular_chomp/icons/mob/screen1_purity.dmi'
	maxHealth = 200
	health = 200
	melee_damage_lower = 20 //hits much harder then most purity constructs
	melee_damage_upper = 30
	attack_armor_pen = 50 //armor is no match against its religious wrath
	attack_sharp = 1
	attack_edge = 1
	attacktext = list("violently stabbed")
	friendly = list("caresses")
	organ_names = /decl/mob_organ_names/wraith
	movement_cooldown = 0

	ai_holder_type = /datum/ai_holder/simple_mob/retaliate/cooperative

	//	environment_smash = 1	// Whatever this gets renamed to, Harvesters need to break things

	attack_sound = 'sound/weapons/pierce.ogg'

/decl/mob_organ_names/wraith
	hit_zones = list("body", "eye", "crystaline spike", "left claw", "right claw")

////////////////////////////
//	Purity Construct - Cardinal
////////////////////////////

/mob/living/simple_mob/construct/cardinal
	name = "Cardinal"
	real_name = "Cardinal"
	construct_type = "Cardinal"
	faction = "purity"
	desc = "A large sized construct of the purity worshippers mechanical followers, one of their most advanced, it is the left hand of purification, tasked with the ultimate protection and ultimately defense of all under its charge, it will stop at nothing to protect its flock from harm."
	icon_state = "cardinal"
	icon_living = "cardinal"
	ui_icons = 'modular_chomp/icons/mob/screen1_purity.dmi'
	maxHealth = 300
	health = 300
	response_harm = "harmlessly punches"
	harm_intent_damage = 0
	melee_damage_lower = 20
	melee_damage_upper = 30
	attack_armor_pen = 50 //fist of iron and stone will smash through most things
	attacktext = list("smashed their armoured gauntlet into")
	friendly = list("pats")
	organ_names = /decl/mob_organ_names/juggernaut
	mob_size = MOB_HUGE
	attack_sound = 'sound/weapons/heavysmash.ogg'
	status_flags = 0
	resistance = 10
	construct_spells = list(/spell/targeted/fortify,
							/spell/targeted/construct_advanced/slam,
							/spell/targeted/construct_advanced/mend_purity,
							/spell/targeted/purity_repair_aura
							)

	ai_holder_type = /datum/ai_holder/simple_mob/retaliate/cooperative

	armor = list(
				"melee" = 70,
				"bullet" = 30,
				"laser" = 30,
				"energy" = 30,
				"bomb" = 10,
				"bio" = 100,
				"rad" = 100)

/mob/living/simple_mob/construct/cardinal/Life()
	SetWeakened(0)
	..()

/mob/living/simple_mob/construct/cardinal/bullet_act(var/obj/item/projectile/P)
	var/reflectchance = 100 - round(P.damage)
	if(prob(reflectchance))
		var/damage_mod = rand(2,4)
		var/projectile_dam_type = P.damage_type
		var/incoming_damage = (round(P.damage / damage_mod) - (round((P.damage / damage_mod) * 0.3)))
		var/armorcheck = run_armor_check(null, P.check_armour)
		var/soakedcheck = get_armor_soak(null, P.check_armour)
		if(!(istype(P, /obj/item/projectile/energy) || istype(P, /obj/item/projectile/beam)))
			visible_message("<span class='danger'>The [P.name] bounces off of [src]'s shell!</span>", \
						"<span class='userdanger'>The [P.name] bounces off of [src]'s shell!</span>")
			new /obj/item/material/shard/shrapnel(src.loc)
			if(!(P.damage_type == BRUTE || P.damage_type == BURN))
				projectile_dam_type = BRUTE
				incoming_damage = round(incoming_damage / 4) //Damage from strange sources is converted to brute for physical projectiles, though severely decreased.
			apply_damage(incoming_damage, projectile_dam_type, null, armorcheck, soakedcheck, is_sharp(P), has_edge(P), P)
			return -1 //Doesn't reflect non-beams or non-energy projectiles. They just smack and drop with little to no effect.
		else
			visible_message("<span class='danger'>The [P.name] gets reflected by [src]'s shell!</span>", \
						"<span class='userdanger'>The [P.name] gets reflected by [src]'s shell!</span>")
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

/decl/mob_organ_names/juggernaut
	hit_zones = list("body", "left pauldron", "right pauldron", "left arm", "right arm", "eye", "head", "crystaline spike")
