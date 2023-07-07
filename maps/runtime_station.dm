//Toggle this file if you want to compile and run an instance quicker for faster testing of non-map related things

#if !defined(USING_MAP_DATUM)
	#include "runtime_station_defines.dm"
	#include "runtime_station.dmm"
//Include these if you need them
//	#include "southern_cross/southern_cross_jobs.dm"
//	#include "southern_cross/loadout/loadout_accessories.dm"
//	#include "southern_cross/datums/supplypacks/munitions.dm"
//	#include "southern_cross/job/outfits.dm"
	#define USING_MAP_DATUM /datum/map/runtime_station
#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring Southern Cross

#endif
