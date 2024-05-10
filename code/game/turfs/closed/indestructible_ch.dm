/turf/closed/indestructible
	name = "wall"
	desc = "Effectively impervious to conventional methods of destruction."
	icon = 'icons/turf/walls.dmi'
	//explosive_resistance = 50
/*
/turf/closed/indestructible/rust_heretic_act()
	return

/turf/closed/indestructible/TerraformTurf(path, new_baseturf, flags, defer_change = FALSE, ignore_air = FALSE)
	return

/turf/closed/indestructible/acid_act(acidpwr, acid_volume, acid_id)
	return FALSE
*/
/turf/closed/indestructible/melt()
	return

/turf/closed/indestructible/singularity_act()
	return

/turf/closed/indestructible/ex_act()
	return
/*
/turf/closed/indestructible/attackby(obj/item/attacking_item, mob/user, params)
	if(istype(attacking_item, /obj/item/poster) && Adjacent(user))
		return place_poster(attacking_item, user)

	return ..()
*/
//Splashscreen

/turf/closed/indestructible/splashscreen
	name = "Space Station 13"
	desc = null
	icon = 'icons/misc/loading.dmi'
	icon_state = "loading(old)"
	pixel_x = 0
	plane = PLANE_PLAYER_SPLASH

INITIALIZE_IMMEDIATE(/turf/closed/indestructible/splashscreen)

/turf/closed/indestructible/splashscreen/Initialize(mapload)
	. = ..()
	SStitle.splash_turf = src
	if(SStitle.icon)
		icon = SStitle.icon
		icon_state = SStitle.icon_state
		handle_generic_titlescreen_sizes()

///helper proc that will center the screen if the icon is changed to a generic width, to make admins have to fudge around with pixel_x less. returns null
/turf/closed/indestructible/splashscreen/proc/handle_generic_titlescreen_sizes()
	var/icon/size_check = icon(SStitle.icon, icon_state)
	var/width = size_check.Width()
	if(width == 480 || width == 500) // 480x480 is nonwidescreen
		pixel_x = 0
	else if(width == 608) // 608x480 is widescreen
		pixel_x = -64

/turf/closed/indestructible/splashscreen/vv_edit_var(var_name, var_value)
	. = ..()
	if(.)
		switch(var_name)
			if(NAMEOF(src, icon))
				SStitle.icon = icon
				handle_generic_titlescreen_sizes()

/turf/closed/indestructible/splashscreen/examine()
	//desc = pick(strings(SPLASH_FILE, "splashes"))
	return ..()

/turf/closed/indestructible/start_area
	name = null
	desc = null
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	icon_state = "0"
