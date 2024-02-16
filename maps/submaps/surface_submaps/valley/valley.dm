// This causes PoI maps to get 'checked' and compiled, when undergoing a unit test.
// This is so CI can validate PoIs, and ensure future changes don't break PoIs, as PoIs are loaded at runtime and the compiler can't catch errors.
// When adding a new PoI, please add it to this list.
#if MAP_TEST
#include "begderg.dmm"
#include "blobden.dmm"
#include "bloodchurch.dmm"
#include "clockwork.dmm"
#include "cove.dmm"
#include "crashedexplo.dmm"
#include "CultBar.dmm"
#include "demonranch.dmm"
#include "dronelord.dmm"
#include "fallenportal.dmm"
#include "frostlake.dmm"
#include "leechpond.dmm"
#include "leppy.dmm"
#include "mausarmy.dmm"
#include "metroidmaze.dmm"
#include "phorondragon.dmm"
#include "piratefortress.dmm"
#include "piratevessel.dmm"
#include "piratevox.dmm"
#include "plontden.dmm"
#include "Redshuttledown.dmm"
#include "solarmoff.dmm"
#include "spooderchurch.dmm"
#include "teppifarm.dmm"
#include "vault.dmm"
#include "xenobio.dmm"
#endif

/datum/map_template/surface/valley
	name = "Surface Content - Valley"
	desc = "Used to make a place of strange terror."

//For POIs in the valley walls.
/datum/map_template/surface/valley/walls

//For POIs in the center.
/dataum/map_template/surface/valley/inner

/datum/map_template/surface/valley/walls/begderg
	name = "Dragon Den"
	desc = "A rocky den for a big dragon rematch"
	mappath = 'maps/submaps/surface_submaps/valley/begderg.dmm'
	cost = 25

/datum/map_template/surface/valley/walls/blobden
	name = "Blob Den"
	desc = "An large supply drop with an unfortante guest"
	mappath = 'maps/submaps/surface_submaps/valley/blobden.dmm'
	cost = 25

/datum/map_template/surface/valley/inner/bloodchurch
	name = "Blood Church"
	desc = "A chorus of carnage sung from high above."
	mappath = 'maps/submaps/surface_submaps/valley/bloodchurch.dmm'
	cost = 25


/datum/map_template/surface/valley/walls/carriershuttle
	name = "Carrier Shuttle"
	desc = "A parked merc shuttle with a mini zoo"
	mappath = 'maps/submaps/surface_submaps/valley/carriershuttle.dmm'
	cost = 25

/datum/map_template/surface/valley/inner/cliffmanor
	name = "Cliff Manor"
	desc = "A small shack surronded by jellyfish and a moat"
	mappath = 'maps/submaps/surface_submaps/valley/cliffmanor.dmm'
	cost = 25


/datum/map_template/surface/valley/walls/clockwork
	name = "Clockwork Den"
	desc = "A firey pit with what remains of a nigh fallen church"
	mappath = 'maps/submaps/surface_submaps/valley/clockwork.dmm'
	cost = 25

/datum/map_template/surface/valley/walls/cove
	name = "Pirate Cove"
	desc = "A cove full of pirates. And a brawl outside."
	mappath = 'maps/submaps/surface_submaps/valley/cove.dmm'
	cost = 25

/datum/map_template/surface/valley/inner/crashedexplo
	name = "Spider Explo"
	desc = "Oh look, some spider explorers"
	mappath = 'maps/submaps/surface_submaps/valley/crashedexplo.dmm'
	cost = 25

/datum/map_template/surface/valley/inner/cultbar
	name = "Cult Bar"
	desc = "A bar surronded by demons, for those of the occult."
	mappath = 'maps/submaps/surface_submaps/valley/CultBar.dmm'
	cost = 25

/datum/map_template/surface/valley/inner/demonranch
	name = "Demon Ranch"
	desc = "A farm made in an attempt to reduced demon summoning costs."
	mappath = 'maps/submaps/surface_submaps/valley/demonranch.dmm'
	cost = 25

/datum/map_template/surface/valley/walls/dronelord
	name = "Drone Overlords"
	desc = "A duo of bounty hunters utlizing drones"
	mappath = 'maps/submaps/surface_submaps/valley/dronelord.dmm'
	cost = 25


/datum/map_template/surface/valley/inner/eclipseaqua
	name = "Eclipse Base Aqua"
	desc = "An island base making a certian chem"
	mappath = 'maps/submaps/surface_submaps/valley/eclipseaqua.dmm'
	cost = 25

/datum/map_template/surface/valley/walls/eclipsedigsight
	name = "Eclipse Base Dig"
	desc = "A large scale xenoarch digsite."
	mappath = 'maps/submaps/surface_submaps/valley/eclipsedigsight.dmm'
	cost = 25

/datum/map_template/surface/valley/walls/eclipselava
	name = "Eclipse Base Molten"
	desc = "A well defended base guarding a strange expirement"
	mappath = 'maps/submaps/surface_submaps/valley/eclipselava.dmm'
	cost = 25

/datum/map_template/surface/valley/inner/eclipsemountain
	name = "Eclipse Base Mountain"
	desc = "A telecomns base"
	mappath = 'maps/submaps/surface_submaps/valley/eclipsemountain.dmm'
	cost = 25


/datum/map_template/surface/valley/walls/fallenlab
	name = "Fallen Lab"
	desc = "A lab created to expirment with nanites, long since forgotten"
	mappath = 'maps/submaps/surface_submaps/valley/fallenlab.dmm'
	cost = 25

/datum/map_template/surface/valley/inner/fallenportal
	name = "Failed Portal"
	desc = "Someone attemted to create a portal to redspace. Forgot the BSA"
	mappath = 'maps/submaps/surface_submaps/valley/fallenportal.dmm'
	cost = 25

/datum/map_template/surface/valley/walls/frostlake
	name = "Frost Lake"
	desc = "Ice Puzzle, now with death"
	mappath = 'maps/submaps/surface_submaps/valley/frostlake.dmm'
	cost = 25


/datum/map_template/surface/valley/walls/hydroxeno
	name = "Aquatic Xenos"
	desc = "Xenomoprhs in a squish cave"
	mappath = 'maps/submaps/surface_submaps/valley/hydroxeno.dmm'
	cost = 25

/datum/map_template/surface/valley/inner/leechpond
	name = "Leech Pond"
	desc = "A strange lake reborn."
	mappath = 'maps/submaps/surface_submaps/valley/leechpond.dmm'
	cost = 25


/datum/map_template/surface/valley/walls/leppy
	name = "Leppy Den"
	desc = "A rare leppy with some rare friends."
	mappath = 'maps/submaps/surface_submaps/valley/leppy.dmm'
	cost = 25

/datum/map_template/surface/valley/inner/mausarmy
	name = "Mouse Takeover"
	desc = "Mice trying to take over a warehouse"
	mappath = 'maps/submaps/surface_submaps/valley/mausarmy.dmm'
	cost = 25

/datum/map_template/surface/valley/walls/metroidmaze
	name = "Maze"
	desc = "A strange maze with several metroids"
	mappath = 'maps/submaps/surface_submaps/valley/metroidmaze.dmm'
	cost = 25


/datum/map_template/surface/valley/inner/mouseattack
	name = "Assualt Base"
	desc = "A base with many mice ready for attack"
	mappath = 'maps/submaps/surface_submaps/valley/mouseattack.dmm'
	cost = 25

/datum/map_template/surface/valley/walls/mousehq
	name = "Maus HQ"
	desc = "An HQ that holds many deadly mice"
	mappath = 'maps/submaps/surface_submaps/valley/mousehq.dmm'
	cost = 25


/datum/map_template/surface/valley/walls/phorondragon
	name = "Phoron Den"
	desc = "A den of several phoron dragons"
	mappath = 'maps/submaps/surface_submaps/valley/phorondragon.dmm'
	cost = 25

/datum/map_template/surface/valley/inner/piratefortress
	name = "Pirate Fort"
	desc = "A goodie and pirate filled base with a moat"
	mappath = 'maps/submaps/surface_submaps/valley/piratefortress.dmm'
	cost = 25

/datum/map_template/surface/valley/inner/piratevessel
	name = "Pirate Vessel"
	desc = "A vessel meant for short jaunts and raids"
	mappath = 'maps/submaps/surface_submaps/valley/piratevessel.dmm'
	cost = 25

/datum/map_template/surface/valley/inner/piratevpx
	name = "Vox Pirates"
	desc = "A mercanry vessel having some vox raiders attack"
	mappath = 'maps/submaps/surface_submaps/valley/piratevox.dmm'
	cost = 25

/datum/map_template/surface/valley/walls/plontden
	name = "Plant Den"
	desc = "A familiar looking plant set up"
	mappath = 'maps/submaps/surface_submaps/valley/plontden.dmm'
	cost = 25


/datum/map_template/surface/valley/walls/puzzledungeon
	name = "Puzzle Dungeon"
	desc = "No threats just puzzles"
	mappath = 'maps/submaps/surface_submaps/valley/puzzledungeon.dmm'
	cost = 25


/datum/map_template/surface/valley/inner/redshuttledown
	name = "Red Shuttle Down"
	desc = "The mercanry bringing out some of their best to scout Sif"
	mappath = 'maps/submaps/surface_submaps/valley/Redshuttledown.dmm'
	cost = 25


/datum/map_template/surface/valley/inner/settlement
	name = "Settlement"
	desc = "An abaondened settlement."
	mappath = 'maps/submaps/surface_submaps/valley/settlement.dmm'
	cost = 25

/datum/map_template/surface/valley/inner/siegepoint
	name = "Siege Point"
	desc = "A friendly merc base under the assualt of pirates"
	mappath = 'maps/submaps/surface_submaps/valley/siegepoint.dmm'
	cost = 25


/datum/map_template/surface/valley/walls/solarmoff
	name = "Solar Pond"
	desc = "A pond with fesh and a small sun"
	mappath = 'maps/submaps/surface_submaps/valley/solarmoff.dmm'
	cost = 25

/datum/map_template/surface/valley/inner/spooderchurch
	name = "Spider Church"
	desc = "Trust us, it's a cult about spiders, ignore the mercs"
	mappath = 'maps/submaps/surface_submaps/valley/spooderchurch.dmm'
	cost = 25

/datum/map_template/surface/valley/inner/teppifarm
	name = "Teppi Farm"
	desc = "Cute a teppi"
	mappath = 'maps/submaps/surface_submaps/valley/teppifarm.dmm'
	cost = 25

/datum/map_template/surface/valley/walls/vault
	name = "Vault"
	desc = "The vault holds many secerts"
	mappath = 'maps/submaps/surface_submaps/valley/vault.dmm'
	cost = 25

/datum/map_template/surface/valley/inner/xenobio
	name = "Xenobio Lab"
	desc = "A ruined xenobio"
	mappath = 'maps/submaps/surface_submaps/valley/xenobio.dmm'
	cost = 25
