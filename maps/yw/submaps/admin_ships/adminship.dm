// Compile in the map for CI testing if we're testing compileability of all the maps
#ifdef MAP_TEST
#include "adminship.dmm"
#endif

// Map template for spawning the shuttle
/datum/map_template/admin_ships/admin
	name = "ADM Ship - Administrator ship (New Z)"
	desc = "A NT Administration ship."
	mappath = "maps/yw/submaps/admin_ships/adminship.dmm"

// The shuttle's area(s)
/area/ship/adminships
	name = "\improper Admin Ship (Use a Subtype!)"
	icon_state = "shuttle2"
	requires_power = 1

/area/ship/adminships/engine_bay
	name = "\improper Administation Ship - Engineering and Shuttle bay"
/area/ship/adminships/room1
	name = "\improper Administation Ship - Private Room 1"
/area/ship/adminships/room2
	name = "\improper Administation Ship - Private Room 2"
/area/ship/adminships/corridor
	name = "\improper Administation Ship - Central Corridor"
/area/ship/adminships/kitchen_dining
	name = "\improper Administation Ship - Kitchen and Dining"
/area/ship/adminships/main_corridor
	name = "\improper Administation Ship - Main Corridor"
/area/ship/adminships/bridge
	name = "\improper Administation Ship - Bridge"
/area/ship/adminships/medbay
	name = "\improper Administation Ship - Medbay"
/area/ship/adminships/sec
	name = "\improper Administation Ship - Security"


// The ship's boat
/area/shuttle/adminshuttle
	name = "\improper Administration shuttle"
	icon_state = "shuttle"


// The 'ship'
/obj/effect/overmap/visitable/ship/admin
	name = "NT Administration Ship"
	desc = "A administrative ship owned by NT"
	color = "#00aaff" //Bluey
	vessel_mass = 8000
	vessel_size = SHIP_SIZE_SMALL
	initial_generic_waypoints = list("adminship_fore", "adminship_port", "adminship_starboard", "adminship_stern")
	initial_restricted_waypoints = list("Administration shuttle" = list("adminship_bay"))


/obj/effect/shuttle_landmark/premade/adminship/shuttlebay
	name = "Shuttle Bay"
	landmark_tag = "shuttle_bay"
	base_area = /area/ship/adminships/engine_bay
	base_turf = /turf/simulated/floor/reinforced

/obj/effect/shuttle_landmark/premade/adminship/fore
	name = "Administration Ship Fore"
	landmark_tag = "adminship_fore"

/obj/effect/shuttle_landmark/premade/adminship/left
	name = "Administration Ship Port"
	landmark_tag = "adminship_port"

/obj/effect/shuttle_landmark/premade/adminship/right
	name = "Administration Ship Starboard"
	landmark_tag = "adminship_starboard"

/obj/effect/shuttle_landmark/premade/adminship/stern
	name = "Administration Ship Stern"
	landmark_tag = "adminship_stern"


// The shuttle's 'shuttle' computer
/obj/machinery/computer/shuttle_control/explore/adminshuttle
	name = "Administation shuttle control console"
	shuttle_tag = "Administration shuttle"
	req_one_access = list(access_cent_general)

// A shuttle lateloader landmark
/obj/effect/shuttle_landmark/shuttle_initializer/adminshuttle
	name = "Administation Shuttle Bay"
	base_area = /area/ship/adminships/engine_bay
	base_turf = /turf/simulated/floor/reinforced
	landmark_tag = "adminship_bay"
	docking_controller = "adminshuttle_bay"
	shuttle_type = /datum/shuttle/autodock/overmap/adminshuttle

// The 'shuttle'
/datum/shuttle/autodock/overmap/adminshuttle
	name = "Administration shuttle"
	current_location = "adminship_bay"
	docking_controller_tag = "adminshuttle_docker"
	shuttle_area = /area/shuttle/adminshuttle
	fuel_consumption = 0
	defer_initialisation = TRUE
