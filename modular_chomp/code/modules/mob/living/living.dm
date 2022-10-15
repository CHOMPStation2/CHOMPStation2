/mob/living/proc/vs_animate(var/belly_to_animate)
	return

/mob/living/is_incorporeal()
	if(incorporeal_move)
		return 1
	..()
