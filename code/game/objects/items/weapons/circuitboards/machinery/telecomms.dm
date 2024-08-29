#ifndef T_BOARD
#error T_BOARD macro is not defined but we need it!
#endif

/obj/item/circuitboard/telecomms // CHOMPEdit - Removal of obj/item/weapon
	board_type = new /datum/frame/frame_types/machine

/obj/item/circuitboard/telecomms/receiver // CHOMPEdit - Removal of obj/item/weapon
	name = T_BOARD("subspace receiver")
	build_path = /obj/machinery/telecomms/receiver
	origin_tech = list(TECH_DATA = 4, TECH_ENGINEERING = 3, TECH_BLUESPACE = 2)
	req_components = list(
							/obj/item/stock_parts/subspace/ansible = 1, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/stock_parts/subspace/sub_filter = 1, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/stock_parts/manipulator = 2, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/stock_parts/micro_laser = 1) // CHOMPEdit - Removal of obj/item/weapon

/obj/item/circuitboard/telecomms/hub // CHOMPEdit - Removal of obj/item/weapon
	name = T_BOARD("hub mainframe")
	build_path = /obj/machinery/telecomms/hub
	origin_tech = list(TECH_DATA = 4, TECH_ENGINEERING = 4)
	req_components = list(
							/obj/item/stock_parts/manipulator = 2, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/stack/cable_coil = 2,
							/obj/item/stock_parts/subspace/sub_filter = 2) // CHOMPEdit - Removal of obj/item/weapon

/obj/item/circuitboard/telecomms/relay // CHOMPEdit - Removal of obj/item/weapon
	name = T_BOARD("relay mainframe")
	build_path = /obj/machinery/telecomms/relay
	origin_tech = list(TECH_DATA = 3, TECH_ENGINEERING = 4, TECH_BLUESPACE = 3)
	req_components = list(
							/obj/item/stock_parts/manipulator = 2, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/stack/cable_coil = 2,
							/obj/item/stock_parts/subspace/sub_filter = 2) // CHOMPEdit - Removal of obj/item/weapon

/obj/item/circuitboard/telecomms/bus // CHOMPEdit - Removal of obj/item/weapon
	name = T_BOARD("bus mainframe")
	build_path = /obj/machinery/telecomms/bus
	origin_tech = list(TECH_DATA = 4, TECH_ENGINEERING = 4)
	req_components = list(
							/obj/item/stock_parts/manipulator = 2, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/stack/cable_coil = 1,
							/obj/item/stock_parts/subspace/sub_filter = 1) // CHOMPEdit - Removal of obj/item/weapon

/obj/item/circuitboard/telecomms/processor // CHOMPEdit - Removal of obj/item/weapon
	name = T_BOARD("processor unit")
	build_path = /obj/machinery/telecomms/processor
	origin_tech = list(TECH_DATA = 4, TECH_ENGINEERING = 4)
	req_components = list(
							/obj/item/stock_parts/manipulator = 3, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/stock_parts/subspace/sub_filter = 1, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/stock_parts/subspace/treatment = 2, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/stock_parts/subspace/analyzer = 1, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/stack/cable_coil = 2,
							/obj/item/stock_parts/subspace/amplifier = 1) // CHOMPEdit - Removal of obj/item/weapon

/obj/item/circuitboard/telecomms/server // CHOMPEdit - Removal of obj/item/weapon
	name = T_BOARD("telecommunication server")
	build_path = /obj/machinery/telecomms/server
	origin_tech = list(TECH_DATA = 4, TECH_ENGINEERING = 4)
	req_components = list(
							/obj/item/stock_parts/manipulator = 2, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/stack/cable_coil = 1,
							/obj/item/stock_parts/subspace/sub_filter = 1) // CHOMPEdit - Removal of obj/item/weapon

/obj/item/circuitboard/telecomms/broadcaster // CHOMPEdit - Removal of obj/item/weapon
	name = T_BOARD("subspace broadcaster")
	build_path = /obj/machinery/telecomms/broadcaster
	origin_tech = list(TECH_DATA = 4, TECH_ENGINEERING = 4, TECH_BLUESPACE = 2)
	req_components = list(
							/obj/item/stock_parts/manipulator = 2, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/stack/cable_coil = 1,
							/obj/item/stock_parts/subspace/sub_filter = 1, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/stock_parts/subspace/crystal = 1, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/stock_parts/micro_laser/high = 2) // CHOMPEdit - Removal of obj/item/weapon

//This isn't a real telecomms board but I don't want to make a whole file to hold only one circuitboard.
/obj/item/circuitboard/telecomms/exonet_node // CHOMPEdit - Removal of obj/item/weapon
	name = T_BOARD("exonet node")
	build_path = /obj/machinery/exonet_node
	origin_tech = list(TECH_DATA = 5, TECH_ENGINEERING = 5, TECH_BLUESPACE = 4)
	req_components = list(
							/obj/item/stock_parts/subspace/ansible = 1, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/stock_parts/subspace/sub_filter = 1, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/stock_parts/manipulator = 2, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/stock_parts/micro_laser = 1, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/stock_parts/subspace/crystal = 1, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/stock_parts/subspace/treatment = 2, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/stack/cable_coil = 2)

/obj/item/circuitboard/telecomms/pda_multicaster // CHOMPEdit - Removal of obj/item/weapon
	name = T_BOARD("pda multicaster")
	build_path = /obj/machinery/pda_multicaster
	origin_tech = list(TECH_DATA = 3, TECH_ENGINEERING = 2, TECH_BLUESPACE = 2)
	req_components = list(
							/obj/item/stock_parts/subspace/ansible = 1, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/stock_parts/subspace/sub_filter = 1, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/stock_parts/manipulator = 1, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/stock_parts/subspace/treatment = 1, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/stack/cable_coil = 2)