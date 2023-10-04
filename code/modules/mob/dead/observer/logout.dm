/mob/observer/dead/Logout()
	..()
	spawn(0)
		if(mind && mind.assigned_role) //CHOMPEdit
			return //CHOMPEdit
		if(src && !key)	//we've transferred to another mob. This ghost should be deleted.
			qdel(src)
		else
			cleanup_timer = QDEL_IN(src, 10 MINUTES)
