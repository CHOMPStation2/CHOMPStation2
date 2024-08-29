#ifndef T_BOARD
#error T_BOARD macro is not defined but we need it!
#endif

//
// New shield generator
//

/obj/item/circuitboard/shield_generator // CHOMPEdit - Removal of obj/item/weapon
	name = T_BOARD("advanced shield generator")
	board_type = new /datum/frame/frame_types/machine
	build_path = /obj/machinery/power/shield_generator
	origin_tech = list(TECH_MAGNET = 3, TECH_POWER = 4, TECH_BLUESPACE = 2, TECH_ENGINEERING = 3)
	req_components = list(
		/obj/item/stock_parts/capacitor = 1, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/stock_parts/micro_laser = 1, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/smes_coil = 1, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/stock_parts/console_screen = 1, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/stock_parts/subspace/amplifier = 1, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/stack/cable_coil = 5)

/obj/item/circuitboard/shield_diffuser // CHOMPEdit - Removal of obj/item/weapon
	name = T_BOARD("shield diffuser")
	board_type =  new /datum/frame/frame_types/machine
	build_path = /obj/machinery/shield_diffuser
	origin_tech = list(TECH_MAGNET = 4, TECH_POWER = 2, TECH_ILLEGAL = 1)
	req_components = list(
		/obj/item/stock_parts/capacitor = 1, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/stock_parts/micro_laser = 1, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/stock_parts/console_screen = 1) // CHOMPEdit - Removal of obj/item/weapon

//
// Legacy shield generators
//

/obj/item/circuitboard/shield_gen_ex // CHOMPEdit - Removal of obj/item/weapon
	name = T_BOARD("hull shield generator")
	board_type = new /datum/frame/frame_types/machine
	build_path = /obj/machinery/shield_gen/external
	origin_tech = list(TECH_BLUESPACE = 4, TECH_PHORON = 3)
	req_components = list(
							/obj/item/stock_parts/manipulator/pico = 2, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/stock_parts/subspace/transmitter = 1, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/stock_parts/subspace/crystal = 1, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/stock_parts/subspace/amplifier = 1, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/stock_parts/console_screen = 1, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/stack/cable_coil = 5)

/obj/item/circuitboard/shield_gen // CHOMPEdit - Removal of obj/item/weapon
	name = T_BOARD("bubble shield generator")
	board_type = new /datum/frame/frame_types/machine
	build_path = /obj/machinery/shield_gen
	origin_tech = list(TECH_BLUESPACE = 4, TECH_PHORON = 3)
	req_components = list(
							/obj/item/stock_parts/manipulator/pico = 2, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/stock_parts/subspace/transmitter = 1, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/stock_parts/subspace/crystal = 1, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/stock_parts/subspace/amplifier = 1, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/stock_parts/console_screen = 1, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/stack/cable_coil = 5)

/obj/item/circuitboard/shield_cap // CHOMPEdit - Removal of obj/item/weapon
	name = T_BOARD("shield capacitor")
	board_type = new /datum/frame/frame_types/machine
	build_path = /obj/machinery/shield_capacitor
	origin_tech = list(TECH_MAGNET = 3, TECH_POWER = 4)
	req_components = list(
							/obj/item/stock_parts/manipulator/pico = 2, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/stock_parts/subspace/sub_filter = 1, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/stock_parts/subspace/treatment = 1, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/stock_parts/subspace/analyzer = 1, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/stock_parts/console_screen = 1, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/stack/cable_coil = 5)
