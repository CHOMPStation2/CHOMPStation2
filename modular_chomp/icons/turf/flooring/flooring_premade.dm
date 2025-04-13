#define O2SIF 0.181
#define N2SIF 0.819

#define MOLES_CELLSIF 114.50978

#define MOLES_O2SIF (MOLES_CELLSIF * O2SIF) // O2 value on Sif(18%)
#define MOLES_N2SIF (MOLES_CELLSIF * N2SIF) // N2 value on Sif(82%)

#define TEMPERATURE_SIF 243.15 // Roughly -30C / -22F
#define TEMPERATURE_ALTSIF 225.15


// Custom snow presets for the cryosauna
/turf/simulated/floor/snow/snow2/cryosauna
	temperature = 263.15 // All we're doing here is manually setting the temperature

/turf/simulated/floor/wood/cryosauna
	temperature = 263.15 // All we're doing here is manually setting the temperature

/turf/simulated/floor/lava/external
	oxygen		= MOLES_O2SIF
	nitrogen	= MOLES_N2SIF
	temperature	= TEMPERATURE_SIF
