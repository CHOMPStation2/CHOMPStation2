/datum/design/item/mechfab/rigsuit/phase
	name = "hardsuit phase rifle"
	desc = "A compact phase rifle for a hardsuit."
	id = "rig_gun_phase"
	req_tech = list(TECH_MATERIAL = 5, TECH_ENGINEERING = 4, TECH_MAGNET = 3, TECH_POWER = 4, TECH_COMBAT = 4)
	materials = list(DEFAULT_WALL_MATERIAL = 2000, "glass" = 1250)
	build_path = /obj/item/rig_module/mounted/phase

/datum/design/item/mechfab/rigsuit/defib
	name = "hardsuit defib unit"
	desc = "A rig mounted defib and jumper kit combo."
	id = "rig_defib"
	req_tech = list(TECH_BIO = 5, TECH_MAGNET = 2, TECH_POWER = 3)
	materials = list(DEFAULT_WALL_MATERIAL = 6000, "glass" = 2000)
	build_path = /obj/item/rig_module/device/defib

/datum/design/item/mecha/phoron_bore
	name = "PB-23 \"Phobos\" Phoron Bore"
	category = list("Exosuit Equipment")
	id ="mech_phoron_bore"
	req_tech = list(TECH_POWER = 5, TECH_PHORON = 5, TECH_MATERIAL = 5)
	materials = list(MAT_PLASTEEL = 4000, "phoron" = 10000, "silver" = 2000)
	build_path =/obj/item/mecha_parts/mecha_equipment/weapon/phoron_bore

/datum/design/item/mechfab/scarab
	category = list("Scarab")

/datum/design/item/mechfab/scarab/chassis
	name = "Scarab Chassis"
	id = "scarab_chassis"
	build_path = /obj/item/mecha_parts/chassis/scarab
	time = 10
	materials = list(DEFAULT_WALL_MATERIAL = 15000)

/datum/design/item/mechfab/scarab/torso
	name = "Scarab Torso"
	id = "scarab_torso"
	build_path = /obj/item/mecha_parts/part/scarab_torso
	time = 30
	materials = list(DEFAULT_WALL_MATERIAL = 30000, "glass" = 10000)

/datum/design/item/mechfab/scarab/head
	name = "Scarab Head"
	id = "scarab_head"
	build_path = /obj/item/mecha_parts/part/scarab_head
	time = 20
	materials = list(DEFAULT_WALL_MATERIAL = 12500, "glass" = 5000)

/datum/design/item/mechfab/scarab/left_arm
	name = "Scarab Left Arm"
	id = "scarab_left_arm"
	build_path = /obj/item/mecha_parts/part/scarab_left_arm
	time = 20
	materials = list(DEFAULT_WALL_MATERIAL = 10000)

/datum/design/item/mechfab/scarab/right_arm
	name = "Scarab Right Arm"
	id = "scarab_right_arm"
	build_path = /obj/item/mecha_parts/part/scarab_right_arm
	time = 20
	materials = list(DEFAULT_WALL_MATERIAL = 10000)

/datum/design/item/mechfab/scarab/left_leg
	name = "Scarab Left Legs"
	id = "scarab_left_legs"
	build_path = /obj/item/mecha_parts/part/scarab_left_legs
	time = 20
	materials = list(DEFAULT_WALL_MATERIAL = 30000)

/datum/design/item/mechfab/scarab/right_leg
	name = "Scarab Right Legs"
	id = "scarab_right_legs"
	build_path = /obj/item/mecha_parts/part/scarab_right_legs
	time = 20
	materials = list(DEFAULT_WALL_MATERIAL = 30000)

/datum/design/item/mechfab/phazon
	category = list("Phazon")
	req_tech = list(TECH_MATERIAL = 7, TECH_BLUESPACE = 5, TECH_MAGNET = 6, TECH_PHORON = 3, TECH_ARCANE = 1)

/datum/design/item/mechfab/phazon/chassis
	name = "Phazon Chassis"
	id = "phazon_chassis"
	build_path = /obj/item/mecha_parts/chassis/phazon
	time = 10
	materials = list(DEFAULT_WALL_MATERIAL = 30000, MAT_DURASTEEL = 4000, MAT_PHORON = 4000, MAT_GOLD = 5000, MAT_VERDANTIUM = 4000)

/datum/design/item/mechfab/phazon/torso
	name = "Phazon Torso"
	id = "phazon_torso"
	build_path = /obj/item/mecha_parts/part/phazon_torso
	time = 30
	materials = list(DEFAULT_WALL_MATERIAL = 30000, MAT_DURASTEEL = 2000, MAT_PHORON = 6000, MAT_GOLD = 6000, MAT_VERDANTIUM = 2000)

/datum/design/item/mechfab/phazon/head
	name = "Phazon Head"
	id = "phazon_head"
	build_path = /obj/item/mecha_parts/part/phazon_head
	time = 20
	materials = list(DEFAULT_WALL_MATERIAL = 10000, MAT_DURASTEEL = 1000, MAT_PHORON = 4000, MAT_GOLD = 4000, MAT_VERDANTIUM = 500)

/datum/design/item/mechfab/phazon/left_arm
	name = "Phazon Left Arm"
	id = "phazon_left_arm"
	build_path = /obj/item/mecha_parts/part/phazon_left_arm
	time = 20
	materials = list(DEFAULT_WALL_MATERIAL = 15000, MAT_PHORON = 2000, MAT_GOLD = 2000, MAT_VERDANTIUM = 500)

/datum/design/item/mechfab/phazon/right_arm
	name = "Phazon Right Arm"
	id = "phazon_right_arm"
	build_path = /obj/item/mecha_parts/part/phazon_right_arm
	time = 20
	materials = list(DEFAULT_WALL_MATERIAL = 15000, MAT_PHORON = 2000, MAT_GOLD = 2000, MAT_VERDANTIUM = 500)

/datum/design/item/mechfab/phazon/left_leg
	name = "Phazon Left Leg"
	id = "phazon_left_leg"
	build_path = /obj/item/mecha_parts/part/phazon_left_leg
	time = 20
	materials = list(DEFAULT_WALL_MATERIAL = 15000, MAT_PHORON = 2000, MAT_GOLD = 2000, MAT_VERDANTIUM = 500)

/datum/design/item/mechfab/phazon/right_leg
	name = "Phazon Right Leg"
	id = "phazon_right_leg"
	build_path = /obj/item/mecha_parts/part/phazon_right_leg
	time = 20
	materials = list(DEFAULT_WALL_MATERIAL = 15000, MAT_PHORON = 2000, MAT_GOLD = 2000, MAT_VERDANTIUM = 500)

/datum/design/item/mechfab/rigsuit/precursor
	name = "Xenotech Rig"
	desc = "A rig made of alien tech and materials."
	id = "rigmodule_precursor"
	time = 30
	req_tech = list(TECH_MATERIAL = 9, TECH_ENGINEERING = 6, TECH_PHORON = 5, TECH_MAGNET = 6, TECH_POWER = 6, TECH_ILLEGAL = 8, TECH_PRECURSOR = 3)
	materials = list(MAT_PLASTEEL = 12000, MAT_GOLD = 5000, MAT_GRAPHITE = 8000, MAT_OSMIUM = 3000, MAT_PLASTIC = 6000, MAT_VERDANTIUM = 7500, MAT_MORPHIUM = 20000)
	build_path = /obj/item/rig/ch/precursor
