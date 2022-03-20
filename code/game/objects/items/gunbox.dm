<<<<<<< HEAD
=======
/*
 * Sidearm Lethal
 */
>>>>>>> 7eb5c88bcd... Merge pull request #12463 from GhostActual/gunbox_borked
/obj/item/gunbox
	name = "detective's gun box"
	desc = "A secure box containing a Detective's sidearm."
	icon = 'icons/obj/storage.dmi'
	icon_state = "gunbox"
	w_class = ITEMSIZE_HUGE

/obj/item/gunbox/attack_self(mob/living/user)
	var/list/options = list()
	options[".45 Pistol"] = list(/obj/item/weapon/gun/projectile/colt/detective, /obj/item/ammo_magazine/m45/rubber, /obj/item/ammo_magazine/m45/rubber)
	options[".45 Revolver"] = list(/obj/item/weapon/gun/projectile/revolver/detective45, /obj/item/ammo_magazine/s45/rubber, /obj/item/ammo_magazine/s45/rubber)
	var/choice = tgui_input_list(user,"Would you prefer a pistol or a revolver?", "Gun!", options)
	if(src && choice)
		var/list/things_to_spawn = options[choice]
		for(var/new_type in things_to_spawn) // Spawn all the things, the gun and the ammo.
			var/atom/movable/AM = new new_type(get_turf(src))
			if(istype(AM, /obj/item/weapon/gun))
				to_chat(user, "You have chosen \the [AM]. Say hello to your new friend.")
<<<<<<< HEAD
=======
		qdel(src)

/*
 * Sidearm Stun
 */
/obj/item/gunbox/stun
	name = "non-lethal sidearm box"
	desc = "A secure box containing a non-lethal sidearm."
/obj/item/gunbox/stun/attack_self(mob/living/user)
	var/list/options = list()
	options["Stun Revolver"] = list(/obj/item/weapon/gun/energy/stunrevolver/detective, /obj/item/weapon/cell/device/weapon, /obj/item/weapon/cell/device/weapon)
	options["Taser"] = list(/obj/item/weapon/gun/energy/taser, /obj/item/weapon/cell/device/weapon, /obj/item/weapon/cell/device/weapon)
	var/choice = tgui_input_list(user,"Please, select an option.", "Stun Gun!", options)
	if(src && choice)
		var/list/things_to_spawn = options[choice]
		for(var/new_type in things_to_spawn) // Spawn all the things, the gun and the ammo.
			var/atom/movable/AM = new new_type(get_turf(src))
			if(istype(AM, /obj/item/weapon/gun))
				to_chat(user, "You have chosen \the [AM]. Say hello to your new friend.")
>>>>>>> 7eb5c88bcd... Merge pull request #12463 from GhostActual/gunbox_borked
		qdel(src)