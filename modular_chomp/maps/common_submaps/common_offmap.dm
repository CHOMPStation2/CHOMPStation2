// This causes submap maps to get 'checked' and compiled, when undergoing a unit test.
// This is so Travis can validate PoIs, and ensure future changes don't break PoIs, as PoIs are loaded at runtime and the compiler can't catch errors.

///////////////////////////////////////////////////////////////////////////////
// Primary Load - these are areas that will ALWAYS be in play.


//////////////////////////////////////////////////////////////////////////////
/// Away Missions
/// If you're reading this and want to add a new away mission, reference /tether/submaps/_tether_submaps.dm or existing away missions for how to set it up.

// This is for integration tests only.
// Always add any new away missions/gateways/lateloaded maps that are not PoIs here.
#ifdef AWAY_MISSION_TEST
#include "../overmap/space/fueldepot.dmm"
#include "overmap/planets/thor/thor.dmm" //The datum is in southern_cross_defines.dm
#include "overmap/planets/tyr/tyr.dmm"
#include "gateway/BaseBlep.dmm"
#include "gateway/maddnesslab.dmm"
#include "gateway/snowfield.dmm"
#include "virtual_reality/constructVR.dmm"
#endif

#include "fueldepot/fueldepot.dm"

//////////////////////////////////////////////////////////////////////////////////////
// Gateway submaps go here
#include "gateway/snowfield_ch.dm" //CHOMPEDIT - Use the good one instead
/datum/map_template/common_lateload/gateway/snowfield_ch
	name = Z_NAME_GATEWAY_SNOW_FIELD_CH
	name_alias = Z_NAME_ALIAS_GATEWAY
	desc = "An old base in middle of snowy wasteland"
	mappath = "modular_chomp/maps/common_submaps/gateway/snowfield.dmm"

#include "gateway/darkrps.dm"
/datum/map_template/common_lateload/gateway/darkrps
	name = Z_NAME_GATEWAY_ABANDONED_CITY_CH
	name_alias = Z_NAME_ALIAS_GATEWAY
	desc = "An abandoned city overrun with piracy and mercernaries."
	mappath = "modular_chomp/maps/common_submaps/gateway/darkrps.dmm"

#include "gateway/diescraper.dm"
/datum/map_template/common_lateload/gateway/diescraper
	name = Z_NAME_GATEWAY_SKYSCRAPER_CH
	name_alias = Z_NAME_ALIAS_GATEWAY
	desc = "A skyscraper of various businesses, apartments, and recreations. Do not fall"
	mappath = "modular_chomp/maps/common_submaps/gateway/diescraper.dmm"

#include "gateway/BaseBlep.dm"
/datum/map_template/common_lateload/gateway/baseblep
	name = Z_NAME_GATEWAY_BASE_BLEP_CH
	name_alias = Z_NAME_ALIAS_GATEWAY
	desc = "A brand new but already lost base at the end of a squishy canyon"

	mappath = "modular_chomp/maps/common_submaps/gateway/BaseBlep.dmm"

#include "gateway/maddnesslab.dm"
/datum/map_template/common_lateload/gateway/maddnesslab
	name = Z_NAME_GATEWAY_MADNESS_LAB_CH
	name_alias = Z_NAME_ALIAS_GATEWAY
	desc = "An ancient base brimming with creations of maddness"
	mappath = "modular_chomp/maps/common_submaps/gateway/maddnesslab.dmm"

#include "gateway/carpfarm.dm"
/datum/map_template/common_lateload/gateway/carpfarm_ch
	name = Z_NAME_GATEWAY_CARP_FARM_CH
	name_alias = Z_NAME_ALIAS_GATEWAY
	desc = "Asteroid base surrounded by carp"
	mappath = "modular_chomp/maps/common_submaps/gateway/carpfarm.dmm"

#include "gateway/hiddeneclipse.dm"
/datum/map_template/common_lateload/gateway/hiddeneclipse
	name = Z_NAME_GATEWAY_HIDDEN_ECLIPSE_CH
	name_alias = Z_NAME_ALIAS_GATEWAY
	desc = "Asteroid mining facility, lost to unknown horrors"
	mappath = "modular_chomp/maps/common_submaps/gateway/hiddeneclipse.dmm"

//VR maps go here, tell me if theres a better way to load this
// #include "virtual_reality/constructVR.dm" Virtual Reality areas included by default.
//#include "maps/virtual_reality/constructVR.dm" //Included in .dme
/datum/map_template/common_lateload/vr_world
	name = Z_NAME_VR_WORLD_CH
	desc = "A dynamic, virtual world."
	mappath = "modular_chomp/maps/common_submaps/virtual_reality/constructVR.dmm" //Use modular
	associated_map_datum = /datum/map_z_level/common_lateload/vr_world

/datum/map_z_level/common_lateload/vr_world
	name = "VR World"

/datum/map_template/common_lateload/thor
	name = Z_NAME_PLANET_THOR_CH
	desc = "The jungle like surface of Sif's moon"
	mappath = "modular_chomp/maps/common_submaps/overmap/planets/thor/thor.dmm"
	// associated_map_datum needs to be overridden

/datum/map_template/common_lateload/tyr
	name = Z_NAME_PLANET_TYR_CH
	desc = "An anomalous valley within tyr"
	mappath = "modular_chomp/maps/common_submaps/overmap/planets/tyr/tyr.dmm"
	// associated_map_datum needs to be overridden

//////////////////////////////////////////////////////////////////////////////////////
// Code Shenanigans for lateload maps
/datum/map_z_level/common_lateload
	flags = MAP_LEVEL_SEALED
