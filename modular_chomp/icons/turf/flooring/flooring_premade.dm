#define O2SIF 0.181
#define N2SIF 0.819

#define MOLES_CELLSIF 114.50978

#define MOLES_O2SIF (MOLES_CELLSIF * O2SIF) // O2 value on Sif(18%)
#define MOLES_N2SIF (MOLES_CELLSIF * N2SIF) // N2 value on Sif(82%)

#define TEMPERATURE_SIF 243.15 // Roughly -30C / -22F
#define TEMPERATURE_ALTSIF 225.15

//Atmosphere properties //CHOMP Comment: I guess this THOR planetary information should go here. THOR is a hot humid jungle.
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

// Custom snow presets for the cryosauna
/turf/simulated/floor/snow/snow2/cryosauna
	temperature = 263.15 // All we're doing here is manually setting the temperature

/turf/simulated/floor/wood/cryosauna
	temperature = 263.15 // All we're doing here is manually setting the temperature

/turf/simulated/floor/lava/external
	oxygen		= MOLES_O2SIF
	nitrogen	= MOLES_N2SIF
	temperature	= TEMPERATURE_SIF
