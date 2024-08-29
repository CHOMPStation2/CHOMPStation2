#ifndef T_BOARD
#error T_BOARD macro is not defined but we need it!
#endif

/obj/item/circuitboard/biogenerator // CHOMPEdit - Removal of obj/item/weapon
	name = T_BOARD("biogenerator")
	build_path = /obj/machinery/biogenerator
	board_type = new /datum/frame/frame_types/machine
	origin_tech = list(TECH_DATA = 2)
	req_components = list(
							/obj/item/stock_parts/matter_bin = 1, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/stock_parts/manipulator = 1) // CHOMPEdit - Removal of obj/item/weapon
