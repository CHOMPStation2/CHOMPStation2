// -- Datums -- //

/datum/shuttle/ferry/residential
	name = "Residential Shuttle"
	location = 1 // At offsite
	warmup_time = 5
	move_time = 5
	area_station = /area/shuttle/residential/main
	area_offsite = /area/shuttle/residential/residential
	area_transition = /area/shuttle/residential/transition
	docking_controller_tag = "residential_shuttle"
	dock_target_station = "residential_shuttle_station"
	dock_target_offsite = "residential_shuttle_offsite"

// -- Objs -- //

/obj/machinery/computer/shuttle_control/residential_shuttle
	name = "residential ferry control console"
	shuttle_tag = "Residential Shuttle"


// -- Areas -- //

/area/shuttle/residential/main
	name = "\improper Residential Shuttle - Station"
	base_turf = /turf/simulated/floor/outdoors/snow/plating/cryogaia

/area/shuttle/residential/residential
	name = "\improper Residential Shuttle - Residential"
	base_turf = /turf/space

/area/shuttle/residential/transition
	name = "\improper Residential Shuttle - Transition"
	base_turf = /turf/space

/area/residential
	icon = 'icons/turf/areas_yw.dmi'

/area/residential/docking_lobby
	name = "\improper Residential - Docking Lobby"
	icon_state = "docking_lobby"

/area/residential/corridors
	name = "\improper Residential - Corridors"
	icon_state = "corridors"

/area/residential/ship_bay
	name = "\improper Residential - Ship Bay"

/area/residential/powerroom
	name = "\improper Residential - Power Room"

/area/residential/lobby
	name = "\improper Residential - Residential Lobby"

/area/residential/room1
	name = "\improper Residential - Room 1"
	icon_state = "room1"

/area/residential/room2
	name = "\improper Residential - Room 2"
	icon_state = "room2"

/area/residential/room3
	name = "\improper Residential - Room 3"
	icon_state = "room3"

/area/residential/room4
	name = "\improper Residential - Room 4"
	icon_state = "room4"

/area/residential/room5
	name = "\improper Residential - Room 5"
	icon_state = "room5"

/area/residential/room6
	name = "\improper Residential - Room 6"
	icon_state = "room6"

/area/residential/mansion
	name = "\improper Residential -  Mansion"
	icon_state = "mansion"