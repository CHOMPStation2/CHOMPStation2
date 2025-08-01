//This file was auto-corrected by findeclaration.exe on 25.5.2012 20:42:33
/obj/machinery/power/rad_collector
	name = "Radiation Collector Array"
	desc = "A device which uses Hawking Radiation and phoron to produce power."
	icon = 'icons/obj/singularity.dmi'
	icon_state = "ca"
	anchored = FALSE
	density = TRUE
	req_access = list(access_engine_equip)
//	use_power = 0
	var/obj/item/tank/phoron/P = null
	var/last_power = 0
	var/last_power_new = 0
	var/active = 0
	var/locked = 0
	var/drainratio = 1

/obj/machinery/power/rad_collector/Initialize(mapload)
	. = ..()
	GLOB.rad_collectors += src
	AddElement(/datum/element/climbable)

/obj/machinery/power/rad_collector/Destroy()
	GLOB.rad_collectors -= src
	return ..()

/obj/machinery/power/rad_collector/process()
	//so that we don't zero out the meter if the SM is processed first.
	last_power = last_power_new
	last_power_new = 0


	if(P && active)
		var/rads = SSradiation.get_rads_at_turf(get_turf(src))
		if(rads)
			receive_pulse(rads * 5) //Maths is hard

	if(P)
		if(P.air_contents.gas[GAS_PHORON] == 0)
			investigate_log(span_red("out of fuel") + ".","singulo")
			eject()
		else
			P.air_contents.adjust_gas(GAS_PHORON, -0.001*drainratio)
	return


/obj/machinery/power/rad_collector/attack_hand(mob/user as mob)
	if(anchored)
		if(!src.locked)
			toggle_power()
			user.visible_message("[user.name] turns the [src.name] [active? "on":"off"].", \
			"You turn the [src.name] [active? "on":"off"].")
			investigate_log("turned [active?span_green("on"): span_red("off")] by [user.key]. [P?"Fuel: [round(P.air_contents.gas[GAS_PHORON]/0.29)]%":span_red("It is empty")].","singulo")
			return
		else
			to_chat(user, span_red("The controls are locked!"))
			return


/obj/machinery/power/rad_collector/attackby(obj/item/W, mob/user)
	if(istype(W, /obj/item/tank/phoron))
		if(!src.anchored)
			to_chat(user, span_red("The [src] needs to be secured to the floor first."))
			return 1
		if(src.P)
			to_chat(user, span_red("There's already a phoron tank loaded."))
			return 1
		user.drop_item()
		src.P = W
		W.loc = src
		update_icons()
		return 1
	else if(W.has_tool_quality(TOOL_CROWBAR))
		if(P && !src.locked)
			eject()
			return 1
	else if(W.has_tool_quality(TOOL_WRENCH))
		if(P)
			to_chat(user, span_blue("Remove the phoron tank first."))
			return 1
		playsound(src, W.usesound, 75, 1)
		src.anchored = !src.anchored
		user.visible_message("[user.name] [anchored? "secures":"unsecures"] the [src.name].", \
			"You [anchored? "secure":"undo"] the external bolts.", \
			"You hear a ratchet.")
		if(anchored)
			connect_to_network()
		else
			disconnect_from_network()
		return 1
	else if(istype(W, /obj/item/card/id)||istype(W, /obj/item/pda))
		if (src.allowed(user))
			if(active)
				src.locked = !src.locked
				to_chat(user, "The controls are now [src.locked ? "locked." : "unlocked."]")
			else
				src.locked = 0 //just in case it somehow gets locked
				to_chat(user, span_red("The controls can only be locked when the [src] is active."))
		else
			to_chat(user, span_red("Access denied!"))
		return 1
	return ..()

/obj/machinery/power/rad_collector/examine(mob/user)
	. = ..()
	if(get_dist(user, src) <= 3)
		. += "The meter indicates that it is collecting [last_power] W."

/obj/machinery/power/rad_collector/ex_act(severity)
	switch(severity)
		if(2, 3)
			eject()
	return ..()


/obj/machinery/power/rad_collector/proc/eject()
	locked = 0
	var/obj/item/tank/phoron/Z = src.P
	if (!Z)
		return
	Z.loc = get_turf(src)
	Z.layer = initial(Z.layer)
	src.P = null
	if(active)
		toggle_power()
	else
		update_icons()

/obj/machinery/power/rad_collector/proc/receive_pulse(var/pulse_strength)
	if(P && active)
		var/power_produced = 0
		power_produced = P.air_contents.gas[GAS_PHORON]*pulse_strength*20
		add_avail(power_produced)
		last_power_new = power_produced
		return
	return


/obj/machinery/power/rad_collector/proc/update_icons()
	cut_overlays()
	if(P)
		add_overlay("ptank")
	if(stat & (NOPOWER|BROKEN))
		return
	if(active)
		add_overlay("on")


/obj/machinery/power/rad_collector/proc/toggle_power()
	active = !active
	if(active)
		icon_state = "ca_on"
		flick("ca_active", src)
	else
		icon_state = "ca"
		flick("ca_deactive", src)
	update_icons()
	return
