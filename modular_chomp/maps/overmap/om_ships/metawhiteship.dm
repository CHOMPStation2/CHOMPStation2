// Compile in the map for CI testing if we're testing compileability of all the maps
#if MAP_TEST
#include "metawhiteship30x21.dmm"
#endif

// Map template for spawning the shuttle
/datum/map_template/om_ships/metawhiteship
	name = "OM Ship - Meta White Ship"
	desc = "A small privately-owned vessel."
	mappath = 'metawhiteship30x21.dmm'
	annihilate = TRUE

// The shuttle's area(s)

/area/shuttle/metawhiteship
	name = "\improper MetaMaterial Salvage Ship"
	ambience = AMBIENCE_HANGAR
	icon_state = "shuttle2"
	requires_power = TRUE
	has_gravity = TRUE

/area/shuttle/metawhiteship/gen
	name = "\improper MetaMaterial Salvage Ship - Living Quarters"
	icon_state = "shuttle2"
/area/shuttle/metawhiteship/eng
	name = "\improper MetaMaterial Salvage Ship - Engineering"
	icon_state = "shuttle2"

/area/shuttle/metawhiteship/cargo
	name = "\improper MetaMaterial Salvage Ship - Cargo Bay"
	icon_state = "shuttle2"

/area/shuttle/metawhiteship/food
	name = "\improper MetaMaterial Salvage Ship - Recreational Lounge"
	icon_state = "shuttle2"

/area/shuttle/metawhiteship/bridge
	name = "\improper MetaMaterial Salvage Ship - Bridge"
	ambience = AMBIENCE_HIGHSEC
	icon_state = "shuttle2"
// The shuttle's 'shuttle' computer
/obj/machinery/computer/shuttle_control/explore/metawhiteship
	name = "short jump console"
	shuttle_tag = "MetaMaterial Salvage Ship" //These names must match
	req_one_access = null

// A shuttle lateloader landmark
/obj/effect/shuttle_landmark/shuttle_initializer/metawhiteship
	name = "Origin - MetaMaterial Salvage Ship"
	base_area = /area/space
	base_turf = /turf/space
	landmark_tag = "omship_spawn_metawhiteship"
	shuttle_type = /datum/shuttle/autodock/overmap/metawhiteship

// The 'shuttle'
/datum/shuttle/autodock/overmap/metawhiteship
	name = "MetaMaterial Salvage Ship" //These names must match
	current_location = "omship_spawn_metawhiteship"
	docking_controller_tag = "metawhiteship_docker" //This is the only thing you map in and var edit, use the map helpers to designate doors and pumps
	shuttle_area = list(	/area/shuttle/metawhiteship/gen,
					/area/shuttle/metawhiteship/cargo,
					/area/shuttle/metawhiteship/food,
					/area/shuttle/metawhiteship/bridge,
					/area/shuttle/metawhiteship/eng
					)
	defer_initialisation = TRUE //We're not loaded until an admin does it
	fuel_consumption = 1.5

// The 'ship'
/obj/effect/overmap/visitable/ship/landable/metawhiteship
	name = "MetaMaterial Salvage Ship" //These names must match
	scanner_desc = @{"[i]Registration[/i]: PRIVATE
[i]Class[/i]: Small Shuttle
[i]Transponder[/i]: Transmitting (CIV), non-hostile
[b]Notice[/b]: Small private vessel"}
	vessel_mass = 2250
	vessel_size = SHIP_SIZE_SMALL
	shuttle = "MetaMaterial Salvage Ship" //These names must match
	fore_dir = EAST
	known = FALSE

/datum/map_template/shelter/superpose/metawhiteship
	shelter_id = "MetaWhiteShip"
	mappath = 'metawhiteship30x21.dmm'
	name = "MetaMaterial Salvage Ship"
	description = "A medium size salvage whiteship"
	superpose = FALSE
	shuttle = TRUE
