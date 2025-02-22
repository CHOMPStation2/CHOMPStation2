/*
MAPPER QUICK GUDE
Looking to add new overmap POI's with as little code knowledge as possible? Here's the vital stuff:
-Maps are stored in /datum/map_template/dynamic_overmap templates, you will need to make one template per POI. Code automagically handles adding templates to the overmap.
-The "name" variable must be unique.
-The "mappath" variable must be the file path of your map file. Store maps in "modular_chomp/maps/overmap/space_pois."
-The "block_size" variable is the tile size of your map's LARGEST dimension. Code may break horribly if you do not set this correctly.
	-If your map is 60 tiles by 45 tiles, the block_size should be 60.
-ADD YOUR MAP(s) TO THE #include LIST BELOW. This lets github catch POI's breaking in the future.
-Keep templates alphebetical.
-Include the map dimensions in the map file name.

Less important
-"scanner_desc" is the information presented to players upon scanning the POI. You should probably fill this out but it's not necessary for POI spawning.
-"poi_icon" is the icon_state used when the POI is first scanned.
-"active_icon" is the icon_state used when the POI is loaded into the game.
-POI icons use "icons/obj/overmap.dmi" by default. Using other .dmi files is not currently supported but would be easy to code if desired.
-"poi_color" colors the overmap object when set, does nothing when null. Uses hexadecimal color codes.
-Most POI spawning code is in dynamic_sector.dm, if you're looking for it.
*/


// This causes PoI maps to get 'checked' and compiled, when undergoing a unit test.
// This is so CI can validate PoIs, and ensure future changes don't break PoIs, as PoIs are loaded at runtime and the compiler can't catch errors.
// When adding a new PoI, please add it to this list.
#ifdef MAP_TEST
//#include "abandonedtele_13x12.dmm"
#include "abandonedzoo_50x50.dmm"
#include "asteroid1_60x60.dmm"
#include "asteroid2_60x60.dmm"
#include "asteroid3_60x60.dmm"
#include "asteroid4_60x60.dmm"
#include "asteroid5_40x40.dmm"
#include "blowntcommsat_53x56.dmm"
#include "clownmime_28x20.dmm"
#include "debris1_60x60.dmm"
#include "debris2_20x20.dmm"
#include "debris3_30x20.dmm"
#include "deepstorage_85x67.dmm"
#include "derelict1_100x100.dmm"
//#include "derelict2_20x20.dmm"
//#include "derelict3_40x40.dmm"
//#include "derelict4_40x40.dmm"
//#include "derelict5_40x40.dmm"
#include "dj_31x28.dmm"
#include "druglab_32x32.dmm"
//#include "emptyshell_17x15.dmm"
//#include "gasthelizards_19x14.dmm"
#include "golemtarget_30x30.dmm"
#include "intactemptyship_30x25.dmm"
//#include "mechtransport_9x15.dmm"
#include "oldstation_80x45.dmm"
#include "onehalf_60x20.dmm"
#include "spacebar_40x40.dmm"
#include "syndiecakesfactory_40x40.dmm"
#include "syndiedepot_57x49.dmm"
#include "turretedoutpost_23x19.dmm"
#include "ussp_84x90.dmm"
#include "ussptele_21x12.dmm"
#include "wayhome_30x30.dmm"
#include "whiteship_55x30.dmm"
#include "wizardcrash_20x35.dmm"
#include "spaceseveneleven_45x45.dmm"
#endif

// Vars (excluding mappath) are passed to the overmap object after scanning.
// Every template MUST have a unique name both because of the mapping subsystem and the overmap system.
/datum/map_template/dynamic_overmap
	name = "bluespace static"
	mappath = null
	annihilate = TRUE
	var/scanner_desc = "Unable to resolve bluespace fluctuations."
	var/poi_icon = "ring"
	var/active_icon = "ring_active" // Icon to use when the POI is loaded. Set to null to disable behavior.
	var/poi_color = null
	var/block_size = 60 // The size of the map's largest dimension. If the map is 66x49, this var should be 66. Essential for laoding/unloading system.

// Stolen from map_template/shelter
/datum/map_template/dynamic_overmap/proc/update_lighting(turf/deploy_location)
	var/affected = get_affected_turfs(deploy_location, centered=TRUE)
	for(var/turf/T in affected)
		T.lighting_build_overlay()

/*
/datum/map_template/dynamic_overmap/abandonedtele_13x12
	name = "Abandoned Tele"
	mappath = "modular_chomp/maps/overmap/space_pois/abandonedtele_13x12.dmm"
	block_size = 13
*/
/datum/map_template/dynamic_overmap/abandonedzoo_50x50
	name = "Abandoned Zoo"
	mappath = "modular_chomp/maps/overmap/space_pois/abandonedzoo_50x50.dmm"
	scanner_desc = "Bio-Experiment labratory of unknown use, last response time ^@# years ago."
	block_size = 50

/datum/map_template/dynamic_overmap/asteroid1_60x60
	name = "Brown Asteroid"
	mappath = "modular_chomp/maps/overmap/space_pois/asteroid1_60x60.dmm"
	scanner_desc = "Large asteroid rich in minerals, faint GPS signal detected."
	poi_icon = "asteroid1"
	active_icon = "asteroid1_g"
	block_size = 60

/datum/map_template/dynamic_overmap/asteroid2_60x60
	name = "Frozen Asteroid"
	mappath = "modular_chomp/maps/overmap/space_pois/asteroid2_60x60.dmm"
	scanner_desc = "Frozen asteroids and comets. Signs of debris detected."
	poi_icon = "asteroid2"
	active_icon = "asteroid2_g"
	block_size = 60

/datum/map_template/dynamic_overmap/asteroid3_60x60
	name = "Spooky Asteroid"
	mappath = "modular_chomp/maps/overmap/space_pois/asteroid3_60x60.dmm"
	scanner_desc = "Large asteroid with strange exotic matter readings, high level of danger detected."
	poi_icon = "asteroid3"
	active_icon = "asteroid3_g"
	block_size = 60

/datum/map_template/dynamic_overmap/asteroid4_60x60
	name = "Hollow Asteroid"
	mappath = "modular_chomp/maps/overmap/space_pois/asteroid4_60x60.dmm"
	scanner_desc = "Large asteroid rich in materials. Asteroid scans return that it is hollow."
	poi_icon = "asteroid2"
	active_icon = "asteroid2_g"
	block_size = 60

/datum/map_template/dynamic_overmap/asteroid5_40x40
	name = "Anomalous Astroid"
	mappath = "modular_chomp/maps/overmap/space_pois/asteroid5_40x40.dmm"
	poi_icon = "asteroid0"
	active_icon = "asteroid0_g"
	block_size = 40

/datum/map_template/dynamic_overmap/blowntcommsat_53x56
	name = "Destroyed T-Comms Sat"
	mappath = "modular_chomp/maps/overmap/space_pois/blowntcommsat_53x56.dmm"
	scanner_desc = "Auxillary telecommunications station in disrepair."
	block_size = 56

/datum/map_template/dynamic_overmap/clownmime_28x20
	name = "HONKCRASHEDSHUTTLEHONK"
	mappath = "modular_chomp/maps/overmap/space_pois/clownmime_28x20.dmm"
	scanner_desc = "HONKHONKHONKHONKHONKHONKHONKHONKHONKHONKHONKHONKHONKHONKHONKHONKHONKHONKHONKHONKHONKHONKHONKHONKHONKHONKHONKHONKHONKHONKHONKHONKHONKHONK"
	block_size = 28

/datum/map_template/dynamic_overmap/debris1_60x60
	name = "Debris"
	mappath = "modular_chomp/maps/overmap/space_pois/debris1_60x60.dmm"
	scanner_desc = "Metllic debris, high amounts of local fauna detected."
	block_size = 60
/* Mixed all 3 of debris into debris1
/datum/map_template/dynamic_overmap/debris2_20x20
	name = "Debris"
	mappath = "modular_chomp/maps/overmap/space_pois/debris2_20x20.dmm"
	block_size = 20

/datum/map_template/dynamic_overmap/debris3_30x20
	name = "Debris"
	mappath = "modular_chomp/maps/overmap/space_pois/debris3_30x20.dmm"
	block_size = 30
*/
/datum/map_template/dynamic_overmap/deepstorage_85x67
	name = "Deep Storage Facility"
	mappath = "modular_chomp/maps/overmap/space_pois/deepstorage_85x67.dmm"
	scanner_desc = "Deep hermit's bunker for long term storage and survival, HIGH AMOUNTS OF FAUNA DETECTED."
	block_size = 85

/datum/map_template/dynamic_overmap/derelict1_100x100
	name = "Derelict Field"
	mappath = "modular_chomp/maps/overmap/space_pois/derelict1_100x100.dmm"
	scanner_desc = "Various derelicts and debris. Contains fauna."
	block_size = 100
/*
/datum/map_template/dynamic_overmap/derelict2_20x20
	name = "Dinner"
	mappath = "modular_chomp/maps/overmap/space_pois/derelict2_20x20.dmm"
	block_size = 20

/datum/map_template/dynamic_overmap/derelict3_40x40
	name = "Torn Derelict"
	mappath = "modular_chomp/maps/overmap/space_pois/derelict3_40x40.dmm"
	block_size = 40

/datum/map_template/dynamic_overmap/derelict4_40x40
	name = "Crashed Science Shuttle"
	mappath = "modular_chomp/maps/overmap/space_pois/derelict4_40x40.dmm"
	block_size = 40

/datum/map_template/dynamic_overmap/derelict5_40x40
	name = "Ruins?"
	mappath = "modular_chomp/maps/overmap/space_pois/derelict5_40x40.dmm"
	block_size = 40
*/
/datum/map_template/dynamic_overmap/dj_31x28
	name = "DJ Grooves"
	mappath = "modular_chomp/maps/overmap/space_pois/dj_31x28.dmm"
	scanner_desc = "Unauthorized non-NT operated telecomunications station."
	block_size = 31

/datum/map_template/dynamic_overmap/druglab_32x32
	name = "Suspicious Asteroids"
	mappath = "modular_chomp/maps/overmap/space_pois/druglab_32x32.dmm"
	scanner_desc = "Scans indicate various asteroids hollowed out, human activity detected."
	block_size = 32
/*
/datum/map_template/dynamic_overmap/emptyshell_17x15
	name = "Detatched Ship Hull"
	mappath = "modular_chomp/maps/overmap/space_pois/emptyshell_17x15.dmm"
	block_size = 17

/datum/map_template/dynamic_overmap/gasthelizards_19x14
	name = "Animal Testing Lab"
	mappath = "modular_chomp/maps/overmap/space_pois/gasthelizards_19x14.dmm"
	block_size = 19
*/
/datum/map_template/dynamic_overmap/golemtarget_30x30 //Leaving this one as is, kinda funny
	name = "WARNING: HIGH GRAVITATIONAL FIELD DETECTED"
	mappath = "modular_chomp/maps/overmap/space_pois/golemtarget_30x30.dmm"
	scanner_desc = "HIGH GRAVITATIONAL FIELD DETECTED, HIGH AMOUNTS OF HAWKING RADIATION DETECTED"
	block_size = 30

/datum/map_template/dynamic_overmap/intactemptyship_30x25
	name = "Crashed Ships"
	mappath = "modular_chomp/maps/overmap/space_pois/intactemptyship_30x25.dmm"
	block_size = 30
/*
/datum/map_template/dynamic_overmap/mechtransport_9x15
	name = "Crashed Mecha Transport"
	mappath = "modular_chomp/maps/overmap/space_pois/mechtransport_9x15.dmm"
	block_size = 15
*/
/datum/map_template/dynamic_overmap/oldstation_80x45
	name = "Charlie Station"
	mappath = "modular_chomp/maps/overmap/space_pois/oldstation_80x45.dmm"
	scanner_desc = "Abandoned NT derelict station, \[REDACTED]"
	block_size = 80

/datum/map_template/dynamic_overmap/onehalf_60x20
	name = "Drone Factory"
	mappath = "modular_chomp/maps/overmap/space_pois/onehalf_60x20.dmm"
	scanner_desc = "Unknown station, high hull damage detected."
	block_size = 60

/datum/map_template/dynamic_overmap/spacebar_40x40
	name = "Space Bar Dome"
	mappath = "modular_chomp/maps/overmap/space_pois/spacebar_40x40.dmm"
	scanner_desc = "Beacon signal detected: COME ON DOWN TO THE ROBUST DONE, DRINKS, GAMES, AND MORE, FREE PARKING"
	block_size = 40

/datum/map_template/dynamic_overmap/starhuntersarena_70x70
	name = "Alien Ruins"
	mappath = "modular_chomp/maps/overmap/space_pois/starhuntersarena_70x70.dmm"
	block_size = 70
/*
/datum/map_template/dynamic_overmap/starhunterstraders_30x30
	name = "Starhunter Traders"
	mappath = "modular_chomp/maps/overmap/space_pois/starhunterstraders_30x30.dmm"
	block_size = 30
*/
/datum/map_template/dynamic_overmap/syndiecakesfactory_40x40
	name = "Land o' Cakes Factory"
	mappath = "modular_chomp/maps/overmap/space_pois/syndiecakesfactory_40x40.dmm"
	block_size = 40

/datum/map_template/dynamic_overmap/syndiedepot_57x49
	name = "Unknown Depot"
	mappath = "modular_chomp/maps/overmap/space_pois/syndiedepot_57x49.dmm"
	scanner_desc = "Mercernary owned outpost, HEAVILY armed mercs detected."
	block_size = 57

/datum/map_template/dynamic_overmap/turretedoutpost_23x19
	name = "Guarded Facility"
	mappath = "modular_chomp/maps/overmap/space_pois/turretedoutpost_23x19.dmm"
	scanner_desc = "Mervenary owned outpost, armor piercing turrets and arms detected."
	block_size = 23
// Temp removal, actually explodes the fucking server //EDIT2 I thought I fixed this shit when a space turf was sharing the same coordinates as another turf, turns out there was a single titanium wall sharing the same coordinate with another and this took me an actual hour to find, I fucking hate touching old maps files with mapping errors that somehow didnt crash the server until spaghetti //EDIT 3, omfg another one, I just nuked every tile and manually rebuilt them, that was another hour, im done this is done, I hate byond
/datum/map_template/dynamic_overmap/ussp_84x90
	name = "Unknown Station"
	mappath = "modular_chomp/maps/overmap/space_pois/ussp_84x90.dmm"
	scanner_desc = "Destroyed station, cause unknown."
	block_size = 90

/datum/map_template/dynamic_overmap/ussptele_21x12
	name = "Abandoned Teleporter Relay"
	mappath = "modular_chomp/maps/overmap/space_pois/ussptele_21x12.dmm"
	block_size = 21
/*
/datum/map_template/dynamic_overmap/wayhome_30x30
	name = "Strange Rock"
	mappath = "modular_chomp/maps/overmap/space_pois/wayhome_30x30.dmm"
	block_size = 30
*/

/datum/map_template/dynamic_overmap/whiteship_55x30
	name = "White Ship"
	mappath = "modular_chomp/maps/overmap/space_pois/whiteship_55x30.dmm"
	scanner_desc = "Derelict ship, high energy lifeforms detected within."
	block_size = 55
/datum/map_template/dynamic_overmap/wizardcrash_20x35
	name = "Crashed Anomalous Ship "
	mappath = "modular_chomp/maps/overmap/space_pois/wizardcrash_20x35.dmm"
	scanner_desc = "A ship propelled by unknown forces, need more information."
	block_size = 35

/datum/map_template/dynamic_overmap/spaceseveneleven_45x45
	name = "Gas Station?"
	mappath = "modular_chomp/maps/overmap/space_pois/spaceseveneleven_45x45.dmm"
	scanner_desc = "Third-Party refueling station, public use."
	block_size = 45
