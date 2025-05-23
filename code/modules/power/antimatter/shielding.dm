//like orange but only checks north/south/east/west for one step
/proc/cardinalrange(var/center)
	var/list/things = list()
	for(var/direction in GLOB.cardinal)
		var/turf/T = get_step(center, direction)
		if(!T) continue
		things += T.contents
	return things

/obj/machinery/am_shielding
	name = "antimatter reactor section"
	desc = "This device was built using a phoron life-form that seems to increase phoron's natural ability to react with neutrinos while reducing the combustibility."

	icon = 'icons/obj/machines/antimatter.dmi'
	icon_state = "shield"
	anchored = TRUE
	density = TRUE
	dir = 1
	use_power = USE_POWER_OFF //Living things generally dont use power
	idle_power_usage = 0
	active_power_usage = 0

	var/obj/machinery/power/am_control_unit/control_unit = null
	var/processing = 0//To track if we are in the update list or not, we need to be when we are damaged and if we ever
	var/stability = 100//If this gets low bad things tend to happen
	var/efficiency = 1//How many cores this core counts for when doing power processing, phoron in the air and stability could affect this


/obj/machinery/am_shielding/Initialize(mapload)
	. = ..()
	if(!istype(loc, /turf))
		return INITIALIZE_HINT_QDEL
	//Make sure we are the only one here
	for(var/obj/machinery/am_shielding/AMS in loc.contents)
		if(AMS == src)
			continue
		return INITIALIZE_HINT_QDEL

	scan_control_shield()

	if(!control_unit) // Failed to link
		return INITIALIZE_HINT_QDEL

/obj/machinery/am_shielding/proc/controllerscan()
	//Make sure we are the only one here
	if(!istype(loc, /turf))
		qdel(src)
		return

	for(var/obj/machinery/am_shielding/AMS in loc.contents)
		if(AMS == src)
			continue
		qdel(src)
		return

	scan_control_shield()

	if(!control_unit) // Failed to link
		qdel(src)

/obj/machinery/am_shielding/proc/scan_control_shield()
	//Search for shielding first
	for(var/obj/machinery/am_shielding/AMS in cardinalrange(src))
		if(AMS && AMS.control_unit && link_control(AMS.control_unit))
			break

	if(!control_unit)//No other guys nearby look for a control unit
		for(var/obj/machinery/power/am_control_unit/AMC in cardinalrange(src))
			if(AMC.add_shielding(src))
				break

/obj/machinery/am_shielding/Destroy()
	if(control_unit)	control_unit.remove_shielding(src)
	if(processing)	shutdown_core()
	visible_message(span_red("The [src.name] melts!"))
	//Might want to have it leave a mess on the floor but no sprites for now
	. = ..()


/obj/machinery/am_shielding/CanPass(atom/movable/mover, turf/target)
	return FALSE


/obj/machinery/am_shielding/process()
	if(!processing) . = PROCESS_KILL
	//TODO: core functions and stability
	//TODO: think about checking the airmix for phoron and increasing power output
	return


/obj/machinery/am_shielding/emp_act()//Immune due to not really much in the way of electronics.
	return 0


/obj/machinery/am_shielding/ex_act(severity)
	switch(severity)
		if(1.0)
			stability -= 80
		if(2.0)
			stability -= 40
		if(3.0)
			stability -= 20
	check_stability()
	return


/obj/machinery/am_shielding/bullet_act(var/obj/item/projectile/Proj)
	if(Proj.check_armour != "bullet")
		stability -= Proj.force/2
	return 0


/obj/machinery/am_shielding/update_icon()
	cut_overlays()
	for(var/direction in GLOB.alldirs)
		var/machine = locate(/obj/machinery, get_step(loc, direction))
		if((istype(machine, /obj/machinery/am_shielding) && machine:control_unit == control_unit)||(istype(machine, /obj/machinery/power/am_control_unit) && machine == control_unit))
			add_overlay("shield_[direction]")

	if(core_check())
		add_overlay("core")
		if(!processing) setup_core()
	else if(processing) shutdown_core()


/obj/machinery/am_shielding/attackby(obj/item/W, mob/user)
	if(!istype(W) || !user) return
	if(W.force > 10)
		stability -= W.force/2
		check_stability()
	..()
	return



//Call this to link a detected shilding unit to the controller
/obj/machinery/am_shielding/proc/link_control(var/obj/machinery/power/am_control_unit/AMC)
	if(!istype(AMC))	return 0
	if(control_unit && control_unit != AMC) return 0//Already have one
	control_unit = AMC
	control_unit.add_shielding(src,1)
	return 1


//Scans cards for shields or the control unit and if all there it
/obj/machinery/am_shielding/proc/core_check()
	for(var/direction in GLOB.alldirs)
		var/machine = locate(/obj/machinery, get_step(loc, direction))
		if(!machine) return 0//Need all for a core
		if(!istype(machine, /obj/machinery/am_shielding) && !istype(machine, /obj/machinery/power/am_control_unit))	return 0
	return 1


/obj/machinery/am_shielding/proc/setup_core()
	processing = 1
	START_MACHINE_PROCESSING(src)
	if(!control_unit)	return
	control_unit.linked_cores.Add(src)
	control_unit.reported_core_efficiency += efficiency
	return


/obj/machinery/am_shielding/proc/shutdown_core()
	processing = 0
	if(!control_unit)	return
	control_unit.linked_cores.Remove(src)
	control_unit.reported_core_efficiency -= efficiency
	return


/obj/machinery/am_shielding/proc/check_stability(var/injecting_fuel = 0)
	if(stability > 0) return
	if(injecting_fuel && control_unit)
		control_unit.exploding = 1
	if(src)
		qdel(src)
	return


/obj/machinery/am_shielding/proc/recalc_efficiency(var/new_efficiency)//tbh still not 100% sure how I want to deal with efficiency so this is likely temp
	if(!control_unit || !processing) return
	if(stability < 50)
		new_efficiency /= 2
	control_unit.reported_core_efficiency += (new_efficiency - efficiency)
	efficiency = new_efficiency
	return



/obj/item/am_shielding_container
	name = "packaged antimatter reactor section"
	desc = "A small storage unit containing an antimatter reactor section.  To use place near an antimatter control unit or deployed antimatter reactor section and use a multitool to activate this package."
	icon = 'icons/obj/machines/antimatter.dmi'
	icon_state = "box"
	item_state = "electronic"
	w_class = ITEMSIZE_LARGE
	throwforce = 5
	throw_speed = 1
	throw_range = 2
	matter = list(MAT_STEEL = 100)

/obj/item/am_shielding_container/attackby(var/obj/item/I, var/mob/user)
	if(istype(I, /obj/item/multitool) && istype(src.loc,/turf))
		new/obj/machinery/am_shielding(src.loc)
		qdel(src)
		return
	..()
	return
