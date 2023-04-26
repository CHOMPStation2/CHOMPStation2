/mob/observer
	var/mob/living/body_backup = null //add reforming
	low_priority = TRUE

/mob/observer/Destroy()
	if(body_backup)
		qdel(body_backup)
	..()
