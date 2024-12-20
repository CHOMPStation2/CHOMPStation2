/datum/event/electrical_fire/start()
	if(!machines.len)
		return

	var/list/possible_machines = list()
	for(var/obj/machinery/M in machines)
		var/area/A = get_area(M)
		if(!A)
			continue
		if(A.flag_check(AREA_FORBID_EVENTS))
			continue
		if(istype( A, /area/maintenance ))
			continue
		if(istype( A, /area/shuttle ))
			continue
		var/turf/T = get_turf(M)
		if(!T)
			continue
		if(T.is_outdoors())
			continue
		if(!(T.z in using_map.station_levels))
			continue
		// All of these make fires, a good spread in populated areas
		if(istype(M,/obj/machinery/light_switch))
			var/obj/machinery/light_switch/L = M
			if(L.on)
				possible_machines.Add(M) // prefer rooms that are in use
		if(istype(M,/obj/machinery/washing_machine) \
		|| istype(M,/obj/machinery/microwave) \
		|| istype(M,/obj/machinery/recharge_station) \
		|| istype(M,/obj/machinery/power/thermoregulator/cryogaia))
			if(!(M.stat & NOPOWER)) // Has to be powered
				possible_machines.Add(M)

	if(!possible_machines.len)
		return

	// set alight!
	var/obj/machinery/M = pick(possible_machines)
	if(M)
		M.visible_message(span_warning("\The [M] sparks violently and catches fire!"))
		var/datum/effect/effect/system/spark_spread/sparks = new /datum/effect/effect/system/spark_spread()
		sparks.set_up(4, 1, get_turf(M))
		sparks.start()

		var/turf/T = get_turf(M)
		T.lingering_fire(0.6)
