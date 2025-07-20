

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
