/*
/datum/shuttle/multi_shuttle/mercenary
	name = "Mercenary"
	warmup_time = 0
	can_cloak = TRUE
	cloaked = TRUE
	origin = /area/syndicate_station/start
	interim = /area/syndicate_station/transit
	start_location = "Mercenary Ship"
	destinations = list(
		"Northwest of First Deck" = /area/syndicate_station/firstdeck,
		"Northeast of the Second deck" = /area/syndicate_station/seconddeck,
		"Southeast of Third deck" = /area/syndicate_station/thirddeck,
		"Planetside" = /area/syndicate_station/planet,
		"Docking Port" = /area/syndicate_station/arrivals_dock,
		)
	docking_controller_tag = "merc_shuttle"
	destination_dock_targets = list(
		"Forward Operating Base" = "merc_base",
		"Docking Port" = "nuke_shuttle_dock_airlock",
		)
	announcer = "Southern Cross Docking Computer"

/datum/shuttle/multi_shuttle/mercenary/New()
	arrival_message = "Attention, vessel docking with the Southern Cross."
	departure_message = "Attention, vessel docking with the Southern Cross."
	..()
*/

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