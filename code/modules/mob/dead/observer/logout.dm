/mob/observer/dead/Logout()
	..()
	spawn(0)
		if(src && !key)	//we've transferred to another mob. This ghost should be deleted.
			qdel(src)
		else
<<<<<<< HEAD
			if(mind && mind.assigned_role) //CHOMPEdit
				return //CHOMPEdit
			cleanup_timer = QDEL_IN_STOPPABLE(src, 10 MINUTES)
=======
			cleanup_timer = QDEL_IN(src, 10 MINUTES)
>>>>>>> f6d0f62622... Revert "Garbage collection, asset delivery, icon2html revolution, and general…" (#15815)
