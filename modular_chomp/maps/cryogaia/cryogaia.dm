#if !defined(USING_MAP_DATUM)

	#include "cryogaia_defines.dm"

	#include "cryogaia_turfs.dm"

	// Map specific
	#include "cryogaia_things.dm"
	#include "cryogaia_areas.dm"
	#include "cryogaia_shuttle_defs.dm"
	#include "cryogaia_shuttles.dm"
	#include "cryogaia_telecomms.dm"
	#include "residential/_residential.dm"
	#include "residential/residential_keys.dm"
	#include "yw_vrstuff/_vrmaps.dm"

	#ifndef AWAY_MISSION_TEST //Don't include these for just testing away missions
		#include "cryogaia-01-centcomm.dmm" //centcom
		#include "cryogaia-02-mining.dmm" //mining
		#include "cryogaia-03-transit.dmm" //transit level
		#include "cryogaia-04-maintenance.dmm" //lowerlevel
		#include "cryogaia-05-main.dmm" //main level
		#include "cryogaia-06-upper.dmm" //upper level
		#include "cryogaia-07-misc.dmm" //misc
		#include "cryogaia-09-wilderness.dmm" //wilderness
		#include "submaps/cryogaia_underdark.dmm" //underdark
	#endif

	#define USING_MAP_DATUM /datum/map/cryogaia

	// todo: map.dmm-s here

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring Cryogaia

#endif
