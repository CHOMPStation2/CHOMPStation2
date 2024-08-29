/obj/item/circuitboard/microwave // CHOMPEdit - Removal of obj/item/weapon
	name = T_BOARD("microwave")
	desc = "The circuitboard for a microwave."
	build_path = /obj/machinery/microwave
	board_type = new /datum/frame/frame_types/microwave
	contain_parts = 0
	matter = list(MAT_STEEL = 50, MAT_GLASS = 50)
	req_components = list(
							/obj/item/stock_parts/console_screen = 1, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/stock_parts/capacitor = 3, // Original Capacitor count was 1 // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/stock_parts/motor = 1, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/stock_parts/scanning_module = 1, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/stock_parts/matter_bin = 2) // CHOMPEdit - Removal of obj/item/weapon

/obj/item/circuitboard/oven // CHOMPEdit - Removal of obj/item/weapon
	name = T_BOARD("oven")
	desc = "The circuitboard for an oven."
	build_path = /obj/machinery/appliance/cooker/oven
	board_type = new /datum/frame/frame_types/machine
	matter = list(MAT_STEEL = 50, MAT_GLASS = 50)
	req_components = list(
							/obj/item/stock_parts/capacitor = 3, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/stock_parts/scanning_module = 1, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/stock_parts/matter_bin = 2) // CHOMPEdit - Removal of obj/item/weapon

/obj/item/circuitboard/fryer // CHOMPEdit - Removal of obj/item/weapon
	name = T_BOARD("deep fryer")
	desc = "The circuitboard for a deep fryer."
	build_path = /obj/machinery/appliance/cooker/fryer
	board_type = new /datum/frame/frame_types/machine
	req_components = list(
							/obj/item/stock_parts/capacitor = 3, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/stock_parts/scanning_module = 1, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/stock_parts/matter_bin = 2) // CHOMPEdit - Removal of obj/item/weapon

/obj/item/circuitboard/grill // CHOMPEdit - Removal of obj/item/weapon
	name = T_BOARD("grill")
	desc = "The circuitboard for an industrial grill."
	build_path = /obj/machinery/appliance/cooker/grill
	board_type = new /datum/frame/frame_types/machine
	req_components = list(
							/obj/item/stock_parts/capacitor = 3, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/stock_parts/scanning_module = 1, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/stock_parts/matter_bin = 2) // CHOMPEdit - Removal of obj/item/weapon

/obj/item/circuitboard/cerealmaker // CHOMPEdit - Removal of obj/item/weapon
	name = T_BOARD("cereal maker")
	desc = "The circuitboard for a cereal maker."
	build_path = /obj/machinery/appliance/mixer/cereal
	board_type = new /datum/frame/frame_types/machine
	req_components = list(
							/obj/item/stock_parts/capacitor = 3, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/stock_parts/scanning_module = 1, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/stock_parts/matter_bin = 2) // CHOMPEdit - Removal of obj/item/weapon

/obj/item/circuitboard/candymachine // CHOMPEdit - Removal of obj/item/weapon
	name = T_BOARD("candy machine")
	desc = "The circuitboard for a candy machine."
	build_path = /obj/machinery/appliance/mixer/candy
	board_type = new /datum/frame/frame_types/machine
	req_components = list(
							/obj/item/stock_parts/capacitor = 3, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/stock_parts/scanning_module = 1, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/stock_parts/matter_bin = 2) // CHOMPEdit - Removal of obj/item/weapon

/obj/item/circuitboard/microwave/advanced // CHOMPEdit - Removal of obj/item/weapon
	name = T_BOARD("deluxe microwave")
	build_path = /obj/machinery/microwave/advanced
	board_type = new /datum/frame/frame_types/microwave
	matter = list(MAT_STEEL = 50, MAT_GLASS = 50)
	req_components = list(
							/obj/item/stock_parts/console_screen = 1, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/stock_parts/motor = 1, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/stock_parts/capacitor = 1) // CHOMPEdit - Removal of obj/item/weapon
