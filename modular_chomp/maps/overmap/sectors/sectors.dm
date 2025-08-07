/obj/effect/overmap/visitable/Initialize(mapload, dyn_poi)
	// Translate Z_NAMEs to real Zs if needed
	if(length(map_z))
		var/list/resolved_map_z = list()
		for(var/current in map_z)
			if(isnull(current))
				resolved_map_z += current
				continue
			if(isnum(current))
				resolved_map_z |= current
				continue
			var/resolved_z = GLOB.map_templates_loaded[current]
			if(resolved_z)
				resolved_map_z |= resolved_z
				continue
			stack_trace("[src] ([type]) could not find z_level [current]!")
		map_z = resolved_map_z

	return ..()
