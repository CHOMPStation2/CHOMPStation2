//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2023 Citadel Station developers.          *//

/// visualization; obviously slow as hell
#define JPS_DEBUGGING

#ifdef JPS_DEBUGGING

#warn JPS pathfinding visualizations enabled
/// visualization delay
GLOBAL_VAR_INIT(jps_visualization_delay, 0.5 SECONDS)
/// how long to persist the visuals
#define JPS_VISUAL_DELAY 10 SECONDS
#define JPS_VISUAL_COLOR_CLOSED "#ff0000"
#define JPS_VISUAL_COLOR_OPEN "#0000ff"
#define JPS_VISUAL_COLOR_FOUND "#00ff00"
#define JPS_VISUAL_COLOR_CURRENT "#ffff00"

/proc/jps_wipe_colors_after(list/turf/turfs, time)
	set waitfor = FALSE
	jps_wipe_colors_after_sleeping(turfs, time)

/proc/jps_wipe_colors_after_sleeping(list/turf/turfs, time)
	sleep(time)
	for(var/turf/T in turfs)
		T.color = null
		T.maptext = null

#endif

/// this is almost a megabyte
#define JPS_SANE_NODE_LIMIT 15000

/datum/jps_node
	/// our turf
	var/turf/pos
	/// previous node
	var/datum/jps_node/prev

	/// our heuristic to goal
	var/heuristic
	/// our node depth - for jps, this is jumps.
	var/depth
	/// our cost
	var/cost
	/// our jump direction
	var/dir

/datum/jps_node/New(turf/pos, datum/jps_node/prev, heuristic, depth, cost, dir)
	src.pos = pos
	src.prev = prev
	src.heuristic = heuristic
	src.depth = depth
	src.cost = cost
	src.dir = dir

/proc/cmp_jps_node(datum/jps_node/A, datum/jps_node/B)
	return A.heuristic - B.heuristic

#define JPS_HEURISTIC_CALL(TURF) isnull(context)? call(heuristic_call)(TURF, goal) : call(context, heuristic_call)(TURF, goal)
#define JPS_ADJACENCY_CALL(A, B) isnull(context)? call(adjacency_call)(A, B, actor, src) : call(context, adjacency_call)(A, B, actor, src)

#ifdef JPS_DEBUGGING

#define JPS_CARDINAL_SCAN(DIR) \
	cdir1 = turn(DIR, 90); \
	cdir2 = turn(DIR, -90); \
	csteps = 1; \
	cpass = TRUE; \
	cfailed1 = FALSE; \
	cfailed2 = FALSE; \
	cheuristic = JPS_HEURISTIC_CALL(considering); \
	considering = get_step(current, DIR); \
	while(!isnull(considering)) { \
		scan1 = get_step(considering, cdir1); \
		scan2 = get_step(considering, cdir2); \
		if(!isnull(scan1)) { \
			if(!JPS_ADJACENCY_CALL(considering, scan1)) { \
				cfailed1 = TRUE; \
			} \
			else { \
				if(cfailed1) { \
					open.enqueue(new /datum/jps_node(considering, top, cheuristic, csteps, top.cost + csteps, cdir1 | DIR)); \
					cpass = FALSE; \
				} \
			} \
		} \
		if(!isnull(scan2)) { \
			if(!JPS_ADJACENCY_CALL(considering, scan2)) { \
				cfailed2 = TRUE; \
			} \
			else { \
				if(cfailed2) { \
					open.enqueue(new /datum/jps_node(considering, top, cheuristic, csteps, top.cost + csteps, cdir2 | DIR)); \
					cpass = FALSE; \
				} \
			} \
		} \
		if(!cpass) { \
			considering.color = JPS_VISUAL_COLOR_OPEN; \
			turfs_got_colored[considering] = TRUE; \
			open.enqueue(new /datum/jps_node(considering, top, cheuristic, csteps, top.cost + csteps, DIR)); \
			break; \
		} \
		considering = get_step(considering, DIR); \
		++csteps; \
	}

#else

#define JPS_CARDINAL_SCAN(DIR) \
	cdir1 = turn(DIR, 90); \
	cdir2 = turn(DIR, -90); \
	csteps = 1; \
	cpass = TRUE; \
	cfailed1 = FALSE; \
	cfailed2 = FALSE; \
	cheuristic = JPS_HEURISTIC_CALL(considering); \
	considering = get_step(current, DIR); \
	while(!isnull(considering)) { \
		scan1 = get_step(considering, cdir1); \
		scan2 = get_step(considering, cdir2); \
		if(!isnull(scan1)) { \
			if(!JPS_ADJACENCY_CALL(considering, scan1)) { \
				cfailed1 = TRUE; \
			} \
			else { \
				if(cfailed1) { \
					open.enqueue(new /datum/jps_node(considering, top, cheuristic, csteps, top.cost + csteps, cdir1 | DIR)); \
					cpass = FALSE; \
				} \
			} \
		} \
		if(!isnull(scan2)) { \
			if(!JPS_ADJACENCY_CALL(considering, scan2)) { \
				cfailed2 = TRUE; \
			} \
			else { \
				if(cfailed2) { \
					open.enqueue(new /datum/jps_node(considering, top, cheuristic, csteps, top.cost + csteps, cdir2 | DIR)); \
					cpass = FALSE; \
				} \
			} \
		} \
		if(!cpass) { \
			open.enqueue(new /datum/jps_node(considering, top, cheuristic, csteps, top.cost + csteps, DIR)); \
			break; \
		} \
		considering = get_step(considering, DIR); \
		++csteps; \
	}

#endif

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
	ASSERT(isturf(src.start) && isturf(src.goal) && src.start.z == src.goal.z)
	if(src.start == src.goal)
		return list()
	#ifdef JPS_DEBUGGING
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
	var/turf/scan1
	var/turf/scan2
	var/jdir
	var/jdir1
	var/jdir2
	var/cdir1
	var/cdir2
	var/cheuristic
	var/cfailed1
	var/cfailed2
	var/cpass
	var/dpass
	var/csteps
	var/dsteps
	// make queue
	var/datum/priority_queue/open = new /datum/priority_queue(/proc/cmp_jps_node)
	// add initial nodes
	var/start_heuristic = JPS_HEURISTIC_CALL(start)
	open.enqueue(new /datum/jps_node(start, null, start_heuristic, 0, 0, NORTH))
	open.enqueue(new /datum/jps_node(start, null, start_heuristic, 0, 0, SOUTH))
	open.enqueue(new /datum/jps_node(start, null, start_heuristic, 0, 0, EAST))
	open.enqueue(new /datum/jps_node(start, null, start_heuristic, 0, 0, WEST))
	open.enqueue(new /datum/jps_node(start, null, start_heuristic, 0, 0, NORTHEAST))
	open.enqueue(new /datum/jps_node(start, null, start_heuristic, 0, 0, NORTHWEST))
	open.enqueue(new /datum/jps_node(start, null, start_heuristic, 0, 0, SOUTHEAST))
	open.enqueue(new /datum/jps_node(start, null, start_heuristic, 0, 0, SOUTHWEST))

	#ifdef JPS_DEBUGGING
	turfs_got_colored[start] = TRUE
	start.color = JPS_VISUAL_COLOR_OPEN
	#endif

	while(length(open.queue))
		// get best node
		var/datum/jps_node/top = open.dequeue()
		current = top.pos
		#ifdef JPS_DEBUGGING
		top.pos.color = JPS_VISUAL_COLOR_CURRENT
		turfs_got_colored[top.pos] = TRUE
		sleep(GLOB.jps_visualization_delay)
		#else
		CHECK_TICK
		#endif

		// get distance and check completion
		if(get_dist(current, goal) <= target_distance)
			// found; build path end to start of nodes
			var/list/path_built = list()
			while(top)
				path_built += top.pos
				#ifdef JPS_DEBUGGING
				top.pos.color = JPS_VISUAL_COLOR_FOUND
				turfs_got_colored[top] = TRUE
				#endif
				top = top.prev
			// reverse
			var/head = 1
			var/tail = length(path_built)
			while(head < tail)
				path_built.Swap(head++, tail--)
			#ifdef JPS_DEBUGGING
			jps_wipe_colors_after(turfs_got_colored, JPS_VISUAL_DELAY)
			#endif
			return path_built

		// too deep, abort
		if(top.depth >= max_depth)
			#ifdef JPS_DEBUGGING
			top.pos.color = JPS_VISUAL_COLOR_CLOSED
			turfs_got_colored[top.pos] = TRUE
			#endif
			continue

		#ifdef JPS_DEBUGGING
		top.pos.color = JPS_VISUAL_COLOR_CLOSED
		turfs_got_colored[top.pos] = TRUE
		#endif

		// things go differently based on if this is a diagonal or a cardinal
		jdir = top.dir
		if(jdir & (jdir - 1))
			// diagonal - relatively hard
			jdir1 = turn(jdir, -45)
			jdir2 = turn(jdir, 45)
			considering = get_step(current, jdir)
			while(!isnull(considering)) {
				dpass = TRUE
				JPS_CARDINAL_SCAN(jdir1)
				if(!cpass)
					dpass = FALSE
				JPS_CARDINAL_SCAN(jdir2)
				if(!cpass)
					dpass = FALSE
				if(!dpass)
					considering.color = JPS_VISUAL_COLOR_OPEN
					turfs_got_colored[considering] = TRUE;
					open.enqueue(new /datum/jps_node(considering, top, JPS_HEURISTIC_CALL(considering), dsteps, top.cost + dsteps, jdir))
					break
				considering = get_step(considering, jdir)
				++dsteps
			}
		else
			// cardinal - relatively easy
			JPS_CARDINAL_SCAN(jdir)


/**
 * takes a list of turf nodes from JPS return and converts it into a proper list of turfs to walk
 */
/proc/jps_output_turfs(list/turf/nodes)
	if(isnull(nodes))
		return
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
			if(!safety--)
				CRASH("failed jps output processing due to running out of safety, that shouldn't be possible")
	. += nodes[index]

#undef JPS_SANE_NODE_LIMIT

#ifdef JPS_DEBUGGING
	#undef JPS_DEBUGGING

	#undef JPS_VISUAL_TICK
	#undef JPS_VISUAL_COLOR_CLOSED
	#undef JPS_VISUAL_COLOR_OPEN
	#undef JPS_VISUAL_COLOR_CURRENT
	#undef JPS_VISUAL_COLOR_FOUND
#endif
