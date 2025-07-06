/mob/living/carbon/human/is_incorporeal()
	var/datum/component/shadekin/SK = get_shadekin_component()
	if(SK && SK.in_phase) //Shadekin
		return TRUE
	return ..()
