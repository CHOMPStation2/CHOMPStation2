/obj/item/gunbox/sec_officer
	name = "lethal armament box"
	desc = "A secure box containing a non-lethal sidearm."

/obj/item/gunbox/sec_officer/attack_self(mob/living/user)
	var/list/options = list()
	options["Laser Pistol"] = list(/obj/item/gun/energy/gun, /obj/item/cell/device/weapon, /obj/item/cell/device/weapon)
	options["Normal Pistol"] = list(/obj/item/gun/projectile/pistol, /obj/item/ammo_magazine/m9mm/compact, /obj/item/ammo_magazine/m9mm/compact, /obj/item/ammo_magazine/m9mm/compact, /obj/item/ammo_magazine/m9mm/compact)
	var/choice = tgui_input_list(user,"Please, select an option.", "Lethal Gun!", options)
	if(!choice)
		return
	if(src && choice)
		var/list/things_to_spawn = options[choice]
		for(var/new_type in things_to_spawn) // Spawn all the things, the gun and the ammo.
			var/atom/movable/AM = new new_type(get_turf(src))
			if(istype(AM, /obj/item/gun))
				to_chat(user, "You have chosen \the [AM]. Say hello to your new friend.")
		qdel(src)
