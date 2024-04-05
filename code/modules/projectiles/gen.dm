/proc/output_all_ammo_types()
	var/list/types = typesof(/obj/item/ammo_casing)
	var/listof = list()
	for(var/type in types)
		var/obj/item/ammo_casing/casing = new type(null)
		listof |= casing.caliber
		qdel(casing)
	var/output = ""
	for(var/caliber in listof)
		output += caliber + "\n"
	rustg_file_write(output, "data/calibers.txt")

/world/New()
	. = ..()
	output_all_ammo_types()
