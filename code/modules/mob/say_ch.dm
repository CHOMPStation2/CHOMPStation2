/atom/proc/get_ultimate_mob() //seems like the wrong place for it, but other stuff uses this
	var/mob/ultimate_mob
	var/atom/to_check = loc
	var/n = 0
	while (to_check && !isturf(to_check) && n++ < 16)
		if (ismob(to_check))
			ultimate_mob = to_check
			to_check = to_check.loc
	return ultimate_mob
