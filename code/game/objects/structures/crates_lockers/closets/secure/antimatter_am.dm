/obj/structure/closet/secure_closet/am_closet
	name = "Antimatter Equipment"
	req_access = list(access_all_personal_lockers)
	icon_state = "secureeng1"
	icon_closed = "secureeng"
	icon_locked = "secureeng1"
	icon_opened = "secureengopen"
	icon_broken = "secureengbroken"
	icon_off = "secureengoff"


	New()
		..()
		if(prob(50))
			new /obj/item/device/am_shielding_container(src)
			new /obj/item/device/am_shielding_container(src)
			new /obj/item/device/am_shielding_container(src)
		new /obj/item/device/am_shielding_container(src)
		new /obj/item/device/am_shielding_container(src)
		new /obj/item/device/am_shielding_container(src)
		new /obj/item/device/am_shielding_container(src)
		new /obj/item/device/am_shielding_container(src)
		new /obj/item/device/am_shielding_container(src)
		new /obj/item/device/am_shielding_container(src)
		new /obj/item/device/am_shielding_container(src)
		new /obj/item/device/am_shielding_container(src)
		new /obj/item/weapon/am_containment(src)
		new /obj/item/stack/cable_coil/yellow(src)
		new /obj/item/stack/cable_coil(src)
		return