/datum/design/item/mecha/phoron_bore
	name = "PB-23 \"Phobos\" Phoron Bore"
	category = "Exosuit Equipment"
	id ="mech_phoron_bore"
	req_tech = list(TECH_POWER = 5, TECH_PHORON = 5, TECH_MATERIAL = 5)
	materials = list(MAT_PLASTEEL = 4000, "phoron" = 10000, "silver" = 2000)
	build_path =/obj/item/mecha_parts/mecha_equipment/weapon/phoron_bore

/datum/design/item/mechfab/scarab
	category = "Scarab"

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