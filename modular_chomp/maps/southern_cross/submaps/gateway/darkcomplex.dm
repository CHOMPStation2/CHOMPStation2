/obj/effect/landmark/darkcomplex_room
	name = "Dark Complex Room"
	var/width
	var/height

/obj/effect/landmark/darkcomplex_room/New()
	var/area/awaymission/darkcomplex/low_risk/area = get_area(src)
	area.marks += src

//Areas
/area/awaymission/darkcomplex
	icon_state = "blank"
	var/submaps = null
	var/wall = null
	var/floor = null

/area/awaymission/darkcomplex/low_risk
	icon_state = "green"
	name = "Away Mission - Dark Complex (Low)"
	forced_ambience = list('sound/ambience/fluorescentlight.ogg')
	submaps = list("Dark Complex - Gateway", "Dark Complex - Medical")
	wall = /turf/simulated/wall/r_wall
	floor = /turf/simulated/floor/plating
	var/list/obj/effect/landmark/darkcomplex_room/marks = list()

/area/awaymission/darkcomplex/mid_risk
	icon_state = "yellow"
	name = "Away Mission - Dark Complex (Mid)"
	forced_ambience = list('sound/ambience/fluorescentlight.ogg')
	wall = /turf/simulated/wall/concrete
	floor = /turf/simulated/floor/tiled/white

/area/awaymission/darkcomplex/high_risk
	icon_state = "red"
	name = "Away Mission - Dark Complex (High)"
	forced_ambience = list('sound/ambience/fluorescentlight.ogg')
	wall = /turf/simulated/gore
	floor = /turf/simulated/floor/gorefloor2

/area/awaymission/darkcomplex/darkness
	icon_state = "black"
	name = "Away Mission - Dark Complex (Dark)"
	forced_ambience = list('sound/ambience/fluorescentlight.ogg')
	wall = /turf/unsimulated/wall/dark
	floor = /turf/unsimulated/floor/dark

/datum/map_template/darkcomplex
	name = "Gateway Content - Dark Complex"
	desc = "Used to generate rooms for the dark complex."

/datum/map_template/darkcomplex/low_risk
	name = "Gateway Content - Dark Complex"
	desc = "Used to generate rooms for the dark complex."

/datum/map_template/darkcomplex/mid_risk
	name = "Gateway Content - Dark Complex"
	desc = "Used to generate rooms for the dark complex."

/datum/map_template/darkcomplex/high_risk
	name = "Gateway Content - Dark Complex"
	desc = "Used to generate rooms for the dark complex."

/datum/map_template/darkcomplex/darkness
	name = "Gateway Content - Dark Complex"
	desc = "Used to generate rooms for the dark complex."

/datum/map_template/darkcomplex/low_risk/gateway
	name = "Dark Complex - Gateway"
	desc = "A gateway back to the station."
	mappath = "modular_chomp/maps/submaps/darkcomplex_submaps/low_risk/gateway.dmm"

/datum/map_template/darkcomplex/low_risk/medical
	name = "Dark Complex - Medical"
	desc = "A ruined medical area."
	mappath = "modular_chomp/maps/submaps/darkcomplex_submaps/low_risk/medical.dmm"
