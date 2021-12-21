/datum/gear/cigar_case
	display_name = "cigar case"
	path = /obj/item/weapon/storage/fancy/cigar

/datum/gear/cigar_case/New()
	..()
	var/list/cigars = list()
	for(var/cigar in (typesof(/obj/item/weapon/storage/fancy/cigar)))
		var/obj/item/weapon/storage/fancy/cigar/cigar_brand = cigar
		cigars[initial(cigar_brand.name)] = cigar_brand
	gear_tweaks += new/datum/gear_tweak/path(sortAssoc(cigars))