
// Cargo shuttle.
/datum/shuttle/autodock/ferry/supply/cargo
	landmark_offsite = "supply_offsite"

/obj/effect/shuttle_landmark/southern_cross/supply_offsite
	name = "Centcom Supply Depot"
	landmark_tag = "supply_offsite"
	base_area = /area/centcom/command
	base_turf = /turf/simulated/floor/plating

/obj/effect/shuttle_landmark/southern_cross/supply_station
	name = "Station"
	landmark_tag = "supply_station"
	docking_controller = "cargo_bay"

//Admin
/obj/machinery/computer/shuttle_control/multi/administration
	name = "shuttle control console"
	req_access = list(access_cent_general)
	shuttle_tag = "Administration Shuttle"

/datum/shuttle/autodock/multi/administration
	name = "Administration Shuttle"
	current_location = "admin_offsite"
	warmup_time = 0
	shuttle_area = /area/shuttle/administration
	docking_controller_tag = "admin_shuttle"
	move_direction = EAST
	destination_tags = list(
		"admin_offsite",
		"d1_aux_b",
		"d1_aux_c",
		"d2_w1_e",
		"d2_w2_e",
		"d2_w3_e"
	)

/obj/effect/shuttle_landmark/southern_cross/admin_offsite
	name = "Centcom"
	landmark_tag = "admin_offsite"
	docking_controller = "admin_shuttle_bay"
	base_area = /area/centcom/command
	base_turf = /turf/unsimulated/floor

//Transport

/obj/machinery/computer/shuttle_control/multi/centcom
	name = "shuttle control console"
	req_access = list(access_cent_general)
	shuttle_tag = "Centcom Transport Shuttle"

/datum/shuttle/autodock/multi/centcom
	name = "Centcom Transport Shuttle"
	current_location = "transport1_offsite"
	warmup_time = 0
	shuttle_area = /area/shuttle/transport1
	docking_controller_tag = "centcom_shuttle"
	move_direction = EAST
	destination_tags = list(
		"transport1_offsite",
		"d1_aux_d",
		"d2_w3_a",
		"d2_w3_c"
	)

/obj/effect/shuttle_landmark/southern_cross/transport1_offsite
	name = "Centcom"
	landmark_tag = "transport1_offsite"
	docking_controller = "centcom_shuttle_bay"
	base_area = /area/centcom/command
	base_turf = /turf/unsimulated/floor

//Trade Ship

/obj/machinery/computer/shuttle_control/multi/merchant
	name = "merchant shuttle control console"
	icon_keyboard = "power_key"
	icon_screen = "shuttle"
	shuttle_tag = "Merchant"

/datum/shuttle/autodock/multi/merchant
	name = "Merchant"
	current_location = "merchant_offsite"
	warmup_time = 0
	shuttle_area = /area/shuttle/merchant
	docking_controller_tag = "trade_shuttle"
	move_direction = WEST
	destination_tags = list(
		"merchant_offsite",
		"d1_aux_b",
		"d1_aux_c",
		"d2_w1_e",
		"d2_w2_e",
		"d2_w3_e"
	)

/obj/effect/shuttle_landmark/southern_cross/merchant_offsite
	name = "Trade Station"
	landmark_tag = "merchant_offsite"
	docking_controller = "trade_shuttle_bay"
	base_area = /area/space
	base_turf = /turf/space

/datum/shuttle/autodock/ferry/emergency/centcom
	name = "Escape"
	location = FERRY_LOCATION_OFFSITE
	warmup_time = 10
	shuttle_area = /area/shuttle/escape/centcom
	landmark_offsite = "escape_offsite"
	landmark_station = "escape_station"
	landmark_transition = "escape_transit"
	docking_controller_tag = "escape_shuttle"
	move_time = SHUTTLE_TRANSIT_DURATION_RETURN

/obj/effect/shuttle_landmark/southern_cross/escape/offsite
	name = "Centcom"
	landmark_tag = "escape_offsite"
	docking_controller = "centcom_dock"
	base_area = /area/space
	base_turf = /turf/space

/datum/shuttle/autodock/ferry/arrivals/relicbase

/datum/shuttle/autodock/ferry/arrivals/southern_cross

/obj/machinery/computer/shuttle_control/arrivalstram
	name = "Arrivals Tram Control Console"
	shuttle_tag = "Arrivals"
