/obj/machinery/computer/shuttle_control/multi/heist
	name = "skipjack control console"
	req_access = list(access_syndicate)
	shuttle_tag = "Skipjack"

/datum/shuttle/autodock/multi/heist
	name = "Skipjack"
	warmup_time = 0
	can_cloak = TRUE
	cloaked = TRUE
	shuttle_area = /area/shuttle/skipjack
	current_location = "skipjack_start"
	docking_controller_tag = "skipjack_shuttle"
	move_direction = NORTH
	destination_tags = list(
		"skipjack_start",
		"d1_aux_b",
		"d1_aux_c",
		"d2_w1_e",
		"d2_w2_e",
		"d2_w3_e"
	)