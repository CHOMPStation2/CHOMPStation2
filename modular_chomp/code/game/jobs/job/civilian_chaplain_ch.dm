/datum/job/chaplain/equip(mob/living/carbon/human/H, src)
	. = ..()
	if(H.mind)
		H.mind.isholy = TRUE
