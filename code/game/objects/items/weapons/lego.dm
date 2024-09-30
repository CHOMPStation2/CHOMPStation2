/obj/item/lego
	name = "Lego of Doom"
	throw_speed = 5
	throw_range = 4
	gender = PLURAL
	icon = 'icons/obj/items_ch.dmi'
	icon_state = "lego"
	desc = "An absolutely horrifying mechanical trap, banned in most sectors across the universe. Placing one is considered a major war crime."
	randpixel = 0
	center_of_mass_x = 0 //CHOMPEdit
	center_of_mass_y = 0 //CHOMPEdit
	throwforce = 0
	w_class = ITEMSIZE_SMALL

/obj/item/lego/Crossed(atom/movable/AM as mob|obj)
	if(AM.is_incorporeal())
		return
	if(isliving(AM))
		var/mob/living/L = AM
		if(L.m_intent == "run")
			L.visible_message(
				"<span class='danger'>[L] steps on \the [src].</span>",
				"<span class='danger'>You step on \the [src], you poor bastard!</span>",
				"<b>You hear the sound of immeasurable suffering!</b>"
				)
			L.adjustHalLoss(100)
			playsound(src, 'sound/misc/legodeath.ogg', 50, 1)
			qdel(src)
	..()

/obj/item/lego/gib
	name = "Lego of Doom"
	throw_speed = 5
	throw_range = 4
	gender = PLURAL
	icon = 'icons/obj/items_ch.dmi'
	icon_state = "lego"
	desc = "An absolutely horrifying mechanical trap, banned in most sectors across the universe. Placing one is considered a major war crime."
	randpixel = 0
	center_of_mass_x = 0 //CHOMPEdit
	center_of_mass_y = 0 //CHOMPEdit
	throwforce = 0
	w_class = ITEMSIZE_SMALL

/obj/item/lego/gib/Crossed(atom/movable/AM as mob|obj)
	if(AM.is_incorporeal())
		return
	if(isliving(AM))
		var/mob/living/L = AM
		if(L.m_intent == "run")
			L.visible_message(
				"<span class='danger'>[L] steps on \the [src].</span>",
				"<span class='danger'>You step on \the [src], you poor bastard!</span>",
				"<b>You hear the sound of immeasurable suffering!</b>"
				)
			L.gib()
			playsound(src, 'sound/misc/legodeath.ogg', 50, 1)
			qdel(src)
	..()
