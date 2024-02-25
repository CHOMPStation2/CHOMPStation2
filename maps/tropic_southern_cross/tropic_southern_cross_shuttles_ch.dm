
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

/area/shuttle/expoutpost/deepelevator_a

/area/shuttle/expoutpost/deepelevator_b

/area/shuttle/expoutpost/deepelevator_c

/area/shuttle/expoutpost/deepelevator_a/surface

/area/shuttle/expoutpost/deepelevator_b/surface

/area/shuttle/expoutpost/deepelevator_c/surface

/area/shuttle/expoutpost/deepelevator_a/underground

/area/shuttle/expoutpost/deepelevator_b/underground

/area/shuttle/expoutpost/deepelevator_c/underground

/area/surface/outpost/deep_elevator_A

/area/surface/outpost/deep_elevator_B

/area/surface/outpost/deep_elevator_C

/obj/machinery/computer/shuttle_control/deep_elevator_A
	name = "Deep Elevator Control Console"
	shuttle_tag = "Deep_Elevator_A"

/datum/shuttle/autodock/ferry/deep_elevator_A
	name = "Exploration"
	warmup_time = 10
	location = FERRY_LOCATION_STATION
	shuttle_area = /area/shuttle/expoutpost/deepelevator_a/surface
	landmark_offsite = "elevator_A_underground"
	landmark_station = "elevator_A_surface"
	docking_controller_tag = "Deep_Elevator_A"

/obj/effect/shuttle_landmark/southern_cross/deep_elevator_A_surface
	name = "Sling Station"
	landmark_tag = "elevator_A_surface"
	docking_controller = "Deep_Elevator_A"
	base_area = /area/surface/outpost/deep_elevator_A
	base_turf = /turf/simulated/floor/reinforced

/obj/effect/shuttle_landmark/southern_cross/deep_elevator_A_underground
	name = "Sling Carrier"
	landmark_tag = "elevator_A_underground"
	docking_controller = "Deep_Elevator_A"



/obj/machinery/computer/shuttle_control/deep_elevator_B
	name = "Deep Elevator Control Console"
	shuttle_tag = "Deep_Elevator_A"

/datum/shuttle/autodock/ferry/deep_elevator_B
	name = "Exploration"
	warmup_time = 10
	location = FERRY_LOCATION_STATION
	shuttle_area = /area/shuttle/expoutpost/deepelevator_b/surface
	landmark_offsite = "elevator_B_underground"
	landmark_station = "elevator_B_surface"
	docking_controller_tag = "Deep_Elevator_B"

/obj/effect/shuttle_landmark/southern_cross/deep_elevator_B_surface
	name = "Sling Station"
	landmark_tag = "elevator_A_surface"
	docking_controller = "Deep_Elevator_A"
	base_area = /area/surface/outpost/deep_elevator_B
	base_turf = /turf/simulated/floor/reinforced

/obj/effect/shuttle_landmark/southern_cross/deep_elevator_B_underground
	name = "Sling Carrier"
	landmark_tag = "elevator_B_underground"
	docking_controller = "Deep_Elevator_B"



/obj/machinery/computer/shuttle_control/deep_elevator_C
	name = "Deep Elevator Control Console"
	shuttle_tag = "Deep_Elevator_C"

/datum/shuttle/autodock/ferry/deep_elevator_C
	name = "Exploration"
	warmup_time = 10
	location = FERRY_LOCATION_STATION
	shuttle_area = /area/shuttle/expoutpost/deepelevator_c/surface
	landmark_offsite = "elevator_A_underground"
	landmark_station = "elevator_A_surface"
	docking_controller_tag = "Deep_Elevator_A"

/obj/effect/shuttle_landmark/southern_cross/deep_elevator_C_surface
	name = "Sling Station"
	landmark_tag = "elevator_C_surface"
	docking_controller = "Deep_Elevator_C"
	base_area = /area/surface/outpost/deep_elevator_C
	base_turf = /turf/simulated/floor/reinforced

/obj/effect/shuttle_landmark/southern_cross/deep_elevator_C_underground
	name = "Sling Carrier"
	landmark_tag = "elevator_C_underground"
	docking_controller = "Deep_Elevator_C"