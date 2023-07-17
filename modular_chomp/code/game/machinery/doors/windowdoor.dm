/obj/machinery/door/window/can_open(var/forced=0)
	if(!forced && (stat & (NOPOWER)))
		return 0
	return ..()