// -- Datums -- //

/datum/shuttle/ferry/residential
	name = "Residential Ferry"
	warmup_time = 30
	area_station = /area/shuttle/residential/main
	area_offsite = /area/shuttle/residential/residential

// -- Objs -- //

/obj/machinery/computer/shuttle_control/residential_shuttle
	name = "residential ferry control console"
	shuttle_tag = "Residential Ferry"


// -- Areas -- //

/area/shuttle/residential/main
	name = "\improper Residential Shuttle - Station"
	base_turf = /turf/simulated/floor/outdoors/snow/plating/cryogaia

/area/shuttle/residential/residential
	name = "\improper Residential Shuttle - Residential"
	base_turf = /turf/space

/area/residential/docking_lobby
	name = "\improper Residential - Docking Lobby"

/area/residential/corridors
	name = "\improper Residential - Corridors"

/area/residential/ship_bay
	name = "\improper Residential - Ship Bay"