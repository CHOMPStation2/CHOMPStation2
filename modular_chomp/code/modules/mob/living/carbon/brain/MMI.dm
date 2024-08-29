/obj/item/mmi // CHOMPEdit - Removal of obj/item/device
	var/mob/living/body_backup = null //add reforming

/obj/item/mmi/Destroy() // CHOMPEdit - Removal of obj/item/device
	if(body_backup)
		qdel(body_backup)
	..()
