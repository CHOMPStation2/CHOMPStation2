//
// Additions to mapping subsystem handles initialization of random map elements at server start
// I'm kidnapping Vores random engine spawn code - Gozulio.
//

/datum/controller/subsystem/mapping/proc/pickEngine(pickedEngine)
	if(!engine_loader_pickable)
		to_world_log("Ignoring player picked engine")
		return // Either this map doesn't use this engine loader or doesn't need one at all.

	var/turf/T = get_turf(engine_loader_pickable)
	if(!isturf(T))
		to_world_log("[log_info_line(engine_loader_pickable)] not on a turf! Cannot place engine template.")
		return

	// Choose an engine type
	var/datum/map_template/engine/chosen_type = null
	if (LAZYLEN(CONFIG_GET(str_list/engine_map))) // CHOMPEdit
		var/chosen_name = pickedEngine //Instead of using the config, we'll take an argument.
		chosen_type = map_templates[chosen_name]
		if(!istype(chosen_type))
			error("Configured engine map [chosen_name] is not a valid engine map name!")
	if(!istype(chosen_type))
		var/list/engine_types = list()
		for(var/map in map_templates)
			var/datum/map_template/engine/MT = map_templates[map]
			if(istype(MT))
				engine_types += MT
		chosen_type = pick(engine_types)
	global_announcer.autosay("Engineering has selected [chosen_type.name] as todays engine.", "Engine Constructor")
	to_world_log("Chose Engine Map: [chosen_type.name]")
	admin_notice(span_danger("Chose Engine Map: [chosen_type.name]"), R_DEBUG)

	// Annihilate movable atoms
	engine_loader_pickable.annihilate_bounds()
	//CHECK_TICK //Don't let anything else happen for now
	// Actually load it
	chosen_type.load(T)
	sleep(1)
	engine_loader_pickable.lateload_init()
