//This file was auto-corrected by findeclaration.exe on 25.5.2012 20:42:31

/*
	The broadcaster sends processed messages to all radio devices in the game. They
	do not have to be headsets; intercoms and station-bounced radios suffice.

	They receive their message from a server after the message has been logged.
*/

GLOBAL_LIST_EMPTY(recentmessages) // global list of recent messages broadcasted : used to circumvent massive radio spam
GLOBAL_VAR_INIT(message_delay, 0) // To make sure restarting the recentmessages list is kept in sync

/obj/machinery/telecomms/broadcaster
	name = "Subspace Broadcaster"
	//icon = 'icons/obj/stationobjs.dmi' //VOREStation Removal - use parent icon
	icon_state = "broadcaster"
	desc = "A dish-shaped machine used to broadcast processed subspace signals."
	density = TRUE
	anchored = TRUE
	use_power = USE_POWER_IDLE
	idle_power_usage = 25
	machinetype = 5
	produces_heat = 0
	delay = 7
	circuit = /obj/item/circuitboard/telecomms/broadcaster
	//Vars only used if you're using the overmap
	var/overmap_range = 0
	var/overmap_range_min = 0
	var/overmap_range_max = 5
	//Linked bluespace radios
	var/list/linked_radios_weakrefs = list()

/obj/machinery/telecomms/broadcaster/proc/link_radio(var/obj/item/radio/R)
	if(!istype(R))
		return
	linked_radios_weakrefs |= WEAKREF(R)

/obj/machinery/telecomms/broadcaster/receive_information(datum/signal/signal, obj/machinery/telecomms/machine_from)
	// Don't broadcast rejected signals
	if(signal.data["reject"])
		return

	if(signal.data["message"])

		// Prevents massive radio spam
		signal.data["done"] = 1 // mark the signal as being broadcasted
		// Search for the original signal and mark it as done as well
		var/datum/signal/original = signal.data["original"]
		if(original)
			original.data["done"] = 1
			original.data["compression"] = signal.data["compression"]
			original.data["level"] = signal.data["level"]

		var/signal_message = "[signal.frequency]:[signal.data["message"]]:[signal.data["realname"]]"
		if(signal_message in GLOB.recentmessages)
			return
		GLOB.recentmessages.Add(signal_message)

		if(signal.data["slow"] > 0)
			sleep(signal.data["slow"]) // simulate the network lag if necessary

		signal.data["level"] |= using_map.get_map_levels(listening_level, TRUE, overmap_range)

		var/list/forced_radios
		for(var/datum/weakref/wr in linked_radios_weakrefs)
			var/obj/item/radio/R = wr.resolve()
			if(istype(R))
				LAZYDISTINCTADD(forced_radios, R)

	   /** #### - Normal Broadcast - #### **/
		if(signal.data["type"] == SIGNAL_NORMAL)
			/* ###### Broadcast a message using signal.data ###### */
			Broadcast_Message(signal.data["connection"], signal.data["mob"],
							  signal.data["vmask"], signal.data["vmessage"],
							  signal.data["radio"], signal.data["message"],
							  signal.data["name"], signal.data["job"],
							  signal.data["realname"], signal.data["vname"], DATA_NORMAL,
							  signal.data["compression"], signal.data["level"], signal.frequency,
							  signal.data["verb"], forced_radios)

	   /** #### - Simple Broadcast - #### **/

		if(signal.data["type"] == SIGNAL_SIMPLE)

			/* ###### Broadcast a message using signal.data ###### */
			Broadcast_SimpleMessage(signal.data["name"], signal.frequency,
								  signal.data["message"], DATA_NORMAL, null,
								  signal.data["compression"], listening_level, forced_radios)


	   /** #### - Artificial Broadcast - #### **/
	   			// (Imitates a mob)

		if(signal.data["type"] == SIGNAL_FAKE)

			/* ###### Broadcast a message using signal.data ###### */
				// Parameter "data" as DATA_FAKE: AI can't track this person/mob

			Broadcast_Message(signal.data["connection"], signal.data["mob"],
							  signal.data["vmask"], signal.data["vmessage"],
							  signal.data["radio"], signal.data["message"],
							  signal.data["name"], signal.data["job"],
							  signal.data["realname"], signal.data["vname"], DATA_FAKE,
							  signal.data["compression"], signal.data["level"], signal.frequency,
							  signal.data["verb"], forced_radios)

		if(!GLOB.message_delay)
			GLOB.message_delay = 1
			spawn(10)
				GLOB.message_delay = 0
				GLOB.recentmessages = list()

		/* --- Do a snazzy animation! --- */
		flick("broadcaster_send", src)

/obj/machinery/telecomms/broadcaster/Destroy()
	// In case message_delay is left on 1, otherwise it won't reset the list and people can't say the same thing twice anymore.
	if(GLOB.message_delay)
		GLOB.message_delay = 0
	. = ..()


/*
	Basically just an empty shell for receiving and broadcasting radio messages. Not
	very flexible, but it gets the job done.
	NOTE: This AIO device listens on *every* zlevel (it does not even check)
*/

/obj/machinery/telecomms/allinone
	name = "Telecommunications Mainframe"
	icon = 'icons/obj/stationobjs.dmi'
	icon_state = "allinone"
	desc = "A compact machine used for portable subspace telecommuniations processing."
	density = TRUE
	use_power = USE_POWER_IDLE
	idle_power_usage = 20
	anchored = TRUE
	machinetype = 6
	produces_heat = 0
	var/intercept = 0 // if nonzero, broadcasts all messages to syndicate channel
	var/overmap_range = 0

	var/list/linked_radios_weakrefs = list()

/obj/machinery/telecomms/allinone/proc/link_radio(var/obj/item/radio/R)
	if(!istype(R))
		return
	linked_radios_weakrefs |= WEAKREF(R)

/obj/machinery/telecomms/allinone/receive_signal(datum/signal/signal)

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
	var/map_levels = using_map.get_map_levels(z, TRUE, overmap_range)

	//Bluespace can skip this check
	if(signal.transmission_method != TRANSMISSION_BLUESPACE)
		var/list/signal_levels = list()
		signal_levels += signal.data["level"] //If it's text/number, it'll be the only entry, if it's a list, it'll get combined
		var/list/overlap = map_levels & signal_levels //Returns a list of similar levels
		if(!overlap.len)
			return

	if(is_freq_listening(signal)) // detect subspace signals

		signal.data["done"] = 1 // mark the signal as being broadcasted since we're a broadcaster
		signal.data["compression"] = 0 // decompress since we're a processor

		// Search for the original signal and mark it as done as well
		var/datum/signal/original = signal.data["original"]
		if(original)
			original.data["done"] = 1

		// For some reason level is both used as a list and not a list, and now it needs to be a list.
		signal.data["level"] = map_levels

		if(signal.data["slow"] > 0)
			addtimer(CALLBACK(src, PROC_REF(broadcast_signal), signal), signal.data["slow"], TIMER_DELETE_ME)


/obj/machinery/telecomms/allinone/proc/broadcast_signal(datum/signal/signal)
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

//Antag version with unlimited range (doesn't even check) and uses no power, to enable antag comms to work anywhere.
/obj/machinery/telecomms/allinone/antag
	use_power = USE_POWER_OFF
	idle_power_usage = 0

/obj/machinery/telecomms/allinone/antag/receive_signal(datum/signal/signal)
	if(!on) // has to be on to receive messages
		return

	if(is_freq_listening(signal)) // detect subspace signals

		//signal.data["done"] = 1 // mark the signal as being broadcasted since we're a broadcaster
		signal.data["compression"] = 0

		/*
		// Search for the original signal and mark it as done as well
		var/datum/signal/original = signal.data["original"]
		if(original)
			original.data["done"] = 1
		*/

		// For some reason level is both used as a list and not a list, and now it needs to be a list.
		// Because this is a 'all in one' machine, we're gonna just cheat.
		//signal.data["level"] = using_map.contact_levels.Copy()

		if(signal.data["slow"] > 0)
			addtimer(CALLBACK(src, PROC_REF(broadcast_signal), signal), signal.data["slow"], TIMER_DELETE_ME)

/obj/machinery/telecomms/allinone/antag/broadcast_signal(datum/signal/signal)
	/* ###### Broadcast a message using signal.data ###### */

	var/datum/radio_frequency/connection = signal.data["connection"]

	var/list/forced_radios
	for(var/datum/weakref/wr in linked_radios_weakrefs)
		var/obj/item/radio/R = wr.resolve()
		if(istype(R))
			LAZYDISTINCTADD(forced_radios, R)

	if(connection.frequency in ANTAG_FREQS) // if antag broadcast, just
		Broadcast_Message(signal.data["connection"], signal.data["mob"],
							signal.data["vmask"], signal.data["vmessage"],
							signal.data["radio"], signal.data["message"],
							signal.data["name"], signal.data["job"],
							signal.data["realname"], signal.data["vname"], DATA_NORMAL,
							signal.data["compression"], list(0), connection.frequency,
							signal.data["verb"], forced_radios)
	else
		if(intercept)
			Broadcast_Message(signal.data["connection"], signal.data["mob"],
							signal.data["vmask"], signal.data["vmessage"],
							signal.data["radio"], signal.data["message"],
							signal.data["name"], signal.data["job"],
							signal.data["realname"], signal.data["vname"], DATA_ANTAG,
							signal.data["compression"], list(0), connection.frequency,
							signal.data["verb"], forced_radios)


/**

	Here is the big, bad function that broadcasts a message given the appropriate
	parameters.

	@param connection:
		The datum generated in radio.dm, stored in signal.data["connection"].

	@param M:
		Reference to the mob/speaker, stored in signal.data["mob"]

	@param vmask:
		Boolean value if the mob is "hiding" its identity via voice mask, stored in
		signal.data["vmask"]

	@param vmessage:
		If specified, will display this as the message; such as "chimpering"
		for monkies if the mob is not understood. Stored in signal.data["vmessage"].

	@param radio:
		Reference to the radio broadcasting the message, stored in signal.data["radio"]

	@param message:
		The actual string message to display to mobs who understood mob M. Stored in
		signal.data["message"]

	@param name:
		The name to display when a mob receives the message. signal.data["name"]

	@param job:
		The name job to display for the AI when it receives the message. signal.data["job"]

	@param realname:
		The "real" name associated with the mob. signal.data["realname"]

	@param vname:
		If specified, will use this name when mob M is not understood. signal.data["vname"]

	@param data:
		If specified:
				1 -- Will only broadcast to intercoms
				2 -- Will only broadcast to intercoms and station-bounced radios
				3 -- Broadcast to syndicate frequency
				4 -- AI can't track down this person. Useful for imitation broadcasts where you can't find the actual mob

	@param compression:
		If 0, the signal is audible
		If nonzero, the signal may be partially inaudible or just complete gibberish.

	@param level:
		The list of Z levels that the sending radio is broadcasting to. Having 0 in the list broadcasts on all levels

	@param freq
		The frequency of the signal

**/

/proc/Broadcast_Message(var/datum/radio_frequency/connection, var/mob/M,
						var/vmask, var/list/vmessage_pieces, var/obj/item/radio/radio,
						var/list/message_pieces, var/name, var/job, var/realname, var/vname,
						var/data, var/compression, var/list/level, var/freq, var/verbage = "says",
						var/list/forced_radios)

	/* ###### Prepare the radio connection ###### */

	var/display_freq = freq

	var/list/obj/item/radio/radios = list()

	for(var/obj/item/radio/R in forced_radios)
		//Cursory check to ensure they are 'on' and stuff
		if(R.receive_range(display_freq, list(0)) > -1)
			radios |= R

	// --- Broadcast only to intercom devices ---

	if(data == DATA_INTERCOM)

		for (var/obj/item/radio/intercom/R in connection.devices["[RADIO_CHAT]"])
			if(R.receive_range(display_freq, level) > -1)
				radios |= R

	// --- Broadcast only to intercoms and station-bounced radios ---

	else if(data == DATA_LOCAL)

		for (var/obj/item/radio/R in connection.devices["[RADIO_CHAT]"])

			if(istype(R, /obj/item/radio/headset) && !R.adhoc_fallback)
				continue

			if(R.receive_range(display_freq, level) > -1)
				radios |= R

	// --- Broadcast to antag radios! ---

	else if(data == DATA_ANTAG)
		for(var/antag_freq in ANTAG_FREQS)
			var/datum/radio_frequency/antag_connection = radio_controller.return_frequency(antag_freq)
			for (var/obj/item/radio/R in antag_connection.devices["[RADIO_CHAT]"])
				if(R.receive_range(antag_freq, level) > -1)
					radios |= R

	// --- Broadcast to ALL radio devices ---

	else

		for (var/obj/item/radio/R in connection.devices["[RADIO_CHAT]"])
			if(R.receive_range(display_freq, level) > -1)
				radios |= R

	// Get a list of mobs who can hear from the radios we collected.
	var/list/receive = get_mobs_in_radio_ranges(radios)

	/* ###### Organize the receivers into categories for displaying the message ###### */

	// Understood the message:
	var/list/heard_masked 	= list() // masked name or no real name
	var/list/heard_normal 	= list() // normal message

	// Did not understand the message:
	var/list/heard_voice 	= list() // voice message	(ie "chimpers")
	var/list/heard_garbled	= list() // garbled message (ie "f*c* **u, **i*er!")
	var/list/heard_gibberish= list() // completely screwed over message (ie "F%! (O*# *#!<>&**%!")

	for (var/mob/R in receive)

	  /* --- Loop through the receivers and categorize them --- */
		// Allows admins to disable radio
		if(check_rights_for(R?.client, R_HOLDER))
			if(!R.client?.prefs?.read_preference(/datum/preference/toggle/holder/hear_radio))
				continue

		if(isnewplayer(R)) // we don't want new players to hear messages. rare but generates runtimes.
			continue

		// Ghosts hearing all radio chat don't want to hear syndicate intercepts, they're duplicates
		if(data == DATA_ANTAG && isobserver(R) && R.client?.prefs?.read_preference(/datum/preference/toggle/ghost_radio))
			continue

		var/list/ghostradio_freq_blacklist = list(ENT_FREQ, BDCM_FREQ) //Kept for Downstream use //CHOMPEdit - Enable BDCM_FREQ
		if(istype(R, /mob/observer/dead) && R.client?.prefs?.read_preference(/datum/preference/toggle/ghost_radio) && (connection.frequency in ghostradio_freq_blacklist))
			continue

		// --- Check for compression ---
		if(compression > 0)
			heard_gibberish += R
			continue

		// --- Can understand the speech ---

		if(!M || R.say_understands(M))

			// - Not human or wearing a voice mask -
			if(!M || !ishuman(M) || vmask)
				heard_masked += R

			// - Human and not wearing voice mask -
			else
				heard_normal += R

		// --- Can't understand the speech ---

		else
			// - The speaker has a prespecified "voice message" to display if not understood -
			if(vmessage_pieces)
				heard_voice += R

			// - Just display a garbled message -
			else
				heard_garbled += R


	/* ###### Begin formatting and sending the message ###### */
	if(length(heard_masked) || length(heard_normal) || length(heard_voice) || length(heard_garbled) || length(heard_gibberish))

	  /* --- Some miscellaneous variables to format the string output --- */
		var/freq_text = get_frequency_name(display_freq)

		var/part_b_extra = ""
		if(data == DATA_ANTAG) // intercepted radio message
			part_b_extra = " <i>(Intercepted)</i>"
		var/part_a = "<span class='[frequency_span_class(display_freq)]'>"
		var/part_b = "[icon2html(radio, heard_masked + heard_normal + heard_voice + heard_garbled + heard_gibberish)]<b>\[[freq_text]\][part_b_extra]</b> <span class='name'>" // goes in the actual output

		// --- Some more pre-message formatting ---
		var/part_c = "</span> <span class='message'>" // Tweaked for security headsets -- TLE
		var/part_d = "</span>"
		var/part_e = "</span>"


		// --- Filter the message; place it in quotes apply a verb ---
		var/quotedmsg = null
		if(M)
			quotedmsg = "[M.say_quote(multilingual_to_message(message_pieces))], \"[multilingual_to_message(message_pieces)]\""
		else
			quotedmsg = "says, \"[multilingual_to_message(message_pieces)]\""

		// --- This following recording is intended for research and feedback in the use of department radio channels ---

		var/part_blackbox_c = "</span><b> \[[freq_text]\]</b> <span class='message'>" // Tweaked for security headsets -- TLE
		var/blackbox_msg = "[part_a][part_b][name][part_blackbox_c][quotedmsg][part_d][part_e]"
		//var/blackbox_admin_msg = "[part_a][M.name] (Real name: [M.real_name])[part_blackbox_b][quotedmsg][part_c]"

		//BR.messages_admin += blackbox_admin_msg
		if(istype(blackbox))
			switch(display_freq)
				if(PUB_FREQ)
					blackbox.msg_common += blackbox_msg
				if(SCI_FREQ)
					blackbox.msg_science += blackbox_msg
				if(COMM_FREQ)
					blackbox.msg_command += blackbox_msg
				if(MED_FREQ)
					blackbox.msg_medical += blackbox_msg
				if(ENG_FREQ)
					blackbox.msg_engineering += blackbox_msg
				if(SEC_FREQ)
					blackbox.msg_security += blackbox_msg
				if(DTH_FREQ)
					blackbox.msg_deathsquad += blackbox_msg
				if(SYND_FREQ)
					blackbox.msg_syndicate += blackbox_msg
				if(RAID_FREQ)
					blackbox.msg_raider += blackbox_msg
				if(SUP_FREQ)
					blackbox.msg_cargo += blackbox_msg
				if(SRV_FREQ)
					blackbox.msg_service += blackbox_msg
				if(EXP_FREQ)
					blackbox.msg_explorer += blackbox_msg
				else
					blackbox.messages += blackbox_msg

		//End of research and feedback code.

		/* ###### Send the message ###### */
		/* --- Process all the mobs that heard a masked voice (understood) --- */
		if(length(heard_masked))
			for (var/mob/R in heard_masked)
				R.hear_radio(message_pieces, verbage, part_a, part_b, part_c, part_d, part_e, M, 0, name)
				if(R.read_preference(/datum/preference/toggle/radio_sounds))
					R << 'sound/effects/radio_common_quieter.ogg'

		/* --- Process all the mobs that heard the voice normally (understood) --- */
		if(length(heard_normal))
			for (var/mob/R in heard_normal)
				R.hear_radio(message_pieces, verbage, part_a, part_b, part_c, part_d, part_e, M, 0, realname)
				if(R.read_preference(/datum/preference/toggle/radio_sounds))
					R << 'sound/effects/radio_common_quieter.ogg'

		/* --- Process all the mobs that heard the voice normally (did not understand) --- */
		if(length(heard_voice))
			for (var/mob/R in heard_voice)
				R.hear_radio(message_pieces, verbage, part_a, part_b, part_c, part_d, part_e, M,0, vname)
				if(R.read_preference(/datum/preference/toggle/radio_sounds))
					R << 'sound/effects/radio_common_quieter.ogg'

		/* --- Process all the mobs that heard a garbled voice (did not understand) --- */
			// Displays garbled message (ie "f*c* **u, **i*er!")
		if(length(heard_garbled))
			for (var/mob/R in heard_garbled)
				R.hear_radio(message_pieces, verbage, part_a, part_b, part_c, part_d, part_e, M, 1, vname)
				if(R.read_preference(/datum/preference/toggle/radio_sounds))
					R << 'sound/effects/radio_common_quieter.ogg'

		/* --- Complete gibberish. Usually happens when there's a compressed message --- */
		if(length(heard_gibberish))
			for (var/mob/R in heard_gibberish)
				R.hear_radio(message_pieces, verbage, part_a, part_b, part_c, part_d, part_e, M, 1)
				if(R.read_preference(/datum/preference/toggle/radio_sounds))
					R << 'sound/effects/radio_common_quieter.ogg'

	return 1

/proc/Broadcast_SimpleMessage(var/source, var/frequency, list/message_pieces, var/data, var/mob/M, var/compression, var/level, var/list/forced_radios)
	var/text = multilingual_to_message(message_pieces)
	/* ###### Prepare the radio connection ###### */

	if(!M)
		var/mob/living/carbon/human/H = new
		M = H

	var/datum/radio_frequency/connection = radio_controller.return_frequency(frequency)

	var/display_freq = connection.frequency

	var/list/receive = list()

	for(var/obj/item/radio/R in forced_radios)
		receive |= R.send_hear(display_freq)

	// --- Broadcast only to intercom devices ---

	if(data == DATA_INTERCOM)
		for (var/obj/item/radio/intercom/R in connection.devices["[RADIO_CHAT]"])
			var/turf/position = get_turf(R)
			if(position && position.z == level)
				receive |= R.send_hear(display_freq, level)


	// --- Broadcast only to intercoms and station-bounced radios ---

	else if(data == DATA_LOCAL)
		for (var/obj/item/radio/R in connection.devices["[RADIO_CHAT]"])

			if(istype(R, /obj/item/radio/headset))
				continue
			var/turf/position = get_turf(R)
			if(position && position.z == level)
				receive |= R.send_hear(display_freq)


	// --- Broadcast to antag radios! ---

	else if(data == DATA_ANTAG)
		for(var/freq in ANTAG_FREQS)
			var/datum/radio_frequency/antag_connection = radio_controller.return_frequency(freq)
			for (var/obj/item/radio/R in antag_connection.devices["[RADIO_CHAT]"])
				var/turf/position = get_turf(R)
				if(position && position.z == level)
					receive |= R.send_hear(freq)


	// --- Broadcast to ALL radio devices ---

	else
		for (var/obj/item/radio/R in connection.devices["[RADIO_CHAT]"])
			var/turf/position = get_turf(R)
			if(position && position.z == level)
				receive |= R.send_hear(display_freq)


	/* ###### Organize the receivers into categories for displaying the message ###### */

	// Understood the message:
	var/list/heard_normal 	= list() // normal message

	// Did not understand the message:
	var/list/heard_garbled	= list() // garbled message (ie "f*c* **u, **i*er!")
	var/list/heard_gibberish= list() // completely screwed over message (ie "F%! (O*# *#!<>&**%!")

	for (var/mob/R in receive)

	  /* --- Loop through the receivers and categorize them --- */
		// Allow admins to disable radios completely
		if(check_rights_for(R?.client, R_HOLDER))
			if(!R.client?.prefs?.read_preference(/datum/preference/toggle/holder/hear_radio))
				continue

		// --- Check for compression ---
		if(compression > 0)

			heard_gibberish += R
			continue

		// --- Can understand the speech ---

		if(R.say_understands(M))

			heard_normal += R

		// --- Can't understand the speech ---

		else
			// - Just display a garbled message -

			heard_garbled += R


	/* ###### Begin formatting and sending the message ###### */
	if(length(heard_normal) || length(heard_garbled) || length(heard_gibberish))

	  /* --- Some miscellaneous variables to format the string output --- */
		var/part_a = "<span class='[frequency_span_class(display_freq)]'><span class='name'>" // goes in the actual output
		var/freq_text = get_frequency_name(display_freq)

		// --- Some more pre-message formatting ---

		var/part_b_extra = ""
		if(data == DATA_ANTAG) // intercepted radio message
			part_b_extra = " <i>(Intercepted)</i>"

		// Create a radio headset for the sole purpose of using its icon
		var/obj/item/radio/headset/radio = new

		var/part_b = "</span><b>[icon2html(radio, heard_normal + heard_garbled + heard_gibberish)]\[[freq_text]\][part_b_extra]</b> <span class='message'>" // Tweaked for security headsets -- TLE
		var/part_blackbox_b = "</span><b> \[[freq_text]\]</b> <span class='message'>" // Tweaked for security headsets -- TLE
		var/part_c = "</span></span>"

		var/blackbox_msg = "[part_a][source][part_blackbox_b]\"[text]\"[part_c]"

		//BR.messages_admin += blackbox_admin_msg
		if(istype(blackbox))
			switch(display_freq)
				if(PUB_FREQ)
					blackbox.msg_common += blackbox_msg
				if(SCI_FREQ)
					blackbox.msg_science += blackbox_msg
				if(COMM_FREQ)
					blackbox.msg_command += blackbox_msg
				if(MED_FREQ)
					blackbox.msg_medical += blackbox_msg
				if(ENG_FREQ)
					blackbox.msg_engineering += blackbox_msg
				if(SEC_FREQ)
					blackbox.msg_security += blackbox_msg
				if(DTH_FREQ)
					blackbox.msg_deathsquad += blackbox_msg
				if(SYND_FREQ)
					blackbox.msg_syndicate += blackbox_msg
				if(RAID_FREQ)
					blackbox.msg_raider += blackbox_msg
				if(SUP_FREQ)
					blackbox.msg_cargo += blackbox_msg
				if(SRV_FREQ)
					blackbox.msg_service += blackbox_msg
				else
					blackbox.messages += blackbox_msg

		//End of research and feedback code.

		/* ###### Send the message ###### */

		/* --- Process all the mobs that heard the voice normally (understood) --- */

		if(length(heard_normal))
			var/rendered = "[part_a][source][part_b]\"[text]\"[part_c]"

			for (var/mob/R in heard_normal)
				R.show_message(rendered, 2)

		/* --- Process all the mobs that heard a garbled voice (did not understand) --- */
			// Displays garbled message (ie "f*c* **u, **i*er!")

		if(length(heard_garbled))
			var/quotedmsg = "\"[stars(text)]\""
			var/rendered = "[part_a][source][part_b][quotedmsg][part_c]"

			for (var/mob/R in heard_garbled)
				R.show_message(rendered, 2)


		/* --- Complete gibberish. Usually happens when there's a compressed message --- */

		if(length(heard_gibberish))
			var/quotedmsg = "\"[Gibberish(text, compression + 50)]\""
			var/rendered = "[part_a][Gibberish(source, compression + 50)][part_b][quotedmsg][part_c]"

			for (var/mob/R in heard_gibberish)
				R.show_message(rendered, 2)

//Use this to test if an obj can communicate with a Telecommunications Network

/atom/proc/test_telecomms()
	var/datum/signal/signal = src.telecomms_process()
	var/pos_z = get_z(src)
	return ((pos_z in signal.data["level"]) && signal.data["done"])

/atom/proc/telecomms_process(var/do_sleep = 1)

	// First, we want to generate a new radio signal
	var/datum/signal/signal = new
	signal.transmission_method = TRANSMISSION_SUBSPACE
	var/pos_z = get_z(src)

	// --- Finally, tag the actual signal with the appropriate values ---
	signal.data = list(
		"slow" = 0, // how much to sleep() before broadcasting - simulates net lag
		"message" = "TEST",
		"compression" = rand(45, 50), // If the signal is compressed, compress our message too.
		"traffic" = 0, // dictates the total traffic sum that the signal went through
		"type" = SIGNAL_TEST, // determines what type of radio input it is: test broadcast
		"reject" = 0,
		"done" = 0,
		"level" = pos_z // The level it is being broadcasted at.
	)
	signal.frequency = PUB_FREQ// Common channel

	//#### Sending the signal to all subspace receivers ####//
	for(var/obj/machinery/telecomms/receiver/R in telecomms_list)
		R.receive_signal(signal)

	if(do_sleep)
		sleep(rand(10,25))

	//to_world_log("Level: [signal.data["level"]] - Done: [signal.data["done"]]")

	return signal
