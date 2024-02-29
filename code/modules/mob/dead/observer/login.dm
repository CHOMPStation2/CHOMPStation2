//Nobody here anymore.
/mob/observer/dead/Login()
	..() //Creates the plane_holder lazily
	plane_holder.set_vis(VIS_GHOSTS, ghostvision)
	plane_holder.set_vis(VIS_FULLBRIGHT, !seedarkness)
	plane_holder.set_vis(VIS_CLOAKED, TRUE)
	plane_holder.set_vis(VIS_AI_EYE, TRUE)
	plane_holder.set_vis(VIS_AUGMENTED, TRUE) //VOREStation Add - GHOST VISION IS AUGMENTED
	plane = PLANE_GHOSTS
	if(cleanup_timer)
		deltimer(cleanup_timer)
		cleanup_timer = null

	//Reassert these due to the mob being cached
	//mob/Login() resets the invisibility/sight/plane stuff
	invisibility = INVISIBILITY_OBSERVER
	layer = BELOW_MOB_LAYER
	plane = PLANE_GHOSTS
	alpha = 127

	sight |= SEE_TURFS | SEE_MOBS | SEE_OBJS | SEE_SELF
	see_invisible = SEE_INVISIBLE_OBSERVER
	see_in_dark = world.view //I mean. I don't even know if byond has occlusion culling... but...

/mob/observer/dead/summon_actions()
	. = ..()
	//ghost floaty anim
	animate(src, pixel_y = 2, time = 10, loop = -1)
	animate(pixel_y = default_pixel_y, time = 10, loop = -1)
	observer_mob_list |= src

/mob/observer/dead/dismiss_actions()
	. = ..()
	//atop any animations
	animate(src)

	//cancel any followers
	if(ismob(following))
		var/mob/M = following
		M.following_mobs -= src
	stop_following()
	observer_mob_list -= src
