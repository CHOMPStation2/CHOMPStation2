#ifndef T_BOARD
#error T_BOARD macro is not defined but we need it!
#endif

// The circuit boards

/obj/item/circuitboard/telesci_console // CHOMPEdit - Removal of obj/item/weapon
	name = T_BOARD("Telepad Control Console")
	build_path = /obj/machinery/computer/telescience
	origin_tech = list(TECH_DATA = 3, TECH_BLUESPACE = 3, TECH_PHORON = 4)

/obj/item/circuitboard/telesci_pad // CHOMPEdit - Removal of obj/item/weapon
	name = T_BOARD("Telepad")
	board_type = new /datum/frame/frame_types/machine
	build_path = /obj/machinery/telepad
	origin_tech = list(TECH_DATA = 4, TECH_ENGINEERING = 4, TECH_PHORON = 4, TECH_BLUESPACE = 5)
	req_components = list(
							/obj/item/bluespace_crystal = 1, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/stock_parts/capacitor = 2, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/stack/cable_coil = 5,
							/obj/item/stock_parts/console_screen = 1) // CHOMPEdit - Removal of obj/item/weapon

// Bamfpads! Ported from /tg/
/obj/item/circuitboard/quantumpad // CHOMPEdit - Removal of obj/item/weapon
	name = T_BOARD("quantum pad")
	board_type = new /datum/frame/frame_types/machine
	build_path = /obj/machinery/power/quantumpad
	origin_tech = list(TECH_ENGINEERING = 4, TECH_POWER = 4, TECH_BLUESPACE = 4)
	req_components = list(
		/obj/item/bluespace_crystal = 1, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/stock_parts/capacitor = 1, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/stock_parts/manipulator = 1, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/stack/cable_coil = 5)
