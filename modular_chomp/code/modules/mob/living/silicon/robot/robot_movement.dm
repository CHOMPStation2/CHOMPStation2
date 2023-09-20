//CHOMP reagent vore belly sloshing

// Handle footstep sounds
/mob/living/silicon/robot/handle_vorefootstep(var/m_intent, var/turf/T)

	if(!config.vorefootstep_volume || !T.vorefootstep_sounds || !T.vorefootstep_sounds.len || !vore_footstep_volume)
		return
	// Future Upgrades - Robot specific support
	var/list/vorefootstep_sounds = T.vorefootstep_sounds["human"]
	if(!vorefootstep_sounds)
		return
	var/S = pick(vorefootstep_sounds)
	if(!S) return
	var/volume = config.vorefootstep_volume * (vore_footstep_volume/100)

	volume = config.vorefootstep_volume * (vore_footstep_volume/100)

	if(buckled || lying || throwing)
		return // people flying, lying down or sitting do not slosh
	if(!has_gravity(src) && prob(75))
		return // Far less likely to make noise in no gravity
	playsound(T, S, volume, FALSE, preference = /datum/client_preference/digestion_noises)
	return
