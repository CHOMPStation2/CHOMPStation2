#if !defined(USING_MAP_DATUM)

	#include "tether_defines_yw.dm"
	#include "tether_turfs_yw.dm"
	#include "tether_things_yw.dm"
	#include "tether_phoronlock_yw.dm"
	#include "tether_areas_yw.dm"
	#include "tether_areas2_yw.dm"
	#include "tether_shuttle_defs_yw.dm"
	#include "tether_shuttles_yw.dm"
	#include "tether_telecomms_yw.dm"
	#include "tether_virgo3b_yw.dm"

	#include "tether-01-surface1_yw.dmm"
	#include "tether-02-surface2_yw.dmm"
	#include "tether-03-surface3_yw.dmm"
	#include "tether-04-transit_yw.dmm"
	#include "tether-05-station1_yw.dmm"
	#include "tether-06-station2_yw.dmm"
	#include "tether-07-station3_yw.dmm"
	#include "tether-08-mining_yw.dmm"
	#include "tether-09-solars_yw.dmm"
	#include "tether-10-colony_yw.dmm"

	#include "submaps/_tether_submaps.dm"

	#define USING_MAP_DATUM /datum/map/tether

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring Tether

#endif