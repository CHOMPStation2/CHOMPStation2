//base types for unsim

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
