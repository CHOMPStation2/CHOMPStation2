// Creates a MST, using it to generate hallways
// Probably not the fastest algorithm, but given there should never be more than like 20 rooms anyways, and it's only run once.
/proc/generate_pathways(var/obj/effect/landmark/marker)

/proc/generate_maze(var/limit_x, var/limit_y, var/z)
	var/list/maze = verdigris_generate_maze(limit_x - 1, limit_y - 1)

	for (var/x = 1, x < limit_x, x++)
		for (var/y = 1, y < limit_y, y++)
			var/turf/turf = get_turf(locate(x, y, z))
			if (maze[(y - 1) * (limit_x - 1) + x])
				turf.ChangeTurf(/turf/simulated/wall/r_wall)
			else
				turf.ChangeTurf(/turf/simulated/floor/plating)

// A modified seed_submaps to fit the unique constraints of maze generation:
// - Pulls the submap list from the areas to reduce failed checks
// - Ignores non-exact area fits
// - Only spawns templates on odd coordinates
// - Spawns every template
// TODO generify this code with some new root area type instead of making it darkcomplex specific (in case anyone else wants to use it)
/proc/spawn_templates(var/limit_x, var/limit_y, var/z_level)
	var/areas = list(/area/awaymission/darkcomplex/low_risk)
	var/spawning = list()

	var/sanity = 100
	while (length(areas) && sanity)
		var/turf/T = locate(rand(5, limit_x / 2 - 5) * 2, rand(5, limit_y / 2 - 5) * 2, z_level)
		var/area/awaymission/darkcomplex/area = get_area(T)

		// Avoids spawning in already-spawned maps
		if (!istype(area))
			sanity -= 1
			continue

		var/added = FALSE
		for(var/found in areas)
			if (istype(area, found))
				added = TRUE

		if (!length(area.submaps))
			areas -= area
			continue

		if (!added)
			sanity -= 1
			continue

		var/template = pick(area.submaps)
		area.submaps -= template
		if (!length(area.submaps))
			areas -= area

		to_chat(world, span_boldannounce("Placing [template] at [T.x] [T.y] [T.z]"))
		var/datum/map_template/chosen_template = SSmapping.map_templates[template]
		chosen_template.preload_size(chosen_template.mappath)
		chosen_template.load(T, centered = TRUE)

	to_chat(world, span_boldannounce("Ending with sanity [sanity]"))

// Implemented in verdigris because it's faster and holy shit I don't want to do this in DM.
// Rooms is expected to be a list of rooms, in the form of ((center x, center y), (size x, size y)) for each
/proc/verdigris_generate_pathways(limit_x, limit_y, rooms) as /list
	RETURN_TYPE(/list)
	return VERDIGRIS_CALL("generate_pathways", limit_x, limit_y, rooms)

/proc/verdigris_generate_maze(limit_x, limit_y) as /list
	RETURN_TYPE(/list)
	return VERDIGRIS_CALL("generate_maze", limit_x, limit_y)
