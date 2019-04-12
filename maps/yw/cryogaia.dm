#if !defined(USING_MAP_DATUM)

	#include "cryogaia_defines.dm"
	#include "cryogaia_turfs.dm"
	#include "tether_things.dm"
	#include "tether_areas.dm"
	#include "tether_areas2.dm"
	#include "tether_phoronlock.dm"
	#include "tether_shuttle_defs.dm"
	#include "tether_shuttles.dm"
	#include "centcom.dmm"
	#include "cryogaia_telecomms.dm"
	#include "cryogaia_borealismajoris.dm"
	#include "elevator_areas.dm"
	#include "service_elevator_things.dm"
	#include "cryogaia.dmm"
	#include "cryogaia_lowerlevel.dmm"
	#include "cryogaia_mining.dmm"

	#include "submaps/_tether_submaps.dm"

	#define USING_MAP_DATUM /datum/map/tether

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring Tether

#endif