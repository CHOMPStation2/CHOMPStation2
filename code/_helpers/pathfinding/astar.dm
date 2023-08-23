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

/proc/astar_wipe_colors_after(list/turf/turfs, time)
	set waitfor = FALSE
	astar_wipe_colors_after_sleeping(turfs, time)

/proc/astar_wipe_colors_after_sleeping(list/turf/turfs, time)
	sleep(time)
	for(var/turf/T in turfs)
		T.color = null

#endif

/// this is almost a megabyte
#define ASTAR_SANE_NODE_LIMIT 15000

/datum/astar_node
	/// turf
	var/turf/pos
	/// previous
	var/datum/astar_node/prev

	/// our heuristic
	var/heuristic
	/// our inherent cost
	var/weight
	/// node depth to get to here
	var/depth
	/// cost to get here from prev - built off of prev
	var/cost

/datum/astar_node/New(turf/pos, datum/astar_node/prev, heuristic, weight, depth, cost)
	src.pos = pos
	src.prev = prev
	src.heuristic = heuristic
	src.weight = weight
	src.depth = depth
	src.cost = cost

/proc/cmp_astar_node(datum/astar_node/A, datum/astar_node/B)
	return A.heuristic - B.heuristic

#define ASTAR_HEURISTIC_CALL(TURF) isnull(context)? call(heuristic_call)(TURF, goal) : call(context, heuristic_call)(TURF, goal)
#define ASTAR_ADJACENCY_CALL(A, B) isnull(context)? call(adjacency_call)(A, B, actor, src) : call(context, adjacency_call)(A, B, actor, src)
#ifdef ASTAR_DEBUGGING
	#define ASTAR_HELL_DEFINE(TURF) \
		if(!isnull(TURF)) { \
			if(ASTAR_ADJACENCY_CALL(current, considering)) { \
				considering_heuristic = ASTAR_HEURISTIC_CALL(considering); \
				considering_cost = top.cost + considering.path_weight; \
				considering_node = node_by_turf[considering]; \
				if(isnull(considering_node)) { \
					considering_node = new /datum/astar_node(considering, top, considering_heuristic, considering.path_weight, top.depth + 1, considering_cost); \
					open.enqueue(considering_node); \
					node_by_turf[considering] = considering_node; \
					turfs_got_colored[considering] = TRUE; \
					considering.color = ASTAR_VISUAL_COLOR_OPEN; \
				} \
				else { \
					if(considering_node.cost > considering_cost) { \
						considering_node.cost = considering_cost; \
						considering_node.prev = top; \
					} \
				} \
			} \
		}
#else
	#define ASTAR_HELL_DEFINE(TURF) \
		if(!isnull(TURF)) { \
			if(ASTAR_ADJACENCY_CALL(current, considering)) { \
				considering_heuristic = ASTAR_HEURISTIC_CALL(considering); \
				considering_cost = top.cost + considering.path_weight; \
				considering_node = node_by_turf[considering]; \
				if(isnull(considering_node)) { \
					considering_node = new /datum/astar_node(considering, top, considering_heuristic, considering.path_weight, top.depth + 1, considering_cost); \
					open.enqueue(considering_node); \
					node_by_turf[considering] = considering_node; \
				} \
				else { \
					if(considering_node.cost > considering_cost) { \
						considering_node.cost = considering_cost; \
						considering_node.prev = top; \
					} \
				} \
			} \
		}
#endif

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
	var/atom/movable/actor = src.actor
	// add operating vars
	var/turf/current
	var/turf/considering
	var/considering_heuristic
	var/considering_cost
	var/datum/astar_node/considering_node
	var/list/node_by_turf = list()
	// make queue
	var/datum/priority_queue/open = new(/proc/cmp_astar_node)
	// add initial node
	var/datum/astar_node/initial_node = new(start, null, ASTAR_HEURISTIC_CALL(start), start.path_weight, 0, 0)
	open.enqueue(initial_node)
	node_by_turf[start] = initial_node

	while(length(open))
		// get best node
		var/datum/astar_node/top = open.dequeue()
		current = top.pos
		#ifdef ASTAR_DEBUGGING
		top.pos.color = ASTAR_VISUAL_COLOR_CURRENT
		sleep(ASTAR_VISUAL_DELAY)
		#endif

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
			#ifdef ASTAR_DEBUGGING
			top.pos.color = ASTAR_VISUAL_COLOR_CLOSED
			#endif
			continue

		considering = get_step(current, NORTH)
		ASTAR_HELL_DEFINE(considering)
		considering = get_step(current, SOUTH)
		ASTER_HELL_DEFINE(considering)
		considering = get_step(current, EAST)
		ASTER_HELL_DEFINE(considering)
		considering = get_step(current, WEST)
		ASTER_HELL_DEFINE(considering)

		#ifdef ASTAR_DEBUGGING
		top.pos.color = ASTAR_VISUAL_COLOR_CLOSED
		#endif

		if(length(open.queue) > ASTAR_SANE_NODE_LIMIT)
			CRASH("A* hit node limit - something went horribly wrong! args: [json_encode(args)]; vars: [json_encode(vars)]")

#undef ASTAR_HELL_DEFINE
#undef ASTAR_HEURISTIC_CALL
#undef ASTAR_ADJACENCY_CALL

#undef ASTAR_SANE_NODE_LIMIT

#ifdef ASTAR_DEBUGGING
	#undef ASTAR_DEBUGGING

	#undef ASTAR_VISUAL_TICK
	#undef ASTAR_VISUAL_COLOR_CLOSED
	#undef ASTAR_VISUAL_COLOR_OPEN
	#undef ASTAR_VISUAL_COLOR_CURRENT
	#undef ASTAR_VISUAL_COLOR_FOUND
#endif
