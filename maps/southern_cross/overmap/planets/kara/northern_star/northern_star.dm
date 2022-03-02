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