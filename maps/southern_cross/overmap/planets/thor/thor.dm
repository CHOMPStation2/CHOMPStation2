//Atmosphere properties //CHOMP Comment: I guess this THOR planetary information should go here. THOR is a gas giant, it ain't gonna be getting very many other maps.
#define THOR_ONE_ATMOSPHERE	101.5 //kPa
#define THOR_AVG_TEMP			313 //kelvin

#define THOR_PER_N2		0.65 //percent
#define THOR_PER_O2		0.35
#define THOR_PER_N2O		0.00 //Currently no capacity to 'start' a turf with this. See turf.dm
#define THOR_PER_CO2		0.00
#define THOR_PER_PHORON	0.00

//Math only beyond this point
#define THOR_MOL_PER_TURF		(THOR_ONE_ATMOSPHERE*CELL_VOLUME/(THOR_AVG_TEMP*R_IDEAL_GAS_EQUATION))
#define THOR_MOL_N2			(THOR_MOL_PER_TURF * THOR_PER_N2)
#define THOR_MOL_O2			(THOR_MOL_PER_TURF * THOR_PER_O2)
#define THOR_MOL_N2O			(THOR_MOL_PER_TURF * THOR_PER_N2O)
#define THOR_MOL_CO2			(THOR_MOL_PER_TURF * THOR_PER_CO2)
#define THOR_MOL_PHORON		(THOR_MOL_PER_TURF * THOR_PER_PHORON)

//Turfmakers
#define THOR_SET_ATMOS	nitrogen=THOR_MOL_N2;oxygen=THOR_MOL_O2;carbon_dioxide=THOR_MOL_CO2;phoron=THOR_MOL_PHORON;temperature=THOR_AVG_TEMP
#define THOR_TURF_CREATE(x)	x/THOR/nitrogen=THOR_MOL_N2;x/THOR/oxygen=THOR_MOL_O2;x/THOR/carbon_dioxide=THOR_MOL_CO2;x/THOR/phoron=THOR_MOL_PHORON;x/THOR/temperature=THOR_AVG_TEMP;x/THOR/color="#eacd7c"

/obj/effect/overmap/visitable/planet/thor
	name = "Thor"
	desc = "Inhabited terrestrial natural saterlite of Sif"
	scanner_desc = @{"[i]Stellar Body[/i]: Thor
[i]Registration[/i]: Vir System Authority
[i]Class[/i]: Installation
[i]Transponder[/i]: Transmitting (CIV), Vir IFF
[b]Notice[/b]: The Vir government welcomes you to this world."}

	map_z = list(Z_LEVEL_JUNGLE)
	initial_generic_waypoints = list("thor_nw")
	start_x  = 11
	start_y  = 17
	skybox_offset_x = 128
	skybox_offset_y = 128
	surface_color = "#176422"
	mountain_color = "#7cdfda"
	water_color = "#086dcc"
	ice_color = "#f5ffff"
	atmosphere_color = "#54c0ce"
	icon_state = "lush"
	known = 1


/obj/effect/overmap/visitable/planet/thor/get_skybox_representation()
	var/image/tmp = ..()
	tmp.pixel_x = skybox_offset_x
	tmp.pixel_y = skybox_offset_y
	return tmp

/obj/effect/overmap/visitable/planet/thor/Initialize()
	atmosphere = new(CELL_VOLUME) // Necessary for the planet overmap icon to generate properly, but gas type does not seem to matter.
	atmosphere.adjust_gas_temp("carbon_dioxide", THOR_MOL_CO2, THOR_AVG_TEMP)
	atmosphere.adjust_gas_temp("nitrogen", THOR_MOL_N2, THOR_AVG_TEMP)
	atmosphere.adjust_gas_temp("oxygen", THOR_MOL_O2, THOR_AVG_TEMP)

	. = ..()

	docking_codes = null
