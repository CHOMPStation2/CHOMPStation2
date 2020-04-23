////////////////////////////////////////
//////// Excursion Shuttle /////////////
////////////////////////////////////////
// The 'shuttle' of the excursion shuttle
/datum/shuttle/autodock/overmap/excursion
	name = "Excursion Shuttle"
	warmup_time = 0
	current_location = "cryogaia_excursion_hangar"
	docking_controller_tag = "expshuttle_docker"
	shuttle_area = list(/area/shuttle/excursion)
	fuel_consumption = 3

// The 'ship' of the excursion shuttle
/obj/effect/overmap/visitable/ship/landable/excursion
	name = "Excursion Shuttle"
	desc = "The traditional Excursion Shuttle. NT Approved!"
	vessel_mass = 10000
	vessel_size = SHIP_SIZE_SMALL
	shuttle = "Excursion Shuttle"

/obj/machinery/computer/shuttle_control/explore/excursion
	name = "short jump console"
	shuttle_tag = "Excursion Shuttle"
	req_one_access = list(access_pilot)

/obj/effect/shuttle_landmark/premade/excursion/cryogaia
	name = "NSB Cryogaia (Excursion Dock)"
	landmark_tag = "cryogaia_excursion_hangar"
	base_turf = /turf/simulated/floor/reinforced
	base_area = /area/cryogaia/station/excursion_dock

