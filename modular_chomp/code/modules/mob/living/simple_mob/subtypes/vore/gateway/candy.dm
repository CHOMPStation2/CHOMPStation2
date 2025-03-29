//Cataloguer things
/datum/category_item/catalogue/fauna/livingcandy
	name = "Living Candy"
	desc = "Upon investigation of the strange creatures, a mix of \
	promethean biology alongside various candies can be found. The purpose \
	of such a creation is unknown but it seems to function at a middle ground \
	between slimes and prometheans. Lacking the full sentience of prometheans  \
	but their presence bolstering others of their kind."
	value = CATALOGUER_REWARD_MEDIUM

//Someone remind me to get someone to make actual sprites for this things. //Combat refactor walkback wont touch these, idk the balance and afaik theyre a swarm mob
/mob/living/simple_mob/vore/candy
	name = "candy critter"
	desc = "A creature made of candy"
	icon = 'modular_chomp/icons/mob/candy.dmi'
	icon_state = "drone0"
	icon_living = "drone0"
	icon_dead = "drone0"
	catalogue_data = list(/datum/category_item/catalogue/fauna/livingcandy)

	mob_class = MOB_CLASS_ABERRATION
	ai_holder_type = /datum/ai_holder/simple_mob/melee

	faction = "candy"

	maxHealth = 20
	health = 20
	movement_cooldown = 2
	melee_attack_delay = 2 SECOND
	can_be_drop_prey = TRUE
	unsuitable_atoms_damage = 0
	melee_miss_chance = 0

	melee_damage_lower = 8
	melee_damage_upper = 15
	damage_fatigue_mult = 0 //Candy creatures. They will fight to the bitter end unaffected by their wounds. Also they have 25 health, do they really need slowdown?

/mob/living/simple_mob/vore/candy
	vore_active = 1
	vore_capacity = 6
	vore_max_size = RESIZE_HUGE
	vore_min_size = RESIZE_SMALL
	vore_pounce_chance = 0 // Beat them into crit before eating.
	vore_icons = null

	can_be_drop_prey = TRUE //CHOMP Add

//bluenom
/mob/living/simple_mob/vore/candy/bluecabold/Login()
	. = ..()
	if(!riding_datum)
		riding_datum = new /datum/riding/simple_mob(src)
	add_verb(src,/mob/living/simple_mob/proc/animal_mount) //CHOMPEdit TGPanel
	add_verb(src,/mob/living/proc/toggle_rider_reins) //CHOMPEdit TGPanel
	movement_cooldown = 1

/mob/living/simple_mob/vore/candy/bluecabold/MouseDrop_T(mob/living/M, mob/living/user)
	return

/mob/living/simple_mob/vore/candy/bluecabold/init_vore()
	if(!voremob_loaded)
		return
	if(LAZYLEN(vore_organs))
		return
	.=..()
	var/obj/belly/B = vore_selected
	B.name = "stomach"
	B.desc = "The fearsome predator gets a firm grip upon you, before dunking you into it's maw, then with a powerful swift gulp you're sent tumbling into it's stomach."

	B.emote_lists[DM_HOLD] = list(
		"Your surroundings are momentarily filled with your predator's pleased rumbling, its hands stroking over the taut swell you make in its belly.",)

	B.emote_lists[DM_DIGEST] = list(
		"Every clench of the predator's stomach grinds powerful digestive fluids into your body, forcibly churning away your strength!")

//rednom
/mob/living/simple_mob/vore/candy/redcabold/Login()
	. = ..()
	if(!riding_datum)
		riding_datum = new /datum/riding/simple_mob(src)
	add_verb(src,/mob/living/simple_mob/proc/animal_mount) //CHOMPEdit TGPanel
	add_verb(src,/mob/living/proc/toggle_rider_reins) //CHOMPEdit TGPanel
	movement_cooldown = 1

/mob/living/simple_mob/vore/candy/redcabold/MouseDrop_T(mob/living/M, mob/living/user)
	return

/mob/living/simple_mob/vore/candy/redcabold/init_vore()
	if(!voremob_loaded)
		return
	if(LAZYLEN(vore_organs))
		return
	.=..()
	var/obj/belly/B = vore_selected
	B.name = "stomach"
	B.desc = "The fearsome predator gets a firm grip upon you, before dunking you into it's maw, then with a powerful swift gulp you're sent tumbling into it's stomach."

	B.emote_lists[DM_HOLD] = list(
		"Your surroundings are momentarily filled with your predator's pleased rumbling, its hands stroking over the taut swell you make in its belly.",)

	B.emote_lists[DM_DIGEST] = list(
		"Every clench of the predator's stomach grinds powerful digestive fluids into your body, forcibly churning away your strength!")

//yellow
/mob/living/simple_mob/vore/candy/yellowcabold/Login()
	. = ..()
	if(!riding_datum)
		riding_datum = new /datum/riding/simple_mob(src)
	add_verb(src,/mob/living/simple_mob/proc/animal_mount) //CHOMPEdit TGPanel
	add_verb(src,/mob/living/proc/toggle_rider_reins) //CHOMPEdit TGPanel
	movement_cooldown = 1

/mob/living/simple_mob/vore/candy/yellowcabold/MouseDrop_T(mob/living/M, mob/living/user)
	return

/mob/living/simple_mob/vore/candy/yellowcabold/init_vore()
	if(!voremob_loaded)
		return
	if(LAZYLEN(vore_organs))
		return
	.=..()
	var/obj/belly/B = vore_selected
	B.name = "stomach"
	B.desc = "The fearsome predator gets a firm grip upon you, before dunking you into it's maw, then with a powerful swift gulp you're sent tumbling into it's stomach."

	B.emote_lists[DM_HOLD] = list(
		"Your surroundings are momentarily filled with your predator's pleased rumbling, its hands stroking over the taut swell you make in its belly.",)

	B.emote_lists[DM_DIGEST] = list(
		"Every clench of the predator's stomach grinds powerful digestive fluids into your body, forcibly churning away your strength!")

//orange
/mob/living/simple_mob/vore/candy/orangecabold/Login()
	. = ..()
	if(!riding_datum)
		riding_datum = new /datum/riding/simple_mob(src)
	add_verb(src,/mob/living/simple_mob/proc/animal_mount) //CHOMPEdit TGPanel
	add_verb(src,/mob/living/proc/toggle_rider_reins) //CHOMPEdit TGPanel
	movement_cooldown = 1

/mob/living/simple_mob/vore/candy/orangecabold/MouseDrop_T(mob/living/M, mob/living/user)
	return

/mob/living/simple_mob/vore/candy/orangecabold/init_vore()
	if(!voremob_loaded)
		return
	if(LAZYLEN(vore_organs))
		return
	.=..()
	var/obj/belly/B = vore_selected
	B.name = "stomach"
	B.desc = "The fearsome predator gets a firm grip upon you, before dunking you into it's maw, then with a powerful swift gulp you're sent tumbling into it's stomach."

	B.emote_lists[DM_HOLD] = list(
		"Your surroundings are momentarily filled with your predator's pleased rumbling, its hands stroking over the taut swell you make in its belly.",)

	B.emote_lists[DM_DIGEST] = list(
		"Every clench of the predator's stomach grinds powerful digestive fluids into your body, forcibly churning away your strength!")

//purplenom
/mob/living/simple_mob/vore/candy/purplecabold/Login()
	. = ..()
	if(!riding_datum)
		riding_datum = new /datum/riding/simple_mob(src)
	add_verb(src,/mob/living/simple_mob/proc/animal_mount) //CHOMPEdit TGPanel
	add_verb(src,/mob/living/proc/toggle_rider_reins) //CHOMPEdit TGPanel
	movement_cooldown = 1

/mob/living/simple_mob/vore/candy/purplecabold/MouseDrop_T(mob/living/M, mob/living/user)
	return

/mob/living/simple_mob/vore/candy/purplecabold/init_vore()
	if(!voremob_loaded)
		return
	if(LAZYLEN(vore_organs))
		return
	.=..()
	var/obj/belly/B = vore_selected
	B.name = "stomach"
	B.desc = "The fearsome predator gets a firm grip upon you, before dunking you into it's maw, then with a powerful swift gulp you're sent tumbling into it's stomach."

	B.emote_lists[DM_HOLD] = list(
		"Your surroundings are momentarily filled with your predator's pleased rumbling, its hands stroking over the taut swell you make in its belly.",)

	B.emote_lists[DM_DIGEST] = list(
		"Every clench of the predator's stomach grinds powerful digestive fluids into your body, forcibly churning away your strength!")

//marshmellownom
/mob/living/simple_mob/vore/candy/marshmellowserpent/Login()
	. = ..()
	if(!riding_datum)
		riding_datum = new /datum/riding/simple_mob(src)
	add_verb(src,/mob/living/simple_mob/proc/animal_mount) //CHOMPEdit TGPanel
	add_verb(src,/mob/living/proc/toggle_rider_reins) //CHOMPEdit TGPanel
	movement_cooldown = 1

/mob/living/simple_mob/vore/candy/marshmellowserpent/MouseDrop_T(mob/living/M, mob/living/user)
	return

/mob/living/simple_mob/vore/candy/marshmellowserpent/init_vore()
	if(!voremob_loaded)
		return
	if(LAZYLEN(vore_organs))
		return
	.=..()
	var/obj/belly/B = vore_selected
	B.name = "stomach"
	B.desc = "The fearsome predator gets a firm grip upon you, before dunking you into it's maw, then with a powerful swift gulp you're sent tumbling into it's stomach."

	B.emote_lists[DM_HOLD] = list(
		"Your surroundings are momentarily filled with your predator's pleased rumbling, its hands stroking over the taut swell you make in its belly.",)

	B.emote_lists[DM_DIGEST] = list(
		"Every clench of the predator's stomach grinds powerful digestive fluids into your body, forcibly churning away your strength!")

/mob/living/simple_mob/vore/candy/bluecabold //Adds protection
	name = "gummy kobold"
	desc = "A creature made of candy"
	icon_state = "blue"
	icon_living = "blue"
	icon_dead = "blue_dead"

	melee_damage_lower = 7
	melee_damage_upper = 12

/mob/living/simple_mob/vore/candy/bluecabold/handle_special()
	if(stat != DEAD)
		buff_aura()
	..()

/mob/living/simple_mob/vore/candy/bluecabold/proc/buff_aura()
	for(var/mob/living/L in view(src, 2))
		if(L.stat == DEAD || !IIsAlly(L))
			continue
		L.add_modifier(/datum/modifier/aura/candy_blue, null, src)

/mob/living/simple_mob/vore/candy/redcabold //Tanky boi
	name = "gummy kobold"
	desc = "A creature made of candy"
	icon_state = "red"
	icon_living = "red"
	icon_dead = "red_dead"

	maxHealth = 50
	health = 50

	melee_damage_lower = 15
	melee_damage_upper = 25

/mob/living/simple_mob/vore/candy/redcabold/apply_melee_effects(atom/A)
	..()

	if(isliving(A) && a_intent == I_HURT)
		var/mob/living/L = A
		if(L.mob_size <= MOB_MEDIUM)
			visible_message(span_danger("\The [src] sends \the [L] flying with the impact!"))
			playsound(src, "punch", 50, 1)
			L.Weaken(1)
			var/throwdir = get_dir(src, L)
			L.throw_at(get_edge_target_turf(L, throwdir), 3, 1, src)
		else
			to_chat(L, span_warning("\The [src] hits you with incredible force, but you remain in place."))
			visible_message(span_danger("\The [src] hits \the [L] with incredible force, to no visible effect!")) // CHOMPEdit: Visible/audible feedback for *resisting* the slam.
			playsound(src, "punch", 50, 1)

/mob/living/simple_mob/vore/candy/yellowcabold //Speeds folks
	name = "gummy kobold"
	desc = "A creature made of candy"
	icon_state = "yellow"
	icon_living = "yellow"
	icon_dead = "yellow_dead"

	melee_damage_lower = 8
	melee_damage_upper = 15

/mob/living/simple_mob/vore/candy/yellowcabold/handle_special()
	if(stat != DEAD)
		buff_aura()
	..()

/mob/living/simple_mob/vore/candy/yellowcabold/proc/buff_aura()
	for(var/mob/living/L in view(src, 2))
		if(L.stat == DEAD || !IIsAlly(L))
			continue
		L.add_modifier(/datum/modifier/aura/candy_yellow, null, src)

/mob/living/simple_mob/vore/candy/orangecabold //Increase melee damage
	name = "gummy kobold"
	desc = "A creature made of candy"
	icon_state = "orange"
	icon_living = "orange"
	icon_dead = "orange_dead"

	melee_damage_lower = 7
	melee_damage_upper = 12

/mob/living/simple_mob/vore/candy/orangecabold/handle_special()
	if(stat != DEAD)
		buff_aura()
	..()

/mob/living/simple_mob/vore/candy/orangecabold/proc/buff_aura()
	for(var/mob/living/L in view(src, 2))
		if(L.stat == DEAD || !IIsAlly(L))
			continue
		L.add_modifier(/datum/modifier/aura/candy_orange, null, src)

/mob/living/simple_mob/vore/candy/purplecabold //Heals folks
	name = "gummy kobold"
	desc = "A creature made of candy"
	icon_state = "purple"
	icon_living = "purple"
	icon_dead = "purple_dead"

	melee_damage_lower = 7
	melee_damage_upper = 12

/mob/living/simple_mob/vore/candy/purplecabold/handle_special()
	if(stat != DEAD)
		buff_aura()
	..()

/mob/living/simple_mob/vore/candy/purplecabold/proc/buff_aura()
	for(var/mob/living/L in view(src, 2))
		if(L.stat == DEAD || !IIsAlly(L))
			continue
		L.add_modifier(/datum/modifier/aura/candy_purple, null, src)

/mob/living/simple_mob/vore/candy/greencabold //Nyoooooom
	name = "gummy kobold"
	desc = "A creature made of candy"
	icon_state = "green"
	icon_living = "green"
	icon_dead = "green_dead"

	movement_cooldown = -1

	melee_attack_delay = 1 SECOND
	melee_damage_lower = 7
	melee_damage_upper = 12

/mob/living/simple_mob/vore/candy/greencabold/apply_melee_effects(var/atom/A)
	if(isliving(A))
		var/mob/living/L = A
		L.add_modifier(/datum/modifier/deep_wounds, 15 SECONDS)


/mob/living/simple_mob/vore/candy/marshmellowserpent //Long range grab
	name = "marshmellow serpent"
	desc = "A creature made of candy"
	icon_state = "marshmellow"
	icon_living = "marshmellow"
	icon_dead = "marshmellow_dead"

	ai_holder_type = /datum/ai_holder/simple_mob/ranged/kiting

	melee_damage_lower = 4
	melee_damage_upper = 8

	special_attack_min_range = 1
	special_attack_max_range = 14
	special_attack_cooldown = 10

	loot_list = list(/obj/item/clothing/head/psy_crown/candycrown = 30,
			/obj/item/clothing/gloves/stamina = 30,
			/obj/item/clothing/suit/armor/buffvest = 30,
			/obj/item/melee/cullingcane = 30
			)

/mob/living/simple_mob/vore/candy/marshmellowserpent/do_special_attack(atom/A)
	set_AI_busy(TRUE)
	do_windup_animation(A, 20)
	addtimer(CALLBACK(src, PROC_REF(chargeend), A), 20)

/mob/living/simple_mob/vore/candy/marshmellowserpent/proc/chargeend(atom/A)
	if(stat) //you are dead
		set_AI_busy(FALSE)
		return
	playsound(src, 'sound/vore/sunesound/pred/schlorp.ogg', 25)
	var/obj/item/projectile/beam/appendage/appendage_attack = new /obj/item/projectile/beam/appendage(get_turf(loc))
	appendage_attack.old_style_target(A, src)
	appendage_attack.launch_projectile(A, BP_TORSO, src)
	set_AI_busy(FALSE)

//Modifiers
/datum/modifier/aura/candy_purple //Healz
	name = "candy_purple"
	desc = "You feel somewhat gooey."
	stacks = MODIFIER_STACK_FORBID
	aura_max_distance = 5

/datum/modifier/aura/candy_purple/tick()
	if(holder.stat == DEAD)
		expire()

	if(ishuman(holder)) // Robolimbs need this code sadly.
		var/mob/living/carbon/human/H = holder
		for(var/obj/item/organ/external/E in H.organs)
			var/obj/item/organ/external/O = E
			O.heal_damage(2, 2, 0, 1)
	else
		holder.adjustBruteLoss(-2)
		holder.adjustFireLoss(-2)

	holder.adjustToxLoss(-1)

/datum/modifier/aura/candy_orange //melee+
	name = "candy orange"
	desc = "You feel somewhat gooey."
	stacks = MODIFIER_STACK_FORBID
	aura_max_distance = 5
	outgoing_melee_damage_percent = 1.5

/datum/modifier/aura/candy_yellow //speed
	name = "candy yellow"
	desc = "You feel somewhat gooey."
	stacks = MODIFIER_STACK_FORBID
	aura_max_distance = 5
	slowdown = -1

/datum/modifier/aura/candy_blue //defense
	name = "candy blue"
	desc = "You feel somewhat gooey."
	stacks = MODIFIER_STACK_FORBID
	aura_max_distance = 5
	incoming_damage_percent	= 0.9

//Boss Fight
/mob/living/simple_mob/vore/candy/ouroboros
	name = "candy critter"
	desc = "A creature made of candy"
	icon = 'modular_chomp/icons/mob/candy.dmi'
	icon_state = "ouroboros"
	icon_living = "ouroboros"
	icon_dead = "slainouroboros"
	catalogue_data = list(/datum/category_item/catalogue/fauna/livingcandy)

	mob_class = MOB_CLASS_ABERRATION
	ai_holder_type = /datum/ai_holder/simple_mob/melee

	faction = "candy"
	icon_state = "ouroboros"
	icon_living = "ouroboros"
	icon_dead = "slainouroboros"

	maxHealth = 200
	health = 200
	armor = list(melee = 30, bullet = 30, laser = 30, energy = 30, bomb = 20, bio = 100, rad = 100) //armor cause boss
	movement_cooldown = 0
	melee_attack_delay = 1 SECOND
	can_be_drop_prey = TRUE
	unsuitable_atoms_damage = 0

	melee_damage_lower = 25
	melee_damage_upper = 35
	var/grenade_type = /obj/item/grenade/concussion
	var/grenade_timer = 1

	special_attack_min_range = 1
	special_attack_max_range = 15
	special_attack_cooldown = 7 SECONDS

/mob/living/simple_mob/vore/candy/ouroboros/bullet_act(var/obj/item/projectile/Proj)
	if(prob(50))
		new /obj/random/mob/candycritter (src.loc)
		return
	else
		return

/mob/living/simple_mob/vore/candy/ouroboros/do_special_attack(atom/A)
	switch(a_intent)
		if(I_GRAB)
			summon_combo(A)
		if(I_HURT)
			barrage_combo(A)
		if(I_DISARM)
			debuff_combo(A)

/mob/living/simple_mob/vore/candy/ouroboros/proc/summon_combo(atom/target)
	visible_message(span_warning("\The [src] calls for help!"))
	new /obj/random/mob/candycritter (src.loc)
	new /obj/random/mob/candycritter (src.loc)
	sleep(2.0 SECONDS)
	visible_message(span_warning("\The [src] calls for help!"))
	new /obj/random/mob/candycritter (src.loc)
	new /obj/random/mob/candycritter (src.loc)
	new /obj/random/mob/candycritter (src.loc)
	sleep(1.5 SECONDS)
	visible_message(span_warning("\The [src] calls for help!"))
	new /obj/random/mob/candycritter (src.loc)
	new /obj/random/mob/candycritter (src.loc)
	new /obj/random/mob/candycritter (src.loc)
	new /obj/random/mob/candycritter (src.loc)
	sleep(1.0 SECONDS)
	visible_message(span_warning("\The [src] calls for help!"))
	new /obj/random/mob/candycritter (src.loc)
	new /obj/random/mob/candycritter (src.loc)
	new /obj/random/mob/candycritter (src.loc)
	new /obj/random/mob/candycritter (src.loc)
	new /obj/random/mob/candycritter (src.loc)
	visible_message(span_warning("\The [src] begins to heal!"))
	sleep(3.5 SECONDS)
	adjustBruteLoss(-35)
	adjustFireLoss(-35)
	adjustToxLoss(-35)
	adjustOxyLoss(-35)
	adjustCloneLoss(-35)

/mob/living/simple_mob/vore/candy/ouroboros/proc/barrage_combo(atom/target)
	if(prob(50))
		sleep(0.5 SECONDS)
		var/obj/item/projectile/P = new /obj/item/projectile/arc/fragmentation/cherrybomb(get_turf(src))
		P.launch_projectile(target, BP_TORSO, src)
		if(prob(50))
			sleep(0.5 SECONDS)
			new /obj/random/mob/candycritter (src.loc)
			new /obj/random/mob/candycritter (src.loc)
			new /obj/random/mob/candycritter (src.loc)
		else
			sleep(0.5 SECONDS)
			var/obj/item/projectile/V = new /obj/item/projectile/bullet/cmblast(get_turf(src))
			V.launch_projectile(target, BP_TORSO, src)
	else
		sleep(0.5 SECONDS)
		var/obj/item/projectile/A = new /obj/item/projectile/bullet/cmblast(get_turf(src))
		A.launch_projectile(target, BP_TORSO, src)
		if(prob(50))
			sleep(0.5 SECONDS)
			var/obj/item/projectile/B = new /obj/item/projectile/arc/fragmentation/cherrybomb(get_turf(src))
			B.launch_projectile(target, BP_TORSO, src)
		else
			sleep(0.5 SECONDS)
			new /obj/random/mob/candycritter (src.loc)
			new /obj/random/mob/candycritter (src.loc)
			new /obj/random/mob/candycritter (src.loc)

/mob/living/simple_mob/vore/candy/ouroboros/proc/debuff_combo(atom/target)
	visible_message(span_warning("\The [src] prepares to let out a thunderous roar!"))
	sleep(2.5 SECONDS)
	var/obj/item/grenade/G = new grenade_type(get_turf(src))
	if(istype(G))
		G.throw_at(G.throw_range, G.throw_speed, src)
		G.det_time = grenade_timer	//CHOMPEdit
		G.activate(src)	//CHOMPEdit
	if(prob(25))
		new /obj/random/mob/candycritter (src.loc)
		new /obj/random/mob/candycritter (src.loc)
	else
		var/obj/item/projectile/P = new /obj/item/projectile/bullet/cmblast(get_turf(src))
		P.launch_projectile(target, BP_TORSO, src)
		sleep(0.5)
		P.launch_projectile(target, BP_TORSO, src)

/datum/ai_holder/simple_mob/intentional/ouroboros
	unconscious_vore = TRUE
	handle_corpse = TRUE
	vision_range = 13
	respect_alpha = FALSE
	lose_target_timeout = 60 SECONDS
	intelligence_level = AI_SMART

/datum/ai_holder/simple_mob/intentional/ouroboros/proc/update_health()
	if(prob(35))
		holder.a_intent = I_GRAB
	if(prob(35))
		holder.a_intent = I_DISARM
	else
		holder.a_intent = I_HURT


/obj/random/mob/candycritter
	name = "Random Gummy Candy Critter"
	desc = "This is a random candy critter."
	overwrite_hostility = 1
	mob_hostile = 1
	mob_retaliate = 1

	mob_faction = "candy"

/obj/random/mob/candycritter/item_to_spawn()
	return pick(prob(40);/mob/living/simple_mob/vore/candy/purplecabold,
				prob(40);/mob/living/simple_mob/vore/candy/bluecabold,
				prob(40);/mob/living/simple_mob/vore/candy/greencabold,
				prob(40);/mob/living/simple_mob/vore/candy/yellowcabold,
				prob(40);/mob/living/simple_mob/vore/candy/orangecabold,
				prob(40);/mob/living/simple_mob/vore/candy/redcabold,
				prob(40);/mob/living/simple_mob/vore/candy/peppermint
				)

/obj/item/projectile/bullet/cmblast
	use_submunitions = 1
	only_submunitions = 1
	range = 0
	embed_chance = 0
	submunition_spread_max = 1800
	submunition_spread_min = 500
	submunitions = list(/obj/item/projectile/energy/chocosphere = 12)

/obj/item/projectile/energy/chocosphere
	name = "choclate sphere"
	icon = 'modular_chomp/icons/mob/candy.dmi'
	icon_state = "choclate_sphere"
	damage = 20
	armor_penetration = 30
	damage_type = BURN
	check_armour = "energy"
	speed = 4.0
	flash_strength = 0
	modifier_type_to_apply = /datum/modifier/chilled
	modifier_duration = 6 SECONDS

/obj/item/projectile/energy/canearrow
	name = "candy cane arrow"
	icon = 'modular_chomp/icons/mob/candy.dmi'
	icon_state = "choclate_sphere"
	damage = 15
	armor_penetration = 40
	damage_type = BURN
	check_armour = "laser"
	speed = 2.5
	flash_strength = 0
	modifier_type_to_apply = /datum/modifier/grievous_wounds
	modifier_duration = 12 SECONDS

/obj/item/projectile/arc/fragmentation/cherrybomb
	name = "cherry bomb"
	icon = 'modular_chomp/icons/mob/candy.dmi'
	icon_state = "cherry_bomb"
	fragment_amount = 3
	spread_range = 7
	speed = 1.5
	fragment_types = list(
		/obj/item/projectile/bullet/cherrypit
		)

/obj/item/projectile/bullet/cherrypit
	name = "cherry bomb"
	icon = 'modular_chomp/icons/mob/candy.dmi'
	icon_state = "cherry_pit"
	damage = 25
	armor_penetration = 30

//more critters
//antimelee

/mob/living/simple_mob/vore/candy/peppermint
	name = "peppermint turtle"
	desc = "A creature made of candy, it's peppermint looking shell seeming diffcult to get a good hit on, but fragile if well struck."
	icon = 'modular_chomp/icons/mob/candy.dmi'
	icon_state = "peppermint"
	icon_living = "peppermint"
	icon_dead = "peppermint_dead"

	faction = "candy"

	maxHealth = 10
	health = 10

/mob/living/simple_mob/vore/candy/peppermint/attackby(var/obj/item/O as obj, var/mob/user as mob)
	if(O.force)
		if(prob(80))
			visible_message(span_danger("\The [src] deflects \the [O] with its shell!"))
			if(user)
				ai_holder.react_to_attack(user)
			return
		else
			..()
	else
		to_chat(user, span_warning("This weapon is ineffective, it does no damage."))
		visible_message(span_warning("\The [user] gently taps [src] with \the [O]."))

/*
/mob/living/simple_mob/vore/candy/worm
	name = "hardcandy worm"
	desc = "A creature made of candy."
	icon = 'modular_chomp/icons/mob/candy.dmi'
	icon_state = "worm"
	icon_living = "worm"
	icon_dead = "worm_dead"

	faction = "candy"

	maxHealth = 60
	health = 60


/mob/living/simple_mob/vore/candy/worm/death()
	new /obj/random/mob/candycritter (src.loc)
	new /obj/random/mob/candycritter (src.loc)
	new /obj/random/mob/candycritter (src.loc)


/mob/living/simple_mob/vore/candy/worm/Login()
	. = ..()
	if(!riding_datum)
		riding_datum = new /datum/riding/simple_mob(src)
	add_verb(src,/mob/living/simple_mob/proc/animal_mount) //CHOMPEdit TGPanel
	add_verb(src,/mob/living/proc/toggle_rider_reins) //CHOMPEdit TGPanel
	movement_cooldown = 1

/mob/living/simple_mob/vore/candy/worm/MouseDrop_T(mob/living/M, mob/living/user)
	return

/mob/living/simple_mob/vore/candy/worm/redcabold/init_vore()
	if(!voremob_loaded)
		return
	if(LAZYLEN(vore_organs))
		return
	.=..()
	var/obj/belly/B = vore_selected
	B.name = "stomach"
	B.desc = "The fearsome predator gets a firm grip upon you, before dunking you into it's maw, then with a powerful swift gulp you're sent tumbling into it's stomach."

	B.emote_lists[DM_HOLD] = list(
		"Your surroundings are momentarily filled with your predator's pleased rumbling, its hands stroking over the taut swell you make in its belly.",)

	B.emote_lists[DM_DIGEST] = list(
		"Every clench of the predator's stomach grinds powerful digestive fluids into your body, forcibly churning away your strength!")
*/

/mob/living/simple_mob/vore/candy/peppermint/Login()
	. = ..()
	if(!riding_datum)
		riding_datum = new /datum/riding/simple_mob(src)
	add_verb(src,/mob/living/simple_mob/proc/animal_mount) //CHOMPEdit TGPanel
	add_verb(src,/mob/living/proc/toggle_rider_reins) //CHOMPEdit TGPanel
	movement_cooldown = 1

/mob/living/simple_mob/vore/candy/peppermint/MouseDrop_T(mob/living/M, mob/living/user)
	return

/mob/living/simple_mob/vore/candy/peppermint/init_vore()
	if(!voremob_loaded)
		return
	if(LAZYLEN(vore_organs))
		return
	.=..()
	var/obj/belly/B = vore_selected
	B.name = "stomach"
	B.desc = "The fearsome predator gets a firm grip upon you, before dunking you into it's maw, then with a powerful swift gulp you're sent tumbling into it's stomach."

	B.emote_lists[DM_HOLD] = list(
		"Your surroundings are momentarily filled with your predator's pleased rumbling, its hands stroking over the taut swell you make in its belly.",)

	B.emote_lists[DM_DIGEST] = list(
		"Every clench of the predator's stomach grinds powerful digestive fluids into your body, forcibly churning away your strength!")

v
