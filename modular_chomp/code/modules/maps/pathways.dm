// Creates a MST, using it to generate hallways
// Probably not the fastest algorithm, but given there should never be more than like 20 rooms anyways, and it's only run once.
/proc/generate_pathways(var/obj/effect/landmark/marker)

/proc/generate_maze(var/limit_x, var/limit_y, var/z)
	to_chat(world, span_boldannounce("Generating maze!"))
	var/list/maze = verdigris_generate_maze(limit_x, limit_y)

	for (var/x = 1, x <= 100, x++)
		for (var/y = 1, y <= 100, y++)
			var/turf/turf = get_turf(locate(x, y, z))
			if (turf != null)
				if (maze[(x - 1) * limit_x + y])
					turf.ChangeTurf(/turf/simulated/wall/r_wall)
				else
					turf.ChangeTurf(/turf/simulated/floor/plating)

// Implemented in verdigris because it's faster and holy shit I don't want to do this in DM.
// Rooms is expected to be a list of rooms, in the form of ((center x, center y), (size x, size y)) for each
/proc/verdigris_generate_pathways(limit_x, limit_y, rooms) as /list
	RETURN_TYPE(/list)
	return VERDIGRIS_CALL("generate_pathways", limit_x, limit_y, rooms)

/proc/verdigris_generate_maze(limit_x, limit_y) as /list
	RETURN_TYPE(/list)
	return VERDIGRIS_CALL("generate_maze", limit_x, limit_y)
