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
#if MAP_TEST
#include "abandonedtele_13x12.dmm"
#include "abandonedzoo_20x20.dmm"
#include "asteroid1_20x20.dmm"
#include "asteroid2_20x20.dmm"
#include "asteroid3_20x20.dmm"
#include "asteroid4_20x20.dmm"
#include "asteroid5_40x40.dmm"
#include "blowntcommsat_53x56.dmm"
#include "clownmime_28x20.dmm"
#include "debris1_20x20.dmm"
#include "debris2_20x20.dmm"
#include "debris3_30x20.dmm"
#include "deepstorage_85x67.dmm"
#include "derelict1_40x40.dmm"
#include "derelict2_20x20.dmm"
#include "derelict3_40x40.dmm"
#include "derelict4_40x40.dmm"
#include "derelict5_40x40.dmm"
#include "dj_31x28.dmm"
#include "druglab_16x14.dmm"
#include "emptyshell_17x15.dmm"
#include "gasthelizards_19x14.dmm"
#include "golemtarget_30x30.dmm"
#include "intactemptyship_13x11.dmm"
#include "mechtransport_9x15.dmm"
#include "oldstation_80x45.dmm"
#include "onehalf_32x20.dmm"
#include "spacebar_40x40.dmm"
#include "syndiecakesfactory_40x40.dmm"
#include "syndiedepot_57x49.dmm"
#include "turretedoutpost_23x19.dmm"
#include "ussp_84x90.dmm"
#include "ussptele_21x12.dmm"
#include "wayhome_30x30.dmm"
#include "whiteship_55x30.dmm"
#include "wizardcrash_20x35.dmm"
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

/datum/map_template/dynamic_overmap/abandonedtele_13x12
	name = "Abandoned Tele"
	mappath = "modular_chomp/maps/overmap/space_pois/abandonedtele_13x12.dmm"
	block_size = 13

/datum/map_template/dynamic_overmap/abandonedzoo_20x20
	name = "Abandoned Zoo"
	mappath = "modular_chomp/maps/overmap/space_pois/abandonedzoo_20x20.dmm"
	block_size = 20

/datum/map_template/dynamic_overmap/asteroid1_20x20
	name = "Asteroid"
	mappath = "modular_chomp/maps/overmap/space_pois/asteroid1_20x20.dmm"
	poi_icon = "asteroid1"
	active_icon = "asteroid1_g"
	block_size = 20

/datum/map_template/dynamic_overmap/asteroid2_20x20
	name = "Asteroid"
	mappath = "modular_chomp/maps/overmap/space_pois/asteroid2_20x20.dmm"
	poi_icon = "asteroid2"
	active_icon = "asteroid2_g"
	block_size = 20

/datum/map_template/dynamic_overmap/asteroid3_20x20
	name = "Asteroid"
	mappath = "modular_chomp/maps/overmap/space_pois/asteroid3_20x20.dmm"
	poi_icon = "asteroid3"
	active_icon = "asteroid3_g"
	block_size = 20

/datum/map_template/dynamic_overmap/asteroid4_20x20
	name = "Asteroid"
	mappath = "modular_chomp/maps/overmap/space_pois/asteroid4_20x20.dmm"
	poi_icon = "asteroid2"
	active_icon = "asteroid2_g"
	block_size = 20

/datum/map_template/dynamic_overmap/asteroid5_40x40
	name = "Anomalous Astroid"
	mappath = "modular_chomp/maps/overmap/space_pois/asteroid5_40x40.dmm"
	poi_icon = "asteroid0"
	active_icon = "asteroid0_g"
	block_size = 40

/datum/map_template/dynamic_overmap/blowntcommsat_53x56
	name = "Destroyed T-Comms Sat"
	mappath = "modular_chomp/maps/overmap/space_pois/blowntcommsat_53x56.dmm"
	block_size = 56

/datum/map_template/dynamic_overmap/clownmime_28x20
	name = "HONKCRASHEDSHUTTLEHONK"
	mappath = "modular_chomp/maps/overmap/space_pois/clownmime_28x20.dmm"
	block_size = 28

/datum/map_template/dynamic_overmap/debris1_20x20
	name = "Debris"
	mappath = "modular_chomp/maps/overmap/space_pois/debris1_20x20.dmm"
	block_size = 20

/datum/map_template/dynamic_overmap/debris2_20x20
	name = "Debris"
	mappath = "modular_chomp/maps/overmap/space_pois/debris2_20x20.dmm"
	block_size = 20

/datum/map_template/dynamic_overmap/debris3_30x20
	name = "Debris"
	mappath = "modular_chomp/maps/overmap/space_pois/debris3_30x20.dmm"
	block_size = 30

/datum/map_template/dynamic_overmap/deepstorage_85x67
	name = "Deep Storage Facility"
	mappath = "modular_chomp/maps/overmap/space_pois/deepstorage_85x67.dmm"
	block_size = 85

/datum/map_template/dynamic_overmap/derelict1_40x40
	name = "Contaminated Derelict"
	mappath = "modular_chomp/maps/overmap/space_pois/derelict1_40x40.dmm"
	block_size = 40

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

/datum/map_template/dynamic_overmap/dj_31x28
	name = "DJ Grooves"
	mappath = "modular_chomp/maps/overmap/space_pois/dj_31x28.dmm"
	block_size = 31

/datum/map_template/dynamic_overmap/druglab_16x14
	name = "Drug Lab"
	mappath = "modular_chomp/maps/overmap/space_pois/druglab_16x14.dmm"
	block_size = 16

/datum/map_template/dynamic_overmap/emptyshell_17x15
	name = "Detatched Ship Hull"
	mappath = "modular_chomp/maps/overmap/space_pois/emptyshell_17x15.dmm"
	block_size = 17

/datum/map_template/dynamic_overmap/gasthelizards_19x14
	name = "Animal Testing Lab"
	mappath = "modular_chomp/maps/overmap/space_pois/gasthelizards_19x14.dmm"
	block_size = 19

/datum/map_template/dynamic_overmap/golemtarget_30x30
	name = "WARNING: HIGH GRAVITATIONAL FIELD DETECTED"
	mappath = "modular_chomp/maps/overmap/space_pois/golemtarget_30x30.dmm"
	block_size = 30

/datum/map_template/dynamic_overmap/intactemptyship_13x11
	name = "Still Ship"
	mappath = "modular_chomp/maps/overmap/space_pois/intactemptyship_13x11.dmm"
	block_size = 13

/datum/map_template/dynamic_overmap/mechtransport_9x15
	name = "Crashed Mecha Transport"
	mappath = "modular_chomp/maps/overmap/space_pois/mechtransport_9x15.dmm"
	block_size = 15

/datum/map_template/dynamic_overmap/oldstation_80x45
	name = "Charlie Station"
	mappath = "modular_chomp/maps/overmap/space_pois/oldstation_80x45.dmm"
	block_size = 80

/datum/map_template/dynamic_overmap/onehalf_32x20
	name = "Drone Factory"
	mappath = "modular_chomp/maps/overmap/space_pois/onehalf_32x20.dmm"
	block_size = 32

/datum/map_template/dynamic_overmap/spacebar_40x40
	name = "Space Bar Dome"
	mappath = "modular_chomp/maps/overmap/space_pois/spacebar_40x40.dmm"
	block_size = 40

/datum/map_template/dynamic_overmap/starhuntersarena_70x70
	name = "Starhunter Challenge"
	mappath = "modular_chomp/maps/overmap/space_pos/starhuntersarena_70x70.dmm"
	block_size = 70

/datum/map_template/dynamic_overmap/starhunterstraders_30x30
	name = "Starhunter Traders"
	mappath = "modular_chomp/maps/overmap/space_pos/starhunterstraders_30x30.dmm"
	block_size = 30

/datum/map_template/dynamic_overmap/syndiecakesfactory_40x40
	name = "Land o' Cakes Factory"
	mappath = "modular_chomp/maps/overmap/space_pois/syndiecakesfactory_40x40.dmm"
	block_size = 40

/datum/map_template/dynamic_overmap/syndiedepot_57x49
	name = "Unknown Depot"
	mappath = "modular_chomp/maps/overmap/space_pois/syndiedepot_57x49.dmm"
	block_size = 57

/datum/map_template/dynamic_overmap/turretedoutpost_23x19
	name = "Guarded Facility"
	mappath = "modular_chomp/maps/overmap/space_pois/turretedoutpost_23x19.dmm"
	block_size = 23

/datum/map_template/dynamic_overmap/ussp_84x90
	name = "Unknown Station"
	mappath = "modular_chomp/maps/overmap/space_pois/ussp_84x90.dmm"
	block_size = 90

/datum/map_template/dynamic_overmap/ussptele_21x12
	name = "Abandoned Teleporter Relay"
	mappath = "modular_chomp/maps/overmap/space_pois/ussptele_21x12.dmm"
	block_size = 21

/datum/map_template/dynamic_overmap/wayhome_30x30
	name = "Strange Rock"
	mappath = "modular_chomp/maps/overmap/space_pois/wayhome_30x30.dmm"
	block_size = 30

/datum/map_template/dynamic_overmap/whiteship_55x30
	name = "White Ship"
	mappath = "modular_chomp/maps/overmap/space_pois/whiteship_55x30.dmm"
	block_size = 55

/datum/map_template/dynamic_overmap/wizardcrash_20x35
	name = "Crashed Anomalous Ship "
	mappath = "modular_chomp/maps/overmap/space_pois/wizardcrash_20x35.dmm"
	block_size = 35
