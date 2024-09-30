/datum/category_item/catalogue/fauna/alchemistbee
	name = "VR Creations"
	desc = "A creature made of hardlight. \
	There appears to be remnants of code within the strange construct, \
	of dialog, and player interaction. But all that code seems inactive"
	value = CATALOGUER_REWARD_HARD

/mob/living/simple_mob/vr/alchemistbee
	name = "large hardlight creature"
	desc = "A digital creature"
	icon = 'modular_chomp/icons/mob/alchemistbee.dmi'
	icon_state = "beeliving"
	icon_living = "beeliving"
	icon_dead = "beedead"
	catalogue_data = list(/datum/category_item/catalogue/fauna/alchemistbee)

	faction = "terror" //Ai seemed bugged during test, and it fighting the book bats might be niche but nice

	maxHealth = 250
	health = 250
	movement_cooldown = 0
	unsuitable_atoms_damage = 0
	projectiletype = /obj/item/projectile/energy/homing_bolt/wizard/boss
	melee_attack_delay = 1 SECOND
	ai_holder_type = /datum/ai_holder/simple_mob/intentional/alchemistbee

	melee_damage_lower = 20
	melee_damage_upper = 20

	special_attack_min_range = 1
	special_attack_max_range = 14
	special_attack_cooldown = 10

	loot_list = list(/obj/item/clothing/head/vrwizard = 60,
			/obj/item/clothing/suit/vrwizard = 60,
			/obj/item/gun/magic/firestaff/vrwizard/fire = 60,
			/obj/item/gun/magic/firestaff/vrwizard/frost = 60,
			/obj/item/gun/magic/firestaff/vrwizard/poison = 60,
			/obj/item/gun/magic/firestaff/vrwizard/lighting = 60,
			/obj/item/gun/magic/firestaff/vrwizard/nuclear = 100,
			/obj/item/clothing/head/darkvrwizard = 100,
			/obj/item/clothing/suit/darkvrwizard = 100
			)

/mob/living/simple_mob/vr/alchemistbee
	vore_active = 1
	vore_capacity = 6
	vore_max_size = RESIZE_HUGE
	vore_min_size = RESIZE_SMALL
	vore_pounce_chance = 0 // Beat them into crit before eating.
	vore_icons = null

//bluenom
/mob/living/simple_mob/vr/alchemistbee/Login()
	. = ..()
	if(!riding_datum)
		riding_datum = new /datum/riding/simple_mob(src)
	add_verb(src,/mob/living/simple_mob/proc/animal_mount) //CHOMPEdit TGPanel
	add_verb(src,/mob/living/proc/toggle_rider_reins) //CHOMPEdit TGPanel
	movement_cooldown = 1

/mob/living/simple_mob/vr/alchemistbee/MouseDrop_T(mob/living/M, mob/living/user)
	return

/mob/living/simple_mob/vr/alchemistbee/init_vore()
	if(!voremob_loaded)
		return
	.=..()
	var/obj/belly/B = vore_selected
	B.name = "stomach"
	B.desc = "The fearsome predator gets a firm grip upon you, before dunking you into it's maw, then with a powerful swift gulp you're sent tumbling into it's stomach."

	B.emote_lists[DM_HOLD] = list(
		"Your surroundings are momentarily filled with your predator's pleased rumbling, its hands stroking over the taut swell you make in its belly.",)

	B.emote_lists[DM_DIGEST] = list(
		"Every clench of the predator's stomach grinds powerful digestive fluids into your body, forcibly churning away your strength!")

/obj/item/projectile/energy/homing_bolt/wizard/boss
	damage = 10
	modifier_type_to_apply = /datum/modifier/wizweakness
	modifier_duration = 30 SECONDS
	icon_state = "arcane_barrage"

/datum/modifier/wizweakness
	name = "wizweakness"
	desc = "Can you even see this in game?"
	mob_overlay_state = "cult_aura"

	on_created_text = "<span class='warning'>You feel incrediably vulnerable.</span>"
	on_expired_text = "<span class='notice'>You feel better.</span>"
	stacks = MODIFIER_STACK_ALLOWED // Multiple instances will hurt a lot.
	incoming_damage_percent = 2			// Adjusts all incoming damage.
	incoming_brute_damage_percent = 2	// Only affects bruteloss.
	incoming_fire_damage_percent = 2	// Only affects fireloss.
	incoming_tox_damage_percent = 2		// Only affects toxloss.
	incoming_oxy_damage_percent = 2		// Only affects oxyloss.

//Trying to learn from the AADG's ai and make my own
/datum/ai_holder/simple_mob/intentional/alchemistbee
	conserve_ammo = FALSE
	vision_range = 16
	var/closest_desired_distance = 3		// Otherwise run up to them to be able to potentially shock or punch them.

	var/chemblast_radius = 4			// How big to assume electric defense's area is.
	var/dangerbolt_radius = 2				// Same but for microsingulo pull.
	var/homingcluster_radius = 2			// Explosion radius for the rockets.

	var/chemblast_threshold = 3		// How many non-targeted people are needed in close proximity before electric defense is viable.
	var/dangerbolt_threshold = 1			// Similar to above, but uses an area around the target.


/datum/ai_holder/simple_mob/intentional/alchemistbee/on_engagement(atom/A)
	// Make the AI backpeddle if using an AoE special attack.
	var/list/risky_intents = list(I_GRAB, I_HURT) // Mini-singulo and missiles.
	if(holder.a_intent in risky_intents)
		var/closest_distance = 3
		switch(holder.a_intent) // Plus one just in case.
			if(I_HURT)
				closest_distance = homingcluster_radius + 3
			if(I_GRAB)
				closest_distance = dangerbolt_radius + 3

		if(get_dist(holder, A) <= closest_distance)
			holder.IMove(get_step_away(holder, A, closest_distance))

	// Otherwise get up close and personal.
	else if(get_dist(holder, A) > closest_desired_distance)
		holder.IMove(get_step_towards(holder, A))

/datum/ai_holder/simple_mob/intentional/alchemistbee/pre_special_attack(atom/A)
	if(isliving(A))
		var/mob/living/target = A

		// If we're surrounded, Electric Defense will quickly fix that.
		var/tally = 0
		var/list/potential_targets = list_targets() // Returns list of mobs and certain objects like mechs and turrets.
		for(var/atom/movable/AM in potential_targets)
			if(get_dist(holder, AM) > chemblast_radius)
				continue
			if(!can_attack(AM))
				continue
			tally++

		// Should we shock them?
		if(tally >= chemblast_threshold || get_dist(target, holder) <= chemblast_radius)
			holder.a_intent = I_DISARM
			return

		for(var/atom/movable/AM in potential_targets)
			if(get_dist(target, AM) > dangerbolt_radius)
				continue
			if(!can_attack(AM))
				continue
			if(AM.anchored)
				tally--
			else
				tally++


		if(tally >= dangerbolt_threshold)
			holder.a_intent = I_GRAB
		else
			holder.a_intent = I_HURT

	else
		if(get_dist(holder, A) >= homingcluster_radius + 1)
			holder.a_intent = I_HURT
		else
			holder.a_intent = I_DISARM


/mob/living/simple_mob/vr/alchemistbee/do_special_attack(atom/A)
	. = TRUE
	switch(a_intent)
		if(I_DISARM)
			chemblast(A)
		if(I_HURT)
			homingcluster(A)
		if(I_GRAB)
			dangerbolt(A)

/mob/living/simple_mob/vr/alchemistbee/proc/chemblast(atom/target)
	set waitfor = FALSE

	Beam(target, icon_state = "sat_beam", time = 1.5 SECONDS, maxdistance = INFINITY)
	visible_message(span("warning", "\The [src] prepares a pouch of vials!"))
	sleep(0.5 SECONDS)

	if(prob(25))
		visible_message(span("warning", "\The [src] throws a blue vial!"))
		var/obj/item/projectile/B = new /obj/item/projectile/arc/vial/frostvial(get_turf(src))
		B.launch_projectile(target, BP_TORSO, src)

	if(prob(25))
		visible_message(span("warning", "\The [src] throws a green vial!"))
		var/obj/item/projectile/B = new /obj/item/projectile/arc/vial/poisonvial(get_turf(src))
		B.launch_projectile(target, BP_TORSO, src)

	if(prob(25))
		visible_message(span("warning", "\The [src] throws a red vial!"))
		var/obj/item/projectile/B = new /obj/item/projectile/arc/vial/firevial(get_turf(src))
		B.launch_projectile(target, BP_TORSO, src)
	else
		visible_message(span("warning", "\The [src] throws a strange vial"))
		var/obj/item/projectile/A = new /obj/item/projectile/arc/vial/lightingvial(get_turf(src))
		A.launch_projectile(target, BP_TORSO, src)

	visible_message(span("warning", "\The [src] puts them pouch away."))


/mob/living/simple_mob/vr/alchemistbee/proc/homingcluster(atom/target)
	var/obj/item/projectile/A = new /obj/item/projectile/bullet/homingcluster(get_turf(src))
	A.launch_projectile(target, BP_TORSO, src)

/mob/living/simple_mob/vr/alchemistbee/proc/dangerbolt(atom/target)
	visible_message(span("warning", "\The [src] prepares a powerful spell!"))
	Beam(target, icon_state = "sat_beam", time = 2.0 SECONDS, maxdistance = INFINITY)
	sleep(1.5 SECONDS)
	var/obj/item/projectile/A = new /obj/item/projectile/energy/nuclearblast(get_turf(src))
	A.launch_projectile(target, BP_TORSO, src)

/obj/item/projectile/bullet/homingcluster
	use_submunitions = 1
	only_submunitions = 1
	range = 0
	embed_chance = 0
	submunition_spread_max = 1200
	submunition_spread_min = 200
	submunitions = list(/obj/item/projectile/energy/homing_bolt/wizard/fire = 1, /obj/item/projectile/energy/homing_bolt/wizard/frost = 1, /obj/item/projectile/energy/homing_bolt/wizard/poison = 1, /obj/item/projectile/energy/homing_bolt/wizard/lighting = 1)

//I desire arcing projectiles with smoke. Wish this was a general proc for projectiles
/obj/item/projectile/arc/vial
	name = "vial"
	icon = 'modular_chomp/icons/obj/vialprojectile.dmi'
	icon_state = "blue_vial"
	var/splatter = FALSE			// Will this make a cloud of reagents?
	var/splatter_volume = 5			// The volume of its chemical container, for said cloud of reagents.
	var/list/my_chems = list("mold")

/obj/item/projectile/arc/vial/on_impact(var/atom/A)
	if(splatter)
		var/turf/location = get_turf(src)
		var/datum/effect/effect/system/smoke_spread/chem/blob/S = new /datum/effect/effect/system/smoke_spread/chem/blob
		S.attach(location)
		S.set_up(reagents, rand(1, splatter_volume), 0, location)
		playsound(location, 'sound/effects/slime_squish.ogg', 30, 1, -3)
		spawn(0)
			S.start()
	..()

/obj/item/projectile/arc/vial/proc/ready_chemicals()
	if(reagents)
		var/reagent_vol = (round((splatter_volume / my_chems.len) * 100) / 100) //Cut it at the hundreds place, please.
		for(var/reagent in my_chems)
			reagents.add_reagent(reagent, reagent_vol)

/obj/item/projectile/arc/vial/frostvial
	icon_state = "blue_vial"
	damage = 10
	armor_penetration = 0
	damage_type = BRUTE
	splatter_volume = 60
	my_chems = list("frostoil")
	modifier_type_to_apply = /datum/modifier/wizpoison/frost
	modifier_duration = 15 SECONDS
	splatter = TRUE

/obj/item/projectile/arc/vial/poisonvial
	icon_state = "green_vial"
	damage = 10
	armor_penetration = 0
	damage_type = BRUTE
	splatter_volume = 60
	my_chems = list("toxin")
	modifier_type_to_apply = /datum/modifier/wizpoison
	modifier_duration = 15 SECONDS
	splatter = TRUE

/obj/item/projectile/arc/vial/firevial
	icon_state = "red_vial"
	damage = 10
	armor_penetration = 0
	damage_type = BRUTE
	splatter_volume = 60
	my_chems = list("sacid")
	modifier_type_to_apply = /datum/modifier/wizfire
	modifier_duration = 15 SECONDS
	splatter = TRUE

/obj/item/projectile/arc/vial/lightingvial
	icon_state = "orange_vial"
	damage = 10
	armor_penetration = 0
	damage_type = BRUTE
	splatter_volume = 60
	my_chems = list("shredding_nanites")
	modifier_type_to_apply = /datum/modifier/wizfire/lighting
	modifier_duration = 15 SECONDS
	splatter = TRUE

/obj/item/projectile/energy/nuclearblast
	name = "nuclear blast"
	icon_state = "plasma"
	damage = 25
	armor_penetration = 50
	damage_type = BURN
	check_armour = "energy"
	agony = 50
	speed = 24.0
	modifier_type_to_apply = /datum/modifier/grievous_wounds
	modifier_duration = 120 SECONDS
	flash_strength = 15
