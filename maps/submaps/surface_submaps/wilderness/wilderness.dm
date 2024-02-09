// This causes PoI maps to get 'checked' and compiled, when undergoing a unit test.
// This is so CI can validate PoIs, and ensure future changes don't break PoIs, as PoIs are loaded at runtime and the compiler can't catch errors.
// When adding a new PoI, please add it to this list.
#if MAP_TEST
#include "blackshuttledown.dmm"
#include "blueshuttledown.dmm"
#include "borglab.dmm"
#include "borglabAlt.dmm"
#include "bountyhunters.dmm"
#include "bountyhunters2.dmm"
#include "butchershack.dmm"
#include "caveS.dmm"
#include "caveSAlt.dmm"
#include "chapel.dmm"
#include "chasm.dmm"
#include "Cragzone1.dmm"
#include "deathden.dmm"
#include "deathdenAlt.dmm"
#include "decoupledengine.dmm"
#include "demonpool.dmm"
#include "derelictengine.dmm"
#include "DJOutpost1.dmm"
#include "DJOutpost2.dmm"
#include "dogbase.dmm"
#include "doomP.dmm"
#include "doomPAlt.dmm"
#include "drgnplateu.dmm"
#include "drgnplateuAlt.dmm"
#include "drugden.dmm"
#include "emptycabin.dmm"
#include "epod3.dmm"
#include "epod4.dmm"
#include "flake.dmm"
#include "frostflynest.dmm"
#include "frostoasis.dmm"
#include "govpatrol.dmm"
#include "greatwolfden.dmm"
#include "hadzardzone.dmm"
#include "hadzardzone2.dmm"
#include "kururakden.dmm"
#include "lab1.dmm"
#include "leopardmanderden.dmm"
#include "lonewolf.dmm"
#include "manor1.dmm"
#include "manor1Alt.dmm"
#include "mcamp1.dmm"
#include "MHR.dmm"
#include "mudpit.dmm"
#include "musk.dmm"
#include "otieshelter.dmm"
#include "rocky1.dmm"
#include "rocky2.dmm"
#include "rocky3.dmm"
#include "rocky4.dmm"
#include "rockybase.dmm"
#include "rockybaseAlt.dmm"
#include "shack1.dmm"
#include "Shelter.dmm"
#include "smol1.dmm"
#include "snowrock1.dmm"
#include "spider1.dmm"
#include "syndisniper.dmm"
#include "wolfden.dmm"
#include "xenohive.dmm"
#include "AmbushBase.dmm"
#include "AmbushBaseAlt.dmm"
#include "RaidedMechBunker.dmm"
#include "AbandonedLab.dmm"
#endif

//#include "Boombase.dmm" YW edit remove boombase

// The 'wilderness' is the endgame for Explorers. Extremely dangerous and far away from help, but with vast shinies.
// POIs here spawn in two different sections, the top half and bottom half of the map.
// The top half connects to the outpost z-level, and is seperated from the bottom half by a river. It should provide a challenge to a well equiped Explorer team.
// The bottom half should be even more dangerous, where only the robust, fortunate, or lucky can survive.

/datum/map_template/surface/wilderness
	name = "Surface Content - Wildy"
	desc = "Used to make the surface's wilderness be 17% less boring."

// 'Normal' templates get used on the top half, and should be challenging.
/datum/map_template/surface/wilderness/normal

// 'Deep' templates get used on the bottom half, and should be (even more) dangerous and rewarding.
/datum/map_template/surface/wilderness/deep

// To be added: Templates for surface exploration when they are made.

/datum/map_template/surface/wilderness/deep/BSD
	name = "Black Shuttle Down"
	desc = "You REALLY shouldn't be near this."
	mappath = 'maps/submaps/surface_submaps/wilderness/Blackshuttledown.dmm'
	cost = 30
	template_group = "Shuttle Down"

/datum/map_template/surface/wilderness/deep/BluSD
	name = "Blue Shuttle Down"
	desc = "You REALLY shouldn't be near this. Mostly because they're Police."
	mappath = 'maps/submaps/surface_submaps/wilderness/Blueshuttledown.dmm'
	cost = 50
	template_group = "Shuttle Down"

/datum/map_template/surface/wilderness/deep/borglab
	name = "Borg Lab"
	desc = "Production of experimental combat robots gone rogue."
	mappath = 'maps/submaps/surface_submaps/wilderness/borglab.dmm'
	cost = 30
	template_group = "Borg Lab"

/datum/map_template/surface/wilderness/deep/borglabAlt
	name = "Nanite Lab"
	desc = "Production of experimental nanite robots gone rogue."
	mappath = 'maps/submaps/surface_submaps/wilderness/borglabAlt.dmm'
	cost = 30
	template_group = "Borg Lab"

/datum/map_template/surface/wilderness/deep/bountyhunter
	name = "Bounty Hunter Den"
	desc = "The temp home of some bounty hunters, waiting for pick up."
	mappath = 'maps/submaps/surface_submaps/wilderness/bountyhunters.dmm'
	cost = 20
	template_group = "Bounty Team"

/datum/map_template/surface/wilderness/deep/bountyhunterAlt
	name = "Elite Bounty Hunter Den"
	desc = "The temp home of three elite bounty hunters, waiting for pick up."
	mappath = 'maps/submaps/surface_submaps/wilderness/bountyhunters2.dmm'
	cost = 20
	template_group = "Bounty Team"

/datum/map_template/surface/wilderness/normal/butchershack
	name = "Butcher Shack"
	desc = "An old, bloody butcher's shack. Get your meat here!"
	mappath = 'maps/submaps/surface_submaps/wilderness/ButcherShack.dmm'
	cost = 5

/datum/map_template/surface/wilderness/deep/cave
	name = "CaveS"
	desc = "Chitter chitter!"
	mappath = 'maps/submaps/surface_submaps/wilderness/CaveS.dmm'
	cost = 20
	template_group = "CaveS"

/datum/map_template/surface/wilderness/deep/caveAlt
	name = "CaveS"
	desc = "Chitterexplosion!"
	mappath = 'maps/submaps/surface_submaps/wilderness/CaveSAlt.dmm'
	cost = 20
	template_group = "CaveS"

/datum/map_template/surface/wilderness/deep/chapel
	name = "Chapel 1"
	desc = "The chapel of lights and a robot."
	mappath = 'maps/submaps/surface_submaps/wilderness/Chapel.dmm'
	cost = 20

/datum/map_template/surface/wilderness/normal/chasm
	name = "Chasm"
	desc = "An inconspicuous looking cave, watch your step."
	mappath = 'maps/submaps/surface_submaps/wilderness/chasm.dmm'
	cost = 20

/datum/map_template/surface/wilderness/normal/cragzone1
	name = "Cragzone 1"
	desc = "Rocks and more rocks."
	mappath = 'maps/submaps/surface_submaps/wilderness/Cragzone1.dmm'
	cost = 5
	allow_duplicates = TRUE

/datum/map_template/surface/wilderness/deep/deathden
	name = "Death Den"
	desc = "Gathering of acolytes gone wrong."
	mappath = 'maps/submaps/surface_submaps/wilderness/deathden.dmm'
	cost = 15
	template_group = "Death Den"

/datum/map_template/surface/wilderness/deep/deathdenAlt
	name = "Death Spice Den"
	desc = "Gathering of acolytes gone burnly wrong."
	mappath = 'maps/submaps/surface_submaps/wilderness/deathdenAlt.dmm'
	cost = 15
	template_group = "Death Den"

/datum/map_template/surface/wilderness/normal/decoupledengine
	name = "Decoupled Engine"
	desc = "A damaged fission engine jettisoned from a starship long ago."
	mappath = 'maps/submaps/surface_submaps/wilderness/DecoupledEngine.dmm'
	cost = 15

/datum/map_template/surface/wilderness/normal/demonpool
	name = "Demon Pool"
	desc = "A cult ritual gone horribly wrong."
	mappath = 'maps/submaps/surface_submaps/wilderness/demonpool.dmm'
	cost = 15

/datum/map_template/surface/wilderness/deep/derelictengine
	name = "Derelict Engine"
	desc = "An crashed alien ship, something went wrong inside."
	mappath = 'maps/submaps/surface_submaps/wilderness/derelictengine.dmm'
	cost = 45

/datum/map_template/surface/wilderness/deep/DJOutpost1
	name = "DJOutpost 1"
	desc = "Home of Sif Free Radio, the best - and only - radio station for miles around."
	mappath = 'maps/submaps/surface_submaps/wilderness/DJOutpost1.dmm'
	template_group = "Sif Free Radio"
	cost = 5

/datum/map_template/surface/wilderness/deep/DJOutpost2
	name = "DJOutpost 2"
	desc = "The cratered remains of Sif Free Radio, the best - and only - radio station for miles around."
	mappath = 'maps/submaps/surface_submaps/wilderness/DJOutpost2.dmm'
	template_group = "Sif Free Radio"
	cost = 5

/datum/map_template/surface/wilderness/deep/DJOutpost3
	name = "DJOutpost 3"
	desc = "The surprisingly high-tech home of Sif Free Radio, the best - and only - radio station for miles around."
	mappath = 'maps/submaps/surface_submaps/wilderness/DJOutpost3.dmm'
	template_group = "Sif Free Radio"
	cost = 10

/datum/map_template/surface/wilderness/deep/DJOutpost4
	name = "DJOutpost 4"
	desc = "The surprisingly high-tech home of Sif Free Radio, the only radio station run by mindless clones."
	mappath = 'maps/submaps/surface_submaps/wilderness/DJOutpost4.dmm'
	template_group = "Sif Free Radio"
	cost = 10

/datum/map_template/surface/wilderness/deep/dogbase
	name = "Dog Base"
	desc = "A highly secured base with hungry trained canines"
	mappath = 'maps/submaps/surface_submaps/wilderness/dogbase.dmm'
	cost = 20
	template_group = "Dog Base"

/datum/map_template/surface/wilderness/deep/dogbaseAlt
	name = "Spider Base"
	desc = "A highly secured base with hungry trained spider"
	mappath = 'maps/submaps/surface_submaps/wilderness/dogbaseAlt.dmm'
	cost = 20
	template_group = "Dog Base"

/datum/map_template/surface/wilderness/deep/doomP
	name = "DoomP"
	desc = "Witty description here."
	mappath = 'maps/submaps/surface_submaps/wilderness/doomP.dmm'
	cost = 30
	template_group = "doomP"

/datum/map_template/surface/wilderness/deep/doomPAlt
	name = "Doom Bridge"
	desc = "Witty description here 2."
	mappath = 'maps/submaps/surface_submaps/wilderness/doomPAlt.dmm'
	cost = 30
	template_group = "doomP"

/datum/map_template/surface/wilderness/deep/drgnplateu
	name = "Dragon Plateu"
	desc = "A dangerous plateu of cliffs home to a rampant gold hoarding dragon"
	mappath = 'maps/submaps/surface_submaps/wilderness/drgnplateu.dmm'
	cost = 15
	template_group = "drgnplateu"

/datum/map_template/surface/wilderness/deep/drgnplateuAlt
	name = "Dragon Island"
	desc = "A dangerous lava island home to a rampant gold hoarding dragon"
	mappath = 'maps/submaps/surface_submaps/wilderness/drgnplateuAlt.dmm'
	cost = 15
	template_group = "drgnplateu"

/datum/map_template/surface/wilderness/normal/drugden
	name = "Drug Den"
	desc = "The remains of ill thought out whims."
	mappath = 'maps/submaps/surface_submaps/wilderness/Drugden.dmm'
	cost = 20

/datum/map_template/surface/wilderness/normal/emptycabin
	name = "Empty Cabin"
	desc = "An inconspicuous looking den hosted by a hungry otie"
	mappath = 'maps/submaps/surface_submaps/wilderness/emptycabin.dmm'
	cost = 10

/datum/map_template/surface/wilderness/deep/epod3
	name = "Emergency Pod 3"
	desc = "A webbed Emergency pod in the middle of nowhere."
	mappath = 'maps/submaps/surface_submaps/wilderness/Epod3.dmm'
	cost = 5

/datum/map_template/surface/wilderness/normal/epod4
	name = "Emergency Pod 4"
	desc = "A flooded Emergency pod in the middle of nowhere."
	mappath = 'maps/submaps/surface_submaps/wilderness/Epod4.dmm'
	cost = 5

/datum/map_template/surface/wilderness/normal/frostflynest
	name = "Frostfly Nest"
	desc = "The nest of a Frostfly, or more."
	mappath = 'maps/submaps/surface_submaps/wilderness/FrostflyNest.dmm'
	cost = 20

/datum/map_template/surface/wilderness/normal/frostoasis
	name = "Frost Oasis"
	desc = "A strange oasis with a gathering of wild animals."
	mappath = 'maps/submaps/surface_submaps/wilderness/frostoasis.dmm'
	cost = 15

/datum/map_template/surface/wilderness/normal/flake
	name = "Forest Lake"
	desc = "A serene lake sitting amidst the surface."
	mappath = 'maps/submaps/surface_submaps/wilderness/Flake.dmm'
	cost = 10

/datum/map_template/surface/wilderness/normal/govpatrol
	name = "Government Patrol"
	desc = "A long lost SifGuard ground survey patrol. Now they have you guys!"
	mappath = 'maps/submaps/surface_submaps/wilderness/GovPatrol.dmm'
	cost = 5

/datum/map_template/surface/wilderness/deep/greatwolfden
	name = "Great Wolf Den"
	desc = "Den hosted by the biggest alpha wolf of the wilderness"
	mappath = 'maps/submaps/surface_submaps/wilderness/greatwolfden.dmm'
	cost = 15

/datum/map_template/surface/wilderness/deep/hadzardzone
	name = "Hadzard Zone"
	desc = "A strange and secure drop site."
	mappath = 'maps/submaps/surface_submaps/wilderness/hadzardzone.dmm'
	cost = 15

/datum/map_template/surface/wilderness/deep/hadzardzone
	name = "Burning Hadzard Zone"
	desc = "A strange and secure drop site, now onfire"
	mappath = 'maps/submaps/surface_submaps/wilderness/hadzardzone2.dmm'
	cost = 15

/datum/map_template/surface/wilderness/normal/kururakden
	name = "Kururak Den"
	desc = "The den of a Kururak pack. May contain hibernating members."
	mappath = 'maps/submaps/surface_submaps/wilderness/kururakden.dmm'
	cost = 5

/datum/map_template/surface/wilderness/normal/lab1
	name = "Lab 1"
	desc = "An isolated small robotics lab."
	mappath = 'maps/submaps/surface_submaps/wilderness/Lab1.dmm'
	cost = 5

/datum/map_template/surface/wilderness/deep/leopardmanderden
	name = "Leopardmander Den"
	desc = "Den of a voracious but very rare beast."
	mappath = 'maps/submaps/surface_submaps/wilderness/leopardmanderden.dmm'
	cost = 10

/datum/map_template/surface/wilderness/deep/lonewolf
	name = "Lone Wolf"
	desc = "A large oppressing wolf, supervising from above its cliff"
	mappath = 'maps/submaps/surface_submaps/wilderness/lonewolf.dmm'
	cost = 5

/datum/map_template/surface/wilderness/deep/manor1
	name = "Manor 1"
	desc = "Whodunit"
	mappath = 'maps/submaps/surface_submaps/wilderness/manor1.dmm'
	cost = 20
	template_group = "Manor"

/datum/map_template/surface/wilderness/deep/manor1Alt
	name = "Manor 2"
	desc = "Whodunit2"
	mappath = 'maps/submaps/surface_submaps/wilderness/manor1Alt.dmm'
	cost = 20
	template_group = "Manor"

/datum/map_template/surface/wilderness/normal/Mcamp1
	name = "Military Camp 1"
	desc = "A derelict military camp host to some unsavory dangers"
	mappath = 'maps/submaps/surface_submaps/wilderness/MCamp1.dmm'
	cost = 5

/datum/map_template/surface/wilderness/normal/mudpit
	name = "Mudpit"
	desc = "What happens when someone is a bit too careless with gas.."
	mappath = 'maps/submaps/surface_submaps/wilderness/Mudpit.dmm'
	cost = 5

/datum/map_template/surface/wilderness/normal/musk
	name = "Musk"
	desc = "0 to 60 in 1.9 seconds."
	mappath = 'maps/submaps/surface_submaps/wilderness/musk.dmm'
	cost = 10

/datum/map_template/surface/wilderness/deep/otieshelter
	name = "Otie Shelter"
	desc = "A experimental lab of various breeds of oties"
	mappath = 'maps/submaps/surface_submaps/wilderness/otieshelter.dmm'
	cost = 15

/datum/map_template/surface/wilderness/normal/rocky1
	name = "Rocky 1"
	desc = "DununanununanununuNAnana"
	mappath = 'maps/submaps/surface_submaps/wilderness/rocky1.dmm'
	allow_duplicates = TRUE
	cost = 5

/datum/map_template/surface/wilderness/normal/rocky2
	name =  "Rocky 2"
	desc = "More rocks."
	mappath = 'maps/submaps/surface_submaps/wilderness/rocky2.dmm'
	allow_duplicates = TRUE
	cost = 5

/datum/map_template/surface/wilderness/normal/Rocky3
	name = "Rocky 3"
	desc = "More and more and more rocks."
	mappath = 'maps/submaps/surface_submaps/wilderness/rocky3.dmm'
	cost = 5

/datum/map_template/surface/wilderness/normal/rocky4
	name = "Rocky 4"
	desc = "An interesting geographic formation."
	mappath = 'maps/submaps/surface_submaps/wilderness/rocky4.dmm'
	cost = 5

/datum/map_template/surface/wilderness/deep/rockybase
	name = "Rocky Base"
	desc = "A guide to upsetting Icarus and the EIO"
	mappath = 'maps/submaps/surface_submaps/wilderness/rockybase.dmm'
	cost = 35
	template_group = "Rocky Base"

/datum/map_template/surface/wilderness/deep/rockybaseAlt
	name = "Rocky Mining Base"
	desc = "A guide to upsetting mining"
	mappath = 'maps/submaps/surface_submaps/wilderness/rockybaseAlt.dmm'
	cost = 35
	template_group = "Rocky Base"

/datum/map_template/surface/wilderness/normal/shack1
	name = "Shack 1"
	desc = "A small shack in the middle of nowhere, Your halloween murder happens here"
	mappath = 'maps/submaps/surface_submaps/wilderness/shack1.dmm'
	cost = 5

/datum/map_template/surface/wilderness/normal/shelter1
	name = "Shelter 1"
	desc = "The remains of a resourceful, but prideful explorer."
	mappath = 'maps/submaps/surface_submaps/wilderness/Shelter.dmm'
	cost = 10

/datum/map_template/surface/wilderness/normal/smol1
	name = "Smol 1"
	desc = "A tiny grove of trees, The Nemesis of thicc"
	mappath = 'maps/submaps/surface_submaps/wilderness/Smol1.dmm'
	cost = 5

/datum/map_template/surface/wilderness/normal/snowrock1
	name = "Snowrock 1"
	desc = "A rocky snow covered area"
	mappath = 'maps/submaps/surface_submaps/wilderness/Snowrock1.dmm'
	cost = 5

/datum/map_template/surface/wilderness/normal/spider1
	name = "Spider Nest 1"
	desc = "A small spider nest, in the forest."
	mappath = 'maps/submaps/surface_submaps/wilderness/spider1.dmm'
	allow_duplicates = TRUE
	cost = 5

/datum/map_template/surface/wilderness/deep/syndisniperAlt
	name = "Syndi Drone"
	desc = "Syndicate watch tower, deadly but secluded, now with a drone"
	mappath = 'maps/submaps/surface_submaps/wilderness/syndisniperAlt.dmm'
	cost = 5
	template_group = "Sniper"

/datum/map_template/surface/wilderness/normal/wolfden
	name = "Wolf Den"
	desc = "Small wolf den and their hunt spoils."
	mappath = 'maps/submaps/surface_submaps/wilderness/wolfden.dmm'
	cost = 10

/datum/map_template/surface/wilderness/deep/xenohive
	name = "Xeno Hive"
	desc = "A containment experiment gone wrong."
	mappath = 'maps/submaps/surface_submaps/wilderness/xenohive.dmm'
	cost = 25

/datum/map_template/surface/wilderness/deep/cliffbase
	name = "Cliff Base"
	desc = "A hideout protected by a lake, and duo of snipers."
	mappath = 'maps/submaps/surface_submaps/wilderness/AmbushBase.dmm'
	cost = 30

/datum/map_template/surface/wilderness/deep/cliffbaseAlt
	name = "Cliff lake Base"
	desc = "A hideout protected by a lake, and duo of snipers, but the spiders are on strike."
	mappath = 'maps/submaps/surface_submaps/wilderness/AmbushBaseAlt.dmm'
	cost = 30
	template_group = "AmbushBase"

/datum/map_template/surface/wilderness/deep/raideddmechhanger
	name = "Raided Mech Hanger"
	desc = "A hanger with mechs far past useabiltiy."
	mappath = 'maps/submaps/surface_submaps/wilderness/RaidedMechBunker.dmm'
	cost = 15

/datum/map_template/surface/wilderness/deep/AbandonedLab
	name = "Abandoned Lab"
	desc = "Experiments gone wrong! Be wary of the test subjects gone rogue."
	mappath = 'maps/submaps/surface_submaps/wilderness/AbandonedLab.dmm'
	cost = 20

/*==Disabled==/

/datum/map_template/surface/wilderness/deep/Boombase //YW Edit remove boombase
	name = "Boombase"
	desc = "What happens when you don't follow SOP."
	mappath = 'maps/submaps/surface_submaps/wilderness/Boombase.dmm'
	cost = 5

/datum/map_template/surface/wilderness/normal/chemspill2
	name = "Acrid Lake"
	desc = "A pool of water contaminated with highly dangerous chemicals."
	mappath = 'maps/submaps/surface_submaps/wilderness/chemspill2.dmm'
	cost = 10

/datum/map_template/surface/wilderness/deep/MHR
	name = "Manhack Rock"
	desc = "A rock filled with nasty Synthetics."
	mappath = 'maps/submaps/surface_submaps/wilderness/MHR.dmm'
	cost = 15

*/
