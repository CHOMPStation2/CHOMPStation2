//code/game/objects/items/weapons/material/thrown.dm
/obj/item/weapon/material/ppball
	name = "shuriken?"
	desc = "A metal."
	icon_state = "star"
	force_divisor = 0.1 // 6 with hardness 60 (steel)
	thrown_force_divisor = 0.75 // 15 with weight 20 (steel)
	throw_speed = 10
	throw_range = 15
	sharp = 0
	edge =  0
	var/master = 0
	var/slave = 0

/obj/item/weapon/material/ppball/pickup(mob/user)
	..()
	if(!master)
		master = user

/obj/item/weapon/material/ppball/New()
	..()
	src.pixel_x = rand(-12, 12)
	src.pixel_y = rand(-12, 12)

/obj/item/weapon/material/ppball/throw_impact(atom/hit_atom)
	..()
	var/chance = 0
	var/full = 0
	var/animal = 0
	for(var/mob/M in src)
		full++
	if(istype(hit_atom,/mob/living/simple_mob))
		if (istype(hit_atom,/mob/living/simple_mob/animal)
			chance = 75
			animal = 1
		else 
			chance = 20
		var/mob/living/simple_mob/M = hit_atom
		if(full)
			for(var/mob/F in src)
				F.forceMove(get_turf(src))
				F.set_AI_busy(0)
		else
			if (!slave&&prob(chance))
				slave = M
				if(animal)
					slave.faction = master.faction
				slave.forceMove(src)
				slave.set_AI_busy(1)
			else
				if(prob(chance*2))
					qdel(src)
	else
		if(full)
			for(var/mob/F in src)
				F.forceMove(get_turf(src))
				F.set_AI_busy(0)

/obj/item/weapon/material/ppball/attack_self(mob/user)
	if (user == master)
		var/full = 0
		for(var/mob/M in src)
			full++
		if(!full)
			slave.set_AI_busy(1)
			slave.forceMove(src)
		else
			slave.forceMove(get_turf(user))
			slave.set_AI_busy(0)
