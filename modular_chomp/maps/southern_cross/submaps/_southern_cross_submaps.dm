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
//#include "../overmap/planets/kara/aerostat/aerostat.dmm" //Disabled due to low usage
//#include "../overmap/planets/kara/northern_star/northern_star_mine.dmm" //Disabled due to low usage
#include "../overmap/space/fueldepot.dmm"
#include "../overmap/planets/thor/thor.dmm" //The datum is in southern_cross_defines.dm
#include "../overmap/planets/tyr/tyr.dmm"
#include "gateway/BaseBlep.dmm"
#include "gateway/maddnesslab.dmm"
#include "gateway/snowfield.dmm"
// #include "gateway/hiddeneclipse.dmm" //needs remaping and energy is low.
#include "../../virtual_reality/constructVR.dmm"
#endif


//////////////////////////////////////////////////////////////////////////////////////

// Gateway submaps go here
/datum/map_template/sc_lateload/gateway
	name = "Gateway Submap"
	desc = "Please do not use this."
	mappath = null
	associated_map_datum = null

/datum/map_z_level/sc_lateload/gateway_destination
	name = "Gateway Destination"
	z = Z_LEVEL_SC_GATEWAY

#include "gateway/snowfield_ch.dm" //CHOMPEDIT - Use the good one instead
/datum/map_template/sc_lateload/gateway/snowfield
	name = "Snow Field"
	desc = "An old base in middle of snowy wasteland"
	mappath = "modular_chomp/maps/southern_cross/submaps/gateway/snowfield.dmm"

#include "gateway/darkrps.dm"
/datum/map_template/sc_lateload/gateway/darkrps
	name = "Abandoned City"
	desc = "An abandoned city overrun with piracy and mercernaries."
	mappath = "modular_chomp/maps/southern_cross/submaps/gateway/darkrps.dmm"
	associated_map_datum = /datum/map_z_level/sc_lateload/gateway_destination

#include "gateway/diescraper.dm"
/datum/map_template/sc_lateload/gateway/diescraper
	name = "Skyscraper"
	desc = "A skyscraper of various businesses, apartments, and recreations. Do not fall"
	mappath = "modular_chomp/maps/southern_cross/submaps/gateway/diescraper.dmm"
	associated_map_datum = /datum/map_z_level/sc_lateload/gateway_destination

#include "gateway/BaseBlep.dm"
/datum/map_template/sc_lateload/gateway/baseblep
	name = "Base Blep"
	desc = "A brand new but already lost base at the end of a squishy canyon"

	mappath = "modular_chomp/maps/southern_cross/submaps/gateway/BaseBlep.dmm"
	associated_map_datum = /datum/map_z_level/sc_lateload/gateway_destination

#include "gateway/maddnesslab.dm"
/datum/map_template/sc_lateload/gateway/maddnesslab
	name = "Maddness Lab"
	desc = "An ancient base brimming with creations of maddness"
	mappath = "modular_chomp/maps/southern_cross/submaps/gateway/maddnesslab.dmm"
	associated_map_datum = /datum/map_z_level/sc_lateload/gateway_destination

#include "gateway/carpfarm.dm"
/datum/map_template/sc_lateload/gateway/carpfarm
	name = "Carp Farm"
	desc = "Asteroid base surrounded by carp"
	mappath = "modular_chomp/maps/southern_cross/submaps/gateway/carpfarm.dmm"
	associated_map_datum = /datum/map_z_level/sc_lateload/gateway_destination
/*
#include "gateway/hiddeneclipse.dm"
/datum/map_template/sc_lateload/gateway/hiddeneclipse
	name = "Distant Mining Facility"
	desc = "Asteroid mining facility, lost to unknown horrors"
	mappath = "modular_chomp/maps/southern_cross/submaps/gateway/hiddeneclipse.dmm"
	associated_map_datum = /datum/map_z_level/sc_lateload/gateway_destination
*/
//VR maps go here, tell me if theres a better way to load this
// #include "virtual_reality/constructVR.dm" Virtual Reality areas included by default.
//#include "maps/virtual_reality/constructVR.dm" //Included in .dme
/datum/map_template/sc_lateload/vr_world
	name = Z_NAME_VR_WORLD_CH
	desc = "A dynamic, virtual world."
	mappath = "modular_chomp/maps/virtual_reality/constructVR.dmm" //Use modular
	associated_map_datum = /datum/map_z_level/sc_lateload/vr_world

/datum/map_z_level/sc_lateload/vr_world
	name = "VR World"

/datum/map_template/sc_lateload/thor
	name = Z_NAME_THOR
	desc = "The jungle like surface of Sif's moon"
	mappath = "modular_chomp/maps/southern_cross/overmap/planets/thor/thor.dmm"
	associated_map_datum = /datum/planet/thor

/datum/map_template/sc_lateload/tyr
	name = Z_NAME_TYR
	desc = "An anomalous valley within tyr"
	mappath = "modular_chomp/maps/southern_cross/overmap/planets/tyr/tyr.dmm"
	associated_map_datum = /datum/planet/tyr

//////////////////////////////////////////////////////////////////////////////////////
// Code Shenanigans for lateload maps

/datum/map_template/sc_lateload
	allow_duplicates = FALSE
	var/associated_map_datum

/datum/map_template/sc_lateload/on_map_loaded(z)
	if(!associated_map_datum || !ispath(associated_map_datum))
		log_game("Extra z-level [src] has no associated map datum")
		return

	new associated_map_datum(using_map, z)

/datum/map_z_level/sc_lateload
	z = 0
	flags = MAP_LEVEL_SEALED

/datum/map_z_level/sc_lateload/New(var/datum/map/map, mapZ)
	if(mapZ && !z)
		z = mapZ
	return ..(map)
