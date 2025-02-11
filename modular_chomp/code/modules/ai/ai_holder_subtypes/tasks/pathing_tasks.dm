/datum/maintpred_task/path_near_atom
	// /area/maintenance prevents wandering outside of maints
	var/failed = 0
	var/datum/maintpred_task/parent = null
	var/list/atom/path = null

/datum/maintpred_task/path_near_atom/New(var/atom/going_to, var/datum/maintpred_task/task_parent)
	parent = task_parent
	interruptable = parent.interruptable

	if (get_z(parent.holder.ai_holder) != get_z(going_to)) {
		message_admins("Crossing z levels!")
		path = list(going_to)
	} else {
		path = SSpathfinder.default_ai_pathfinding(parent.holder.ai_holder, get_turf(going_to), 0)
	}
	if (length(path) != 0) {
		parent.holder.ai_holder.give_destination(path[1], 0)
	}
	..(parent.holder, parent.priority)

/datum/maintpred_task/path_near_atom/wander()
	// Should never happen
	message_admins("Wandered?")
	return TRUE

/datum/maintpred_task/path_near_atom/gave_up()
	// We're done
	if (length(path) == 0) {
		holder.ai_holder.task = parent
		parent.gave_up()
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
		holder.ai_holder.give_destination(path[1], 0)
		return
	}

	// Can't path to that room, give up
	if (failed == 10) {
		holder.ai_holder.task = parent
		parent.gave_up()
		return
	}
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
	// Gotta find the right path there, doing this over time with BFS
	var/tries = 0
	while (path == null) {
		// No path
		if (length(checking) == 0) {
			holder.ai_holder.task = parent
			parent.gave_up()
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
				return TRUE;
			}
			// Adding a list adds its elements as well, so we add a list of the list to add the list itself
			checking += list(found)
		}
		if (tries >= 50) {
			return FALSE;
		}
		tries += 1
	}

	holder.ai_holder.task = parent
	parent.gave_up()
	return FALSE;

/proc/get_adjacent_areas(var/area/area)
	var/list/atom/output = list()
	var/list/area/areas = list()

	for (var/atom/door in area.all_doors) {
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
