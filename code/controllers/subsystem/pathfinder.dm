//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2023 Citadel Station developers.          *//

#define PATHFINDER_TIMEOUT 50

SUBSYSTEM_DEF(pathfinder)
	name = "Pathfinder"
	subsystem_flags = SS_NO_INIT | SS_NO_FIRE

	/// pathfinding mutex - most algorithms depend on this
	/// multi "threading" in byond just adds overhead
	/// from everything trying to re-queue their executions
	/// for this reason, much like with maploading,
	/// it's somewhat pointless to have more than one operation going
	/// at a time
	var/pathfinding_mutex = FALSE
	/// pathfinding calls blocked
	var/pathfinding_blocked = 0

/**
 * be aware that this emits a set of disjunct nodes
 * use [jps_output_turfs()] to convert them into a proper turf path list.
 */
/datum/controller/subsystem/pathfinder/proc/get_path_jps(atom/movable/actor, turf/goal, turf/start = get_turf(actor), target_distance = 1, max_path_length = 128)
	var/datum/pathfinding/jps/instance = new(actor, start, goal, target_distance, max_path_length)
	return run_pathfinding(instance)

/datum/controller/subsystem/pathfinder/proc/get_path_astar(atom/movable/actor, turf/goal, turf/start = get_turf(actor), target_distance = 1, max_path_length = 128)
	var/datum/pathfinding/astar/instance = new(actor, start, goal, target_distance, max_path_length)
	return run_pathfinding(instance)

/datum/controller/subsystem/pathfinder/proc/default_ai_pathfinding(datum/ai_holder/holder, turf/goal, min_dist = 1, max_path = 128)
	var/datum/pathfinding/astar/instance = new(holder.holder, get_turf(holder.holder), goal, min_dist, max_path)
	var/obj/item/card/id/potential_id = holder.holder.GetIdCard()
	if(!isnull(potential_id))
		instance.ss13_with_access = potential_id.access?.Copy()
	return run_pathfinding(instance)

/datum/controller/subsystem/pathfinder/proc/default_circuit_pathfinding(obj/item/electronic_assembly/assembly, turf/goal, min_dist = 1, max_path = 128)
	var/datum/pathfinding/jps/instance = new(assembly, get_turf(assembly), goal, min_dist, max_path)
	instance.ss13_with_access = assembly.access_card?.access?.Copy()
	return jps_output_turfs(run_pathfinding(instance))

/datum/controller/subsystem/pathfinder/proc/default_bot_pathfinding(mob/living/bot/bot, turf/goal, min_dist = 1, max_path = 128)
	var/datum/pathfinding/jps/instance = new(bot, get_turf(bot), goal, min_dist, max_path)
	instance.ss13_with_access = bot.botcard.access?.Copy()
	return jps_output_turfs(run_pathfinding(instance))

/datum/controller/subsystem/pathfinder/proc/run_pathfinding(datum/pathfinding/instance)
	var/started = world.time
	++pathfinding_blocked
	if(pathfinding_blocked < 10)
		while(pathfinding_mutex)
			stoplag(1)
			if(world.time > started + PATHFINDER_TIMEOUT)
				stack_trace("pathfinder timeout; check debug logs.")
				log_debug("pathfinder timeout of instance with debug variables [instance.debug_log_string()]")
				return
	else
		while(pathfinding_mutex)
			stoplag(3)
			if(world.time > started + PATHFINDER_TIMEOUT)
				stack_trace("pathfinder timeout; check debug logs.")
				log_debug("pathfinder timeout of instance with debug variables [instance.debug_log_string()]")
				return
	--pathfinding_blocked
	pathfinding_mutex = TRUE
	. = instance.search()
	if(world.time > started + PATHFINDER_TIMEOUT)
		stack_trace("pathfinder timeout; check debug logs.")
		log_debug("pathfinder timeout of instance with debug variables [instance.debug_log_string()]")
	pathfinding_mutex = FALSE

#undef PATHFINDER_TIMEOUT
