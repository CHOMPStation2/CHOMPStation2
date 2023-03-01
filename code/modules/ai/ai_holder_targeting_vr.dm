/datum/ai_holder/can_see_target(atom/movable/the_target, view_range = vision_range)
	if(the_target && isbelly(the_target.loc))
		return FALSE

	return ..()
/*
/datum/ai_holder/can_see_target(atom/movable/the_target, view_range = vision_range)
	log_world("TARGET: [the_target] and TARGET.LOC: [the_target.loc]")
	if(the_target && !isturf(the_target.loc))	//CHOMPEdit, AI shouldn't be targetting people inside objects of any kind
		if(ismecha(the_target.loc))	//Except mechs, of course
			target = the_target.loc
		else
			return FALSE

	return ..()
*/