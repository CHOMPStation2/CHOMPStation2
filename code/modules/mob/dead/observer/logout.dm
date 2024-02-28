/mob/observer/dead/Logout()
	..()
	spawn(0)
		if(src && !ckey)	//we've transferred to another mob. This ghost should be deleted.
			dismiss_observer_dead(src)
		else
			if(mind && mind.assigned_role) //CHOMPEdit
				return //CHOMPEdit
			cleanup_timer = addtimer(CALLBACK(src, PROC_REF(timed_cleanup)), 10 MINUTES, TIMER_STOPPABLE)

/mob/observer/dead/proc/timed_cleanup() //returns TRUE if successful cleanup, FALSE if aborted
	if(src && !ckey)	//A key is still parked here
		log_and_message_admins("A cleaned up /mob/observer/dead magically lost it's key!")
	else
		if(mind && mind.assigned_role) //CHOMPEdit
			log_and_message_admins("A cleaned up /mob/observer/dead magically gained a mind with an assigned role!")
			return FALSE//CHOMPEdit
		var/mob/new_player/NP = get_newplayer(ckey)
		NP.ckey = ckey
	dismiss_observer_dead(src)
	return TRUE
