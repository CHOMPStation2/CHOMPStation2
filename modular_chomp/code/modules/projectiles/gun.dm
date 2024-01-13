// prevent gun activation when stealth swimming. The low alpha hides you from NPC AI, which allows you to cheese mobs.
//Just adding onto this code for funny net gun
/obj/item/weapon/gun/special_check(var/mob/user)
	var/mob/living/L = user
	if(istype(L))
		if(L.has_modifier_of_type(/datum/modifier/underwater_stealth))
			to_chat(user,"<span class='warning'>You cannot use guns whilst hiding underwater!</span>")
			return 0
		if(L.has_modifier_of_type(/datum/modifier/rednet))
			to_chat(user,"<span class='warning'>Your gun refuses to fire!</span>")
			return 0
	return ..()
