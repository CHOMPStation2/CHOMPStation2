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

/datum/shuttle/autodock/overmap/security
	name = "Security Interceptor"
	warmup_time = 0
	current_location = "cryogaia_security_hangar"
	docking_controller_tag = "secshuttle_docker"
	shuttle_area = list(/area/shuttle/security)
	fuel_consumption = 1 //much less, due to being teeny

// The 'ship' of the excursion shuttle
/obj/effect/overmap/visitable/ship/landable/excursion
	name = "Excursion Shuttle"
	desc = "The traditional Excursion Shuttle. NT Approved!"
	vessel_mass = 10000
	vessel_size = SHIP_SIZE_SMALL
	shuttle = "Excursion Shuttle"

/obj/effect/overmap/visitable/ship/landable/security
	name = "Security Interceptor"
	desc = "An NT-owned high-speed interceptor. Lightly armed."
	vessel_mass = 2500
	vessel_size = SHIP_SIZE_SMALL
	shuttle = "Security Interceptor"

/obj/machinery/computer/shuttle_control/explore/excursion
	name = "short jump console"
	shuttle_tag = "Excursion Shuttle"
	req_one_access = list(access_pilot)

/obj/machinery/computer/shuttle_control/explore/security
	name = "short jump console"
	shuttle_tag = "Security Interceptor"
	req_one_access = list(access_secpilot)

/obj/effect/shuttle_landmark/premade/excursion/cryogaia
	name = "NSB Cryogaia (Excursion Dock)"
	landmark_tag = "cryogaia_excursion_hangar"
	base_turf = /turf/simulated/floor/reinforced
	base_area = /area/cryogaia/station/excursion_dock

/obj/effect/shuttle_landmark/premade/security/cryogaia
	name = "NSB Cryogaia (Security Dock)"
	landmark_tag = "cryogaia_security_hangar"
	base_turf = /turf/simulated/floor/reinforced
	base_area = /area/security/hangar

/obj/effect/shuttle_landmark/premade/mining/cryogaia
	name = "NSB Cryogaia (Belter Dock)"
	landmark_tag = "belter_colony"
	base_turf = /turf/simulated/floor/reinforced
	base_area = /area/quartermaster/miningdock