
//Casino
/datum/shuttle/autodock/ferry/casino
	name = "Casino"
	location = FERRY_LOCATION_OFFSITE
	warmup_time = 10
	shuttle_area = /area/shuttle/casino/ship
	landmark_offsite = "casino_offsite"
	landmark_station = "casino_station"
	docking_controller_tag = "casino_shuttle"

/obj/effect/shuttle_landmark/southern_cross/casino_offsite
	name = "Casino Ship"
	landmark_tag = "casino_offsite"
	docking_controller = "casino_shuttle_bay"
	base_area = /area/space
	base_turf = /turf/space

/obj/effect/shuttle_landmark/southern_cross/casino_station
	name = "Casino Station"
	landmark_tag = "casino_station"
	docking_controller = "casino_shuttle_dock_airlock"

//Exploration carrier
/obj/machinery/computer/shuttle_control/exploration
	name = "Exploration Sling Control Console"
	shuttle_tag = "Exploration"

/datum/shuttle/autodock/ferry/exploration
	name = "Exploration"
	warmup_time = 10
	location = FERRY_LOCATION_STATION
	shuttle_area = /area/shuttle/expoutpost/station
	landmark_offsite = "sling_outpost"
	landmark_station = "sling_station"
	docking_controller_tag = "exp_sling"

/obj/effect/shuttle_landmark/southern_cross/sling_station
	name = "Sling Station"
	landmark_tag = "sling_station"
	docking_controller = "exp_sling_station"
	base_area = /area/space
	base_turf = /turf/simulated/floor/reinforced/airless

/obj/effect/shuttle_landmark/southern_cross/sling_outpost
	name = "Sling Carrier"
	landmark_tag = "sling_outpost"
	docking_controller = "exp_sling_outpost"