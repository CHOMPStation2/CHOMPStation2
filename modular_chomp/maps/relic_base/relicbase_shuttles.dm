// "Tram" Emergency Shuttler
// Becuase the tram only has its own doors and no corresponding station doors, a docking controller is overkill.
// Just open the gosh darn doors!  Also we avoid having a physical docking controller obj for gameplay reasons.
/datum/shuttle/autodock/ferry/emergency/centcom
	var/tag_door_station = "escape_shuttle_hatch"
	var/tag_door_offsite = "escape_shuttle_hatch"
	move_direction = NORTH
	var/base_turf = /turf/simulated/floor/reinforced

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
	move_direction = NORTH
	shuttle_area = /area/shuttle/arrival/pre_game
	var/base_turf = /turf/simulated/floor/reinforced
	landmark_offsite = "arrivals_offsite"
	landmark_station = "arrivals_station"
	docking_controller_tag = "arrivals_shuttle"
	move_time = SHUTTLE_TRANSIT_DURATION_RETURN


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
