#if !defined(USING_MAP_DATUM)
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

	#include "cryogaia-01-mining.dmm" //mining
	#include "cryogaia-02-maintenance.dmm" //lowerlevel
	#include "cryogaia-03-main.dmm" //main level
	#include "cryogaia-04-centcomm.dmm" //centcom

	#include "submaps/_tether_submaps.dm"

	#define USING_MAP_DATUM /datum/map/cryogaia

#elif !defined(MAP_OVERRIDE)

#endif