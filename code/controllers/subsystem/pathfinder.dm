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

/datum/controller/subsystem/pathfinder/proc/get_path_jps(atom/movable/actor, turf/goal, turf/start = get_turf(actor), target_distance = 1, max_path_length = 128)
	var/datum/pathfinding/jps/instance = new(actor, start, goal, target_distance, max_path_length)
	return run_pathfinding(instance)

/datum/controller/subsystem/pathfinder/proc/get_path_astar(atom/movable/actor, turf/goal, turf/start = get_turf(actor), target_distance = 1, max_path_length = 128)
	var/datum/pathfinding/astar/instance = new(actor, start, goal, target_distance, max_path_length)
	return run_pathfinding(instance)

/datum/controller/subsystem/pathfinder/proc/default_ai_pathfinding(datum/ai_holder/holder, turf/goal)
	return get_path_astar(holder.holder, goal, get_turf(holder.holder), 1, 128)

/datum/controller/subsystem/pathfinder/proc/default_circuit_pathfinding(obj/item/electronic_assembly/assembly, turf/goal)
	return jps_output_turfs(get_path_jps(assembly, goal, get_turf(assembly), 0, 128))

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
