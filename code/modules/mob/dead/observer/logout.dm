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
>>>>>>> 7c8bb85de3... Whitespace Standardization [MDB IGNORE] (#15748)
			cleanup_timer = QDEL_IN(src, 10 MINUTES)
