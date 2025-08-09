// You probably don't want to tick this file yet.

#if !defined(USING_MAP_DATUM)

	#include "southern_cross_defines.dm"

	#include "turfs/outdoors.dm"

	// Map specific
	#include "southern_cross_overrides.dm"
	#include "southern_cross_shuttles.dm"

	#ifndef AWAY_MISSION_TEST //Don't include these for just testing away missions if the flag is set to true in /code/_away_mission_tests.dm
		#include "southern_cross-1.dmm" //	Deck 0 z1
		#include "southern_cross-2.dmm" //	Deck 1 z2
		#include "southern_cross-3.dmm" //	Deck 2 z3
		#include "southern_cross-4.dmm" //	Deck 3 z4
	#endif

	#define USING_MAP_DATUM /datum/map/southern_cross

	// todo: map.dmm-s here

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring Southern Cross

#endif
