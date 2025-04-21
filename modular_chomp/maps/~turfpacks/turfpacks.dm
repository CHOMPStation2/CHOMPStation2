// Available turfpacks:
// packs_sim/turfpacks_sim_tiled
// packs_sim/turfpacks_sim_outdoors
// packs_sim/turfpacks_sim_walls
// packs_sim/turfpacks_sim_special
// packs_unsim/turfpacks_unsim_tiled
// packs_unsim/turfpacks_unsim_outdoors
// packs_unsim/turfpacks_unsim_walls
// packs_unsim/turfpacks_unsim_special


// AIRLESS ATMOS
#define TURFPACK_PACKNAME airless
#define TURFPACK_TEMP T20C
#define TURFPACK_O2 0
#define TURFPACK_N2 0
#define TURFPACK_PHORON 0
#define TURFPACK_CO2 0

#include "packs_sim/turfpacks_sim_tiled.dm"
#include "packs_sim/turfpacks_sim_outdoors.dm"
#include "packs_sim/turfpacks_sim_walls.dm"
#include "packs_sim/turfpacks_sim_special.dm"
#include "packs_unsim/turfpacks_unsim_tiled.dm"
#include "packs_unsim/turfpacks_unsim_outdoors.dm"
#include "packs_unsim/turfpacks_unsim_walls.dm"
#include "packs_unsim/turfpacks_unsim_special.dm"

#undef TURFPACK_PACKNAME
#undef TURFPACK_TEMP
#undef TURFPACK_O2
#undef TURFPACK_N2
#undef TURFPACK_PHORON
#undef TURFPACK_CO2

// STATION ATMOS
#define TURFPACK_PACKNAME station
#define TURFPACK_TEMP T20C
#define TURFPACK_O2 MOLES_O2STANDARD
#define TURFPACK_N2 MOLES_N2STANDARD
#define TURFPACK_PHORON 0
#define TURFPACK_CO2 0

#include "packs_sim/turfpacks_sim_tiled.dm"
#include "packs_sim/turfpacks_sim_outdoors.dm"
#include "packs_sim/turfpacks_sim_walls.dm"
#include "packs_sim/turfpacks_sim_special.dm"
#include "packs_unsim/turfpacks_unsim_tiled.dm"
#include "packs_unsim/turfpacks_unsim_outdoors.dm"
#include "packs_unsim/turfpacks_unsim_walls.dm"
#include "packs_unsim/turfpacks_unsim_special.dm"

#undef TURFPACK_PACKNAME
#undef TURFPACK_TEMP
#undef TURFPACK_O2
#undef TURFPACK_N2
#undef TURFPACK_PHORON
#undef TURFPACK_CO2


// If those are not defined on a station map, use SC defaults
#ifndef TEMPERATURE_SIF
	#define TEMPERATURE_SIF 243.15
#endif

#ifndef MOLES_O2SIF
	#define MOLES_O2SIF (114.50978 * 0.181)
#endif

#ifndef MOLES_N2SIF
	#define MOLES_N2SIF (114.50978 * 0.819)
#endif

// SIF ATMOS
#define TURFPACK_PACKNAME sif
#define TURFPACK_TEMP TEMPERATURE_SIF
#define TURFPACK_O2 MOLES_O2SIF
#define TURFPACK_N2 MOLES_N2SIF
#define TURFPACK_PHORON 0
#define TURFPACK_CO2 0

#include "packs_sim/turfpacks_sim_tiled.dm"
#include "packs_sim/turfpacks_sim_outdoors.dm"
#include "packs_sim/turfpacks_sim_walls.dm"
#include "packs_sim/turfpacks_sim_special.dm"
#include "packs_unsim/turfpacks_unsim_tiled.dm"
#include "packs_unsim/turfpacks_unsim_outdoors.dm"
#include "packs_unsim/turfpacks_unsim_walls.dm"
#include "packs_unsim/turfpacks_unsim_special.dm"

#undef TURFPACK_PACKNAME
#undef TURFPACK_TEMP
#undef TURFPACK_O2
#undef TURFPACK_N2
#undef TURFPACK_PHORON
#undef TURFPACK_CO2

// THOR ATMOS
#define TURFPACK_PACKNAME thor
#define TURFPACK_TEMP THOR_AVG_TEMP
#define TURFPACK_O2 THOR_MOL_O2
#define TURFPACK_N2 THOR_MOL_N2
#define TURFPACK_PHORON 0
#define TURFPACK_CO2 THOR_MOL_CO2

#include "packs_sim/turfpacks_sim_tiled.dm"
#include "packs_sim/turfpacks_sim_outdoors.dm"
#include "packs_sim/turfpacks_sim_walls.dm"
#include "packs_sim/turfpacks_sim_special.dm"
#include "packs_unsim/turfpacks_unsim_tiled.dm"
#include "packs_unsim/turfpacks_unsim_outdoors.dm"
#include "packs_unsim/turfpacks_unsim_walls.dm"
#include "packs_unsim/turfpacks_unsim_special.dm"

#undef TURFPACK_PACKNAME
#undef TURFPACK_TEMP
#undef TURFPACK_O2
#undef TURFPACK_N2
#undef TURFPACK_PHORON
#undef TURFPACK_CO2
