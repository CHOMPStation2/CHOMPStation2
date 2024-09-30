/mob/living/simple_mob/humanoid/cultist/magus/rift
	name = "Rift Magus"
	maxHealth = 450 //Boss Mobs should be tanky. //Old 225
	health = 450

	melee_damage_lower = 30 //Old 15
	melee_damage_upper = 45 //Old 22
	attack_armor_pen = 50
	heat_resist = 1
	cold_resist = 1
	movement_cooldown = -1.5
	projectiletype = /obj/item/projectile/energy/plasma/vepr/inversion
	melee_attack_delay = 4 SECOND
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

	armor_soak = list( //Combat refactor walk back. old 2 armor_soak
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
			/obj/item/melee/voidblade = 25,
			/obj/item/soulstone = 25,
			/obj/item/soulstone = 25,
			/obj/item/soulstone = 25,
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
	new /mob/living/simple_mob/vore/demonAI (src.loc)

/mob/living/simple_mob/humanoid/cultist/magus/rift/proc/electric_defense(atom/target)
	var/obj/item/projectile/P = new /obj/item/projectile/energy/fireball(get_turf(src))
	P.launch_projectile(target, BP_TORSO, src)

/mob/living/simple_mob/humanoid/cultist/magus/rift/proc/launch_rockets(atom/target)
	if(!target)
		to_chat(src, span("warning", "There's nothing to teleport to."))
		return FALSE

	var/list/nearby_things = range(1, target)
	var/list/valid_turfs = list()

	// All this work to just go to a non-dense tile.
	for(var/turf/potential_turf in nearby_things)
		var/valid_turf = TRUE
		if(potential_turf.density)
			continue
		for(var/atom/movable/AM in potential_turf)
			if(AM.density)
				valid_turf = FALSE
		if(valid_turf)
			valid_turfs.Add(potential_turf)

	if(!(valid_turfs.len))
		to_chat(src, span("warning", "There wasn't an unoccupied spot to teleport to."))
		return FALSE

	var/turf/target_turf = pick(valid_turfs)
	var/turf/T = get_turf(src)

	var/datum/effect/effect/system/spark_spread/s1 = new /datum/effect/effect/system/smoke_spread
	s1.set_up(5, 1, T)
	var/datum/effect/effect/system/spark_spread/s2 = new /datum/effect/effect/system/smoke_spread
	s2.set_up(5, 1, target_turf)


	T.visible_message(span("notice", "\The [src] vanishes!"))
	s1.start()

	forceMove(target_turf)
	playsound(target_turf, 'sound/effects/phasein.ogg', 50, 1)
	to_chat(src, span("notice", "You teleport to \the [target_turf]."))

	target_turf.visible_message(span("warning", "\The [src] appears!"))
	s2.start()

/obj/item/grenade/spawnergrenade/riftwallers
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
	damage_type = BURN

/mob/living/simple_mob/humanoid/cultist/magus/rift
	vore_active = 1
	vore_capacity = 6
	vore_max_size = RESIZE_HUGE
	vore_min_size = RESIZE_SMALL
	vore_pounce_chance = 0 // Beat them into crit before eating.
	vore_icons = SA_ICON_LIVING

	can_be_drop_prey = FALSE //CHOMP Add

/mob/living/simple_mob/humanoid/cultist/magus/rift/Login()
	. = ..()
	if(!riding_datum)
		riding_datum = new /datum/riding/simple_mob(src)
	add_verb(src,/mob/living/simple_mob/proc/animal_mount) //CHOMPEdit TGPanel
	add_verb(src,/mob/living/proc/toggle_rider_reins) //CHOMPEdit TGPanel
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

/obj/item/melee/voidblade
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
