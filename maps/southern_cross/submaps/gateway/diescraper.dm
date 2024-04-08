
/obj/machinery/power/rtg/fake_z_wires //A 'reactor' disguised as a multi Z wire coming from godknowswhereium
	name = "Multi-Floor Wire"
	desc = "A thick industrial cable connecting power between all of the floors of the building."
	power_gen = 150000
	icon = 'modular_chomp/icons/obj/power.dmi'
	icon_state = "rtgfakez"

/obj/turbolift_map_holder/diescraper
	icon = 'icons/obj/turbolift_preview_5x5.dmi'
	lift_size_x = 4
	lift_size_y = 4
	depth = 2
	areas_to_use = list(
		/area/turbolift/diescraper_1,
		/area/turbolift/diescraper_2
		)

//Areas
/area/turbolift/diescraper_1
	icon_state = "yellow"

/area/turbolift/diescraper_2
	icon_state = "yellow"
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

/area/awaymission/diescraper/indoors/floor3
	icon_state = "green"
	base_turf = /turf/simulated/floor/plating
	name = "Away Mission - Skyscraper Floor 53"

/area/awaymission/diescraper/indoors/floor4
	icon_state = "green"
	base_turf = /turf/simulated/floor/plating
	name = "Away Mission - Skyscraper Floor 54"

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
