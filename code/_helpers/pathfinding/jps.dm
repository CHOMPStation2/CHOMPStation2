//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2023 Citadel Station developers.          *//

/// visualization; obviously slow as hell
/// JPS visualization is currently not nearly as perfect as A*'s.
/// notably is sometimes marks stuff closed that isn't because of the weird backtracking stuff I put in.
#define JPS_DEBUGGING

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
#define JPS_VISUAL_COLOR_CLOSED "#ff0000"
#define JPS_VISUAL_COLOR_OUT_OF_BOUNDS "#555555"
#define JPS_VISUAL_COLOR_OPEN "#0000ff"
#define JPS_VISUAL_COLOR_FOUND "#00ff00"
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
	/// our cost - this is cost of us + previous nodes
	var/cost
	/// our jump direction
	var/dir
	/// our score - built from heuristic and cost
	var/score

/datum/jps_node/New(turf/pos, datum/jps_node/prev, heuristic, depth, cost, dir)
	#ifdef JPS_DEBUGGING
	ASSERT(isturf(pos))
	#endif
	src.pos = pos
	src.prev = prev
	src.heuristic = heuristic
	src.depth = depth
	src.cost = cost
	src.dir = dir
	src.score = cost + heuristic * 1.5

/proc/cmp_jps_node(datum/jps_node/A, datum/jps_node/B)
	return A.heuristic - B.heuristic

#define JPS_HEURISTIC_CALL(TURF) (isnull(context)? call(heuristic_call)(TURF, goal) : call(context, heuristic_call)(TURF, goal))
#define JPS_ADJACENCY_CALL(A, B) (isnull(context)? call(adjacency_call)(A, B, actor, src) : call(context, adjacency_call)(A, B, actor, src))

#ifdef JPS_DEBUGGING

#define JPS_CARDINAL_SCAN(FROM, DIR) \
	cdir1 = turn(DIR, 90); \
	cdir2 = turn(DIR, -90); \
	csteps = 1; \
	cinitialsteps = (jdir & (jdir - 1))? dsteps + top.depth : top.depth; \
	cpass = TRUE; \
	cfailed1 = FALSE; \
	cfailed2 = FALSE; \
	if(cskipfirst) { \
		cardscan = get_step(FROM, DIR); \
	} \
	else { \
		cardscan = FROM; \
		cskipfirst = TRUE; \
	} \
	while(!isnull(cardscan)) { \
		cheuristic = JPS_HEURISTIC_CALL(cardscan); \
		cardscan.overlays += get_jps_scan_overlay(DIR, TRUE); \
		if(get_dist(cardscan, goal) <= target_distance && (target_distance != 1 || !require_adjacency_when_going_adjacent || cardscan.TurfAdjacency(goal))) { \
			cardscan.color = JPS_VISUAL_COLOR_OPEN; \
			turfs_got_colored[cardscan] = TRUE; \
			if(jdir & (jdir - 1)) { \
				if(isnull(dmadenode)) { \
					considering.color = JPS_VISUAL_COLOR_OPEN; \
					turfs_got_colored[considering] = TRUE; \
					considering.overlays += get_jps_scan_overlay(jdir, TRUE); \
					dmadenode = new /datum/jps_node(considering, top, JPS_HEURISTIC_CALL(considering), top.depth + dsteps, top.cost + dsteps, jdir); \
					open.enqueue(dmadenode); \
				} \
				cardscan.color = JPS_VISUAL_COLOR_OPEN; \
				turfs_got_colored[cardscan] = TRUE; \
				creating_node = new /datum/jps_node(cardscan, dmadenode, JPS_HEURISTIC_CALL(cardscan), dmadenode.depth + csteps, dmadenode.cost + csteps, DIR); \
				open.enqueue(creating_node); \
				return jps_unwind_path(creating_node, turfs_got_colored); \
			} \
			else { \
				cardscan.color = JPS_VISUAL_COLOR_OPEN; \
				turfs_got_colored[cardscan] = TRUE; \
				creating_node = new /datum/jps_node(cardscan, top, cheuristic, top.depth + csteps, top.cost + csteps, DIR); \
				open.enqueue(creating_node); \
				return jps_unwind_path(creating_node, turfs_got_colored); \
			} \
		} \
		turfs_got_colored[cardscan] = TRUE; \
		if(csteps + cinitialsteps + get_dist(cardscan, goal) > max_depth) { \
			cardscan.color = JPS_VISUAL_COLOR_OUT_OF_BOUNDS; \
			break; \
		} \
		cscan1 = get_step(cardscan, cdir1); \
		cscan2 = get_step(cardscan, cdir2); \
		if(!isnull(cscan1)) { \
			if(!JPS_ADJACENCY_CALL(cardscan, cscan1)) { \
				cfailed1 = TRUE; \
			} \
			else { \
				if(cfailed1) { \
					if(cardscan.pathfinding_cycle != cycle) { \
						if((jdir & (jdir - 1)) && isnull(dmadenode)) { \
							dmadenode = new /datum/jps_node(considering, top, JPS_HEURISTIC_CALL(considering), top.depth + dsteps, top.cost + dsteps, jdir); \
							creating_node = new /datum/jps_node(clast, dmadenode, JPS_HEURISTIC_CALL(clast), dmadenode.depth + csteps, dmadenode.cost + csteps, cdir1 | DIR); \
						} \
						else { \
							creating_node = new /datum/jps_node(clast, top, cheuristic, top.depth + csteps, top.cost + csteps, cdir1 | DIR); \
						} \
						clast.color = JPS_VISUAL_COLOR_OPEN; \
						turfs_got_colored[clast] = TRUE; \
						clast.overlays += get_jps_scan_overlay(cdir1 | DIR, TRUE); \
						nodes_by_turf[clast] = creating_node; \
						open.enqueue(creating_node); \
					} \
					cpass = FALSE; \
				} \
			} \
		} \
		if(!isnull(cscan2)) { \
			if(!JPS_ADJACENCY_CALL(cardscan, cscan2)) { \
				cfailed2 = TRUE; \
			} \
			else { \
				if(cfailed2) { \
					if(cardscan.pathfinding_cycle != cycle) { \
						if((jdir & (jdir - 1)) && isnull(dmadenode)) { \
							dmadenode = new /datum/jps_node(considering, top, JPS_HEURISTIC_CALL(considering), top.depth + dsteps, top.cost + dsteps, jdir); \
							creating_node = new /datum/jps_node(clast, dmadenode, JPS_HEURISTIC_CALL(clast), dmadenode.depth + csteps, dmadenode.cost + csteps, cdir2 | DIR); \
						} \
						else { \
							creating_node = new /datum/jps_node(clast, top, cheuristic, top.depth + csteps, top.cost + csteps, cdir2 | DIR); \
						} \
						clast.color = JPS_VISUAL_COLOR_OPEN; \
						turfs_got_colored[clast] = TRUE; \
						clast.overlays += get_jps_scan_overlay(cdir2 | DIR, TRUE); \
						nodes_by_turf[clast] = creating_node; \
						open.enqueue(creating_node); \
					} \
					cpass = FALSE; \
				} \
			} \
		} \
		next = get_step(cardscan, DIR); \
		if(isnull(next) || !JPS_ADJACENCY_CALL(cardscan, next)) { \
			cardscan.pathfinding_cycle = cycle; \
			break; \
		} \
		if(!cpass) { \
			if(cardscan.pathfinding_cycle != cycle) { \
				if((jdir & (jdir - 1)) && isnull(dmadenode)) { \
					dmadenode = new /datum/jps_node(considering, top, JPS_HEURISTIC_CALL(considering), top.depth + dsteps, top.cost + dsteps, jdir); \
					creating_node = new /datum/jps_node(clast, dmadenode, JPS_HEURISTIC_CALL(clast), dmadenode.depth + csteps, dmadenode.cost + csteps, DIR); \
				} \
				else { \
					creating_node = new /datum/jps_node(clast, top, cheuristic, top.depth + csteps, top.cost + csteps, DIR); \
				} \
				clast.color = JPS_VISUAL_COLOR_OPEN; \
				turfs_got_colored[clast] = TRUE; \
				clast.overlays += get_jps_scan_overlay(DIR, TRUE); \
				nodes_by_turf[clast] = creating_node; \
				open.enqueue(creating_node); \
				cardscan.pathfinding_cycle = cycle; \
			} \
			break; \
		} \
		clast = cardscan; \
		cardscan.pathfinding_cycle = cycle; \
		cardscan = next; \
		++csteps; \
	}

#else

#define JPS_CARDINAL_SCAN(FROM, DIR) \
	cdir1 = turn(DIR, 90); \
	cdir2 = turn(DIR, -90); \
	csteps = 1; \
	cinitialsteps = (jdir & (jdir - 1))? dsteps + top.depth : top.depth; \
	cpass = TRUE; \
	cfailed1 = FALSE; \
	cfailed2 = FALSE; \
	if(cskipfirst) { \
		cardscan = get_step(FROM, DIR); \
	} \
	else { \
		cardscan = FROM; \
		cskipfirst = TRUE; \
	} \
	while(!isnull(cardscan)) { \
		cheuristic = JPS_HEURISTIC_CALL(cardscan); \
		cardscan.overlays += get_jps_scan_overlay(DIR, TRUE); \
		if(get_dist(cardscan, goal) <= target_distance && (target_distance != 1 || !require_adjacency_when_going_adjacent || cardscan.TurfAdjacency(goal))) { \
			cardscan.color = JPS_VISUAL_COLOR_OPEN; \
			turfs_got_colored[cardscan] = TRUE; \
			if(jdir & (jdir - 1)) { \
				if(isnull(dmadenode)) { \
					considering.color = JPS_VISUAL_COLOR_OPEN; \
					turfs_got_colored[considering] = TRUE; \
					considering.overlays += get_jps_scan_overlay(jdir, TRUE); \
					dmadenode = new /datum/jps_node(considering, top, JPS_HEURISTIC_CALL(considering), top.depth + dsteps, top.cost + dsteps, jdir); \
					open.enqueue(dmadenode); \
				} \
				cardscan.color = JPS_VISUAL_COLOR_OPEN; \
				turfs_got_colored[cardscan] = TRUE; \
				creating_node = new /datum/jps_node(cardscan, dmadenode, JPS_HEURISTIC_CALL(cardscan), dmadenode.depth + csteps, dmadenode.cost + csteps, DIR); \
				open.enqueue(creating_node); \
				return jps_unwind_path(creating_node, turfs_got_colored); \
			} \
			else { \
				cardscan.color = JPS_VISUAL_COLOR_OPEN; \
				turfs_got_colored[cardscan] = TRUE; \
				creating_node = new /datum/jps_node(cardscan, top, cheuristic, top.depth + csteps, top.cost + csteps, DIR); \
				open.enqueue(creating_node); \
				return jps_unwind_path(creating_node, turfs_got_colored); \
			} \
		} \
		turfs_got_colored[cardscan] = TRUE; \
		if(csteps + cinitialsteps + get_dist(cardscan, goal) > max_depth) { \
			cardscan.color = JPS_VISUAL_COLOR_OUT_OF_BOUNDS; \
			break; \
		} \
		cscan1 = get_step(cardscan, cdir1); \
		cscan2 = get_step(cardscan, cdir2); \
		if(!isnull(cscan1)) { \
			if(!JPS_ADJACENCY_CALL(cardscan, cscan1)) { \
				cfailed1 = TRUE; \
			} \
			else { \
				if(cfailed1) { \
					if(cardscan.pathfinding_cycle != cycle) { \
						if((jdir & (jdir - 1)) && isnull(dmadenode)) { \
							dmadenode = new /datum/jps_node(considering, top, JPS_HEURISTIC_CALL(considering), top.depth + dsteps, top.cost + dsteps, jdir); \
							creating_node = new /datum/jps_node(clast, dmadenode, JPS_HEURISTIC_CALL(clast), dmadenode.depth + csteps, dmadenode.cost + csteps, cdir1 | DIR); \
						} \
						else { \
							creating_node = new /datum/jps_node(clast, top, cheuristic, top.depth + csteps, top.cost + csteps, cdir1 | DIR); \
						} \
						clast.color = JPS_VISUAL_COLOR_OPEN; \
						turfs_got_colored[clast] = TRUE; \
						clast.overlays += get_jps_scan_overlay(cdir1 | DIR, TRUE); \
						nodes_by_turf[clast] = creating_node; \
						open.enqueue(creating_node); \
					} \
					cpass = FALSE; \
				} \
			} \
		} \
		if(!isnull(cscan2)) { \
			if(!JPS_ADJACENCY_CALL(cardscan, cscan2)) { \
				cfailed2 = TRUE; \
			} \
			else { \
				if(cfailed2) { \
					if(cardscan.pathfinding_cycle != cycle) { \
						if((jdir & (jdir - 1)) && isnull(dmadenode)) { \
							dmadenode = new /datum/jps_node(considering, top, JPS_HEURISTIC_CALL(considering), top.depth + dsteps, top.cost + dsteps, jdir); \
							creating_node = new /datum/jps_node(clast, dmadenode, JPS_HEURISTIC_CALL(clast), dmadenode.depth + csteps, dmadenode.cost + csteps, cdir2 | DIR); \
						} \
						else { \
							creating_node = new /datum/jps_node(clast, top, cheuristic, top.depth + csteps, top.cost + csteps, cdir2 | DIR); \
						} \
						clast.color = JPS_VISUAL_COLOR_OPEN; \
						turfs_got_colored[clast] = TRUE; \
						clast.overlays += get_jps_scan_overlay(cdir2 | DIR, TRUE); \
						nodes_by_turf[clast] = creating_node; \
						open.enqueue(creating_node); \
					} \
					cpass = FALSE; \
				} \
			} \
		} \
		next = get_step(cardscan, DIR); \
		if(isnull(next) || !JPS_ADJACENCY_CALL(cardscan, next)) { \
			cardscan.pathfinding_cycle = cycle; \
			break; \
		} \
		if(!cpass) { \
			if(cardscan.pathfinding_cycle != cycle) { \
				if((jdir & (jdir - 1)) && isnull(dmadenode)) { \
					dmadenode = new /datum/jps_node(considering, top, JPS_HEURISTIC_CALL(considering), top.depth + dsteps, top.cost + dsteps, jdir); \
					creating_node = new /datum/jps_node(clast, dmadenode, JPS_HEURISTIC_CALL(clast), dmadenode.depth + csteps, dmadenode.cost + csteps, DIR); \
				} \
				else { \
					creating_node = new /datum/jps_node(clast, top, cheuristic, top.depth + csteps, top.cost + csteps, DIR); \
				} \
				clast.color = JPS_VISUAL_COLOR_OPEN; \
				turfs_got_colored[clast] = TRUE; \
				clast.overlays += get_jps_scan_overlay(DIR, TRUE); \
				nodes_by_turf[clast] = creating_node; \
				open.enqueue(creating_node); \
				cardscan.pathfinding_cycle = cycle; \
			} \
			break; \
		} \
		clast = cardscan; \
		cardscan.pathfinding_cycle = cycle; \
		cardscan = next; \
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
 * * max_dist is *really* weird. It uses JPs path lengths, so, you probably need it a good bit higher than your target distance.
 */
/datum/pathfinding/jps
	/// the priority queue is accessible at instance level because we're too complicated to fit into one macro
	/// (yet).
	var/datum/priority_queue/open

/datum/pathfinding/jps/search()
	ASSERT(isturf(src.start) && isturf(src.goal) && src.start.z == src.goal.z)
	if(src.start == src.goal)
		return list()
	// too far away
	if(get_chebyshev_dist(src.start, src.goal) > max_path_length)
		return null
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
	if(SSpathfinder.pathfinding_cycle >= SHORT_REAL_LIMIT)
		SSpathfinder.pathfinding_cycle = 0
	var/cycle = ++SSpathfinder.pathfinding_cycle
	// add operating vars
	var/turf/current
	var/turf/considering
	var/turf/next
	var/jdir
	var/jdir1
	var/jdir2
	var/dpass
	var/dsteps
	var/list/nodes_by_turf = list()
	var/datum/jps_node/creating_node
	var/was_same_cycle
	// diagonal scan vars - must not be used or modified outside of the diagonal scan
	var/datum/jps_node/dmadenode
	// cardinal scan vars - must not be used or modified outside of the define
	var/turf/cardscan
	var/turf/cscan1
	var/turf/cscan2
	var/turf/clast
	var/cheuristic
	var/cfailed1
	var/cfailed2
	var/cinitialsteps
	var/cdir1
	var/cdir2
	var/cpass
	var/csteps
	var/cskipfirst = TRUE
	// make queue
	var/datum/priority_queue/open = (src.open = new /datum/priority_queue(/proc/cmp_jps_node))
	// add initial nodes
	var/start_heuristic = JPS_HEURISTIC_CALL(start)
	// we want a very good best case
	var/estimated_dir = jps_estimate_dir(start, goal)
	var/start_check_dir
	var/turf/start_check
	#ifdef JPS_DEBUGGING
	#define JPS_START_DIR(DIR) \
		start_check_dir = DIR ; \
		start_check = get_step(start, start_check_dir); \
		if(!isnull(start_check) && JPS_ADJACENCY_CALL(start, start_check)) { \
			start.overlays += get_jps_scan_overlay(DIR, TRUE); \
			creating_node = new /datum/jps_node(start, null, start_heuristic, 0, 0, start_check_dir) ; \
			nodes_by_turf[start] = creating_node; \
			open.enqueue(creating_node); \
		}
	#else
	#define JPS_START_DIR(DIR) \
		start_check_dir = DIR ; \
		start_check = get_step(start, start_check_dir); \
		if(!isnull(start_check) && JPS_ADJACENCY_CALL(start, start_check)) { \
			creating_node = new /datum/jps_node(start, null, start_heuristic, 0, 0, start_check_dir) ; \
			nodes_by_turf[start] = creating_node; \
			open.enqueue(creating_node); \
		}
	#endif
	JPS_START_DIR(estimated_dir)
	JPS_START_DIR(turn(estimated_dir, 45))
	JPS_START_DIR(turn(estimated_dir, -45))
	JPS_START_DIR(turn(estimated_dir, 90))
	JPS_START_DIR(turn(estimated_dir, -90))
	JPS_START_DIR(turn(estimated_dir, 135))
	JPS_START_DIR(turn(estimated_dir, -135))
	JPS_START_DIR(turn(estimated_dir, 180))

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
		if(get_dist(current, goal) <= target_distance && (target_distance != 1 || !require_adjacency_when_going_adjacent || current.TurfAdjacency(goal)))
			#ifdef JPS_DEBUGGING
			return jps_unwind_path(top, turfs_got_colored)
			#else
			return jps_unwind_path(top)
			#endif

		// too deep, abort
		if(top.depth + get_dist(current, goal) >= max_depth)
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
				was_same_cycle = considering.pathfinding_cycle == cycle
				dmadenode = null
				// this, along with the ones in the macros, can be micro-optimized to take one less unnecessary
				// check per iteration by putting it at end instead of beginning
				if(get_dist(considering, goal) <= target_distance && (target_distance != 1 || !require_adjacency_when_going_adjacent || considering.TurfAdjacency(goal))) {
					#ifdef JPS_DEBUGGING
					turfs_got_colored[considering] = TRUE
					considering.color = JPS_VISUAL_COLOR_CURRENT
					return jps_unwind_path(new /datum/jps_node(considering, top, JPS_HEURISTIC_CALL(considering), csteps, top.cost + csteps, jdir), turfs_got_colored)
					#else
					return jps_unwind_path(new /datum/jps_node(considering, top, JPS_HEURISTIC_CALL(considering), csteps, top.cost + csteps, jdir))
					#endif
				}
				#ifdef JPS_DEBUGGING
				considering.overlays += get_jps_scan_overlay(jdir, TRUE)
				turfs_got_colored[considering] = TRUE
				#endif
				dpass = TRUE
				next = get_step(considering, jdir1)
				if(!isnull(next) && JPS_ADJACENCY_CALL(considering, next))
					// don't skip first tile
					cskipfirst = FALSE
					JPS_CARDINAL_SCAN(considering, jdir1)
					if(!was_same_cycle)
						considering.pathfinding_cycle = null
					if(!cpass)
						dpass = FALSE
				next = get_step(considering, jdir2)
				if(!isnull(next) && JPS_ADJACENCY_CALL(considering, next))
					// don't skip first tile
					cskipfirst = FALSE
					JPS_CARDINAL_SCAN(considering, jdir2)
					if(!was_same_cycle)
						considering.pathfinding_cycle = null
					if(!cpass)
						dpass = FALSE
				next = get_step(considering, jdir)
				if(isnull(next) || !JPS_ADJACENCY_CALL(considering, next))
					considering = next
					considering.pathfinding_cycle = cycle
					break
				if(!dpass)
					if(considering.pathfinding_cycle != cycle)
						#ifdef JPS_DEBUGGING
						considering.color = JPS_VISUAL_COLOR_OPEN
						turfs_got_colored[considering] = TRUE
						considering.overlays += get_jps_scan_overlay(jdir, TRUE)
						#endif
						// check here too to guard against cpass failing but non-similar cycles causing no node to be made.
						if(isnull(dmadenode)) {
							dmadenode = new /datum/jps_node(considering, top, JPS_HEURISTIC_CALL(considering), dsteps, top.cost + dsteps, jdir)
						}
						creating_node = dmadenode
						nodes_by_turf[considering] = creating_node
						open.enqueue(creating_node)
						considering.pathfinding_cycle = cycle
					break
				if(dsteps + top.depth + get_dist(considering, goal) > max_depth)
					#ifdef JPS_DEBUGGING
					considering.color = JPS_VISUAL_COLOR_OUT_OF_BOUNDS
					turfs_got_colored[considering] = TRUE
					#endif
					considering.pathfinding_cycle = cycle
					break
				considering.pathfinding_cycle = cycle
				considering = next
				++dsteps
			}
		else
			// cardinal - relatively easy
			JPS_CARDINAL_SCAN(current, jdir)

	#ifdef JPS_DEBUGGING
	jps_wipe_colors_after(turfs_got_colored, GLOB.jps_visualization_persist)
	#endif

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

#undef JPS_SANE_NODE_LIMIT

#ifdef JPS_DEBUGGING
	#undef JPS_DEBUGGING

	#undef JPS_VISUAL_COLOR_CLOSED
	#undef JPS_VISUAL_COLOR_OPEN
	#undef JPS_VISUAL_COLOR_CURRENT
	#undef JPS_VISUAL_COLOR_FOUND
#endif
