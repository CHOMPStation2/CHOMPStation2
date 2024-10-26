//CHOMP reagent vore belly sloshing
/* This is an ELEMENT now
/mob/living/silicon/robot
	var/step_count = 0

/mob/living/silicon/robot/handle_footstep(var/turf/T)
	if(step_count++ % 2)
		check_vorefootstep("run", T) //CHOMPstation edit: sloshing reagent belly walk system

// Handle footstep sounds
/mob/living/silicon/robot/handle_vorefootstep(var/m_intent, var/turf/T)

	if(!CONFIG_GET(number/vorefootstep_volume) || !T.vorefootstep_sounds || !T.vorefootstep_sounds.len || !vore_footstep_volume)
		return
	// Future Upgrades - Robot specific support
	var/list/vorefootstep_sounds = T.vorefootstep_sounds["human"]
	if(!vorefootstep_sounds)
		return
	var/S = pick(vorefootstep_sounds)
	if(!S) return
	var/volume = CONFIG_GET(number/vorefootstep_volume) * (vore_footstep_volume/100)

	volume = CONFIG_GET(number/vorefootstep_volume) * (vore_footstep_volume/100)

	if(buckled || lying || throwing)
		return // people flying, lying down or sitting do not slosh
	if(!get_gravity(src) && prob(75))
		return // Far less likely to make noise in no gravity
	playsound(T, S, volume, FALSE, preference = /datum/client_preference/digestion_noises)
	return
*/
