/obj/machinery/pda_multicaster
	name = "\improper PDA multicaster"
	desc = "This machine mirrors messages sent to it to specific departments."
	icon = 'icons/obj/stationobjs.dmi'
	icon_state = "pdamulti"
	density = TRUE
	anchored = TRUE
	circuit = /obj/item/circuitboard/telecomms/pda_multicaster
	use_power = USE_POWER_IDLE
	idle_power_usage = 750
	var/on = 1		// If we're currently active,
	var/toggle = 1	// If we /should/ be active or not,
	var/list/internal_PDAs = list() // Assoc list of PDAs inside of this, with the department name being the index,

	var/datum/looping_sound/tcomms/soundloop // CHOMPStation Add: Hummy noises
	var/noisy = TRUE  // CHOMPStation Add: Hummy noises

/obj/machinery/pda_multicaster/New()
	..()
	internal_PDAs = list("command" = new /obj/item/pda/multicaster/command(src),
		"security" = new /obj/item/pda/multicaster/security(src),
		"engineering" = new /obj/item/pda/multicaster/engineering(src),
		"medical" = new /obj/item/pda/multicaster/medical(src),
		"research" = new /obj/item/pda/multicaster/research(src),
		"exploration" = new /obj/item/pda/multicaster/exploration(src), //VOREStation Add,
		"cargo" = new /obj/item/pda/multicaster/cargo(src),
		"civilian" = new /obj/item/pda/multicaster/civilian(src))

/obj/machinery/pda_multicaster/Initialize()
	. = ..()

	// CHOMPAdd: PDA Multicaster Server humming
	soundloop = new(list(src), FALSE)
	if(prob(60)) // 60% chance to change the midloop
		if(prob(40))
			soundloop.mid_sounds = list('sound/machines/tcomms/tcomms_02.ogg' = 1)
			soundloop.mid_length = 40
		else if(prob(20))
			soundloop.mid_sounds = list('sound/machines/tcomms/tcomms_03.ogg' = 1)
			soundloop.mid_length = 10
		else
			soundloop.mid_sounds = list('sound/machines/tcomms/tcomms_04.ogg' = 1)
			soundloop.mid_length = 30
	soundloop.start() // Have to do this here bc it starts on
	// CHOMPAdd End

/obj/machinery/pda_multicaster/prebuilt/Initialize()
	. = ..()
	default_apply_parts()

/obj/machinery/pda_multicaster/Destroy()
	for(var/atom/movable/AM in contents)
		qdel(AM)
	QDEL_NULL(soundloop)
	..()

/obj/machinery/pda_multicaster/update_icon()
	if(on)
		icon_state = initial(icon_state)
	else
		icon_state = "[initial(icon_state)]_off"

/obj/machinery/pda_multicaster/attackby(obj/item/I, mob/user)
	if(I.has_tool_quality(TOOL_SCREWDRIVER))
		default_deconstruction_screwdriver(user, I)
	else if(I.has_tool_quality(TOOL_CROWBAR))
		default_deconstruction_crowbar(user, I)
	else
		..()

/obj/machinery/pda_multicaster/attack_ai(mob/user)
	attack_hand(user)

/obj/machinery/pda_multicaster/attack_hand(mob/user)
	toggle_power(user)

/obj/machinery/pda_multicaster/proc/toggle_power(mob/user)
	toggle = !toggle
	visible_message("\the [user] turns \the [src] [toggle ? "on" : "off"].")
	update_power()
	if(!toggle)
		var/msg = "[usr.client.key] ([usr]) has turned [src] off, at [x],[y],[z]."
		message_admins(msg)
		log_game(msg)

/obj/machinery/pda_multicaster/proc/update_PDAs(var/turn_off)
	for(var/obj/item/pda/pda in contents)
		var/datum/data/pda/app/messenger/M = pda.find_program(/datum/data/pda/app/messenger/multicast)
		if(M)
			M.toff = turn_off

/obj/machinery/pda_multicaster/proc/update_power()
	if(toggle)
		if(stat & (BROKEN|NOPOWER|EMPED))
			on = 0
			update_PDAs(1) // 1 being to turn off.
			update_idle_power_usage(0)
			soundloop.stop() // CHOMPStation Add: Hummy noises
			noisy = FALSE // CHOMPStation Add: Hummy noises
		else
			on = 1
			update_PDAs(0)
			update_idle_power_usage(750)
			soundloop.start() // CHOMPStation Add: Hummy noises
			noisy = TRUE // CHOMPStation Add: Hummy noises
	else
		on = 0
		update_PDAs(1)
		update_idle_power_usage(0)
		soundloop.stop() // CHOMPStation Add: Hummy noises
		noisy = FALSE // CHOMPStation Add: Hummy noises
	update_icon()

/obj/machinery/pda_multicaster/process()
	update_power()

/obj/machinery/pda_multicaster/emp_act(severity)
	if(!(stat & EMPED))
		stat |= EMPED
		var/duration = (300 * 10)/severity
		spawn(rand(duration - 20, duration + 20))
			stat &= ~EMPED
	update_icon()
	..()
