

//Areas
/area/awaymission/diescraper
	icon_state = "blank"

/area/awaymission/diescraper/indoors
	icon_state = "green"
	base_turf = /turf/simulated/floor/plating

/area/awaymission/diescraper/roof
	icon_state = "green"
	base_turf = /turf/simulated/floor/plating
	outdoors = OUTDOORS_YES
	name = "Away Mission - City Roof"


/area/awaymission/diescraper/sky
	icon_state = "yellow"
	base_turf = /turf/simulated/sky/south
	always_unpowered = TRUE
	outdoors = OUTDOORS_YES

/area/awaymission/diescraper/outside
	icon_state = "green"
	dynamic_lighting = 1
	requires_power = 0
	power_equip = 0
	power_environ = 1
	power_light = 1
	outdoors = OUTDOORS_YES
	ambience = AMBIENCE_SIF
	base_turf = /turf/simulated/floor/outdoors/rocks
