#if !defined(USING_MAP_DATUM)
	#include "cryogaia-1.dmm" //mining
	#include "cryogaia-2.dmm" //lowerlevel
	#include "cryogaia-3.dmm" //main level
	#include "cryogaia-4.dmm" //centcom

	#include "cryogaia_defines.dm"
	#include "cryogaia_turfs.dm"
	#include "cryogaia_things.dm"
	#include "cryogaia_areas.dm"
	#include "tether_phoronlock.dm"
	#include "cryogaia_shuttle_defs.dm"
	#include "cryogaia_shuttles.dm"
	#include "cryogaia_telecomms.dm"
	#include "cryogaia_borealismajoris.dm"
	#include "elevator_areas.dm"
	#include "service_elevator_things.dm"
	#include "submaps/_tether_submaps.dm"

	#define USING_MAP_DATUM /datum/map/cryogaia

#elif !defined(MAP_OVERRIDE)

#endif