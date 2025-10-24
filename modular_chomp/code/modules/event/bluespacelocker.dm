/datum/event/bluespace_locker
	var/obj/structure/closet/entry_point
	var/obj/structure/closet/exit_point
	var/list/area/excluded = list(
		/area/shuttle,
		/area/crew_quarters,
		/area/construction,
		/area/rnd/test_area,
		/area/solar
	)

/datum/event/bluespace_locker/setup()
	var/list/area/pickable_areas = get_station_areas(excluded)

	for(var/i in 1 to 10)
		var/area/picked_area = pick(pickable_areas)
		var/list/obj/structure/closet/entry_points = list()
		var/list/obj/structure/closet/exit_points = list()

		for(var/obj/structure/closet/closet in picked_area)
			// Only the standing lockers
			if(istype(closet, /obj/structure/closet/crate) || istype(closet, /obj/structure/closet/walllocker))
				continue
			if(!closet.can_open()) // Skip locked/welded ones
				continue
			entry_points.Add(closet)
			pickable_areas.Remove(picked_area)

		// After that, choose another area
		picked_area = pick(pickable_areas)

		// And for the fun of it, pick any locker or crate. Locked or not.
		for(var/obj/structure/closet/closet in picked_area)
			exit_points.Add(closet)

		if(length(entry_points) && length(exit_points))
			entry_point = pick(entry_points)
			exit_point = pick(exit_points)
			announceWhen = rand(10 SECONDS, 2 MINUTES)
			endWhen = announceWhen + 1
			return

	log_game("Bluespace Locker Event: Giving up after too many failures to pick valid candidates.")
	kill()
	return

/datum/event/bluespace_locker/start()
	if(!entry_point || !exit_point)
		return

	entry_point.AddComponent(/datum/component/bluespace_connection, list(exit_point))
	exit_point.AddComponent(/datum/component/bluespace_connection, list(entry_point))

	log_and_message_admins("Bluespace lockers linked. Entry: [get_area(exit_point)] Exit: [get_area(entry_point)]")

/datum/event/bluespace_locker/announce()
	command_announcement.Announce("Bluespace anomaly detected near [station_name()]. Monitor sensitive equipment for malfunctions.", "Anomaly Alert")
