
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

//Carrier Docks
/obj/effect/shuttle_landmark/southern_cross/carrier
	name = "Carrier Dock"
	base_turf = /turf/simulated/floor/reinforced

/obj/effect/shuttle_landmark/southern_cross/carrier/hangar_one
	name = "Exploration Carrier Hangar One"
	landmark_tag = "exphangar_1"
	docking_controller = "exphangar_1"
	base_area = /area/expoutpost/hangarone

/obj/effect/shuttle_landmark/southern_cross/carrier/baby_mammoth_dock
	name = "Baby Mammoth Dock"
	landmark_tag = "baby_mammoth_dock"
	docking_controller = "baby_mammoth_dock"
	base_area = /area/expoutpost/hangartwo

/obj/effect/shuttle_landmark/southern_cross/carrier/ursula_dock
	name = "Ursula Dock"
	landmark_tag = "ursula_dock"
	docking_controller = "ursula_dock"
	base_area = /area/expoutpost/hangarthree

/obj/effect/shuttle_landmark/southern_cross/carrier/stargazer_dock
	name = "Stargazer Dock"
	landmark_tag = "stargazer_dock"
	docking_controller = "stargazer_dock"
	base_area = /area/expoutpost/hangarfour

/obj/effect/shuttle_landmark/southern_cross/carrier/needle_dock
	name = "Needle Dock"
	landmark_tag = "needle_dock"
	docking_controller = "needle_dock"
	base_area = /area/expoutpost/hangarfive

/obj/effect/shuttle_landmark/southern_cross/carrier/echidna_dock
	name = "Echidna Dock"
	landmark_tag = "echidna_dock"
	docking_controller = "echidna_dock"
	base_area = /area/expoutpost/hangarsix

/obj/effect/shuttle_landmark/southern_cross/carrier/port_dock
	name = "Carrier Port Dock"
	landmark_tag = "carrier_port_dock"
	base_area = /area/space
	base_turf = /turf/space

/obj/effect/shuttle_landmark/southern_cross/carrier/starboard_dock
	name = "Carrier Starboard Dock"
	landmark_tag = "carrier_starboard_dock"
	base_area = /area/space
	base_turf = /turf/space
