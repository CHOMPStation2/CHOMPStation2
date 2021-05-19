// You probably don't want to tick this file yet.

#if !defined(USING_MAP_DATUM)

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
	#include "loadout/loadout_suit.dm"
	#include "loadout/loadout_uniform.dm"

	#include "datums/supplypacks/munitions.dm"
	#include "items/encryptionkey_sc.dm"
	#include "items/headset_sc.dm"
	#include "items/clothing/sc_suit.dm"
	#include "items/clothing/sc_under.dm"
	#include "items/clothing/sc_accessory.dm"
	#include "job/outfits.dm"
	#include "structures/closets/engineering.dm"
	#include "structures/closets/medical.dm"
	#include "structures/closets/misc.dm"
	#include "structures/closets/research.dm"
	#include "structures/closets/security.dm"
	#include "turfs/outdoors.dm"
	#include "overmap/sectors.dm"
	#include "events/wildlife_encounter.dm"

	//CHOMPStation Edit Start TFF 25/3/20 - Station level map z-levels separated into 3 distinct files to work with MapDiffBot. All other files renamed accordingly.
	#include "southern_cross-1.dmm"
	#include "southern_cross-2.dmm"
	#include "southern_cross-3.dmm"
//	#include "southern_cross-4.dmm" CHOMPedit: Disabling empty space map because the overmap now generates empty space on its own for space transit.7
	#include "southern_cross-5.dmm"
	#include "southern_cross-6.dmm"
	#include "southern_cross-7.dmm"
	#include "southern_cross-8.dmm"
	#include "southern_cross-9.dmm"
	#include "southern_cross-10.dmm"
	//CHOMPStation Edit End
	//#include "southern_cross-casino.dmm" //CHOMPedit: Disabled to save resources and loaded in during events - Jack

	#include "submaps/_southern_cross_submaps.dm"

	#define USING_MAP_DATUM /datum/map/southern_cross

	// todo: map.dmm-s here

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring Southern Cross

#endif
