#if !defined(USING_MAP_DATUM)

	#include "polaris-1_yw.dmm"
	#include "polaris-2_yw.dmm"
	#include "polaris-3_yw.dmm"
	#include "polaris-4_yw.dmm"
	#include "polaris-5_yw.dmm"

	#include "northern_star_defines_yw.dm"
	#include "northern_star_areas_yw.dm"
	#include "northern_star_shuttles_yw.dm"

	#define USING_MAP_DATUM /datum/map/northern_star

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring Northern Star

#endif

/obj/machinery/computer/shuttle_control/arrivals
    name = "shuttle control console"
    req_access = list(access_cent_general)
    shuttle_tag = "Arrivals"
