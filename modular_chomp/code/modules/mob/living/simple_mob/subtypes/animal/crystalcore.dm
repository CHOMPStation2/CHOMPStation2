/mob/living/simple_mob/animal/crystalcore
	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0
	minbodytemp = 0
	maxbodytemp = 900
	movement_cooldown = 0
	health = 35
	maxHealth = 35
	icon = 'modular_chomp/icons/mob/crystalcore.dmi'
	icon_state = "sun"
	icon_living = "sun"
	faction = "crystalcore"
	//Hovering = TRUE

//Purple
/mob/living/simple_mob/animal/crystalcore/jellyfish //Looks like the explosive jellyfish. Is harmless
	health = 15
	maxHealth = 15
	ai_holder_type = /datum/ai_holder/simple_mob/retaliate
	meat_amount = 5
	meat_type = /obj/item/weapon/reagent_containers/food/snacks/meat/carp/jelly
	icon_state = "jellyfish"
	icon_living = "jellyfish"
	icon_dead = "jellyfish_dead"

/mob/living/simple_mob/animal/crystalcore/jellyfish/explosive //Looks like the non-explosive jellyfish. Explodes
	health = 15
	maxHealth = 15
	ai_holder_type = /datum/ai_holder/simple_mob/retaliate

	icon_state = "jellyfish_explode"
	icon_living = "jellyfish_explode"
	icon_dead = "jellyfish_dead"

	var/exploded = FALSE
	var/explosion_dev_range		= 2
	var/explosion_heavy_range	= 3
	var/explosion_light_range	= 4
	var/explosion_flash_range	= 4 // This doesn't do anything iirc.

	var/explosion_delay_lower	= 1 SECOND	// Lower bound for explosion delay.
	var/explosion_delay_upper	= 3 SECONDS	// Upper bound.

/mob/living/simple_mob/animal/crystalcore/jellyfish/explosive/death()
	visible_message(span("critical", "\The [src]'s body begins to rupture!"))
	var/delay = rand(explosion_delay_lower, explosion_delay_upper)
	spawn(0)
		// Flash black and red as a warning.
		for(var/i = 1 to delay)
			if(i % 2 == 0)
				color = "#000000"
			else
				color = "#FF0000"
			sleep(1)

	spawn(delay)
		// The actual boom.
		if(src && !exploded)
			visible_message(span("danger", "\The [src]'s body detonates!"))
			exploded = TRUE
			explosion(src.loc, explosion_dev_range, explosion_heavy_range, explosion_light_range, explosion_flash_range)
	return ..()


/obj/item/weapon/reagent_containers/food/snacks/meat/grubmeat/eel
	name = "eel meat"

/obj/item/weapon/reagent_containers/food/snacks/meat/carp/jelly
	name = "jellyfish slice"

/mob/living/simple_mob/animal/crystalcore/crab //Basic melee foe
	health = 20
	maxHealth = 20
	melee_damage_lower = 5
	melee_damage_upper = 10
	meat_type = /obj/item/weapon/reagent_containers/food/snacks/crabmeat

	icon_state = "crab"
	icon_living = "crab"
	icon_dead = "crab_dead"

/mob/living/simple_mob/animal/crystalcore/eel //Zappy melee foe
	health = 30
	maxHealth = 30
	melee_damage_lower = 10
	melee_damage_upper = 15
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 70, bomb = 0, bio = 100, rad = 100) //Eletric Eel
	meat_amount = 4
	meat_type = /obj/item/weapon/reagent_containers/food/snacks/meat/grubmeat/eel

	icon_state = "eel"
	icon_living = "eel"
	icon_dead = "eel_dead"

/mob/living/simple_mob/animal/crystalcore/revospider //GUN SPIDER
	health = 80
	maxHealth = 80
	needs_reload = TRUE
	reload_max = 6
	reload_time = 12 SECONDS
	projectile_dispersion = 0
	projectiletype = /obj/item/projectile/bullet/pistol/medium
	ranged_cooldown = 0.5 //Fan the hammer

	meat_amount = 6
	meat_type = /obj/item/weapon/reagent_containers/food/snacks/xenomeat/spidermeat

	icon = 'icons/mob/animal.dmi' //placeholder
	icon_state = "guard"
	icon_living = "guard"
	icon_dead = "guard_dead"


//red
/mob/living/simple_mob/animal/crystalcore/hypnofish
	health = 50
	maxHealth = 50
	melee_damage_lower = 15
	melee_damage_upper = 20
	icon_state = "fesh" //placeholder
	icon_living = "fesh"
	icon_dead = "fesh_dead"
	ai_holder_type = /datum/ai_holder/simple_mob/retaliate

/mob/living/simple_mob/animal/crystalcore/hypnofish/handle_special()
	if(stat != DEAD)
		mindbreak_aura()
	..()

/mob/living/simple_mob/animal/crystalcore/hypnofish/proc/mindbreak_aura()
	for(var/mob/living/L in view(src, 7))
		if(L.stat == DEAD)
			continue
		L.add_modifier(/datum/modifier/feysight, 5 SECONDS, src)

/mob/living/simple_mob/mechanical/deepdrilldrone //I dunno
	health = 50
	maxHealth = 50
	melee_damage_lower = 15
	melee_damage_upper = 20
	armor = list(melee = 15, bullet = 10, laser = 10, energy = 10, bomb = 80, bio = 100, rad = 100) //high bomb cause it worked around miners

	icon = 'modular_chomp/icons/mob/crystalcore.dmi'
	icon_state = "drill"
	icon_living = "drill"
	icon_dead = "drill_dead"

//dark
/mob/living/simple_mob/animal/crystalcore/angler //Come to the light
	glow_color = "#FF6600"
	light_color = "#FF6600"
	glow_range = 5
	glow_intensity = 3
	melee_damage_lower = 20
	melee_damage_upper = 25

	meat_amount = 6
	meat_type = /obj/item/weapon/reagent_containers/food/snacks/dragonmeat/angler

	icon_state = "angler"
	icon_living = "angler"
	icon_dead = "angler_dead"

	ai_holder_type = /datum/ai_holder/simple_mob/retaliate
	var/rads = 1

/mob/living/simple_mob/animal/crystalcore/angler/handle_special()
	if(stat != DEAD)
		irradiate()
	..()

/mob/living/simple_mob/animal/crystalcore/angler/proc/irradiate()
	SSradiation.radiate(src, rads)

/obj/item/weapon/reagent_containers/food/snacks/dragonmeat/angler
	name = "angler slab"

/mob/living/simple_mob/animal/crystalcore/depthworm //Infection
	icon_state = "worm"
	icon_living = "worm"
	icon_dead = "worm_dead"
	var/list/datum/disease2/disease/virus2 = list()

/mob/living/simple_mob/animal/crystalcore/depthworm/Initialize()
	virus2 |= new /datum/disease2/disease
	virus2[1].makerandom()

/mob/living/simple_mob/animal/crystalcore/blobfish //Befriend the blob fish
	movement_cooldown = 3
	ai_holder_type = /datum/ai_holder/simple_mob/retaliate
	icon_state = "blobfish"
	icon_living = "blobfish"
	icon_dead = "blobfish_dead"

/mob/living/simple_mob/animal/crystalcore/blobfish/handle_special()
	if(stat != DEAD)
		heal_aura()
	..()

/mob/living/simple_mob/animal/crystalcore/blobfish/proc/heal_aura()
	for(var/mob/living/L in view(src, 7))
		if(L.stat == DEAD || !IIsAlly(L))
			continue
		L.add_modifier(/datum/modifier/aura/blobfish_heal, null, src)

/datum/modifier/aura/blobfish_heal
	name = "slime mending"
	desc = "You feel somewhat gooey."
	mob_overlay_state = "pink_sparkles"
	stacks = MODIFIER_STACK_FORBID
	aura_max_distance = 7
	metabolism_percent = 4

	on_created_text = "<span class='warning'>Twinkling spores of goo surround you.  It makes you feel healthier.</span>"
	on_expired_text = "<span class='notice'>The spores of goo have faded, although you feel much healthier than before.</span>"

/datum/modifier/aura/blobfish_heal/tick()
	if(holder.stat == DEAD)
		expire()

	if(ishuman(holder)) //
		var/mob/living/carbon/human/H = holder
		for(var/obj/item/organ/external/E in H.organs)
			var/obj/item/organ/external/O = E
			O.heal_damage(1, 1, 0, 0.5)
	else
		holder.adjustBruteLoss(-3)
		holder.adjustFireLoss(-3)

/mob/living/simple_mob/animal/crystalcore/shadowray //Stealth critter
	health = 50
	maxHealth = 50
	melee_damage_lower = 20
	melee_damage_upper = 25
	alpha = 120
	meat_amount = 6
	meat_type = /obj/item/weapon/reagent_containers/food/snacks/phorondragonmeat/shadowray

	icon_state = "ray"
	icon_living = "ray"
	icon_dead = "ray_dead"

/obj/item/weapon/reagent_containers/food/snacks/phorondragonmeat/shadowray
	name = "shadow ray slice"

/mob/living/simple_mob/animal/crystalcore/turtle //Tanky
	health = 50
	maxHealth = 50
	melee_damage_lower = 20
	melee_damage_upper = 25
	armor = list(melee = 30, bullet = 30, laser = 30, energy = 30, bomb = 60, bio = 100, rad = 100)

	icon_state = "turtle"
	icon_living = "turtle"
	icon_dead = "turtle_dead"

/mob/living/simple_mob/animal/crystalcore/shark //Hefty wounds
	health = 50
	maxHealth = 50
	melee_damage_lower = 20
	melee_damage_upper = 25
	movement_cooldown = -1
	meat_type = /obj/item/weapon/reagent_containers/food/snacks/sliceable/sharkchunk

	icon_state = "shark"
	icon_living = "shark"
	icon_dead = "shark_dead"


//Wierd boss critters
/mob/living/simple_mob/animal/crystalcore/magmaslime //Wierd level 1 mining boss
	health = 125
	maxHealth = 125
	melee_damage_lower = 20
	melee_damage_upper = 25
	movement_cooldown = 0
	icon_state = "magma"
	icon_living = "magma"
	icon_dead = "magma_dead"

	projectiletype = /obj/item/projectile/temp/hot
	ranged_cooldown_time = 0.5

/*
/mob/living/simple_mob/animal/crystalcore/magmaslime/bullet_act(var/obj/item/projectile/Proj)
	var/obj/item/projectile/P = new /obj/item/projectile/temp/hot(get_turf(src))
	P.launch_projectile(A, BP_TORSO, src)
	..()
*/

/* To make fish bosses
/mob/living/simple_mob/animal/crystalcore/crabzilla //Giant Crab

/mob/living/simple_mob/animal/crystalcore/jollyreef //reef fish + jolly roger

/mob/living/simple_mob/animal/crystalcore/krakenjellyfish //Giant death jellyfish

/mob/living/simple_mob/animal/crystalcore/stormray //Giant sting ray
*/

/mob/living/simple_mob/animal/crystalcore/mosquito
	name = "Strange Giant Mosquito"
	desc = "An oversized mosquito bloated with some unknown liquid."
	health = 15
	maxHealth = 15
	harm_intent_damage = 5
	melee_damage_lower = 5
	melee_damage_upper = 15

	faction = "hive_court"

	meat_amount = 2
	meat_type = /obj/item/weapon/reagent_containers/food/snacks/meat/mosquito

	icon_state = "mosquito"
	icon_living = "mosquito"
	icon_dead = "mosquito_dead"

	var/drain = 80
	var/bleed = 20

/mob/living/simple_mob/animal/crystalcore/mosquito/apply_melee_effects(var/atom/A)
	if(isliving(A))
		var/mob/living/L = A
		if(L.nutrition)
			L.adjust_nutrition(-drain)
			adjust_nutrition(drain)
			L.adjustHalLoss(bleed)


/obj/item/weapon/reagent_containers/food/snacks/meat/mosquito
	name = "insect meat"
	desc = "A slab of green meat."
	icon_state = "xenomeat"
	filling_color = "#43DE18"

/obj/item/weapon/reagent_containers/food/snacks/meat/mosquito/red

/obj/item/weapon/reagent_containers/food/snacks/meat/mosquito/yellow

/obj/item/weapon/reagent_containers/food/snacks/meat/mosquito/blue

/obj/item/weapon/reagent_containers/food/snacks/meat/mosquito/green

/obj/item/weapon/reagent_containers/food/snacks/meat/mosquito/orange

/obj/item/weapon/reagent_containers/food/snacks/meat/mosquito/purple

/obj/item/weapon/reagent_containers/food/snacks/meat/mosquito/Initialize()
	reagents.add_reagent("neurotoxic_protein",6)

/obj/item/weapon/reagent_containers/food/snacks/meat/mosquito/red/Initialize()
	reagents.add_reagent("mindbreaker",6)

/obj/item/weapon/reagent_containers/food/snacks/meat/mosquito/yellow/Initialize()
	reagents.add_reagent("neurotoxin",6)

/obj/item/weapon/reagent_containers/food/snacks/meat/mosquito/blue/Initialize()
	reagents.add_reagent("stoxin",6)

/obj/item/weapon/reagent_containers/food/snacks/meat/mosquito/green/Initialize()
	reagents.add_reagent("microcillin",6)

/obj/item/weapon/reagent_containers/food/snacks/meat/mosquito/purple/Initialize()
	reagents.add_reagent("macrocillin",6)

/obj/item/weapon/reagent_containers/food/snacks/meat/mosquito/orange/Initialize()
	reagents.add_reagent("potassium_chlorophoride",6)

/mob/living/simple_mob/animal/crystalcore/mosquito/red
	meat_type = /obj/item/weapon/reagent_containers/food/snacks/meat/mosquito/red
	icon_state = "mosquito"
	icon_living = "mosquito"

/mob/living/simple_mob/animal/crystalcore/mosquito/orange
	meat_type = /obj/item/weapon/reagent_containers/food/snacks/meat/mosquito/orange
	icon_state = "mosquito_orange"
	icon_living = "mosquito_orange"

/mob/living/simple_mob/animal/crystalcore/mosquito/blue
	meat_type = /obj/item/weapon/reagent_containers/food/snacks/meat/mosquito/blue
	icon_state = "mosquito_blue"
	icon_living = "mosquito_blue"

/mob/living/simple_mob/animal/crystalcore/mosquito/green
	meat_type = /obj/item/weapon/reagent_containers/food/snacks/meat/mosquito/green
	icon_state = "mosquito_green"
	icon_living = "mosquito_green"

/mob/living/simple_mob/animal/crystalcore/mosquito/yellow
	meat_type = /obj/item/weapon/reagent_containers/food/snacks/meat/mosquito/yellow
	icon_state = "mosquito_yellow"
	icon_living = "mosquito_yellow"

/mob/living/simple_mob/animal/crystalcore/mosquito/purple
	meat_type = /obj/item/weapon/reagent_containers/food/snacks/meat/mosquito/purple
	icon_state = "mosquito_purple"
	icon_living = "mosquito_purple"


/mob/living/simple_mob/animal/crystalcore/mosquito/red/countess //self heals
	health = 100
	maxHealth = 100
	melee_damage_lower = 15
	melee_damage_upper = 25

	drain = 300
	bleed = 10
	meat_amount = 15

	loot_list = list(/obj/item/toy/plushie/mosquito  = 50,
			)

	icon_state = "mosquito_evolved"
	icon_living = "mosquito_evolved"

/mob/living/simple_mob/animal/crystalcore/mosquito/orange/baron //Come forth my minons
	melee_damage_lower = 15
	melee_damage_upper = 25

	loot_list = list(/obj/item/toy/plushie/mosquito/orange  = 50,
			)

	icon_state = "mosquito_orange_evolved"
	icon_living = "mosquito_orange_evolved"

/mob/living/simple_mob/animal/crystalcore/mosquito/blue/sleeper //slow but deadly
	health = 100
	maxHealth = 100
	melee_damage_lower = 25
	melee_damage_upper = 35
	movement_cooldown = 7

	drain = 400
	bleed = 60
	meat_amount = 15

	loot_list = list(/obj/item/toy/plushie/mosquito/blue  = 50,
			)

	icon_state = "mosquito_blue_evolved"
	icon_living = "mosquito_blue_evolved"

/mob/living/simple_mob/animal/crystalcore/mosquito/green/croc //stealth killer
	alpha = 180
	health = 100
	maxHealth = 100
	melee_damage_lower = 20
	melee_damage_upper = 30

	drain = 120
	bleed = 25
	meat_amount = 15

	loot_list = list(/obj/item/toy/plushie/mosquito/green  = 50,
			)

	icon_state = "mosquito_green_evolved"
	icon_living = "mosquito_green_evolved"

/mob/living/simple_mob/animal/crystalcore/mosquito/yellow/guardian //tanky
	health = 150
	maxHealth = 150
	melee_damage_lower = 15
	melee_damage_upper = 25

	drain = 80
	bleed = 30
	meat_amount = 15

	loot_list = list(/obj/item/toy/plushie/mosquito/yellow  = 50,
			)

	icon_state = "mosquito_yellow_evolved"
	icon_living = "mosquito_yellow_evolved"

/mob/living/simple_mob/animal/crystalcore/mosquito/purple/viscount //ZOOOOM
	health = 100
	maxHealth = 100
	melee_damage_lower = 15
	melee_damage_upper = 25

	drain = 20
	bleed = 40
	meat_amount = 15
	movement_cooldown = -2

	loot_list = list(/obj/item/toy/plushie/mosquito/purple  = 50,
			)

	icon_state = "mosquito_purple_evolved"
	icon_living = "mosquito_purple_evolved"