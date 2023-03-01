/mob/living/death(gibbed)
	clear_fullscreens()
	if(ai_holder)
		ai_holder.go_sleep()

	if(nest) //Ew.
		if(istype(nest, /obj/structure/prop/nest))
			var/obj/structure/prop/nest/N = nest
			N.remove_creature(src)
		if(istype(nest, /obj/structure/blob/factory))
			var/obj/structure/blob/factory/F = nest
			F.spores -= src
		//VOREStation Edit Start
		if(istype(nest, /obj/structure/mob_spawner))
			var/obj/structure/mob_spawner/S = nest
			S.get_death_report(src)
		//VOREStation Edit End
		nest = null

	if(isbelly(loc) && tf_mob_holder)
		mind?.vore_death = TRUE
		tf_mob_holder.mind?.vore_death = TRUE

	for(var/datum/soul_link/S as anything in owned_soul_links)
		S.owner_died(gibbed)
	for(var/datum/soul_link/S as anything in shared_soul_links)
		S.sharer_died(gibbed)

	// CHOMPStation Add: All mobs can play a death_sound if set. On carbons, this is going to be handled by species.
	if(!gibbed && (male_death_sound || female_death_sound) && !isbelly(loc))
		var/gender = src.gender
		if(gender == FEMALE)
			playsound(src, pick(female_death_sound), 40, 1, 20, volume_channel = VOLUME_CHANNEL_INJ_DEATH)
		else // Until we get more, sorry. :c
			playsound(src, pick(male_death_sound), 40, 1, 20, volume_channel = VOLUME_CHANNEL_INJ_DEATH)
	else if(!gibbed && death_sound && !isbelly(loc))
		playsound(src, pick(death_sound), 40, 1, 20, volume_channel = VOLUME_CHANNEL_INJ_DEATH)
	// CHOMPStation Add End

	. = ..()
