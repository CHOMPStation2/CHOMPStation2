// You probably don't want to tick this file yet.

#if !defined(USING_MAP_DATUM)

	#include "cetus_defines.dm"


	// Map specific
	#include "../southern_cross/southern_cross_overrides.dm"
	#include "cetus_shuttles.dm"
	#include "../southern_cross/turfs/outdoors.dm"


	#ifndef AWAY_MISSION_TEST //Don't include these for just testing away missions if the flag is set to true in /code/_away_mission_tests.dm
		#include "cetus-1.dmm" //Deck 1 z1
		#include "cetus-2.dmm" //Deck 2 z2
		#include "cetus-3.dmm" //Deck 3 z3
	#endif

	#define USING_MAP_DATUM /datum/map/cetus
#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring Cetus Station

#endif
