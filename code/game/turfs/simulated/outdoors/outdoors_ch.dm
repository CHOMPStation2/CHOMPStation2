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

// General sif turf defines for unit test, overridden in map for specific values
/turf/simulated/floor/plating/sif/planetuse

/turf/simulated/mineral/floor/sif

/turf/simulated/mineral/floor/ignore_mapgen/sif

/turf/simulated/floor/plating/sif/planetuse

/turf/simulated/floor/outdoors/snow/sif/planetuse

/turf/simulated/floor/outdoors/dirt/sif

/turf/simulated/floor/outdoors/dirt/sif/planetuse

/turf/simulated/floor/outdoors/grass/sif/forest/planetuse

/turf/simulated/floor/outdoors/rocks/sif/planetuse
