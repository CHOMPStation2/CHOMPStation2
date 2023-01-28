/*
Toggle this var to 1 to compile using runtime station instead.
Useful if you're constantly having to recompile to debug something.
*/
#define RUNTIME_STATION 0

#if RUNTIME_STATION
	#include "modular_chomp/maps/runtime/runtime_station_defines.dm"
	#include "modular_chomp/maps/runtime/runtime_station.dmm"
	#define USING_MAP_DATUM /datum/map/runtime_station
#endif