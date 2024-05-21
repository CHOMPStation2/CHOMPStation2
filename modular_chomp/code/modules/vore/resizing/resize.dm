/mob/living/Crossed(var/atom/movable/AM)
	..()
	var/mob/living/target = AM
	if(istype(target) && src.lying && target.loc && target.buckled != src)
		// src.lying being true means that in theory this code shouldn't run at the same time as the existing code for this in Bump. Probably.
		// And optionally, this could be gated behind another preference, to prevent stunlock being abused.
		if((mob_always_swap || (a_intent == I_HELP || src.restrained()) && (target.a_intent == I_HELP || target.restrained())) && target.canmove && target.handle_micro_bump_helping(src))
			return
		if(!(target.a_intent == I_HELP || target.restrained()))
			if(src.step_mechanics_pref && target.step_mechanics_pref)
				target.handle_micro_bump_other(src)
			else
				target.handle_micro_bump_other(src, 1)
