

/turf/simulated/floor/maglev/unpowered
	desc = "Magnetic levitation tram tracks. Unpowered? Looks like it. Safe? Your try."

/turf/simulated/floor/maglev/unpowered/Entered(var/atom/movable/AM, var/atom/old_loc)
	return // No zappy.

/turf/simulated/mineral/thor

/turf/simulated/mineral/thor/ignore_oregen
	ignore_oregen = TRUE

/turf/simulated/mineral/thor/ignore_cavegen
	ignore_cavegen = TRUE

/turf/simulated/mineral/thor/ignore_mapgen
	ignore_mapgen = TRUE

/turf/simulated/mineral/thor/floor

/turf/simulated/mineral/thor/floor/ignore_oregen
	ignore_oregen = TRUE

/turf/simulated/mineral/thor/floor/ignore_cavegen
	ignore_cavegen = TRUE

/turf/simulated/mineral/thor/floor/ignore_mapgen
	ignore_mapgen = TRUE


/turf/simulated/mineral/thor/floor/cave
	name = "basalt"
	desc = "Loose, rocky basalt. It crumbles to sand under the slightest bit of force."
	icon_state = "basalt0"
	icon = 'modular_chomp/icons/turf/thor.dmi'

/turf/simulated/mineral/thor/mines
	name = "dark rock"
	desc = "Dark black basalt. Rich in exotic minerals."
	icon_state = "deeprock"
	icon = 'modular_chomp/icons/turf/thor.dmi'
	temperature = 393.15

/turf/unsimulated/mineral/thor/mines
	name = "impassable dark rock"
	desc = "Dark black basalt. Packed impossibly tightly, no way to get past this."
	icon_state = "deeprock-solid"
	icon = 'modular_chomp/icons/turf/thor.dmi'
	temperature = 393.15

/turf/simulated/mineral/thor/floor/ignore_mapgen/cave
	name = "basalt"

/turf/simulated/mineral/thor/ignore_mapgen/cave
	name = "dark rock"

// default shuttle roof type - blanket define our shuttle area ceiling type, we have multi-Zs and the default is none.
/turf/simulated/floor/reinforced/airless/shuttleroof
	// A special type just to make sure we don't delete airless reinforced when shuttles depart

/turf/unsimulated/wall/seperator //to block vision between transit zones
	name = ""
	icon = 'icons/effects/effects.dmi'
	icon_state = "1"

/turf/simulated/mineral/cetus
	desc = "Solid rock"
	floor_name = "rocks"
	outdoors = FALSE
	ignore_cavegen = TRUE
	sand_icon_path = 'icons/turf/outdoors.dmi'
	sand_icon_state = "rock_brown"
	oxygen		= MOLES_O2STANDARD
	nitrogen	= MOLES_N2STANDARD
	temperature = T20C
	flags = TURF_UNSHIELDABLE

/turf/simulated/floor/outdoors/rocks/cetus
	name = "rocks"
	outdoors = FALSE
	icon_state = "rock_brown"
	oxygen		= MOLES_O2STANDARD
	nitrogen	= MOLES_N2STANDARD
	temperature = T20C
	initial_flooring = /decl/flooring/rock/cetus
	flags = null

/decl/flooring/rock/cetus
	icon_base = "rock_brown"

/turf/simulated/mineral/cetus/edge
	name = "cold rock"
	desc = "Solid rock. It's cool to the touch. Digging through this will probably expose the area to hard vacuum!"
	outdoors = TRUE
	sand_icon_path = 'icons/turf/outdoors.dmi'
	sand_icon_state = "rock_brown"
	icon_state = "rock-dark"
	ignore_mapgen = TRUE
	oxygen = 0
	nitrogen = 0
	temperature = TCMB

/turf/simulated/floor/outdoors/rocks/cetus/edge
	outdoors = TRUE
	icon_state = "rock_brown"
	oxygen = 0
	nitrogen = 0
	temperature = TCMB

/turf/simulated/floor/water/indoors/station
	name = "shallow water"
	oxygen		= MOLES_O2STANDARD
	nitrogen	= MOLES_N2STANDARD
	temperature = T20C

/turf/simulated/floor/water/deep/indoors/station
	oxygen		= MOLES_O2STANDARD
	nitrogen	= MOLES_N2STANDARD
	temperature = T20C

/turf/simulated/floor/water/hotspring/station
	oxygen		= MOLES_O2STANDARD
	nitrogen	= MOLES_N2STANDARD
	temperature = T20C

/turf/simulated/floor/water/pool/station
	oxygen		= MOLES_O2STANDARD
	nitrogen	= MOLES_N2STANDARD
	temperature = T20C

/turf/simulated/floor/water/deep/pool/station
	oxygen		= MOLES_O2STANDARD
	nitrogen	= MOLES_N2STANDARD
	temperature = T20C


/turf/simulated/floor/carpet/graycarpet
	name = "gray carpet"
	desc = "A dusty, gray carpeted floor."
	icon = 'modular_chomp/icons/turf/flooring/carpet.dmi'
	icon_state = "gcarpet"
	initial_flooring = /decl/flooring/carpet/gray

/decl/flooring/carpet/gray
	name = "gray carpet"
	desc = "A dusty, gray carpeted floor."
	icon = 'modular_chomp/icons/turf/flooring/carpet.dmi'
	icon_base = "gcarpet"
	build_type = /obj/item/stack/tile/carpet/gray
	flags = TURF_REMOVE_CROWBAR | TURF_CAN_BURN

/obj/item/stack/tile/carpet/gray
	name = "gray carpet"
	icon_state = "tile"
	desc = "A piece dusty, gray carpet. It is the same size as a normal floor tile!"
