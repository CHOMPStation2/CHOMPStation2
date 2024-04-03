//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2023 Citadel Station developers.          *//

/**
 * Default object used during pathfinder checks
 */
GLOBAL_DATUM_INIT(generic_pathfinding_actor, /atom/movable/pathfinding_predicate, new)

/atom/movable/pathfinding_predicate
	invisibility = INVISIBILITY_ABSTRACT
	//pass_flags = ATOM_PASS_CLICK
	//pass_flags_self = NONE

/**
 * datum used for pathfinding
 *
 * pathfinding is a specific version of otherwise generic graph/grid searches
 * we only path via cardinals due to ss13's movement treating diagonals as two cardinal moves
 * pixel movement is explicitly non-supported at this time
 *
 * for overmaps / similar pixel-move-ish tasks, please write a new pathfinding system if you want
 * accurate results.
 */
/datum/pathfinding
	//* basics
	/// thing trying to get a path
	var/atom/movable/actor
	/// start turf
	var/turf/start
	/// goal turf
	var/turf/goal

	//* options
	/// how far away to the end we want to get; 0 = get ontop of the tile, 1 = get adjacent to the tile
	/// keep in mind that pathing with 0 to a dense object is usually going to fail!
	/// this is in byond distance, *not* pathfinding distance
	/// this means that 1 tile away diagonally = 1, 2 diagonally away = 2, etc.
	var/target_distance
	/// if target distance is one, we require adjacency
	var/require_adjacency_when_going_adjacent = TRUE
	/// how far away total we can search
	/// this is not distance from source we want to go, this is how far away we can *search*
	/// (the former might be the case for some algorithms, though).
	/// this should not be used to limit pathfinding max distance / path distance
	/// this just tells the algorithm when it should give up
	/// different algorithms respond differently to this.
	var/max_path_length
	/// context to call adjacency/distance call on
	/// null = global proc
	var/datum/context
	/// checks if we can go to a turf
	/// defaults to default density / canpass / etc checks
	/// called with (turf/A, turf/B, atom/movable/actor, datum/pathfinding/pathfinding)
	/// it should return the distance to that turf
	var/adjacency_call = /proc/default_pathfinding_adjacency
	/// checks distance from turf to target / end turf
	/// defaults to just get dist
	/// called with (turf/current, turf/goal)
	var/heuristic_call = /proc/default_pathfinding_heuristic
	/// danger flags to ignore
	var/turf_path_danger_ignore = NONE

	//* ss13-specific things
	/// access list ; used to get through doors and other objects if set
	var/list/ss13_with_access

/datum/pathfinding/New(atom/movable/actor, turf/start, turf/goal, target_distance, max_path_length)
	src.actor = actor
	src.start = start
	src.goal = goal
	src.target_distance = target_distance
	src.max_path_length = max_path_length

/**
 * returns raw list of nodes returned by algorithm
 */
/datum/pathfinding/proc/search()
	RETURN_TYPE(/list)
	CRASH("Not implemented on base type.")

/datum/pathfinding/proc/debug_log_string()
	return json_encode(vars)

/datum/pathfinding_context

/datum/pathfinding_context/proc/adjacency(turf/A, turf/B, atom/movable/actor, datum/pathfinding/search)
	return default_pathfinding_adjacency(A, B, actor, search)

/datum/pathfinding_context/proc/heuristic(turf/current, turf/goal)
	return default_pathfinding_heuristic(current, goal)

/datum/pathfinding_context/ignoring
	/// ignore typecache
	var/list/turf_ignore_typecache
	/// ignore instance cache
	var/list/turf_ignore_cache

/datum/pathfinding_context/ignoring/adjacency(turf/A, turf/B, atom/movable/actor, datum/pathfinding/search)
	if(!isnull(turf_ignore_typecache) && turf_ignore_typecache[B.type])
		return FALSE
	if(!isnull(turf_ignore_cache) && turf_ignore_cache[B.type])
		return FALSE
	return default_pathfinding_adjacency(A, B, actor, search)

//* ENSURE BELOW PROCS MATCH EACH OTHER IN THEIR PAIRS *//
//* This allows for fast default implementations while *//
//* allowing for advanced checks when a pathfinding    *//
//* context is supplied.                               *//

/proc/default_pathfinding_adjacency(turf/A, turf/B, atom/movable/actor, datum/pathfinding/search)
	// we really need to optimize this furthur
	// this currently catches abstract stuff like lighting objects
	// not great for performance.

	if(B.density)
		return FALSE
	if((B.turf_path_danger & search.turf_path_danger_ignore) != B.turf_path_danger)
		return FALSE

	var/dir = get_dir(A, B)

	if(dir & (dir - 1))
		var/td1 = dir & (NORTH|SOUTH)
		var/td2 = dir & (EAST|WEST)
		var/turf/scan = get_step(A, td1)
		if(!isnull(scan) && default_pathfinding_adjacency(A, scan, actor, search) && default_pathfinding_adjacency(scan, B, actor, search))
			return TRUE
		scan = get_step(A, td2)
		if(!isnull(scan) && default_pathfinding_adjacency(A, scan, actor, search) && default_pathfinding_adjacency(scan, B, actor, search))
			return TRUE
		return FALSE

	var/rdir = turn(dir, 180)

	for(var/atom/movable/AM as anything in A)
		if(!AM.can_pathfinding_exit(actor, dir, search))
			return FALSE
	for(var/atom/movable/AM as anything in B)
		if(!AM.can_pathfinding_enter(actor, rdir, search))
			return FALSE
	return TRUE

/proc/default_pathfinding_heuristic(turf/current, turf/goal)
	return max(abs(current.x - goal.x), abs(current.y - goal.y))

/proc/jps_pathfinding_adjacency(turf/A, turf/B, atom/movable/actor, datum/pathfinding/search)
	// we really need to optimize this furthur
	// this currently catches abstract stuff like lighting objects
	// not great for performance.

	if(B.density)
		return FALSE
	if((B.turf_path_danger & search.turf_path_danger_ignore) != B.turf_path_danger)
		return FALSE

	var/dir = get_dir(A, B)

	if(dir & (dir - 1))
		var/td1 = dir & (NORTH|SOUTH)
		var/td2 = dir & (EAST|WEST)
		var/turf/scan = get_step(A, td1)
		if(!isnull(scan) && jps_pathfinding_adjacency(A, scan, actor, search) && jps_pathfinding_adjacency(scan, B, actor, search))
			return TRUE
		scan = get_step(A, td2)
		if(!isnull(scan) && jps_pathfinding_adjacency(A, scan, actor, search) && jps_pathfinding_adjacency(scan, B, actor, search))
			return TRUE
		return FALSE

	for(var/atom/movable/AM as anything in B)
		if(!AM.can_pathfinding_pass(actor, search))
			return FALSE
	return TRUE

/**
 * This is a pretty hot proc used during pathfinding to see if something
 * should be able to pass through this movable in a certain direction.
 *
 * dir is where they're coming from
 */
/atom/movable/proc/can_pathfinding_enter(atom/movable/actor, dir, datum/pathfinding/search)
	return !density /*|| (pass_flags_self & actor.pass_flags)*/

/**
 * This is a pretty hot proc used during pathfinding to see if something
 * should be able to pass out of this movable in a certain direction.
 *
 * dir is where they're going to
 */
/atom/movable/proc/can_pathfinding_exit(atom/movable/actor, dir, datum/pathfinding/search)
	return !(flags & ON_BORDER) || !density /*|| (pass_flags_self & actor.pass_flags)*/

/**
 * basically, non directional pathfinding enter/exit checks
 *
 * this is used for JPS because it does not at all play nicely with situations where one direction
 * is blocked and another isn't.
 */
/atom/movable/proc/can_pathfinding_pass(atom/movable/actor, datum/pathfinding/search)
	return !density /*|| (pass_flags_self & actor.pass_flags)*/
