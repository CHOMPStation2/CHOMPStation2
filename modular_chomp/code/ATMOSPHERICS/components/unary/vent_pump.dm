/obj/machinery/atmospherics/unary/vent_pump/siphon/on/atmos/relief // relief vent, that connects to the waste line as a subtype to make it easier to map in
	name = "Relief vent"
	external_pressure_bound = ONE_ATMOSPHERE+2
	external_pressure_bound_default = ONE_ATMOSPHERE+2
	pressure_checks = 1
	pressure_checks_default = 1
	connect_types = CONNECT_TYPE_REGULAR|CONNECT_TYPE_SCRUBBER
