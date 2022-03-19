// Overmap object for Kara, hanging in the void of space
/obj/effect/overmap/visitable/planet/kara
	name = "Kara"
	desc = "The seat of NT power in the Vir system lies in the asteroid colony orbiting Kara, the NCS Northern Star."
	scanner_desc = @{"[i]Stellar Body[/i]: Kara
[i]Class[/i]: Jovian Colony
[i]Transponder[/i]: Transmitting (NT), NanoTrasen IFF
[i]Habitability[/i]: Low (High Temperature, Toxic Atmosphere). Habitats in orbit.
[b]Notice[/b]: NT security is currently restricting free flights to Northern Star."}
	map_z = list(Z_LEVEL_NS_MINE) //Using the northern star mine as the map. Located in /maps/southern_cross/overmap/planets/kara/northern_star/
	extra_z_levels = list(Z_LEVEL_NS_MINE)
	initial_generic_waypoints = list("northern_star_mine_dock", "northern_star_mine_echidna_dock") //northern_star.dm landmarks
	in_space = 1
	start_x  = 14
	start_y  = 14
	skybox_offset_x = 128
	skybox_offset_y = 128
	surface_color = "#AD9100"
	mountain_color = "#AD9100"
	water_color = "#AD9100"
	ice_color = "#AD9100"
	icon_state = "chlorine"
	known = 1

/obj/effect/overmap/visitable/planet/kara/Initialize()
	. = ..()
	docking_codes = null

/obj/effect/overmap/visitable/planet/kara/get_space_zlevels() //These are the primary levels that our space station resides in. This also indicates what levels astronauts can drift into.
	return list(Z_LEVEL_NS_MINE)