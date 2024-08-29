/obj/item/material/star // CHOMPEdit - Removal of obj/item/weapon
	name = "shuriken"
	desc = "A sharp, perfectly weighted piece of metal."
	icon_state = "star"
	force_divisor = 0.1 // 6 with hardness 60 (steel)
	thrown_force_divisor = 0.75 // 15 with weight 20 (steel)
	throw_speed = 10
	throw_range = 15
	sharp = TRUE
	edge =  TRUE

/obj/item/material/star/New() // CHOMPEdit - Removal of obj/item/weapon
	..()
	src.pixel_x = rand(-12, 12)
	src.pixel_y = rand(-12, 12)

/obj/item/material/star/throw_impact(atom/hit_atom) // CHOMPEdit - Removal of obj/item/weapon
	..()
	if(material.radioactivity>0 && istype(hit_atom,/mob/living))
		var/mob/living/M = hit_atom
		M.adjustToxLoss(rand(20,40))

/obj/item/material/star/ninja // CHOMPEdit - Removal of obj/item/weapon
	default_material = "uranium"