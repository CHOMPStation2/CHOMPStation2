// Compile in the map for CI testing if we're testing compileability of all the maps
#if MAP_TEST
#include "whiteship.dmm"
#include "whiteship-26x33.dmm"
#endif

// Map template for spawning the shuttle
/datum/map_template/om_ships/whiteship
	name = "OM Ship - Science White Ship"
	desc = "A large titanium science ship."
	mappath = 'whiteship.dmm'
	annihilate = TRUE

// The shuttle's area(s)
/area/shuttle/whiteshipOM
	name = "\improper White Ship"
	icon_state = "shuttle2"
	requires_power = 1

/area/shuttle/whiteshipOM2
	name = "\improper White Ship mk II"
	icon_state = "shuttle2"
	requires_power = 1

// The shuttle's 'shuttle' computer
/obj/machinery/computer/shuttle_control/explore/whiteship
	name = "short jump console"
	shuttle_tag = "White Ship"
	req_one_access = ""

/obj/machinery/computer/shuttle_control/explore/whiteship2
	name = "short jump console"
	shuttle_tag = "White Ship II"
	req_one_access = ""

// A shuttle lateloader landmark
/obj/effect/shuttle_landmark/shuttle_initializer/whiteship
	name = "White Ship" //These names must match
	base_area = /area/space
	base_turf = /turf/space
	landmark_tag = "omship_spawn_whiteship"
	shuttle_type = /datum/shuttle/autodock/overmap/whiteship

/obj/effect/shuttle_landmark/shuttle_initializer/whiteship2
	name = "White Ship II" //These names must match
	base_area = /area/space
	base_turf = /turf/space
	landmark_tag = "omship_spawn_whiteship2"
	shuttle_type = /datum/shuttle/autodock/overmap/whiteship2

// The 'shuttle'
/datum/shuttle/autodock/overmap/whiteship
	name = "White Ship" //These names must match
	current_location = "omship_spawn_whiteship"
	docking_controller_tag = "whiteship_docker" //This is the only thing you map in and var edit, use the map helpers to designate doors and pumps
	shuttle_area = list(/area/shuttle/whiteshipOM)
	defer_initialisation = TRUE //We're not loaded until an admin does it
	fuel_consumption = 2.5

/datum/shuttle/autodock/overmap/whiteship2
	name = "White Ship II" //These names must match
	current_location = "omship_spawn_whiteship2"
	docking_controller_tag = "whiteship_docker2" //This is the only thing you map in and var edit, use the map helpers to designate doors and pumps
	shuttle_area = list(/area/shuttle/whiteshipOM2)
	defer_initialisation = TRUE //We're not loaded until an admin does it
	fuel_consumption = 2.5

// The 'ship'
/obj/effect/overmap/visitable/ship/landable/whiteship
	name = "White Ship" //These names must match
	scanner_desc = @{"[i]Registration[/i]: PRIVATE
[i]Class[/i]: Medium Research Shuttle
[i]Transponder[/i]: Transmitting (SCI), non-hostile
[b]Notice[/b]: Medium sized research vessel"}
	vessel_mass = 3000
	vessel_size = SHIP_SIZE_LARGE
	shuttle = "White Ship" //These names must match
	fore_dir = WEST
	known = FALSE

/obj/effect/overmap/visitable/ship/landable/whiteship2
	name = "White Ship II" //These names must match
	scanner_desc = @{"[i]Registration[/i]: PRIVATE
[i]Class[/i]: Medium Research Shuttle
[i]Transponder[/i]: Transmitting (SCI), non-hostile
[b]Notice[/b]: Medium sized research vessel"}
	vessel_mass = 3000
	vessel_size = SHIP_SIZE_LARGE
	shuttle = "White Ship II" //These names must match
	fore_dir = WEST
	known = FALSE

//Player accessable superposed pod
/datum/map_template/shelter/superpose/whiteship2
	shelter_id = "WhiteShipII"
	mappath = 'whiteship-26x33.dmm'
	name = "White Ship Mk II"
	description = "A large titanium ship."
	superpose = FALSE
	shuttle = TRUE
