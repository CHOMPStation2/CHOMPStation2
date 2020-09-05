/obj/machinery/computer/shuttle_control/multi/ert
	name = "response shuttle control console"
	req_access = list(access_cent_specops)
	shuttle_tag = "Response Operations Shuttle"

/datum/shuttle/autodock/multi/ert
	name = "Response Operations Shuttle"
	warmup_time = 0
	can_cloak = TRUE
	cloaked = FALSE
	shuttle_area = /area/shuttle/response_ship
	current_location = "response_ship_start"
	docking_controller_tag = "response_shuttle"
	destination_tags = list(
		"response_ship_start",
		"d1_aux_a",
		"d2_w1_a",
		"d2_w1_c"
	)