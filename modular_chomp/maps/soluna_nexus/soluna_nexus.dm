// You probably don't want to tick this file yet.

#if !defined(USING_MAP_DATUM)

	// CHOMPStation Edits Start: Disabling specific includes as vorestation.dme has them already loading via #includes there. UPDATE THIS if that changes.
	#include "soluna_nexus_areas.dm"
	#include "../southern_cross/southern_cross_areas_planet.dm"
	#include "soluna_nexus_defines.dm"
	#include "../southern_cross/southern_cross_sif_defines.dm"
	#include "soluna_nexus_elevator.dm"
	#include "../southern_cross/southern_cross_events.dm"
	#include "../southern_cross/southern_cross_overrides.dm"
	#include "soluna_nexus_presets.dm"
	#include "soluna_nexus_shuttles.dm"
	#include "../southern_cross/southern_cross_shuttles_ch.dm"
	#include "../southern_cross/shuttles/crew_shuttles.dm"
	#include "../southern_cross/shuttles/crew_shuttles_ch.dm"
	#include "../southern_cross/shuttles/heist.dm"
	#include "../southern_cross/shuttles/merc.dm"
	#include "../southern_cross/shuttles/ninja.dm"
	#include "../southern_cross/shuttles/ert.dm"

	#include "../southern_cross/loadout/loadout_accessories.dm"
	// #include "loadout/loadout_suit.dm"
	// #include "loadout/loadout_uniform.dm"

	#include "../southern_cross/datums/supplypacks/munitions.dm"

	// #include "items/encryptionkey_sc.dm"
	// #include "items/headset_sc.dm"
	// #include "items/clothing/sc_suit.dm"
	// #include "items/clothing/sc_under.dm"
	// #include "items/clothing/sc_accessory.dm"
	#include "../southern_cross/job/outfits.dm"
	// #include "structures/closets/engineering.dm"
	// #include "structures/closets/medical.dm"
	// #include "structures/closets/misc.dm"
	// #include "structures/closets/research.dm"
	// #include "structures/closets/security.dm"
	//#include "turfs/outdoors.dm" //Moved inclusion to vorestation.dme to appease CI's smooth brain.
	#include "../southern_cross/events/wildlife_encounter.dm"

	// CHOMPStation Edits End - Un-disable these includes if vorestation.dme ever removes them from their #includes.

	#if !AWAY_MISSION_TEST //Don't include these for just testing away missions if the flag is set to true in /code/_away_mission_tests.dm
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
	#include "../southern_cross/overmap/shuttles.dm"
	//SIF - Planet
	#include "overmap/sectors_sn.dm" //This is actually the sector for SN.
	#include "../southern_cross/overmap/sectors_sif.dm" //This is actually the sector for Sif.
	#include "../southern_cross/overmap/planets/kara/kara_OM_only.dm" //Kara, but just an OM icon
	/* //Disabled due to low usage. These are heavy mini-station-like Z layers too.
	//KARA - Planet
	#include "overmap/planets/kara/kara.dm" //And this is the sector for Kara. I have decided to better organize future planets and maps for them
	//KARA Z layers
	#include "overmap/planets/kara/northern_star/northern_star.dm" //This is the actual map info that we're using for kara
	#include "overmap/planets/kara/aerostat/aerostat.dm" //This is an installation for Kara.
	*/
	#include "../southern_cross/overmap/planets/thor/thor.dm"
	#include "../southern_cross/overmap/planets/tyr/tyr.dm"

	//SPACE - Anything random in space
	#include "../southern_cross/overmap/space/fueldepot.dm" //This is a fuel depot in space.




	#define USING_MAP_DATUM /datum/map/soluna_nexus

	// todo: map.dmm-s here

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring Southern Cross

#endif
