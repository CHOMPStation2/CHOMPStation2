// You probably don't want to tick this file yet.

#if !defined(USING_MAP_DATUM)

	#include "southern_cross_defines.dm"

	#include "turfs/outdoors.dm"

	// Map specific
	#include "southern_cross_overrides.dm"
	#include "southern_cross_shuttles.dm"
	#include "southern_cross_presets.dm"

	#ifndef AWAY_MISSION_TEST //Don't include these for just testing away missions if the flag is set to true in /code/_away_mission_tests.dm
		#include "southern_cross-1.dmm" //	Deck 0 z1
		#include "southern_cross-2.dmm" //	Deck 1 z2
		#include "southern_cross-3.dmm" //	Deck 2 z3
		#include "southern_cross-4.dmm" //	Deck 3 z4
//		#include "southern_cross-4-unused.dmm" //Empty space CHOMPedit: Disabling empty space map because the overmap now generates empty space on its own for space transit.
		#include "southern_cross-5.dmm" //	Sif outpost z5
		#include "southern_cross-6.dmm" //	Sif mine z6
		#include "southern_cross-7.dmm" //	Carrier z7
		#include "southern_cross-8.dmm" //	Centcom z8
		#include "southern_cross-9.dmm" //	Transit z9
		#include "southern_cross-10.dmm" //	Sif wilds z10
//		#include "southern_cross-12-unused.dmm" //Skylands z10 //Remove due to lack of use
		// #include "southern_cross-13.dmm" //Valley z11 seemingly. For stranger critters and POIs.
	#endif

	#define USING_MAP_DATUM /datum/map/southern_cross

	// todo: map.dmm-s here

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring Southern Cross

#endif
