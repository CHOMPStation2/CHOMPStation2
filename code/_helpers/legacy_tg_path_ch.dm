/**
 * This file contains the stuff you need for using JPS (Jump Point Search) pathing, an alternative to A* that skips
 * over large numbers of uninteresting tiles resulting in much quicker pathfinding solutions. Mind that diagonals
 * cost the same as cardinal moves currently, so paths may look a bit strange, but should still be optimal.
 */
//////////////////////
//datum/tg_heap object
//////////////////////

/datum/tg_heap
	var/list/L
	var/cmp

/datum/tg_heap/New(compare)
	L = new()
	cmp = compare

/datum/tg_heap/Destroy(force, ...)
	for(var/i in L) // because this is before the list helpers are loaded
		qdel(i)
	L = null
	return ..()

/datum/tg_heap/proc/is_empty()
	return !length(L)

//insert and place at its position a new node in the heap
/datum/tg_heap/proc/insert(A)

	L.Add(A)
	swim(length(L))

//removes and returns the first element of the heap
//(i.e the max or the min dependant on the comparison function)
/datum/tg_heap/proc/pop()
	if(!length(L))
		return 0
	. = L[1]

	L[1] = L[length(L)]
	L.Cut(length(L))
	if(length(L))
		sink(1)

//Get a node up to its right position in the heap
/datum/tg_heap/proc/swim(index)
	var/parent = round(index * 0.5)

	while(parent > 0 && (call(cmp)(L[index],L[parent]) > 0))
		L.Swap(index,parent)
		index = parent
		parent = round(index * 0.5)

//Get a node down to its right position in the heap
/datum/tg_heap/proc/sink(index)
	var/g_child = get_greater_child(index)

	while(g_child > 0 && (call(cmp)(L[index],L[g_child]) < 0))
		L.Swap(index,g_child)
		index = g_child
		g_child = get_greater_child(index)

//Returns the greater (relative to the comparison proc) of a node children
//or 0 if there's no child
/datum/tg_heap/proc/get_greater_child(index)
	if(index * 2 > length(L))
		return 0

	if(index * 2 + 1 > length(L))
		return index * 2

	if(call(cmp)(L[index * 2],L[index * 2 + 1]) < 0)
		return index * 2 + 1
	else
		return index * 2

//Replaces a given node so it verify the heap condition
/datum/tg_heap/proc/resort(A)
	var/index = L.Find(A)

	swim(index)
	sink(index)

/datum/tg_heap/proc/List()
	. = L.Copy()

GLOBAL_LIST_INIT(legacy_tg_space_type_cache, typecacheof(/turf/space))

/**
 * A helper macro to see if it's possible to step from the first turf into the second one, minding things like door access and directional windows.
 * Note that this can only be used inside the [datum/tg_jps_pathfind][pathfind datum] since it uses variables from said datum.
 * If you really want to optimize things, optimize this, cuz this gets called a lot.
 */
#define CAN_STEP(cur_turf, next) (next && !next.density && !(simulated_only && GLOB.legacy_tg_space_type_cache[next.type]) && !cur_turf.LinkBlockedWithAccess(next,proc_caller, id) && (next != avoid))
/// Another helper macro for JPS, for telling when a node has forced neighbors that need expanding
#define STEP_NOT_HERE_BUT_THERE(cur_turf, dirA, dirB) ((!CAN_STEP(cur_turf, get_step(cur_turf, dirA)) && CAN_STEP(cur_turf, get_step(cur_turf, dirB))))

/// The JPS Node datum represents a turf that we find interesting enough to add to the open list and possibly search for new tiles from
/datum/tg_jps_node
	/// The turf associated with this node
	var/turf/tile
	/// The node we just came from
	var/datum/tg_jps_node/previous_node
	/// The A* node weight (f_value = number_of_tiles + heuristic)
	var/f_value
	/// The A* node heuristic (a rough estimate of how far we are from the goal)
	var/heuristic
	/// How many steps it's taken to get here from the start (currently pulling double duty as steps taken & cost to get here, since all moves incl diagonals cost 1 rn)
	var/number_tiles
	/// How many steps it took to get here from the last node
	var/jumps
	/// Nodes store the endgoal so they can process their heuristic without a reference to the pathfind datum
	var/turf/node_goal

/datum/tg_jps_node/New(turf/our_tile, datum/tg_jps_node/incoming_previous_node, jumps_taken, turf/incoming_goal)
	tile = our_tile
	jumps = jumps_taken
	if(incoming_goal) // if we have the goal argument, this must be the first/starting node
		node_goal = incoming_goal
	else if(incoming_previous_node) // if we have the parent, this is from a direct lateral/diagonal scan, we can fill it all out now
		previous_node = incoming_previous_node
		number_tiles = previous_node.number_tiles + jumps
		node_goal = previous_node.node_goal
		heuristic = get_dist(tile, node_goal)
		f_value = number_tiles + heuristic
	// otherwise, no parent node means this is from a subscan lateral scan, so we just need the tile for now until we call [datum/jps/proc/update_parent] on it

/datum/tg_jps_node/Destroy(force, ...)
	previous_node = null
	return ..()

/datum/tg_jps_node/proc/update_parent(datum/tg_jps_node/new_parent)
	previous_node = new_parent
	node_goal = previous_node.node_goal
	jumps = get_dist(tile, previous_node.tile)
	number_tiles = previous_node.number_tiles + jumps
	heuristic = get_dist(tile, node_goal)
	f_value = number_tiles + heuristic

/// TODO: Macro this to reduce proc overhead
/proc/TGHeapPathWeightCompare(datum/tg_jps_node/a, datum/tg_jps_node/b)
	return b.f_value - a.f_value

/**
 * The datum used to handle the JPS pathfinding, completely self-contained.
 */
/datum/tg_jps_pathfind
	/// The thing that we're actually trying to path for
	var/atom/movable/proc_caller
	/// The turf where we started at
	var/turf/start
	/// The turf we're trying to path to (note that this won't track a moving target)
	var/turf/end
	/// The open list/stack we pop nodes out from (TODO: make this a normal list and macro-ize the heap operations to reduce proc overhead)
	var/datum/tg_heap/open
	///An assoc list that serves as the closed list & tracks what turfs came from where. Key is the turf, and the value is what turf it came from
	var/list/sources
	/// The list we compile at the end if successful to pass back
	var/list/path

	// general pathfinding vars/args
	/// An ID card representing what access we have and what doors we can open. Its location relative to the pathing atom is irrelevant
	var/obj/item/card/id/id
	/// How far away we have to get to the end target before we can call it quits
	var/mintargetdist = 0
	/// I don't know what this does vs , but they limit how far we can search before giving up on a path
	var/max_distance = 30
	/// Space is big and empty, if this is TRUE then we ignore pathing through unsimulated tiles
	var/simulated_only
	/// A specific turf we're avoiding, like if a mulebot is being blocked by someone t-posing in a doorway we're trying to get through
	var/turf/avoid

/datum/tg_jps_pathfind/New(atom/movable/proc_caller, atom/goal, id, max_distance, mintargetdist, simulated_only, avoid)
	src.proc_caller = proc_caller
	end = get_turf(goal)
	open = new /datum/tg_heap(GLOBAL_PROC_REF(TGHeapPathWeightCompare))
	sources = new()
	src.id = id
	src.max_distance = max_distance
	src.mintargetdist = mintargetdist
	src.simulated_only = simulated_only
	src.avoid = avoid

/**
 * search() is the proc you call to kick off and handle the actual pathfinding, and kills the pathfind datum instance when it's done.
 *
 * If a valid path was found, it's returned as a list. If invalid or cross-z-level params are entered, or if there's no valid path found, we
 * return null, which [/proc/get_path_to] translates to an empty list (notable for simple bots, who need empty lists)
 */
/datum/tg_jps_pathfind/proc/search()
	start = get_turf(proc_caller)
	if(!start || !end)
		stack_trace("Invalid A* start or destination")
		return
	if(start.z != end.z || start == end ) //no pathfinding between z levels
		return
	if(max_distance && (max_distance < get_dist(start, end))) //if start turf is farther than max_distance from end turf, no need to do anything
		return

	//initialization
	var/datum/tg_jps_node/current_processed_node = new (start, -1, 0, end)
	open.insert(current_processed_node)
	sources[start] = start // i'm sure this is fine

	//then run the main loop
	while(!open.is_empty() && !path)
		if(!proc_caller)
			return
		current_processed_node = open.pop() //get the lower f_value turf in the open list
		if(max_distance && (current_processed_node.number_tiles > max_distance))//if too many steps, don't process that path
			continue

		var/turf/current_turf = current_processed_node.tile
		for(var/scan_direction in list(EAST, WEST, NORTH, SOUTH))
			lateral_scan_spec(current_turf, scan_direction, current_processed_node)

		for(var/scan_direction in list(NORTHEAST, SOUTHEAST, NORTHWEST, SOUTHWEST))
			diag_scan_spec(current_turf, scan_direction, current_processed_node)

		CHECK_TICK

	//we're done! reverse the path to get it from start to finish
	if(path)
		for(var/i = 1 to round(0.5 * length(path)))
			path.Swap(i, length(path) - i + 1)

	sources = null
	qdel(open)
	return path

/**
 * Called when we've hit the goal with the node that represents the last tile,
 * then sets the path var to that path so it can be returned by [datum/tg_jps_pathfind/proc/search]
 */
/datum/tg_jps_pathfind/proc/unwind_path(datum/tg_jps_node/unwind_node)
	path = new()
	var/turf/iter_turf = unwind_node.tile
	path.Add(iter_turf)

	while(unwind_node.previous_node)
		var/dir_goal = get_dir(iter_turf, unwind_node.previous_node.tile)
		for(var/i = 1 to unwind_node.jumps)
			iter_turf = get_step(iter_turf,dir_goal)
			path.Add(iter_turf)
		unwind_node = unwind_node.previous_node

/**
 * For performing lateral scans from a given starting turf.
 *
 * These scans are called from both the main search loop, as well as subscans for diagonal scans, and they treat finding interesting turfs slightly differently.
 * If we're doing a normal lateral scan, we already have a parent node supplied, so we just create the new node and immediately insert it into the heap, ezpz.
 * If we're part of a subscan, we still need for the diagonal scan to generate a parent node, so we return a node datum with just the turf and let the diag scan
 * proc handle transferring the values and inserting them into the heap.
 *
 * Arguments:
 * * original_turf: What turf did we start this scan at?
 * * heading: What direction are we going in? Obviously, should be cardinal
 * * parent_node: Only given for normal lateral scans, if we don't have one, we're a diagonal subscan.
*/
/datum/tg_jps_pathfind/proc/lateral_scan_spec(turf/original_turf, heading, datum/tg_jps_node/parent_node)
	var/steps_taken = 0

	var/turf/current_turf = original_turf
	var/turf/lag_turf = original_turf

	while(TRUE)
		if(path)
			return
		lag_turf = current_turf
		current_turf = get_step(current_turf, heading)
		steps_taken++
		if(!CAN_STEP(lag_turf, current_turf))
			return

		if(current_turf == end || (mintargetdist && (get_dist(current_turf, end) <= mintargetdist)))
			var/datum/tg_jps_node/final_node = new(current_turf, parent_node, steps_taken)
			sources[current_turf] = original_turf
			if(parent_node) // if this is a direct lateral scan we can wrap up, if it's a subscan from a diag, we need to let the diag make their node first, then finish
				unwind_path(final_node)
			return final_node
		else if(sources[current_turf]) // already visited, essentially in the closed list
			return
		else
			sources[current_turf] = original_turf

		if(parent_node && parent_node.number_tiles + steps_taken > max_distance)
			return

		var/interesting = FALSE // have we found a forced neighbor that would make us add this turf to the open list?

		switch(heading)
			if(NORTH)
				if(STEP_NOT_HERE_BUT_THERE(current_turf, WEST, NORTHWEST) || STEP_NOT_HERE_BUT_THERE(current_turf, EAST, NORTHEAST))
					interesting = TRUE
			if(SOUTH)
				if(STEP_NOT_HERE_BUT_THERE(current_turf, WEST, SOUTHWEST) || STEP_NOT_HERE_BUT_THERE(current_turf, EAST, SOUTHEAST))
					interesting = TRUE
			if(EAST)
				if(STEP_NOT_HERE_BUT_THERE(current_turf, NORTH, NORTHEAST) || STEP_NOT_HERE_BUT_THERE(current_turf, SOUTH, SOUTHEAST))
					interesting = TRUE
			if(WEST)
				if(STEP_NOT_HERE_BUT_THERE(current_turf, NORTH, NORTHWEST) || STEP_NOT_HERE_BUT_THERE(current_turf, SOUTH, SOUTHWEST))
					interesting = TRUE

		if(interesting)
			var/datum/tg_jps_node/newnode = new(current_turf, parent_node, steps_taken)
			if(parent_node) // if we're a diagonal subscan, we'll handle adding ourselves to the heap in the diag
				open.insert(newnode)
			return newnode

/**
 * For performing diagonal scans from a given starting turf.
 *
 * Unlike lateral scans, these only are called from the main search loop, so we don't need to worry about returning anything,
 * though we do need to handle the return values of our lateral subscans of course.
 *
 * Arguments:
 * * original_turf: What turf did we start this scan at?
 * * heading: What direction are we going in? Obviously, should be diagonal
 * * parent_node: We should always have a parent node for diagonals
*/
/datum/tg_jps_pathfind/proc/diag_scan_spec(turf/original_turf, heading, datum/tg_jps_node/parent_node)
	var/steps_taken = 0
	var/turf/current_turf = original_turf
	var/turf/lag_turf = original_turf

	while(TRUE)
		if(path)
			return
		lag_turf = current_turf
		current_turf = get_step(current_turf, heading)
		steps_taken++
		if(!CAN_STEP(lag_turf, current_turf))
			return

		if(current_turf == end || (mintargetdist && (get_dist(current_turf, end) <= mintargetdist)))
			var/datum/tg_jps_node/final_node = new(current_turf, parent_node, steps_taken)
			sources[current_turf] = original_turf
			unwind_path(final_node)
			return
		else if(sources[current_turf]) // already visited, essentially in the closed list
			return
		else
			sources[current_turf] = original_turf

		if(parent_node.number_tiles + steps_taken > max_distance)
			return

		var/interesting = FALSE // have we found a forced neighbor that would make us add this turf to the open list?
		var/datum/tg_jps_node/possible_child_node // otherwise, did one of our lateral subscans turn up something?

		switch(heading)
			if(NORTHWEST)
				if(STEP_NOT_HERE_BUT_THERE(current_turf, EAST, NORTHEAST) || STEP_NOT_HERE_BUT_THERE(current_turf, SOUTH, SOUTHWEST))
					interesting = TRUE
				else
					possible_child_node = (lateral_scan_spec(current_turf, WEST) || lateral_scan_spec(current_turf, NORTH))
			if(NORTHEAST)
				if(STEP_NOT_HERE_BUT_THERE(current_turf, WEST, NORTHWEST) || STEP_NOT_HERE_BUT_THERE(current_turf, SOUTH, SOUTHEAST))
					interesting = TRUE
				else
					possible_child_node = (lateral_scan_spec(current_turf, EAST) || lateral_scan_spec(current_turf, NORTH))
			if(SOUTHWEST)
				if(STEP_NOT_HERE_BUT_THERE(current_turf, EAST, SOUTHEAST) || STEP_NOT_HERE_BUT_THERE(current_turf, NORTH, NORTHWEST))
					interesting = TRUE
				else
					possible_child_node = (lateral_scan_spec(current_turf, SOUTH) || lateral_scan_spec(current_turf, WEST))
			if(SOUTHEAST)
				if(STEP_NOT_HERE_BUT_THERE(current_turf, WEST, SOUTHWEST) || STEP_NOT_HERE_BUT_THERE(current_turf, NORTH, NORTHEAST))
					interesting = TRUE
				else
					possible_child_node = (lateral_scan_spec(current_turf, SOUTH) || lateral_scan_spec(current_turf, EAST))

		if(interesting || possible_child_node)
			var/datum/tg_jps_node/newnode = new(current_turf, parent_node, steps_taken)
			open.insert(newnode)
			if(possible_child_node)
				possible_child_node.update_parent(newnode)
				open.insert(possible_child_node)
				if(possible_child_node.tile == end || (mintargetdist && (get_dist(possible_child_node.tile, end) <= mintargetdist)))
					unwind_path(possible_child_node)
			return

/**
 * For seeing if we can actually move between 2 given turfs while accounting for our access and the proc_caller's pass_flags
 *
 * Arguments:
 * * proc_caller: The movable, if one exists, being used for mobility checks to see what tiles it can reach
 * * ID: An ID card that decides if we can gain access to doors that would otherwise block a turf
 * * simulated_only: Do we only worry about turfs with simulated atmos, most notably things that aren't space?
*/
/turf/proc/LinkBlockedWithAccess(turf/destination_turf, proc_caller, ID)
	var/static/datum/pathfinding/whatever = new
	return !global.default_pathfinding_adjacency(src, destination_turf, GLOB.generic_pathfinding_actor, whatever)

#undef CAN_STEP
#undef STEP_NOT_HERE_BUT_THERE
