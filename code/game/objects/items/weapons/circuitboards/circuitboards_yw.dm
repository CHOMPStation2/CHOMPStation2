/obj/item/circuitboard/geiger // CHOMPEdit - Removal of obj/item/weapon
	name = T_BOARD("geiger counter")
	build_path = /obj/item/geiger/wall // CHOMPEdit - Removal of obj/item/device
	board_type = new /datum/frame/frame_types/geiger
	matter = list(DEFAULT_WALL_MATERIAL = 50, "glass" = 50)