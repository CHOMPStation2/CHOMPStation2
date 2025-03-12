/obj/structure/closet/secure_closet/am_closet
	name = "Antimatter Equipment"
	req_access = list(access_all_personal_lockers)
	closet_appearance = /decl/closet_appearance/secure_closet/engineering

	New()
		..()
		if(prob(50))
			new /obj/item/am_shielding_container(src)
			new /obj/item/am_shielding_container(src)
			new /obj/item/am_shielding_container(src)
		new /obj/item/am_shielding_container(src)
		new /obj/item/am_shielding_container(src)
		new /obj/item/am_shielding_container(src)
		new /obj/item/am_shielding_container(src)
		new /obj/item/am_shielding_container(src)
		new /obj/item/am_shielding_container(src)
		new /obj/item/am_shielding_container(src)
		new /obj/item/am_shielding_container(src)
		new /obj/item/am_shielding_container(src)
		new /obj/item/am_containment(src)
		new /obj/item/stack/cable_coil/yellow(src)
		new /obj/item/stack/cable_coil(src)
		return
