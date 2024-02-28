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
	invisibility = INVISIBILITY_OBSERVER
	layer = BELOW_MOB_LAYER
	plane = PLANE_GHOSTS
	alpha = 127

	sight |= SEE_TURFS | SEE_MOBS | SEE_OBJS | SEE_SELF
	see_invisible = SEE_INVISIBLE_OBSERVER
	see_in_dark = world.view //I mean. I don't even know if byond has occlusion culling... but...
