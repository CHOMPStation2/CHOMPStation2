//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2023 Citadel Station developers.          *//

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

/datum/controller/subsystem/pathfinder/proc/get_path_jps()
	#warn impl

/datum/controller/subsystem/pathfinder/proc/get_path_astar()
	#warn impl

/datum/controller/subsystem/pathfinder/proc/run_pathfinding(datum/pathfinding/instance)
	var/started = world.time
	while(pathfinding_mutex)

