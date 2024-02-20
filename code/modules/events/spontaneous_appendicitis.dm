/datum/event/spontaneous_appendicitis/start()
<<<<<<< HEAD
	if(prob(50))
		kill()
		return
=======
>>>>>>> 7c8bb85de3... Whitespace Standardization [MDB IGNORE] (#15748)
	for(var/mob/living/carbon/human/H in shuffle(living_mob_list))
		if(H.client && H.appendicitis())
			break
