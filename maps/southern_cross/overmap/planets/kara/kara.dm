// Overmap object for Kara, hanging in the void of space
/obj/effect/overmap/visitable/planet/kara //Naming this /sector/kara for now, but I think it should eventually change to /planet/kara. This is just for a test right now and it should be working on live in the meantime.
	name = "Kara"
	desc = "The seat of NT power in the Vir system lies in the asteroid colony orbiting Kara, the NCS Northern Star. An abandoned aerostat from early Vir colonization floats on the winds of this gas giant."
	scanner_desc = @{"[i]Stellar Body[/i]: Kara
[i]Class[/i]: Jovian Colony
[i]Transponder[/i]: Transmitting (NT), NanoTrasen IFF
[i]Habitability[/i]: Low (High Temperature, Toxic Atmosphere). Habitats in orbit.
[b]Notice[/b]: NT security is currently restricting free flights to Northern Star. Strict adherence to regular scheduling or express approval from management are the only ways in."}
	map_z = list(Z_LEVEL_AEROSTAT)
	in_space = 0
	start_x  = 14
	start_y  = 14
	skybox_offset_x = 128
	skybox_offset_y = 128
	surface_color = "#AD9100"
	mountain_color = "#AD9100"
	water_color = "#AD9100"
	ice_color = "#AD9100"
	icon_state = "chlorine"

/obj/effect/overmap/visitable/planet/kara/Initialize()
	atmosphere = new(CELL_VOLUME)
	atmosphere.adjust_gas_temp("oxygen", MOLES_O2STANDARD, 273)
	atmosphere.adjust_gas_temp("nitrogen", MOLES_N2STANDARD, 273)

	. = ..()

/obj/effect/overmap/visitable/planet/kara/Initialize()
	. = ..()
	docking_codes = null

/obj/effect/overmap/visitable/planet/kara/get_skybox_representation()
	var/image/tmp = ..()
	tmp.pixel_x = skybox_offset_x
	tmp.pixel_y = skybox_offset_y
	return tmp
