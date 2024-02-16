/datum/event/spontaneous_appendicitis/start()
	if(prob(50))
		kill()
		return
	for(var/mob/living/carbon/human/H in shuffle(living_mob_list))
		if(H.client && H.appendicitis())
			break
