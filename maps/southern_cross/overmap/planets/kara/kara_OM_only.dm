//Atmosphere properties //CHOMP Comment: I guess this Kara planetary information should go here. Kara is a gas giant, it ain't gonna be getting very many other maps.
#define KARA_ONE_ATMOSPHERE	101.5 //kPa
#define KARA_AVG_TEMP			150 //kelvin

#define KARA_PER_N2		0.10 //percent
#define KARA_PER_O2		0.03
#define KARA_PER_N2O		0.00 //Currently no capacity to 'start' a turf with this. See turf.dm
#define KARA_PER_CO2		0.87
#define KARA_PER_PHORON	0.00

//Math only beyond this point
#define KARA_MOL_PER_TURF		(KARA_ONE_ATMOSPHERE*CELL_VOLUME/(KARA_AVG_TEMP*R_IDEAL_GAS_EQUATION))
#define KARA_MOL_N2			(KARA_MOL_PER_TURF * KARA_PER_N2)
#define KARA_MOL_O2			(KARA_MOL_PER_TURF * KARA_PER_O2)
#define KARA_MOL_N2O			(KARA_MOL_PER_TURF * KARA_PER_N2O)
#define KARA_MOL_CO2			(KARA_MOL_PER_TURF * KARA_PER_CO2)
#define KARA_MOL_PHORON		(KARA_MOL_PER_TURF * KARA_PER_PHORON)

// Overmap object for Kara, hanging in the void of space
/obj/effect/overmap/visitable/planet/kara
	name = "Kara"
	desc = "Uninhabitable gas giant."
	scanner_desc = @{"[i]Stellar Body[/i]: Kara
[i]Registration[/i]: Vir System Authority
[i]Class[/i]: Installation
[i]Transponder[/i]: Transmitting (CIV), Vir IFF
[b]Notice[/b]: CONDEMNED! NO ENTRY! -Vir System Authority"}

	map_z = list() // Using the aerostat as the map as it is the only z-level in the atmosphere. Located in /maps/southern_cross/overmap/planets/kara/aerostat/
	initial_generic_waypoints = list() //northern_star.dm landmarks
	start_x  = 14
	start_y  = 14
	skybox_offset_x = 128
	skybox_offset_y = 128
	surface_color = "#AD9100" // While many of these vars don't really make sense for a gas giant, they're necessary for the planet image generation we currently have.
	mountain_color = "#A58A00" // Maybe we'll have a proper gas giant later.
	water_color = "#A88D00"
	ice_color = "#AD9100"
	atmosphere_color = "#C19562"
	icon_state = "chlorine"
	known = 1


/obj/effect/overmap/visitable/planet/kara/get_skybox_representation()
	var/image/tmp = ..()
	tmp.pixel_x = skybox_offset_x
	tmp.pixel_y = skybox_offset_y
	return tmp

/obj/effect/overmap/visitable/planet/kara/Initialize()
	atmosphere = new(CELL_VOLUME) // Necessary for the planet overmap icon to generate properly, but gas type does not seem to matter.
	atmosphere.adjust_gas_temp("carbon_dioxide", KARA_MOL_CO2, KARA_AVG_TEMP)
	atmosphere.adjust_gas_temp("nitrogen", KARA_MOL_N2, KARA_AVG_TEMP)
	atmosphere.adjust_gas_temp("oxygen", KARA_MOL_O2, KARA_AVG_TEMP)

	. = ..()

	docking_codes = null

/obj/effect/overmap/visitable/planet/kara/find_z_levels()
	return

/obj/effect/overmap/visitable/planet/kara/register_z_levels()
	return
