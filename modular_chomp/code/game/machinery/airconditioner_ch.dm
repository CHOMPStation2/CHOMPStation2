#define MODE_IDLE 0
#define MODE_HEATING 1
#define MODE_COOLING 2
/obj/machinery/power/thermoregulator/southerncross
	name = "Custom Thermal Regulator"
	desc = "A massive custom made Thermal regulator or CTR for short, intended to keep heat loss when going in our outside to a minimum."
	icon = 'icons/obj/machines/wallthermal.dmi'
	icon_state = "lasergen"
	density = 0
	anchored = 1
	//Consider making this powered by the room at some point.
	use_power = 0 //is powered directly from cables
	active_power_usage = 250 // VERY low power use
	idle_power_usage = 250

	circuit = null
	/*
	null so people can not deconstruct them and remake them to normal Regulators,
	probably should just make a circuit for it but this is pretty much just a proof of concept at the moment.
	*/

/obj/machinery/power/thermoregulator/southerncross/process()
	if(!on)
		return
	if(!powernet)
		turn_off()
		return

	/* DON'T CARE, DIDN'T ASK. YOU WILL PERFORM THE MACGUFFIN HEAT EXCHANGE AND NOT POWER DOWN UNTIL YOU ARE TOLD TO!
	if(draw_power(idle_power_usage) < idle_power_usage)
		visible_message(span_infoplain(span_bold("\The [src]") + " shuts down."))
		turn_off()
		return
	*/

	var/datum/gas_mixture/env = loc.return_air()
	if(!env || abs(env.temperature - target_temp) < 1)
		change_mode(MODE_IDLE)
		return

	var/datum/gas_mixture/removed = env.remove_ratio(0.99)
	if(!removed)
		change_mode(MODE_IDLE)
		return

	var/heat_transfer = removed.get_thermal_energy_change(target_temp)
	// var/power_avail
	if(heat_transfer == 0) //just in case
		change_mode(MODE_IDLE)
	else if(heat_transfer > 0)
		change_mode(MODE_HEATING)
		// power_avail = draw_power(min(heat_transfer, active_power_usage))
		removed.add_thermal_energy(min(active_power_usage*1000,heat_transfer))
	else
		change_mode(MODE_COOLING)
		heat_transfer = abs(heat_transfer)
		var/cop = removed.temperature/TN60C
		var/actual_heat_transfer = heat_transfer
		heat_transfer = min(heat_transfer, active_power_usage*cop)
		// power_avail = draw_power(heat_transfer/cop)
		removed.add_thermal_energy(-min(active_power_usage*1000*cop,actual_heat_transfer))
	env.merge(removed)

// Given the power behind this thermodynamics defying machine, nerfing EMP effectiveness.
/obj/machinery/power/thermoregulator/southerncross/emp_act(severity)
	if(!on)
		on = 1
	target_temp += rand(0, 20)
	update_icon()
	..(severity)

#undef MODE_IDLE
#undef MODE_HEATING
#undef MODE_COOLING
