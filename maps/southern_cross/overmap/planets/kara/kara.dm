// Overmap object for Kara, hanging in the void of space
/obj/effect/overmap/visitable/planet/kara
	name = "Kara"
	desc = "The seat of NT power in the Vir system lies in the asteroid colony orbiting Kara, the NCS Northern Star."
	scanner_desc = @{"[i]Stellar Body[/i]: Kara
[i]Class[/i]: Jovian Colony
[i]Transponder[/i]: Transmitting (NT), NanoTrasen IFF
[i]Habitability[/i]: Low (High Temperature, Toxic Atmosphere). Habitats in orbit.
[b]Notice[/b]: NT security is currently restricting free flights to Northern Star."}
	map_z = (Z_LEVEL_AEROSTAT) //This is just so that I can get the skybox background in. I have Kara and aerostat objects on the aerostat map which is highly unusual, but necessary.
//	extra_z_levels = list(Z_LEVEL_AEROSTAT)
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
	known = TRUE

/*
/obj/effect/overmap/visitable/planet/kara/Initialize()
	atmosphere = new(CELL_VOLUME)
	atmosphere.adjust_gas_temp("oxygen", MOLES_O2STANDARD, 273)
	atmosphere.adjust_gas_temp("nitrogen", MOLES_N2STANDARD, 273)

	. = ..()
*/