// Merc shuttles
/obj/machinery/computer/shuttle_control/multi/syndicate
	name = "mercenary shuttle control console"
	req_access = list(access_syndicate)
	shuttle_tag = "Mercenary Ship"

/datum/shuttle/autodock/multi/syndicate
	name = "Mercenary Ship"
	warmup_time = 0
	can_cloak = TRUE
	cloaked = TRUE
	shuttle_area = /area/shuttle/syndicate
	current_location = "syndie_start"
	docking_controller_tag = "merc_shuttle"
	destination_tags = list(
		"syndie_start",
		"d1_aux_c",
		"d2_w3_e",
		"d1_near_ne",
		"d1_near_nw",
		"d1_near_se",
		"d1_near_sw",
		"d2_near_ne",
		"d2_near_nw",
		"d2_near_se",
		"d2_near_sw",
		"d3_near_w"
	)
