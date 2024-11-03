// Cargo shuttle.
/datum/shuttle/autodock/ferry/supply/cargo
	name = "Supply"
	location = FERRY_LOCATION_OFFSITE
	warmup_time = 10
	shuttle_area = /area/shuttle/supply
	landmark_offsite = "supply_offsite"
	landmark_station = "supply_station"
	docking_controller_tag = "supply_shuttle"
	flags = SHUTTLE_FLAGS_PROCESS|SHUTTLE_FLAGS_SUPPLY

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


//Merc

//Skipjack
/*
/obj/machinery/computer/shuttle_control/multi/skipjack
	name = "skipjack control console"
	req_access = list(access_syndicate)
	shuttle_tag = "Skipjack"



/datum/shuttle/multi_shuttle/skipjack/New()
	arrival_message = "Attention.  Unidentified object approaching the station."
	departure_message = "Attention.  Unidentified object exiting local space.  Unidentified object expected to escape Kara gravity well with current velocity."
	..()
*/



//Ninja Shuttle.

/*
/obj/machinery/computer/shuttle_control/multi/ninja
	name = "stealth shuttle control console"
	req_access = list(access_syndicate)
	shuttle_tag = "Ninja"

/datum/shuttle/multi_shuttle/ninja
	name = "Ninja"
	warmup_time = 0
	origin = /area/ninja_dojo/start
	interim = /area/ninja_dojo/transit
	start_location = "Clan Dojo"
	destinations = list(
		"South of First Deck" = /area/ninja_dojo/firstdeck,
		"North of Second Deck" = /area/ninja_dojo/seconddeck,
		"East of Third Deck" = /area/ninja_dojo/thirddeck,
		"Planet Outposts" = /area/ninja_dojo/planet,
		"Docking Port" = /area/ninja_dojo/arrivals_dock,
		)
	docking_controller_tag = "ninja_shuttle"
	destination_dock_targets = list(
		"Dojo Outpost" = "ninja_base",
		"Docking Port" = "ninja_shuttle_dock_airlock",
		)
	announcer = "Southern Cross Sensor Array"
	arrival_message = "Attention, anomalous sensor reading detected entering station proximity."
	departure_message = "Attention, anomalous sensor reading detected leaving station proximity."
*/





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

/obj/effect/shuttle_landmark/relicbase/merchant_offsite
	name = "Trade Station"
	landmark_tag = "merchant_offsite"
	docking_controller = "trade_shuttle_bay"
	base_area = /area/space
	base_turf = /turf/space

// "Tram" Emergency Shuttler
// Becuase the tram only has its own doors and no corresponding station doors, a docking controller is overkill.
// Just open the gosh darn doors!  Also we avoid having a physical docking controller obj for gameplay reasons.
/datum/shuttle/autodock/ferry/emergency/centcom
	var/tag_door_station = "escape_shuttle_hatch"
	var/tag_door_offsite = "escape_shuttle_hatch"
	var/frequency = 1380 // Why this frequency? BECAUSE! Thats what someone decided once.
	var/datum/radio_frequency/radio_connection
	move_direction = NORTH
	name = "Escape"
	shuttle_area = /area/shuttle/escape/centcom
	var/base_turf = /turf/simulated/floor/reinforced


/datum/shuttle/autodock/ferry/emergency/centcom/New()
	radio_connection = radio_controller.add_object(src, frequency, null)
	..()

/datum/shuttle/autodock/ferry/emergency/centcom/dock()
	..()
	// Open Doorsunes
	var/datum/signal/signal = new
	signal.data["tag"] = location ? tag_door_offsite : tag_door_station
	signal.data["command"] = "secure_open"
	post_signal(signal)

/datum/shuttle/autodock/ferry/emergency/centcom/undock()
	..()
	// Close Doorsunes
	var/datum/signal/signal = new
	signal.data["tag"] = location ? tag_door_offsite : tag_door_station
	signal.data["command"] = "secure_close"
	post_signal(signal)

/datum/shuttle/autodock/ferry/emergency/centcom/proc/post_signal(datum/signal/signal, var/filter = null)
	signal.transmission_method = TRANSMISSION_RADIO
	if(radio_connection)
		return radio_connection.post_signal(src, signal, filter)
	else
		qdel(signal)

/datum/shuttle/autodock/ferry/arrivals/relicbase
	var/tag_door_station = "arrivals_shuttle_hatch"
	var/tag_door_offsite = "arrivals_shuttle_hatch"
	var/frequency = 1380
	var/datum/radio_frequency/radio_connection
	move_direction = NORTH
	name = "Arrivals"
	location = FERRY_LOCATION_OFFSITE
	shuttle_area = /area/shuttle/arrival/pre_game
	var/base_turf = /turf/simulated/floor/reinforced


/datum/shuttle/autodock/ferry/arrivals/relicbase/New()
	radio_connection = radio_controller.add_object(src, frequency, null)
	..()

/datum/shuttle/autodock/ferry/arrivals/relicbase/dock()
	..()
	// Open Doorsunes
	var/datum/signal/signal = new
	signal.data["tag"] = location ? tag_door_offsite : tag_door_station
	signal.data["command"] = "secure_open"
	post_signal(signal)

/datum/shuttle/autodock/ferry/arrivals/relicbase/undock()
	..()
	// Close Doorsunes
	var/datum/signal/signal = new
	signal.data["tag"] = location ? tag_door_offsite : tag_door_station
	signal.data["command"] = "secure_close"
	post_signal(signal)

/datum/shuttle/autodock/ferry/arrivals/relicbase/proc/post_signal(datum/signal/signal, var/filter = null)
	signal.transmission_method = TRANSMISSION_RADIO
	if(radio_connection)
		return radio_connection.post_signal(src, signal, filter)
	else
		qdel(signal)

/obj/machinery/computer/shuttle_control/arrivalstram
	name = "Arrivals Tram Control Console"
	shuttle_tag = "Arrivals"

// Arrivals ''''Shuttle''''
/datum/shuttle/autodock/ferry/arrivals/relicbase
	name = "Arrivals"
	location = FERRY_LOCATION_OFFSITE
	shuttle_area = /area/shuttle/arrival/pre_game
	landmark_offsite = "arrivals_offsite"
	landmark_station = "arrivals_station"
	docking_controller_tag = "arrivals_shuttle"
	move_time = SHUTTLE_TRANSIT_DURATION_RETURN

/obj/effect/shuttle_landmark/relicbase/arrivals/offsite
	name = "Transit to Station"
	landmark_tag = "arrivals_offsite"
	base_area = /area/space
	base_turf = /turf/simulated/floor/tiled/techfloor/grid

/obj/effect/shuttle_landmark/relicbase/arrivals/station
	name = "Relic Base Arrivals Station"
	landmark_tag = "arrivals_station"
	docking_controller = "arrivals_dock"

//Escape ''''Shuttle''''

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

/obj/effect/shuttle_landmark/relicbase/escape/offsite
	name = "Centcom"
	landmark_tag = "escape_offsite"
	docking_controller = "centcom_dock"
	base_area = /area/space
	base_turf = /turf/simulated/floor/tiled/techfloor/grid

/obj/effect/shuttle_landmark/relicbase/escape/station
	name = "Relic Base Departures Station"
	landmark_tag = "escape_station"
	docking_controller = "escape_dock"

/obj/effect/shuttle_landmark/relicbase/escape/transit
	landmark_tag = "escape_transit"

//mining elevator
/obj/machinery/computer/shuttle_control/exploration
	name = "Exploration Sling Control Console"
	shuttle_tag = "Exploration"

/datum/shuttle/autodock/ferry/mining
	name = "Mining"
	warmup_time = 10
	location = FERRY_LOCATION_STATION
	shuttle_area = /area/shuttle/minoutpost/base
	landmark_offsite = "mining_undermines"
	landmark_station = "mining_base"
	docking_controller_tag = "car_mining"

/obj/effect/shuttle_landmark/relicbase/mining_base
	name = "Mining Elevator Base"
	landmark_tag = "mining_base"
	docking_controller = "car_mining_base"
	base_area = /area/space
	base_turf = /turf/simulated/floor/reinforced

/obj/effect/shuttle_landmark/relicbase/mining_undermines
	name = "Mining Elevator Mines"
	landmark_tag = "mining_undermines"
	docking_controller = "car_mining_undermines"

/datum/shuttle/autodock/ferry/research
	name = "Research"
	warmup_time = 10
	location = FERRY_LOCATION_STATION
	shuttle_area = /area/shuttle/research/station
	landmark_offsite = "rsr_undermines"
	landmark_station = "rsr_base"
	docking_controller_tag = "rsr_elevator"

/obj/effect/shuttle_landmark/relicbase/research
	name = "Research Elevator Base"
	landmark_tag = "rsr_base"
	docking_controller = "rsr_base"
	base_area = /area/space
	base_turf = /turf/simulated/floor/reinforced

/obj/effect/shuttle_landmark/relicbase/research_undermines
	name = "Research Elevator Mines"
	landmark_tag = "rsr_undermines"
	docking_controller = "rsr_undermines"


// Mercenary Shuttle


// Ninja shuttle
/*
/datum/shuttle/multi_shuttle/skipjack
	name = "Skipjack"
	warmup_time = 0
	can_cloak = TRUE
	cloaked = TRUE
	origin = /area/skipjack_station/start
	interim = /area/skipjack_station/transit
	destinations = list(
		"North of First deck" = /area/skipjack_station/firstdeck,
		"West of Second deck" = /area/skipjack_station/seconddeck,
		"East of Third deck" = /area/skipjack_station/thirddeck,
		"Planet" = /area/skipjack_station/planet,
		"Docking Port" = /area/skipjack_station/arrivals_dock,
		)
	docking_controller_tag = "skipjack_shuttle"
	destination_dock_targets = list(
		"Raider Outpost" = "skipjack_base",
		"Docking Port" = "skipjack_shuttle_dock_airlock",
		)
	announcer = "Automated Traffic Control"
*/



// Heist shuttle
