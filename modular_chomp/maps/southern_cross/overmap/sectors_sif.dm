// Overmap object for Sif, hanging in the void of space
/obj/effect/overmap/visitable/planet/Sif
	name = "Sif"
	desc = "Location of Vir civilian colonies."
	scanner_desc = @{"[i]Registration[/i]: Vir System Authority
[i]Class[/i]: Colony
[i]Transponder[/i]: Transmitting (CIV), Vir IFF
[b]Notice[/b]: The Vir government welcomes you to this world."}

	map_z = list(Z_LEVEL_SURFACE, Z_LEVEL_SURFACE_MINE, Z_LEVEL_SURFACE_WILD)
	//Z_LEVEL_SURFACE_SKYLANDS, //removed due to lack of use

	initial_generic_waypoints = list(
		"outpost_nw",
		"outpost_s",
		"outpost_w",
		"wilderness_s",
		"wilderness_se",
		"wilderness_w",
		"wilderness_n"
		)

	in_space = 0
	start_x  = 10
	start_y  = 10
	skybox_offset_x = 128
	skybox_offset_y = 128
	surface_color = "#2D545B"
	mountain_color = "#735555"
	ice_color = "FFFFFF"
	icecaps = "icecaps"
	icon_state = "frozen" //CHOMP comment: Not sure what this does at the moment, but we're doing it live.

/obj/effect/overmap/visitable/planet/Sif/Initialize()
	atmosphere = new(CELL_VOLUME)
	atmosphere.adjust_gas_temp("oxygen", MOLES_O2STANDARD, 273)
	atmosphere.adjust_gas_temp("nitrogen", MOLES_N2STANDARD, 273)

	. = ..()

/obj/effect/overmap/visitable/planet/Sif/Initialize()
	. = ..()
	docking_codes = null

/obj/effect/overmap/visitable/planet/Sif/get_skybox_representation()
	var/image/tmp = ..()
	tmp.pixel_x = skybox_offset_x
	tmp.pixel_y = skybox_offset_y
	return tmp
