
/obj/machinery/power/rtg/fake_z_wires //A 'reactor' disguised as a multi Z wire coming from godknowswhereium
	name = "Multi-Floor Wire"
	desc = "A thick industrial cable connecting power between all of the floors of the building."
	power_gen = 150000
	icon = 'modular_chomp/icons/obj/power.dmi'
	icon_state = "rtgfakez"

//The fake shuttle
/* The code fucking breaks when the gateway ISNT lateloaded because all shuttles must be mapped in. No way around it.
/area/shuttle/diescraper
	name = "Skyscraper Elevator"
	icon_state = "shuttle2"
	base_turf = /turf/simulated/floor/reinforced

/obj/machinery/computer/shuttle_control/diescraper
	name = "Elevator Control Panel"
	shuttle_tag = "Diescraper"

/datum/shuttle/autodock/ferry/diescraper
	name = "Diescraper"
	warmup_time = 0
	location = FERRY_LOCATION_STATION
	shuttle_area = /area/shuttle/diescraper
	landmark_offsite = "die_sling_outpost"
	landmark_station = "die_sling_station"
	docking_controller_tag = "die_sling"

/obj/effect/shuttle_landmark/diescraper/sling_station
	name = "Floor 51"
	landmark_tag = "die_sling_station"
	docking_controller = "die_sling_station"
	base_area = /area/awaymission/diescraper/indoors/floor2
	base_turf = /turf/simulated/floor/reinforced

/obj/effect/shuttle_landmark/diescraper/sling_outpost
	name = "Ground Floor"
	landmark_tag = "die_sling_outpost"
	docking_controller = "die_sling_outpost"
*/

//Areas

/area/awaymission/diescraper
	icon_state = "blank"

/area/awaymission/diescraper/indoors
	icon_state = "green"
	base_turf = /turf/simulated/floor/plating

/area/awaymission/diescraper/indoors/floor1
	icon_state = "green"
	base_turf = /turf/simulated/floor/plating
	name = "Away Mission - Skyscraper Ground Floor"
	base_turf = /turf/simulated/floor/outdoors/rocks

/area/awaymission/diescraper/indoors/floor2
	icon_state = "green"
	base_turf = /turf/simulated/floor/plating
	name = "Away Mission - Skyscraper Floor 52"
	forced_ambience = list('sound/ambience/fluorescentlight.ogg')

/area/awaymission/diescraper/indoors/floor3
	icon_state = "green"
	base_turf = /turf/simulated/floor/plating
	name = "Away Mission - Skyscraper Floor 53"
	forced_ambience = list('sound/ambience/fluorescentlight.ogg')

/area/awaymission/diescraper/indoors/floor4
	icon_state = "green"
	base_turf = /turf/simulated/floor/plating
	name = "Away Mission - Skyscraper Floor 54"

/area/awaymission/diescraper/indoors/floor4second
	icon_state = "green"
	base_turf = /turf/simulated/floor/plating
	name = "Away Mission - Skyscraper Floor 54 Second"
	requires_power = FALSE

/area/awaymission/diescraper/indoors/floor5
	icon_state = "green"
	base_turf = /turf/simulated/floor/plating
	name = "Away Mission - Skyscraper Floor 55"

/area/awaymission/diescraper/indoors/floor6
	icon_state = "green"
	base_turf = /turf/simulated/floor/plating
	name = "Away Mission - Skyscraper Floor 56"

/area/awaymission/diescraper/indoors/floor7
	icon_state = "green"
	base_turf = /turf/simulated/floor/plating
	name = "Away Mission - Skyscraper Floor 57"

/area/awaymission/diescraper/indoors/floor8
	icon_state = "green"
	base_turf = /turf/simulated/floor/plating
	name = "Away Mission - Skyscraper Floor 58"

/area/awaymission/diescraper/indoors/floor9
	icon_state = "green"
	base_turf = /turf/simulated/floor/plating
	name = "Away Mission - Skyscraper Floor 59"

/area/awaymission/diescraper/indoors/floor10
	icon_state = "green"
	base_turf = /turf/simulated/floor/plating
	name = "Away Mission - Skyscraper Floor 60"

/area/awaymission/diescraper/indoors/floor11
	icon_state = "green"
	base_turf = /turf/simulated/floor/plating
	name = "Away Mission - Skyscraper Roof Maintinence"
	requires_power = 0
	flags = PHASE_SHIELDED

/area/awaymission/diescraper/indoors/floor112
	icon_state = "green"
	base_turf = /turf/simulated/floor/plating
	name = "Away Mission - Skyscraper Second Tower Roofing"

/area/awaymission/diescraper/roof
	icon_state = "green"
	base_turf = /turf/simulated/floor/plating
	outdoors = OUTDOORS_YES
	name = "Away Mission - City Roof"
	forced_ambience = list('sound/effects/weather/wind/wind_loop1.ogg')


/area/awaymission/diescraper/sky
	icon_state = "yellow"
	base_turf = /turf/simulated/sky/south
	always_unpowered = TRUE
	outdoors = OUTDOORS_YES
	forced_ambience = list('sound/effects/weather/wind/wind_loop1.ogg')

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

/area/awaymission/diescraper/outside/roof
	icon_state = "green"
	base_turf = /turf/simulated/floor/plating
	name = "Away Mission - City Roof"

/obj/item/card/id/diescrapergun
	name = "Gunstore ID"
	access = list(886)

/obj/structure/sign/warning/secure_area/slabs
	name = "Mysterious Slab"
	icon = 'modular_chomp/icons/obj/stationobjs.dmi'
	icon_state = "slab1-off"
