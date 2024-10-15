/obj/turbolift_map_holder/southern_cross
	icon = 'icons/obj/turbolift_preview_5x5.dmi'
	depth = 3
	lift_size_x = 4
	lift_size_y = 4

/obj/turbolift_map_holder/southern_cross/port
	name = "Southern Cross turbolift map placeholder - Port"
	dir = EAST

	areas_to_use = list(
//		/area/turbolift/port_deck_maints, // CHOMPEdit - Maintenance deck (Removed for new map. KAS)
		/area/turbolift/port_deck_one,
		/area/turbolift/port_deck_two,
		/area/turbolift/port_deck_three
		)

/obj/turbolift_map_holder/southern_cross/starboard
	name = "Sothern Cross turbolift map placeholder - Starboard"
	dir = WEST

	areas_to_use = list(
		/area/turbolift/starboard_deck_one,
		/area/turbolift/starboard_deck_two,
		/area/turbolift/starboard_deck_three
		)

/obj/turbolift_map_holder/southern_cross/cargo
	name = "Sothern Cross turbolift map placeholder - Cargo"
	dir = WEST
	depth = 2

	areas_to_use = list(
		/area/turbolift/cargo_deck_one,
		/area/turbolift/cargo_deck_two
		)

/obj/turbolift_map_holder/southern_cross/center
	name = "Southern Cross turbolift map placeholder - Center"

	areas_to_use = list(
		/area/turbolift/center_deck_one,
		/area/turbolift/center_deck_two,
		/area/turbolift/center_deck_three
		)

/obj/turbolift_map_holder/southern_cross/aft
	name = "Southern Cross turbolift map placeholder - Aft"
	dir = NORTH

	areas_to_use = list(
		/area/turbolift/aft_deck_one,
		/area/turbolift/aft_deck_two,
		/area/turbolift/aft_deck_three
	)

/obj/turbolift_map_holder/southern_cross/forward
	name = "Southern Cross turbolift map placeholder - Forward"
	dir = WEST

	areas_to_use = list(
		/area/turbolift/forward_deck_one,
		/area/turbolift/forward_deck_two,
		/area/turbolift/forward_deck_three
	)
