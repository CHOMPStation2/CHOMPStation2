//This is meant for essentially linking a separate z-level to the rest with telecomms
/obj/machinery/telecomms/allinone/link
	name = "Telecommunications Mainframe"
	icon = 'icons/obj/stationobjs.dmi'
	icon_state = "allinone"
	desc = "A compact machine used for portable subspace telecommuniations processing."
	density = 1
	use_power = USE_POWER_IDLE
	idle_power_usage = 20
	anchored = 1
	machinetype = 6
	produces_heat = 0

/obj/machinery/telecomms/allinone/link/receive_signal(datum/signal/signal)

	// Has to be on to receive messages
	if(!on)
		return

	// Why did you use this subtype?
	if(!using_map.use_overmap)
		return

	// Is there a valid signal
	if(!signal)
		return

	// Where are we able to hear from (and talk to, since we're AIO) anyway?
	//var/map_levels = using_map.get_map_levels(z, TRUE, overmap_range)

	if("[signal.data["level"]]" == "[z]")
		signal.data["level"] = list(0)
	else
		signal.data["level"] = list(z)

	if(is_freq_listening(signal)) // detect subspace signals

		signal.data["done"] = 1 // mark the signal as being broadcasted since we're a broadcaster
		signal.data["compression"] = 0 // decompress since we're a processor

		if(signal.data["slow"] > 0)
			addtimer(CALLBACK(src, PROC_REF(broadcast_signal), signal), signal.data["slow"], TIMER_DELETE_ME)
