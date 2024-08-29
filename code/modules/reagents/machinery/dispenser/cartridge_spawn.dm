/client/proc/spawn_chemdisp_cartridge(size in list("small", "medium", "large"), reagent in SSchemistry.chemical_reagents)
	set name = "Spawn Chemical Dispenser Cartridge"
	set category = "Admin.Events" //CHOMPEdit

	var/obj/item/reagent_containers/chem_disp_cartridge/C // CHOMPEdit - Removal of obj/item/weapon
	switch(size)
		if("small") C = new /obj/item/reagent_containers/chem_disp_cartridge/small(usr.loc) // CHOMPEdit - Removal of obj/item/weapon
		if("medium") C = new /obj/item/reagent_containers/chem_disp_cartridge/medium(usr.loc) // CHOMPEdit - Removal of obj/item/weapon
		if("large") C = new /obj/item/reagent_containers/chem_disp_cartridge(usr.loc) // CHOMPEdit - Removal of obj/item/weapon
	C.reagents.add_reagent(reagent, C.volume)
	var/datum/reagent/R = SSchemistry.chemical_reagents[reagent]
	C.setLabel(R.name)
	log_admin("[key_name(usr)] spawned a [size] reagent container containing [reagent] at ([usr.x],[usr.y],[usr.z])")
