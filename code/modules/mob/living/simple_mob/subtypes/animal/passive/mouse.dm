/mob/living/simple_mob/animal/passive/mouse
	name = "mouse"
	real_name = "mouse"
	desc = "It's a small rodent."
	tt_desc = "E Mus musculus"
	icon_state = "mouse_gray"
	item_state = "mouse_gray"
	icon_living = "mouse_gray"
	icon_dead = "mouse_gray_dead"
	icon_rest = "mouse_gray_sleep"
	kitchen_tag = "rodent"

	maxHealth = 5
	health = 5
	melee_damage_lower = 1
	melee_damage_upper = 3

	movement_cooldown = -1

	mob_size = MOB_MINISCULE
	pass_flags = PASSTABLE
//	can_pull_size = ITEMSIZE_TINY
//	can_pull_mobs = MOB_PULL_NONE
	layer = MOB_LAYER
	density = FALSE

	response_help  = "pets"
	response_disarm = "gently pushes aside"
	response_harm   = "stamps on"

	min_oxy = 16 //Require atleast 16kPA oxygen
	minbodytemp = 223		//Below -50 Degrees Celcius
	maxbodytemp = 323	//Above 50 Degrees Celcius

	has_langs = list(LANGUAGE_MOUSE)

	holder_type = /obj/item/weapon/holder/mouse
	meat_amount = 1
	butchery_loot = list()

	say_list_type = /datum/say_list/mouse

	var/body_color //brown, gray, white and black, leave blank for random

	//CHOMP Addition: Added these vore variables in and swapped the booleans from their defaults too.
	can_be_drop_prey = TRUE
	can_be_drop_pred = FALSE
	species_sounds = "Mouse"

	pain_emote_1p = list("squeak", "squik") // CHOMP Addition: Pain/etc sounds
	pain_emote_1p = list("squeaks", "squiks") // CHOMP Addition: Pain/etc sounds

//CHOMPEdit Start
/mob/living/simple_mob/animal/passive/mouse/Initialize()
	. = ..()
	ghostjoin = 1
	ghostjoin_icon()
	active_ghost_pods |= src

/mob/living/simple_mob/animal/passive/mouse/Destroy()
	active_ghost_pods -= src
	return ..()
//CHOMPEdit End

/mob/living/simple_mob/animal/passive/mouse/New()
	..()

	verbs += /mob/living/proc/ventcrawl
	verbs += /mob/living/proc/hide

	if(name == initial(name))
		name = "[name] ([rand(1, 1000)])"
	real_name = name

	if(!body_color)
		body_color = pick( list("brown","gray","white","black") )
	icon_state = "mouse_[body_color]"
	item_state = "mouse_[body_color]"
	icon_living = "mouse_[body_color]"
	icon_dead = "mouse_[body_color]_dead"
	icon_rest = "mouse_[body_color]_sleep"
	if (body_color != "rat")
		desc = "A small [body_color] rodent, often seen hiding in maintenance areas and making a nuisance of itself."
		holder_type = /obj/item/weapon/holder/mouse/rat
	if (body_color == "operative")
		holder_type = /obj/item/weapon/holder/mouse/operative
	if (body_color == "brown")
		holder_type = /obj/item/weapon/holder/mouse/brown
	if (body_color == "gray")
		holder_type = /obj/item/weapon/holder/mouse/gray
	if (body_color == "white")
		holder_type = /obj/item/weapon/holder/mouse/white
	if (body_color == "black")
		holder_type = /obj/item/weapon/holder/mouse/black

/mob/living/simple_mob/animal/passive/mouse/Crossed(atom/movable/AM as mob|obj)
	if(AM.is_incorporeal())
		return
	if( ishuman(AM) )
		if(!stat)
			var/mob/M = AM
			M.visible_message(span_blue("[icon2html(src,viewers(src))] Squeek!"))
			playsound(src, 'sound/effects/mouse_squeak.ogg', 35, 1)
	..()

/mob/living/simple_mob/animal/passive/mouse/death()
	layer = MOB_LAYER
	playsound(src, 'sound/effects/mouse_squeak_loud.ogg', 35, 1)
	if(client)
		client.time_died_as_mouse = world.time
	..()

/mob/living/simple_mob/animal/passive/mouse/cannot_use_vents()
	return

/mob/living/simple_mob/animal/passive/mouse/proc/splat()
	src.health = 0
	src.set_stat(DEAD)
	src.icon_dead = "mouse_[body_color]_splat"
	src.icon_state = "mouse_[body_color]_splat"
	layer = MOB_LAYER
	if(client)
		client.time_died_as_mouse = world.time

/*
 * Mouse types
 */

/mob/living/simple_mob/animal/passive/mouse/white
	body_color = "white"
	icon_state = "mouse_white"
	icon_rest = "mouse_white_sleep"
	holder_type = /obj/item/weapon/holder/mouse/white

/mob/living/simple_mob/animal/passive/mouse/gray
	body_color = "gray"
	icon_state = "mouse_gray"
	icon_rest = "mouse_gray_sleep"
	holder_type = /obj/item/weapon/holder/mouse/gray

/mob/living/simple_mob/animal/passive/mouse/brown
	body_color = "brown"
	icon_state = "mouse_brown"
	icon_rest = "mouse_brown_sleep"
	holder_type = /obj/item/weapon/holder/mouse/brown

//TOM IS ALIVE! SQUEEEEEEEE~K :)
/mob/living/simple_mob/animal/passive/mouse/brown/Tom
	name = "Tom"
	desc = "Jerry the cat is not amused."

/mob/living/simple_mob/animal/passive/mouse/brown/Tom/New()
	..()
	// Change my name back, don't want to be named Tom (666)
	name = initial(name)

/mob/living/simple_mob/animal/passive/mouse/black
	body_color = "black"
	icon_state = "mouse_black"
	icon_rest = "mouse_black_sleep"
	holder_type = /obj/item/weapon/holder/mouse/black

/mob/living/simple_mob/animal/passive/mouse/rat
	name = "rat"
	tt_desc = "E Rattus rattus"
	desc = "A large rodent, often seen hiding in maintenance areas and making a nuisance of itself."
	body_color = "rat"
	icon_state = "mouse_rat"
	icon_rest = "mouse_rat_sleep"
	holder_type = /obj/item/weapon/holder/mouse/rat
	maxHealth = 20
	health = 20

	ai_holder_type = /datum/ai_holder/simple_mob/melee/evasive

/mob/living/simple_mob/animal/passive/mouse/operative
	name = "mouse operative"
	desc = "A cute mouse fitted with a custom blood red suit. Sneaky."
	body_color = "operative"
	icon_state = "mouse_operative"
	icon_rest = "mouse_operative_sleep"
	holder_type = /obj/item/weapon/holder/mouse/operative
	maxHealth = 35

	//It's wearing a void suit, it don't care about atmos
	health = 35
	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0
	maxbodytemp = 700

	ai_holder_type = /datum/ai_holder/simple_mob/melee/evasive

//The names Cheese... Agent Cheese
/mob/living/simple_mob/animal/passive/mouse/operative/agent_cheese
	name = "Agent Cheese"
	desc = "I like my cheese Swiss... not American."

/mob/living/simple_mob/animal/passive/mouse/operative/agent_cheese/New()
	..()
	// Change my name back, don't want to be named agent_cheese (666)
	name = initial(name)

// Mouse noises
/datum/say_list/mouse
	speak = list("Squeek!","SQUEEK!","Squeek?")
	emote_hear = list("squeeks","squeaks","squiks")
	emote_see = list("runs in a circle", "shakes", "scritches at something")

// CHOMPAdd - Verb for mice colour changing
/mob/living/simple_mob/animal/passive/mouse/verb/set_mouse_colour()
	set name = "Set Mouse Colour"
	set category = "Abilities"
	set desc = "Set the colour of your mouse."
	var/new_mouse_colour = tgui_input_list(usr, "Set Mouse Colour", "Pick a colour", list("brown","gray","white","black"))
	if(!new_mouse_colour) return
	icon_state = resting ? "mouse_[new_mouse_colour]_sleep" : "mouse_[new_mouse_colour]"
	item_state = "mouse_[new_mouse_colour]"
	icon_living = "mouse_[new_mouse_colour]"
	icon_dead = "mouse_[new_mouse_colour]_dead"
	icon_rest = "mouse_[new_mouse_colour]_sleep"
	desc = "A small [new_mouse_colour] rodent, often seen hiding in maintenance areas and making a nuisance of itself."
	holder_type = text2path("/obj/item/weapon/holder/mouse/[new_mouse_colour]")
	to_chat(src, SPAN_NOTICE("You are now a [new_mouse_colour] mouse!"))
	verbs -= /mob/living/simple_mob/animal/passive/mouse/verb/set_mouse_colour
// CHOMPAdd End
