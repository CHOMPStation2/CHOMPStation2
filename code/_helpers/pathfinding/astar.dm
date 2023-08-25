//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2023 Citadel Station developers.          *//

/// visualization; obviously slow as hell
#define ASTAR_DEBUGGING

#ifdef ASTAR_DEBUGGING

#warn ASTAR pathfinding visualizations enabled
/// visualization delay
GLOBAL_VAR_INIT(astar_visualization_delay, 0.05 SECONDS)
/// how long to persist the visuals
GLOBAL_VAR_INIT(astar_visualization_persist, 3 SECONDS)
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
		T.maptext = null

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

#define ASTAR_HEURISTIC_CALL(TURF) (isnull(context)? call(heuristic_call)(TURF, goal) : call(context, heuristic_call)(TURF, goal))
#define ASTAR_ADJACENCY_CALL(A, B) (isnull(context)? call(adjacency_call)(A, B, actor, src) : call(context, adjacency_call)(A, B, actor, src))
#ifdef ASTAR_DEBUGGING
	#define ASTAR_HELL_DEFINE(TURF) \
		if(!isnull(TURF)) { \
			if(ASTAR_ADJACENCY_CALL(current, considering)) { \
				considering_cost = top.cost + considering.path_weight; \
				considering_heuristic = ASTAR_HEURISTIC_CALL(considering) + considering_cost; \
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
				considering_cost = top.cost + considering.path_weight; \
				considering_heuristic = ASTAR_HEURISTIC_CALL(considering) + considering_cost; \
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
	ASSERT(isturf(src.start) && isturf(src.goal) && src.start.z == src.goal.z)
	if(src.start == src.goal)
		return list()
	#ifdef ASTAR_DEBUGGING
	var/list/turf/turfs_got_colored = list()
	#endif
	// cache for sanic speed
	var/max_depth = src.max_path_length
	var/turf/goal = src.goal
	var/target_distance = src.target_distance
	var/atom/movable/actor = src.actor
	var/adjacency_call = src.adjacency_call
	var/heuristic_call = src.heuristic_call
	var/datum/context = src.context
	// add operating vars
	var/turf/current
	var/turf/considering
	var/considering_heuristic
	var/considering_cost
	var/datum/astar_node/considering_node
	var/list/node_by_turf = list()
	// make queue
	var/datum/priority_queue/open = new /datum/priority_queue(/proc/cmp_astar_node)
	// add initial node
	var/datum/astar_node/initial_node = new(start, null, ASTAR_HEURISTIC_CALL(start), 0, 0, 0)
	open.enqueue(initial_node)
	node_by_turf[start] = initial_node

	#ifdef ASTAR_DEBUGGING
	turfs_got_colored[start] = TRUE
	start.color = ASTAR_VISUAL_COLOR_OPEN
	#endif

	while(length(open.queue))
		// get best node
		var/datum/astar_node/top = open.dequeue()
		current = top.pos
		#ifdef ASTAR_DEBUGGING
		top.pos.color = ASTAR_VISUAL_COLOR_CURRENT
		turfs_got_colored[top.pos] = TRUE
		sleep(GLOB.astar_visualization_delay)
		#else
		CHECK_TICK
		#endif

		// get distance and check completion
		if(get_dist(current, goal) <= target_distance && (target_distance != 1 || !require_adjacency_when_going_adjacent || current.TurfAdjacency(goal)))
			// found; build path end to start of nodes
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
			astar_wipe_colors_after(turfs_got_colored, GLOB.astar_visualization_persist)
			#endif
			return path_built

		// too deep, abort
		if(top.depth >= max_depth)
			#ifdef ASTAR_DEBUGGING
			top.pos.color = ASTAR_VISUAL_COLOR_CLOSED
			turfs_got_colored[top.pos] = TRUE
			#endif
			continue

		considering = get_step(current, NORTH)
		ASTAR_HELL_DEFINE(considering)
		considering = get_step(current, SOUTH)
		ASTAR_HELL_DEFINE(considering)
		considering = get_step(current, EAST)
		ASTAR_HELL_DEFINE(considering)
		considering = get_step(current, WEST)
		ASTAR_HELL_DEFINE(considering)

		#ifdef ASTAR_DEBUGGING
		top.pos.color = ASTAR_VISUAL_COLOR_CLOSED
		turfs_got_colored[top.pos] = TRUE
		#endif

		if(length(open.queue) > ASTAR_SANE_NODE_LIMIT)
			#ifdef ASTAR_DEBUGGING
			astar_wipe_colors_after(turfs_got_colored, GLOB.astar_visualization_persist)
			#endif
			CRASH("A* hit node limit - something went horribly wrong! args: [json_encode(args)]; vars: [json_encode(vars)]")

	#ifdef ASTAR_DEBUGGING
	astar_wipe_colors_after(turfs_got_colored, GLOB.astar_visualization_persist)
	#endif

#undef ASTAR_HELL_DEFINE
#undef ASTAR_HEURISTIC_CALL
#undef ASTAR_ADJACENCY_CALL

#undef ASTAR_SANE_NODE_LIMIT

#ifdef ASTAR_DEBUGGING
	#undef ASTAR_DEBUGGING

	#undef ASTAR_VISUAL_COLOR_CLOSED
	#undef ASTAR_VISUAL_COLOR_OPEN
	#undef ASTAR_VISUAL_COLOR_CURRENT
	#undef ASTAR_VISUAL_COLOR_FOUND
#endif
