/obj/item/weapon/reagent_containers/food/snacks/digest_act()
	if(digest_stage <= 0)
		if(package_trash)
			new package_trash
		if(trash)
			new trash
	. = ..()
