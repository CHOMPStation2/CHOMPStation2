//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2023 Citadel Station developers.          *//

#define PATHFINDER_TIMEOUT 50

SUBSYSTEM_DEF(pathfinder)
	name = "Pathfinder"
	flags = SS_NO_INIT | SS_NO_FIRE

	/// pathfinding mutex - most algorithms depend on this
	/// multi "threading" in byond just adds overhead
	/// from everything trying to re-queue their executions
	/// for this reason, much like with maploading,
	/// it's somewhat pointless to have more than one operation going
	/// at a time
	var/pathfinding_mutex = FALSE
	/// pathfinding calls blocked
	var/pathfinding_blocked = 0
	/// pathfinding cycle - this is usable because of the mutex
	/// this is used in place of a closed list in algorithms like JPS
	/// to maximize performance.
	var/tmp/pathfinding_cycle = 0

/**
 * be aware that this emits a set of disjunct nodes
 * use [jps_output_turfs()] to convert them into a proper turf path list.
 *
 * Please see [code/__HELPERS/pathfinding/jps.dm] for details on what JPS does/is.
 */
/datum/controller/subsystem/pathfinder/proc/get_path_jps(atom/movable/actor = GLOB.generic_pathfinding_actor, turf/goal, turf/start = get_turf(actor), target_distance = 1, max_path_length = 128)
	var/datum/pathfinding/jps/instance = new(actor, start, goal, target_distance, max_path_length)
	return run_pathfinding(instance)

/**
 * Please see [code/__HELPERS/pathfinding/astar.dm] for details on what JPS does/is.
 */
/datum/controller/subsystem/pathfinder/proc/get_path_astar(atom/movable/actor = GLOB.generic_pathfinding_actor, turf/goal, turf/start = get_turf(actor), target_distance = 1, max_path_length = 128)
	var/datum/pathfinding/astar/instance = new(actor, start, goal, target_distance, max_path_length)
	return run_pathfinding(instance)

/datum/controller/subsystem/pathfinder/proc/default_ai_pathfinding(datum/ai_holder/holder, turf/goal, min_dist = 1, max_path = 128)
	var/datum/pathfinding/astar/instance = new(holder.holder, get_turf(holder.holder), goal, min_dist, max_path * 2)
	var/obj/item/card/id/potential_id = holder.holder.GetIdCard()
	if(!isnull(potential_id))
		instance.ss13_with_access = potential_id.access?.Copy()
	return run_pathfinding(instance)

/datum/controller/subsystem/pathfinder/proc/default_circuit_pathfinding(obj/item/electronic_assembly/assembly, turf/goal, min_dist = 1, max_path = 128, var/list/access)
	var/datum/pathfinding/jps/instance = new(assembly, get_turf(assembly), goal, min_dist, max_path)
	instance.ss13_with_access = access.Copy()
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

/proc/astar_debug(turf/target)
	if(isnull(target))
		return
	return SSpathfinder.get_path_astar(usr, target, get_turf(usr))

/proc/jps_debug(turf/target)
	if(isnull(target))
		return
	return SSpathfinder.get_path_jps(usr, target, get_turf(usr))

/proc/old_astar_debug(turf/target)
	if(isnull(target))
		return
	return graph_astar(get_turf(usr), target, TYPE_PROC_REF(/turf, CardinalTurfsWithAccess), TYPE_PROC_REF(/turf, Distance), 0, 128, 1)

/proc/old_jps_debug(turf/target)
	var/turf/start = get_turf(usr)
	var/atom/movable/delegate_for_tg = new(start)
	var/datum/tg_jps_pathfind/tg_instance = new(delegate_for_tg, target, null, 128, 1, FALSE, null)
	return tg_instance.search()

/proc/pathfinding_run_all(turf/start = get_turf(usr), turf/goal)
	var/pass_silicons_astar = SSpathfinder.get_path_astar(goal = goal, start = start, target_distance = 1, max_path_length = 256)
	var/pass_silicons_jps = SSpathfinder.get_path_jps(goal = goal, start = start, target_distance = 1, max_path_length = 256)
	// old astar has been cut because it's such horrible code it's not worth benchmarking against the other 3.
	// var/pass_old_astar = graph_astar(
	// 	start,
	// 	goal,
	// 	TYPE_PROC_REF(/turf, CardinalTurfsWithAccess),
	// 	TYPE_PROC_REF(/turf, Distance),
	// 	0,
	// 	128,
	// 	1,
	// )
	var/atom/movable/delegate_for_tg = new(start)
	var/datum/tg_jps_pathfind/tg_instance = new(delegate_for_tg, goal, null, 256, 1, FALSE, null)
	var/pass_tg_jps = tg_instance.search()
	pass_silicons_astar = !!length(pass_silicons_astar)
	pass_silicons_jps = !!length(pass_silicons_jps)
	// pass_old_astar = !!length(pass_old_astar)
	pass_tg_jps = !!length(pass_tg_jps)
	if(pass_silicons_astar != pass_silicons_jps || pass_silicons_jps  != pass_tg_jps)
		log_and_message_admins("turf pair [COORD(start)], [COORD(goal)] mismatch silicons-astar [pass_silicons_astar] silicons-jps [pass_silicons_jps] tg-jps [pass_tg_jps]")
	else
		log_and_message_admins("turf pair [COORD(start)], [COORD(goal)] succeeded")

/proc/pathfinding_run_benchmark(times = 1000, turf/source = get_turf(usr))
	var/list/turf/nearby = RANGE_TURFS(100, source)
	for(var/i in 1 to min(times, 10000))
		var/turf/picked = pick(nearby)
		pathfinding_run_all(source, picked)
