/datum/design/item/general/borgos
	name = "Borg-O's Recipe"
	desc = "A recipe for the cult classic Borg-O's meal. Warning: Not suitable for organic consumption."
	id = "borgos1"
	req_tech = list(TECH_MATERIAL = 2)
	materials = list(MAT_STEEL = 5000)
	build_path = /obj/item/trash/rkibble
	sort_string = "KIBBB"
	department = LATHE_ALL | LATHE_SCIENCE

/datum/design/item/general/mindbinder
	name = "Mind Binder"
	id = "mindbinder"
	req_tech = list(TECH_MAGNET = 3, TECH_BIO = 3, TECH_ILLEGAL = 2)
	materials = list(MAT_STEEL = 4000, MAT_GLASS = 4000, MAT_URANIUM = 2000)
	build_path = /obj/item/mindbinder
	sort_string = "TBVAB"
	department = LATHE_ALL | LATHE_MEDICAL
