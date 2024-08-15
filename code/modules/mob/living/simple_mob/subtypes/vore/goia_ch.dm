/mob/living/simple_mob/vore/zorgoia
	name = "zorgoia"
	desc = "It's a a reptilian mammal hybrid, known for its voracious nature and love for fruits. By more popular terms its referred to as the furry slinky!"
	tt_desc = "Zorgoyuh slinkus"
	icon = 'modular_chomp/icons/mob/zorgoia64x32.dmi' //We use the new modular ones now
	icon_state = null //Overlay system will make the goias
	icon_living = null
	icon_rest = null
	icon_dead = "zorgoia-death"
	faction = "zorgoia"
	maxHealth = 150 //chonk
	health = 150
	melee_damage_lower = 5
	melee_damage_upper = 15 //Don't break my bones bro
	see_in_dark = 5
	response_help = "pets"
	response_disarm = "bops"
	response_harm = "hits"
	attacktext = list("mauled")
	friendly = list("nuzzles", "noses softly at", "noseboops", "headbumps against", "nibbles affectionately on")
	meat_amount = 5
	has_eye_glow = TRUE //(evil)

	old_x = 0
	old_y = 0
	default_pixel_x = 0
	pixel_x = 0
	pixel_y = 0

	max_buckled_mobs = 1 //Yeehaw
	can_buckle = TRUE
	buckle_movable = TRUE
	buckle_lying = FALSE
	mount_offset_y = 10

	ai_holder_type = /datum/ai_holder/simple_mob/melee/evasive/zorgoia
	var/mob/living/carbon/human/friend
	var/tamed = 0
	var/tame_chance = 50 //It's a fiddy-fiddy default you may get a buddy pal or you may get mauled and ate. Win-win!

	color = null //color is selected when spawned

	vore_active = 1
	vore_capacity = 3
	vore_icons = 0 //The icon system down there handles the vore belly
	vore_pounce_chance = 35
	vore_bump_chance = 25
	vore_icons = SA_ICON_LIVING | SA_ICON_REST
	vore_stomach_name = "stomach" //Might make a better vore text but have this one for now.
	vore_stomach_flavor = "You find yourself greedily gulped down into the zorgoia's stomach; the walls are surprisingly roomy in comparison to other critters of this size as their stomach makes up a majority of their long noodle shaped body. Your body contorting with the zorgoias long shape as every inch of you is tightly bound by their glowy walls."
	vore_default_contamination_flavor = "Acrid"
	vore_default_item_mode = IM_DIGEST


	can_be_drop_prey = FALSE
	allow_mind_transfer = TRUE
	species_sounds = "None"
	pain_emote_1p = list("yelp", "whine", "bark", "growl")
	pain_emote_3p = list("yelps", "whines", "barks", "growls")

	//This is copypastad from protean code, hope it isnt too painful lol
	var/list/goia_overlays = list( //all 10 overlays, in order
		"zorgoia_belly" = "#FFFFFF",
		"zorgoia_main" = "#FFFFFF",
		"zorgoia_ears" = "#FFFFFF",
		"zorgoia_spots" = "#FFFFFF",
		"zorgoia_claws" = "#FFFFFF",
		"zorgoia_spikes" = "#FFFFFF",
		"zorgoia_fluff" = "#FFFFFF",
		"zorgoia_underbelly" = "#FFFFFF",
		"zorgoia_eyes" = "#FFFFFF",
		"zorgoia_spike" = "#FFFFFF"
	)

/mob/living/simple_mob/vore/zorgoia/proc/recolor() //Base sprite wont need a radical menu selection
	set name = "Change Color"
	set desc = "Change your main color."
	set category = "Abilities.General"
	var/new_color = input("Pick new colors:","Color", goia_overlays[2]) as null|color
	if(!new_color)
		return 0
	goia_overlays[goia_overlays[2]] = new_color
	update_icon()

/mob/living/simple_mob/vore/zorgoia/proc/appearance_switch() //This is just copypastas of the radial menu code, each block of code is the options for each bit of customisation... all 9 of them
	set name = "Adjust Mob Markings"
	set desc = "Change your markings and mob colors."
	set category = "Abilities.General"

	var/list/options = list("Belly","Spike","Ears","Spots","Claws","Spines","Fluff","Underbelly","Eyes")
	for(var/option in options)
		LAZYSET(options, option, image('modular_chomp/icons/effects/goia_labels.dmi', option))
	var/choice = show_radial_menu(src, src, options, radius = 60)
	if(!choice || QDELETED(src) || src.incapacitated())
		return FALSE
	. = TRUE
	var/list/belly_styles = list(
		"zorgoia_belly"
	)
	var/list/spiky_styles = list(
		"zorgoia_spike"
	)
	var/list/ear_styles = list(
		"null",
		"zorgoia_ears",
		"zorgoia_ears2"
	)
	var/list/spots_styles = list(
		"null",
		"zorgoia_spots",
		"zorgoia_stripes"
	)
	var/list/claws_styles = list(
		"null",
		"zorgoia_claws",
	)
	var/list/spines_styles = list(
		"null",
		"zorgoia_spines"
	)
	var/list/fluff_styles = list(
		"null",
		"zorgoia_fluff"
	)
	var/list/underbelly_styles = list(
		"zorgoia_underbelly",
		"null"
	)
	var/list/eyes_styles = list(
		"zorgoia_eyes"
	)
	switch(choice)
		if("Belly")
			options = belly_styles
			for(var/option in options)
				var/image/I = image('modular_chomp/icons/mob/zorgoia64x32.dmi', option, dir = 4)
				LAZYSET(options, option, I)
			choice = show_radial_menu(src, src, options, radius = 90)
			if(!choice || QDELETED(src) || src.incapacitated())
				return 0
			var/new_color = input("Pick belly color:","Belly Color", goia_overlays[1]) as null|color
			if(!new_color)
				return 0
			goia_overlays[1] = choice
			goia_overlays[goia_overlays[1]] = new_color
			update_icon()

		if("Spike")
			options = spiky_styles
			for(var/option in options)
				var/image/I = image('modular_chomp/icons/mob/zorgoia64x32.dmi', option, dir = 4)
				LAZYSET(options, option, I)
			choice = show_radial_menu(src, src, options, radius = 90)
			if(!choice || QDELETED(src) || src.incapacitated())
				return 0
			var/new_color = input("Pick tail spike color:","Tail Color", goia_overlays[10]) as null|color //This is overlay 10, not 2, swapped with main body, im not rewriting this array
			if(!new_color)
				return 0
			goia_overlays[10] = choice
			goia_overlays[goia_overlays[10]] = new_color
			update_icon()


		if("Ears")
			options = ear_styles
			for(var/option in options)
				var/image/I = image('modular_chomp/icons/mob/zorgoia64x32.dmi', option, dir = 4, pixel_x = -16)
				LAZYSET(options, option, I)
			choice = show_radial_menu(src, src, options, radius = 90)
			if(!choice || QDELETED(src) || src.incapacitated())
				return 0
			var/new_color = input("Pick ears spike color:","Ears Color", goia_overlays[3]) as null|color
			if(!new_color)
				return 0
			goia_overlays[3] = choice
			goia_overlays[goia_overlays[3]] = new_color
			update_icon()

		if("Spots")
			options = spots_styles
			for(var/option in options)
				var/image/I = image('modular_chomp/icons/mob/zorgoia64x32.dmi', option, dir = 4, pixel_x = -16)
				LAZYSET(options, option, I)
			choice = show_radial_menu(src, src, options, radius = 90)
			if(!choice || QDELETED(src) || src.incapacitated())
				return 0
			var/new_color = input("Pick spot colors:","Spots Color", goia_overlays[4]) as null|color
			if(!new_color)
				return 0
			goia_overlays[4] = choice
			goia_overlays[goia_overlays[4]] = new_color
			update_icon()

		if("Claws")
			options = claws_styles
			for(var/option in options)
				var/image/I = image('modular_chomp/icons/mob/zorgoia64x32.dmi', option, dir = 4, pixel_x = -16)
				LAZYSET(options, option, I)
			choice = show_radial_menu(src, src, options, radius = 90)
			if(!choice || QDELETED(src) || src.incapacitated())
				return 0
			var/new_color = input("Pick claw colors:","Claws Color", goia_overlays[5]) as null|color
			if(!new_color)
				return 0
			goia_overlays[5] = choice
			goia_overlays[goia_overlays[5]] = new_color
			update_icon()

		if("Spines")
			options = spines_styles
			for(var/option in options)
				var/image/I = image('modular_chomp/icons/mob/zorgoia64x32.dmi', option, dir = 4, pixel_x = -16)
				LAZYSET(options, option, I)
			choice = show_radial_menu(src, src, options, radius = 90)
			if(!choice || QDELETED(src) || src.incapacitated())
				return 0
			var/new_color = input("Pick spines colors:","Spines Color", goia_overlays[6]) as null|color
			if(!new_color)
				return 0
			goia_overlays[6] = choice
			goia_overlays[goia_overlays[6]] = new_color
			update_icon()

		if("Fluff")
			options = fluff_styles
			for(var/option in options)
				var/image/I = image('modular_chomp/icons/mob/zorgoia64x32.dmi', option, dir = 4, pixel_x = -16)
				LAZYSET(options, option, I)
			choice = show_radial_menu(src, src, options, radius = 90)
			if(!choice || QDELETED(src) || src.incapacitated())
				return 0
			var/new_color = input("Pick fluff colors:","Fluff Color", goia_overlays[7]) as null|color
			if(!new_color)
				return 0
			goia_overlays[7] = choice
			goia_overlays[goia_overlays[7]] = new_color
			update_icon()

		if("Underbelly")
			options = underbelly_styles
			for(var/option in options)
				var/image/I = image('modular_chomp/icons/mob/zorgoia64x32.dmi', option, dir = 4, pixel_x = -16)
				LAZYSET(options, option, I)
			choice = show_radial_menu(src, src, options, radius = 90)
			if(!choice || QDELETED(src) || src.incapacitated())
				return 0
			var/new_color = input("Pick underbelly colors:","Underbelly Color", goia_overlays[4]) as null|color
			if(!new_color)
				return 0
			goia_overlays[8] = choice
			goia_overlays[goia_overlays[8]] = new_color
			update_icon()

		if("Eyes")
			options = eyes_styles
			for(var/option in options)
				var/image/I = image('modular_chomp/icons/mob/zorgoia64x32.dmi', option, dir = 4, pixel_x = -16)
				LAZYSET(options, option, I)
			choice = show_radial_menu(src, src, options, radius = 90)
			if(!choice || QDELETED(src) || src.incapacitated())
				return 0
			var/new_color = input("Pick eye color:","Eye Color", goia_overlays[9]) as null|color
			if(!new_color)
				return 0
			goia_overlays[9] = choice
			goia_overlays[goia_overlays[9]] = new_color
			update_icon()
		else



/mob/living/simple_mob/vore/zorgoia/Initialize()
	..()
	update_icon()
	add_verb(src,/mob/living/simple_mob/vore/zorgoia/proc/appearance_switch)
	add_verb(src,/mob/living/simple_mob/vore/zorgoia/proc/recolor)
	add_verb(src,/mob/living/proc/injection) //Poison sting c:
	src.trait_injection_reagents += "microcillin"		// get small
	src.trait_injection_reagents += "macrocillin"		// get BIG
	src.trait_injection_reagents += "normalcillin"	// normal
	src.trait_injection_reagents += "numbenzyme"		// no feelings
	src.trait_injection_reagents += "androrovir" 		// -> MALE
	src.trait_injection_reagents += "gynorovir" 		// -> FEMALE
	src.trait_injection_reagents += "androgynorovir" 	// -> PLURAL
	src.trait_injection_reagents += "stoxin"			// night night chem
	src.trait_injection_reagents += "rainbowtoxin" 	// Funny flashing lights.
	src.trait_injection_reagents += "paralysistoxin" 	// Paralysis!
	src.trait_injection_reagents += "painenzyme"		// Pain INCREASER
	src.trait_injection_reagents += "aphrodisiac"		// Horni

/mob/living/simple_mob/vore/zorgoia/update_icon()
	..()
	if(stat == DEAD)
		icon_state = "zorgoia-death"
		plane = MOB_LAYER
		return
	cut_overlays()
	icon = 'modular_chomp/icons/mob/zorgoia64x32.dmi'
	vore_capacity = 3
	//Heads up, the order of these overlays stacking on top of each other is different from the array order. So goia_overlay[1] is the belly, but rendering on top of everything at the end instead

	var/image/I = image(icon, "[goia_overlays[2]][resting? "-rest" : null]", pixel_x = -16)
	I.color = goia_overlays[goia_overlays[2]]
	I.appearance_flags |= (RESET_COLOR|PIXEL_SCALE)
	I.plane = MOB_PLANE
	I.layer = MOB_LAYER
	add_overlay(I)
	qdel(I)

	I = image(icon, "[goia_overlays[3]][resting? "-rest" : null]", pixel_x = -16)
	I.color = goia_overlays[goia_overlays[3]]
	I.appearance_flags |= (RESET_COLOR|PIXEL_SCALE)
	I.plane = MOB_PLANE
	I.layer = MOB_LAYER
	add_overlay(I)
	qdel(I)

	I = image(icon, "[goia_overlays[4]][resting? "-rest" : null]", pixel_x = -16)
	I.color = goia_overlays[goia_overlays[4]]
	I.appearance_flags |= (RESET_COLOR|PIXEL_SCALE)
	I.plane = MOB_PLANE
	I.layer = MOB_LAYER
	add_overlay(I)
	qdel(I)

	I = image(icon, "[goia_overlays[5]][resting? "-rest" : null]", pixel_x = -16)
	I.color = goia_overlays[goia_overlays[5]]
	I.appearance_flags |= (RESET_COLOR|PIXEL_SCALE)
	I.plane = MOB_PLANE
	I.layer = MOB_LAYER
	add_overlay(I)
	qdel(I)

	I = image(icon, "[goia_overlays[6]][resting? "-rest" : null]", pixel_x = -16)
	I.color = goia_overlays[goia_overlays[6]]
	I.appearance_flags |= (RESET_COLOR|PIXEL_SCALE)
	I.plane = MOB_PLANE
	I.layer = MOB_LAYER
	add_overlay(I)
	qdel(I)

	I = image(icon, "[goia_overlays[7]][resting? "-rest" : null]", pixel_x = -16)
	I.color = goia_overlays[goia_overlays[7]]
	I.appearance_flags |= (RESET_COLOR|PIXEL_SCALE)
	I.plane = MOB_PLANE
	I.layer = MOB_LAYER
	add_overlay(I)
	qdel(I)

	I = image(icon, "[goia_overlays[8]][resting? "-rest" : null]", pixel_x = -16)
	I.color = goia_overlays[goia_overlays[8]]
	I.appearance_flags |= (RESET_COLOR|PIXEL_SCALE)
	I.plane = MOB_PLANE
	I.layer = MOB_LAYER
	add_overlay(I)
	qdel(I)

	I = image(icon, "[goia_overlays[9]][resting? "-rest" : null]", pixel_x = -16)
	I.color = goia_overlays[goia_overlays[9]]
	I.appearance_flags |= (RESET_COLOR|PIXEL_SCALE)
	I.plane = PLANE_LIGHTING_ABOVE
	add_overlay(I)
	qdel(I)

	I = image(icon, "[goia_overlays[10]][resting? "-rest" : null]", pixel_x = -16)
	I.color = goia_overlays[goia_overlays[10]]
	I.appearance_flags |= (RESET_COLOR|PIXEL_SCALE)
	I.plane = MOB_PLANE
	I.layer = MOB_LAYER
	add_overlay(I)
	qdel(I)

	I = image(icon, "[goia_overlays[1]][resting? "-rest" : (vore_fullness? "-[vore_fullness]" : null)]", pixel_x = -16) //todo, check kasscs resting sprite
	I.color = goia_overlays[goia_overlays[1]]
	I.appearance_flags |= (RESET_COLOR|PIXEL_SCALE)
	I.plane = MOB_PLANE
	I.layer = MOB_LAYER
	add_overlay(I)
	qdel(I)

/mob/living/simple_mob/vore/zorgoia/attack_hand(mob/living/carbon/human/M as mob)

	switch(M.a_intent)
		if(I_HELP)
			if(health > 0)
				if(M.zone_sel.selecting == BP_GROIN)
					if(M.vore_bellyrub(src))
						return
				M.visible_message("<span class='notice'>[M] [response_help] \the [src].</span>")
				if(has_AI())
					var/datum/ai_holder/AI = ai_holder
					AI.set_stance(STANCE_IDLE)
					if(prob(tame_chance))
						AI.violent_breakthrough = FALSE
						AI.hostile = FALSE
						friend = M
						AI.set_follow(friend)
						if(tamed != 1)
							tamed = 1
							faction = M.faction
					sleep(1 SECOND)

		if(I_GRAB)
			if(health > 0)
				if(has_AI())
					var/datum/ai_holder/AI = ai_holder
					audible_emote("growls disapprovingly at [M].")
					if(M == friend)
						AI.lose_follow()
						friend = null
				return
			else
				..()

		else
			..()

/mob/living/simple_mob/vore/zorgoia/Login()
	. = ..()
	if(!riding_datum)
		riding_datum = new /datum/riding/simple_mob(src)
	add_verb(src,/mob/living/simple_mob/proc/animal_mount)
	add_verb(src,/mob/living/proc/toggle_rider_reins)
	movement_cooldown = 0

/mob/living/simple_mob/vore/zorgoia/MouseDrop_T(mob/living/M, mob/living/user)
	return

/mob/living/simple_mob/vore/zorgoia/death() //are they going to be ok?
	. = ..()
	cut_overlays()

/mob/living/simple_mob/vore/zorgoia/tamed
	tamed = TRUE

/datum/ai_holder/simple_mob/melee/evasive/zorgoia

/datum/ai_holder/simple_mob/melee/evasive/zorgoia/New(var/mob/living/simple_mob/vore/zorgoia/new_holder)
	.=..()
	if(new_holder.tamed)
		hostile = FALSE
