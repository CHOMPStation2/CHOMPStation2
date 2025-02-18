/datum/maintpred_task/grab_item
	var/target = null
	interruptable = TRUE

/datum/maintpred_task/grab_item/New(var/stealing, var/datum/maintpred_ai/task_holder, var/task_priority)
	target = stealing
	..(task_holder, task_priority)

/datum/maintpred_task/grab_item/wander()
	var/mob/living/mob = holder.ai_holder.holder
	var/dist = get_dist(mob, target)

	// Too far away, give up
	if (dist > 10) {
		holder.ai_holder.task = null
		return FALSE
	} else if (dist == 1) {
		mob.start_pulling(target)
	} else {
		holder.ai_holder.give_destination(target, 1)
	}
