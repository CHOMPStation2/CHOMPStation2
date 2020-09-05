// Overmap object for Sif, hanging in the void of space
/obj/effect/overmap/visitable/planet/Sif
	name = "Sif"
	map_z = list(Z_LEVEL_SURFACE, Z_LEVEL_SURFACE_MINE, Z_LEVEL_SURFACE_WILD)
	in_space = 0
	start_x  = 10
	start_y  = 10
	skybox_offset_x = 128
	skybox_offset_y = 128
	surface_color = "#2D545B"
	mountain_color = "#735555"
	ice_color = "FFFFFF"
	icecaps = "icecaps"

	initial_generic_waypoints = list()

/obj/effect/overmap/visitable/planet/Sif/Initialize()
	atmosphere = new(CELL_VOLUME)
	atmosphere.adjust_gas_temp("oxygen", MOLES_O2STANDARD, 273)
	atmosphere.adjust_gas_temp("nitrogen", MOLES_N2STANDARD, 273)

	. = ..()

/obj/effect/overmap/visitable/planet/Sif/Initialize()
	. = ..()
	docking_codes = null

/obj/effect/overmap/visitable/planet/Sif/get_skybox_representation()
	. = ..()
	(.).pixel_x = skybox_offset_x
	(.).pixel_y = skybox_offset_y

/obj/effect/overmap/visitable/sector/Southern_Cross
	name = "Southern Cross"
	icon_state = "object"
	desc = "Southern Cross station, orbiting Sif."
	base = 1
	in_space = 1
	start_x =  10
	start_y =  10
	known = 1 // lets Sectors appear on shuttle navigation for easy finding.
	map_z = list(Z_LEVEL_STATION_ONE, Z_LEVEL_STATION_TWO, Z_LEVEL_STATION_THREE)
	extra_z_levels = list(Z_LEVEL_TRANSIT, Z_LEVEL_MISC) // Hopefully temporary, so arrivals announcements work. //CHOMPedit: adds Z_LEVEL_MISC to connect the exploration carrier with the station
	initial_generic_waypoints = list("stargazer_dock", "d1_aux_a", "d1_aux_b", "d1_aux_c", "d1_aux_d", "d2_w1_a", "d2_w1_c", "d2_w1_e", "d2_w2_e", "d2_w3_a", "d2_w3_c", "d2_w3_e")

/obj/effect/overmap/visitable/planet/Sif/Initialize()
	. = ..()
	docking_codes = null
