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
		to_chat(user, "<span class='warning'>You must remove the plating first.</span>")
		return 1
	if(!can_unwrench())
		to_chat(user, "<span class='warning'>You cannot unwrench \the [src], it is too exerted due to internal pressure.</span>")
		add_fingerprint(user)
		return 1

	//potential yeet
	var/datum/gas_mixture/int_air = return_air()
	var/datum/gas_mixture/env_air = loc.return_air()
	var/unsafe_wrenching = FALSE
	var/internal_pressure = int_air.return_pressure()-env_air.return_pressure()

	if (internal_pressure > 2*ONE_ATMOSPHERE)
		to_chat(user, "<span class='warning'>As you begin unwrenching \the [src] a gush of air blows in your face... maybe you should reconsider?</span>")
		unsafe_wrenching = TRUE //here we go
	else
		to_chat(user, "<span class='notice'>You begin to unfasten \the [src]...</span>")

	playsound(src, W.usesound, 50, 1)

	if (do_after(user, 10 * W.toolspeed))
		user.visible_message( \
			"<b>\The [user]</b> unfastens \the [src].", \
			"<span class='notice'>You have unfastened \the [src].</span>", \
			"You hear a ratchet.")
		if(unsafe_wrenching)
			unsafe_pressure_release(user, internal_pressure)
		deconstruct()

// Throws the user when they unwrench a pipe with a major difference between the internal and environmental pressure.
/obj/machinery/atmospherics/proc/unsafe_pressure_release(mob/user, pressures = null)
	if(!user)
		return
	if(!pressures)
		var/datum/gas_mixture/int_air = return_air()
		var/datum/gas_mixture/env_air = loc.return_air()
		pressures = int_air.return_pressure() - env_air.return_pressure()

	user.visible_message("<span class='danger'>[user] is sent flying by pressure!</span>","<span class='userdanger'>The pressure sends you flying!</span>")

	// if get_dir(src, user) is not 0, target is the edge_target_turf on that dir
	// otherwise, edge_target_turf uses a random cardinal direction
	// range is pressures / 250
	// speed is pressures / 1250
	user.throw_at(get_edge_target_turf(user, get_dir(src, user) || pick(GLOB.cardinal)), pressures / 250, pressures / 1250)