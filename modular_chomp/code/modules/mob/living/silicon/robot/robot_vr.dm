
/mob/living/silicon/robot/updateicon() //TODO - Make the belly stuff resting sprite stuff into feature flags and replace dogborg var - 7/19/23
	vr_sprite_check()
	..()
	if(dogborg == TRUE && stat == CONSCIOUS)
		//update_fullness() // CHOMPEdit - Needed so that we can have the vore sprites when only using vore bellies
		//CHOMPEdit begin - Add multiple belly size support
		//Add a check when selecting an icon in robot.dm if you add in support for this, to set vore_capacity to 2 or however many states you have.
		var/fullness_extension = ""
		if(vore_capacity_ex["stomach"] > 1 && vore_fullness_ex["stomach"] > 1)
			fullness_extension = "_[vore_fullness_ex["stomach"]]"
		//CHOMPEdit end
		if(vore_selected.silicon_belly_overlay_preference == "Sleeper")
			if(sleeper_g == TRUE)
				add_overlay("[selected_icon]-sleeper_g")
			if(sleeper_r == TRUE || (!sleeper_g && vore_fullness_ex["stomach"])) //CHOMPEdit - Also allow normal vore bellies to affect this sprite
				add_overlay("[selected_icon]-sleeper_r[fullness_extension]") //CHOMPEdit - Allow multiple belly sizes...
		else if(vore_selected.silicon_belly_overlay_preference == "Vorebelly")
			if(LAZYLEN(vore_selected.contents) >= vore_selected.visible_belly_minimum_prey)
				if(vore_selected.overlay_min_prey_size == 0)	//if min size is 0, we dont check for size
					add_overlay("[selected_icon]-sleeper_r")
				else
					var/show_belly = FALSE
					if(vore_selected.override_min_prey_size && (LAZYLEN(vore_selected.contents) > vore_selected.override_min_prey_num))
						show_belly = TRUE	//Override regardless of content size
					else
						for(var/content in vore_selected.contents)	//If ANY in belly are big enough, we set to true
							if(!istype(content, /mob/living)) continue
							var/mob/living/prey = content
							if(prey.size_multiplier >= vore_selected.overlay_min_prey_size)
								show_belly = TRUE
								break
					if(show_belly)
						add_overlay("[selected_icon]-sleeper_r")

		if(istype(module_active,/obj/item/weapon/gun/energy/laser/mounted))
			add_overlay("laser")
		if(istype(module_active,/obj/item/weapon/gun/energy/taser/mounted/cyborg))
			add_overlay("taser")
		if(lights_on)
			add_overlay("eyes-[selected_icon]-lights")
		if(resting)
			cut_overlays() // Hide that gut for it has no ground sprite yo.
			if(sitting)
				icon_state = "[selected_icon]-sit"
				//CHOMPEdit Begin - Add ability to have sleeper belly sprites if available
				if(sleeper_resting && sleeper_g == TRUE)
					add_overlay("[selected_icon]-sleeper_g-sit")
				if(sleeper_resting && (sleeper_r == TRUE || (!sleeper_g && vore_fullness_ex["stomach"])))
					add_overlay("[selected_icon]-sleeper_r-sit[fullness_extension]")
				//CHOMPEdit End
			if(bellyup)
				icon_state = "[selected_icon]-bellyup"
				//CHOMPEdit Begin - Add ability to have sleeper belly sprites if available
				if(sleeper_resting && sleeper_g == TRUE)
					add_overlay("[selected_icon]-sleeper_g-bellyup")
				if(sleeper_resting && (sleeper_r == TRUE || (!sleeper_g && vore_fullness_ex["stomach"])))
					add_overlay("[selected_icon]-sleeper_r-bellyup[fullness_extension]")
				//CHOMPEdit End
			else if(!sitting && !bellyup)
				icon_state = "[selected_icon]-rest"
				//CHOMPEdit Begin - Add ability to have sleeper belly sprites if available
				if(sleeper_resting && sleeper_g == TRUE)
					add_overlay("[selected_icon]-sleeper_g-rest")
				if(sleeper_resting && (sleeper_r == TRUE || (!sleeper_g && vore_fullness_ex["stomach"])))
					add_overlay("[selected_icon]-sleeper_r-rest[fullness_extension]")
				//CHOMPEdit End
		else
			icon_state = "[selected_icon]"
	if(dogborg == TRUE && stat == DEAD)
		icon_state = "[selected_icon]-wreck"
		add_overlay("wreck-overlay")

/mob/living/silicon/robot/proc/vr_sprite_check()
	icon = module_sprites[icontype][SKIN_ICON]
	if (isnull(module_sprites[icontype][SKIN_OFFSET]))
		pixel_x = 0
		old_x = 0
		default_pixel_x = 0
	else
		pixel_x = module_sprites[icontype][SKIN_OFFSET]
		old_x = module_sprites[icontype][SKIN_OFFSET]
		default_pixel_x = module_sprites[icontype][SKIN_OFFSET]

	if (isnull(module_sprites[icontype][SKIN_HEIGHT]))
		vis_height = 32
	else if (vis_height != module_sprites[icontype][SKIN_HEIGHT])
		vis_height = module_sprites[icontype][SKIN_HEIGHT]
		update_transform()
