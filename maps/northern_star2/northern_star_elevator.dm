/obj/turbolift_map_holder/northern_star
	icon = 'icons/obj/turbolift_preview_5x5.dmi'
	depth = 2
	lift_size_x = 4
	lift_size_y = 4

/obj/turbolift_map_holder/northern_star/cargo
	name = "Northern Star turbolift map placeholder - Cargo"
	dir = SOUTH

	areas_to_use = list(
		/area/turbolift/main_deck,
		/area/turbolift/lower_deck
	)

/obj/turbolift_map_holder/northern_star/rnd
	name = "Northern Star turbolift map placeholder - RnD"
	dir = EAST

	areas_to_use = list(
		/area/turbolift/main_deck,
		/area/turbolift/lower_deck
	)
