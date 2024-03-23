//base types for unsim

/turf/unsimulated/wall
	name = "wall"
	desc = "A huge chunk of metal used to separate rooms."
	icon = 'icons/turf/wall_masks.dmi'
	icon_state = "generic"
	opacity = 1
	density = TRUE
	blocks_air = 1
	thermal_conductivity = WALL_HEAT_TRANSFER_COEFFICIENT
	heat_capacity = 312500 //a little over 5 cm thick , 312500 for 1 m by 2.5 m by 0.25 m plasteel wall

/turf/unsimulated/floor
	name = "plating"
	desc = "Unfinished flooring."
	icon = 'icons/turf/flooring/plating_vr.dmi'
	icon_state = "plating"

/turf/unsimulated/floor/tiled
	name = "floor"
	icon = 'icons/turf/flooring/tiles_vr.dmi'
	icon_state = "tiled"

/turf/unsimulated/floor/outdoors
	name = "generic ground"
	desc = "Rather boring."
	icon = 'icons/turf/outdoors.dmi'
	icon_state = null
	edge_blending_priority = 1
	outdoors = OUTDOORS_YES			// This variable is used for weather effects.
	can_build_into_floor = TRUE
