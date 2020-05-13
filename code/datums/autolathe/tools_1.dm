/datum/design/item/autolathe/tools						//Datum for object designs, used in construction	//IDs of that techs the object originated from and the minimum level requirements.
	category = "Tools"			//category item goes to

/datum/design/item/autolathe/tools/crowbar
	name = "crowbar"
	id = "crowbar"
	build_path = /obj/item/weapon/tool/crowbar
	materials = list(DEFAULT_WALL_MATERIAL = 62)

/datum/design/item/autolathe/tools/multitool
	name = "multitool"
	id = "multitool"
	build_path = /obj/item/device/multitool
	materials = list(DEFAULT_WALL_MATERIAL = 62, "glass" = 25)

/datum/design/item/autolathe/tools/t_scanner
	name = "T-ray scanner"
	id = "t_scanner"
	build_path = /obj/item/device/t_scanner
	materials = list(DEFAULT_WALL_MATERIAL = 187)

/datum/design/item/autolathe/tools/weldertool
	name = "welding tool"
	id = "weldertool"
	build_path = /obj/item/weapon/weldingtool
	materials = list(DEFAULT_WALL_MATERIAL = 87, "glass" = 37)

/datum/design/item/autolathe/tools/electric_welder
	name = "electric welding tool"
	id = "electric_welder"
	build_path = /obj/item/weapon/weldingtool/electric/unloaded
	materials = list(DEFAULT_WALL_MATERIAL = 87, "glass" = 37)
	hidden = 1

/datum/design/item/autolathe/tools/screwdriver
	name = "screwdriver"
	id = "screwdriver"
	build_path = /obj/item/weapon/tool/screwdriver
	materials = list(DEFAULT_WALL_MATERIAL = 93)

/datum/design/item/autolathe/tools/wirecutters
	name = "wirecutters"
	id = "wirecutters"
	build_path = /obj/item/weapon/tool/wirecutters
	materials = list(DEFAULT_WALL_MATERIAL = 100)

/datum/design/item/autolathe/tools/wrench
	name = "wrench"
	id = "wrench"
	build_path = /obj/item/weapon/tool/wrench
	materials = list(DEFAULT_WALL_MATERIAL = 187)

/datum/design/item/autolathe/tools/hatchet
	name = "hatchet"
	id = "hatchet"
	build_path = /obj/item/weapon/material/knife/machete/hatchet
	materials = list(DEFAULT_WALL_MATERIAL = 500)

/datum/design/item/autolathe/tools/minihoe
	name = "mini hoe"
	id = "minihoe"
	build_path = /obj/item/weapon/material/minihoe
	materials = list(DEFAULT_WALL_MATERIAL = 625)

/datum/design/item/autolathe/tools/welder_industrial
	name = "industrial welding tool"
	id = "welder_industrial"
	build_path = /obj/item/weapon/weldingtool/largetank
	materials = list(DEFAULT_WALL_MATERIAL = 87, "glass" = 75)
