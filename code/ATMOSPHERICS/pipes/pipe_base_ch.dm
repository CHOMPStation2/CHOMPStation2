/obj/machinery/atmospherics/pipe/return_air()
	if(!QDELETED(src)) return ..()

/obj/machinery/atmospherics/pipe/build_network()
	if(!QDELETED(src)) return ..()

/obj/machinery/atmospherics/pipe/network_expand(datum/pipe_network/new_network, obj/machinery/atmospherics/pipe/reference)
	if(!QDELETED(src)) return ..(new_network,reference)

/obj/machinery/atmospherics/pipe/return_network(obj/machinery/atmospherics/reference)
	if(!QDELETED(src)) return ..(reference)
