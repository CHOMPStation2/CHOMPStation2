// Overmap object for Thor, hanging in the void of space
/obj/effect/overmap/visitable/planet/Thor
	name = "Thor"
	desc = "Location of NT and Vir civilian colonies."
	scanner_desc = @{"[i]Registration[/i]: Vir System Authority
[i]Class[/i]: Colony
[i]Transponder[/i]: Transmitting (CIV), Vir IFF
[b]Notice[/b]: The Vir government welcomes you to this world."}

	// Set map_z to your levels for a planetary base. If you're ever going to split this up/add more Z's to Thor, imitate SC. THESE MUST BE DEFINED FOR SENSORS + SUCH TO WORK.
	map_z = list(Z_LEVEL_CATACOMBS, Z_LEVEL_UNDERGROUND, Z_LEVEL_SURFACE, Z_LEVEL_UPPER_FLOORS, Z_LEVEL_SURFACE_WILDS, Z_LEVEL_SURFACE_OCEAN, Z_LEVEL_CARRIER)

	initial_generic_waypoints = list(
		"baby_mammoth_dock",
		"echidna_dock",
		"stargazer_dock",
		"ursula_dock",
		"needle_dock",
		)

	in_space = 0
	start_x  = 11
	start_y  = 11
	skybox_offset_x = 128
	skybox_offset_y = 128
	surface_color = "#3A5934"
	mountain_color = "#725C45"
	ice_color = "FFFFFF"
	icecaps = "icecaps"
	icon_state = "lush" //yeet

/obj/effect/overmap/visitable/planet/Thor/Initialize(mapload)
	atmosphere = new(CELL_VOLUME)
	atmosphere.adjust_gas_temp(GAS_O2, MOLES_O2STANDARD, 273)
	atmosphere.adjust_gas_temp(GAS_N2, MOLES_N2STANDARD, 273)

	. = ..()

/obj/effect/overmap/visitable/planet/Thor/get_space_zlevels()
	return list(Z_LEVEL_CARRIER)

/obj/effect/overmap/visitable/planet/Thor/Initialize(mapload)
	. = ..()
	docking_codes = null

/obj/effect/overmap/visitable/planet/Thor/get_skybox_representation()
	var/image/tmp = ..()
	tmp.pixel_x = skybox_offset_x
	tmp.pixel_y = skybox_offset_y
	return tmp
