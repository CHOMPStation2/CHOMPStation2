
// -- Datums -- //

/datum/map_template/sc_lateload/away_fueldepot
	name = "Fuel Depot - Z1 Space"
	desc = "An unmanned fuel depot floating in space."
	mappath = 'modular_chomp/maps/overmap/space/fueldepot.dmm' //Use the modular map file
	associated_map_datum = /datum/map_z_level/sc_lateload/away_fueldepot

/datum/map_z_level/sc_lateload/away_fueldepot
	name = "Away Mission - Fuel Depot"
	z = Z_LEVEL_FUELDEPOT


// -- Overmap -- //

/obj/effect/overmap/visitable/sector/fueldepot
	name = "Fuel Depot"
	desc = "Self-service refueling depot."
	scanner_desc = @{"[i]Registration[/i]: Vir System Authority
[i]Class[/i]: Installation (Space)
[i]Transponder[/i]: Transmitting (CIV), V.S.A.
[b]Notice[/b]: This facility classified for public use for the purpose of refueling and recharging starships"}
	initial_generic_waypoints = list("fueldepot_east","fueldepot_west","fueldepot_north","fueldepot_south")
	icon_state = "fueldepot_g"
	unknown_state = "station"
	known = TRUE
	start_x  = 10 // Future note: remove these two vars if we ever want this to have a random spawn location on the overmap.
	start_y  = 11


// -- Areas -- //

/area/sc_away/fueldepot
	name = "Away Mission - Fuel Depot"
	icon = 'icons/turf/areas_vr.dmi'
	icon_state = "dark"
	lightswitch = FALSE

/area/sc_away/fueldepotspawn
    name = "Away Mission - Fuel Depot Sleeping Quarters"
    icon = 'icons/turf/areas_vr.dmi'
    icon_state = "dark"
    lightswitch = TRUE

// -- Landmarks -- //

/obj/effect/shuttle_landmark/premade/fueldepot/east
	name = "Fuel Depot - East Dock"
	landmark_tag = "fueldepot_east"

/obj/effect/shuttle_landmark/premade/fueldepot/west
	name = "Fuel Depot - West Dock"
	landmark_tag = "fueldepot_west"

/obj/effect/shuttle_landmark/premade/fueldepot/north
	name = "Fuel Depot - North Dock"
	landmark_tag = "fueldepot_north"

/obj/effect/shuttle_landmark/premade/fueldepot/south
	name = "Fuel Depot - South Dock"
	landmark_tag = "fueldepot_south"


// -- Turfs -- //

/turf/simulated/floor/tiled/techmaint/airless
	oxygen = 0
	nitrogen = 0
	temperature = TCMB
