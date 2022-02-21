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
	#include "turfs/outdoors.dm"
	#include "events/wildlife_encounter.dm"

	// CHOMPStation Edits End - Un-disable these includes if vorestation.dme ever removes them from their #includes.

	//CHOMPStation Edit Start TFF 25/3/20 - Station level map z-levels separated into 3 distinct files to work with MapDiffBot. All other files renamed accordingly.
	#include "southern_cross-1.dmm" //Deck 1
	#include "southern_cross-2.dmm" //Deck 2
	#include "southern_cross-3.dmm" //Deck 3
//	#include "southern_cross-4.dmm" //Empty space CHOMPedit: Disabling empty space map because the overmap now generates empty space on its own for space transit.7
	#include "southern_cross-5.dmm" //Sif outpost
	#include "southern_cross-6.dmm" //Sif mine
	#include "southern_cross-7.dmm" //Carrier
	#include "southern_cross-8.dmm" //Centcom
	#include "southern_cross-9.dmm" //Transit
	#include "southern_cross-10.dmm" //Sif wilds
	//CHOMPStation Edit End
//	#include "southern_cross-casino.dmm" //CHOMPedit: Disabled to save resources and loaded in during events - Jack

	#include "submaps/_southern_cross_submaps.dm" //This contains gateway stuff


//PLANETS, installations, sectors, ships, etc for the overmap, I want put here. Add new comments and includes when you make new planets
	//SIF - Planet
	#include "overmap/sectors.dm" //This is actually the sector for Sif. This also includes places like the main station and the surface
	//KARA - Planet
	#include "overmap/planets/kara/kara.dm" //And this is the sector for Kara. I have decided to better organize future planets and maps for them
	#include "overmap/planets/kara/aerostat/aerostat.dm" //This is an installation for Kara.
	//SPACE - Anything random in space
	#include "overmap/space/fueldepot.dm" //This is a fuel depot in space.




	#define USING_MAP_DATUM /datum/map/southern_cross

	// todo: map.dmm-s here

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring Southern Cross

#endif
