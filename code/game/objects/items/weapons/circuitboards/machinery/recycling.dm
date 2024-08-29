#ifndef T_BOARD
#error T_BOARD macro is not defined but we need it!
#endif

/obj/item/circuitboard/recycler_crusher // CHOMPEdit - Removal of obj/item/weapon
	name = T_BOARD("recycler - crusher")
	build_path = /obj/machinery/recycling/crusher
	board_type = new /datum/frame/frame_types/machine
	origin_tech = list(TECH_MATERIAL = 2)
	matter = list(MAT_STEEL = 50, MAT_GLASS = 50)
	req_components = list(
		/obj/item/stack/cable_coil = 2,
		/obj/item/stock_parts/motor = 1, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/stock_parts/gear = 1, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/stock_parts/matter_bin = 1, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/stock_parts/manipulator = 1 // CHOMPEdit - Removal of obj/item/weapon
		)

/obj/item/circuitboard/recycler_sorter // CHOMPEdit - Removal of obj/item/weapon
	name = T_BOARD("recycler - sorter")
	build_path = /obj/machinery/recycling/sorter
	board_type = new /datum/frame/frame_types/machine
	origin_tech = list(TECH_MATERIAL = 2)
	matter = list(MAT_STEEL = 50, MAT_GLASS = 50)
	req_components = list(
		/obj/item/stack/cable_coil = 2,
		/obj/item/stock_parts/motor = 1, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/stock_parts/gear = 3 // CHOMPEdit - Removal of obj/item/weapon
	)

/obj/item/circuitboard/recycler_stamper // CHOMPEdit - Removal of obj/item/weapon
	name = T_BOARD("recycler - stamper")
	build_path = /obj/machinery/recycling/stamper
	board_type = new /datum/frame/frame_types/machine
	origin_tech = list(TECH_MATERIAL = 2)
	matter = list(MAT_STEEL = 50, MAT_GLASS = 50)
	req_components = list(
		/obj/item/stack/cable_coil = 2,
		/obj/item/stock_parts/gear = 2, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/stock_parts/motor = 2 // CHOMPEdit - Removal of obj/item/weapon
	)
