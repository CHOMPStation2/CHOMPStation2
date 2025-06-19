/area/shuttle //blanket define our shuttle area ceiling type, we have multi-Zs and the default is none.
	ceiling_type = /turf/simulated/floor/reinforced/airless/shuttleroof

/datum/shuttle //blanket define our shuttle area ceiling type, we have multi-Zs and the default is none.
	ceiling_type = /turf/simulated/floor/reinforced/airless/shuttleroof

// Arrivals Shuttle
/datum/shuttle/autodock/ferry/arrivals/southern_cross
	shuttle_area = /area/shuttle/arrival/pre_game
	landmark_offsite = "arrivals_offsite"
	landmark_station = "arrivals_station"
	docking_controller_tag = "arrivals_shuttle"

/obj/effect/shuttle_landmark/southern_cross/arrivals_offsite
	name = "Transit to Station"
	landmark_tag = "arrivals_offsite"
	base_area = /area/space
	base_turf = /turf/space

/obj/effect/shuttle_landmark/southern_cross/arrivals_station
	name = "SC Dock 2-C/D"
	landmark_tag = "arrivals_station"
	docking_controller = "arrivals_dock"

//Escape Pods

/obj/effect/shuttle_landmark/southern_cross/escape/station
	name = "Station Escape Dock"
	landmark_tag = "escape_station"
	docking_controller = "escape_dock"

/obj/effect/shuttle_landmark/southern_cross/escape/transit
	landmark_tag = "escape_transit"

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
} \
/obj/effect/shuttle_landmark/southern_cross/escape_pod##NUMBER/station { \
	name = "Station"; \
	landmark_tag = "escape_pod_"+ #NUMBER +"_station"; \
	docking_controller = "escape_pod_"+ #NUMBER +"_berth"; \
	base_area = /area/space; \
	base_turf = /turf/simulated/floor/airless; \
} \
/obj/effect/shuttle_landmark/southern_cross/escape_pod##NUMBER/offsite { \
	name = "Recovery"; \
	landmark_tag = "escape_pod_"+ #NUMBER +"_offsite"; \
	docking_controller = "escape_pod_"+ #NUMBER +"_recovery"; \
} \
/obj/effect/shuttle_landmark/southern_cross/escape_pod##NUMBER/transit { \
	landmark_tag = "escape_pod_"+ #NUMBER +"_transit"; \
	flags = SLANDMARK_FLAG_AUTOSET; \
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

// Cryostorage Escape Pod
/datum/shuttle/autodock/ferry/escape_pod/escape_pod_cryo
	name = "Cryostorage Shuttle"
	location = FERRY_LOCATION_STATION
	warmup_time = 0
	shuttle_area = /area/shuttle/cryo/station
	landmark_station = "cryostorage_station"
	landmark_offsite = "cryostorage_offsite"
	landmark_transition = "cryostorage_transit"
	docking_controller_tag = "cryostorage_shuttle"
	move_time = SHUTTLE_TRANSIT_DURATION_RETURN

/obj/effect/shuttle_landmark/southern_cross/cryostorage_station
	name = "Station Cryostorage Dock"
	landmark_tag = "cryostorage_station"
	docking_controller = "cryostorage_shuttle_berth"
	base_area = /area/space
	base_turf = /turf/simulated/floor/airless

/obj/effect/shuttle_landmark/southern_cross/cryostorage_offsite
	name = "Recovery"
	landmark_tag = "cryostorage_offsite"
	docking_controller = "cryostorage_shuttle_recovery"

/obj/effect/shuttle_landmark/southern_cross/cryostorage_transit
	landmark_tag = "cryostorage_transit"
	flags = SLANDMARK_FLAG_AUTOSET

// Large Escape Pod 1
/datum/shuttle/autodock/ferry/escape_pod/large_escape_pod1
	name = "Large Escape Pod 1"
	location = FERRY_LOCATION_STATION
	warmup_time = 0
	shuttle_area = /area/shuttle/large_escape_pod1/station
	landmark_station = "large_escape_pod1_station"
	landmark_offsite = "large_escape_pod1_offsite"
	landmark_transition = "large_escape_pod1_transit"
	docking_controller_tag = "large_escape_pod_1"
	move_time = SHUTTLE_TRANSIT_DURATION_RETURN

/obj/effect/shuttle_landmark/southern_cross/large_escape_pod1/station
	name = "Station"
	landmark_tag = "large_escape_pod1_station"
	docking_controller = "large_escape_pod_1_berth"
	base_area = /area/maintenance/firstdeck/centralstarboard
	base_turf = /turf/simulated/floor/airless

/obj/effect/shuttle_landmark/southern_cross/large_escape_pod1/offsite
	name = "Recovery"
	landmark_tag = "large_escape_pod1_offsite"
	docking_controller = "large_escape_pod_1_recovery"

/obj/effect/shuttle_landmark/southern_cross/large_escape_pod1/transit
	landmark_tag = "large_escape_pod1_transit"
	flags = SLANDMARK_FLAG_AUTOSET

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

/obj/effect/shuttle_landmark/southern_cross/large_escape_pod3/station
	name = "Station"
	landmark_tag = "large_escape_pod3_station"
	docking_controller = "large_escape_pod_3_berth"
	base_area = /area/maintenance/firstdeck/centralstarboard
	base_turf = /turf/simulated/floor/airless

/obj/effect/shuttle_landmark/southern_cross/large_escape_pod3/offsite
	name = "Recovery"
	landmark_tag = "large_escape_pod3_offsite"
	docking_controller = "large_escape_pod_3_recovery"

/obj/effect/shuttle_landmark/southern_cross/large_escape_pod3/transit
	landmark_tag = "large_escape_pod3_transit"
	flags = SLANDMARK_FLAG_AUTOSET

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

/obj/effect/shuttle_landmark/southern_cross/large_escape_pod4/station
	name = "Station"
	landmark_tag = "large_escape_pod4_station"
	docking_controller = "large_escape_pod_4_berth"
	base_area = /area/maintenance/firstdeck/centralstarboard
	base_turf = /turf/simulated/floor/airless

/obj/effect/shuttle_landmark/southern_cross/large_escape_pod4/offsite
	name = "Recovery"
	landmark_tag = "large_escape_pod4_offsite"
	docking_controller = "large_escape_pod_4_recovery"

/obj/effect/shuttle_landmark/southern_cross/large_escape_pod4/transit
	landmark_tag = "large_escape_pod4_transit"
	flags = SLANDMARK_FLAG_AUTOSET
// Destination datums
