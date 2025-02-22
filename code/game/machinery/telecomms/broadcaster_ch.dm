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
			sleep(signal.data["slow"]) // simulate the network lag if necessary

		/* ###### Broadcast a message using signal.data ###### */

		var/datum/radio_frequency/connection = signal.data["connection"]

		var/list/forced_radios
		for(var/datum/weakref/wr in linked_radios_weakrefs)
			var/obj/item/radio/R = wr.resolve()
			if(istype(R))
				LAZYDISTINCTADD(forced_radios, R)

		Broadcast_Message(
			signal.data["connection"],
			signal.data["mob"],
			signal.data["vmask"],
			signal.data["vmessage"],
			signal.data["radio"],
			signal.data["message"],
			signal.data["name"],
			signal.data["job"],
			signal.data["realname"],
			signal.data["vname"],
			DATA_NORMAL,
			signal.data["compression"],
			signal.data["level"],
			connection.frequency,
			signal.data["verb"],
			signal.data["language"],
			forced_radios
		)
