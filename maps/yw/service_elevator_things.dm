
//Special map objects
/obj/effect/landmark/map_data/virgo3b
    height = 7

/obj/turbolift_map_holder/servicelift
	name = "Service lift"
	depth = 4
	lift_size_x = 3
	lift_size_y = 3
	icon = 'icons/obj/turbolift_preview_3x3.dmi'
	wall_type = null // Don't make walls

	areas_to_use = list(
		/area/service_elevator/apartments,
		/area/service_elevator/t_surface/level1,
		/area/service_elevator/surface/level2,
		/area/service_elevator/surface/level3,
		)

/datum/turbolift
	music = list('sound/music/elevator.ogg')  // Woo elevator music!

/obj/machinery/atmospherics/unary/vent_pump/positive
	use_power = 1
	icon_state = "map_vent_out"
	external_pressure_bound = ONE_ATMOSPHERE * 1.1


//