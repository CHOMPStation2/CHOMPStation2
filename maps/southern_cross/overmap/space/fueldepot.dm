
// -- Datums -- //

/datum/map_template/sc_lateload/away_fueldepot
	name = "Fuel Depot - Z1 Space"
	desc = "An unmanned fuel depot floating in space."
	mappath = 'maps/expedition_vr/space/fueldepot.dmm' //This is where it is in our file system. This is a Virgo thing we have used.
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
	icon_state = "fueldepot"
	initial_generic_waypoints = list("fueldepot_east","fueldepot_west","fueldepot_north","fueldepot_south")
	unknown_state = "station"
	known = TRUE
	icon_state = "fueldepot_g"
	start_x  = 10
	start_y  = 11


// -- Areas -- //

/area/sc_away/fueldepot
	name = "Away Mission - Fuel Depot"
	icon = 'icons/turf/areas_vr.dmi'
	icon_state = "dark"
	lightswitch = FALSE


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
