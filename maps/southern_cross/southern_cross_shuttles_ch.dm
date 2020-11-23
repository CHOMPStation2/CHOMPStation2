
//Casino
/datum/shuttle/autodock/multi/casino
	name = "Casino Ferry"
	current_location = "casino_ship"
	warmup_time = 10
	shuttle_area = /area/shuttle/casino
	docking_controller_tag = "casino_shuttle"
	destination_tags = list(
		"casino_ship",
		"d1_aux_b",
		"d1_aux_c",
		"d2_w1_e",
		"d2_w2_e",
		"d2_w3_e"
	)
	announcer = "Automated Traffic Control"
	arrival_message = "Attention. The Casino Ferry has docked with the station."
	departure_message = "Attention. The Casino Ferry has departed from the station."
	move_direction = WEST

/obj/effect/shuttle_landmark/southern_cross/casino_offsite
	name = "Casino Ship"
	landmark_tag = "casino_ship"
	docking_controller = "casino_shuttle_bay"
	base_area = /area/space
	base_turf = /turf/space
	shuttle_restricted = "Casino Ferry"

/*
/obj/effect/shuttle_landmark/southern_cross/casino_station
	name = "Casino Station"
	landmark_tag = "casino_station"
	docking_controller = "casino_shuttle_dock_airlock"
*/

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