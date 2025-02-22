// prevent gun activation when stealth swimming. The low alpha hides you from NPC AI, which allows you to cheese mobs.
//Just adding onto this code for funny net gun
/obj/item/gun/special_check(var/mob/user)
	var/mob/living/L = user
	if(istype(L))
		if(L.has_modifier_of_type(/datum/modifier/underwater_stealth))
			to_chat(user,span_warning("You cannot use guns whilst hiding underwater!"))
			return 0
		else if(L.has_modifier_of_type(/datum/modifier/rednet))
			to_chat(user,span_warning("Your gun refuses to fire!"))
			return 0
		else if(L.has_modifier_of_type(/datum/modifier/trait/thickdigits))
			to_chat(user,span_warning("Your hands can't pull the trigger!!"))
			return 0
	return ..()
