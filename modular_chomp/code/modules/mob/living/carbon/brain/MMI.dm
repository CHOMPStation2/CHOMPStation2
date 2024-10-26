/obj/item/mmi
	var/mob/living/body_backup = null //add reforming

/obj/item/mmi/Destroy()
	if(body_backup)
		qdel(body_backup)
	..()
