/datum/design/item/xenoarch/AssembleDesignName()
	..()
	name = "Xenoarcheology equipment design ([item_name])"

// Xenoarch tools

<<<<<<< HEAD
/datum/design/item/weapon/xenoarch // CHOMPAdd
	department = LATHE_ALL | LATHE_SCIENCE

/datum/design/item/weapon/xenoarch/ano_scanner
=======
/datum/design/item/xenoarch/ano_scanner
>>>>>>> c13a352941... Merge pull request #16389 from Kashargul/datumsadnsome
	name = "Alden-Saraspova counter"
	id = "ano_scanner"
	desc = "Aids in triangulation of exotic particles."
	req_tech = list(TECH_BLUESPACE = 3, TECH_MAGNET = 3)
	materials = list(MAT_STEEL = 10000,MAT_GLASS = 5000)
	build_path = /obj/item/device/ano_scanner
	sort_string = "GAAAA"

/datum/design/item/xenoarch/xenoarch_multi_tool
	name = "xenoarcheology multitool"
	id = "xenoarch_multitool"
	req_tech = list(TECH_MAGNET = 3, TECH_ENGINEERING = 3, TECH_BLUESPACE = 3)
	build_path = /obj/item/device/xenoarch_multi_tool
	materials = list(MAT_STEEL = 2000, MAT_GLASS = 1000, MAT_URANIUM = 500, MAT_PHORON = 500)
	sort_string = "GAAAB"

/datum/design/item/xenoarch/excavationdrill
	name = "Excavation Drill"
	id = "excavationdrill"
	req_tech = list(TECH_MATERIAL = 3, TECH_POWER = 2, TECH_ENGINEERING = 2, TECH_BLUESPACE = 3)
	build_type = PROTOLATHE
	materials = list(MAT_STEEL = 4000, MAT_GLASS = 4000)
<<<<<<< HEAD
	build_path = /obj/item/weapon/pickaxe/excavationdrill
=======
	build_path = /obj/item/pickaxe/excavationdrill
>>>>>>> c13a352941... Merge pull request #16389 from Kashargul/datumsadnsome
	sort_string = "GAAAC"
