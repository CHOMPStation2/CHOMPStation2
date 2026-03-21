#if !defined(USING_MAP_DATUM)

	#include "cryogaia_defines.dm"
	#include "cryogaia_turfs.dm"
	#include "cryogaia_jobs.dm"
	#include "job/outfits.dm"
	#include "job/outfits_yw.dm"
	#include "cryogaia_things.dm"
	#include "tether_phoronlock.dm"
	#include "cryogaia_areas.dm"
	#include "cryogaia_shuttle_defs.dm"
	#include "cryogaia_shuttles.dm"
	#include "cryogaia_telecomms.dm"
	#include "elevator_areas.dm"
	#include "service_elevator_things.dm"
	#include "residential/_residential.dm"
	#include "residential/residential_keys.dm"

	#ifndef AWAY_MISSION_TEST //Don't include these for just testing away missions
		#include "cryogaia-01-centcomm.dmm" //centcom
		#include "cryogaia-02-mining.dmm" //mining
		#include "cryogaia-03-transit.dmm" //transit level
		#include "cryogaia-04-maintenance.dmm" //lowerlevel
		#include "cryogaia-05-main.dmm" //main level
		#include "cryogaia-06-upper.dmm" //upper level
		#include "cryogaia-07-misc.dmm" //misc
		#include "cryogaia-09-wilderness.dmm" //wilderness
		#include "cryogaia-10-caves.dmm" // caves
		#include "residential/residential.dmm" //residential level
	#endif

	#include "submaps/_cryogaia_submaps.dm"

	#define USING_MAP_DATUM /datum/map/cryogaia

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring Cryogaia

#endif
