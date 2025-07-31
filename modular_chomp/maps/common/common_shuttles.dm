
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

/datum/shuttle/autodock/ferry/emergency
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

/datum/shuttle/autodock/ferry/arrivals/southern_cross
	shuttle_area = /area/shuttle/arrival/pre_game
	landmark_offsite = "arrivals_offsite"
	landmark_station = "arrivals_station"
	docking_controller_tag = "arrivals_shuttle"

/obj/effect/shuttle_landmark/southern_cross/arrivals_offsite
	name = "Transit to Station"
	landmark_tag = "arrivals_offsite"
	base_area = /area/space
	base_turf = /turf/space

/obj/effect/shuttle_landmark/southern_cross/arrivals_station
	name = "SC Dock 2-C/D"
	landmark_tag = "arrivals_station"
	docking_controller = "arrivals_dock"

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


//Escape Pods

/obj/effect/shuttle_landmark/southern_cross/escape/station
	name = "Station Escape Dock"
	landmark_tag = "escape_station"
	docking_controller = "escape_dock"

/obj/effect/shuttle_landmark/southern_cross/escape/transit
	landmark_tag = "escape_transit"

// Escape Pods - Save me from typing this eight billion times
#define ESCAPE_POD(NUMBER) \
/obj/effect/shuttle_landmark/southern_cross/escape_pod##NUMBER/station { \
	name = "Station"; \
	landmark_tag = "escape_pod_"+ #NUMBER +"_station"; \
	docking_controller = "escape_pod_"+ #NUMBER +"_berth"; \
	base_area = /area/space; \
	base_turf = /turf/simulated/floor/airless; \
} \
/obj/effect/shuttle_landmark/southern_cross/escape_pod##NUMBER/offsite { \
	name = "Recovery"; \
	landmark_tag = "escape_pod_"+ #NUMBER +"_offsite"; \
	docking_controller = "escape_pod_"+ #NUMBER +"_recovery"; \
} \
/obj/effect/shuttle_landmark/southern_cross/escape_pod##NUMBER/transit { \
	landmark_tag = "escape_pod_"+ #NUMBER +"_transit"; \
	flags = SLANDMARK_FLAG_AUTOSET; \
}

ESCAPE_POD(1)
ESCAPE_POD(2)
ESCAPE_POD(3)
ESCAPE_POD(4)
ESCAPE_POD(5)
ESCAPE_POD(6)
ESCAPE_POD(7)
ESCAPE_POD(8)
ESCAPE_POD(9)
ESCAPE_POD(10)
ESCAPE_POD(11)
ESCAPE_POD(12)
ESCAPE_POD(13)
ESCAPE_POD(14)

#undef ESCAPE_POD

// Cryostorage Escape Pod
/datum/shuttle/autodock/ferry/escape_pod/escape_pod_cryo
	name = "Cryostorage Shuttle"
	location = FERRY_LOCATION_STATION
	warmup_time = 0
	shuttle_area = /area/shuttle/cryo/station
	landmark_station = "cryostorage_station"
	landmark_offsite = "cryostorage_offsite"
	landmark_transition = "cryostorage_transit"
	docking_controller_tag = "cryostorage_shuttle"
	move_time = SHUTTLE_TRANSIT_DURATION_RETURN

/obj/effect/shuttle_landmark/southern_cross/cryostorage_station
	name = "Station Cryostorage Dock"
	landmark_tag = "cryostorage_station"
	docking_controller = "cryostorage_shuttle_berth"
	base_area = /area/space
	base_turf = /turf/simulated/floor/airless

/obj/effect/shuttle_landmark/southern_cross/cryostorage_offsite
	name = "Recovery"
	landmark_tag = "cryostorage_offsite"
	docking_controller = "cryostorage_shuttle_recovery"

/obj/effect/shuttle_landmark/southern_cross/cryostorage_transit
	landmark_tag = "cryostorage_transit"
	flags = SLANDMARK_FLAG_AUTOSET

// Large Escape Pod 1
/datum/shuttle/autodock/ferry/escape_pod/large_escape_pod1
	name = "Large Escape Pod 1"
	location = FERRY_LOCATION_STATION
	warmup_time = 0
	shuttle_area = /area/shuttle/large_escape_pod1/station
	landmark_station = "large_escape_pod1_station"
	landmark_offsite = "large_escape_pod1_offsite"
	landmark_transition = "large_escape_pod1_transit"
	docking_controller_tag = "large_escape_pod_1"
	move_time = SHUTTLE_TRANSIT_DURATION_RETURN

/obj/effect/shuttle_landmark/southern_cross/large_escape_pod1/station
	name = "Station"
	landmark_tag = "large_escape_pod1_station"
	docking_controller = "large_escape_pod_1_berth"
	base_area = /area/maintenance/firstdeck/centralstarboard
	base_turf = /turf/simulated/floor/airless

/obj/effect/shuttle_landmark/southern_cross/large_escape_pod1/offsite
	name = "Recovery"
	landmark_tag = "large_escape_pod1_offsite"
	docking_controller = "large_escape_pod_1_recovery"

/obj/effect/shuttle_landmark/southern_cross/large_escape_pod1/transit
	landmark_tag = "large_escape_pod1_transit"
	flags = SLANDMARK_FLAG_AUTOSET

// Large Escape Pod 2
/datum/shuttle/autodock/ferry/escape_pod/large_escape_pod2
	name = "Large Escape Pod 2"
	location = FERRY_LOCATION_STATION
	warmup_time = 0
	shuttle_area = /area/shuttle/large_escape_pod2/station
	landmark_station = "large_escape_pod2_station"
	landmark_offsite = "large_escape_pod2_offsite"
	landmark_transition = "large_escape_pod2_transit"
	docking_controller_tag = "large_escape_pod_2"
	move_time = SHUTTLE_TRANSIT_DURATION_RETURN

/obj/effect/shuttle_landmark/southern_cross/large_escape_pod2/station
	name = "Station"
	landmark_tag = "large_escape_pod2_station"
	docking_controller = "large_escape_pod_2_berth"
	base_area = /area/maintenance/firstdeck/centralport
	base_turf = /turf/simulated/floor/airless

/obj/effect/shuttle_landmark/southern_cross/large_escape_pod2/offsite
	name = "Recovery"
	landmark_tag = "large_escape_pod2_offsite"
	docking_controller = "large_escape_pod_2_recovery"

/obj/effect/shuttle_landmark/southern_cross/large_escape_pod2/transit
	landmark_tag = "large_escape_pod2_transit"
	flags = SLANDMARK_FLAG_AUTOSET

/obj/effect/shuttle_landmark/southern_cross/large_escape_pod3/station
	name = "Station"
	landmark_tag = "large_escape_pod3_station"
	docking_controller = "large_escape_pod_3_berth"
	base_area = /area/maintenance/firstdeck/centralstarboard
	base_turf = /turf/simulated/floor/airless

/obj/effect/shuttle_landmark/southern_cross/large_escape_pod3/offsite
	name = "Recovery"
	landmark_tag = "large_escape_pod3_offsite"
	docking_controller = "large_escape_pod_3_recovery"

/obj/effect/shuttle_landmark/southern_cross/large_escape_pod3/transit
	landmark_tag = "large_escape_pod3_transit"
	flags = SLANDMARK_FLAG_AUTOSET

/obj/effect/shuttle_landmark/southern_cross/large_escape_pod4/station
	name = "Station"
	landmark_tag = "large_escape_pod4_station"
	docking_controller = "large_escape_pod_4_berth"
	base_area = /area/maintenance/firstdeck/centralstarboard
	base_turf = /turf/simulated/floor/airless

/obj/effect/shuttle_landmark/southern_cross/large_escape_pod4/offsite
	name = "Recovery"
	landmark_tag = "large_escape_pod4_offsite"
	docking_controller = "large_escape_pod_4_recovery"

/obj/effect/shuttle_landmark/southern_cross/large_escape_pod4/transit
	landmark_tag = "large_escape_pod4_transit"
	flags = SLANDMARK_FLAG_AUTOSET

// Arrivals ''''Shuttle''''
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

/obj/effect/shuttle_landmark/relicbase/escape/offsite
	base_turf = /turf/simulated/floor/tiled/techfloor/grid

/obj/effect/shuttle_landmark/relicbase/escape/station
	name = "Relic Base Departures Station"
	landmark_tag = "escape_station"
	docking_controller = "escape_dock"

/obj/effect/shuttle_landmark/relicbase/escape/transit
	landmark_tag = "escape_transit"

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
