/datum/maintpred_task/wander
	interruptable = TRUE
	// /area/maintenance prevents wandering outside of maints
	var/area_filter = /area/
	var/list/area/checking = list()
	var/list/area/checked_areas = list()

/datum/maintpred_task/wander/wander()
	// Nowhere to go, clear it and try again later
	if (length(checking) == 0) {
		for (var/atom/door in get_adjacent_areas(get_area(holder.ai_holder.holder))) {
			checking += get_area(door)
		}
		checked_areas += get_area(holder.ai_holder.holder)
		return FALSE
	}

	var/tried = 0;
	// Find an area to wander to
	while (length(checking) != 0 && tried < 5) {
		var/area/area = checking[1]
		tried += 1
		checking -= area
		checked_areas += area
		if (!istype(area, area_filter)) {
			// We failed, look past it
			for (var/atom/door in get_adjacent_areas(area)) {
				var/area/adjacent = get_area(door)
				if (!(adjacent in checked_areas)) {
					checking.Insert(1, adjacent)
				}
			}
		}

		message_admins("Going to [area]")
		holder.ai_holder.task = new /datum/maintpred_task/path_area(area, src)
		return TRUE
	}

	// No unchecked doors found, give up
	return FALSE

// Give up on that room if we can't get to it
/datum/maintpred_task/wander/gave_up()
	if (get_dist(holder.ai_holder.holder, holder.ai_holder.destination) <= 0) {
		// Patrolling is a DFS search
		for (var/atom/door in get_adjacent_areas(get_area(holder.ai_holder.holder))) {
			var/area/adjacent = get_area(door)
			if (!(adjacent in checked_areas)) {
				checking.Insert(1, adjacent)
			}
		}
	} else {
		// Make sure we stop looking in that direction
		if (length(checking) == 0) {
			message_admins("Gave up")
			checked_areas = list(get_area(holder.ai_holder.destination))
		}
	}

/datum/maintpred_task/follow
	var/mob/target = null
	interruptable = TRUE

/datum/maintpred_task/follow/New(var/following, var/datum/maintpred_ai/task_holder, var/task_priority)
	target = following
	..(task_holder, task_priority)

/datum/maintpred_task/follow/wander()
	holder.ai_holder.give_destination(target, 3)

/datum/maintpred_task/follow/glomp
	var/going_in = FALSE
	var/trapped = 0

/datum/maintpred_task/follow/glomp/wander()
	var/mob/living/mob = holder.ai_holder.holder
	var/dist = get_dist(mob, target)
	if (dist > 0 && trapped != 0) {
		mob.resting = FALSE
		trapped = 0
		mob.visible_message("\The [mob] allows [target] to escape from below its belly")
	}

	if (target.lying) {
		if (dist == 0) {
			if (trapped > 0) {
				if (trapped == 10) {
					mob.visible_message("\The [mob] shifts its weight on top of [target] to the floor, pinning them below its weight and wrapping its limbs around them affectionately")
				} else if (trapped == 20) {
					mob.visible_message("\The [mob] rumbles loudly, the vibrations of its chest making it clear it was planning on keeping [target] close")
				} else if (trapped == 40 && holder.ai_holder.vore_check(target)) {
					mob.visible_message("\The [mob] suddenly lowers its head, opening its maw and wrapping its jaws around [target]'s head, intent on deeping their hold around [target]")
					mob.perform_the_nom(mob, target, mob, mob.vore_selected)
				}
				trapped += 1;
			// Opportunistic snuggles
			} else if (!target.stunned && !target.weakened) {
				mob.visible_message("\The [mob] flops down on top of [target] to the floor, pinning them below its weight!")
				to_chat(target, span_blue("Your vision is suddenly filled with the [target]'s gut as it presses its weight down on top of your body, your entire form sudden smothered under their heavy gut as they affectionately rumble on top of you, intent on keeping you trapped and to itself for as long as it can."))
				mob.set_dir(EAST)
				mob.lying = 1
				target.Stun(5)
				target.Weaken(10)
				target.set_dir(EAST)
				target.resting = TRUE
				trapped = 1
			}
		} else {
			holder.ai_holder.give_destination(target, 0)
		}
		return TRUE
	}

	// Too far away, give up
	if (dist > 10) {
		holder.ai_holder.task = null
		return FALSE
	}

	if (rand(1, 10)) {
		going_in = TRUE
	}
	if (going_in) {
		holder.ai_holder.give_destination(target, 1)
		if (dist == 1) {
			// Choose what affectionate behavior the mob does
			var/choice = rand(1, 100)
			if(choice < 50) {
				mob.visible_message("\The [mob] nuzzles its beak against [target]")
			} else if(choice < 75) {
				mob.visible_message("\The [mob] slobber-licks across [target]'s face, coating it in saliva")
			} else if(choice < 90) {
				mob.visible_message("\The [mob] insistently presses its face against [target]")
			} else if (choice < 95) {
				mob.visible_message("\The [mob] leans all its weight onto [target], begging for attention")
			} else {
				mob.visible_message("\The [mob] suddenly tackles [target] to the floor, pinning them below its weight as it lays down on top of them!")
				to_chat(target, span_blue("Your vision is suddenly filled with the [target]'s gut as it presses its weight down on top of your body, your entire form sudden smothered under their heavy gut as they affectionately rumble on top of you, intent on keeping you trapped and to itself for as long as it can."))
				target.Stun(5)
				target.Weaken(10)
				target.resting = TRUE
				target.set_dir(EAST)
				mob.IMove(get_step_to(mob, target))
				mob.set_dir(EAST)
				mob.lying = 1
				trapped = 1
			}
			going_in = FALSE
		}
	} else {
		holder.ai_holder.give_destination(target, 3)
	}

/datum/maintpred_task/dummy
	interruptable = TRUE
