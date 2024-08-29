#ifndef T_BOARD
#error T_BOARD macro is not defined but we need it!
#endif

/obj/item/circuitboard/mining_equipment_vendor // CHOMPEdit - Removal of obj/item/weapon
	name = T_BOARD("Mining Equipment Vendor")
	board_type = new /datum/frame/frame_types/machine
	build_path = /obj/machinery/mineral/equipment_vendor
	origin_tech = list(TECH_DATA = 1, TECH_ENGINEERING = 3)
	req_components = list(
							/obj/item/stock_parts/console_screen = 1, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/stock_parts/matter_bin = 3) // CHOMPEdit - Removal of obj/item/weapon

/obj/item/circuitboard/exploration_equipment_vendor // CHOMPEdit - Removal of obj/item/weapon
	name = T_BOARD("Exploration Equipment Vendor")
	board_type = new /datum/frame/frame_types/machine
	build_path = /obj/machinery/mineral/equipment_vendor/survey
	origin_tech = list(TECH_DATA = 1, TECH_ENGINEERING = 2)
	req_components = list(
							/obj/item/stock_parts/console_screen = 1, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/stock_parts/matter_bin = 3) // CHOMPEdit - Removal of obj/item/weapon
