/datum/species/can_shred(var/mob/living/carbon/human/H, var/ignore_intent)
	if(!ignore_intent && H.a_intent != I_HURT)
		return FALSE
	if(H.get_feralness())
		return TRUE
	return ..()
