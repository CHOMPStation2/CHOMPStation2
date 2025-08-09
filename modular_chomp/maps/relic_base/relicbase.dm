//i stole southern cross lol

#if !defined(USING_MAP_DATUM)

	#include "relicbase_defines.dm"

	// Map exclusive
	#include "relicbase_things.dm"
	#include "relicbase_overrides.dm"
	#include "shuttles/crew_shuttles_ch.dm"
	#include "relicbase_areas.dm"
	#include "turfs/outdoors.dm"
	#include "relicbase_shuttles.dm"

	#include "relicbase-1.dmm" //Catacombs - Z1
	#include "relicbase-2.dmm" //Underground - Z2
	#include "relicbase-3.dmm" //Ground level - Z3
	#include "relicbase-4.dmm" //Upper outpost levels - Z4
	#include "relicbase-5.dmm" //the SKY - Z5

//	#include "southern_cross-casino.dmm" //CHOMPedit: Disabled to save resources and loaded in during events - Jack

	#define USING_MAP_DATUM /datum/map/relicbase

	// todo: map.dmm-s here

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring Relic Base

#endif
