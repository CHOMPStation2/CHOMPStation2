//Chomp override, always allow unwrenching (at a cost)
/obj/machinery/atmospherics/can_unwrench()
	return 1

//Chomp override, handle unwrenching with the yeet code
/obj/machinery/atmospherics/pipe/attackby(var/obj/item/W as obj, var/mob/user as mob)
	if (istype(src, /obj/machinery/atmospherics/pipe/tank))
		return ..()

	if(istype(W,/obj/item/pipe_painter))
		return 0

	if (!W.is_wrench())
		return ..()
	var/turf/T = src.loc
	if (level==1 && isturf(T) && !T.is_plating())
		to_chat(user, span_warning("You must remove the plating first."))
		return 1
	if(!can_unwrench())
		to_chat(user, span_warning("You cannot unwrench \the [src], it is too exerted due to internal pressure."))
		add_fingerprint(user)
		return 1

	//potential yeet
	var/datum/gas_mixture/int_air = return_air()
	var/datum/gas_mixture/env_air = loc.return_air()
	var/unsafe_wrenching = FALSE
	var/internal_pressure = int_air.return_pressure()-env_air.return_pressure()

	if (internal_pressure > 2*ONE_ATMOSPHERE)
		to_chat(user, span_warning("As you begin unwrenching \the [src] a gush of air blows in your face... maybe you should reconsider?"))
		unsafe_wrenching = TRUE //here we go
	else
		to_chat(user, span_notice("You begin to unfasten \the [src]..."))

	playsound(src, W.usesound, 50, 1)

	if (do_after(user, 10 * W.toolspeed))
		user.visible_message( \
			span_infoplain(span_bold("\The [user]") + " unfastens \the [src]."), \
			span_notice("You have unfastened \the [src]."), \
			span_hear("You hear a ratchet."))
		if(unsafe_wrenching)
			unsafe_pressure_release(user, internal_pressure)
		deconstruct()
