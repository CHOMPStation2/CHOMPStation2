// Compile in the map for CI testing if we're testing compileability of all the maps
#if MAP_TEST
#include "pizzashuttle-11x13.dmm"
#endif

// Map template for spawning the shuttle
/datum/map_template/om_ships/pizzashuttle
	name = "OM Ship - Pizza Delivery Shuttle"
	desc = "A small moderate condition pizza parlor on the go."
	mappath = 'pizzashuttle-11x13.dmm'
	annihilate = TRUE

// The shuttle's area(s)
/area/shuttle/pizza_shuttle
	name = "\improper Pizza Gut Shuttle"
	icon_state = "shuttle2"
	requires_power = 1

// The shuttle's 'shuttle' computer
/obj/machinery/computer/shuttle_control/explore/pizza_shuttle
	name = "short jump console"
	shuttle_tag = "Pizza Gut" //These names must match
	req_one_access = list() //I might regret this

// A shuttle lateloader landmark
/obj/effect/shuttle_landmark/shuttle_initializer/pizza_shuttle
	name = "Origin - Pizza Gut"
	base_area = /area/space
	base_turf = /turf/space
	landmark_tag = "omship_spawn_pizza_shuttle"
	shuttle_type = /datum/shuttle/autodock/overmap/pizza_shuttle

// The 'shuttle'
/datum/shuttle/autodock/overmap/pizza_shuttle
	name = "Pizza Gut" //These names must match
	current_location = "omship_spawn_pizza_shuttle"
	docking_controller_tag = "pizza_shuttle_docker" //This is the only thing you map in and var edit, use the map helpers to designate doors and pumps
	shuttle_area = list(/area/shuttle/pizza_shuttle)
	defer_initialisation = TRUE //We're not loaded until an admin does it
	fuel_consumption = 1

// The 'ship'
/obj/effect/overmap/visitable/ship/landable/pizza_shuttle
	name = "Pizza Gut" //These names must match
	scanner_desc = @{"[i]Registration[/i]: PRIVATE
[i]Class[/i]: Small Shuttle
[i]Transponder[/i]: Transmitting (CIV), non-hostile
[b]Notice[/b]: Small private vessel"}
	vessel_mass = 900 //YEET
	vessel_size = SHIP_SIZE_TINY
	shuttle = "Pizza Gut" //These names must match
	known = FALSE

/datum/map_template/shelter/superpose/pizzashuttle
	shelter_id = "PizzaShuttle"
	mappath = 'pizzashuttle-11x13.dmm'
	name = "Pizza Gut Shuttle"
	description = "A medium size pizza resturaunt ship."
	superpose = FALSE
	shuttle = TRUE
