// You probably don't want to tick this file yet.

#if !defined(USING_MAP_DATUM)

	// CHOMPStation Edits Start: Disabling specific includes as vorestation.dme has them already loading via #includes there. UPDATE THIS if that changes.
	#include "tropic_southern_cross_areas.dm"
	#include "tropic_southern_cross_defines.dm"
	#include "tropic_southern_cross_elevator.dm"
	#include "tropic_southern_cross_events.dm"
	#include "tropic_southern_cross_overrides.dm"
	#include "tropic_southern_cross_presets.dm"
	#include "tropic_southern_cross_shuttles.dm"
	#include "tropic_southern_cross_shuttles_ch.dm"
	#include "shuttles/crew_shuttles.dm"
	#include "shuttles/crew_shuttles_ch.dm"
	#include "shuttles/heist.dm"
	#include "shuttles/merc.dm"
	#include "shuttles/ninja.dm"
	#include "shuttles/ert.dm"

	#include "loadout/loadout_accessories.dm"
	// #include "loadout/loadout_suit.dm"
	// #include "loadout/loadout_uniform.dm"

	#include "datums/supplypacks/munitions.dm"

	// #include "items/encryptionkey_sc.dm"
	// #include "items/headset_sc.dm"
	// #include "items/clothing/sc_suit.dm"
	// #include "items/clothing/sc_under.dm"
	// #include "items/clothing/sc_accessory.dm"
	#include "job/outfits.dm"
	// #include "structures/closets/engineering.dm"
	// #include "structures/closets/medical.dm"
	// #include "structures/closets/misc.dm"
	// #include "structures/closets/research.dm"
	// #include "structures/closets/security.dm"
	//#include "turfs/outdoors.dm" //Moved inclusion to vorestation.dme to appease CI's smooth brain.
	#include "events/wildlife_encounter.dm"

	// CHOMPStation Edits End - Un-disable these includes if vorestation.dme ever removes them from their #includes.

	#if !AWAY_MISSION_TEST //Don't include these for just testing away missions if the flag is set to true in /code/_away_mission_tests.dm
		#include "tropic_southern_cross-1.dmm" //Deck 1 z1
		#include "tropic_southern_cross-2.dmm" //Deck 2 z2
		#include "tropic_southern_cross-3.dmm" //Deck 3 z3
		#include "tropic_southern_cross-4.dmm" //Underground 1
		#include "tropic_southern_cross-5.dmm" //Surface
		#include "tropic_southern_cross-7.dmm" //Carrier z6
		#include "tropic_southern_cross-8.dmm" //Centcom z7
		#include "tropic_southern_cross-9.dmm" //Transit z8
		#include "tropic_southern_cross-10.dmm" //Underground 4
		#include "tropic_southern_cross-11.dmm" //Underground 3
		//#include "tropic_southern_cross-23.dmm" //Underground 2

	#endif
//	#include "southern_cross-casino.dmm" //CHOMPedit: Disabled to save resources and loaded in during events - Jack

	#include "submaps/_southern_cross_submaps.dm" //This contains VR world and gateway stuff


//PLANETS, installations, sectors, ships, etc for the overmap, I want put here. Add new comments and includes when you make new planets
	#include "overmap/shuttles.dm"
	//SIF - Planet
	#include "overmap/sectors.dm" //This is actually the sector for Sif. This also includes places like the main station and the surface
	//KARA - Planet
	//SPACE - Anything random in space
	#include "overmap/space/fueldepot.dm" //This is a fuel depot in space.




	#define USING_MAP_DATUM /datum/map/tropic_southern_cross

	// todo: map.dmm-s here

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring Southern Cross

#endif
