/datum/design/circuit/microwave/advanced
	name = "deluxe microwave"
	id = "deluxe microwave"
	req_tech = list(TECH_DATA = 5, TECH_ENGINEERING = 5, TECH_BLUESPACE = 4)
	build_path = /obj/item/weapon/circuitboard/microwave/advanced
	sort_string = "MAAAC"

/datum/design/circuit/mecha/scarab_main
	name = "'Scarab' central control"
	id = "scarab_main"
	req_tech = list(TECH_DATA = 4)
	build_path = /obj/item/weapon/circuitboard/mecha/scarab/main
	sort_string = "SAAAA"

/datum/design/circuit/mecha/scarab_peri
	name = "'scarab' peripherals control"
	id = "scarab_peri"
	req_tech = list(TECH_DATA = 4)
	build_path = /obj/item/weapon/circuitboard/mecha/scarab/peripherals
	sort_string = "SAAAB"

/datum/design/circuit/mecha/scarab_targ
	name = "'Scarab' weapon control and targeting"
	id = "scarab_targ"
	req_tech = list(TECH_DATA = 4, TECH_COMBAT = 2)
	build_path = /obj/item/weapon/circuitboard/mecha/scarab/targeting
	sort_string = "SAAAC"

/datum/design/circuit/mecha/phazon_main
	name = "'Phazon' central control"
	id = "phazon_main"
	req_tech = list(TECH_BLUESPACE = 5, TECH_MAGNET = 6, TECH_PHORON = 3, TECH_ARCANE = 1)
	materials = list(MAT_GLASS = 2000, MAT_GRAPHITE = 1250)
	chemicals = list("sacid" = 20)
	build_path = /obj/item/weapon/circuitboard/mecha/phazon/main
	sort_string = "PAADA"

/datum/design/circuit/mecha/phazon_peri
	name = "'Phazon' peripherals control"
	id = "phazon_peri"
	req_tech = list(TECH_BLUESPACE = 5, TECH_MAGNET = 6, TECH_PHORON = 3, TECH_ARCANE = 1)
	materials = list(MAT_GLASS = 2000, MAT_GRAPHITE = 1250)
	chemicals = list("sacid" = 20)
	build_path = /obj/item/weapon/circuitboard/mecha/phazon/peripherals
	sort_string = "PAADB"

/datum/design/circuit/mecha/phazon_targ
	name = "'Phazon' weapon control and targeting"
	id = "phazon_targ"
	req_tech = list(TECH_BLUESPACE = 5, TECH_MAGNET = 6, TECH_PHORON = 3, TECH_ARCANE = 1, TECH_COMBAT = 5)
	materials = list(MAT_GLASS = 2000, MAT_GRAPHITE = 1250)
	chemicals = list("sacid" = 20)
	build_path = /obj/item/weapon/circuitboard/mecha/phazon/targeting
	sort_string = "PAADC"

///Fighters///

//Pinnace//

/datum/design/circuit/mecha/fighter/pinnace_main
	name = "Pinnace central control board"
	id = "pinnace_main"
	req_tech = list(TECH_DATA = 3, TECH_POWER = 4)
	build_path = /obj/item/circuitboard/mecha/fighter/pinnace/main
	sort_string = "NAAGA"

/datum/design/circuit/mecha/fighter/pinnace_flight
	name = "Pinnace flight control board"
	id = "pinnace_flight"
	req_tech = list(TECH_DATA = 3, TECH_POWER = 4)
	build_path = /obj/item/circuitboard/mecha/fighter/pinnace/flight
	sort_string = "NAAGB"

/datum/design/circuit/mecha/fighter/pinnace_targeting
	name = "Pinnace weapon control and targeting board"
	id = "pinnace_targeting"
	req_tech = list(TECH_DATA = 3, TECH_POWER = 4)
	build_path = /obj/item/circuitboard/mecha/fighter/pinnace/targeting
	sort_string = "NAAGC"

/datum/design/circuit/mecha/fighter/pinnace_cockpit_control
	name = "Pinnace manual flight control instruments"
	id = "pinnace_cockpit_control"
	req_tech = list(TECH_DATA = 3, TECH_POWER = 4)
	build_path = /obj/item/circuitboard/mecha/fighter/pinnace/cockpitboard
	sort_string = "NAAGD"

//Baron//

/datum/design/circuit/mecha/fighter/baron_main
	name = "Baron central control board"
	id = "baron_main"
	req_tech = list(TECH_DATA = 5, TECH_POWER = 4)
	build_path = /obj/item/circuitboard/mecha/fighter/baron/main
	sort_string = "NAAHA"

/datum/design/circuit/mecha/fighter/baron_flight
	name = "Baron flight control board"
	id = "baron_flight"
	req_tech = list(TECH_DATA = 5, TECH_POWER = 4)
	build_path = /obj/item/circuitboard/mecha/fighter/baron/flight
	sort_string = "NAAHB"

/datum/design/circuit/mecha/fighter/baron_targeting
	name = "Baron weapon control and targeting board"
	id = "baron_targeting"
	req_tech = list(TECH_DATA = 5, TECH_POWER = 4, TECH_COMBAT = 3)
	build_path = /obj/item/circuitboard/mecha/fighter/baron/targeting
	sort_string = "NAAHC"

/datum/design/circuit/mecha/fighter/baron_cockpit_control
	name = "Baron manual flight control instruments"
	id = "baron_cockpit_control"
	req_tech = list(TECH_DATA = 5, TECH_POWER = 4, TECH_COMBAT = 3)
	build_path = /obj/item/circuitboard/mecha/fighter/baron/cockpitboard
	sort_string = "NAAHD"