/mob/living/death(gibbed)
	clear_fullscreens()
	update_mob_action_buttons()
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
		//CHOMPEdit Start - Holder is used for OOC Escape now, make sure not to kill body swapped minds too
		if(tf_mob_holder.loc == src)
			tf_mob_holder.mind?.vore_death = TRUE
		//CHOMPEdit End

	for(var/datum/soul_link/S as anything in owned_soul_links)
		S.owner_died(gibbed)
	for(var/datum/soul_link/S as anything in shared_soul_links)
		S.sharer_died(gibbed)

	// CHOMPStation Edit: All mobs can play a death_sound if set. On carbons, this is going to be handled by species.
	if(!gibbed && !isbelly(loc))
		if(src.death_sound_override) // Do we override the death sounds from our species list - used by only a few specific mobs. If we do, do the next one instead
			playsound(src, death_sound_override, 50, 1, 20, volume_channel = VOLUME_CHANNEL_DEATH_SOUNDS)
		else
			if(!ishuman(src)) // Safety, we're not going to double up on death noises if we're not human.
				playsound(src, pick(get_species_sound(get_gendered_sound(src))["death"]), 50, 1, 20, volume_channel = VOLUME_CHANNEL_DEATH_SOUNDS)
	// CHOMPStation Add End

	. = ..()

/mob/living/proc/delayed_gib()
	visible_message(span_danger(span_bold("[src]") + " starts convulsing violently!"), span_danger("You feel as if your body is tearing itself apart!"))
	Weaken(30)
	make_jittery(1000)
	addtimer(CALLBACK(src, PROC_REF(gib)), rand(2 SECONDS, 10 SECONDS))
