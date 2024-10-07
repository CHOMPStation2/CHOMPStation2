// You probably don't want to tick this file yet.

#if !defined(USING_MAP_DATUM)

	// CHOMPStation Edits Start: Disabling specific includes as vorestation.dme has them already loading via #includes there. UPDATE THIS if that changes.
	#include "southern_cross_areas.dm"
	#include "southern_cross_defines.dm"
	#include "southern_cross_elevator.dm"
	#include "southern_cross_events.dm"
	#include "southern_cross_overrides.dm"
	#include "southern_cross_presets.dm"
	#include "southern_cross_shuttles.dm"
	#include "southern_cross_shuttles_ch.dm"
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
//		#include "southern_cross-0.dmm" // Deck 0
		#include "southern_cross-1.dmm" //Deck 1 z1
		#include "southern_cross-2.dmm" //Deck 2 z2
		#include "southern_cross-3.dmm" //Deck 3 z3
		#include "southern_cross-4.dmm" //Sif outpost z4
		#include "southern_cross-5.dmm" //Sif mine z5
		#include "southern_cross-6.dmm" //Carrier z6
		#include "southern_cross-7.dmm" //Centcom z7
		#include "southern_cross-8.dmm" //Transit z8
		#include "southern_cross-9.dmm" //Sif wilds z9
//		#include "southern_cross-10.dmm" //Valley z10 seemingly. For stranger critters and POIs. //Removed for an event.
//		#include "southern_cross-12.dmm" //Skylands z10 //Remove due to lack of use
//		#include "southern_cross-13.dmm" //Valley z10 seemingly. For stranger critters and POIs. //Removed for an event.
//		#include "southern_cross-15.dmm" //Empty space CHOMPedit: Disabling empty space map because the overmap now generates empty space on its own for space transit.

	#endif
//	#include "southern_cross-casino.dmm" //CHOMPedit: Disabled to save resources and loaded in during events - Jack

	#include "submaps/_southern_cross_submaps.dm" //This contains VR world and gateway stuff


//PLANETS, installations, sectors, ships, etc for the overmap, I want put here. Add new comments and includes when you make new planets
	#include "overmap/shuttles.dm"
	//SIF - Planet
	#include "overmap/sectors.dm" //This is actually the sector for Sif. This also includes places like the main station and the surface
	#include "overmap/planets/kara/kara_OM_only.dm" //Kara, but just an OM icon
	/* //Disabled due to low usage. These are heavy mini-station-like Z layers too.
	//KARA - Planet
	#include "overmap/planets/kara/kara.dm" //And this is the sector for Kara. I have decided to better organize future planets and maps for them
	//KARA Z layers
	#include "overmap/planets/kara/northern_star/northern_star.dm" //This is the actual map info that we're using for kara
	#include "overmap/planets/kara/aerostat/aerostat.dm" //This is an installation for Kara.
	*/
	#include "overmap/planets/thor/thor.dm"
	#include "overmap/planets/tyr/tyr.dm"

	//SPACE - Anything random in space
	#include "overmap/space/fueldepot.dm" //This is a fuel depot in space.




	#define USING_MAP_DATUM /datum/map/southern_cross

	// todo: map.dmm-s here

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring Southern Cross

#endif
