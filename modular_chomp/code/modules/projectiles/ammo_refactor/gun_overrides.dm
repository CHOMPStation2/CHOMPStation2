/obj/item/gun/projectile/examine(mob/user)
	. = ..()
	//What types of magazine does this accept if it does accept magazines?
	if(load_method & MAGAZINE)
		var/magtypes = "This accepts the following magazine types: "
		for(var/type in allowed_magazines)
			//BYOND Fuckery cry about it
			var/atom/byondeeznuts = type
			var/mag_name = byondeeznuts::name
			magtypes += "[mag_name], "
		magtypes = copytext(magtypes, 1, -2) //Get rid of trailing command and space.
		. += magtypes

/obj/item/gun/projectile/get_ammo_type()
	if(caliber in list("small","medium","large"))
		var/obj/item/projectile/P = src.projectile_type
		return list(initial(P.hud_state), initial(P.hud_state_empty))
	. = ..()
