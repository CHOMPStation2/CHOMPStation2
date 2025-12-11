/datum/shuttle/autodock/ferry/escape_pod/large_escape_pod2
	defer_initialisation = TRUE

/datum/shuttle/autodock/overmap/junker
	defer_initialisation = TRUE


// default shuttle roof type - blanket define our shuttle area ceiling type, we have multi-Zs and the default is none.
/turf/simulated/floor/reinforced/airless/shuttleroof
	// A special type just to make sure we don't delete airless reinforced when shuttles depart
/area/shuttle //blanket define our shuttle area ceiling type, we have multi-Zs and the default is none.
	ceiling_type = /turf/simulated/floor/reinforced/airless/shuttleroof

/datum/shuttle //blanket define our shuttle area ceiling type, we have multi-Zs and the default is none.
	ceiling_type = /turf/simulated/floor/reinforced/airless/shuttleroof

#define ESCAPE_POD(NUMBER) \
/datum/shuttle/autodock/ferry/escape_pod/escape_pod##NUMBER { \
	name = "Escape Pod " + #NUMBER; \
	location = FERRY_LOCATION_STATION; \
	warmup_time = 0; \
	shuttle_area = /area/shuttle/escape_pod##NUMBER/station; \
	docking_controller_tag = "escape_pod_" + #NUMBER; \
	landmark_station = "escape_pod_"+ #NUMBER +"_station"; \
	landmark_offsite = "escape_pod_"+ #NUMBER +"_offsite"; \
	landmark_transition = "escape_pod_"+ #NUMBER +"_transit"; \
	move_time = SHUTTLE_TRANSIT_DURATION_RETURN; \
}

ESCAPE_POD(1)
ESCAPE_POD(2)
ESCAPE_POD(3)
ESCAPE_POD(4)

#undef ESCAPE_POD
