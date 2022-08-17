 // This causes tether submap maps to get 'checked' and compiled, when undergoing a unit test.
// This is so CI can validate PoIs, and ensure future changes don't break PoIs, as PoIs are loaded at runtime and the compiler can't catch errors.

//////////////////////////////////////////////////////////////////////////////
/// Static Load
<<<<<<< HEAD
//#include "tether_misc.dmm" //YW Addition, forces map to be compiled
/*/datum/map_template/tether_lateload/tether_misc //YW Edit, commented out this lateload
||||||| parent of 55ee669869... Merge pull request #11710 from Very-Soft/SDremaster
/datum/map_template/tether_lateload/tether_misc
=======

/datum/map_template/tether_lateload/tether_centcom
	name = "Tether - Centcom"
	desc = "Central Command lives here!"
	mappath = 'tether_centcom.dmm'

	associated_map_datum = /datum/map_z_level/tether_lateload/centcom

/datum/map_z_level/tether_lateload/centcom
	z = Z_LEVEL_CENTCOM
	name = "Centcom"
	flags = MAP_LEVEL_ADMIN|MAP_LEVEL_SEALED|MAP_LEVEL_CONTACT|MAP_LEVEL_XENOARCH_EXEMPT
	base_turf = /turf/simulated/floor/outdoors/rocks

/datum/map_template/tether_lateload/tether_misc
>>>>>>> 55ee669869... Merge pull request #11710 from Very-Soft/SDremaster
	name = "Tether - Misc"
	desc = "Misc areas, like some transit areas, holodecks, merc area."
	mappath = 'tether_misc.dmm'

	associated_map_datum = /datum/map_z_level/tether_lateload/misc

/datum/map_z_level/tether_lateload/misc
	z = Z_LEVEL_MISC
	name = "Misc"
	flags = MAP_LEVEL_ADMIN|MAP_LEVEL_SEALED|MAP_LEVEL_CONTACT|MAP_LEVEL_XENOARCH_EXEMPT

#include "underdark_pois/_templates.dm"
#include "underdark_pois/underdark_things.dm"
/datum/map_template/tether_lateload/tether_underdark
	name = "Tether - Underdark"
	desc = "Mining, but harder."
	mappath = 'tether_underdark.dmm'

	associated_map_datum = /datum/map_z_level/tether_lateload/underdark

/datum/map_z_level/tether_lateload/underdark
	name = "Underdark"
	flags = MAP_LEVEL_CONTACT|MAP_LEVEL_PLAYER|MAP_LEVEL_SEALED
	base_turf = /turf/simulated/mineral/floor/virgo3b
	z = Z_LEVEL_UNDERDARK

/datum/map_template/tether_lateload/tether_underdark/on_map_loaded(z)
	. = ..()
	seed_submaps(list(Z_LEVEL_UNDERDARK), 100, /area/mine/unexplored/underdark, /datum/map_template/underdark)
	new /datum/random_map/automata/cave_system/no_cracks(null, 3, 3, Z_LEVEL_UNDERDARK, world.maxx - 4, world.maxy - 4) // Create the mining Z-level.
	new /datum/random_map/noise/ore/underdark(null, 1, 1, Z_LEVEL_UNDERDARK, 64, 64)         // Create the mining ore distribution map.


/datum/map_template/tether_lateload/tether_plains
	name = "Tether - Plains"
	desc = "The Virgo 3B away mission."
	mappath = 'tether_plains.dmm'
	associated_map_datum = /datum/map_z_level/tether_lateload/tether_plains

/datum/map_z_level/tether_lateload/tether_plains
	name = "Away Mission - Plains"
	flags = MAP_LEVEL_CONTACT|MAP_LEVEL_PLAYER|MAP_LEVEL_SEALED
	base_turf = /turf/simulated/mineral/floor/virgo3b
	z = Z_LEVEL_PLAINS

/datum/map_template/tether_lateload/tether_plains/on_map_loaded(z)
	. = ..()
	seed_submaps(list(Z_LEVEL_PLAINS), 120, /area/tether/outpost/exploration_plains, /datum/map_template/surface/plains)

//////////////////////////////////////////////////////////////////////////////
//Antag/Event/ERT Areas

#include "../../submaps/admin_use_vr/ert.dm"
#include "../../submaps/admin_use_vr/mercship.dm"
<<<<<<< HEAD
#include "../../submaps/admin_use_vr/guttersite.dm"
||||||| parent of d14cd7fd46... Merge pull request #11396 from KillianKirilenko/kk-adminships
=======
#include "../../submaps/admin_use_vr/salamander_trader.dm"
>>>>>>> d14cd7fd46... Merge pull request #11396 from KillianKirilenko/kk-adminships

/datum/map_template/admin_use/ert
	name = "Special Area - ERT"
	desc = "It's the ERT ship! Lorge."
	mappath = 'maps/submaps/admin_use_vr/ert.dmm'

/datum/map_template/admin_use/trader
	name = "Special Area - Trader"
	desc = "Big trader ship."
	mappath = 'maps/submaps/admin_use_vr/tradeship.dmm'

/datum/map_template/admin_use/salamander_trader
	name = "Special Area - Salamander Trader"
	desc = "Modest trader ship."
	mappath = 'maps/submaps/admin_use_vr/salamander_trader.dmm'

/datum/map_template/admin_use/mercenary
	name = "Special Area - Merc Ship"
	desc = "Prepare tae be boarded, arr!"
	mappath = 'maps/submaps/admin_use_vr/kk_mercship.dmm'

/datum/map_template/admin_use/skipjack
	name = "Special Area - Skipjack Base"
	desc = "Stinky!"
	mappath = 'maps/submaps/admin_use_vr/skipjack.dmm'

/datum/map_template/admin_use/thunderdome
	name = "Special Area - Thunderdome"
	desc = "Thunderrrrdomeee"
	mappath = 'maps/submaps/admin_use_vr/thunderdome.dmm'

/datum/map_template/admin_use/wizardbase
	name = "Special Area - Wizard Base"
	desc = "Wingardium Levosia"
	mappath = 'maps/submaps/admin_use_vr/wizard.dmm'

/datum/map_template/admin_use/dojo
	name = "Special Area - Ninja Dojo"
	desc = "Sneaky"
	mappath = 'maps/submaps/admin_use_vr/dojo.dmm'

/datum/map_template/admin_use/guttersite
	name = "Special Area - Guttersite"
	desc = "A space for bad guys to hang out"
	mappath = 'maps/submaps/admin_use_vr/guttersite.dmm'

//////////////////////////////////////////////////////////////////////////////
//Rogue Mines Stuff

/datum/map_template/tether_lateload/tether_roguemines1
	name = "Asteroid Belt 1"
	desc = "Mining, but rogue. Zone 1"
	mappath = 'maps/submaps/rogue_mines_vr/rogue_mine1.dmm'

	associated_map_datum = /datum/map_z_level/tether_lateload/roguemines1

/datum/map_z_level/tether_lateload/roguemines1
	name = "Belt 1"
	flags = MAP_LEVEL_CONTACT|MAP_LEVEL_PLAYER
	z = Z_LEVEL_ROGUEMINE_1

/datum/map_template/tether_lateload/tether_roguemines2
	name = "Asteroid Belt 2"
	desc = "Mining, but rogue. Zone 2"
	mappath = 'maps/submaps/rogue_mines_vr/rogue_mine2.dmm'

	associated_map_datum = /datum/map_z_level/tether_lateload/roguemines2

/datum/map_z_level/tether_lateload/roguemines2
	name = "Belt 2"
	flags = MAP_LEVEL_CONTACT|MAP_LEVEL_PLAYER
	z = Z_LEVEL_ROGUEMINE_2

<<<<<<< HEAD
//////////////////////////////////////////////////////////////////////////////
/// Away Missions
#if AWAY_MISSION_TEST
#include "../../expedition_vr/beach/beach.dmm"
#include "../../expedition_vr/beach/cave.dmm"
#include "../../expedition_vr/alienship/alienship.dmm"
#include "../../expedition_vr/aerostat/aerostat.dmm"
#include "../../expedition_vr/aerostat/surface.dmm"
#include "../../expedition_vr/space/debrisfield.dmm"
#include "../../expedition_vr/space/fueldepot.dmm"
#endif

#include "../../expedition_vr/beach/_beach.dm"
/datum/map_template/tether_lateload/away_beach
	name = "Desert Planet - Z1 Beach"
	desc = "The beach away mission."
	mappath = 'maps/expedition_vr/beach/beach.dmm'
	associated_map_datum = /datum/map_z_level/tether_lateload/away_beach

/datum/map_z_level/tether_lateload/away_beach
	name = "Away Mission - Desert Beach"
	z = Z_LEVEL_BEACH
	base_turf = /turf/simulated/floor/outdoors/rocks/caves

/datum/map_template/tether_lateload/away_beach_cave
	name = "Desert Planet - Z2 Cave"
	desc = "The beach away mission's cave."
	mappath = 'maps/expedition_vr/beach/cave.dmm'
	associated_map_datum = /datum/map_z_level/tether_lateload/away_beach_cave

/datum/map_template/tether_lateload/away_beach_cave/on_map_loaded(z)
	. = ..()
	seed_submaps(list(Z_LEVEL_BEACH_CAVE), 120, /area/tether_away/cave/unexplored/normal, /datum/map_template/surface/mountains/normal)
	//seed_submaps(list(Z_LEVEL_BEACH_CAVE), 70, /area/tether_away/cave/unexplored/normal, /datum/map_template/surface/mountains/deep)

	// Now for the tunnels.
	new /datum/random_map/automata/cave_system/no_cracks(null, 3, 3, Z_LEVEL_BEACH_CAVE, world.maxx - 4, world.maxy - 4)
	new /datum/random_map/noise/ore/beachmine(null, 1, 1, Z_LEVEL_BEACH_CAVE, 64, 64)

/datum/map_z_level/tether_lateload/away_beach_cave
	name = "Away Mission - Desert Cave"
	z = Z_LEVEL_BEACH_CAVE
	base_turf = /turf/simulated/floor/outdoors/rocks/caves

/obj/effect/step_trigger/zlevel_fall/beach
	var/static/target_z


#include "../../expedition_vr/alienship/_alienship.dm"
/datum/map_template/tether_lateload/away_alienship
	name = "Alien Ship - Z1 Ship"
	desc = "The alien ship away mission."
	mappath = 'maps/expedition_vr/alienship/alienship.dmm'
	associated_map_datum = /datum/map_z_level/tether_lateload/away_alienship

/datum/map_z_level/tether_lateload/away_alienship
	name = "Away Mission - Alien Ship"


#include "../../expedition_vr/aerostat/_aerostat.dm"
/datum/map_template/tether_lateload/away_aerostat
	name = "Remmi Aerostat - Z1 Aerostat"
	desc = "The Virgo 2 Aerostat away mission."
	mappath = 'maps/expedition_vr/aerostat/aerostat.dmm'
	associated_map_datum = /datum/map_z_level/tether_lateload/away_aerostat

/datum/map_z_level/tether_lateload/away_aerostat
	name = "Away Mission - Aerostat"
	z = Z_LEVEL_AEROSTAT
	base_turf = /turf/unsimulated/floor/sky/virgo2_sky

/datum/map_template/tether_lateload/away_aerostat_surface
	name = "Remmi Aerostat - Z2 Surface"
	desc = "The surface from the Virgo 2 Aerostat."
	mappath = 'maps/expedition_vr/aerostat/surface.dmm'
	associated_map_datum = /datum/map_z_level/tether_lateload/away_aerostat_surface

/datum/map_template/tether_lateload/away_aerostat_surface/on_map_loaded(z)
	. = ..()
	seed_submaps(list(Z_LEVEL_AEROSTAT_SURFACE), 120, /area/tether_away/aerostat/surface/unexplored, /datum/map_template/virgo2)
	new /datum/random_map/automata/cave_system/no_cracks(null, 3, 3, Z_LEVEL_AEROSTAT_SURFACE, world.maxx - 4, world.maxy - 4)
	new /datum/random_map/noise/ore/virgo2(null, 1, 1, Z_LEVEL_AEROSTAT_SURFACE, 64, 64)

/datum/map_z_level/tether_lateload/away_aerostat_surface
	name = "Away Mission - Aerostat Surface"
	z = Z_LEVEL_AEROSTAT_SURFACE
	base_turf = /turf/simulated/mineral/floor/ignore_mapgen/virgo2


#include "../../expedition_vr/space/_debrisfield.dm"
#include "../../expedition_vr/space/_fueldepot.dm"
#include "../../submaps/pois_vr/debris_field/_templates.dm"
#include "../../submaps/pois_vr/debris_field/debrisfield_things.dm"
/datum/map_template/tether_lateload/away_debrisfield
	name = "Debris Field - Z1 Space"
	desc = "The Virgo 3 Debris Field away mission."
	mappath = 'maps/expedition_vr/space/debrisfield.dmm'
	associated_map_datum = /datum/map_z_level/tether_lateload/away_debrisfield

/datum/map_template/tether_lateload/away_debrisfield/on_map_loaded(z)
	. = ..()
	//Commented out until we actually get POIs
	seed_submaps(list(Z_LEVEL_DEBRISFIELD), 400, /area/space, /datum/map_template/debrisfield)

/datum/map_z_level/tether_lateload/away_debrisfield
	name = "Away Mission - Debris Field"
	z = Z_LEVEL_DEBRISFIELD

/datum/map_template/tether_lateload/away_fueldepot
	name = "Fuel Depot - Z1 Space"
	desc = "An unmanned fuel depot floating in space."
	mappath = 'maps/expedition_vr/space/fueldepot.dmm'
	associated_map_datum = /datum/map_z_level/tether_lateload/away_fueldepot

/datum/map_z_level/tether_lateload/away_fueldepot
	name = "Away Mission - Fuel Depot"
	z = Z_LEVEL_FUELDEPOT

//////////////////////////////////////////////////////////////////////////////////////
// Gateway submaps go here

/obj/effect/overmap/visitable/sector/tether_gateway
	name = "Unknown"
	desc = "Approach and perform a scan to obtain further information."
	icon_state = "object" //or "globe" for planetary stuff
	known = FALSE

/datum/map_template/tether_lateload/gateway
	name = "Gateway Submap"
	desc = "Please do not use this."
	mappath = null
	associated_map_datum = null

/datum/map_z_level/tether_lateload/gateway_destination
	name = "Gateway Destination"
	z = Z_LEVEL_GATEWAY
/*			// Removed due to heavy merc presence
#include "../../gateway_vr/snow_outpost.dm"
/datum/map_template/tether_lateload/gateway/snow_outpost
	name = "Snow Outpost"
	desc = "Big snowy area with various outposts."
	mappath = 'maps/gateway_vr/snow_outpost.dmm'
	associated_map_datum = /datum/map_z_level/tether_lateload/gateway_destination
*/
#include "../../gateway_vr/zoo.dm"
/datum/map_template/tether_lateload/gateway/zoo
	name = "Zoo"
	desc = "Gigantic space zoo"
	mappath = 'maps/gateway_vr/zoo.dmm'
	associated_map_datum = /datum/map_z_level/tether_lateload/gateway_destination

#include "../../gateway_vr/carpfarm.dm"
/datum/map_template/tether_lateload/gateway/carpfarm
	name = "Carp Farm"
	desc = "Asteroid base surrounded by carp"
	mappath = 'maps/gateway_vr/carpfarm.dmm'
	associated_map_datum = /datum/map_z_level/tether_lateload/gateway_destination

#include "../../gateway_vr/snowfield.dm"
/datum/map_template/tether_lateload/gateway/snowfield
	name = "Snow Field"
	desc = "An old base in middle of snowy wasteland"
	mappath = 'maps/gateway_vr/snowfield.dmm'
	associated_map_datum = /datum/map_z_level/tether_lateload/gateway_destination

#include "../../gateway_vr/listeningpost.dm"
/datum/map_template/tether_lateload/gateway/listeningpost
	name = "Listening Post"
	desc = "Asteroid-bound mercenary listening post"
	mappath = 'maps/gateway_vr/listeningpost.dmm'
	associated_map_datum = /datum/map_z_level/tether_lateload/gateway_destination

#include "../../gateway_vr/variable/honlethhighlands.dm"
/datum/map_template/tether_lateload/gateway/honlethhighlands_a
	name = "Honleth Highlands A"
	desc = "The cold surface of some planet."
	mappath = 'maps/gateway_vr/variable/honlethhighlands_a.dmm'
	associated_map_datum = /datum/map_z_level/tether_lateload/gateway_destination

/datum/map_template/tether_lateload/gateway/honlethhighlands_b
	name = "Honleth Highlands B"
	desc = "The cold surface of some planet."
	mappath = 'maps/gateway_vr/variable/honlethhighlands_b.dmm'
	associated_map_datum = /datum/map_z_level/tether_lateload/gateway_destination


#include "../../gateway_vr/variable/arynthilake.dm"
/datum/map_template/tether_lateload/gateway/arynthilake
	name = "Arynthi Lake A"
	desc = "A grassy surface with some abandoned structures."
	mappath = 'maps/gateway_vr/variable/arynthilake_a.dmm'
	associated_map_datum = /datum/map_z_level/tether_lateload/gateway_destination

/datum/map_template/tether_lateload/gateway/arynthilakeunderground
	name = "Arynthi Lake Underground A"
	desc = "A grassy surface with some abandoned structures."
	mappath = 'maps/gateway_vr/variable/arynthilakeunderground_a.dmm'
	associated_map_datum = /datum/map_z_level/tether_lateload/gateway_destination

/datum/map_template/tether_lateload/gateway/arynthilake_b
	name = "Arynthi Lake B"
	desc = "A grassy surface with some abandoned structures."
	mappath = 'maps/gateway_vr/variable/arynthilake_b.dmm'
	associated_map_datum = /datum/map_z_level/tether_lateload/gateway_destination

/datum/map_template/tether_lateload/gateway/arynthilakeunderground_b
	name = "Arynthi Lake Underground B"
	desc = "A grassy surface with some abandoned structures."
	mappath = 'maps/gateway_vr/variable/arynthilakeunderground_b.dmm'
	associated_map_datum = /datum/map_z_level/tether_lateload/gateway_destination

#include "../../gateway_vr/eggnogtown.dm"
/datum/map_template/tether_lateload/gateway/eggnogtown
	name = "Eggnog Town"
	desc = "A comfortable snowy town."
	mappath = 'maps/gateway_vr/eggnogtown.dmm'
	associated_map_datum = /datum/map_z_level/tether_lateload/gateway_destination

/datum/map_template/tether_lateload/gateway/eggnogtownunderground
	name = "Eggnog Town Underground"
	desc = "A comfortable snowy town."
	mappath = 'maps/gateway_vr/eggnogtownunderground.dmm'
	associated_map_datum = /datum/map_z_level/tether_lateload/gateway_destination

#include "../../gateway_vr/wildwest.dm"
/datum/map_template/tether_lateload/gateway/wildwest
	name = "Wild West"
	desc = "A classic."
	mappath = 'maps/gateway_vr/wildwest.dmm'
	associated_map_datum = /datum/map_z_level/tether_lateload/gateway_destination

//////////////////////////////////////////////////////////////////////////////////////
// Admin-use z-levels for loading whenever an admin feels like
#if AWAY_MISSION_TEST
#include "../../submaps/admin_use_vr/spa.dmm"
#endif

#include "../../submaps/admin_use_vr/fun.dm"
/datum/map_template/tether_lateload/fun/spa
	name = "Space Spa"
	desc = "A pleasant spa located in a spaceship."
	mappath = 'maps/submaps/admin_use_vr/spa.dmm'

	associated_map_datum = /datum/map_z_level/tether_lateload/fun/spa

/datum/map_z_level/tether_lateload/fun/spa
	name = "Spa"
	flags = MAP_LEVEL_PLAYER|MAP_LEVEL_SEALED

||||||| parent of 55ee669869... Merge pull request #11710 from Very-Soft/SDremaster
//////////////////////////////////////////////////////////////////////////////
/// Away Missions
#if AWAY_MISSION_TEST
#include "../../expedition_vr/beach/beach.dmm"
#include "../../expedition_vr/beach/cave.dmm"
#include "../../expedition_vr/alienship/alienship.dmm"
#include "../../expedition_vr/aerostat/aerostat.dmm"
#include "../../expedition_vr/aerostat/surface.dmm"
#include "../../expedition_vr/space/debrisfield.dmm"
#include "../../expedition_vr/space/fueldepot.dmm"
#endif

#include "../../expedition_vr/beach/_beach.dm"
/datum/map_template/tether_lateload/away_beach
	name = "Desert Planet - Z1 Beach"
	desc = "The beach away mission."
	mappath = 'maps/expedition_vr/beach/beach.dmm'
	associated_map_datum = /datum/map_z_level/tether_lateload/away_beach

/datum/map_z_level/tether_lateload/away_beach
	name = "Away Mission - Desert Beach"
	z = Z_LEVEL_BEACH
	base_turf = /turf/simulated/floor/outdoors/rocks/caves

/datum/map_template/tether_lateload/away_beach_cave
	name = "Desert Planet - Z2 Cave"
	desc = "The beach away mission's cave."
	mappath = 'maps/expedition_vr/beach/cave.dmm'
	associated_map_datum = /datum/map_z_level/tether_lateload/away_beach_cave

/datum/map_template/tether_lateload/away_beach_cave/on_map_loaded(z)
	. = ..()
	seed_submaps(list(Z_LEVEL_BEACH_CAVE), 120, /area/tether_away/cave/unexplored/normal, /datum/map_template/surface/mountains/normal)
	//seed_submaps(list(Z_LEVEL_BEACH_CAVE), 70, /area/tether_away/cave/unexplored/normal, /datum/map_template/surface/mountains/deep)

	// Now for the tunnels.
	new /datum/random_map/automata/cave_system/no_cracks(null, 3, 3, Z_LEVEL_BEACH_CAVE, world.maxx - 4, world.maxy - 4)
	new /datum/random_map/noise/ore/beachmine(null, 1, 1, Z_LEVEL_BEACH_CAVE, 64, 64)

/datum/map_z_level/tether_lateload/away_beach_cave
	name = "Away Mission - Desert Cave"
	z = Z_LEVEL_BEACH_CAVE
	base_turf = /turf/simulated/floor/outdoors/rocks/caves

/obj/effect/step_trigger/zlevel_fall/beach
	var/static/target_z


#include "../../expedition_vr/alienship/_alienship.dm"
/datum/map_template/tether_lateload/away_alienship
	name = "Alien Ship - Z1 Ship"
	desc = "The alien ship away mission."
	mappath = 'maps/expedition_vr/alienship/alienship.dmm'
	associated_map_datum = /datum/map_z_level/tether_lateload/away_alienship

/datum/map_z_level/tether_lateload/away_alienship
	name = "Away Mission - Alien Ship"


#include "../../expedition_vr/aerostat/_aerostat.dm"
/datum/map_template/tether_lateload/away_aerostat
	name = "Remmi Aerostat - Z1 Aerostat"
	desc = "The Virgo 2 Aerostat away mission."
	mappath = 'maps/expedition_vr/aerostat/aerostat.dmm'
	associated_map_datum = /datum/map_z_level/tether_lateload/away_aerostat

/datum/map_z_level/tether_lateload/away_aerostat
	name = "Away Mission - Aerostat"
	z = Z_LEVEL_AEROSTAT
	base_turf = /turf/unsimulated/floor/sky/virgo2_sky

/datum/map_template/tether_lateload/away_aerostat_surface
	name = "Remmi Aerostat - Z2 Surface"
	desc = "The surface from the Virgo 2 Aerostat."
	mappath = 'maps/expedition_vr/aerostat/surface.dmm'
	associated_map_datum = /datum/map_z_level/tether_lateload/away_aerostat_surface

/datum/map_template/tether_lateload/away_aerostat_surface/on_map_loaded(z)
	. = ..()
	seed_submaps(list(Z_LEVEL_AEROSTAT_SURFACE), 120, /area/tether_away/aerostat/surface/unexplored, /datum/map_template/virgo2)
	new /datum/random_map/automata/cave_system/no_cracks(null, 3, 3, Z_LEVEL_AEROSTAT_SURFACE, world.maxx - 4, world.maxy - 4)
	new /datum/random_map/noise/ore/virgo2(null, 1, 1, Z_LEVEL_AEROSTAT_SURFACE, 64, 64)

/datum/map_z_level/tether_lateload/away_aerostat_surface
	name = "Away Mission - Aerostat Surface"
	z = Z_LEVEL_AEROSTAT_SURFACE
	base_turf = /turf/simulated/mineral/floor/ignore_mapgen/virgo2


#include "../../expedition_vr/space/_debrisfield.dm"
#include "../../expedition_vr/space/_fueldepot.dm"
#include "../../submaps/pois_vr/debris_field/_templates.dm"
#include "../../submaps/pois_vr/debris_field/debrisfield_things.dm"
/datum/map_template/tether_lateload/away_debrisfield
	name = "Debris Field - Z1 Space"
	desc = "The Virgo 3 Debris Field away mission."
	mappath = 'maps/expedition_vr/space/debrisfield.dmm'
	associated_map_datum = /datum/map_z_level/tether_lateload/away_debrisfield

/datum/map_template/tether_lateload/away_debrisfield/on_map_loaded(z)
	. = ..()
	//Commented out until we actually get POIs
	seed_submaps(list(Z_LEVEL_DEBRISFIELD), 400, /area/space, /datum/map_template/debrisfield)

/datum/map_z_level/tether_lateload/away_debrisfield
	name = "Away Mission - Debris Field"
	z = Z_LEVEL_DEBRISFIELD

/datum/map_template/tether_lateload/away_fueldepot
	name = "Fuel Depot - Z1 Space"
	desc = "An unmanned fuel depot floating in space."
	mappath = 'maps/expedition_vr/space/fueldepot.dmm'
	associated_map_datum = /datum/map_z_level/tether_lateload/away_fueldepot

/datum/map_z_level/tether_lateload/away_fueldepot
	name = "Away Mission - Fuel Depot"
	z = Z_LEVEL_FUELDEPOT

//////////////////////////////////////////////////////////////////////////////////////
// Gateway submaps go here

/obj/effect/overmap/visitable/sector/tether_gateway
	name = "Unknown"
	desc = "Approach and perform a scan to obtain further information."
	icon_state = "object" //or "globe" for planetary stuff
	known = FALSE

/datum/map_template/tether_lateload/gateway
	name = "Gateway Submap"
	desc = "Please do not use this."
	mappath = null
	associated_map_datum = null

/datum/map_z_level/tether_lateload/gateway_destination
	name = "Gateway Destination"
	z = Z_LEVEL_GATEWAY
/*			// Removed due to heavy merc presence
#include "../../gateway_vr/snow_outpost.dm"
/datum/map_template/tether_lateload/gateway/snow_outpost
	name = "Snow Outpost"
	desc = "Big snowy area with various outposts."
	mappath = 'maps/gateway_vr/snow_outpost.dmm'
	associated_map_datum = /datum/map_z_level/tether_lateload/gateway_destination
*/
#include "../../gateway_vr/zoo.dm"
/datum/map_template/tether_lateload/gateway/zoo
	name = "Zoo"
	desc = "Gigantic space zoo"
	mappath = 'maps/gateway_vr/zoo.dmm'
	associated_map_datum = /datum/map_z_level/tether_lateload/gateway_destination

#include "../../gateway_vr/carpfarm.dm"
/datum/map_template/tether_lateload/gateway/carpfarm
	name = "Carp Farm"
	desc = "Asteroid base surrounded by carp"
	mappath = 'maps/gateway_vr/carpfarm.dmm'
	associated_map_datum = /datum/map_z_level/tether_lateload/gateway_destination

#include "../../gateway_vr/snowfield.dm"
/datum/map_template/tether_lateload/gateway/snowfield
	name = "Snow Field"
	desc = "An old base in middle of snowy wasteland"
	mappath = 'maps/gateway_vr/snowfield.dmm'
	associated_map_datum = /datum/map_z_level/tether_lateload/gateway_destination

#include "../../gateway_vr/listeningpost.dm"
/datum/map_template/tether_lateload/gateway/listeningpost
	name = "Listening Post"
	desc = "Asteroid-bound mercenary listening post"
	mappath = 'maps/gateway_vr/listeningpost.dmm'
	associated_map_datum = /datum/map_z_level/tether_lateload/gateway_destination

#include "../../gateway_vr/variable/honlethhighlands.dm"
/datum/map_template/tether_lateload/gateway/honlethhighlands_a
	name = "Honleth Highlands A"
	desc = "The cold surface of some planet."
	mappath = 'maps/gateway_vr/variable/honlethhighlands_a.dmm'
	associated_map_datum = /datum/map_z_level/tether_lateload/gateway_destination

/datum/map_template/tether_lateload/gateway/honlethhighlands_b
	name = "Honleth Highlands B"
	desc = "The cold surface of some planet."
	mappath = 'maps/gateway_vr/variable/honlethhighlands_b.dmm'
	associated_map_datum = /datum/map_z_level/tether_lateload/gateway_destination


#include "../../gateway_vr/variable/arynthilake.dm"
/datum/map_template/tether_lateload/gateway/arynthilake
	name = "Arynthi Lake A"
	desc = "A grassy surface with some abandoned structures."
	mappath = 'maps/gateway_vr/variable/arynthilake_a.dmm'
	associated_map_datum = /datum/map_z_level/tether_lateload/gateway_destination

/datum/map_template/tether_lateload/gateway/arynthilakeunderground
	name = "Arynthi Lake Underground A"
	desc = "A grassy surface with some abandoned structures."
	mappath = 'maps/gateway_vr/variable/arynthilakeunderground_a.dmm'
	associated_map_datum = /datum/map_z_level/tether_lateload/gateway_destination

/datum/map_template/tether_lateload/gateway/arynthilake_b
	name = "Arynthi Lake B"
	desc = "A grassy surface with some abandoned structures."
	mappath = 'maps/gateway_vr/variable/arynthilake_b.dmm'
	associated_map_datum = /datum/map_z_level/tether_lateload/gateway_destination

/datum/map_template/tether_lateload/gateway/arynthilakeunderground_b
	name = "Arynthi Lake Underground B"
	desc = "A grassy surface with some abandoned structures."
	mappath = 'maps/gateway_vr/variable/arynthilakeunderground_b.dmm'
	associated_map_datum = /datum/map_z_level/tether_lateload/gateway_destination

#include "../../gateway_vr/eggnogtown.dm"
/datum/map_template/tether_lateload/gateway/eggnogtown
	name = "Eggnog Town"
	desc = "A comfortable snowy town."
	mappath = 'maps/gateway_vr/eggnogtown.dmm'
	associated_map_datum = /datum/map_z_level/tether_lateload/gateway_destination

/datum/map_template/tether_lateload/gateway/eggnogtownunderground
	name = "Eggnog Town Underground"
	desc = "A comfortable snowy town."
	mappath = 'maps/gateway_vr/eggnogtownunderground.dmm'
	associated_map_datum = /datum/map_z_level/tether_lateload/gateway_destination

#include "../../gateway_vr/wildwest.dm"
/datum/map_template/tether_lateload/gateway/wildwest
	name = "Wild West"
	desc = "A classic."
	mappath = 'maps/gateway_vr/wildwest.dmm'
	associated_map_datum = /datum/map_z_level/tether_lateload/gateway_destination

//////////////////////////////////////////////////////////////////////////////////////
// Admin-use z-levels for loading whenever an admin feels like
#if AWAY_MISSION_TEST
#include "../../submaps/admin_use_vr/spa.dmm"
#endif
#include "../../submaps/admin_use_vr/fun.dm"
/datum/map_template/tether_lateload/fun/spa
	name = "Space Spa"
	desc = "A pleasant spa located in a spaceship."
	mappath = 'maps/submaps/admin_use_vr/spa.dmm'

	associated_map_datum = /datum/map_z_level/tether_lateload/fun/spa

/datum/map_z_level/tether_lateload/fun/spa
	name = "Spa"
	flags = MAP_LEVEL_PLAYER|MAP_LEVEL_SEALED

=======
>>>>>>> 55ee669869... Merge pull request #11710 from Very-Soft/SDremaster
//////////////////////////////////////////////////////////////////////////////////////
// Code Shenanigans for Tether lateload maps
/datum/map_template/tether_lateload
	allow_duplicates = FALSE
	var/associated_map_datum

/datum/map_template/tether_lateload/on_map_loaded(z)
	if(!associated_map_datum || !ispath(associated_map_datum))
		log_game("Extra z-level [src] has no associated map datum")
		return

	new associated_map_datum(using_map, z)

/datum/map_z_level/tether_lateload
	z = 0

/datum/map_z_level/tether_lateload/New(var/datum/map/map, mapZ)
	if(mapZ && !z)
		z = mapZ
	return ..(map)

/obj/effect/step_trigger/zlevel_fall //Don't ever use this, only use subtypes.Define a new var/static/target_z on each
	affect_ghosts = 1

/obj/effect/step_trigger/zlevel_fall/Initialize()
	. = ..()

	if(istype(get_turf(src), /turf/simulated/floor))
		src:target_z = z
		return INITIALIZE_HINT_QDEL

/obj/effect/step_trigger/zlevel_fall/Trigger(var/atom/movable/A) //mostly from /obj/effect/step_trigger/teleporter/planetary_fall, step_triggers.dm L160
	if(!src:target_z)
		return

	var/attempts = 100
	var/turf/simulated/T
	while(attempts && !T)
		var/turf/simulated/candidate = locate(rand(5,world.maxx-5),rand(5,world.maxy-5),src:target_z)
		if(candidate.density)
			attempts--
			continue

		T = candidate
		break

	if(!T)
		return

	if(isobserver(A))
		A.forceMove(T) // Harmlessly move ghosts.
		return

	A.forceMove(T)
	if(isliving(A)) // Someday, implement parachutes.  For now, just turbomurder whoever falls.
		message_admins("\The [A] fell out of the sky.")
		var/mob/living/L = A
		L.fall_impact(T, 42, 90, FALSE, TRUE)	//You will not be defibbed from this.

#include "../../expedition_vr/aerostat/_aerostat.dm"
/datum/map_template/tether_lateload/away_aerostat
	name = "Remmi Aerostat - Z1 Aerostat"
	desc = "The Virgo 2 Aerostat away mission."
	mappath = 'maps/expedition_vr/aerostat/aerostat.dmm'
	associated_map_datum = /datum/map_z_level/tether_lateload/away_aerostat

/datum/map_z_level/tether_lateload/away_aerostat
	name = "Away Mission - Aerostat"
	z = Z_LEVEL_AEROSTAT
	base_turf = /turf/unsimulated/floor/sky/virgo2_sky

/datum/map_template/tether_lateload/away_aerostat_surface
	name = "Remmi Aerostat - Z2 Surface"
	desc = "The surface from the Virgo 2 Aerostat."
	mappath = 'maps/expedition_vr/aerostat/surface.dmm'
	associated_map_datum = /datum/map_z_level/tether_lateload/away_aerostat_surface

/datum/map_template/tether_lateload/away_aerostat_surface/on_map_loaded(z)
	. = ..()
	seed_submaps(list(Z_LEVEL_AEROSTAT_SURFACE), 120, /area/offmap/aerostat/surface/unexplored, /datum/map_template/virgo2)
	new /datum/random_map/automata/cave_system/no_cracks(null, 3, 3, Z_LEVEL_AEROSTAT_SURFACE, world.maxx - 4, world.maxy - 4)
	new /datum/random_map/noise/ore/virgo2(null, 1, 1, Z_LEVEL_AEROSTAT_SURFACE, 64, 64)

<<<<<<< HEAD
//////////////////////////////////////////////////////////////////////////////
//Offmap Spawn Locations
#include "../../offmap_vr/talon/talon_v2.dm"
#include "../../offmap_vr/talon/talon_v2_areas.dm"

#if MAP_TEST
#include "../../offmap_vr/talon/talon_v2.dmm"
#endif

/datum/map_template/tether_lateload/offmap/talon_v2
	name = "Offmap Ship - Talon V2"
	desc = "Offmap spawn ship, the Talon."
	mappath = 'maps/offmap_vr/talon/talon_v2.dmm'
	associated_map_datum = /datum/map_z_level/tether_lateload/talon_v2

/datum/map_z_level/tether_lateload/talon_v2
	name = "Talon"
	flags = MAP_LEVEL_PLAYER|MAP_LEVEL_PERSIST|MAP_LEVEL_MAPPABLE
	base_turf = /turf/space
	z = Z_LEVEL_OFFMAP1
||||||| parent of 55ee669869... Merge pull request #11710 from Very-Soft/SDremaster
//////////////////////////////////////////////////////////////////////////////
//Offmap Spawn Locations
#include "../../offmap_vr/talon/talon_v2.dm"
#include "../../offmap_vr/talon/talon_v2_areas.dm"

#if MAP_TEST
#include "../../offmap_vr/talon/talon_v2.dmm"
#endif

/datum/map_template/tether_lateload/offmap/talon_v2
	name = "Offmap Ship - Talon V2"
	desc = "Offmap spawn ship, the Talon."
	mappath = 'maps/offmap_vr/talon/talon_v2.dmm'
	associated_map_datum = /datum/map_z_level/tether_lateload/talon_v2

/datum/map_z_level/tether_lateload/talon_v2
	name = "Talon"
	flags = MAP_LEVEL_PLAYER|MAP_LEVEL_PERSIST|MAP_LEVEL_MAPPABLE
	base_turf = /turf/space
	z = Z_LEVEL_OFFMAP1
=======
/datum/map_z_level/tether_lateload/away_aerostat_surface
	name = "Away Mission - Aerostat Surface"
	z = Z_LEVEL_AEROSTAT_SURFACE
	base_turf = /turf/simulated/mineral/floor/ignore_mapgen/virgo2
>>>>>>> 55ee669869... Merge pull request #11710 from Very-Soft/SDremaster
