/*
 *		Planetary Defines for things like atmos, planetary walls, and the like.
 *		Use this file to define your custom planet SPECIFICALLY for CHOMPStation or I swear someone will bonk you. <3
 *
 *		Current list of planets in file: (KEEP THIS UPDATED)
 *		Torris
 *		TBD
 *
*/

// Start Torris (Jungle Base) Defines here.
// Atmosphere properties
#define TORRIS_ONE_ATMOSPHERE	101.3 // kPa
#define TORRIS_AVG_TEMP	299.15 // 26C converted to Kelvin

// Following Values are in percent
#define TORRIS_PER_N2		0.40 
#define TORRIS_PER_O2		0.60
#define TORRIS_PER_N2O		0.00 //Currently no capacity to 'start' a turf with this. See turf.dm
#define TORRIS_PER_CO2		0.00
#define TORRIS_PER_PHORON	0.00

//Math only beyond this point
#define TORRIS_MOL_PER_TURF	(TORRIS_ONE_ATMOSPHERE*CELL_VOLUME/(TORRIS_AVG_TEMP*R_IDEAL_GAS_EQUATION))
#define TORRIS_MOL_N2			(TORRIS_MOL_PER_TURF * TORRIS_PER_N2)
#define TORRIS_MOL_O2			(TORRIS_MOL_PER_TURF * TORRIS_PER_O2)
#define TORRIS_MOL_N2O			(TORRIS_MOL_PER_TURF * TORRIS_PER_N2O)
#define TORRIS_MOL_CO2			(TORRIS_MOL_PER_TURF * TORRIS_PER_CO2)
#define TORRIS_MOL_PHORON		(TORRIS_MOL_PER_TURF * TORRIS_PER_PHORON)

//Turfmakers
#define TORRIS_SET_ATMOS	nitrogen=TORRIS_MOL_N2;oxygen=TORRIS_MOL_O2;carbon_dioxide=TORRIS_MOL_CO2;phoron=TORRIS_MOL_PHORON;temperature=TORRIS_AVG_TEMP
#define TORRIS_TURF_CREATE(x)	x/torris/nitrogen=TORRIS_MOL_N2;x/torris/oxygen=TORRIS_MOL_O2;x/torris/carbon_dioxide=TORRIS_MOL_CO2;x/torris/phoron=TORRIS_MOL_PHORON;x/torris/temperature=TORRIS_AVG_TEMP;x/torris/outdoors=TRUE;x/torris/update_graphic(list/graphic_add = null, list/graphic_remove = null) return 0
#define TORRIS_TURF_CREATE_UN(x)	x/torris/nitrogen=TORRIS_MOL_N2;x/torris/oxygen=TORRIS_MOL_O2;x/torris/carbon_dioxide=TORRIS_MOL_CO2;x/torris/phoron=TORRIS_MOL_PHORON;x/torris/temperature=TORRIS_AVG_TEMP

// This is a wall you surround the area of your "planet" with, that makes the atmosphere inside stay within bounds, even if canisters
// are opened or other strange things occur.
/turf/unsimulated/wall/planetary/torris
	name = "facility wall"
	desc = "An eight-meter tall carbyne wall. For when the wildlife on your planet is voracious panthers. It probably doesn't actually prevent them from getting over it."
	alpha = 0xFF
	TORRIS_SET_ATMOS
	
// End Torris (Jungle Base) Defines.

/*
 * Example commented out, uncomment to add your planet and customize the ratios to your liking.

// Start [Planet 2 Defines]
// Atmosphere properties
#define PLANET_EXAMPLE_ONE_ATMOSPHERE	101.3 // kPa
#define PLANET_EXAMPLE_AVG_TEMP	299.15 // 26C converted to Kelvin

// Following Values are in percent
#define PLANET_EXAMPLE_PER_N2		0.40 
#define PLANET_EXAMPLE_PER_O2		0.60
#define PLANET_EXAMPLE_PER_N2O		0.00 //Currently no capacity to 'start' a turf with this. See turf.dm
#define PLANET_EXAMPLE_PER_CO2		0.00
#define PLANET_EXAMPLE_PER_PHORON	0.00

//Math only beyond this point
#define PLANET_EXAMPLE_MOL_PER_TURF	(PLANET_EXAMPLE_ONE_ATMOSPHERE*CELL_VOLUME/(PLANET_EXAMPLE_AVG_TEMP*R_IDEAL_GAS_EQUATION))
#define PLANET_EXAMPLE_MOL_N2			(PLANET_EXAMPLE_MOL_PER_TURF * PLANET_EXAMPLE_PER_N2)
#define PLANET_EXAMPLE_MOL_O2			(PLANET_EXAMPLE_MOL_PER_TURF * PLANET_EXAMPLE_PER_O2)
#define PLANET_EXAMPLE_MOL_N2O			(PLANET_EXAMPLE_MOL_PER_TURF * PLANET_EXAMPLE_PER_N2O)
#define PLANET_EXAMPLE_MOL_CO2			(PLANET_EXAMPLE_MOL_PER_TURF * PLANET_EXAMPLE_PER_CO2)
#define PLANET_EXAMPLE_MOL_PHORON		(PLANET_EXAMPLE_MOL_PER_TURF * PLANET_EXAMPLE_PER_PHORON)

//Turfmakers
#define PLANET_EXAMPLE_SET_ATMOS	nitrogen=PLANET_EXAMPLE_MOL_N2;oxygen=PLANET_EXAMPLE_MOL_O2;carbon_dioxide=PLANET_EXAMPLE_MOL_CO2;phoron=PLANET_EXAMPLE_MOL_PHORON;temperature=PLANET_EXAMPLE_AVG_TEMP
#define PLANET_EXAMPLE_TURF_CREATE(x)	x/PLANET_EXAMPLE/nitrogen=PLANET_EXAMPLE_MOL_N2;x/PLANET_EXAMPLE/oxygen=PLANET_EXAMPLE_MOL_O2;x/PLANET_EXAMPLE/carbon_dioxide=PLANET_EXAMPLE_MOL_CO2;x/PLANET_EXAMPLE/phoron=PLANET_EXAMPLE_MOL_PHORON;x/PLANET_EXAMPLE/temperature=PLANET_EXAMPLE_AVG_TEMP;x/PLANET_EXAMPLE/outdoors=TRUE;x/PLANET_EXAMPLE/update_graphic(list/graphic_add = null, list/graphic_remove = null) return 0
#define PLANET_EXAMPLE_TURF_CREATE_UN(x)	x/PLANET_EXAMPLE/nitrogen=PLANET_EXAMPLE_MOL_N2;x/PLANET_EXAMPLE/oxygen=PLANET_EXAMPLE_MOL_O2;x/PLANET_EXAMPLE/carbon_dioxide=PLANET_EXAMPLE_MOL_CO2;x/PLANET_EXAMPLE/phoron=PLANET_EXAMPLE_MOL_PHORON;x/PLANET_EXAMPLE/temperature=PLANET_EXAMPLE_AVG_TEMP

// This is a wall you surround the area of your "planet" with, that makes the atmosphere inside stay within bounds, even if canisters
// are opened or other strange things occur.
/turf/unsimulated/wall/planetary/PLANET_EXAMPLE
	name = "facility wall"
	desc = "An eight-meter tall carbyne wall. For when the wildlife on your planet is voracious panthers. It probably doesn't actually prevent them from getting over it."
	alpha = 0xFF
	PLANET_EXAMPLE_SET_ATMOS

 *
*/