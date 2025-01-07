// This causes PoI maps to get 'checked' and compiled, when undergoing a unit test.
// This is so CI can validate PoIs, and ensure future changes don't break PoIs, as PoIs are loaded at runtime and the compiler can't catch errors.
// When adding a new PoI, please add it to this list.
#ifdef MAP_TEST
#include "AbandonedLab.dmm"
#include "AmbushBase.dmm"
#include "AmbushBaseAlt.dmm"
#include "Blackshuttledown.dmm"
#include "Blueshuttledown.dmm"
//#include "Boombase.dmm"
#include "borglab.dmm"
#include "borglabAlt.dmm"
#include "bountyhunters.dmm"
#include "bountyhunters2.dmm"
#include "butchershack.dmm"
#include "CaveS.dmm"
#include "CaveSAlt.dmm"
#include "Chapel.dmm"
#include "chasm.dmm"
//#include "chemspill2.dmm"
#include "Cragzone1.dmm"
#include "deathden.dmm"
#include "deathdenAlt.dmm"
#include "DecoupledEngine.dmm"
#include "demonpool.dmm"
#include "derelictengine.dmm"
#include "DJOutpost1.dmm"
#include "DJOutpost2.dmm"
#include "dogbase.dmm"
#include "dogbaseAlt.dmm"
#include "DoomP.dmm"
#include "DoomPAlt.dmm"
#include "drgnplateu.dmm"
#include "drgnplateuAlt.dmm"
#include "Drugden.dmm"
#include "emptycabin.dmm"
#include "Epod3.dmm"
#include "Epod4.dmm"
#include "Flake.dmm"
#include "FrostflyNest.dmm"
#include "frostoasis.dmm"
#include "GovPatrol.dmm"
#include "greatwolfden.dmm"
#include "hadzardzone.dmm"
#include "hadzardzone2.dmm"
#include "kururakden.dmm"
#include "Lab1.dmm"
#include "leopardmanderden.dmm"
#include "lonewolf.dmm"
#include "Manor1.dmm"
#include "Manor1Alt.dmm"
#include "MCamp1.dmm"
#include "MHR.dmm"
#include "Mudpit.dmm"
#include "Musk.dmm"
#include "otieshelter.dmm"
#include "RaidedMechBunker.dmm"
#include "Rocky1.dmm"
#include "Rocky2.dmm"
#include "Rocky3.dmm"
#include "Rocky4.dmm"
#include "Rockybase.dmm"
#include "RockybaseAlt.dmm"
#include "Shack1.dmm"
#include "Shelter.dmm"
#include "Smol1.dmm"
#include "Snowrock1.dmm"
#include "spider1.dmm"
#include "syndisniper.dmm"
#include "syndisniperAlt.dmm"
#include "wolfden.dmm"
#include "xenohive.dmm"
#endif

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
	mappath = "modular_chomp/maps/submaps/surface_submaps/wilderness/Blackshuttledown.dmm"
	cost = 30
	template_group = "Shuttle Down"

/datum/map_template/surface/wilderness/deep/BluSD
	name = "Blue Shuttle Down"
	desc = "You REALLY shouldn't be near this. Mostly because they're Police."
	mappath = "modular_chomp/maps/submaps/surface_submaps/wilderness/Blueshuttledown.dmm"
	cost = 50
	template_group = "Shuttle Down"

/datum/map_template/surface/wilderness/deep/borglab
	name = "Borg Lab"
	desc = "Production of experimental combat robots gone rogue."
	mappath = "modular_chomp/maps/submaps/surface_submaps/wilderness/borglab.dmm"
	cost = 30
	template_group = "Borg Lab"

/datum/map_template/surface/wilderness/deep/borglabAlt
	name = "Nanite Lab"
	desc = "Production of experimental nanite robots gone rogue."
	mappath = "modular_chomp/maps/submaps/surface_submaps/wilderness/borglabAlt.dmm"
	cost = 30
	template_group = "Borg Lab"

/datum/map_template/surface/wilderness/deep/bountyhunter
	name = "Bounty Hunter Den"
	desc = "The temp home of some bounty hunters, waiting for pick up."
	mappath = "modular_chomp/maps/submaps/surface_submaps/wilderness/bountyhunters.dmm"
	cost = 20
	template_group = "Bounty Team"

/datum/map_template/surface/wilderness/deep/bountyhunterAlt
	name = "Elite Bounty Hunter Den"
	desc = "The temp home of three elite bounty hunters, waiting for pick up."
	mappath = "modular_chomp/maps/submaps/surface_submaps/wilderness/bountyhunters2.dmm"
	cost = 20
	template_group = "Bounty Team"

/datum/map_template/surface/wilderness/normal/butchershack
	name = "Butcher Shack"
	desc = "An old, bloody butcher's shack. Get your meat here!"
	mappath = "modular_chomp/maps/submaps/surface_submaps/wilderness/butchershack.dmm"
	cost = 5

/datum/map_template/surface/wilderness/deep/cave
	name = "CaveS"
	desc = "Chitter chitter!"
	mappath = "modular_chomp/maps/submaps/surface_submaps/wilderness/CaveS.dmm"
	cost = 20
	template_group = "CaveS"

/datum/map_template/surface/wilderness/deep/caveAlt
	name = "CaveS"
	desc = "Chitterexplosion!"
	mappath = "modular_chomp/maps/submaps/surface_submaps/wilderness/CaveSAlt.dmm"
	cost = 20
	template_group = "CaveS"

/datum/map_template/surface/wilderness/deep/chapel
	name = "Chapel 1"
	desc = "The chapel of lights and a robot."
	mappath = "modular_chomp/maps/submaps/surface_submaps/wilderness/Chapel.dmm"
	cost = 20

/datum/map_template/surface/wilderness/normal/chasm
	name = "Chasm"
	desc = "An inconspicuous looking cave, watch your step."
	mappath = "modular_chomp/maps/submaps/surface_submaps/wilderness/chasm.dmm"
	cost = 20

/datum/map_template/surface/wilderness/normal/cragzone1
	name = "Cragzone 1"
	desc = "Rocks and more rocks."
	mappath = "modular_chomp/maps/submaps/surface_submaps/wilderness/Cragzone1.dmm"
	cost = 5
	allow_duplicates = TRUE

/datum/map_template/surface/wilderness/deep/deathden
	name = "Death Den"
	desc = "Gathering of acolytes gone wrong."
	mappath = "modular_chomp/maps/submaps/surface_submaps/wilderness/deathden.dmm"
	cost = 15
	template_group = "Death Den"

/datum/map_template/surface/wilderness/deep/deathdenAlt
	name = "Death Spice Den"
	desc = "Gathering of acolytes gone burnly wrong."
	mappath = "modular_chomp/maps/submaps/surface_submaps/wilderness/deathdenAlt.dmm"
	cost = 15
	template_group = "Death Den"

/datum/map_template/surface/wilderness/normal/decoupledengine
	name = "Decoupled Engine"
	desc = "A damaged fission engine jettisoned from a starship long ago."
	mappath = "modular_chomp/maps/submaps/surface_submaps/wilderness/DecoupledEngine.dmm"
	cost = 15

/datum/map_template/surface/wilderness/normal/demonpool
	name = "Demon Pool"
	desc = "A cult ritual gone horribly wrong."
	mappath = "modular_chomp/maps/submaps/surface_submaps/wilderness/demonpool.dmm"
	cost = 15

/datum/map_template/surface/wilderness/deep/derelictengine
	name = "Derelict Engine"
	desc = "An crashed alien ship, something went wrong inside."
	mappath = "modular_chomp/maps/submaps/surface_submaps/wilderness/derelictengine.dmm"
	cost = 45

/datum/map_template/surface/wilderness/deep/DJOutpost1
	name = "DJOutpost 1"
	desc = "Home of Sif Free Radio, the best - and only - radio station for miles around."
	mappath = "modular_chomp/maps/submaps/surface_submaps/wilderness/DJOutpost1.dmm"
	template_group = "Sif Free Radio"
	cost = 5

/datum/map_template/surface/wilderness/deep/DJOutpost2
	name = "DJOutpost 2"
	desc = "The cratered remains of Sif Free Radio, the best - and only - radio station for miles around."
	mappath = "modular_chomp/maps/submaps/surface_submaps/wilderness/DJOutpost2.dmm"
	template_group = "Sif Free Radio"
	cost = 5

/datum/map_template/surface/wilderness/deep/DJOutpost3
	name = "DJOutpost 3"
	desc = "The surprisingly high-tech home of Sif Free Radio, the best - and only - radio station for miles around."
	mappath = "modular_chomp/maps/submaps/surface_submaps/wilderness/DJOutpost3.dmm"
	template_group = "Sif Free Radio"
	cost = 10

/datum/map_template/surface/wilderness/deep/DJOutpost4
	name = "DJOutpost 4"
	desc = "The surprisingly high-tech home of Sif Free Radio, the only radio station run by mindless clones."
	mappath = "modular_chomp/maps/submaps/surface_submaps/wilderness/DJOutpost4.dmm"
	template_group = "Sif Free Radio"
	cost = 10

/datum/map_template/surface/wilderness/deep/dogbase
	name = "Dog Base"
	desc = "A highly secured base with hungry trained canines"
	mappath = "modular_chomp/maps/submaps/surface_submaps/wilderness/dogbase.dmm"
	cost = 20
	template_group = "Dog Base"

/datum/map_template/surface/wilderness/deep/dogbaseAlt
	name = "Spider Base"
	desc = "A highly secured base with hungry trained spider"
	mappath = "modular_chomp/maps/submaps/surface_submaps/wilderness/dogbaseAlt.dmm"
	cost = 20
	template_group = "Dog Base"

/datum/map_template/surface/wilderness/deep/doomP
	name = "DoomP"
	desc = "Witty description here."
	mappath = "modular_chomp/maps/submaps/surface_submaps/wilderness/DoomP.dmm"
	cost = 30
	template_group = "doomP"

/datum/map_template/surface/wilderness/deep/doomPAlt
	name = "Doom Bridge"
	desc = "Witty description here 2."
	mappath = "modular_chomp/maps/submaps/surface_submaps/wilderness/DoomPAlt.dmm"
	cost = 30
	template_group = "doomP"

/datum/map_template/surface/wilderness/deep/drgnplateu
	name = "Dragon Plateu"
	desc = "A dangerous plateu of cliffs home to a rampant gold hoarding dragon"
	mappath = "modular_chomp/maps/submaps/surface_submaps/wilderness/drgnplateu.dmm"
	cost = 15
	template_group = "drgnplateu"

/datum/map_template/surface/wilderness/deep/drgnplateuAlt
	name = "Dragon Island"
	desc = "A dangerous lava island home to a rampant gold hoarding dragon"
	mappath = "modular_chomp/maps/submaps/surface_submaps/wilderness/drgnplateuAlt.dmm"
	cost = 15
	template_group = "drgnplateu"

/datum/map_template/surface/wilderness/normal/drugden
	name = "Drug Den"
	desc = "The remains of ill thought out whims."
	mappath = "modular_chomp/maps/submaps/surface_submaps/wilderness/Drugden.dmm"
	cost = 20

/datum/map_template/surface/wilderness/normal/emptycabin
	name = "Empty Cabin"
	desc = "An inconspicuous looking den hosted by a hungry otie"
	mappath = "modular_chomp/maps/submaps/surface_submaps/wilderness/emptycabin.dmm"
	cost = 10

/datum/map_template/surface/wilderness/deep/epod3
	name = "Emergency Pod 3"
	desc = "A webbed Emergency pod in the middle of nowhere."
	mappath = "modular_chomp/maps/submaps/surface_submaps/wilderness/Epod3.dmm"
	cost = 5

/datum/map_template/surface/wilderness/normal/epod4
	name = "Emergency Pod 4"
	desc = "A flooded Emergency pod in the middle of nowhere."
	mappath = "modular_chomp/maps/submaps/surface_submaps/wilderness/Epod4.dmm"
	cost = 5

/datum/map_template/surface/wilderness/normal/frostflynest
	name = "Frostfly Nest"
	desc = "The nest of a Frostfly, or more."
	mappath = "modular_chomp/maps/submaps/surface_submaps/wilderness/FrostflyNest.dmm"
	cost = 20

/datum/map_template/surface/wilderness/normal/frostoasis
	name = "Frost Oasis"
	desc = "A strange oasis with a gathering of wild animals."
	mappath = "modular_chomp/maps/submaps/surface_submaps/wilderness/frostoasis.dmm"
	cost = 15

/datum/map_template/surface/wilderness/normal/flake
	name = "Forest Lake"
	desc = "A serene lake sitting amidst the surface."
	mappath = "modular_chomp/maps/submaps/surface_submaps/wilderness/Flake.dmm"
	cost = 10

/datum/map_template/surface/wilderness/normal/govpatrol
	name = "Government Patrol"
	desc = "A long lost SifGuard ground survey patrol. Now they have you guys!"
	mappath = "modular_chomp/maps/submaps/surface_submaps/wilderness/GovPatrol.dmm"
	cost = 5

/datum/map_template/surface/wilderness/deep/greatwolfden
	name = "Great Wolf Den"
	desc = "Den hosted by the biggest alpha wolf of the wilderness"
	mappath = "modular_chomp/maps/submaps/surface_submaps/wilderness/greatwolfden.dmm"
	cost = 15

/datum/map_template/surface/wilderness/deep/hadzardzone
	name = "Hadzard Zone"
	desc = "A strange and secure drop site."
	mappath = "modular_chomp/maps/submaps/surface_submaps/wilderness/hadzardzone.dmm"
	cost = 15

/datum/map_template/surface/wilderness/deep/hadzardzone
	name = "Burning Hadzard Zone"
	desc = "A strange and secure drop site, now onfire"
	mappath = "modular_chomp/maps/submaps/surface_submaps/wilderness/hadzardzone2.dmm"
	cost = 15

/datum/map_template/surface/wilderness/normal/kururakden
	name = "Kururak Den"
	desc = "The den of a Kururak pack. May contain hibernating members."
	mappath = "modular_chomp/maps/submaps/surface_submaps/wilderness/kururakden.dmm"
	cost = 5

/datum/map_template/surface/wilderness/normal/lab1
	name = "Lab 1"
	desc = "An isolated small robotics lab."
	mappath = "modular_chomp/maps/submaps/surface_submaps/wilderness/Lab1.dmm"
	cost = 5

/datum/map_template/surface/wilderness/deep/leopardmanderden
	name = "Leopardmander Den"
	desc = "Den of a voracious but very rare beast."
	mappath = "modular_chomp/maps/submaps/surface_submaps/wilderness/leopardmanderden.dmm"
	cost = 10

/datum/map_template/surface/wilderness/deep/lonewolf
	name = "Lone Wolf"
	desc = "A large oppressing wolf, supervising from above its cliff"
	mappath = "modular_chomp/maps/submaps/surface_submaps/wilderness/lonewolf.dmm"
	cost = 5

/datum/map_template/surface/wilderness/deep/manor1
	name = "Manor 1"
	desc = "Whodunit"
	mappath = "modular_chomp/maps/submaps/surface_submaps/wilderness/Manor1.dmm"
	cost = 20
	template_group = "Manor"

/datum/map_template/surface/wilderness/deep/manor1Alt
	name = "Manor 2"
	desc = "Whodunit2"
	mappath = "modular_chomp/maps/submaps/surface_submaps/wilderness/Manor1Alt.dmm"
	cost = 20
	template_group = "Manor"

/datum/map_template/surface/wilderness/normal/Mcamp1
	name = "Military Camp 1"
	desc = "A derelict military camp host to some unsavory dangers"
	mappath = "modular_chomp/maps/submaps/surface_submaps/wilderness/MCamp1.dmm"
	cost = 5

/datum/map_template/surface/wilderness/normal/mudpit
	name = "Mudpit"
	desc = "What happens when someone is a bit too careless with gas.."
	mappath = "modular_chomp/maps/submaps/surface_submaps/wilderness/Mudpit.dmm"
	cost = 5

/datum/map_template/surface/wilderness/normal/musk
	name = "Musk"
	desc = "0 to 60 in 1.9 seconds."
	mappath = "modular_chomp/maps/submaps/surface_submaps/wilderness/Musk.dmm"
	cost = 10

/datum/map_template/surface/wilderness/deep/otieshelter
	name = "Otie Shelter"
	desc = "A experimental lab of various breeds of oties"
	mappath = "modular_chomp/maps/submaps/surface_submaps/wilderness/otieshelter.dmm"
	cost = 15

/datum/map_template/surface/wilderness/normal/rocky1
	name = "Rocky 1"
	desc = "DununanununanununuNAnana"
	mappath = "modular_chomp/maps/submaps/surface_submaps/wilderness/Rocky1.dmm"
	allow_duplicates = TRUE
	cost = 5

/datum/map_template/surface/wilderness/normal/rocky2
	name =  "Rocky 2"
	desc = "More rocks."
	mappath = "modular_chomp/maps/submaps/surface_submaps/wilderness/Rocky2.dmm"
	allow_duplicates = TRUE
	cost = 5

/datum/map_template/surface/wilderness/normal/Rocky3
	name = "Rocky 3"
	desc = "More and more and more rocks."
	mappath = "modular_chomp/maps/submaps/surface_submaps/wilderness/Rocky3.dmm"
	cost = 5

/datum/map_template/surface/wilderness/normal/rocky4
	name = "Rocky 4"
	desc = "An interesting geographic formation."
	mappath = "modular_chomp/maps/submaps/surface_submaps/wilderness/Rocky4.dmm"
	cost = 5

/datum/map_template/surface/wilderness/deep/rockybase
	name = "Rocky Base"
	desc = "A guide to upsetting Icarus and the EIO"
	mappath = "modular_chomp/maps/submaps/surface_submaps/wilderness/Rockybase.dmm"
	cost = 35
	template_group = "Rocky Base"

/datum/map_template/surface/wilderness/deep/rockybaseAlt
	name = "Rocky Mining Base"
	desc = "A guide to upsetting mining"
	mappath = "modular_chomp/maps/submaps/surface_submaps/wilderness/RockybaseAlt.dmm"
	cost = 35
	template_group = "Rocky Base"

/datum/map_template/surface/wilderness/normal/shack1
	name = "Shack 1"
	desc = "A small shack in the middle of nowhere, Your halloween murder happens here"
	mappath = "modular_chomp/maps/submaps/surface_submaps/wilderness/Shack1.dmm"
	cost = 5

/datum/map_template/surface/wilderness/normal/shelter1
	name = "Shelter 1"
	desc = "The remains of a resourceful, but prideful explorer."
	mappath = "modular_chomp/maps/submaps/surface_submaps/wilderness/Shelter.dmm"
	cost = 10

/datum/map_template/surface/wilderness/normal/smol1
	name = "Smol 1"
	desc = "A tiny grove of trees, The Nemesis of thicc"
	mappath = "modular_chomp/maps/submaps/surface_submaps/wilderness/Smol1.dmm"
	cost = 5

/datum/map_template/surface/wilderness/normal/snowrock1
	name = "Snowrock 1"
	desc = "A rocky snow covered area"
	mappath = "modular_chomp/maps/submaps/surface_submaps/wilderness/Snowrock1.dmm"
	cost = 5

/datum/map_template/surface/wilderness/normal/spider1
	name = "Spider Nest 1"
	desc = "A small spider nest, in the forest."
	mappath = "modular_chomp/maps/submaps/surface_submaps/wilderness/spider1.dmm"
	allow_duplicates = TRUE
	cost = 5

/datum/map_template/surface/wilderness/deep/syndisniperAlt
	name = "Syndi Drone"
	desc = "Syndicate watch tower, deadly but secluded, now with a drone"
	mappath = "modular_chomp/maps/submaps/surface_submaps/wilderness/syndisniperAlt.dmm"
	cost = 5
	template_group = "Sniper"

/datum/map_template/surface/wilderness/normal/wolfden
	name = "Wolf Den"
	desc = "Small wolf den and their hunt spoils."
	mappath = "modular_chomp/maps/submaps/surface_submaps/wilderness/wolfden.dmm"
	cost = 10

/datum/map_template/surface/wilderness/deep/xenohive
	name = "Xeno Hive"
	desc = "A containment experiment gone wrong."
	mappath = "modular_chomp/maps/submaps/surface_submaps/wilderness/xenohive.dmm"
	cost = 25

/datum/map_template/surface/wilderness/deep/cliffbase
	name = "Cliff Base"
	desc = "A hideout protected by a lake, and duo of snipers."
	mappath = "modular_chomp/maps/submaps/surface_submaps/wilderness/AmbushBase.dmm"
	cost = 30

/datum/map_template/surface/wilderness/deep/cliffbaseAlt
	name = "Cliff lake Base"
	desc = "A hideout protected by a lake, and duo of snipers, but the spiders are on strike."
	mappath = "modular_chomp/maps/submaps/surface_submaps/wilderness/AmbushBaseAlt.dmm"
	cost = 30
	template_group = "AmbushBase"

/datum/map_template/surface/wilderness/deep/raideddmechhanger
	name = "Raided Mech Hanger"
	desc = "A hanger with mechs far past useabiltiy."
	mappath = "modular_chomp/maps/submaps/surface_submaps/wilderness/RaidedMechBunker.dmm"
	cost = 15

/datum/map_template/surface/wilderness/deep/AbandonedLab
	name = "Abandoned Lab"
	desc = "Experiments gone wrong! Be wary of the test subjects gone rogue."
	mappath = "modular_chomp/maps/submaps/surface_submaps/wilderness/AbandonedLab.dmm"
	cost = 20

/datum/map_template/surface/wilderness/deep/AbandonedLab
	name = "Abandoned Lab"
	desc = "Experiments gone wrong! Be wary of the test subjects gone rogue."
	mappath = "modular_chomp/maps/submaps/surface_submaps/wilderness/AbandonedLab.dmm"
	cost = 20

/datum/map_template/surface/wilderness/deep/VolcanicFissure
	name = "Volcanic Fissure"
	desc = "Strange alien tech has caused magma to surface, creating a pit of lava."
	mappath = "modular_chomp/maps/submaps/surface_submaps/wilderness/VolcanicFissure.dmm"
	cost = 20

/datum/map_template/surface/wilderness/deep/PirateLake
	name = "Volcanic Fissure"
	desc = "Yarr, explorers my expirence diffcults when facing defenses of water and table."
	mappath = "modular_chomp/maps/submaps/surface_submaps/wilderness/PirateLake.dmm"
	cost = 20

/*==Disabled==/

/datum/map_template/surface/wilderness/deep/Boombase //YW Edit remove boombase
	name = "Boombase"
	desc = "What happens when you don't follow SOP."
	mappath = "modular_chomp/maps/submaps/surface_submaps/wilderness/Boombase.dmm"
	cost = 5

/datum/map_template/surface/wilderness/normal/chemspill2
	name = "Acrid Lake"
	desc = "A pool of water contaminated with highly dangerous chemicals."
	mappath = "modular_chomp/maps/submaps/surface_submaps/wilderness/chemspill2.dmm"
	cost = 10

/datum/map_template/surface/wilderness/deep/MHR
	name = "Manhack Rock"
	desc = "A rock filled with nasty Synthetics."
	mappath = "modular_chomp/maps/submaps/surface_submaps/wilderness/MHR.dmm"
	cost = 15

*/
