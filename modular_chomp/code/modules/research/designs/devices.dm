/datum/design/item/floor_painter
	id = "floor_painter"
	req_tech = list(TECH_ENGINEERING = 2)
	materials = list(MAT_STEEL = 3000, MAT_GLASS = 500)
	build_path = /obj/item/floor_painter
	sort_string = "TADAA"
	department = LATHE_ALL | LATHE_SERVICE

/datum/design/item/medical_holosign
	id = "medical_holosign"
	req_tech = list(TECH_BIO = 2)
	materials = list(MAT_STEEL = 1000, MAT_GLASS = 500)
	build_path = /obj/item/holosign_creator/medical
	sort_string = "TADAB"
	department = LATHE_ALL | LATHE_MEDICAL

/datum/design/item/atmos_holosign
	id = "atmos_holosign"
	req_tech = list(TECH_ENGINEERING = 2)
	materials = list(MAT_STEEL = 1000, MAT_GLASS = 500)
	build_path = /obj/item/holosign_creator/combifan
	sort_string = "TADAC"
	department = LATHE_ALL | LATHE_ENGINEERING

/datum/design/item/mail_scanner
	id = "mail_scanner"
	materials = list(MAT_STEEL = 500, MAT_GLASS = 500)
	build_path = /obj/item/mail_scanner
	sort_string = "TADAD"
	department = LATHE_ALL | LATHE_CARGO
