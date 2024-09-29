/atom/proc/living_mobs_in_view(var/range = world.view, var/count_held = FALSE)
	var/list/viewers = oviewers(src, range)
	if(count_held)
		viewers = viewers(src,range)
	var/list/living = list()
	for(var/mob/living/L in viewers)
		if(L.is_incorporeal())
			continue
		living += L
		if(count_held)
			for(var/obj/item/holder/H in L.contents)
				if(istype(H.held_mob, /mob/living))
					living += H.held_mob
	return living
