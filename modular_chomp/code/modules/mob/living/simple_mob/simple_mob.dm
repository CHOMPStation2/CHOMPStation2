/mob/living/simple_mob
	//speech sounds
	var/list/speech_sounds = list()
	var/speech_chance = 75 //mobs can be a bit more emotive than carbon/humans
	var/speech_sound_enabled = TRUE

	//vars for vore_icons toggle control
	var/vore_icons_cache = null // null by default. Going from ON to OFF should store vore_icons val here, OFF to ON reset as null

	//spitting projectiles
	var/spitting = 0
	var/spit_projectile = null // what our spit projectile is. Can be anything

	//no stripping of simplemobs
	strip_pref = FALSE

/mob/living/simple_mob/RangedAttack(var/atom/A)
	if(!isnull(spit_projectile) && spitting)
		Spit(A)
	. = ..()

/mob/living/simple_mob/verb/toggle_vore_icons()

	set name = "Toggle Vore Sprite"
	set desc = "Toggle visibility of changed mob sprite when you have eaten other things."
	set category = "Abilities.Vore"

	if(!vore_icons && !vore_icons_cache)
		to_chat(src,"<span class='warning'>This simplemob has no vore sprite.</span>")
	else if(isnull(vore_icons_cache))
		vore_icons_cache = vore_icons
		vore_icons = 0
		to_chat(src,"<span class='warning'>Vore sprite disabled.</span>")
	else
		vore_icons = vore_icons_cache
		vore_icons_cache = null
		to_chat(src,"<span class='warning'>Vore sprite enabled.</span>")

	update_icon()

/mob/living/simple_mob/verb/toggle_speech_sounds()
	set name = "Toggle Species Speech Sounds"
	set desc = "Toggle if your species defined speech sound has a chance of playing on a Say"
	set category = "IC.Mob"

	if(stat)
		to_chat(src, "<span class='warning'>You must be awake and standing to perform this action!</span>")
		return

	speech_sound_enabled = !speech_sound_enabled
	to_chat(src, "You will [speech_sound_enabled ? "now" : "no longer"] have a chance to play your species defined speech sound on a Say.")

	return TRUE

/mob/living/simple_mob/handle_speech_sound()
	if(speech_sound_enabled && speech_sounds && speech_sounds.len && prob(speech_chance))
		var/list/returns[2]
		returns[1] = sound(pick(speech_sounds))
		returns[2] = 50
		return returns
	. = ..()

// a unique named update_transforms override to allow simplemobs going horizontal on lay/stun.
// This will not make the mob horizontal if the mob has a icon_rest != null
// To use this, add an override in your simplemob subtype of update_transforms with NO . = ..()
// Example:
// /mob/living/simple_mob/my_mob/update_transforms()
// 		update_transform_horizontal()

/mob/living/simple_mob/proc/update_transform_horizontal()
	// First, get the correct size.
	var/desired_scale_x = size_multiplier * icon_scale_x
	var/desired_scale_y = size_multiplier * icon_scale_y

	// Here we differ from mob/living/update_transforms()

	// Taking some data from the /carbon/human/update_transform() entry
	var/matrix/M = matrix()
	var/anim_time = 3

	// If we're wanting to lay and there is no icon_rest sprite assigned, then...
	if( ( (stat == UNCONSCIOUS) || resting || incapacitated(INCAPACITATION_DISABLED) ) && !icon_rest )

		var/randn = rand(1, 2)
		if(randn <= 1) // randomly choose a rotation
			M.Turn(-90)
		else
			M.Turn(90)
		M.Scale(desired_scale_x, desired_scale_y)
		M.Translate(1,-6)
		layer = MOB_LAYER -0.01 // Fix for a byond bug where turf entry order no longer matters
	else
		M.Scale(desired_scale_x, desired_scale_y)
		M.Translate(0, (vis_height/2)*(desired_scale_y-1))
		layer = MOB_LAYER

	// Animate instead of set. Original set left commented out
	// src.transform = M //VOREStation edit
	animate(src, transform = M, time = anim_time)

	// This from original living.dm update_transforms too
	handle_status_indicators()

/mob/living/simple_mob/proc/use_headset()
	set name = "Use Headset"
	set desc = "Opens your headset's GUI, if you have one."
	set category = "Abilities.Mob"

	if(istype(mob_radio, /obj/item/radio/headset))
		mob_radio.tgui_interact(src)
	else
		to_chat(src, "<span class='warning'>Your mob does not have a radio in its radio slot.</span>")

/mob/living/simple_mob/proc/use_pda()
	set name = "Use PDA"
	set desc = "Opens your PDA's GUI, if you have one."
	set category = "Abilities.Mob"

	if(istype(myid, /obj/item/pda))
		myid.tgui_interact(src)
	else
		to_chat(src, "<span class='warning'>Your mob does not have a PDA in its ID slot.</span>")

/mob/living/simple_mob/New(var/newloc)
	..()
	add_verb(src,/mob/living/simple_mob/proc/use_headset) //CHOMPEdit TGPanel
	add_verb(src,/mob/living/simple_mob/proc/use_pda) //CHOMPEdit TGPanel

/mob/living/simple_mob/update_icon()
	. = ..()
	for(var/belly_class in vore_fullness_ex)
		var/vs_fullness = vore_fullness_ex[belly_class]
		if(vs_fullness > 0)
			add_overlay("[icon_state]_[belly_class]-[vs_fullness]")

/mob/living/simple_mob/proc/character_directory_species()
	return "simplemob"
