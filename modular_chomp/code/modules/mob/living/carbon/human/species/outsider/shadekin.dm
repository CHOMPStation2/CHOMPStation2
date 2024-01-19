/datum/species/shadekin

/obj/item/weapon/gun/special_check(var/mob/user, var/alien)
	if(alien == IS_SHADEKIN)
		to_chat(user,"<span class='warning'>You are unsure how to use this!</span>")
		return 0
	...()