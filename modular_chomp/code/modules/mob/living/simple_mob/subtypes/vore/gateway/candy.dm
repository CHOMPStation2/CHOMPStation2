//Cataloguer things
/datum/category_item/catalogue/fauna/livingcandy
	name = "Living Candy"
	desc = "Upon investigation of the strange creatures, a mix of \
	promthean biolgy alongside various candies can be found. The purpose \
	of such a creation is unknown but it seems to function at a middle ground \
	between slimes and prometheans. Lacking the full sentience of prometheans \
	but their prescense bolstering others of their kind."
	value = CATALOGUER_REWARD_MEDIUM

//Someone remind me to get someone to make actual sprites for this things.
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

	maxHealth = 50
	health = 50
	movement_cooldown = 2
	melee_attack_delay = 3 SECOND
	can_be_drop_prey = TRUE
	unsuitable_atoms_damage = 0

	melee_damage_lower = 8
	melee_damage_upper = 15

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
	verbs |= /mob/living/simple_mob/proc/animal_mount
	verbs |= /mob/living/proc/toggle_rider_reins
	movement_cooldown = 1

/mob/living/simple_mob/vore/candy/bluecabold/MouseDrop_T(mob/living/M, mob/living/user)
	return

/mob/living/simple_mob/vore/candy/bluecabold/init_vore()
	if(!voremob_loaded)
		return
	.=..()
	var/obj/belly/B = vore_selected
	B.name = "stomach"
	B.desc = "The fearsome preadtor gets a firm grip upon you, before dunking you into it's maw, then with a powerful swift gulp you're sent tumbling into it's stomach.."

	B.emote_lists[DM_HOLD] = list(
		"Your surroundings are momentarily filled with tour predator's pleased rumbling, its hands stroking over the taut swell you make in its belly.",)

	B.emote_lists[DM_DIGEST] = list(
		"Every clench of the predator's stomach grinds powerful digestive fluids into your body, forcibly churning away your strength!")

//rednom
/mob/living/simple_mob/vore/candy/redcabold/Login()
	. = ..()
	if(!riding_datum)
		riding_datum = new /datum/riding/simple_mob(src)
	verbs |= /mob/living/simple_mob/proc/animal_mount
	verbs |= /mob/living/proc/toggle_rider_reins
	movement_cooldown = 1

/mob/living/simple_mob/vore/candy/redcabold/MouseDrop_T(mob/living/M, mob/living/user)
	return

/mob/living/simple_mob/vore/candy/redcabold/init_vore()
	if(!voremob_loaded)
		return
	.=..()
	var/obj/belly/B = vore_selected
	B.name = "stomach"
	B.desc = "The fearsome preadtor gets a firm grip upon you, before dunking you into it's maw, then with a powerful swift gulp you're sent tumbling into it's stomach.."

	B.emote_lists[DM_HOLD] = list(
		"Your surroundings are momentarily filled with tour predator's pleased rumbling, its hands stroking over the taut swell you make in its belly.",)

	B.emote_lists[DM_DIGEST] = list(
		"Every clench of the predator's stomach grinds powerful digestive fluids into your body, forcibly churning away your strength!")

//yellow
/mob/living/simple_mob/vore/candy/yellowcabold/Login()
	. = ..()
	if(!riding_datum)
		riding_datum = new /datum/riding/simple_mob(src)
	verbs |= /mob/living/simple_mob/proc/animal_mount
	verbs |= /mob/living/proc/toggle_rider_reins
	movement_cooldown = 1

/mob/living/simple_mob/vore/candy/yellowcabold/MouseDrop_T(mob/living/M, mob/living/user)
	return

/mob/living/simple_mob/vore/candy/yellowcabold/init_vore()
	if(!voremob_loaded)
		return
	.=..()
	var/obj/belly/B = vore_selected
	B.name = "stomach"
	B.desc = "The fearsome preadtor gets a firm grip upon you, before dunking you into it's maw, then with a powerful swift gulp you're sent tumbling into it's stomach.."

	B.emote_lists[DM_HOLD] = list(
		"Your surroundings are momentarily filled with tour predator's pleased rumbling, its hands stroking over the taut swell you make in its belly.",)

	B.emote_lists[DM_DIGEST] = list(
		"Every clench of the predator's stomach grinds powerful digestive fluids into your body, forcibly churning away your strength!")

//orange
/mob/living/simple_mob/vore/candy/orangecabold/Login()
	. = ..()
	if(!riding_datum)
		riding_datum = new /datum/riding/simple_mob(src)
	verbs |= /mob/living/simple_mob/proc/animal_mount
	verbs |= /mob/living/proc/toggle_rider_reins
	movement_cooldown = 1

/mob/living/simple_mob/vore/candy/orangecabold/MouseDrop_T(mob/living/M, mob/living/user)
	return

/mob/living/simple_mob/vore/candy/orangecabold/init_vore()
	if(!voremob_loaded)
		return
	.=..()
	var/obj/belly/B = vore_selected
	B.name = "stomach"
	B.desc = "The fearsome preadtor gets a firm grip upon you, before dunking you into it's maw, then with a powerful swift gulp you're sent tumbling into it's stomach.."

	B.emote_lists[DM_HOLD] = list(
		"Your surroundings are momentarily filled with tour predator's pleased rumbling, its hands stroking over the taut swell you make in its belly.",)

	B.emote_lists[DM_DIGEST] = list(
		"Every clench of the predator's stomach grinds powerful digestive fluids into your body, forcibly churning away your strength!")

//purplenom
/mob/living/simple_mob/vore/candy/purplecabold/Login()
	. = ..()
	if(!riding_datum)
		riding_datum = new /datum/riding/simple_mob(src)
	verbs |= /mob/living/simple_mob/proc/animal_mount
	verbs |= /mob/living/proc/toggle_rider_reins
	movement_cooldown = 1

/mob/living/simple_mob/vore/candy/purplecabold/MouseDrop_T(mob/living/M, mob/living/user)
	return

/mob/living/simple_mob/vore/candy/purplecabold/init_vore()
	if(!voremob_loaded)
		return
	.=..()
	var/obj/belly/B = vore_selected
	B.name = "stomach"
	B.desc = "The fearsome preadtor gets a firm grip upon you, before dunking you into it's maw, then with a powerful swift gulp you're sent tumbling into it's stomach.."

	B.emote_lists[DM_HOLD] = list(
		"Your surroundings are momentarily filled with tour predator's pleased rumbling, its hands stroking over the taut swell you make in its belly.",)

	B.emote_lists[DM_DIGEST] = list(
		"Every clench of the predator's stomach grinds powerful digestive fluids into your body, forcibly churning away your strength!")

//marshmellownom
/mob/living/simple_mob/vore/candy/marshmellowserpent/Login()
	. = ..()
	if(!riding_datum)
		riding_datum = new /datum/riding/simple_mob(src)
	verbs |= /mob/living/simple_mob/proc/animal_mount
	verbs |= /mob/living/proc/toggle_rider_reins
	movement_cooldown = 1

/mob/living/simple_mob/vore/candy/marshmellowserpent/MouseDrop_T(mob/living/M, mob/living/user)
	return

/mob/living/simple_mob/vore/candy/marshmellowserpent/init_vore()
	if(!voremob_loaded)
		return
	.=..()
	var/obj/belly/B = vore_selected
	B.name = "stomach"
	B.desc = "The fearsome preadtor gets a firm grip upon you, before dunking you into it's maw, then with a powerful swift gulp you're sent tumbling into it's stomach.."

	B.emote_lists[DM_HOLD] = list(
		"Your surroundings are momentarily filled with tour predator's pleased rumbling, its hands stroking over the taut swell you make in its belly.",)

	B.emote_lists[DM_DIGEST] = list(
		"Every clench of the predator's stomach grinds powerful digestive fluids into your body, forcibly churning away your strength!")

/mob/living/simple_mob/vore/candy/bluecabold //Adds protection
	name = "gummy kobold"
	desc = "A creature made of candy"
	icon_state = "blue"
	icon_living = "blue"
	icon_dead = "blue_dead"

	maxHealth = 50
	health = 50

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

	maxHealth = 125
	health = 125

	melee_damage_lower = 2
	melee_damage_upper = 2

/mob/living/simple_mob/vore/candy/redcabold/apply_melee_effects(atom/A)
	..()

	if(isliving(A) && a_intent == I_HURT)
		var/mob/living/L = A
		if(L.mob_size <= MOB_MEDIUM)
			visible_message(span("danger", "\The [src] sends \the [L] flying with the impact!"))
			playsound(src, "punch", 50, 1)
			L.Weaken(1)
			var/throwdir = get_dir(src, L)
			L.throw_at(get_edge_target_turf(L, throwdir), 3, 1, src)
		else
			to_chat(L, span("warning", "\The [src] hits you with incredible force, but you remain in place."))
			visible_message(span("danger", "\The [src] hits \the [L] with incredible force, to no visible effect!")) // CHOMPEdit: Visible/audible feedback for *resisting* the slam.
			playsound(src, "punch", 50, 1)

/mob/living/simple_mob/vore/candy/yellowcabold //Speeds folks
	name = "gummy kobold"
	desc = "A creature made of candy"
	icon_state = "yellow"
	icon_living = "yellow"
	icon_dead = "yellow_dead"

	maxHealth = 50
	health = 50

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

	maxHealth = 50
	health = 50

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

	maxHealth = 50
	health = 50

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

/mob/living/simple_mob/vore/candy/marshmellowserpent //Long range grab
	name = "marshmellow serpent"
	desc = "A creature made of candy"
	icon_state = "marshmellow"
	icon_living = "marshmellow"
	icon_dead = "marshmellow_dead"

	ai_holder_type = /datum/ai_holder/simple_mob/ranged/kiting

	maxHealth = 50
	health = 50

	melee_damage_lower = 4
	melee_damage_upper = 8

	special_attack_min_range = 1
	special_attack_max_range = 14
	special_attack_cooldown = 10

	loot_list = list(/obj/item/clothing/head/psy_crown/candycrown = 30,
			/obj/item/clothing/gloves/stamina = 30,
			/obj/item/clothing/suit/armor/buffvest = 30,
			/obj/item/weapon/melee/cullingcane = 30
			)

/mob/living/simple_mob/vore/candy/marshmellowserpent/do_special_attack(atom/A)
	set_AI_busy(TRUE)
	do_windup_animation(A, 20)
	addtimer(CALLBACK(src, .proc/chargeend, A), 20)

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