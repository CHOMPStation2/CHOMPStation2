// This causes submap maps to get 'checked' and compiled, when undergoing a unit test.
// This is so Travis can validate PoIs, and ensure future changes don't break PoIs, as PoIs are loaded at runtime and the compiler can't catch errors.

///////////////////////////////////////////////////////////////////////////////
// Primary Load - these are areas that will ALWAYS be in play.
/*
// TL;DR: _submaps.dm holds the templates. _areas.dm holds the areas. _things.dm holds SUBMAP-SPECIFIC things, such as a knife that only appears in underground-specific POIs.
#include "mining/_mining_submaps.dm" // These go underground, for mining.
#include "mining/_mining_areas.dm" // The areas, separated from the actual submaps file.
// #include "mining/mining_things.dm" // - This is not in use, but other submaps may want their own specific _things folder for, say, mining-specific stuff.

#include "outpost/_outpost_submaps.dm" // These go on the MAIN map, Z2.
#include "outpost/_outpost_areas.dm" // The areas, separated from the actual submaps file.
// #include "outpost/_outpost_things.dm" // - This is not in use, but other submaps may want their own specific _things folder for, say, mining-specific stuff.

#include "wilderness/_wilderness_submaps.dm" // These go in wilderness, north of the main outpost.
#include "wilderness/_wilderness_areas.dm" // The areas, separated from the actual submaps file.
// #include "wilderness/_wilderness_things.dm" // - This is not in use, but other submaps may want their own specific _things folder for, say, mining-specific stuff.

#include "ocean/_ocean_submaps.dm" // These go on the ocean Z-level, south of main outpost.
#include "ocean/_ocean_areas.dm" // The areas, separated from the actual submaps file.
// #include "ocean/_ocean_things.dm" // - This is not in use, but other submaps may want their own specific _things folder for, say, mining-specific stuff.

// Inserting this here, but this is where all our submap /area/'s draw from.
/area/submap/thor
	name = "Submap Area"
	icon_state = "submap"
	flags = RAD_SHIELDED
	ambience = AMBIENCE_RUINS
	secret_name = TRUE
	forbid_events = TRUE
	flags = AREA_FLAG_IS_NOT_PERSISTENT
*/
//////////////////////////////////////////////////////////////////////////////
/// Away Missions
/// If you're reading this and want to add a new away mission, reference /tether/submaps/_tether_submaps.dm or existing away missions for how to set it up.

/*
#if AWAY_MISSION_TEST
#include "beach/beach.dmm"
#include "beach/cave.dmm"
#include "alienship/alienship.dmm"
#include "aerostat/aerostat.dmm"
#include "aerostat/surface.dmm"
#include "space/debrisfield.dmm"
#endif
*/

// Commented out until we either port or replace away missions, but this is the framework for loading each away mission.

//////////////////////////////////////////////////////////////////////////////////////

// Gateway submaps go here
/datum/map_template/thor_lateload/gateway
	name = "Gateway Submap"
	desc = "Please do not use this."
	mappath = null
	associated_map_datum = null

/datum/map_z_level/thor_lateload/gateway_destination
	name = "Gateway Destination"
	z = Z_LEVEL_RB_GATEWAY

// Gateway maps from Chompers
#include "gateway/darkrps.dm"
/datum/map_template/thor_lateload/gateway/darkrps
	name = "Gateway - Abandoned City"
	desc = "An abandoned city overrun with piracy and mercernaries."
	mappath = "modular_chomp/maps/relic_base/submaps/gateway/darkrps.dmm"
	associated_map_datum = /datum/map_z_level/thor_lateload/gateway_destination

#include "gateway/BaseBlep.dm"
/datum/map_template/thor_lateload/gateway/baseblep
	name = "Base Blep"
	desc = "A brand new but already lost base at the end of a squishy canyon"

	mappath = "modular_chomp/maps/relic_base/submaps/gateway/BaseBlep.dmm"
	associated_map_datum = /datum/map_z_level/thor_lateload/gateway_destination

#include "gateway/maddnesslab.dm"
/datum/map_template/thor_lateload/gateway/maddnesslab
	name = "Maddness Lab"
	desc = "An ancient base brimming with creations of maddness"
	mappath = "modular_chomp/maps/relic_base/submaps/gateway/maddnesslab.dmm"
	associated_map_datum = /datum/map_z_level/thor_lateload/gateway_destination

#include "gateway/carpfarm.dm"
/datum/map_template/thor_lateload/gateway/carpfarm
	name = "Carp Farm"
	desc = "Asteroid base surrounded by carp"
	mappath = "modular_chomp/maps/relic_base/submaps/gateway/carpfarm.dmm"
	associated_map_datum = /datum/map_z_level/thor_lateload/gateway_destination

#include "gateway/hiddeneclipse.dm"
/datum/map_template/thor_lateload/gateway/hiddeneclipse
	name = "Distant Mining Facility"
	desc = "Asteroid mining facility, lost to unknown horrors"
	mappath = "modular_chomp/maps/relic_base/submaps/gateway/hiddeneclipse.dmm"
	associated_map_datum = /datum/map_z_level/thor_lateload/gateway_destination

//Gateway maps from Virgo!
#include "../../../../maps/gateway_vr/carpfarm.dm"
/datum/map_template/thor_lateload/gateway/carpfarm
	name = "Gateway - Carp Farm"
	desc = "Asteroid base surrounded by carp"
	mappath = "maps/gateway_vr/carpfarm.dmm"

#include "../../../../maps/gateway_vr/snowfield.dm"
/datum/map_template/thor_lateload/gateway/snowfield
	name = "Gateway - Snow Field"
	desc = "An old base in middle of snowy wasteland"
	mappath = "maps/gateway_vr/snowfield.dmm"

#include "../../../../maps/gateway_vr/listeningpost.dm"
/datum/map_template/thor_lateload/gateway/listeningpost
	name = "Gateway - Listening Post"
	desc = "Asteroid-bound mercenary listening post"
	mappath = "maps/gateway_vr/listeningpost.dmm"

#include "../../../../maps/gateway_vr/variable/honlethhighlands.dm"
/datum/map_template/thor_lateload/gateway/honlethhighlands_a
	name = "Gateway - Honleth Highlands A"
	desc = "The cold surface of some planet."
	mappath = "maps/gateway_vr/variable/honlethhighlands_a.dmm"

/datum/map_template/thor_lateload/gateway/honlethhighlands_b
	name = "Gateway - Honleth Highlands B"
	desc = "The cold surface of some planet."
	mappath = "maps/gateway_vr/variable/honlethhighlands_b.dmm"


#include "../../../../maps/gateway_vr/variable/arynthilake.dm"
/datum/map_template/thor_lateload/gateway/arynthilake
	name = "Gateway - Arynthi Lake A"
	desc = "A grassy surface with some abandoned structures."
	mappath = "maps/gateway_vr/variable/arynthilake_a.dmm"

/datum/map_template/thor_lateload/gateway/arynthilakeunderground
	name = "Gateway - Arynthi Lake Underground A"
	desc = "A grassy surface with some abandoned structures."
	mappath = "maps/gateway_vr/variable/arynthilakeunderground_a.dmm"

/datum/map_template/thor_lateload/gateway/arynthilake_b
	name = "Gateway - Arynthi Lake B"
	desc = "A grassy surface with some abandoned structures."
	mappath = "maps/gateway_vr/variable/arynthilake_b.dmm"

/datum/map_template/thor_lateload/gateway/arynthilakeunderground_b
	name = "Gateway - Arynthi Lake Underground B"
	desc = "A grassy surface with some abandoned structures."
	mappath = "maps/gateway_vr/variable/arynthilakeunderground_b.dmm"

#include "../../../../maps/gateway_vr/wildwest.dm"
/datum/map_template/thor_lateload/gateway/wildwest
	name = "Gateway - Wild West"
	desc = "A classic."
	mappath = "maps/gateway_vr/wildwest.dmm"

// Redgate submaps go here, taken straight up from virgo

#ifdef AWAY_MISSION_TEST
#include "redgate/cybercity.dmm"
#include "redgate/falls.dmm"
#include "redgate/fantasy_dungeon.dmm"
#include "redgate/fantasy.dmm"
#include "redgate/hotsprings.dmm"
#include "redgate/jungle_underground.dmm"
#include "redgate/jungle.dmm"
#include "redgate/stardog.dmm"
#endif

/datum/map_template/thor_lateload/redgate
	name = "Redgate Submap"
	desc = "Please do not use this."
	mappath = null
	associated_map_datum = /datum/map_z_level/thor_lateload/redgate_destination

/datum/map_z_level/thor_lateload/redgate_destination
	name = "Redgate Destination"
	z = Z_LEVEL_RB_REDGATE
	flags = MAP_LEVEL_PLAYER|MAP_LEVEL_SEALED

/datum/map_template/thor_lateload/redgate/on_map_loaded(z)
	. = ..()
	new /datum/random_map/automata/cave_system/no_cracks(null, 3, 3, Z_LEVEL_RB_REDGATE, world.maxx, world.maxy)
	new /datum/random_map/noise/ore(null, 1, 1, Z_LEVEL_RB_REDGATE, 64, 64)

/datum/map_template/thor_lateload/redgate/teppi_ranch
	name = "Redgate - Teppi Ranch"
	desc = "An abandoned teppi ranch!"
	mappath = "maps/redgate/teppiranch.dmm"

/datum/map_template/thor_lateload/redgate/innland
	name = "Redgate - Innland"
	desc = "Caves and grass and a tavern, woah!"
	mappath = "maps/redgate/innland.dmm"

/datum/map_template/thor_lateload/redgate/darkadventure
	name = "Redgate - Dark Adventure"
	desc = "This place seems broken!"
	mappath = "maps/redgate/darkadventure.dmm"

/datum/map_template/thor_lateload/redgate/stardog
	name = "Redgate - Star Dog"
	desc = "That's a big dog!"
	mappath = "modular_chomp/maps/relic_base/submaps/redgate/stardog.dmm"

#include "../../../../maps/redgate/eggnogtown.dm"
/datum/map_template/common_lateload/redgate/eggnogtown
	name = "Redgate - Eggnog Town"
	desc = "A comfortable snowy town."
	mappath = "maps/redgate/eggnogtown.dmm"

/datum/map_template/common_lateload/redgate/eggnogtownunderground
	name = "Redgate - Eggnog Town Underground"
	desc = "A comfortable snowy town."
	mappath = "maps/redgate/eggnogtownunderground.dmm"

/datum/map_template/thor_lateload/redgate/hotsprings
	name = "Redgate - Hotsprings"
	desc = "This place is rather cosy for somewhere so abandoned!"
	mappath = "modular_chomp/maps/relic_base/submaps/redgate/hotsprings.dmm"

/datum/map_template/thor_lateload/redgate/cybercity
	name = "Redgate - Rain City"
	desc = "A strange city on lockdown."
	mappath = "modular_chomp/maps/relic_base/submaps/redgate/cybercity.dmm"

/datum/map_template/thor_lateload/redgate/islands
	name = "Redgate - Islands"
	desc = "A series of islands out in the ocean."
	mappath = "maps/redgate/islands.dmm"

/datum/map_template/thor_lateload/redgate/islands_underwater
	name = "Redgate - Islands Underwater"
	desc = "A series of islands out in the ocean."
	mappath = "maps/redgate/islands_underwater.dmm"

/datum/map_template/thor_lateload/redgate/train
	name = "Redgate - Moving Train"
	desc = "A long train travelling to who-knows-where."
	mappath = "maps/redgate/train.dmm"

/datum/map_template/thor_lateload/redgate/train_upper
	name = "Redgate - Moving Train Upper Level"
	desc = "A long train travelling to who-knows-where."
	mappath = "maps/redgate/train_upper.dmm"

/datum/map_template/thor_lateload/redgate/fantasy
	name = "Redgate - Fantasy Town"
	desc = "A fantasy town full of low tech stuff."
	mappath = "modular_chomp/maps/relic_base/submaps/redgate/fantasy.dmm"

/datum/map_template/thor_lateload/redgate/fantasy_dungeon
	name = "Redgate - Fantasy Dungeon"
	desc = "A fantasy dungeon with lots of monsters and loot."
	mappath = "modular_chomp/maps/relic_base/submaps/redgate/fantasy_dungeon.dmm"

/datum/map_template/thor_lateload/redgate/laserdome
	name = "Redgate - Laserdome"
	desc = "A large orbital station with recreational facilities, namely a pair of laser tag arenas."
	mappath = "maps/redgate/laserdome.dmm"

/datum/map_template/thor_lateload/redgate/falls
	name = "Redgate - Cascading Falls"
	desc = "A world made up almost entirely of water, sprinkled with obscure marble structures."
	mappath = "modular_chomp/maps/relic_base/submaps/redgate/falls.dmm"

/datum/map_template/common_lateload/redgate/jungle
	name = "Redgate - Jungle"
	desc = "A fantasy town full of low tech stuff."
	mappath = "modular_chomp/maps/relic_base/submaps/redgate/jungle.dmm"

/datum/map_template/common_lateload/redgate/jungle_underground
	name = "Redgate - Jungle Underground"
	desc = "A fantasy dungeon with lots of monsters and loot."
	mappath = "modular_chomp/maps/relic_base/submaps/redgate/jungle_underground.dmm"

//////////////////////////////////////////////////////////////////////////////////////
// Code Shenanigans for lateload maps

/datum/map_template/thor_lateload
	allow_duplicates = FALSE
	var/associated_map_datum

/datum/map_template/thor_lateload/on_map_loaded(z)
	if(!associated_map_datum || !ispath(associated_map_datum))
		log_game("Extra z-level [src] has no associated map datum")
		return

	new associated_map_datum(using_map, z)

/datum/map_z_level/thor_lateload
	z = 0
	flags = MAP_LEVEL_SEALED

/datum/map_z_level/thor_lateload/New(var/datum/map/map, mapZ)
	if(mapZ && !z)
		z = mapZ
	return ..(map)
