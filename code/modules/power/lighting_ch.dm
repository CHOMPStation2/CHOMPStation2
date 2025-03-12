

/obj/machinery/light/attackby(obj/item/W, mob/user)

	//Light painter code
	if(istype(W, /obj/item/lightpainter))
		var/obj/item/lightpainter/LP = W
		if(isliving(user))
			var/mob/living/U = user
			LP.ColorLight(src, U)
			return

	. = ..()
