//player pickble engine marker.
//Hopefully to be accompanied by submaps for Radients map.
/obj/effect/landmark/engine_loader_pickable
	name = "Player Picked Engine Loader"
	var/clean_turfs // A list of lists, where each list is (x, )

//check for duplicte loaders. TODO: Make referance a subsystem that isnt upstream. See /controllers/subsystems/mapping_yw.dm and mapping_vr.dm
/obj/effect/landmark/engine_loader_pickable/New()
	if(SSmapping.engine_loader_pickable)
		warning("Duplicate engine_loader landmarks: [log_info_line(src)] and [log_info_line(SSmapping.engine_loader)]")
		delete_me = TRUE
	SSmapping.engine_loader_pickable = src
	return ..()

/obj/effect/landmark/engine_loader_pickable/proc/get_turfs_to_clean()
	. = list()
	if(clean_turfs)
		for(var/list/coords in clean_turfs)
			. += block(locate(coords[1], coords[2], src.z), locate(coords[3], coords[4], src.z))

/obj/effect/landmark/engine_loader_pickable/proc/annihilate_bounds()
	var/deleted_atoms = 0
	admin_notice("<span class='danger'>Annihilating objects in engine loading locatation.</span>", R_DEBUG)
	var/list/turfs_to_clean = get_turfs_to_clean()
	if(turfs_to_clean.len)
		for(var/x in 1 to 2) // Requires two passes to get everything.
			for(var/turf/T in turfs_to_clean)
				for(var/atom/movable/AM in T)
					++deleted_atoms
					qdel(AM)
	admin_notice("<span class='danger'>Annihilated [deleted_atoms] objects.</span>", R_DEBUG)