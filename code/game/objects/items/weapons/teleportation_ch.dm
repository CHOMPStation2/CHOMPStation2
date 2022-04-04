//Handle the failchance of a hand tele
//Default action is to randomise you in space.
//This proc allows custom actions.
/obj/item/weapon/hand_tele/proc/handle_fail(var/target)

	// Failure
	if(prob(5) || !target)

		var/list/turfs = list(	)
		for(var/turf/T in orange(10))
			if(T.x>world.maxx-8 || T.x<8)	continue	//putting them at the edge is dumb
			if(T.y>world.maxy-8 || T.y<8)	continue
			if(T.block_tele) continue
			turfs += T

		target = pick(turfs)
		return target

	// Success
	else
		return target