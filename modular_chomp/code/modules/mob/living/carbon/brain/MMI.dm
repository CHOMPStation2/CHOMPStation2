/obj/item/device/mmi
	var/mob/living/body_backup = null //add reforming

/obj/item/device/mmi/Destroy()
	if(body_backup)
		qdel(body_backup)
	..()
