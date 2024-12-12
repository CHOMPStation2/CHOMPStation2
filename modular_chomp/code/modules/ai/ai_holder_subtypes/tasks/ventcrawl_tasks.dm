/datum/maintpred_task/ventcrawl
	var/mob/target = null

/datum/maintpred_task/ventcrawl/New(var/following, var/datum/maintpred_ai/task_holder, var/task_priority)
	target = following
	..(task_holder, task_priority)

/datum/maintpred_task/ventcrawl/wander()
	holder.ai_holder.give_destination(target, 3)
