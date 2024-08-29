#ifndef T_BOARD
#error T_BOARD macro is not defined but we need it!
#endif

/obj/item/circuitboard/jukebox // CHOMPEdit - Removal of obj/item/weapon
	name = T_BOARD("jukebox")
	build_path = /obj/machinery/media/jukebox
	board_type = new /datum/frame/frame_types/machine
	origin_tech = list(TECH_MAGNET = 2, TECH_DATA = 1)
	req_components = list(
							/obj/item/stock_parts/capacitor = 1, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/stock_parts/console_screen = 1, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/stack/cable_coil = 5)
