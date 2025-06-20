// You probably don't want to tick this file yet.

#if !defined(USING_MAP_DATUM)

	#include "southern_cross_areas_planet.dm"
	#include "southern_cross_areas.dm"
	#include "southern_cross_defines.dm"
	#include "southern_cross_elevator.dm"
	#include "southern_cross_presets.dm"

	#include "turfs/outdoors.dm"

	// Map specific
	#include "southern_cross_overrides.dm"
	#include "southern_cross_shuttles.dm"

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

	#include "submaps/_southern_cross_submaps.dm" //This contains VR world and gateway stuff


//PLANETS, installations, sectors, ships, etc for the overmap, I want put here. Add new comments and includes when you make new planets
	//SIF - Planet
	#include "overmap/sectors_sc.dm" //This is actually the sector for SC.
	#include "overmap/sectors_sif.dm" //This is actually the sector for Sif.
	#include "overmap/space/carrier.dm" //Explo carrier

	#define USING_MAP_DATUM /datum/map/southern_cross

	// todo: map.dmm-s here

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring Southern Cross

#endif
