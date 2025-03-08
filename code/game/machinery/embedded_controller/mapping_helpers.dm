/*

Note that these have to be in the same /area that the controller is in for them to function.
You still need to set the controller's "id_tag" to something unique.
Any frequency works, it's self-setting, but it seems like people have decided 1380 for airlocks so maybe set that on the controller too.

*/

/obj/effect/map_helper/airlock
	name = "use a subtype!"
	icon = 'icons/misc/map_helpers.dmi'
	plane = 20 //I dunno just high.
	alpha = 170

	//The controller we're wanting our device to use
	var/obj/machinery/embedded_controller/radio/my_controller
	var/my_controller_type = /obj/machinery/embedded_controller/radio/airlock
	//The device we're setting up
	var/my_device
	var/my_device_type
	//Most things have a radio tag of some sort that needs adjusting
	var/tag_addon

/obj/effect/map_helper/airlock/Initialize(mapload)
	..()
	my_controller = get_controller(get_area(src))
	my_device = locate(my_device_type) in get_turf(src)
	if(!my_device)
		to_world(span_world("[span_red("WARNING:")][span_black("Airlock helper '[name]' couldn't find what it wanted at: X:[x] Y:[y] Z:[z]")]"))
	else if(!my_controller)
		to_world(span_world("[span_red("WARNING:")][span_black("Airlock helper '[name]' couldn't find a controller at: X:[x] Y:[y] Z:[z]")]"))
	else if(!my_controller.id_tag)
		to_world(span_world("[span_red("WARNING:")][span_black("Airlock helper '[name]' found a controller without an 'id_tag' set: X:[x] Y:[y] Z:[z]")]"))
	else
		setup()
	return INITIALIZE_HINT_QDEL

/obj/effect/map_helper/airlock/Destroy()
	my_controller = null
	my_device = null
	return ..()

/obj/effect/map_helper/airlock/proc/get_controller(var/area/A)
	if(!A)
		return null

	var/list/potentials = list()
	for(var/obj/O in A)
		if(istype(O, my_controller_type))
			potentials += O

	//Couldn't find one
	if(!potentials.len)
		return null

	//Only found one
	if(potentials.len == 1)
		return potentials[1]

	//Gotta find closest
	var/closest = potentials[potentials.len]
	var/closest_dist = get_dist(src, closest)
	potentials.len--
	while(potentials.len)
		var/C = potentials[potentials.len]
		potentials.len--
		var/dist = get_dist(src, C)
		if(dist < closest_dist)
			closest_dist = dist
			closest = C

	return closest

/obj/effect/map_helper/airlock/proc/setup()
	return //Stub for subtypes


/*
	Doors
*/
/obj/effect/map_helper/airlock/door
	name = "use a subtype! - airlock door"
	my_device_type = /obj/machinery/door/airlock

/obj/effect/map_helper/airlock/door/setup()
	var/obj/machinery/door/airlock/my_airlock = my_device
	my_airlock.lock()
	my_airlock.id_tag = my_controller.id_tag + tag_addon
	my_airlock.frequency = my_controller.frequency
	my_airlock.set_frequency(my_controller.frequency)
	my_airlock.req_access = my_controller.req_access
	my_airlock.req_one_access = my_controller.req_one_access

/obj/effect/map_helper/airlock/door/ext_door
	name = "exterior airlock door"
	icon_state = "doorout"
	tag_addon = "_outer"

/obj/effect/map_helper/airlock/door/int_door
	name = "interior airlock door"
	icon_state = "doorin"
	tag_addon = "_inner"

/obj/effect/map_helper/airlock/door/simple
	name = "simple docking controller hatch"
	icon_state = "doorsimple"
	tag_addon = "_hatch"
	my_controller_type = /obj/machinery/embedded_controller/radio/simple_docking_controller


/*
	Atmos
*/
/obj/effect/map_helper/airlock/atmos
	name = "use a subtype! - airlock pump"
	my_device_type = /obj/machinery/atmospherics/unary/vent_pump

/obj/effect/map_helper/airlock/atmos/setup()
	var/obj/machinery/atmospherics/unary/vent_pump/my_pump = my_device
	my_pump.frequency = my_controller.frequency //Unlike doors, these set up their radios in atmos init, so they won't have gone before us.
	my_pump.id_tag = my_controller.id_tag + tag_addon

/obj/effect/map_helper/airlock/atmos/chamber_pump
	name = "chamber pump"
	icon_state = "pump"
	tag_addon = "_pump"

/obj/effect/map_helper/airlock/atmos/pump_out_internal
	name = "air dump intake"
	icon_state = "pumpdin"
	tag_addon = "_pump_out_internal"

/obj/effect/map_helper/airlock/atmos/pump_out_external
	name = "air dump output"
	icon_state = "pumpdout"
	tag_addon = "_pump_out_external"


/*
	Sensors - did you know they function as buttons? You don't also need a button.
	CHOMPEdit:	They don't function identically to buttons. They're also entirely unnecessary for station use because of their complexity.
				They do function well and should be used for shuttle airlocks but unchanging environments don't need sensors.
				A chamber sensor is still necessary.
*/
/obj/effect/map_helper/airlock/sensor
	name = "use a subtype! - airlock sensor"
	my_device_type = /obj/machinery/airlock_sensor
	var/command

/obj/effect/map_helper/airlock/sensor/setup()
	var/obj/machinery/airlock_sensor/my_sensor = my_device
	my_sensor.id_tag = my_controller.id_tag + tag_addon
	my_sensor.master_tag = my_controller.id_tag
	my_sensor.frequency = my_controller.frequency
	my_sensor.set_frequency(my_controller.frequency)
	my_sensor.req_access = my_controller.req_access
	my_sensor.req_one_access = my_controller.req_one_access
	if(command)
		my_sensor.command = command

/obj/effect/map_helper/airlock/sensor/ext_sensor
	name = "exterior sensor"
	icon_state = "sensout"
	tag_addon = "_exterior_sensor"
	command = "cycle_exterior"

/obj/effect/map_helper/airlock/sensor/chamber_sensor
	name = "chamber sensor"
	icon_state = "sens"
	tag_addon = "_sensor"
	command = "cycle"

/obj/effect/map_helper/airlock/sensor/int_sensor
	name = "interior sensor"
	icon_state = "sensin"
	tag_addon = "_interior_sensor"
	command = "cycle_interior"

/*
	Buttons
*/

// CHOMPStation Addition: Button helpers, because they didn't exist before due to 'just use sensors'
/obj/effect/map_helper/airlock/button
	name = "Use a subtype! - button"
	my_device_type = /obj/machinery/access_button
	var/command

/obj/effect/map_helper/airlock/button/setup()
	var/obj/machinery/airlock_sensor/my_button = my_device
	my_button.master_tag = my_controller.id_tag
	my_button.frequency = my_controller.frequency
	my_button.set_frequency(my_controller.frequency)
	my_button.req_access = my_controller.req_access
	my_button.req_one_access = my_controller.req_one_access
	if(command)
		my_button.command = command

/obj/effect/map_helper/airlock/button/ext_button
	name = "exterior button"
	icon_state = "btnout"
	tag_addon = "_exterior_button"
	command = "cycle_exterior"

/obj/effect/map_helper/airlock/button/int_button
	name = "interior button"
	icon_state = "btnin"
	tag_addon = "_interior_button"
	command = "cycle_interior"
// CHOMPStation Addition End
