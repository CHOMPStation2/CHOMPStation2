//Phoronics code, courtesy of Dr. Brock.
/turf/simulated/floor/phoronics
	name = "electromagnetic tile"
	icon = 'icons/turf/flooring/circuit.dmi'
	icon_state = "gcircuit_broken"
	initial_flooring = /decl/flooring/phoronics

/decl/flooring/phoronics
	name = "electromagnetic tile"
	desc = "An electromagnetic tile to create an electric field."
	icon = 'icons/turf/flooring/circuit.dmi'
	icon_base = "gcircuit_broken"
	has_damage_range = null
	flags = TURF_REMOVE_CROWBAR
	build_type = /obj/item/stack/tile/phoronics

//phoronics floor tile object
/obj/item/stack/tile/phoronics
	name = "electromagnetic tile"
	singular_name = "electromagnetic tile"
	desc = "A tile for use in the creation of electromagnetic fields"
	icon_state = "fr_tile"
	w_class = 3.0
	force = 1.0
	throwforce = 1.0
	throw_speed = 5
	throw_range = 20
	max_amount = 1
	origin_tech = "magnets=3"
/*
datum/design/item/phoronics_tile
	name = "electromagnetic floor tile"
	id = "phoronics_tile"
	req_tech = list("magnets" = 3, "materials" = 3)
	materials = list(DEFAULT_WALL_MATERIAL = 1000)
	build_path = /obj/item/stack/tile/phoronics */
