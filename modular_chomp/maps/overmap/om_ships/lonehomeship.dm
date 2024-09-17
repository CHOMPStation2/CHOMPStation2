// Compile in the map for CI testing if we're testing compileability of all the maps
#if MAP_TEST
#include "lonehomeship-20x13.dmm"
#endif

// Map template for spawning the shuttle
/datum/map_template/om_ships/lonehomeship
	name = "OM Ship - Lonehome Shuttle"
	desc = "A small privately-owned vessel."
	mappath = 'lonehomeship-20x13.dmm'
	annihilate = TRUE

// The shuttle's area(s)

/area/shuttle/lonehomeship
	name = "\improper Personal Home Ship"
	icon_state = "shuttle2"
	requires_power = 1

// The shuttle's 'shuttle' computer
/obj/machinery/computer/shuttle_control/explore/lonehomeship
	name = "short jump console"
	shuttle_tag = "Personal Home Ship" //These names must match
	req_one_access = null

// A shuttle lateloader landmark
/obj/effect/shuttle_landmark/shuttle_initializer/lonehomeship
	name = "Origin - Personal Home Ship"
	base_area = /area/space
	base_turf = /turf/space
	landmark_tag = "omship_spawn_lonehomeship"
	shuttle_type = /datum/shuttle/autodock/overmap/lonehomeship

// The 'shuttle'
/datum/shuttle/autodock/overmap/lonehomeship
	name = "Personal Home Ship" //These names must match
	current_location = "omship_spawn_lonehomeship"
	docking_controller_tag = "lonehomeship_docker" //This is the only thing you map in and var edit, use the map helpers to designate doors and pumps
	shuttle_area = list(/area/shuttle/lonehomeship)
	defer_initialisation = TRUE //We're not loaded until an admin does it
	fuel_consumption = 2

// The 'ship'
/obj/effect/overmap/visitable/ship/landable/lonehomeship
	name = "Personal Home Ship" //These names must match
	scanner_desc = @{"[i]Registration[/i]: PRIVATE
[i]Class[/i]: Small Shuttle
[i]Transponder[/i]: Transmitting (CIV), non-hostile
[b]Notice[/b]: Small Personal Home Ship"}
	vessel_mass = 2250
	vessel_size = SHIP_SIZE_TINY
	shuttle = "Personal Home Ship" //These names must match

/datum/map_template/shelter/superpose/lonehomeship
	shelter_id = "LoneHomeShip"
	mappath = 'lonehomeship-20x13.dmm'
	name = "Personal Home Ship"
	description = "A cozy RV like ship meant for long hauls in the desert... if the desert was space."
	superpose = FALSE
	shuttle = TRUE
