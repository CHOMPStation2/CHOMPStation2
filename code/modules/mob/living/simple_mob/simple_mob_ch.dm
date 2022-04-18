/mob/living/simple_mob
	//vars for vore_icons toggle control
	var/vore_icons_toggle = 1 // on by default, as is legacy
	var/vore_icons_cache = 0 // 0 by default. Going from ON to OFF should store vore_icons val here.

mob/living/simple_mob/verb/toggle_vore_icons()

	set name = "Toggle Vore Sprite"
	set desc = "Toggle visibility of changed mob sprite when you have eaten other things."
	set category = "Abilities"

	if(!vore_icons && !vore_icons_cache)
		to_chat(src,"<span class='warning'>This simplemob has no vore sprite.</span>")
	else if(vore_icons_toggle)
		vore_icons_cache = vore_icons
		vore_icons = 0
		vore_icons_toggle = 0
		to_chat(src,"<span class='warning'>Vore sprite disabled.</span>")
	else
		vore_icons = vore_icons_cache
		vore_icons_toggle = 1
		to_chat(src,"<span class='warning'>Vore sprite enabled.</span>")

	update_icon()


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

