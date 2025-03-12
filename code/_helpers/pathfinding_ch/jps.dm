//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2023 Citadel Station developers.          *//

/// visualization; obviously slow as hell
/// JPS visualization is currently not nearly as perfect as A*'s.
/// notably is sometimes marks stuff closed that isn't because of the weird backtracking stuff I put in.
// #define JPS_DEBUGGING

#ifdef JPS_DEBUGGING

#warn JPS pathfinding visualizations enabled
/// visualization delay
GLOBAL_VAR_INIT(jps_visualization_delay, 0.05 SECONDS)
/// how long to persist the visuals
GLOBAL_VAR_INIT(jps_visualization_persist, 3 SECONDS)
/// visualize nodes or finished path
GLOBAL_VAR_INIT(jps_visualization_resolve, TRUE)

/proc/get_jps_scan_overlay(dir, forwards)
	var/image/I = new
	I.icon = icon('icons/screen/debug/pathfinding.dmi', "jps_scan", dir)
	I.appearance_flags = KEEP_APART | RESET_ALPHA | RESET_COLOR | RESET_TRANSFORM
	I.plane = OBJ_PLANE
	if(dir & NORTH)
		I.pixel_y = forwards? 16 : -16
	else if(dir & SOUTH)
		I.pixel_y = forwards? -16 : 16
	if(dir & EAST)
		I.pixel_x = forwards? 16 : -16
	else if(dir & WEST)
		I.pixel_x = forwards? -16 : 16
	return I

#define JPS_VISUAL_DELAY 10 SECONDS
#define JPS_VISUAL_COLOR_CLOSED "#ff3333"
#define JPS_VISUAL_COLOR_OUT_OF_BOUNDS "#555555"
#define JPS_VISUAL_COLOR_OPEN "#7777ff"
#define JPS_VISUAL_COLOR_FOUND "#33ff33"
#define JPS_VISUAL_COLOR_CURRENT "#ffff00"
#define JPS_VISUAL_COLOR_INTERMEDIATE "#ff00ff"

/proc/jps_wipe_colors_after(list/turf/turfs, time)
	set waitfor = FALSE
	jps_wipe_colors_after_sleeping(turfs, time)

/proc/jps_wipe_colors_after_sleeping(list/turf/turfs, time)
	sleep(time)
	for(var/turf/T in turfs)
		T.color = null
		T.maptext = null
		// lol just cut all this is a debug proc anyways
		T.overlays.len = 0

#endif

/datum/jps_node
	/// our turf
	var/turf/pos
	/// previous node
	var/datum/jps_node/prev

	/// our heuristic to goal
	var/heuristic
	/// our node depth - for jps, this is just the amount turfs passed to go from start to here.
	var/depth
	/// our jump direction
	var/dir
	/// our score - built from heuristic and cost
	var/score

/datum/jps_node/New(turf/pos, datum/jps_node/prev, heuristic, depth, dir)
	#ifdef JPS_DEBUGGING
	ASSERT(isturf(pos))
	#endif
	src.pos = pos
	src.prev = prev
	src.heuristic = heuristic
	src.depth = depth
	src.dir = dir

	src.score = depth + heuristic

/proc/cmp_jps_node(datum/jps_node/A, datum/jps_node/B)
	return A.score - B.score

/**
 * JPS (jump point search)
 *
 * * flat routes
 * * inherently emits diagonals
 * * emits a bunch nodes to walk to instead of a clear path
 * * all tiles are treated as 1 distance - including diagonals.
 * * max_dist is *really* weird. It uses JPs path lengths, so, you probably need it a good bit higher than your target distance.
 * * jps cannot handle turfs that allow in one dir only at all. for precision navigation in those cases, you'll need A*.
 */
/datum/pathfinding/jps
	adjacency_call = /proc/jps_pathfinding_adjacency

/datum/pathfinding/jps/search()
	//* define ops
	#define JPS_HEURISTIC_CALL(TURF) (isnull(context)? call(heuristic_call)(TURF, goal) : call(context, heuristic_call)(TURF, goal))
	#define JPS_ADJACENCY_CALL(A, B) (isnull(context)? call(adjacency_call)(A, B, actor, src) : call(context, adjacency_call)(A, B, actor, src))
	//* preliminary checks
	ASSERT(isturf(src.start) && isturf(src.goal) && src.start.z == src.goal.z)
	if(src.start == src.goal)
		return list()
	// too far away
	if(get_chebyshev_dist(src.start, src.goal) > max_path_length)
		return null
	#ifdef JPS_DEBUGGING
	//* set up debugging vars
	// turf associated to how many open nodes are on it; once 0, it becomes closed. if setting to something other than closed, set to -1.
	var/list/turf/turfs_got_colored = list()
	#endif
	//* cache for sanic speed
	var/max_depth = src.max_path_length
	var/turf/goal = src.goal
	var/target_distance = src.target_distance
	var/atom/movable/actor = src.actor
	var/adjacency_call = src.adjacency_call
	var/heuristic_call = src.heuristic_call
	var/datum/context = src.context
	if(SSpathfinder.pathfinding_cycle >= SHORT_REAL_LIMIT)
		SSpathfinder.pathfinding_cycle = 0
	// our cycle. used to determine if a turf was pathed on by us. in theory, this isn't entirely collision resistant,
	// but i don't really care :>
	var/cycle = ++SSpathfinder.pathfinding_cycle
	//* variables - run
	// open priority queue
	var/datum/priority_queue/open = new /datum/priority_queue(/proc/cmp_jps_node)
	// used when creating a node if we need to reference it
	var/datum/jps_node/node_creating
	// the top node that we fetch at start of cycle
	var/datum/jps_node/node_top
	// turf of top node
	var/turf/node_top_pos
	// dir of top node
	var/node_top_dir
	//* variables - diagonal scan
	// turf we're on right now
	var/turf/dscan_current
	// turf we're about to hop to
	var/turf/dscan_next
	// side dir 1 for cardinal scan
	var/dscan_dir1
	// side dir 2 for cardinal scan
	var/dscan_dir2
	// did a forced neighbor get detected in either cardinal scan
	var/dscan_pass
	// current number of steps in the scan
	var/dscan_steps
	// where we started at, steps wise, so we can properly trim by depth
	var/dscan_initial
	// diagonal node - this is held here because if we get a potential spot on cardinal we need to immediately
	// make the diagonal node
	var/datum/jps_node/dscan_node
	//* variables - cardinal scan
	// turf we're on right now
	var/turf/cscan_current
	// turf we're about to hop to
	var/turf/cscan_next
	// turf we were on last so we can make a node there when we have a forced neighbor
	var/turf/cscan_last
	// turf we're scanning to side
	var/turf/cscan_turf1
	// turf we're scanning to side
	var/turf/cscan_turf2
	// perpendicular dir 1
	var/cscan_dir1
	// perpendicular dir 2
	var/cscan_dir2
	// perpendicular dir 1 didn't fail
	var/cscan_dir1_pass
	// perpendicular dir 2 didn't fail
	var/cscan_dir2_pass
	// did a forced neighbor get detected?
	var/cscan_pass
	// current number of steps in the scan
	var/cscan_steps
	// where we started at, steps wise, so we can properly trim by depth
	var/cscan_initial
	//* start
	// get start heuristic
	var/start_heuristic = JPS_HEURISTIC_CALL(start)
	// for best case, we estimate the 'right' dir to go at first
	var/start_dir = jps_estimate_dir(start, goal)
	// dir being checked
	var/start_check_dir
	// turf being checked
	var/turf/start_check
	#ifdef JPS_DEBUGGING
	turfs_got_colored[start] = 8
	start.color = JPS_VISUAL_COLOR_OPEN
	#define JPS_START_DIR(DIR) \
		start_check_dir = DIR ; \
		start_check = get_step(start, start_check_dir); \
		if(!isnull(start_check) && JPS_ADJACENCY_CALL(start, start_check)) { \
			start.overlays += get_jps_scan_overlay(DIR, TRUE); \
			node_creating = new /datum/jps_node(start, null, start_heuristic, 0, start_check_dir) ; \
			open.enqueue(node_creating); \
		}
	#else
	#define JPS_START_DIR(DIR) \
		start_check_dir = DIR ; \
		start_check = get_step(start, start_check_dir); \
		if(!isnull(start_check) && JPS_ADJACENCY_CALL(start, start_check)) { \
			node_creating = new /datum/jps_node(start, null, start_heuristic, 0, start_check_dir) ; \
			open.enqueue(node_creating); \
		}
	#endif
	JPS_START_DIR(start_dir)
	JPS_START_DIR(turn(start_dir, 45))
	JPS_START_DIR(turn(start_dir, -45))
	JPS_START_DIR(turn(start_dir, 90))
	JPS_START_DIR(turn(start_dir, -90))
	JPS_START_DIR(turn(start_dir, 135))
	JPS_START_DIR(turn(start_dir, -135))
	JPS_START_DIR(turn(start_dir, 180))
	//* define completion check
	#define JPS_COMPLETION_CHECK(TURF) (get_dist(TURF, goal) <= target_distance && (target_distance != 1 || !require_adjacency_when_going_adjacent || TURF.TurfAdjacency(goal)))
	//* define cardinal scan helpers
	#define JPS_CARDINAL_DURING_DIAGONAL (node_top_dir & (node_top_dir - 1))
	//* define cardinal scan
	// things to note:
	// - unlike diagonal / cardinal scan branches, this does not
	//   skip the first tile. this is because when it's used in a diagonal
	//   scan, it outright should not be skipping the first tile.
	// order of ops:
	// - check out of bounds/depth
	// - check completion
	// - place debug overlays
	// - check sides and mark pass/fail; if it was already failing, mark the cpass fail and make diagonal nodes
	// - if cpass failed, we also want to make our cardinal nodes
	// - if any node is made, ensure that we are either not in diagonal mode, or if we are, the diagonal node was created
	// - check and go to next turf
	#ifdef JPS_DEBUGGING
	#define JPS_CARDINAL_SCAN(TURF, DIR) \
	cscan_dir1 = turn(DIR, 90); \
	cscan_dir2 = turn(DIR, -90); \
	cscan_steps = 0; \
	cscan_pass = TRUE; \
	cscan_dir1_pass = TRUE; \
	cscan_dir2_pass = TRUE; \
	cscan_current = TURF; \
	cscan_last = null; \
	cscan_initial = JPS_CARDINAL_DURING_DIAGONAL? node_top.depth + dscan_steps : node_top.depth; \
	do { \
		if(cscan_steps + cscan_initial + get_dist(cscan_current, goal) > max_depth) { \
			cscan_current.color = JPS_VISUAL_COLOR_OUT_OF_BOUNDS; \
			break; \
		} \
		if(JPS_COMPLETION_CHECK(cscan_current)) { \
			if(JPS_CARDINAL_DURING_DIAGONAL && isnull(dscan_node)) { \
				dscan_node = new /datum/jps_node(dscan_current, node_top, JPS_HEURISTIC_CALL(dscan_current), node_top.depth + dscan_steps, node_top_dir); \
				node_creating = new /datum/jps_node(cscan_current, dscan_node, JPS_HEURISTIC_CALL(cscan_current), dscan_node.depth + cscan_steps - 1, DIR | cscan_dir1); \
			} \
			else { \
				node_creating = new /datum/jps_node(cscan_current, node_top, JPS_HEURISTIC_CALL(cscan_current), node_top.depth + cscan_steps - 1, DIR | cscan_dir1); \
			} \
			open.enqueue(node_creating); \
			return jps_unwind_path(node_creating, turfs_got_colored); \
		} \
		turfs_got_colored[cscan_current] = turfs_got_colored[cscan_current] || 0; \
		cscan_current.overlays += get_jps_scan_overlay(DIR, JPS_CARDINAL_DURING_DIAGONAL); \
		cscan_turf1 = get_step(cscan_current, cscan_dir1); \
		cscan_turf2 = get_step(cscan_current, cscan_dir2); \
		if(!isnull(cscan_turf1)) { \
			if(!JPS_ADJACENCY_CALL(cscan_current, cscan_turf1)) { \
				cscan_dir1_pass = FALSE ; \
			} \
			else if(cscan_dir1_pass == FALSE) { \
				if(JPS_CARDINAL_DURING_DIAGONAL && isnull(dscan_node)) { \
					dscan_node = new /datum/jps_node(dscan_current, node_top, JPS_HEURISTIC_CALL(dscan_current), node_top.depth + dscan_steps, node_top_dir); \
					node_creating = new /datum/jps_node(cscan_last, dscan_node, JPS_HEURISTIC_CALL(cscan_last), dscan_node.depth + cscan_steps - 1, DIR | cscan_dir1); \
				} \
				else { \
					node_creating = new /datum/jps_node(cscan_last, node_top, JPS_HEURISTIC_CALL(cscan_last), node_top.depth + cscan_steps - 1, DIR | cscan_dir1); \
				} \
				turfs_got_colored[cscan_last] = turfs_got_colored[cscan_last] + 1; \
				cscan_last.color = JPS_VISUAL_COLOR_OPEN; \
				open.enqueue(node_creating); \
				cscan_pass = FALSE; \
			} \
		} \
		if(!isnull(cscan_turf2)) { \
			if(!JPS_ADJACENCY_CALL(cscan_current, cscan_turf2)) { \
				cscan_dir2_pass = FALSE ; \
			} \
			else if(cscan_dir2_pass == FALSE) { \
				if(JPS_CARDINAL_DURING_DIAGONAL && isnull(dscan_node)) { \
					dscan_node = new /datum/jps_node(dscan_current, node_top, JPS_HEURISTIC_CALL(dscan_current), node_top.depth + dscan_steps, node_top_dir); \
					node_creating = new /datum/jps_node(cscan_last, dscan_node, JPS_HEURISTIC_CALL(cscan_last), dscan_node.depth + cscan_steps - 1, DIR | cscan_dir2); \
				} \
				else { \
					node_creating = new /datum/jps_node(cscan_last, node_top, JPS_HEURISTIC_CALL(cscan_last), node_top.depth + cscan_steps - 1, DIR | cscan_dir2); \
				} \
				turfs_got_colored[cscan_last] = turfs_got_colored[cscan_last] + 1; \
				cscan_last.color = JPS_VISUAL_COLOR_OPEN; \
				open.enqueue(node_creating); \
				cscan_pass = FALSE; \
			} \
		} \
		if(!cscan_pass) { \
			if(JPS_CARDINAL_DURING_DIAGONAL && isnull(dscan_node)) { \
				dscan_node = new /datum/jps_node(dscan_current, node_top, JPS_HEURISTIC_CALL(dscan_current), node_top.depth + dscan_steps, node_top_dir); \
				node_creating = new /datum/jps_node(cscan_last, dscan_node, JPS_HEURISTIC_CALL(cscan_last), dscan_node.depth + cscan_steps - 1, DIR); \
			} \
			else { \
				node_creating = new /datum/jps_node(cscan_last, node_top, JPS_HEURISTIC_CALL(cscan_last), node_top.depth + cscan_steps - 1, DIR); \
			} \
			turfs_got_colored[cscan_last] = turfs_got_colored[cscan_last] + 1; \
			cscan_last.color = JPS_VISUAL_COLOR_OPEN; \
			open.enqueue(node_creating); \
			break; \
		} \
		cscan_next = get_step(cscan_current, DIR); \
		if(isnull(cscan_next) || (cscan_next.pathfinding_cycle == cycle) || !JPS_ADJACENCY_CALL(cscan_current, cscan_next)) { \
			break; \
		} \
		cscan_current.pathfinding_cycle = cycle; \
		cscan_last = cscan_current; \
		cscan_current = cscan_next; \
		cscan_steps++; \
	} \
	while(TRUE);
	#else
	#define JPS_CARDINAL_SCAN(TURF, DIR) \
	cscan_dir1 = turn(DIR, 90); \
	cscan_dir2 = turn(DIR, -90); \
	cscan_steps = 0; \
	cscan_pass = TRUE; \
	cscan_dir1_pass = TRUE; \
	cscan_dir2_pass = TRUE; \
	cscan_current = TURF; \
	cscan_last = null; \
	cscan_initial = JPS_CARDINAL_DURING_DIAGONAL? node_top.depth + dscan_steps : node_top.depth; \
	do { \
		if(cscan_steps + cscan_initial + get_dist(cscan_current, goal) > max_depth) { \
			break; \
		} \
		if(JPS_COMPLETION_CHECK(cscan_current)) { \
			if(JPS_CARDINAL_DURING_DIAGONAL && isnull(dscan_node)) { \
				dscan_node = new /datum/jps_node(dscan_current, node_top, JPS_HEURISTIC_CALL(dscan_current), node_top.depth + dscan_steps, node_top_dir); \
				node_creating = new /datum/jps_node(cscan_current, dscan_node, JPS_HEURISTIC_CALL(cscan_current), dscan_node.depth + cscan_steps - 1, DIR | cscan_dir1); \
			} \
			else { \
				node_creating = new /datum/jps_node(cscan_current, node_top, JPS_HEURISTIC_CALL(cscan_current), node_top.depth + cscan_steps - 1, DIR | cscan_dir1); \
			} \
			open.enqueue(node_creating); \
			return jps_unwind_path(node_creating); \
		} \
		cscan_turf1 = get_step(cscan_current, cscan_dir1); \
		cscan_turf2 = get_step(cscan_current, cscan_dir2); \
		if(!isnull(cscan_turf1)) { \
			if(!JPS_ADJACENCY_CALL(cscan_current, cscan_turf1)) { \
				cscan_dir1_pass = FALSE ; \
			} \
			else if(cscan_dir1_pass == FALSE) { \
				if(JPS_CARDINAL_DURING_DIAGONAL && isnull(dscan_node)) { \
					dscan_node = new /datum/jps_node(dscan_current, node_top, JPS_HEURISTIC_CALL(dscan_current), node_top.depth + dscan_steps, node_top_dir); \
					node_creating = new /datum/jps_node(cscan_last, dscan_node, JPS_HEURISTIC_CALL(cscan_last), dscan_node.depth + cscan_steps - 1, DIR | cscan_dir1); \
				} \
				else { \
					node_creating = new /datum/jps_node(cscan_last, node_top, JPS_HEURISTIC_CALL(cscan_last), node_top.depth + cscan_steps - 1, DIR | cscan_dir1); \
				} \
				open.enqueue(node_creating); \
				cscan_pass = FALSE; \
			} \
		} \
		if(!isnull(cscan_turf2)) { \
			if(!JPS_ADJACENCY_CALL(cscan_current, cscan_turf2)) { \
				cscan_dir2_pass = FALSE ; \
			} \
			else if(cscan_dir2_pass == FALSE) { \
				if(JPS_CARDINAL_DURING_DIAGONAL && isnull(dscan_node)) { \
					dscan_node = new /datum/jps_node(dscan_current, node_top, JPS_HEURISTIC_CALL(dscan_current), node_top.depth + dscan_steps, node_top_dir); \
					node_creating = new /datum/jps_node(cscan_last, dscan_node, JPS_HEURISTIC_CALL(cscan_last), dscan_node.depth + cscan_steps - 1, DIR | cscan_dir2); \
				} \
				else { \
					node_creating = new /datum/jps_node(cscan_last, node_top, JPS_HEURISTIC_CALL(cscan_last), node_top.depth + cscan_steps - 1, DIR | cscan_dir2); \
				} \
				open.enqueue(node_creating); \
				cscan_pass = FALSE; \
			} \
		} \
		if(!cscan_pass) { \
			if(JPS_CARDINAL_DURING_DIAGONAL && isnull(dscan_node)) { \
				dscan_node = new /datum/jps_node(dscan_current, node_top, JPS_HEURISTIC_CALL(dscan_current), node_top.depth + dscan_steps, node_top_dir); \
				node_creating = new /datum/jps_node(cscan_last, dscan_node, JPS_HEURISTIC_CALL(cscan_last), dscan_node.depth + cscan_steps - 1, DIR); \
			} \
			else { \
				node_creating = new /datum/jps_node(cscan_last, node_top, JPS_HEURISTIC_CALL(cscan_last), node_top.depth + cscan_steps - 1, DIR); \
			} \
			open.enqueue(node_creating); \
			break; \
		} \
		cscan_next = get_step(cscan_current, DIR); \
		if(isnull(cscan_next) || (cscan_next.pathfinding_cycle == cycle) || !JPS_ADJACENCY_CALL(cscan_current, cscan_next)) { \
			break; \
		} \
		cscan_current.pathfinding_cycle = cycle; \
		cscan_last = cscan_current; \
		cscan_current = cscan_next; \
		cscan_steps++; \
	} \
	while(TRUE);
	#endif
	//* loop
	while(length(open.array))
		node_top = open.dequeue()
		node_top_pos = node_top.pos
		#ifdef JPS_DEBUGGING
		node_top.pos.color = JPS_VISUAL_COLOR_CURRENT
		sleep(GLOB.jps_visualization_delay)
		#else
		CHECK_TICK
		#endif

		// get distance and check completion
		if(JPS_COMPLETION_CHECK(node_top_pos))
			#ifdef JPS_DEBUGGING
			return jps_unwind_path(node_top, turfs_got_colored)
			#else
			return jps_unwind_path(node_top)
			#endif

		// too deep, abort
		if(node_top.depth + get_dist(node_top_pos, goal) >= max_depth)
			#ifdef JPS_DEBUGGING
			node_top.pos.color = JPS_VISUAL_COLOR_OUT_OF_BOUNDS
			turfs_got_colored[node_top.pos] = turfs_got_colored[node_top.pos] || 0
			#endif
			continue

		#ifdef JPS_DEBUGGING
		if(!(turfs_got_colored[node_top.pos] -= 1))
			node_top.pos.color = JPS_VISUAL_COLOR_CLOSED
		else if(turfs_got_colored[node_top.pos] > 0)
			node_top.pos.color = JPS_VISUAL_COLOR_OPEN
		node_top_pos.maptext = MAPTEXT("d [node_top.depth]<br>s [node_top.score]<br>o [max(turfs_got_colored[node_top.pos], 0)]")
		#endif

		// get dir and run based on dir
		node_top_dir = node_top.dir
		if(node_top_dir & (node_top_dir - 1))
			// node is diagonal
			dscan_dir1 = turn(node_top_dir, -45)
			dscan_dir2 = turn(node_top_dir, 45)
			dscan_node = null
			dscan_current = node_top_pos
			dscan_pass = TRUE
			dscan_steps = 0
			dscan_initial = node_top.depth
			do
				// check if we're out of bounds
				if(dscan_steps + dscan_initial + get_dist(dscan_current, goal) > max_depth)
					#ifdef JPS_DEBUGGING
					dscan_current.color = JPS_VISUAL_COLOR_OUT_OF_BOUNDS
					turfs_got_colored[dscan_current] = -1
					#endif
					break
				// get next turf
				// we don't do current turf because it's assumed already ran
				dscan_next = get_step(dscan_current, node_top_dir)
				#ifdef JPS_DEBUGGING
				dscan_current.overlays += get_jps_scan_overlay(node_top_dir, TRUE)
				turfs_got_colored[dscan_current] = turfs_got_colored[dscan_current] || 0
				#endif
				// check it's 1. there and 2. we haven't checked it yet and
				// 3. we can reach it; if not this is just pointless
				if(isnull(dscan_next) || (dscan_next.pathfinding_cycle == cycle) || !JPS_ADJACENCY_CALL(dscan_current, dscan_next))
					break
				// move up
				dscan_current = dscan_next
				++dscan_steps
				// check if it's close enough to goal
				if(JPS_COMPLETION_CHECK(dscan_current))
					node_creating = new(dscan_current, node_top, JPS_HEURISTIC_CALL(dscan_current), node_top.depth + dscan_steps, node_top_dir)
					#ifdef JPS_DEBUGGING
					return jps_unwind_path(node_creating, turfs_got_colored)
					#else
					return jps_unwind_path(node_creating)
					#endif
				// perform the two cardinal scans
				JPS_CARDINAL_SCAN(dscan_current, dscan_dir1)
				if(!cscan_pass)
					dscan_pass = FALSE
				JPS_CARDINAL_SCAN(dscan_current, dscan_dir2)
				if(!cscan_pass)
					dscan_pass = FALSE
				// check if scans did anything; if so, inject the diagonal node, which should already be
				// proper linked with the created cardinal nodes
				if(!dscan_pass)
					if(isnull(dscan_node))
						dscan_node = new /datum/jps_node(dscan_current, node_top, JPS_HEURISTIC_CALL(dscan_current), node_top.depth + dscan_steps, node_top_dir)
					#ifdef JPS_DEBUGGING
					dscan_current.color = JPS_VISUAL_COLOR_OPEN
					turfs_got_colored[dscan_current] = turfs_got_colored[dscan_current] + 1
					#endif
					open.enqueue(dscan_node)
					break
				// set pathfinder cycle to prevent re-iteration of the same turfs
				dscan_current.pathfinding_cycle = cycle
			while(TRUE)
		else
			// node is cardinal
			// check that it's valid and not blocked
			cscan_current = get_step(node_top_pos, node_top_dir)
			#ifdef JPS_DEBUGGING
			cscan_current.overlays += get_jps_scan_overlay(node_top_dir, TRUE)
			turfs_got_colored[cscan_current] = turfs_got_colored[cscan_current] || 0
			#endif
			// check it's 1. there and 2. we haven't checked it yet and
			// 3. we can reach it; if not this is just pointless
			if(!(isnull(cscan_current) || (cscan_current.pathfinding_cycle == cycle) || !JPS_ADJACENCY_CALL(node_top_pos, cscan_current)))
				// perform iteration
				JPS_CARDINAL_SCAN(cscan_current, node_top_dir)

	//* clean up debugging
	#ifdef JPS_DEBUGGING
	jps_wipe_colors_after(turfs_got_colored, GLOB.jps_visualization_persist)
	#endif

	//* clean up defines
	#undef JPS_START_DIR
	#undef JPS_COMPLETION_CHECK
	#undef JPS_CARDINAL_DURING_DIAGONAL
	#undef JPS_CARDINAL_SCAN

/**
 * The proc used to grab the nodes back in order from start to finish after the algorithm runs.
 */
#ifdef JPS_DEBUGGING
/datum/pathfinding/jps/proc/jps_unwind_path(datum/jps_node/top, list/turfs_got_colored)
#else
/datum/pathfinding/jps/proc/jps_unwind_path(datum/jps_node/top)
#endif
	// found; build path end to start of nodes
	var/list/path_built = list()
	while(top)
		path_built += top.pos
		#ifdef JPS_DEBUGGING
		top.pos.color = GLOB.jps_visualization_resolve? JPS_VISUAL_COLOR_INTERMEDIATE : JPS_VISUAL_COLOR_FOUND
		turfs_got_colored[top] = TRUE
		#endif
		top = top.prev
	// reverse
	var/head = 1
	var/tail = length(path_built)
	while(head < tail)
		path_built.Swap(head++, tail--)
	#ifdef JPS_DEBUGGING
	if(GLOB.jps_visualization_resolve)
		for(var/turf/T in jps_output_turfs(path_built))
			T.color = JPS_VISUAL_COLOR_FOUND
			turfs_got_colored[top] = TRUE
	jps_wipe_colors_after(turfs_got_colored, GLOB.jps_visualization_persist)
	#endif
	return path_built

/datum/pathfinding/jps/proc/jps_estimate_dir(turf/start, turf/goal)
	var/dx = abs(start.x - goal.x)
	var/dy = abs(start.y - goal.y)
	if(dx > dy)
		return get_dir(start, goal) & (EAST|WEST)
	else
		return get_dir(start, goal) & (NORTH|SOUTH)

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
		while(current && current != next)
			. += current
			current = get_step_towards(current, next)
			if(!safety--)
				CRASH("failed jps output processing due to running out of safety, that shouldn't be possible")
		++index

	. += nodes[index]

#ifdef JPS_DEBUGGING
	#undef JPS_DEBUGGING

	#undef JPS_VISUAL_COLOR_CLOSED
	#undef JPS_VISUAL_COLOR_OPEN
	#undef JPS_VISUAL_COLOR_CURRENT
	#undef JPS_VISUAL_COLOR_FOUND
#endif
