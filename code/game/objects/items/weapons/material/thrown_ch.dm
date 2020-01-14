//code/game/objects/items/weapons/material/thrown.dm
/obj/item/weapon/material/ppball
	name = "shuriken?"
	desc = "A metal."
	icon_state = "star"
	force_divisor = 0.1 // 6 with hardness 60 (steel)
	thrown_force_divisor = 0.75 // 15 with weight 20 (steel)
	throw_speed = 10
	throw_range = 15
	sharp = 1
	edge =  1

/obj/item/weapon/material/ppball/New()
	..()
	src.pixel_x = rand(-12, 12)
	src.pixel_y = rand(-12, 12)

/obj/item/weapon/material/ppball/throw_impact(atom/hit_atom)
	..()
	var/full = 0
	for(var/mob/M in src)
		full++
	if(istype(hit_atom,/mob/living/simple_mob))
		var/mob/living/simple_mob/M = hit_atom
		if(full)
			for(var/mob/F in src)
				F.forceMove(get_turf(src))
		else
			M.forceMove(src)
	else
		if(full)
			for(var/mob/F in src)
				F.forceMove(get_turf(src))
