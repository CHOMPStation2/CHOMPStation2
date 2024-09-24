// Compile in the map for CI testing if we're testing compileability of all the maps
#if MAP_TEST
#include "cybershuttle-10x11.dmm"
#endif

// Map template for spawning the shuttle
/datum/map_template/om_ships/cybershuttle
	name = "OM Ship - Cyber Shuttle"
	desc = "A small privately-owned vessel with some snobbiness to it."
	mappath = 'cybershuttle-10x11.dmm'
	annihilate = TRUE

// The shuttle's area(s)
/area/shuttle/cybershuttle
	name = "\improper Cyber Shuttle"
	icon_state = "shuttle2"
	requires_power = 1

// The shuttle's 'shuttle' computer
/obj/machinery/computer/shuttle_control/explore/cybershuttle
	name = "short jump console"
	shuttle_tag = "Cyber Shuttle" //These names must match
	req_one_access = null

// A shuttle lateloader landmark
/obj/effect/shuttle_landmark/shuttle_initializer/cybershuttle
	name = "Cyber Shuttle"
	base_area = /area/space
	base_turf = /turf/space
	landmark_tag = "omship_spawn_cybershuttle"
	shuttle_type = /datum/shuttle/autodock/overmap/cybershuttle

// The 'shuttle'
/datum/shuttle/autodock/overmap/cybershuttle
	name = "Cyber Shuttle" //These names must match
	current_location = "omship_spawn_cybershuttle"
	docking_controller_tag = "cybershuttle_docker" //This is the only thing you map in and var edit, use the map helpers to designate doors and pumps
	shuttle_area = list(/area/shuttle/cybershuttle)
	defer_initialisation = TRUE //We're not loaded until an admin does it

// The 'ship'
/obj/effect/overmap/visitable/ship/landable/cybershuttle
	name = "Cyber Shuttle" //These names must match
	scanner_desc = @{"[i]Registration[/i]: PRIVATE
[i]Class[/i]: Small Shuttle
[i]Transponder[/i]: Transmitting (CIV), non-hostile
[b]Notice[/b]: Small private vessel"}
	vessel_mass = 500 //YEETus, like the real thing!
	burn_delay = 0.25 SECONDS //Fast as fuck
	vessel_size = SHIP_SIZE_TINY
	shuttle = "Cyber Shuttle" //These names must match
	known = FALSE

/datum/map_template/shelter/superpose/cybershuttle
	shelter_id = "CyberShuttle"
	mappath = 'cybershuttle-10x11.dmm'
	name = "CyberShuttle"
	description = "A very fast, very snobby very dangerous deathtrap that make you look rich."
	superpose = FALSE
	shuttle = TRUE
