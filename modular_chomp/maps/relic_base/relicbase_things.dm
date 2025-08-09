// Relicbase-specific object subtypes.
/obj/machinery/door/blast/gate/thin
	open_sound = 'sound/machines/door/gateopen.ogg'
	close_sound = 'sound/machines/door/gateclose.ogg'

// The tram's electrified maglev tracks
/turf/simulated/floor/maglev // These WILL shock you.

	shock_area = /area/hallway/primary // We use this, given our current tram /areas/ are set to this. Clean this up later if we give tram halls their own dedicated /area/

// Override for relicbase.
// Base Mineral turf override, for testing.
/turf/simulated/mineral/thor
	name = "dark rock"
	floor_name = "deeprock"
	sand_icon_state = "basalt"
	rock_icon_state = "deeprock"
	sand_icon_path = 'modular_chomp/icons/turf/thor.dmi'
	rock_icon_path = 'modular_chomp/icons/turf/thor.dmi'
	rock_side_icon_state = "deeprock_side"
	desc = "Dark black basalt. Rich in exotic minerals."
	icon = 'modular_chomp/icons/turf/thor.dmi'
	icon_state = "deeprock"

/turf/simulated/mineral/thor/floor
	name = "basalt"
	floor_name = "basalt"
	desc = "Loose, rocky basalt. It crumbles to sand under the slightest bit of force."
	icon = 'modular_chomp/icons/turf/thor.dmi'
	icon_state = "basalt0"
	temperature = 393.15
	density = FALSE
	opacity = 0
	blocks_air = 0
	can_build_into_floor = TRUE
