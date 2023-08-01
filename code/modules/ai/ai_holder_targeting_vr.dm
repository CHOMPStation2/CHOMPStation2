/datum/ai_holder/can_see_target(atom/movable/the_target, view_range = vision_range)
	if(the_target && !isturf(the_target.loc) && !ismecha(the_target.loc))    //CHOMPEdit, AI shouldn't be targetting people inside objects of any kind
		return FALSE
	return ..()
