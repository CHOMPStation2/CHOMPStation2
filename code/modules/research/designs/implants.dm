// Implants

/datum/design/item/implant
	materials = list(MAT_STEEL = 50, MAT_GLASS = 50)

/datum/design/item/implant/AssembleDesignName()
	..()
	name = "Implantable biocircuit design ([item_name])"

/datum/design/item/implant/chemical
	name = "chemical"
	id = "implant_chem"
	req_tech = list(TECH_MATERIAL = 2, TECH_BIO = 3)
	build_path = /obj/item/implantcase/chem
	sort_string = "MFAAA"
	department = LATHE_ALL | LATHE_MEDICAL | LATHE_SECURITY // CHOMPAdd

/datum/design/item/implant/freedom
	name = "freedom"
	id = "implant_free"
	req_tech = list(TECH_ILLEGAL = 2, TECH_BIO = 3)
	build_path = /obj/item/implantcase/freedom
	sort_string = "MFAAB"
	department = LATHE_ALL | LATHE_SECURITY // CHOMPAdd
