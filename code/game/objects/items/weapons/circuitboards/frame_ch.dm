/obj/item/circuitboard/microwave/advanced
	name = T_BOARD("deluxe microwave")
	build_path = /obj/machinery/microwave/advanced
	board_type = new /datum/frame/frame_types/microwave
	matter = list(DEFAULT_WALL_MATERIAL = 50, "glass" = 50)
	req_components = list(
							/obj/item/stock_parts/console_screen = 1,
							/obj/item/stock_parts/motor = 1,
							/obj/item/stock_parts/capacitor = 1)
