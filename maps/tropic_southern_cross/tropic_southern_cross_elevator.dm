/obj/turbolift_map_holder/southern_cross
	icon = 'icons/obj/turbolift_preview_5x5.dmi'
	depth = 2
	lift_size_x = 4
	lift_size_y = 4

/obj/turbolift_map_holder/southern_cross/port
	name = "Sothern Cross turbolift map placeholder - Port"
	dir = EAST

	areas_to_use = list(
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


/obj/turbolift_map_holder/southern_cross/center
	name = "Sothern Cross turbolift map placeholder - Center"
	depth = 2

	areas_to_use = list(
		/area/turbolift/center_deck_one,
		/area/turbolift/center_deck_two,
		/area/turbolift/center_deck_three
		)

/obj/turbolift_map_holder/mining_elevator
	name = "Mining Elevator"
	icon = 'icons/obj/turbolift_preview_5x5.dmi'
	depth = 2
	lift_size_x = 4
	lift_size_y = 4

/obj/turbolift_map_holder/mining_elevator/a
	dir = NORTH
	areas_to_use = list(
		/area/turbolift/liftA_surface,
		/area/turbolift/liftA_caverns
		)

/obj/turbolift_map_holder/mining_elevator/b
	areas_to_use = list(
		/area/turbolift/liftB_surface,
		/area/turbolift/liftB_caverns
		)

/obj/turbolift_map_holder/mining_elevator/c
	areas_to_use = list(
		/area/turbolift/liftC_surface,
		/area/turbolift/liftC_caverns
		)