

/obj/machinery/light/attackby(obj/item/W, mob/user)

	//Light painter code
	if(istype(W, /obj/item/lightpainter)) // CHOMPEdit - Removal of obj/item/device
		var/obj/item/lightpainter/LP = W // CHOMPEdit - Removal of obj/item/device
		if(isliving(user))
			var/mob/living/U = user
			LP.ColorLight(src, U)
			return

	. = ..()