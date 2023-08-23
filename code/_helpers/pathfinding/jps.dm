//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2023 Citadel Station developers.          *//

/datum/jps_node
	/// our turf
	var/turf/pos
	/// previous node
	var/datum/jps_node/prev

	/// our heuristic to goal
	var/heuristic
	/// our node depth
	var/depth
	/// our cost
	var/cost
	/// our inherent cost - this is just the number of tiles we are since this is jps
	var/weight

/datum/jps_node/New(turf/pos, datum/aster_node/prev, heuristic, weight, depth, cost)
	src.pos = pos
	src.prev = prev
	src.heuristic = heuristic
	src.weight = weight
	src.depth = depth
	src.cost = cost

/proc/cmp_jps_node(datum/jps_node/A, datum/jps_node/B)
	return A.heuristic - B.heuristic

/**
 * JPS (jump point search)
 *
 * * flat routes
 * * inherently emits diagonals
 * * emits a bunch nodes to walk to instead of a clear path
 * * all tiles are treated as 1 distance - including diagonals.
 */
/datum/pathfinding/jps

/datum/pathfinding/jps/search()
	// cache for sanic speed
	var/max_depth = src.max_path_length
	var/turf/goal = src.goal
	var/target_distance = src.target_distance
	var/atom/movable/actor = src.actor
	// add operating vars

	// make queue
	var/datum/priority_queue/open = new(/proc/cmp_jps_node)
	// add initial node

	while(length(open.queue))
		// get best node
		var/datum/jps_node/top = open.dequeue()
		

/**
 * takes a list of turf nodes from JPS return and converts it into a proper list of turfs to walk
 */
/proc/jps_output_turfs(list/turf/nodes)
	. = list()
	switch(length(nodes))
		if(0)
			return
		if(1)
			return list(nodes[1])
	var/index = 1
	while(index < length(nodes))
		var/turf/current = nodes[index]
		var/turf/next = nodes[index + 1]
		var/safety = get_dist(current, next)
		while(current)
			. += current
			current = get_step_towards(current, next)
			if(current == last)
				break
			if(!safety--)
				CRASH("failed jps output processing due to running out of safety, that shouldn't be possible")
	. += nodes[index]


