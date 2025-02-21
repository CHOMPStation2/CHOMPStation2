/datum/maintpred_task/path_near_atom
	// /area/maintenance prevents wandering outside of maints
	var/failed = 0
	var/datum/maintpred_task/parent = null
	var/list/atom/path = null
	var/atom/going_to = null

/datum/maintpred_task/path_near_atom/New(var/atom/target, var/datum/maintpred_task/task_parent)
	parent = task_parent
	interruptable = parent.interruptable
	going_to = target

	if (get_z(parent.holder.ai_holder.holder) != get_z(going_to)) {
		message_admins("Crossing z levels! [length(global_ladders[get_z(parent.holder.ai_holder.holder)])]")
		var/obj/structure/ladder = nearest_ladder_to(get_turf(parent.holder.ai_holder.holder), get_z(going_to))
		if (ladder == null) {
			message_admins("Failed to find ladder!")
			path = list(going_to)
		} else {
			path = list(get_turf(ladder), get_turf(ladder_on(ladder, get_z(going_to))))
		}
	} else {
		message_admins("Pathing to [get_x(going_to)] [get_y(going_to)]!")
		path = SSpathfinder.default_ai_pathfinding(parent.holder.ai_holder, get_turf(going_to), 0)
	}
	message_admins("Path size: [length(path)]!")
	if (length(path) != 0) {
		message_admins("Moving to [path[1].x] [path[1].y]!")
		parent.holder.ai_holder.give_destination(path[1], 0)
	}
	..(parent.holder, parent.priority)

/datum/maintpred_task/path_near_atom/wander()
	message_admins("Wandered! For [get_x(holder.ai_holder.destination)] [get_y(holder.ai_holder.destination)]")
	// Should never happen, so let gave_up try to fix it
	gave_up()

/datum/maintpred_task/path_near_atom/gave_up()
	// We're done
	if (length(path) == 0) {
		if (get_dist(holder.ai_holder.holder, going_to) > 0) {
			message_admins("Repathing!")
			failed += 1
			path = SSpathfinder.default_ai_pathfinding(parent.holder.ai_holder, get_turf(going_to), 0)
		} else {
			message_admins("Got here!")
			holder.ai_holder.task = parent
			parent.gave_up()
		}
		return
	}

	// Go to the next path node
	if (get_dist(holder.ai_holder.holder, holder.ai_holder.destination) <= 0) {
		path.Cut(1, 2)
		if (length(path) == 0) {
			holder.ai_holder.task = parent
			parent.gave_up()
			return
		}
		message_admins("Next node! [get_x(path[1])], [get_y(path[1])]")
		holder.ai_holder.give_destination(path[1], 0)
		failed = 0
		return
	}

	// Can't path to that room, give up
	if (failed == 10) {
		message_admins("Gave up!")
		holder.ai_holder.task = parent
		parent.gave_up()
		return
	}
	holder.ai_holder.give_destination(path[1], 0)
	failed += 1;

/datum/maintpred_task/path_area
	// /area/maintenance prevents wandering outside of maints
	var/area/target = null
	var/fallback = FALSE
	var/datum/maintpred_task/parent = null
	var/list/atom/path = null
	var/list/list/atom/checking = list()
	var/list/area/checked_areas = list()
	var/list/area/blocked = list()

/datum/maintpred_task/path_area/New(var/area/going_to, var/datum/maintpred_task/task_parent)
	target = going_to
	parent = task_parent
	interruptable = parent.interruptable
	checking = list(list(parent.holder.ai_holder.holder))
	..(parent.holder, parent.priority)

/datum/maintpred_task/path_area/wander()
	var/mob/living/mob = holder.ai_holder.holder
	// Try to calculate the path
	if(path == null && !find_path()) {
		return FALSE
	}

	// Check if we got there
	if (length(path) == 0) {
		holder.ai_holder.task = parent
		holder.ai_holder.give_destination(mob, 0)
		parent.gave_up()
		return parent.wander()
	}

	// Check if we hit the next node
	if (get_dist(mob, path[1]) == 0) {
		fallback = FALSE
		path -= path[1]
		return wander()
	}

	message_admins("Heading to [get_x(path[1])] [get_y(path[1])]!")
	holder.ai_holder.task = new /datum/maintpred_task/path_near_atom(path[1], src)

/datum/maintpred_task/path_area/gave_up()
	// Hit the next path location
	if (get_dist(holder.ai_holder.holder, holder.ai_holder.destination) <= 0) {
		return
	}

	// Path failed, it's blocked
	reset_pathing()

/datum/maintpred_task/path_area/proc/reset_pathing()
	blocked += get_area(path[1])
	path = null
	checked_areas = list()
	checking = list(list(holder.ai_holder.holder))

/datum/maintpred_task/path_area/proc/find_path()
	message_admins("Finding path!")
	// Gotta find the right path there, doing this over time with BFS
	var/tries = 0
	while (path == null) {
		// No path
		if (length(checking) == 0) {
			holder.ai_holder.task = parent
			parent.gave_up()
			message_admins("Fail 3!")
			return FALSE
		}

		var/list/atom/trying = checking[1]
		checking.Cut(1, 2)
		for (var/atom/door in get_adjacent_areas(get_area(trying[length(trying)]))) {
			var/area/area = get_area(door)
			if ((area in checked_areas) || (area in blocked)) {
				continue
			}

			var/list/atom/found = trying.Copy()
			found += door
			checked_areas += area
			if (area == target) {
				path = found
				path -= found[1]
				message_admins("Found path!")
				return TRUE;
			}
			// Adding a list adds its elements as well, so we add a list of the list to add the list itself
			checking += list(found)
		}
		if (tries >= 50) {
			message_admins("Fail 1!")
			return FALSE;
		}
		tries += 1
	}

	holder.ai_holder.task = parent
	parent.gave_up()
	message_admins("Fail 2!")
	return FALSE

/proc/get_adjacent_areas(var/area/area)
	var/list/atom/output = list()
	var/list/area/areas = list()

	for (var/atom/door in area.all_doors) {
		// Skip firedoors with no airlock. all_doors is only firedoors so type filtering won't work.
		// This prevents trying to path through firedoors on windows
		var/obj/machinery/door/airlock/airlock = locate() in get_turf(door)
		if (airlock == null) {
			continue
		}
		message_admins("Found one with a door!")

		// Check every direction from the door
		for (var/direction in cardinal) {
			var/atom/target = get_step(door, direction)
			var/area/new_area = get_area(target)

			if (new_area == area || (new_area in areas)) {
				continue
			}
			output += target
			areas += get_area(target)
			break
		}
	}

	return output

/proc/nearest_ladder_to(var/turf/current, var/target_z)
	var/min_dist = INFINITY
	var/obj/structure/ladder/found = null
	if (global_ladders[get_z(current)] == null) {
		message_admins("None on z level [get_x(current)], [get_y(current)], [get_z(current)]!")
		return null;
	}
	for (var/obj/structure/ladder/ladder in global_ladders[get_z(current)]) {
		message_admins("Trying!")
		if (ladder_on(ladder, target_z) != null) {
			var/dist = get_dist(get_turf(ladder), current)
			if (dist < min_dist) {
				min_dist = dist
				found = ladder
			}
		}
	}
	return found

/proc/ladder_on(var/obj/structure/ladder/current, var/target_z)
	while (TRUE) {
		if (get_z(current) < target_z) {
			if (current.target_down == null) {
				message_admins("No way up to [target_z] from [get_z(current)]!")
				return null
			}
			current = current.target_down
		} else if (get_z(current) > target_z) {
			if (current.target_up == null) {
				message_admins("No way down to [target_z] from [get_z(current)]!")
				return null
			}
			current = current.target_up
		} else {
			message_admins("Got ladder!")
			return current
		}
	}
