var/list/ai_types = list(/datum/maintpred_ai/cuddlebeast)

// Guti please bite me ඞ
/datum/ai_holder/simple_mob/vore/maintpred
	violent_breakthrough = FALSE
	var/home = null
	var/datum/maintpred_task/task = null
	var/list/datum/maintpred_ai/ais = list()

/datum/ai_holder/simple_mob/vore/maintpred/New()
	..()
	while (length(ais) < length(ai_types) && length(ais) < 3) {
		var/adding = null
		do {
			adding = pick(ai_types)
		} while (adding in ais)
		//ais += new adding(src)
		// 50% chance for one AI type, 25% for two, 12.5% for three
		if (rand(1, 2) == 1) {
			break
		}
	}
	ais += new /datum/maintpred_ai/default_ai(src)
	home = get_area(holder)

/datum/ai_holder/simple_mob/vore/maintpred/find_target(list/possible_targets, has_targets_list)
	give_target(null)
	return null

/datum/ai_holder/simple_mob/vore/maintpred/give_up_movement()
	get_task().gave_up()
	. = ..()

/datum/ai_holder/simple_mob/vore/maintpred/proc/get_task()
	if (task != null && !task.interruptable) {
		return task
	}
	var/datum/maintpred_task/new_task = task
	for (var/datum/maintpred_ai/ai in ais) {
		var/datum/maintpred_task/testing = ai.get_task()
		if (testing != null && (new_task == null || testing.priority > new_task.priority)) {
			new_task = testing
		}
	}
	task = new_task
	return task

/datum/ai_holder/simple_mob/vore/maintpred/handle_wander_movement()
	// If it fails, run the base wander
	if (!get_task().wander()) {
		..()
	}

/datum/maintpred_ai
	var/datum/ai_holder/simple_mob/vore/maintpred/ai_holder = null

/datum/maintpred_ai/New(var/holder)
	ai_holder = holder

/datum/maintpred_ai/proc/get_task()
	// Overridden by children

/datum/maintpred_task
	var/datum/maintpred_ai/holder = null
	// Higher priority = executed first
	var/priority = 0
	var/interruptable = FALSE

/datum/maintpred_task/New(var/datum/maintpred_ai/task_holder, var/task_priority)
	holder = task_holder
	priority = task_priority

/datum/maintpred_task/proc/wander()
	// Overridden by children

/datum/maintpred_task/proc/gave_up()
	// Overridden by children
