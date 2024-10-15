//Hello! You want to make your own shuttle? This ship here is the most baseline thing you can create, its as easy as copying this file, changing its name,
//and ctrl+H-ing "Generic Shuttle" to your ship's display name, and "generic_shuttle" to whatever filepath you wish. Be sure all shuttle_tags between match or else the game will freak out. No duplicate names!
// Compile in the map for CI testing if we're testing compileability of all the maps
#if MAP_TEST
#include "generic_shuttle.dmm"
#endif

// Map template for spawning the shuttle, this is the one for admins.
/datum/map_template/om_ships/hybrid
	name = "OM Ship - Generic Shuttle"
	desc = "A small privately-owned vessel."
	mappath = 'generic_shuttle.dmm'
	annihilate = TRUE

// The shuttle's area(s)
/area/shuttle/generic_shuttle/eng
	name = "\improper Private Vessel - Engineering"
	icon_state = "shuttle2"
	requires_power = 1

/area/shuttle/generic_shuttle/gen
	name = "\improper Private Vessel - General"
	icon_state = "shuttle2"
	requires_power = 1

// The shuttle's 'shuttle' computer
/obj/machinery/computer/shuttle_control/explore/generic_shuttle
	name = "short jump console"
	shuttle_tag = "Private Vessel" //These names must match
	req_one_access = list(access_pilot)

// A shuttle lateloader landmark
/obj/effect/shuttle_landmark/shuttle_initializer/generic_shuttle
	name = "Origin - Private Vessel"
	base_area = /area/space
	base_turf = /turf/space
	landmark_tag = "omship_spawn_generic_shuttle"
	shuttle_type = /datum/shuttle/autodock/overmap/generic_shuttle

// The 'shuttle'
/datum/shuttle/autodock/overmap/generic_shuttle
	name = "Private Vessel" //These names must match
	current_location = "omship_spawn_generic_shuttle"
	docking_controller_tag = "generic_shuttle_docker" //This is the only thing you map in and var edit, use the map helpers to designate doors and pumps, change its frequency var to 1380 because for some reason Southern Cross runs on that frequency for no reason.
	shuttle_area = list(/area/shuttle/generic_shuttle/eng, /area/shuttle/generic_shuttle/gen) //MAKE SURE THESE AREAS ARE MAPPED IN, If you remove an area but forget to remove it from here, the shuttle will break after the first shortjump.
	defer_initialisation = TRUE //We're not loaded until an admin does it

// The 'ship'
/obj/effect/overmap/visitable/ship/landable/generic_shuttle
	name = "Private Vessel" //These names must match
	scanner_desc = @{"[i]Registration[/i]: PRIVATE
[i]Class[/i]: Small Shuttle
[i]Transponder[/i]: Transmitting (CIV), non-hostile
[b]Notice[/b]: Small private vessel"}
	vessel_mass = 1000
	vessel_size = SHIP_SIZE_TINY
	shuttle = "Private Vessel" //These names must match


//This right here is what you would place if you want your ship to be a spacefarer's superposed pod, reccomended to make it a seperate .dmm so the code reconizes the size restraints.
/*
/datum/map_template/shelter/superpose/genericshuttle
	shelter_id = "GenericShuttle"
	mappath = 'genericshuttle-11x13.dmm'
	name = "Generic Shuttle"
	description = "This is a generic shuttle, it is a normal-sized item.."
	superpose = FALSE
	shuttle = TRUE
*/
