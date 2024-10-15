/turf/simulated/floor/outdoors
	var/demote_to = /turf/simulated/floor/outdoors/rocks

/turf/simulated/floor/outdoors/proc/promote(var/new_turf_type)
	var/mytype = src.type
	var/list/coords = list(x, y, z)

	ChangeTurf(new_turf_type)
	var/turf/simulated/floor/outdoors/T = locate(coords[1], coords[2], coords[3])
	if(istype(T))
		T.demote_to = mytype

// This proc removes the topmost layer.
/turf/simulated/floor/outdoors/proc/demote()
	if(!demote_to)
		return // Cannot demote further.

	ChangeTurf(demote_to)

/turf/simulated/floor/outdoors/grass
	demote_to = /turf/simulated/floor/outdoors/dirt

/turf/simulated/floor/outdoors/snow
	demote_to = /turf/simulated/floor/outdoors/dirt

/turf/simulated/floor/outdoors/fur
	demote_to = null
