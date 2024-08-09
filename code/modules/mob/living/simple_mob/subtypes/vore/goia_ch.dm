/mob/living/simple_mob/vore/otie/zorgoia //Yes im basing the goias on oties for now, sue me....please dont sue me - Jack
	name = "zorgoia"
	desc = "It's a a reptilian mammal hybrid, known for its voracious nature and love for fruits. By more popular terms its refered to as the furry slinky!"
	tt_desc = "Zorgoyuh slinkus"
	icon = 'modular_chomp/icons/mob/zorgoia64x32.dmi' //We use the new modular ones now
	icon_state = null //Overlay system will make the goias
	icon_living = null
	icon_rest = null
	icon_dead = "zorgoia-dead"
	faction = "zorgoia"
	maxHealth = 250 //chonk
	health = 250
	melee_damage_lower = 5
	melee_damage_upper = 15 //Don't break my bones bro
	see_in_dark = 5
	attacktext = list("mauled")
	friendly = list("nuzzles", "noses softly at", "noseboops", "headbumps against", "nibbles affectionately on")
	meat_amount = 5

	color = null //color is selected when spawned

	max_buckled_mobs = 0 //No Yeehaw
	can_buckle = FALSE
	buckle_movable = FALSE

	//say_list_type = /datum/say_list/zorgoia
	vore_active = 1
	vore_capacity = 3
	vore_icons = 0 //The icon system down there handles the vore belly
	vore_pounce_chance = 35
	vore_icons = SA_ICON_LIVING | SA_ICON_REST

	// CHOMPAdd: Don't think its checked, but just in case
	species_sounds = "None"
	pain_emote_1p = list("yelp", "whine", "bark", "growl")
	pain_emote_3p = list("yelps", "whines", "barks", "growls")

	//This is copypastad from protean code, hope it isnt too painful lol
	var/list/goia_overlays = list(
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

/mob/living/simple_mob/vore/otie/zorgoia/proc/appearance_switch()
	set name = "Adjust Mob Markings"
	set desc = "Change your markings and mob colors."
	set category = "Abilities.General"

	var/list/options = list("Belly","Spike","Ears","Spots","Claws","Spines","Fluff","Underbelly","Eyes")
	for(var/option in options)
		LAZYSET(options, option, image('icons/effects/bigdragon_labels.dmi', option))
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
		"zorgoia_ears"
	)
	var/list/spots_styles = list(
		"zorgoia_spots",
		"zorgoia_stripes",
		"null"
	)
	var/list/claws_styles = list(
		"zorgoia_claws",
		"null"
	)
	var/list/spines_styles = list(
		"zorgoia_spines",
		"null"
	)
	var/list/fluff_styles = list(
		"zorgoia_fluff",
		"null"
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
		else



/mob/living/simple_mob/vore/otie/zorgoia/Initialize()
	..()
	update_icon()
	add_verb(src,/mob/living/simple_mob/vore/otie/zorgoia/proc/appearance_switch)

/mob/living/simple_mob/vore/otie/zorgoia/update_icon()
	..()
	cut_overlays()
	icon = 'modular_chomp/icons/mob/zorgoia64x32.dmi'
	vore_capacity = 3
	var/image/I = image(icon, "[goia_overlays[1]][resting? "-rest" : (vore_fullness? "-[vore_fullness]" : null)]") //todo, check kasscs resting sprite
	I.color = goia_overlays[goia_overlays[1]]
	I.appearance_flags |= (RESET_COLOR|PIXEL_SCALE)
	I.plane = MOB_PLANE
	I.layer = MOB_LAYER
	add_overlay(I)
	qdel(I)

	I = image(icon, "[goia_overlays[2]][resting? "-rest" : null]")
	I.color = goia_overlays[goia_overlays[2]]
	I.appearance_flags |= (RESET_COLOR|PIXEL_SCALE)
	I.plane = MOB_PLANE
	I.layer = MOB_LAYER
	add_overlay(I)
	qdel(I)

	I = image(icon, "[goia_overlays[3]][resting? "-rest" : null]")
	I.color = goia_overlays[goia_overlays[3]]
	I.appearance_flags |= (RESET_COLOR|PIXEL_SCALE)
	I.plane = MOB_PLANE
	I.layer = MOB_LAYER
	add_overlay(I)
	qdel(I)

	I = image(icon, "[goia_overlays[4]][resting? "-rest" : null]")
	I.color = goia_overlays[goia_overlays[4]]
	I.appearance_flags |= (RESET_COLOR|PIXEL_SCALE)
	I.plane = MOB_PLANE
	I.layer = MOB_LAYER
	add_overlay(I)
	qdel(I)

	I = image(icon, "[goia_overlays[5]][resting? "-rest" : null]")
	I.color = goia_overlays[goia_overlays[5]]
	I.appearance_flags |= (RESET_COLOR|PIXEL_SCALE)
	I.plane = MOB_PLANE
	I.layer = MOB_LAYER
	add_overlay(I)
	qdel(I)

	I = image(icon, "[goia_overlays[6]][resting? "-rest" : null]")
	I.color = goia_overlays[goia_overlays[6]]
	I.appearance_flags |= (RESET_COLOR|PIXEL_SCALE)
	I.plane = MOB_PLANE
	I.layer = MOB_LAYER
	add_overlay(I)
	qdel(I)

	I = image(icon, "[goia_overlays[7]][resting? "-rest" : null]")
	I.color = goia_overlays[goia_overlays[7]]
	I.appearance_flags |= (RESET_COLOR|PIXEL_SCALE)
	I.plane = MOB_PLANE
	I.layer = MOB_LAYER
	add_overlay(I)
	qdel(I)

	I = image(icon, "[goia_overlays[8]][resting? "-rest" : null]")
	I.color = goia_overlays[goia_overlays[8]]
	I.appearance_flags |= (RESET_COLOR|PIXEL_SCALE)
	I.plane = MOB_PLANE
	I.layer = MOB_LAYER
	add_overlay(I)
	qdel(I)

	I = image(icon, "[goia_overlays[9]][resting? "-rest" : null]")
	I.color = goia_overlays[goia_overlays[9]]
	I.appearance_flags |= (RESET_COLOR|PIXEL_SCALE)
	I.plane = PLANE_LIGHTING_ABOVE
	add_overlay(I)
	qdel(I)

	I = image(icon, "[goia_overlays[10]][resting? "-rest" : null]")
	I.color = goia_overlays[goia_overlays[10]]
	I.appearance_flags |= (RESET_COLOR|PIXEL_SCALE)
	I.plane = MOB_PLANE
	I.layer = MOB_LAYER
	add_overlay(I)
	qdel(I)
