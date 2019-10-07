#if !defined(USING_MAP_DATUM)

	#include "cryogaia_defines.dm"
	#include "cryogaia_turfs.dm"
	#include "cryogaia_things.dm"
	#include "tether_phoronlock.dm"
	#include "cryogaia_areas.dm"
	#include "cryogaia_shuttle_defs.dm"
	#include "cryogaia_shuttles.dm"
	#include "cryogaia_telecomms.dm"
	#include "cryogaia_borealismajoris.dm"
	#include "elevator_areas.dm"
	#include "service_elevator_things.dm"

	#include "cryogaia-01-centcomm.dmm" //centcom
	#include "cryogaia-02-mining.dmm" //mining
	#include "cryogaia-03-maintenance.dmm" //lowerlevel
	#include "cryogaia-04-main.dmm" //main level

//	#include "submaps/_tether_submaps.dm"

	#define USING_MAP_DATUM /datum/map/cryogaia

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring Cryogaia

#endif
