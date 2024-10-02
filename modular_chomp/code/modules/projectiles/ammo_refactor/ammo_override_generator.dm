/*

Leave this unticked by default. This was used to generate ammo_overrides.dm

*/

/obj/item/ammo_magazine/pistol
/obj/item/ammo_magazine/smg
/obj/item/ammo_magazine/smg_drum
/obj/item/ammo_magazine/medium
/obj/item/ammo_magazine/medium_drum
/obj/item/ammo_magazine/clip/medium
/obj/item/ammo_magazine/medium_box
/obj/item/ammo_magazine/large
/obj/item/ammo_magazine/large_box
/obj/item/ammo_magazine/pistol/rubber
/obj/item/ammo_magazine/pistol/flash
/obj/item/ammo_magazine/pistol/large
/obj/item/ammo_magazine/pistol/large/hp
/obj/item/ammo_magazine/smg/rubber
/obj/item/ammo_casing/simple/small
/obj/item/ammo_casing/simple/medium
/obj/item/ammo_casing/simple/large

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
	types = typesof(/obj/item/gun/projectile)
	var/list/magtypes = list()
	var/list/startmags = list()
	for(var/type in types)
		var/obj/item/gun/projectile/wep = new type(null)
		magtypes |= wep.allowed_magazines
		startmags |= wep.magazine_type
		qdel(wep)
	output = ""
	for(var/type in magtypes)
		output += "[type]\n"
	output += "\n\n"
	startmags -= magtypes
	for(var/type in startmags)
		output += "[type]\n"
	output += "\n\n"
	var/allmags = typesof(/obj/item/ammo_magazine)
	allmags -= startmags
	allmags -= magtypes
	var/secondaryoutput = ""
	for(var/type in allmags)
		var/temp = type::parent_type
		var/tryget = magazine_overrides[type]
		if(tryget)
			//output += "[type] = [tryget],\n"
			continue
		tryget = magazine_overrides[temp]
		if(tryget)
			var/leng = length("[temp]")
			var/extra = copytext("[type]",leng+1)
			output += "[type] = [tryget][extra],\n"
			continue

		secondaryoutput += "[type]\n"

	output += "\n\n"
	output += secondaryoutput
	rustg_file_write(output, "data/magazines.txt")

/proc/override_gen()
	var/list/types = typesof(/obj/item/gun/projectile)
	var/list/casing_overrides = list(
		"small" = /obj/item/ammo_casing/simple/small,
		"medium" = /obj/item/ammo_casing/simple/medium,
		"large" = /obj/item/ammo_casing/simple/large,
	)

	var/list/small_calibers = list(".380", "7.62x25mm", "9x18mm", ".45 LC", "9mm", ".45", "10mm", ".357", ".38", ".44")
	var/list/medium_calibers = list("5mm caseless", "7.62x54mmR", "7.92x33mm", "9.5x40mm", "7.62x39mm", "5.56x45mm", "7.62mm", "5.45mm", "9x39mm", "mauser", ".48")
	var/list/large_calibers = list(".338", ".50 BMG", "12.7x108mm") //14.5 doesnt get overridden, its their own superheavy ammo
	var/list/override_calibers = small_calibers + medium_calibers + large_calibers
	var/output_small = ""
	var/output_medium = ""
	var/output_large = ""
	for(var/type in types)
		var/output = ""
		var/obj/item/gun/projectile/wep = new type(null)
		if(!(wep.caliber in override_calibers))
			qdel(wep)
			continue
		output += "[type]\n"

		var/new_caliber = "small"
		var/new_caliber_num = 1
		if(wep.caliber in medium_calibers)
			new_caliber = "medium"
			new_caliber_num = 2
		if(wep.caliber in large_calibers)
			new_caliber = "large"
			new_caliber_num = 3
		output += "\tcaliber = \"[new_caliber]\"\n"

		if(!LAZYLEN(wep.allowed_magazines))
			var/new_casing = casing_overrides[new_caliber]
			output += "\tammo_type = [new_casing]\n"

			var/old_casing = wep.ammo_type
			if(!ispath(old_casing))
				continue
			var/obj/item/ammo_casing/casing = new old_casing(null)
			var/projectile = casing.projectile_type
			qdel(casing)
			output += "\tprojectile_type = [projectile]\n"

			output += "\n"
			switch(new_caliber_num)
				if(1)
					output_small += output
				if(2)
					output_medium += output
				if(3)
					output_large += output

			qdel(wep)
			continue

		var/base_magazine = wep.allowed_magazines[1]
		var/obj/item/ammo_magazine/mag = new base_magazine(null)
		var/ammo_type = mag.ammo_type
		qdel(mag)
		var/obj/item/ammo_casing/ammo = new ammo_type(null)
		var/projectile_type = ammo.projectile_type
		qdel(ammo)
		output += "\tprojectile_type = [projectile_type]\n"

		var/mag_list = "list("
		for(var/allowed_mag in wep.allowed_magazines)
			var/converted_mag = magazine_overrides[allowed_mag]
			if(converted_mag) mag_list += "[converted_mag],"
		mag_list = copytext(mag_list,1,-1)
		mag_list += ")"
		output += "\tallowed_magazines = [mag_list]\n"

		var/start_mag = wep.magazine_type
		var/start_mag_converted = magazine_overrides[start_mag]
		output += "\tmagazine_type = [start_mag_converted]\n"

		output += "\n"
		switch(new_caliber_num)
			if(1)
				output_small += output
			if(2)
				output_medium += output
			if(3)
				output_large += output

		qdel(wep)

	var/output = ""
	output += "/*\n\nSmall Weapons\n\n*/\n\n\n\n"
	output += output_small
	output += "\n\n/*\n\nMedium Weapons\n\n*/\n\n\n\n"
	output += output_medium
	output += "\n\n/*\n\nLarge Weapons\n\n*/\n\n\n\n"
	output += output_large

	rustg_file_write(output,"data/ammo_overrides.dm")



/world/New()
	. = ..()
	output_all_ammo_types()
	//override_gen()
