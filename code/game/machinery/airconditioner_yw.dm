/obj/machinery/power/thermoregulator/cryogaia
	name = "Custom Thermal Regulator"
	desc = "A massive custom made Thermal regulator or CTR for short, intended to keep heat loss when going in our outside to a minimum, they are hardwired to tweentie celsius"
	icon = 'icons/obj/machines/thermoregulator_vr.dmi'
	icon_state = "lasergen"
	density = 1
	anchored = 0

	use_power = 0 //is powered directly from cables
	active_power_usage = 100 KILOWATTS  //Medium Power
	idle_power_usage = 250

	circuit = null 
	/*
	null so people can not deconstruct them and remake them to normal Regulators,
	probably should just make a circuit for it but this is pretty much just a proof of concept at the moment.
	*/

/obj/machinery/power/thermoregulator/cryogaia/attackby(obj/item/I, mob/user)
	if(I.is_screwdriver())
		if(default_deconstruction_screwdriver(user,I))
			return
	if(I.is_crowbar())
		if(default_deconstruction_crowbar(user,I))
			return
	if(I.is_wrench())
		anchored = !anchored
		visible_message("<span class='notice'>\The [src] has been [anchored ? "bolted to the floor" : "unbolted from the floor"] by [user].</span>")
		playsound(src, I.usesound, 75, 1)
		if(anchored)
			connect_to_network()
		else
			disconnect_from_network()
			turn_off()
		return
	if(istype(I, /obj/item/device/multitool))
		return
	..()