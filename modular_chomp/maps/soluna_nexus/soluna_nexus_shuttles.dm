// default shuttle roof type - blanket define our shuttle area ceiling type, we have multi-Zs and the default is none.
/turf/simulated/floor/reinforced/airless/shuttleroof
	// A special type just to make sure we don't delete airless reinforced when shuttles depart
/area/shuttle //blanket define our shuttle area ceiling type, we have multi-Zs and the default is none.
	ceiling_type = /turf/simulated/floor/reinforced/airless/shuttleroof

/datum/shuttle //blanket define our shuttle area ceiling type, we have multi-Zs and the default is none.
	ceiling_type = /turf/simulated/floor/reinforced/airless/shuttleroof
// Escape Pods - Save me from typing this eight billion times

/datum/shuttle/autodock/ferry/escape_pod/large_escape_pod4
	name = "Large Escape Pod 4"
	location = FERRY_LOCATION_STATION
	warmup_time = 0
	shuttle_area = /area/shuttle/large_escape_pod4/station
	landmark_station = "large_escape_pod4_station"
	landmark_offsite = "large_escape_pod4_offsite"
	landmark_transition = "large_escape_pod4_transit"
	docking_controller_tag = "large_escape_pod_4"
	move_time = SHUTTLE_TRANSIT_DURATION_RETURN

/datum/shuttle/autodock/ferry/escape_pod/large_escape_pod3
	name = "Large Escape Pod 3"
	location = FERRY_LOCATION_STATION
	warmup_time = 0
	shuttle_area = /area/shuttle/large_escape_pod3/station
	landmark_station = "large_escape_pod3_station"
	landmark_offsite = "large_escape_pod3_offsite"
	landmark_transition = "large_escape_pod3_transit"
	docking_controller_tag = "large_escape_pod_3"
	move_time = SHUTTLE_TRANSIT_DURATION_RETURN

// Escape Pods - Save me from typing this eight billion times
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
ESCAPE_POD(5)
ESCAPE_POD(6)
ESCAPE_POD(7)
ESCAPE_POD(8)
ESCAPE_POD(9)
ESCAPE_POD(10)
ESCAPE_POD(11)
ESCAPE_POD(12)
ESCAPE_POD(13)
ESCAPE_POD(14)

#undef ESCAPE_POD
