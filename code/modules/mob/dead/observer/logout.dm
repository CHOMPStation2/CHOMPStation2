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
>>>>>>> c7b6c3e42b... Revert "Revert "Garbage collection, asset delivery, icon2html revolution, and…" (#15816)
			cleanup_timer = QDEL_IN_STOPPABLE(src, 10 MINUTES)
