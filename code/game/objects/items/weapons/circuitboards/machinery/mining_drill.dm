#ifndef T_BOARD
#error T_BOARD macro is not defined but we need it!
#endif

/obj/item/circuitboard/miningdrill // CHOMPEdit - Removal of obj/item/weapon
	name = T_BOARD("mining drill head")
	build_path = /obj/machinery/mining/drill
	board_type = new /datum/frame/frame_types/machine
	origin_tech = list(TECH_DATA = 1, TECH_ENGINEERING = 1)
	req_components = list(
							/obj/item/stock_parts/capacitor = 1, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/stock_parts/matter_bin = 1, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/stock_parts/micro_laser = 1) // CHOMPEdit - Removal of obj/item/weapon

/obj/item/circuitboard/miningdrillbrace // CHOMPEdit - Removal of obj/item/weapon
	name = T_BOARD("mining drill brace")
	build_path = /obj/machinery/mining/brace
	board_type = new /datum/frame/frame_types/machine
	origin_tech = list(TECH_DATA = 1, TECH_ENGINEERING = 1)
	req_components = list(
							/obj/item/stock_parts/manipulator = 1 // CHOMPEdit - Removal of obj/item/weapon
						)
