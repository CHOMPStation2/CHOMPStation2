/datum/category_item/autolathe/tools/crowbar
	name = "crowbar"
	path =/obj/item/tool/crowbar // CHOMPEdit - Removal of obj/item/weapon

/datum/category_item/autolathe/tools/multitool
	name = "multitool"
	path =/obj/item/multitool // CHOMPEdit - Removal of obj/item/device

/datum/category_item/autolathe/tools/t_scanner
	name = "T-ray scanner"
	path =/obj/item/t_scanner // CHOMPEdit - Removal of obj/item/device

/datum/category_item/autolathe/tools/weldertool
	name = "welding tool"
	path =/obj/item/weldingtool // CHOMPEdit - Removal of obj/item/weapon

/datum/category_item/autolathe/tools/electric_welder
	name = "electric welding tool"
	path =/obj/item/weldingtool/electric/unloaded // CHOMPEdit - Removal of obj/item/weapon
	hidden = 1

/datum/category_item/autolathe/tools/screwdriver
	name = "screwdriver"
	path =/obj/item/tool/screwdriver // CHOMPEdit - Removal of obj/item/weapon

/datum/category_item/autolathe/tools/wirecutters
	name = "wirecutters"
	path =/obj/item/tool/wirecutters // CHOMPEdit - Removal of obj/item/weapon

/datum/category_item/autolathe/tools/wrench
	name = "wrench"
	path =/obj/item/tool/wrench // CHOMPEdit - Removal of obj/item/weapon

/datum/category_item/autolathe/tools/hatchet
	name = "hatchet"
	path =/obj/item/material/knife/machete/hatchet // CHOMPEdit - Removal of obj/item/weapon

/datum/category_item/autolathe/tools/minihoe
	name = "mini hoe"
	path =/obj/item/material/minihoe // CHOMPEdit - Removal of obj/item/weapon

/datum/category_item/autolathe/tools/welder_industrial
	name = "industrial welding tool"
	path =/obj/item/weldingtool/largetank // CHOMPEdit - Removal of obj/item/weapon

/datum/category_item/autolathe/tools/spraybottle
	name = "spray bottle"
	path = /obj/item/reagent_containers/spray // CHOMPEdit - Removal of obj/item/weapon
	resources = list(MAT_PLASTIC = 2000)

/datum/category_item/autolathe/devices/slowwire
	name = "snare wire"
	path = /obj/item/material/barbedwire/plastic // CHOMPEdit - Removal of obj/item/weapon
	resources = list(MAT_PLASTIC = 10000)

/datum/category_item/autolathe/tools/spraynozzle
	name = "spray nozzle"
	path = /obj/item/reagent_containers/spray // CHOMPEdit - Removal of obj/item/weapon
	resources = list(MAT_PLASTIC = 5000, MAT_STEEL = 2000)
	hidden = 1
	man_rating = 2

/datum/category_item/autolathe/tools/rsf
	name = "rapid service fabricator"
	path = /obj/item/rsf // CHOMPEdit - Removal of obj/item/weapon
	
/datum/category_item/autolathe/tools/cable_coil //CHOMPEdit  -- defaults to 1,5,10x with a 30x stack max, need to figure out 30x eventually
	name = "cable coil"
	path =/obj/item/stack/cable_coil
