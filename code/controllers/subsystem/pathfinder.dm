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

/datum/controller/subsystem/pathfinder/proc/get_path_jps()
	#warn impl

/datum/controller/subsystem/pathfinder/proc/get_path_astar()
	#warn impl

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
