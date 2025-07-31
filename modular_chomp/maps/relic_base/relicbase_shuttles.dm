// "Tram" Emergency Shuttler
// Becuase the tram only has its own doors and no corresponding station doors, a docking controller is overkill.
// Just open the gosh darn doors!  Also we avoid having a physical docking controller obj for gameplay reasons.
/datum/shuttle/autodock/ferry/emergency
	var/tag_door_station = "escape_shuttle_hatch"
	var/tag_door_offsite = "escape_shuttle_hatch"
	move_direction = NORTH
	var/base_turf = /turf/simulated/floor/reinforced

/datum/shuttle/autodock/ferry/emergency/dock()
	..()
	// Open Doorsunes
	var/datum/signal/signal = new
	signal.data["tag"] = location ? tag_door_offsite : tag_door_station
	signal.data["command"] = "secure_open"
	post_signal(signal)

/datum/shuttle/autodock/ferry/emergency/undock()
	..()
	// Close Doorsunes
	var/datum/signal/signal = new
	signal.data["tag"] = location ? tag_door_offsite : tag_door_station
	signal.data["command"] = "secure_close"
	post_signal(signal)

/datum/shuttle/autodock/ferry/emergency/proc/post_signal(datum/signal/signal, var/filter = null)
	signal.transmission_method = TRANSMISSION_RADIO
	if(radio_connection)
		return radio_connection.post_signal(src, signal, filter)
	else
		qdel(signal)

/datum/shuttle/autodock/ferry/mining
	name = "Mining"
	warmup_time = 10
	location = FERRY_LOCATION_STATION
	shuttle_area = /area/shuttle/minoutpost/base
	landmark_offsite = "mining_undermines"
	landmark_station = "mining_base"
	docking_controller_tag = "car_mining"

/datum/shuttle/autodock/ferry/research
	name = "Research"
	warmup_time = 10
	location = FERRY_LOCATION_STATION
	shuttle_area = /area/shuttle/research/station
	landmark_offsite = "rsr_undermines"
	landmark_station = "rsr_base"
	docking_controller_tag = "rsr_elevator"
