//i stole southern cross lol

#if !defined(USING_MAP_DATUM)

	// CHOMPStation Edits Start: Disabling specific includes as vorestation.dme has them already loading via #includes there. UPDATE THIS if that changes.
	#include "relicbase_areas.dm"
	#include "relicbase_defines.dm"
	#include "relicbase_elevator.dm"
	#include "relicbase_events.dm"
	//#include "relicbase_jobs.dm"
	#include "relicbase_overrides.dm"
	#include "relicbase_presets.dm"
	#include "relicbase_shuttles.dm"
	#include "relicbase_shuttles_ch.dm"
	#include "relicbase_things.dm"
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
	#include "overmap/sectors.dm"
	#include "events/wildlife_encounter.dm"

	#include "relicbase-1.dmm" //Underground
	#include "relicbase-2.dmm" //Ground level
	#include "relicbase-3.dmm" //Upper level
	#include "relicbase-4.dmm" //Mines
	#include "relicbase-5.dmm" //Wilderness
	#include "relicbase-6.dmm" //Ocean/Plains
	//#include "relicbase-7.dmm" //Explo carrier //shadowrealmed for now -- Ocelot
	#include "relicbase-8.dmm" //CC
	#include "relicbase-9.dmm" //Transit


//	#include "southern_cross-casino.dmm" //CHOMPedit: Disabled to save resources and loaded in during events - Jack

	#include "submaps/_relicbase_submaps.dm"

	#define USING_MAP_DATUM /datum/map/relicbase

	// todo: map.dmm-s here

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring Relic Base

#endif
