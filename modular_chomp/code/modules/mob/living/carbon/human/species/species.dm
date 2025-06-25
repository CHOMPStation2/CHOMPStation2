/datum/species/can_shred(var/mob/living/carbon/human/H, var/ignore_intent)
	if(!ignore_intent && H.a_intent != I_HURT)
		return 0
	if(H.get_feralness())
		return 1
	return ..()
