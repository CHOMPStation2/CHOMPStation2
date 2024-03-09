/mob/observer/dead/Logout()
	..()
	spawn(0)
		if(src && !key)	//we've transferred to another mob. This ghost should be deleted.
			qdel(src)
		else
<<<<<<< HEAD
			if(mind && mind.assigned_role) //CHOMPEdit
				return //CHOMPEdit
=======
>>>>>>> cc05d51b69... Garbage collection, asset delivery, icon2html revolution, and general fixes (515) (#15739)
			cleanup_timer = QDEL_IN_STOPPABLE(src, 10 MINUTES)
