
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

/area/awaymission/diescraper/outside/roof
	icon_state = "green"
	base_turf = /turf/simulated/floor/plating
	name = "Away Mission - City Roof"
