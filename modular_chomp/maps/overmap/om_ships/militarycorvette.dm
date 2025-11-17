// Compile in the map for CI testing if we're testing compileability of all the maps
#ifdef MAP_TEST
#include "militarycorvette.dmm"
#endif

/datum/map_template/om_ships/militarycorvette
	name = "OM Ship - Military Corvette"
	desc = "A small, armored military ship. Contains enough supplies to set up a FoB."
	mappath = "modular_chomp/maps/overmap/om_ships/militarycorvette.dmm"
	annihilate = TRUE

// The shuttle's area
/area/shuttle/militarycorvetteOM
	name = "\improper Military Corvette"
	icon_state = "shuttle2"
	requires_power = 1

// The shuttle's 'shuttle' computer
/obj/machinery/computer/shuttle_control/explore/militarycorvette
	name = "short jump console"
	shuttle_tag = "Military Corvette"
	req_one_access = ""

/obj/effect/shuttle_landmark/shuttle_initializer/militarycorvette
	name = "Military Corvette" //These names must match
	base_area = /area/space
	base_turf = /turf/space
	landmark_tag = "omship_spawn_militarycorvette"
	shuttle_type = /datum/shuttle/autodock/overmap/militarycorvette

// The 'shuttle'
/datum/shuttle/autodock/overmap/militarycorvette
	name = "Military Corvette" //These names must match
	current_location = "omship_spawn_militarycorvette"
	docking_controller_tag = "militarycorvette_docker" //This is the only thing you map in and var edit, use the map helpers to designate doors and pumps
	shuttle_area = list(/area/shuttle/militarycorvetteOM)
	defer_initialisation = TRUE //We're not loaded until an admin does it
	fuel_consumption = 1
	ceiling_type = /turf/simulated/floor/reinforced/airless

// The 'ship'
/obj/effect/overmap/visitable/ship/landable/militarycorvette
	name = "Military Corvette" //These names must match
	scanner_desc = @{"[i]Registration[/i]: PRIVATE
[i]Class[/i]: Light Military Corvette
[i]Transponder[/i]: Transmitting (MIL), non-hostile
[b]Notice[/b]: Small military ship. No anti-ship weaponry."}
	vessel_mass = 1100
	vessel_size = SHIP_SIZE_SMALL
	shuttle = "Military Corvette" //These names must match
	fore_dir = NORTH
	known = FALSE

	//Player accessable superposed pod
/datum/map_template/shelter/superpose/militarycorvette
	shelter_id = "MilitaryCorvette"
	mappath = "modular_chomp/maps/overmap/om_ships/militarycorvette.dmm"
	name = "Military Corvette"
	description = "A small, armored military ship. Contains enough supplies to set up a FoB."
	superpose = FALSE
	shuttle = TRUE
