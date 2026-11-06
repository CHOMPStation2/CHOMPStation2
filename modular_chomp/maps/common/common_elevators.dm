/obj/turbolift_map_holder/southern_cross
	icon = 'icons/obj/turbolift_preview_5x5.dmi'
	depth = 2
	lift_size_x = 4
	lift_size_y = 4

/obj/turbolift_map_holder/southern_cross/port
	name = "Southern Cross turbolift map placeholder - Port"
	dir = EAST
	depth = 3

	areas_to_use = list(
		/area/turbolift/port_deck_maints,
		/area/turbolift/port_deck_one,
		/area/turbolift/port_deck_two
		)

/obj/turbolift_map_holder/southern_cross/starboard
	name = "Sothern Cross turbolift map placeholder - Starboard"
	dir = WEST

	areas_to_use = list(
		/area/turbolift/starboard_deck_one,
		/area/turbolift/starboard_deck_two
		)

/obj/turbolift_map_holder/southern_cross/cargo
	name = "Sothern Cross turbolift map placeholder - Cargo"
	dir = WEST

	areas_to_use = list(
		/area/turbolift/cargo_deck_one,
		/area/turbolift/cargo_deck_two
		)

/obj/turbolift_map_holder/southern_cross/center
	name = "Sothern Cross turbolift map placeholder - Center"
	depth = 3

	areas_to_use = list(
		/area/turbolift/center_deck_one,
		/area/turbolift/center_deck_two,
		/area/turbolift/center_deck_three
		)

/obj/turbolift_map_holder/soluna_nexus
	icon = 'icons/obj/turbolift_preview_5x5.dmi'
	depth = 3
	lift_size_x = 4
	lift_size_y = 4

/obj/turbolift_map_holder/soluna_nexus/port
	name = "Southern Cross turbolift map placeholder - Port"
	dir = EAST

	areas_to_use = list(
		/area/turbolift/port_deck_one,
		/area/turbolift/port_deck_two,
		/area/turbolift/port_deck_three
		)

/obj/turbolift_map_holder/soluna_nexus/starboard
	name = "Sothern Cross turbolift map placeholder - Starboard"
	dir = WEST

	areas_to_use = list(
		/area/turbolift/starboard_deck_one,
		/area/turbolift/starboard_deck_two,
		/area/turbolift/starboard_deck_three
		)

/obj/turbolift_map_holder/soluna_nexus/cargo
	name = "Sothern Cross turbolift map placeholder - Cargo"
	dir = WEST
	depth = 2

	areas_to_use = list(
		/area/turbolift/cargo_deck_one,
		/area/turbolift/cargo_deck_two
		)

/obj/turbolift_map_holder/soluna_nexus/center
	name = "Southern Cross turbolift map placeholder - Center"
	wall_type = null

	areas_to_use = list(
		/area/turbolift/center_deck_one,
		/area/turbolift/center_deck_two,
		/area/turbolift/center_deck_three
		)

/obj/turbolift_map_holder/soluna_nexus/aft
	name = "Southern Cross turbolift map placeholder - Aft"
	dir = NORTH
	wall_type = null

	areas_to_use = list(
		/area/turbolift/aft_deck_one,
		/area/turbolift/aft_deck_two,
		/area/turbolift/aft_deck_three
	)

/obj/turbolift_map_holder/soluna_nexus/forward
	name = "Southern Cross turbolift map placeholder - Forward"
	dir = WEST

	areas_to_use = list(
		/area/turbolift/forward_deck_one,
		/area/turbolift/forward_deck_two,
		/area/turbolift/forward_deck_three
	)

/obj/turbolift_map_holder/relic_base
	icon = 'icons/obj/turbolift_preview_5x5.dmi'
	depth = 2
	lift_size_x = 4
	lift_size_y = 4

/obj/turbolift_map_holder/relic_base/port
	name = "Relic Base turbolift map placeholder - Cargo"
	dir = EAST

	areas_to_use = list(
		/area/turbolift/port_deck_one,
		/area/turbolift/port_deck_two
		)

/obj/turbolift_map_holder/cetus
	icon = 'icons/obj/turbolift_preview_5x5.dmi'
	depth = 3
	lift_size_x = 4
	lift_size_y = 4

/obj/turbolift_map_holder/cetus/atrium
	name = "Cetus turbolift map placeholder - Atrium"
	dir = NORTH
	wall_type = null

	areas_to_use = list(
		/area/turbolift/atrium_deck_one,
		/area/turbolift/atrium_deck_two,
		/area/turbolift/atrium_deck_three
	)

/obj/turbolift_map_holder/cetus/utility
	name = "Cetus turbolift map placeholder - Utility Atrium"
	dir = WEST

	areas_to_use = list(
		/area/turbolift/utility_atrium_deck_one,
		/area/turbolift/utility_atrium_deck_two,
		/area/turbolift/utility_atrium_deck_three
	)

/obj/turbolift_map_holder/cryogaia/lumber
	icon = 'icons/obj/turbolift_preview_5x5.dmi'
	depth = 5
	lift_size_x = 4
	lift_size_y = 4

/obj/turbolift_map_holder/cryogaia/lumber/serviceelevator
	name = "Lumber turbolift Service Elevator map placeholder"
	dir = NORTH

	areas_to_use = list(
		/area/turbolift/lumber_floor_underground_mine,
		/area/turbolift/lumber_floor_underground_transit,
		/area/turbolift/lumber_floor_basement,
		/area/turbolift/lumber_floor_main_level,
		/area/turbolift/lumber_floor_upper_level,
		)

/obj/turbolift_map_holder/cryogaia/lumber/medevator
	icon = 'icons/obj/turbolift_preview_3x3.dmi'
	depth = 3
	lift_size_x = 3
	lift_size_y = 3
	dir = EAST
	name = "Lumber turbolift Medbay Elevator map placeholder"

	areas_to_use = list(
		/area/turbolift/lumber_floor_medibasement,
		/area/turbolift/lumber_floor_medical,
		/area/turbolift/lumber_floor_mediupper,
		)
