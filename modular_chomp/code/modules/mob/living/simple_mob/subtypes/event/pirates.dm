/mob/living/simple_mob/vore/star_pirate
	name = "Artic Claw Pirate"
	desc = "A vixen gladded in pirate attire."
	icon = 'modular_chomp/icons/mob/starhunters.dmi'
	icon_dead = "statisgem"
	icon_gib = "syndicate_gib"
	taser_kill = 0

	grab_resist = 100

	faction = FACTION_PIRATE
	mob_class = MOB_CLASS_HUMANOID
	movement_cooldown = 2
	damage_fatigue_mult = 0

	status_flags = 0

	response_help = "pokes"
	response_disarm = "shoves"
	response_harm = "hits"

	health = 120
	maxHealth = 120
	harm_intent_damage = 0
	melee_damage_lower = 12
	melee_damage_upper = 12
	attack_sharp = 1
	attack_edge = 1
	attacktext = list("slashed", "stabbed")
	armor = list(melee = 20, bullet = 20, laser = 20, energy = 0, bomb = 50, bio = 100, rad = 100)
	ranged_cooldown = 5

	ai_holder_type = /datum/ai_holder/simple_mob/ranged/kiting/dodge

	can_be_drop_prey = FALSE
	pass_flags = PASSTABLE
	softfall = TRUE

	loot_list = list(/obj/item/salvage/loot/pirate = 100)

	swallowTime = 2.5 SECONDS
	vore_active = 1
	vore_capacity = 1
	vore_bump_chance = 10
	vore_stomach_name = "Stomach"
	vore_default_item_mode = IM_DIGEST
	vore_pounce_chance = 100
	vore_pounce_cooldown = 30
	vore_pounce_successrate	= 100
	vore_pounce_falloff = 0
	vore_pounce_maxhealth = 100
	vore_standing_too = TRUE
	unacidable = TRUE

	//spaceproofing things
	minbodytemp = 0			// Minimum "okay" temperature in kelvin
	maxbodytemp = 600			// Maximum of above

	min_oxy = 0					// Oxygen in moles, minimum, 0 is 'no minimum'
	max_oxy = 0					// Oxygen in moles, maximum, 0 is 'no maximum'
	min_tox = 0					// Phoron min
	max_tox = 0					// Phoron max
	min_co2 = 0					// CO2 min
	max_co2 = 0					// CO2 max
	min_n2 = 0					// N2 min

/datum/ai_holder/simple_mob/ranged/kiting/dodge

/datum/ai_holder/simple_mob/ranged/kiting/dodge/post_ranged_attack(atom/A)
	holder.IMove(get_step(holder, pick(GLOB.alldirs)))
	holder.face_atom(A)

/mob/living/simple_mob/vore/star_pirate/death()
	new /obj/effect/decal/remains/human (src.loc)
	..(null,"let's out a maddening laugh as his body crumbles away.")
	ghostize()
	qdel(src)

/mob/living/simple_mob/vore/star_pirate/lighting
	ranged_cooldown = 25
	icon_state = "pirate_a"
	icon_living = "pirate_a"
	projectiletype = /obj/item/projectile/energy/event_mob/pirate/electro

/mob/living/simple_mob/vore/star_pirate/acid
	ranged_cooldown = 15
	icon_state = "pirate_b"
	icon_living = "pirate_b"
	projectiletype = /obj/item/projectile/energy/event_mob/pirate/acid

/mob/living/simple_mob/vore/star_pirate/volley
	ranged_cooldown = 40
	icon_state = "pirate_c"
	icon_living = "pirate_c"
	projectiletype = /obj/item/projectile/arc/explosive_rocket

/mob/living/simple_mob/vore/star_pirate/captain
	name = "Artic Claw Captain"
	icon_state = "pirate_capt"
	icon_living = "pirate_capt"
	melee_damage_lower = 22
	melee_damage_upper = 22

	loot_list = list(/obj/item/clothing/shoes/magboots/advanced/climbing = 60, /obj/item/clothing/glasses/graviton/medgravpatch = 60, /obj/item/clothing/gloves/regen = 60, /obj/item/clothing/head/psy_crown/ling = 60)

/mob/living/simple_mob/mechanical/mecha/eclipse/pirate
	faction = FACTION_PIRATE

/mob/living/simple_mob/mechanical/mecha/eclipse/pirate/armor
	name = "Artic Claw Armor"
	desc = "A makeshift mecha."
	health = 900
	maxHealth = 900
	icon = 'icons/mob/pirates.dmi'
	icon_state = "pirate"
	icon_living = "pirate"
	wreckage = /obj/structure/loot_pile/mecha/ripley/pirate
	projectiletype = /obj/item/projectile/arc/explosive_rocket

/mob/living/simple_mob/mechanical/mecha/eclipse/pirate/armor/do_special_attack(atom/A)
	if(attackcycle == 1)
		addtimer(CALLBACK(src, PROC_REF(quad_random_firing), A, 20, rng_cycle, 8), 0.5 SECONDS, TIMER_DELETE_ME)
		attackcycle = 0

/mob/living/simple_mob/mechanical/mecha/eclipse/pirate/armor/pilot_a
	pilot_type = /mob/living/simple_mob/vore/star_pirate/lighting/pilot_a
	specialattackprojectile = /obj/item/projectile/energy/event_mob/pirate/electro

/mob/living/simple_mob/mechanical/mecha/eclipse/pirate/armor/pilot_b
	pilot_type = /mob/living/simple_mob/vore/star_pirate/lighting/pilot_b
	specialattackprojectile = /obj/item/projectile/energy/event_mob/pirate/electro

/mob/living/simple_mob/mechanical/mecha/eclipse/pirate/armor/pilot_c
	pilot_type = /mob/living/simple_mob/vore/star_pirate/acid/pilot_a
	specialattackprojectile = /obj/item/projectile/energy/event_mob/pirate/acid

/mob/living/simple_mob/mechanical/mecha/eclipse/pirate/armor/pilot_d
	pilot_type = /mob/living/simple_mob/vore/star_pirate/acid/pilot_b
	specialattackprojectile = /obj/item/projectile/energy/event_mob/pirate/acid

/mob/living/simple_mob/vore/star_pirate/lighting/pilot_a
	loot_list = list(/obj/item/clothing/shoes/magboots/advanced/climbing = 40, /obj/item/clothing/glasses/graviton/medgravpatch = 60, /obj/item/clothing/gloves/regen = 40, /obj/item/clothing/head/psy_crown/ling = 40)

/mob/living/simple_mob/vore/star_pirate/lighting/pilot_b
	loot_list = list(/obj/item/clothing/shoes/magboots/advanced/climbing = 60, /obj/item/clothing/glasses/graviton/medgravpatch = 40, /obj/item/clothing/gloves/regen = 40, /obj/item/clothing/head/psy_crown/ling = 40)

/mob/living/simple_mob/vore/star_pirate/acid/pilot_a
	loot_list = list(/obj/item/clothing/shoes/magboots/advanced/climbing = 40, /obj/item/clothing/glasses/graviton/medgravpatch = 40, /obj/item/clothing/gloves/regen = 60, /obj/item/clothing/head/psy_crown/ling = 40)

/mob/living/simple_mob/vore/star_pirate/acid/pilot_b
	loot_list = list(/obj/item/clothing/shoes/magboots/advanced/climbing = 40, /obj/item/clothing/glasses/graviton/medgravpatch = 40, /obj/item/clothing/gloves/regen = 40, /obj/item/clothing/head/psy_crown/ling = 60)

/mob/living/simple_mob/mechanical/mecha/eclipse/pirate/sword_shield
	name = "Artic Claw Captain"
	desc = "A vixen gladded in pirate attire."
	icon = 'modular_chomp/icons/mob/starhunters.dmi'
	mob_class = MOB_CLASS_HUMANOID
	icon_state = "pirate_capt_shield"
	icon_living = "pirate_capt_shield"
	faction = FACTION_PIRATE

	melee_damage_lower = 22
	melee_damage_upper = 22

	health = 700
	maxHealth = 700

	pilot_type = /mob/living/simple_mob/vore/star_pirate/captain

	deflect_chance = 30

	has_repair_droid = FALSE

	swallowTime = 2.5 SECONDS
	vore_active = 1
	vore_capacity = 1
	vore_bump_chance = 10
	vore_stomach_name = "Stomach"
	vore_default_item_mode = IM_DIGEST
	vore_pounce_chance = 100
	vore_pounce_cooldown = 30
	vore_pounce_successrate	= 100
	vore_pounce_falloff = 0
	vore_pounce_maxhealth = 100
	vore_standing_too = TRUE
	unacidable = TRUE

	specialattackprojectile = /obj/item/projectile/bullet/rifle/sword_slash

/mob/living/simple_mob/mechanical/mecha/eclipse/pirate/sword_shield/do_special_attack(atom/A)
	rng_cycle = rand(1,4)
	switch(attackcycle)
		if(1)
			direct_say("Scythe Whirlwind!")
			addtimer(CALLBACK(src, PROC_REF(summon_puddles), A, rng_cycle, /datum/modifier/mmo_drop/blood_flower), 1.5 SECONDS, TIMER_DELETE_ME)
			attackcycle = 0
		if(2)
			direct_say("Whirling Death!")
			addtimer(CALLBACK(src, PROC_REF(dual_spin), A, rng_cycle, 5), 1.5 SECONDS, TIMER_DELETE_ME)
			attackcycle = 0
		if(3)
			direct_say("Thousand Slashes!")
			addtimer(CALLBACK(src, PROC_REF(rising_star), A, rng_cycle, 5), 1.5 SECONDS, TIMER_DELETE_ME)
			attackcycle = 0
		if(4)
			direct_say("Blooming Blade!")
			addtimer(CALLBACK(src, PROC_REF(bullet_blossom), A, rng_cycle, 8), 1.5 SECONDS, TIMER_DELETE_ME)
			attackcycle = 0

/obj/item/grenade/shooter/auto_explode/whirlwind
	spread_range = 2
	projectile_types = list(/obj/item/projectile/bullet/rifle/sword_slash/short)

/datum/modifier/mmo_drop/scythe
	puddleitem = /obj/item/grenade/shooter/auto_explode/whirlwind
