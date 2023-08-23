//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2023 Citadel Station developers.          *//

/**
 * JPS (jump point search)
 *
 * * flat routes
 * * inherently emits diagonals
 * * emits a bunch nodes to walk to instead of a clear path
 */
/datum/pathfinding/jps

/datum/pathfinding/jps/search()
	

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


