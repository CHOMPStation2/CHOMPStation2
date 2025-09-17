// default shuttle roof type - blanket define our shuttle area ceiling type, we have multi-Zs and the default is none.
/turf/simulated/floor/reinforced/airless/shuttleroof
	// A special type just to make sure we don't delete airless reinforced when shuttles depart
/area/shuttle //blanket define our shuttle area ceiling type, we have multi-Zs and the default is none.
	ceiling_type = /turf/simulated/floor/reinforced/airless/shuttleroof

/datum/shuttle //blanket define our shuttle area ceiling type, we have multi-Zs and the default is none.
	ceiling_type = /turf/simulated/floor/reinforced/airless/shuttleroof
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

#undef ESCAPE_POD


// Large Escape Pod 2
/datum/shuttle/autodock/ferry/escape_pod/large_escape_pod2
	name = "Large Escape Pod 2"
	location = FERRY_LOCATION_STATION
	warmup_time = 0
	shuttle_area = /area/shuttle/large_escape_pod2/station
	landmark_station = "large_escape_pod2_station"
	landmark_offsite = "large_escape_pod2_offsite"
	landmark_transition = "large_escape_pod2_transit"
	docking_controller_tag = "large_escape_pod_2"
	move_time = SHUTTLE_TRANSIT_DURATION_RETURN

/obj/effect/shuttle_landmark/southern_cross/large_escape_pod2/station
	name = "Station"
	landmark_tag = "large_escape_pod2_station"
	docking_controller = "large_escape_pod_2_berth"
	base_area = /area/maintenance/firstdeck/centralport
	base_turf = /turf/simulated/floor/airless

/obj/effect/shuttle_landmark/southern_cross/large_escape_pod2/offsite
	name = "Recovery"
	landmark_tag = "large_escape_pod2_offsite"
	docking_controller = "large_escape_pod_2_recovery"

/obj/effect/shuttle_landmark/southern_cross/large_escape_pod2/transit
	landmark_tag = "large_escape_pod2_transit"
	flags = SLANDMARK_FLAG_AUTOSET
