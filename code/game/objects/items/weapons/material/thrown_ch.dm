//code/game/objects/items/weapons/material/thrown.dm
/obj/item/weapon/material/ppball
	name = "shuriken?"
	desc = "A metal."
	icon_state = "star"
	force_divisor = 0.1 // 6 with hardness 60 (steel)
	thrown_force_divisor = 0.75 // 15 with weight 20 (steel)
	throw_speed = 2
	throw_range = 7
	sharp = 0
	edge =  0
	var/capsulemaster = 0 //Temporary term = capsulemaste
	var/capsuleslave = 0 //Temporary term = capsuleslav

/obj/item/weapon/material/ppball/pickup(mob/user)
	..()
	if(!capsulemaster)
		capsulemaster = user

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
		if (istype(hit_atom,/mob/living/simple_mob/animal) )
			chance = 75
			animal = 1
		else 
			chance = 20
		var/mob/living/simple_mob/M = hit_atom
		if(full)
			for(var/mob/F in src)
				var/mob/living/simple_mob/capsuleslav = F
				capsuleslav.forceMove(get_turf(src))
				capsuleslav.set_AI_busy(0)
		else
			if (!M.client&&!capsuleslave&&prob(chance))
				capsuleslave = M
				var/mob/living/simple_mob/capsuleslav = M
				var/mob/living/carbon/capsulemaste = capsulemaster
				if(animal)
					capsuleslav.faction = capsulemaste.faction
				capsuleslav.forceMove(src)
				capsuleslav.set_AI_busy(1)
			else
				if(prob(chance*2))
					qdel(src)
	else
		if(full)
			for(var/mob/F in src)
				var/mob/living/simple_mob/capsuleslav = F
				capsuleslav.forceMove(get_turf(src))
				capsuleslav.set_AI_busy(0)

/obj/item/weapon/material/ppball/attack_self(mob/user)
	if (user == capsulemaster && capsuleslave)
		var/mob/living/simple_mob/capsuleslav = capsuleslave
		var/full = 0
		for(var/mob/M in src)
			full++
		if(!full)
			capsuleslav.set_AI_busy(1)
			capsuleslav.forceMove(src)
		else
			capsuleslav.forceMove(get_turf(user))
			capsuleslav.set_AI_busy(0)
