/datum/maintpred_ai/default_ai
	var/hit = FALSE

/datum/maintpred_ai/default_ai/get_task()
	if (istype(get_area(ai_holder.holder), /area/crew_quarters/cafeteria) && !hit) {
		message_admins("Got here!")
		hit = TRUE
		for (var/atom/door in get_area(ai_holder.holder).all_doors) {
			// Check every direction from the door
			for (var/direction in cardinal) {
				var/atom/target = get_step(door, direction)
				var/area/new_area = get_area(target)

				message_admins("Checking [new_area]")
				if (!istype(new_area, /area/crew_quarters/kitchen)) {
					continue
				}
				return new /datum/maintpred_task/path_near_atom(target, new /datum/maintpred_task/dummy(src, 10))
			}
		}
	}

	if (hit) {
		return null
	}

	return new /datum/maintpred_task/path_area((locate(/area/crew_quarters/cafeteria) in world), new /datum/maintpred_task/dummy(src, 10))
	//return new /datum/maintpred_task/wander(src, 0)
