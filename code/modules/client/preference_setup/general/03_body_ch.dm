/datum/category_item/player_setup_item/general/body/copy_to_mob(var/mob/living/carbon/human/character)
	. = ..()
	if(character.species.digi_allowed)
		character.digitigrade = pref.digitigrade
	else
		character.digitigrade = FALSE