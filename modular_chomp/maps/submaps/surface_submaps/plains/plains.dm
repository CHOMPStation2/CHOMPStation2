// This causes PoI maps to get 'checked' and compiled, when undergoing a unit test.
// This is so CI can validate PoIs, and ensure future changes don't break PoIs, as PoIs are loaded at runtime and the compiler can't catch errors.
// When adding a new PoI, please add it to this list.
#ifdef MAP_TEST
//#include "beacons.dmm"
#include "Boathouse.dmm"
#include "bonfire.dmm"
#include "Buriedtreasure.dmm"
#include "Buriedtreasure2.dmm"
#include "Buriedtreasure3.dmm"
#include "camp.dmm"
#include "chemspill1.dmm"
#include "construction.dmm"
#include "Diner.dmm"
#include "Epod.dmm"
#include "Epod2.dmm"
#include "explorerhouse.dmm"
#include "farm.dmm"
#include "field.dmm"
#include "hotspring.dmm"
#include "kururak.dmm"
#include "mechpit.dmm"
#include "merchantstand.dmm"
#include "methlab.dmm"
#include "oldhotel.dmm"
#include "oldlibrary.dmm"
#include "Pascalb.dmm"
#include "pooledrocks.dmm"
#include "priderock.dmm"
#include "Rationcache.dmm"
#include "rockyoutcrop.dmm"
#include "Shakden.dmm"
#include "snow1.dmm"
#include "snow2.dmm"
#include "snow3.dmm"
#include "snow4.dmm"
#include "snow5.dmm"
#include "supplydrop.dmm"
#include "thiefcave.dmm"
#include "VRDen.dmm"
#include "wreckedshelter.dmm"
#endif


// The 'plains' is the area outside the immediate perimeter of the big outpost.
// POIs here should not be dangerous, be mundane, and be somewhat conversative on the loot. Some of the loot can be useful, but it shouldn't trivialize the Wilderness.

/datum/map_template/surface/plains
	name = "Surface Content - Plains"
	desc = "Used to make the surface outside the outpost be 16% less boring."

// To be added: Templates for surface exploration when they are made.

/datum/map_template/surface/plains/boathouse
	name = "Boathouse"
	desc = "A fancy house on a lake."
	mappath = "modular_chomp/maps/submaps/surface_submaps/plains/Boathouse.dmm"
	cost = 30

/datum/map_template/surface/plains/bonfire
	name = "Abandoned Bonfire"
	desc = "Someone seems to enjoy orange juice a bit too much."
	mappath = "modular_chomp/maps/submaps/surface_submaps/plains/bonfire.dmm"
	cost = 5

/datum/map_template/surface/plains/buriedtreasure
	name = "Buried Treasure"
	desc = "A hole in the ground, who knows what might be inside!"
	mappath = "modular_chomp/maps/submaps/surface_submaps/plains/BuriedTreasure.dmm"
	cost = 10
	template_group = "Shallow Grave"

/datum/map_template/surface/plains/buriedtreasure2
	name = "Buried Treasure 2"
	desc = "A hole in the ground, who knows what might be inside!"
	mappath = "modular_chomp/maps/submaps/surface_submaps/plains/BuriedTreasure2.dmm"
	cost = 10
	template_group = "Shallow Grave"

/datum/map_template/surface/plains/buriedtreasure3
	name = "Buried Treasure 3"
	desc = "A hole in the ground, who knows what might be inside!"
	mappath = "modular_chomp/maps/submaps/surface_submaps/plains/BuriedTreasure3.dmm"
	cost = 10
	template_group = "Shallow Grave"

/datum/map_template/surface/plains/camp
	name = "Camp Site"
	desc = "A small campsite, complete with housing and bonfire."
	mappath = "modular_chomp/maps/submaps/surface_submaps/plains/camp.dmm"
	cost = 10

/datum/map_template/surface/plains/chemspill1
	name = "Ruptured Canister"
	desc = "A dumped chemical canister. Looks dangerous."
	mappath = "modular_chomp/maps/submaps/surface_submaps/plains/chemspill1.dmm"
	cost = 10

/datum/map_template/surface/plains/construction
	name = "Construction Site"
	desc = "A structure being built. It seems laziness is not limited to engineers."
	mappath = "modular_chomp/maps/submaps/surface_submaps/plains/construction.dmm"
	cost = 10

/datum/map_template/surface/plains/diner
	name = "Diner"
	desc = "An old timey diner. Looks like you could get something tasty here."
	mappath = "modular_chomp/maps/submaps/surface_submaps/plains/Diner.dmm"
	cost = 25

/datum/map_template/surface/plains/dragon
	name = "Dragon Den"
	desc = "A den for a fierce dragon."
	mappath = "modular_chomp/maps/submaps/surface_submaps/plains/dragon.dmm" //VOREStation Edit
	cost = 10

/datum/map_template/surface/plains/epod
	name = "Emergency Pod"
	desc = "A vacant Emergency pod in the middle of nowhere."
	mappath = "modular_chomp/maps/submaps/surface_submaps/plains/Epod.dmm"
	cost = 5

/datum/map_template/surface/plains/epod2
	name = "Emergency Pod 2"
	desc = "A locked Emergency pod in the middle of nowhere."
	mappath = "modular_chomp/maps/submaps/surface_submaps/plains/Epod2.dmm"
	cost = 5

/datum/map_template/surface/plains/explorerhouse
	name = "Empty Explorer's Home"
	desc = "A fair-sized house out in the frontier. It must have belonged to a capable explorer."
	mappath = "modular_chomp/maps/submaps/surface_submaps/plains/explorerhouse.dmm"
	cost = 10

/datum/map_template/surface/plains/farm
	name = "Farm"
	desc = "A small farm tended by a farmbot."
	mappath = "modular_chomp/maps/submaps/surface_submaps/plains/farm.dmm"
	cost = 10

/datum/map_template/surface/plains/field
	name = "Field"
	desc = "A regular field with a tug on it."
	mappath = "modular_chomp/maps/submaps/surface_submaps/plains/field.dmm"
	cost = 20

/datum/map_template/surface/plains/hotspring
	name = "Hot Spring"
	desc = "Wait what, a hotspring in a frost planet?"
	mappath = "modular_chomp/maps/submaps/surface_submaps/plains/hotspring.dmm"
	cost = 5

/datum/map_template/surface/plains/kururak
	name = "Lone Kururak Den"
	desc = "A lone Kururak's den."
	mappath = "modular_chomp/maps/submaps/surface_submaps/plains/kururak.dmm"
	cost = 10

/datum/map_template/surface/plains/mechpit
	name = "Mechpit"
	desc = "A illmade Mech brawling ring."
	mappath = "modular_chomp/maps/submaps/surface_submaps/plains/mechpit.dmm"
	cost = 15

/datum/map_template/surface/plains/merchantstand
	name = "Merchant Stand"
	desc = "A merchant stand. What business could be done all the way out here?"
	mappath = "modular_chomp/maps/submaps/surface_submaps/plains/merchantstand.dmm"
	cost = 10

/datum/map_template/surface/plains/methlab
	name = "Meth Lab"
	desc = "A broken down greenhouse lab?, This does not look safe."
	mappath = "modular_chomp/maps/submaps/surface_submaps/plains/methlab.dmm"
	cost = 15

/datum/map_template/surface/plains/oldhotel
	name = "Old Hotel"
	desc = "An abandoned hotel of some sort. Why was it left behind?"
	mappath = "modular_chomp/maps/submaps/surface_submaps/plains/oldhotel.dmm"
	cost = 15

/datum/map_template/surface/plains/oldlibrary
	name = "Old Library"
	desc = "An abandoned library of some sort. You can smell the musty pages."
	mappath = "modular_chomp/maps/submaps/surface_submaps/plains/oldlibrary.dmm"
	cost = 15

/datum/map_template/surface/plains/pascalb
	name = "Irradiated Manhole Cover"
	desc = "How did this old thing get all the way out here?"
	mappath = "modular_chomp/maps/submaps/surface_submaps/plains/PascalB.dmm"
	cost = 5

/datum/map_template/surface/plains/pooledrocks
	name = "Pooled Rocks"
	desc = "An intresting rocky location."
	mappath = "modular_chomp/maps/submaps/surface_submaps/plains/pooledrocks.dmm"
	cost = 15

/datum/map_template/surface/plains/priderock
	name = "Pride Rock"
	desc = "A quite steep petruding rock from the earth, looks like a good hike."
	mappath = "modular_chomp/maps/submaps/surface_submaps/plains/priderock.dmm"
	cost = 10

/datum/map_template/surface/plains/rationcache
	name = "Ration Cache"
	desc = "A forgotten cache of emergency rations."
	mappath = "modular_chomp/maps/submaps/surface_submaps/plains/RationCache.dmm" //VOREStation Edit
	cost = 5

/datum/map_template/surface/plains/rockyoutcrop
	name = "Rocky Outcrop"
	desc = "A fairly unremarkable pile of rocks."
	mappath = "modular_chomp/maps/submaps/surface_submaps/plains/rockyoutcrop.dmm"
	cost = 5

/datum/map_template/surface/plains/snow
	name = "Snow"
	desc = "Snow."
	mappath = "modular_chomp/maps/submaps/surface_submaps/plains/snow.dmm"
	cost = 5

/datum/map_template/surface/plains/snow2
	name = "Snow 2"
	desc = "More snow."
	mappath = "modular_chomp/maps/submaps/surface_submaps/plains/snow2.dmm"
	cost = 5

/datum/map_template/surface/plains/snow3
	name = "Snow 3"
	desc = "Snow Snow Snow."
	mappath = "modular_chomp/maps/submaps/surface_submaps/plains/snow3.dmm"
	cost = 5

/datum/map_template/surface/plains/snow4
	name = "Snow 4"
	desc = "Too much snow."
	mappath = "modular_chomp/maps/submaps/surface_submaps/plains/snow4.dmm"
	cost = 5

/datum/map_template/surface/plains/snow5
	name = "Snow 5"
	desc = "Please stop the snow!"
	mappath = "modular_chomp/maps/submaps/surface_submaps/plains/snow5.dmm"
	cost = 5

/datum/map_template/surface/plains/shakden
	name = "Shakden"
	desc = "A den of bitey bois!"
	mappath = "modular_chomp/maps/submaps/surface_submaps/plains/Shakden.dmm"
	cost = 15

/datum/map_template/surface/plains/supplydrop
	name = "Old Supply Drop"
	desc = "A drop pod that's clearly been here a while, most of the things inside are rusted and worthless."
	mappath = "modular_chomp/maps/submaps/surface_submaps/plains/supplydrop.dmm"
	cost = 8

/datum/map_template/surface/plains/thiefcave
	name = "Thieves' Cave"
	desc = "Some thieves are using this place to store their stash."
	mappath = "modular_chomp/maps/submaps/surface_submaps/plains/thiefcave.dmm"
	cost = 20

/datum/map_template/surface/plains/vrden
	name = "VR Den"
	desc = "A temporarily abandoned VR den, still functional."
	mappath = "modular_chomp/maps/submaps/surface_submaps/plains/VRDen.dmm"
	cost = 10


/datum/map_template/surface/plains/wreckedshelter
	name = "Wrecked Shelter"
	desc = "The remains of some old shelter. It's completely ruined."
	mappath = "modular_chomp/maps/submaps/surface_submaps/plains/wreckedshelter.dmm"
	cost = 10


/*Unused - Leaving Here For Now*/

/*
/datum/map_template/surface/plains/normal/rockycrevice
	name =  "Rocky Crevice"
	desc = "More rocks."
	mappath = "modular_chomp/maps/submaps/surface_submaps/plains/rockycrevice.dmm"
	allow_duplicates = TRUE
	cost = 5

/datum/map_template/surface/plains/normal/peninsula
	name =  "Peninsula"
	desc = "A peninsula. Looks like a small camp has been set up here."
	mappath = "modular_chomp/maps/submaps/surface_submaps/plains/peninsula.dmm"
	cost = 10

/datum/map_template/surface/plains/beacons
	name = "Collection of Marker Beacons"
	desc = "A bunch of marker beacons, scattered in a strange pattern."
	mappath = "modular_chomp/maps/submaps/surface_submaps/plains/beacons.dmm"
	cost = 5
	fixed_orientation = TRUE

*/
