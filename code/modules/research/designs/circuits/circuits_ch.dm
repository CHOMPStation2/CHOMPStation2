/datum/design/circuit/microwave/advanced
	name = "deluxe microwave"
	id = "deluxe microwave"
	req_tech = list(TECH_DATA = 5, TECH_ENGINEERING = 5, TECH_BLUESPACE = 4)
	build_path = /obj/item/circuitboard/microwave/advanced
	sort_string = "MAAAC"
	department = LATHE_ALL | LATHE_ENGINEERING

/datum/design/circuit/mecha/scarab_main
	name = "'Scarab' central control"
	id = "scarab_main"
	req_tech = list(TECH_DATA = 4)
	build_path = /obj/item/circuitboard/mecha/scarab/main
	sort_string = "SAAAA"

/datum/design/circuit/mecha/scarab_peri
	name = "'scarab' peripherals control"
	id = "scarab_peri"
	req_tech = list(TECH_DATA = 4)
	build_path = /obj/item/circuitboard/mecha/scarab/peripherals
	sort_string = "SAAAB"

/datum/design/circuit/mecha/scarab_targ
	name = "'Scarab' weapon control and targeting"
	id = "scarab_targ"
	req_tech = list(TECH_DATA = 4, TECH_COMBAT = 2)
	build_path = /obj/item/circuitboard/mecha/scarab/targeting
	sort_string = "SAAAC"

/datum/design/circuit/mecha/phazon_main
	name = "'Phazon' central control"
	id = "phazon_main"
	req_tech = list(TECH_BLUESPACE = 5, TECH_MAGNET = 6, TECH_PHORON = 3, TECH_ARCANE = 1)
	materials = list(MAT_GLASS = 2000, MAT_GRAPHITE = 1250)
	chemicals = list("sacid" = 20)
	build_path = /obj/item/circuitboard/mecha/phazon/main
	sort_string = "PAADA"

/datum/design/circuit/mecha/phazon_peri
	name = "'Phazon' peripherals control"
	id = "phazon_peri"
	req_tech = list(TECH_BLUESPACE = 5, TECH_MAGNET = 6, TECH_PHORON = 3, TECH_ARCANE = 1)
	materials = list(MAT_GLASS = 2000, MAT_GRAPHITE = 1250)
	chemicals = list("sacid" = 20)
	build_path = /obj/item/circuitboard/mecha/phazon/peripherals
	sort_string = "PAADB"

/datum/design/circuit/mecha/phazon_targ
	name = "'Phazon' weapon control and targeting"
	id = "phazon_targ"
	req_tech = list(TECH_BLUESPACE = 5, TECH_MAGNET = 6, TECH_PHORON = 3, TECH_ARCANE = 1, TECH_COMBAT = 5)
	materials = list(MAT_GLASS = 2000, MAT_GRAPHITE = 1250)
	chemicals = list("sacid" = 20)
	build_path = /obj/item/circuitboard/mecha/phazon/targeting
	sort_string = "PAADC"
