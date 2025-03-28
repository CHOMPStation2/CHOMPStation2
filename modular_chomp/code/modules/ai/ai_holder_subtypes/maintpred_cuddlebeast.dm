/datum/maintpred_ai/cuddlebeast

/datum/maintpred_ai/cuddlebeast/get_task()
	for (var/mob/target in ai_holder.list_targets()) {
		// It's a player we can glomp
		if (ai_holder.can_attack(target) && target.client != null) {
			return new /datum/maintpred_task/follow/glomp(target, src, 5)
		}
	}
	return null
