/obj/item/gunbox/blueshield
	name = "blueshield mainarm box"
	desc = "A secure box containing a blueshield main weapon."

//Primary gun: Either shotgun or SMG

/obj/item/gunbox/blueshield/attack_self(mob/living/user)
	var/list/options = list()
	options["Jackhammer Revolver Shotgun (12 Gauge)"] = list(/obj/item/gun/projectile/revolvershotgun, /obj/item/ammo_magazine/m12gdrumjack, /obj/item/ammo_magazine/m12gdrumjack, /obj/item/ammo_magazine/m12gdrumjack/beanbag)
	options["WT550 Machine Pistol (9mm)"] = list(/obj/item/gun/projectile/automatic/wt550, /obj/item/ammo_magazine/m9mmt/rubber, /obj/item/ammo_magazine/m9mmt, /obj/item/ammo_magazine/m9mmt)
	options["X01 Energy Gun (Weapon Cell)"] = list(/obj/item/gun/energy/x01, /obj/item/cell/device/weapon, /obj/item/cell/device/weapon)
	var/choice = input(user,"Would you prefer a Jackhammer shotgun, a WT550 Machine Pistol, or an X01 Energy Gun?") as null|anything in options
	if(src && choice)
		var/list/things_to_spawn = options[choice]
		for(var/new_type in things_to_spawn) // Spawn all the things, the gun and the ammo.
			var/atom/movable/AM = new new_type(get_turf(src))
			if(istype(AM, /obj/item/gun))
				to_chat(user, "You have chosen \the [AM].")
		qdel(src)

/obj/item/gunbox/blueshield/secondary
	name = "blueshield sidearm box"
	desc = "A secure box containing a blueshield sidearm."

//Sidearm: Egun, or a .44 with rubber and lethal mag

/obj/item/gunbox/blueshield/secondary/attack_self(mob/living/user)
	var/list/options = list()
	options["NSCW Variable Pistol(Microbattery)"] = list(/obj/item/storage/secure/briefcase/nsfw_pack_hos)
	options["E-Gun (Weapon Cell)"] = list(/obj/item/gun/energy/gun, /obj/item/cell/device/weapon, /obj/item/cell/device/weapon)
	options["Consul Revolver (.44)"] = list(/obj/item/gun/projectile/revolver/consul, /obj/item/ammo_magazine/s44, /obj/item/ammo_magazine/s44, /obj/item/ammo_magazine/s44/rubber)
	var/choice = input(user,"Would you prefer an NSCW, e-gun or a revolver?") as null|anything in options
	if(src && choice)
		var/list/things_to_spawn = options[choice]
		for(var/new_type in things_to_spawn) // Spawn all the things, the gun and the ammo.
			var/atom/movable/AM = new new_type(get_turf(src))
			if(istype(AM, /obj/item/gun))
				to_chat(user, "You have chosen \the [AM].")
		qdel(src)