// -- Datums -- //

/datum/map_template/sc_lateload/northern_star
	name = "Kara - Z1 Northern Star"
	desc = "The Northern Star mines."
	mappath = 'maps/southern_cross/overmap/planets/kara/northern_star/northern_star_mine.dmm'
	associated_map_datum = /datum/map_z_level/sc_lateload/northern_star

/datum/map_z_level/sc_lateload/northern_star
	name = "Northern Star mines"
	z = Z_LEVEL_NS_MINE


// -- Overmap -- //
//This is actually in kara.dm one folder back.
// Overmap object for Kara, hanging in the void of space
/obj/effect/overmap/visitable/planet/kara
	name = "Kara"
	desc = "The seat of NT power in the Vir system lies in the asteroid colony orbiting Kara, the NCS Northern Star."
	scanner_desc = @{"[i]Stellar Body[/i]: Kara
[i]Class[/i]: Jovian Colony
[i]Transponder[/i]: Transmitting (NT), NanoTrasen IFF
[i]Habitability[/i]: Low (High Temperature, Toxic Atmosphere). Habitats in orbit.
[b]Notice[/b]: NT security is currently restricting free flights to Northern Star."}
//	map_z = list(Z_LEVEL_NS_MINE) //Using the northern star mine as the map. Located in /maps/southern_cross/overmap/planets/kara/northern_star/
//	extra_z_levels = list(Z_LEVEL_NS_MINE)
	initial_generic_waypoints = list("northern_star_mine_dock", "northern_star_mine_echidna_dock") //northern_star.dm landmarks
	in_space = 1
	known = TRUE
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
	. = ..()
	docking_codes = null

/obj/effect/overmap/visitable/planet/kara/get_space_zlevels() //These are the primary levels that our space station resides in. This also indicates what levels astronauts can drift into.
	return list(Z_LEVEL_NS_MINE) //May add more later


// -- Areas -- //

/area/outpost/medical
	icon_state = ""

/area/outpost/medical/storage
	name = "Medical Outpost Storage"

/area/outpost/medical/hallway
	name = "Medical Outpost Hallway"

/area/outpost/medical/surgery
	name = "Medical Outpost Surgery"

/area/outpost/medical/dorm
	name = "Medical Outpost Dorms"

/area/outpost/medical/airlocks
	name = "Medical Outpost Airlocks"

/area/outpost/medical/rec
	name = "Medical Outpost Recreation"

/area/outpost/medical/suit_storage
	name = "Medical Outpost Suit Storage"

/area/outpost/medical/power
	name = "Medical Outpost Power"

/area/outpost/medical/main_room
	name = "Medical Outpost Main Room"

/area/outpost/medical/atmos
	name = "Medical Outpost Atmospherics"

/area/outpost/medical/backup_power
	name = "Medical Outpost Backup Power"


// -- Landmarks -- //

/obj/effect/shuttle_landmark/premade/northern_star/ns_mine_dock
	name = "Northern Star Mine - Shuttle Dock"
	landmark_tag = "northern_star_mine_dock"

/obj/effect/shuttle_landmark/premade/northern_star/ns_mine_echidna_dock
	name = "Northern Star Mine - Echidna Dock"
	landmark_tag = "northern_star_mine_echidna_dock"


// -- Turfs -- //
/turf/simulated/mineral/floor/ignore_mapgen/airless
	oxygen = 0
	nitrogen = 0
	temperature = TCMB