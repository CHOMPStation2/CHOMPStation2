// You probably don't want to tick this file yet.

#if !defined(USING_MAP_DATUM)

	#include "soluna_nexus_areas.dm"
	#include "../southern_cross/southern_cross_areas_planet.dm"
	#include "soluna_nexus_defines.dm"
	#include "soluna_nexus_elevator.dm"
	#include "soluna_nexus_presets.dm"

	#include "../southern_cross/turfs/outdoors.dm"

	// Map specific
	#include "../southern_cross/southern_cross_overrides.dm"
	#include "../southern_cross/southern_cross_shuttles.dm"


	#ifndef AWAY_MISSION_TEST //Don't include these for just testing away missions if the flag is set to true in /code/_away_mission_tests.dm
//		#include "southern_cross-0.dmm" // Deck 0
		#include "soluna_nexus-1.dmm" //Deck 1 z1
		#include "soluna_nexus-2.dmm" //Deck 2 z2
		#include "soluna_nexus-3.dmm" //Deck 3 z3
		#include "../southern_cross/southern_cross-5.dmm" //Sif outpost z4, we are shifted 1 off from SC, this only works as we have the order done right on SC!
		#include "../southern_cross/southern_cross-6.dmm" //Sif mine z5, we are shifted 1 off from SC, this only works as we have the order done right on SC!
		#include "soluna_nexus-6.dmm" //Carrier z6
		#include "soluna_nexus-7.dmm" //Centcom z7
		#include "soluna_nexus-8.dmm" //Transit z8
		#include "../southern_cross/southern_cross-10.dmm" //Sif wilds z9, we are shifted 1 off from SC, this only works as we have the order done right on SC!
//		#include "southern_cross-10.dmm" //Valley z10 seemingly. For stranger critters and POIs. //Removed for an event.
//		#include "southern_cross-12.dmm" //Skylands z10 //Remove due to lack of use
//		#include "southern_cross-13.dmm" //Valley z10 seemingly. For stranger critters and POIs. //Removed for an event.
//		#include "southern_cross-15.dmm" //Empty space CHOMPedit: Disabling empty space map because the overmap now generates empty space on its own for space transit.

	#endif
//	#include "southern_cross-casino.dmm" //CHOMPedit: Disabled to save resources and loaded in during events - Jack

	#include "../southern_cross/submaps/_southern_cross_submaps.dm" //This contains VR world and gateway stuff


//PLANETS, installations, sectors, ships, etc for the overmap, I want put here. Add new comments and includes when you make new planets
	//SIF - Planet
	#include "overmap/sectors_sn.dm" //This is actually the sector for SN.
	#include "../southern_cross/overmap/sectors_sif.dm" //This is actually the sector for Sif.
	#include "../southern_cross/overmap/planets/kara/kara_OM_only.dm" //Kara, but just an OM icon




	#define USING_MAP_DATUM /datum/map/soluna_nexus

	// todo: map.dmm-s here

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring Soluna Nexus

#endif
