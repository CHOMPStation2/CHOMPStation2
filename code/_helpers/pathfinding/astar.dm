//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2023 Citadel Station developers.          *//

/// visualization; obviously slow as hell
#define ASTAR_DEBUGGING

#ifdef ASTAR_DEBUGGING
	/// visualization delay
	#define ASTAR_VISUAL_TICK 2.5
	/// how long to persist the visuals
	#define ASTAR_VISUAL_DELAY 10 SECONDS
	#define ASTAR_VISUAL_COLOR_CLOSED "#ff0000"
	#define ASTAR_VISUAL_COLOR_OPEN "#0000ff"
	#define ASTAR_VISUAL_COLOR_CURRENT "#ffff00"
	#define ASTAR_VISUAL_COLOR_FOUND "#00ff00"
#endif

#ifdef ASTAR_DEBUGGING

/proc/astar_wipe_colors_after(list/turf/turfs, time)
	set waitfor = FALSE
	astar_wipe_colors_after_sleeping(turfs, time)

/proc/astar_wipe_colors_after_sleeping(list/turf/turfs, time)
	sleep(time)
	for(var/turf/T in turfs)
		T.color = null

#endif

/datum/astar_node
	/// turf
	var/turf/pos
	/// previous
	var/datum/astar_node/prev

	/// our heuristic
	var/heuristic
	/// our current best cost (so cost from prev)
	var/minimum_cost
	/// our inherent cost
	var/weight
	/// node depth to get to here
	var/depth

/datum/astar_node/New(turf/pos, datum/astar_node/prev, heuristic, weight, depth)
	src.pos = pos
	src.prev = prev
	src.heuristic = heuristic
	src.weight = weight
	src.depth = depth

/proc/cmp_astar_node(datum/astar_node/A, datum/astar_node/B)
	return A.heuristic - B.heuristic

#define ASTAR_HELL_DEFINE(TURF) \
	if(!isnull(TURF)) { \
		
	}

/proc/AStar(start, end, adjacent, dist, max_nodes, max_node_depth = 30, min_target_dist = 0, min_node_dist, id, datum/exclude)
	var/list/path_node_by_position = list()

	while(!open.is_empty() && !path)
		for(var/datum/datum in call(current.position, adjacent)(id))
			if(datum == exclude)
				continue

			var/best_estimated_cost = current.estimated_cost + call(current.position, dist)(datum)

			//handle removal of sub-par positions
			if(datum in path_node_by_position)
				var/PathNode/target = path_node_by_position[datum]
				if(target.best_estimated_cost)
					if(best_estimated_cost + call(datum, dist)(end) < target.best_estimated_cost)
						open.remove_item(target)
					else
						continue

			var/PathNode/next_node = new (datum, current, best_estimated_cost, call(datum, dist)(end), current.nodes_traversed + 1)
			path_node_by_position[datum] = next_node
			open.enqueue(next_node)

			if(max_nodes && open.length() > max_nodes)
				open.remove_index(open.length())

/**
 * AStar
 * * Non uniform grids
 * * Slower than JPS
 * * Inherently cardinals-only
 */
/datum/pathfinding/astar

/datum/pathfinding/astar/search()
	#ifdef ASTAR_DEBUGGING
	var/list/turf/turfs_got_colored = list()
	#endif
	// cache for sanic speed
	var/max_depth = src.max_path_length
	var/turf/goal = src.goal
	var/target_distance = src.target_distance
	// add operating vars
	var/turf/current
	var/turf/considering
	// make queue
	var/datum/priority_queue/open = new(/proc/cmp_astar_node)
	// add initial node
	open.enqueue(new /datum/astar_node(start, null, , start.path_weight, 0))

	while(length(open))
		// get best node
		var/datum/astar_node/top = open.dequeue()
		current = top.pos

		// get distance and check completion
		if(get_dist(top.pos, goal) <= target_distance)
			// found; build path end to finish with nodes
			var/list/path_built = list()
			while(top)
				path_built += top.pos
				#ifdef ASTAR_DEBUGGING
				top.pos.color = ASTAR_VISUAL_COLOR_FOUND
				turfs_got_colored[top] = TRUE
				#endif
				top = top.prev
			// reverse
			var/head = 1
			var/tail = length(path_built)
			while(head < tail)
				path_built.Swap(head++, tail--)
			#ifdef ASTAR_DEBUGGING
			astar_wipe_colors_after(turfs_got_colored, ASTAR_VISUAL_DELAY)
			#endif
			return path_built

		// too deep, abort
		if(top.depth >= max_depth)
			continue

		considering = get_step(current, NORTH)
		ASTAR_HELL_DEFINE(considering)
		considering = get_step(current, SOUTH)
		ASTER_HELL_DEFINE(considering)
		considering = get_step(current, EAST)
		ASTER_HELL_DEFINE(considering)
		considering = get_step(current, WEST)
		ASTER_HELL_DEFINE(considering)

#undef ASTAR_HELL_DEFINE

#ifdef ASTAR_DEBUGGING
	#undef ASTAR_DEBUGGING

	#undef ASTAR_VISUAL_TICK
	#undef ASTAR_VISUAL_COLOR_CLOSED
	#undef ASTAR_VISUAL_COLOR_OPEN
	#undef ASTAR_VISUAL_COLOR_CURRENT
	#undef ASTAR_VISUAL_COLOR_FOUND
#endif
