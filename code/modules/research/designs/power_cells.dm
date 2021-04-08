/datum/design/item/powercell
	build_type = PROTOLATHE | MECHFAB

/datum/design/item/powercell/AssembleDesignName()
	name = "Power Cell Model ([item_name])"

/datum/design/item/powercell/AssembleDesignDesc()
	if(build_path)
		var/obj/item/weapon/cell/C = build_path
		desc = "Allows the construction of power cells that can hold [initial(C.maxcharge)] units of energy."

/datum/design/item/powercell/Fabricate()
	var/obj/item/weapon/cell/C = ..()
	C.charge = 0 //shouldn't produce power out of thin air.
	C.update_icon()
	return C

/datum/design/item/powercell/basic
	name = "basic"
	build_type = PROTOLATHE | MECHFAB
	id = "basic_cell"
	req_tech = list(TECH_POWER = 1)
	materials = list(DEFAULT_WALL_MATERIAL = 700, "glass" = 50, MAT_COPPER = 15)
	build_path = /obj/item/weapon/cell
	category = list("Misc")
	sort_string = "BAAAA"

/datum/design/item/powercell/high
	name = "high-capacity"
	build_type = PROTOLATHE | MECHFAB
	id = "high_cell"
	req_tech = list(TECH_POWER = 2)
	materials = list(DEFAULT_WALL_MATERIAL = 700, "glass" = 60, MAT_COPPER = 15)
	build_path = /obj/item/weapon/cell/high
	category = list("Misc")
	sort_string = "BAAAB"

/datum/design/item/powercell/super
	name = "super-capacity"
	id = "super_cell"
	req_tech = list(TECH_POWER = 3, TECH_MATERIAL = 2)
	materials = list(DEFAULT_WALL_MATERIAL = 700, "glass" = 70, MAT_COPPER = 15)
	build_path = /obj/item/weapon/cell/super
	category = list("Misc")
	sort_string = "BAAAC"

/datum/design/item/powercell/hyper
	name = "hyper-capacity"
	id = "hyper_cell"
	req_tech = list(TECH_POWER = 5, TECH_MATERIAL = 4)
	materials = list(DEFAULT_WALL_MATERIAL = 400, "gold" = 150, "silver" = 150, "glass" = 70)
	build_path = /obj/item/weapon/cell/hyper
	category = list("Misc")
	sort_string = "BAAAD"

/datum/design/item/powercell/device
	name = "device"
	build_type = PROTOLATHE
	id = "device"
	materials = list(DEFAULT_WALL_MATERIAL = 350, "glass" = 25, MAT_COPPER = 5)
	build_path = /obj/item/weapon/cell/device
	category = list("Misc")
	sort_string = "BAABA"

//Yawn changes
/datum/design/item/powercell/advance_device
	name = "device, advanced"
	build_type = PROTOLATHE
	id = "advance_device"
	materials = list(DEFAULT_WALL_MATERIAL = 700, "glass" = 50, MAT_COPPER = 15)
	build_path = /obj/item/weapon/cell/device/weapon
	category = list("Misc")
	sort_string = "BAABB"

/datum/design/item/powercell/super_device
	name = "device, super"
	id = "super_device"
	req_tech = list(TECH_POWER = 3, TECH_MATERIAL = 2)
	materials = list(DEFAULT_WALL_MATERIAL = 700, "glass" = 70, "gold" = 50, "silver" = 20, MAT_COPPER = 15)
	build_path = /obj/item/weapon/cell/device/super
	category = list("Misc")
	sort_string = "BAABC"

/datum/design/item/powercell/hype_device
	name = "device, hyper"
	id = "hyper_device"
	req_tech = list(TECH_POWER = 5, TECH_MATERIAL = 4)
	materials = list(DEFAULT_WALL_MATERIAL = 1400, "glass" = 1400, "gold" = 150, "silver" = 150, MAT_COPPER = 50)
	build_path = /obj/item/weapon/cell/device/hyper
	category = list("Misc")
	sort_string = "BAABD"

/datum/design/item/powercell/omni_device
	name = "device, omni"
	req_tech = list(TECH_POWER = 8, TECH_MATERIAL = 7, TECH_ARCANE = 2, TECH_PHORON = 4, TECH_PRECURSOR = 2)
	build_type = PROTOLATHE
	id = "omni-device"
	materials = list(DEFAULT_WALL_MATERIAL = 1700, "glass" = 550, MAT_DURASTEEL = 230, MAT_MORPHIUM = 320, MAT_METALHYDROGEN = 600, MAT_URANIUM = 60, MAT_VERDANTIUM = 150, MAT_PHORON = 900)
	build_path = /obj/item/weapon/cell/device/weapon/recharge/alien/omni
	category = list("Misc")
	sort_string = "BAABE"
//End of Yawn add
