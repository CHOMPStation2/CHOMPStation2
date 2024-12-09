/mob/living/simple_mob
	var/picked_color = FALSE
	var/picked_size = FALSE

/mob/living/simple_mob/Login()
	. = ..()
	add_verb(src,/mob/living/simple_mob/proc/pick_size) //CHOMPEdit TGPanel

/mob/living/simple_mob/proc/pick_size()
	set name = "Pick Size"
	set category = "Abilities.Settings"

	if(picked_size)
		to_chat(src, span_notice("You have already picked a size! If you picked the wrong size, ask an admin to change your picked_size variable to 0."))
		return
	if(!resizable)
		to_chat(src, span_warning("You are immune to resizing!"))
		return

	var/nagmessage = "Pick a size between 25 to 200%. (Only usable once!)"
	var/new_size = input(nagmessage, "Pick a Size") as num|null
	if(size_range_check(new_size))
		resize(new_size/100, uncapped = has_large_resize_bounds(), ignore_prefs = TRUE)
		picked_size = TRUE
		if(temporary_form)	//resizing both our forms
			var/mob/living/L = temporary_form
			L.resize(new_size/100, uncapped = has_large_resize_bounds(), ignore_prefs = TRUE)

/mob/living/simple_mob/proc/pick_color()
	set name = "Pick Color"
	set category = "Abilities.Settings"
	set desc = "You can set your color!"
	if(picked_color)
		to_chat(src, span_notice("You have already picked a color! If you picked the wrong color, ask an admin to change your picked_color variable to 0."))
		return
	var/newcolor = input(usr, "Choose a color.", "", color) as color|null
	if(newcolor)
		color = newcolor
	picked_color = TRUE
	update_icon()
