/obj/item/circuitboard/microwave/advanced // CHOMPEdit - Removal of obj/item/weapon
	name = T_BOARD("deluxe microwave")
	build_path = /obj/machinery/microwave/advanced
	board_type = new /datum/frame/frame_types/microwave
	matter = list(DEFAULT_WALL_MATERIAL = 50, "glass" = 50)
	req_components = list(
							/obj/item/stock_parts/console_screen = 1, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/stock_parts/motor = 1, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/stock_parts/capacitor = 1) // CHOMPEdit - Removal of obj/item/weapon
