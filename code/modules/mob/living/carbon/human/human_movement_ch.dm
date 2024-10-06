//CHOMP reagent vore belly sloshing
/* This is an ELEMENT now
// Handle footstep sounds
/mob/living/carbon/human/handle_vorefootstep(var/m_intent, var/turf/T)

	if(!CONFIG_GET(number/vorefootstep_volume) || !T.vorefootstep_sounds || !T.vorefootstep_sounds.len || !vore_footstep_volume)
		return
	// Future Upgrades - Multi species support
	var/list/vorefootstep_sounds = T.vorefootstep_sounds["human"]
	if(!vorefootstep_sounds)
		return
	var/S = pick(vorefootstep_sounds)
	if(!S) return
	var/volume = CONFIG_GET(number/vorefootstep_volume) * (vore_footstep_volume/100)

	// Reduce volume while walking or barefoot, but not so much since tummy slosh
	if(!shoes || m_intent == "walk")
		volume = CONFIG_GET(number/vorefootstep_volume) * (vore_footstep_volume/100) * 0.75
	else if(shoes)
		var/obj/item/clothing/shoes/feet = shoes
		if(istype(feet))
			volume = feet.step_volume_mod * CONFIG_GET(number/vorefootstep_volume) * (vore_footstep_volume/100) * 0.75

	if(!has_organ(BP_L_FOOT) && !has_organ(BP_R_FOOT))
		return // no feet = no slosh? Might prevent some entities from sloshing around
	if(buckled || lying || throwing)
		return // people flying, lying down or sitting do not slosh
	if(!get_gravity(src) && prob(75))
		return // Far less likely to make noise in no gravity
	playsound(T, S, volume, FALSE, preference = /datum/client_preference/digestion_noises)
	return
*/
