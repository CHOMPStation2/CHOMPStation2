/obj/machinery/computer/shuttle_control/multi/ninja
	name = "stealth shuttle control console"
	req_access = list(access_syndicate)
	shuttle_tag = "Ninja Shuttle"

/datum/shuttle/autodock/multi/ninja
	name = "Ninja Shuttle"
	warmup_time = 0
	can_cloak = TRUE
	cloaked = TRUE
	shuttle_area = /area/shuttle/ninja
	current_location = "ninja_start"
	docking_controller_tag = "ninja_shuttle"
	move_direction = SOUTH
	destination_tags = list(
		"ninja_start",
		"d1_aux_d",
		"d2_w3_a",
		"d2_w3_c",
		"d1_near_ne",
		"d1_near_nw",
		"d1_near_se",
		"d1_near_sw",
		"d2_near_ne",
		"d2_near_nw",
		"d2_near_se",
		"d2_near_sw",
		"d3_near_w",
		"d3_near_se",
	)