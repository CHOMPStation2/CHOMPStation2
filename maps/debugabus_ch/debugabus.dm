#if !defined(USING_MAP_DATUM)

	#include "debugabus.dmm"

	#include "debugabus_defines.dm"

	#define USING_MAP_DATUM /datum/map/debugabus

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring debugabus

#endif