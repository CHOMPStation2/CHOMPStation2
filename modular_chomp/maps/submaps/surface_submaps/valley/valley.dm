// This causes PoI maps to get 'checked' and compiled, when undergoing a unit test.
// This is so CI can validate PoIs, and ensure future changes don't break PoIs, as PoIs are loaded at runtime and the compiler can't catch errors.
// When adding a new PoI, please add it to this list.
#ifdef MAP_TEST
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
#include "xenobioeclipse.dmm"
#include "warzone.dmm"
#include "frozenlab.dmm"
#include "terror.dmm"
#include "toxiclake.dmm"
#include "laserpuzzle.dmm"
#include "alientomb.dmm"
#include "eclipseblob.dmm"
#include "eclipsecargo.dmm"
#include "raidedpod.dmm"
#include "paperworks.dmm"
#include "terraformer.dmm"
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
	mappath = "modular_chomp/maps/submaps/surface_submaps/valley/begderg.dmm"
	cost = 25

/datum/map_template/surface/valley/walls/blobden
	name = "Blob Den"
	desc = "An large supply drop with an unfortante guest"
	mappath = "modular_chomp/maps/submaps/surface_submaps/valley/blobden.dmm"
	cost = 25

/datum/map_template/surface/valley/inner/bloodchurch
	name = "Blood Church"
	desc = "A chorus of carnage sung from high above."
	mappath = "modular_chomp/maps/submaps/surface_submaps/valley/bloodchurch.dmm"
	cost = 25


/datum/map_template/surface/valley/walls/carriershuttle
	name = "Carrier Shuttle"
	desc = "A parked merc shuttle with a mini zoo"
	mappath = "modular_chomp/maps/submaps/surface_submaps/valley/carriershuttle.dmm"
	cost = 25

/datum/map_template/surface/valley/inner/cliffmanor
	name = "Cliff Manor"
	desc = "A small shack surronded by jellyfish and a moat"
	mappath = "modular_chomp/maps/submaps/surface_submaps/valley/cliffmanor.dmm"
	cost = 25


/datum/map_template/surface/valley/walls/clockwork
	name = "Clockwork Den"
	desc = "A firey pit with what remains of a nigh fallen church"
	mappath = "modular_chomp/maps/submaps/surface_submaps/valley/clockwork.dmm"
	cost = 25

/datum/map_template/surface/valley/walls/cove
	name = "Pirate Cove"
	desc = "A cove full of pirates. And a brawl outside."
	mappath = "modular_chomp/maps/submaps/surface_submaps/valley/cove.dmm"
	cost = 25

/datum/map_template/surface/valley/inner/crashedexplo
	name = "Spider Explo"
	desc = "Oh look, some spider explorers"
	mappath = "modular_chomp/maps/submaps/surface_submaps/valley/crashedexplo.dmm"
	cost = 25

/datum/map_template/surface/valley/inner/cultbar
	name = "Cult Bar"
	desc = "A bar surronded by demons, for those of the occult."
	mappath = "modular_chomp/maps/submaps/surface_submaps/valley/CultBar.dmm"
	cost = 25

/datum/map_template/surface/valley/inner/demonranch
	name = "Demon Ranch"
	desc = "A farm made in an attempt to reduced demon summoning costs."
	mappath = "modular_chomp/maps/submaps/surface_submaps/valley/demonranch.dmm"
	cost = 25

/datum/map_template/surface/valley/walls/dronelord
	name = "Drone Overlords"
	desc = "A duo of bounty hunters utlizing drones"
	mappath = "modular_chomp/maps/submaps/surface_submaps/valley/dronelord.dmm"
	cost = 25


/datum/map_template/surface/valley/inner/eclipseaqua
	name = "Eclipse Base Aqua"
	desc = "An island base making a certian chem"
	mappath = "modular_chomp/maps/submaps/surface_submaps/valley/eclipseaqua.dmm"
	cost = 25

/datum/map_template/surface/valley/walls/eclipsedigsight
	name = "Eclipse Base Dig"
	desc = "A large scale xenoarch digsite."
	mappath = "modular_chomp/maps/submaps/surface_submaps/valley/eclipsedigsight.dmm"
	cost = 25

/datum/map_template/surface/valley/walls/eclipselava
	name = "Eclipse Base Molten"
	desc = "A well defended base guarding a strange expirement"
	mappath = "modular_chomp/maps/submaps/surface_submaps/valley/eclipselava.dmm"
	cost = 25

/datum/map_template/surface/valley/inner/eclipsemountain
	name = "Eclipse Base Mountain"
	desc = "A telecomns base"
	mappath = "modular_chomp/maps/submaps/surface_submaps/valley/eclipsemountain.dmm"
	cost = 25


/datum/map_template/surface/valley/walls/fallenlab
	name = "Fallen Lab"
	desc = "A lab created to expirment with nanites, long since forgotten"
	mappath = "modular_chomp/maps/submaps/surface_submaps/valley/fallenlab.dmm"
	cost = 25

/datum/map_template/surface/valley/inner/fallenportal
	name = "Failed Portal"
	desc = "Someone attemted to create a portal to redspace. Forgot the BSA"
	mappath = "modular_chomp/maps/submaps/surface_submaps/valley/fallenportal.dmm"
	cost = 25

/datum/map_template/surface/valley/walls/frostlake
	name = "Frost Lake"
	desc = "Ice Puzzle, now with death"
	mappath = "modular_chomp/maps/submaps/surface_submaps/valley/frostlake.dmm"
	cost = 25


/datum/map_template/surface/valley/walls/hydroxeno
	name = "Aquatic Xenos"
	desc = "Xenomoprhs in a squish cave"
	mappath = "modular_chomp/maps/submaps/surface_submaps/valley/hydroxeno.dmm"
	cost = 25

/datum/map_template/surface/valley/inner/leechpond
	name = "Leech Pond"
	desc = "A strange lake reborn."
	mappath = "modular_chomp/maps/submaps/surface_submaps/valley/leechpond.dmm"
	cost = 25


/datum/map_template/surface/valley/walls/leppy
	name = "Leppy Den"
	desc = "A rare leppy with some rare friends."
	mappath = "modular_chomp/maps/submaps/surface_submaps/valley/leppy.dmm"
	cost = 25

/datum/map_template/surface/valley/inner/mausarmy
	name = "Mouse Takeover"
	desc = "Mice trying to take over a warehouse"
	mappath = "modular_chomp/maps/submaps/surface_submaps/valley/mausarmy.dmm"
	cost = 25

/datum/map_template/surface/valley/walls/metroidmaze
	name = "Maze"
	desc = "A strange maze with several metroids"
	mappath = "modular_chomp/maps/submaps/surface_submaps/valley/metroidmaze.dmm"
	cost = 25


/datum/map_template/surface/valley/inner/mouseattack
	name = "Assualt Base"
	desc = "A base with many mice ready for attack"
	mappath = "modular_chomp/maps/submaps/surface_submaps/valley/mouseattack.dmm"
	cost = 25

/datum/map_template/surface/valley/walls/mousehq
	name = "Maus HQ"
	desc = "An HQ that holds many deadly mice"
	mappath = "modular_chomp/maps/submaps/surface_submaps/valley/mousehq.dmm"
	cost = 25


/datum/map_template/surface/valley/walls/phorondragon
	name = "Phoron Den"
	desc = "A den of several phoron dragons"
	mappath = "modular_chomp/maps/submaps/surface_submaps/valley/phorondragon.dmm"
	cost = 25

/datum/map_template/surface/valley/inner/piratefortress
	name = "Pirate Fort"
	desc = "A goodie and pirate filled base with a moat"
	mappath = "modular_chomp/maps/submaps/surface_submaps/valley/piratefortress.dmm"
	cost = 25

/datum/map_template/surface/valley/inner/piratevessel
	name = "Pirate Vessel"
	desc = "A vessel meant for short jaunts and raids"
	mappath = "modular_chomp/maps/submaps/surface_submaps/valley/piratevessel.dmm"
	cost = 25

/datum/map_template/surface/valley/inner/piratevpx
	name = "Vox Pirates"
	desc = "A mercanry vessel having some vox raiders attack"
	mappath = "modular_chomp/maps/submaps/surface_submaps/valley/piratevox.dmm"
	cost = 25

/datum/map_template/surface/valley/walls/plontden
	name = "Plant Den"
	desc = "A familiar looking plant set up"
	mappath = "modular_chomp/maps/submaps/surface_submaps/valley/plontden.dmm"
	cost = 25


/datum/map_template/surface/valley/walls/puzzledungeon
	name = "Puzzle Dungeon"
	desc = "No threats just puzzles"
	mappath = "modular_chomp/maps/submaps/surface_submaps/valley/puzzledungeon.dmm"
	cost = 25


/datum/map_template/surface/valley/inner/redshuttledown
	name = "Red Shuttle Down"
	desc = "The mercanry bringing out some of their best to scout Sif"
	mappath = "modular_chomp/maps/submaps/surface_submaps/valley/Redshuttledown.dmm"
	cost = 25


/datum/map_template/surface/valley/inner/settlement
	name = "Settlement"
	desc = "An abaondened settlement."
	mappath = "modular_chomp/maps/submaps/surface_submaps/valley/settlement.dmm"
	cost = 25

/datum/map_template/surface/valley/inner/siegepoint
	name = "Siege Point"
	desc = "A friendly merc base under the assualt of pirates"
	mappath = "modular_chomp/maps/submaps/surface_submaps/valley/siegepoint.dmm"
	cost = 25


/datum/map_template/surface/valley/walls/solarmoff
	name = "Solar Pond"
	desc = "A pond with fesh and a small sun"
	mappath = "modular_chomp/maps/submaps/surface_submaps/valley/solarmoff.dmm"
	cost = 25

/datum/map_template/surface/valley/inner/spooderchurch
	name = "Spider Church"
	desc = "Trust us, it's a cult about spiders, ignore the mercs"
	mappath = "modular_chomp/maps/submaps/surface_submaps/valley/spooderchurch.dmm"
	cost = 25

/datum/map_template/surface/valley/inner/teppifarm
	name = "Teppi Farm"
	desc = "Cute a teppi"
	mappath = "modular_chomp/maps/submaps/surface_submaps/valley/teppifarm.dmm"
	cost = 25

/datum/map_template/surface/valley/walls/vault
	name = "Vault"
	desc = "The vault holds many secerts"
	mappath = "modular_chomp/maps/submaps/surface_submaps/valley/vault.dmm"
	cost = 25

/datum/map_template/surface/valley/inner/xenobio
	name = "Xenobio Lab"
	desc = "A ruined xenobio"
	mappath = "modular_chomp/maps/submaps/surface_submaps/valley/xenobio.dmm"
	cost = 25

/datum/map_template/surface/valley/inner/xenobioeclipse
	name = "Eclipse Xenobio Lab"
	desc = "A slime pit of the eclipse"
	mappath = "modular_chomp/maps/submaps/surface_submaps/valley/xenobioeclipse.dmm"
	cost = 25

/datum/map_template/surface/valley/inner/warzone
	name = "Warzone"
	desc = "A radio shack being assualted from all sides"
	mappath = "modular_chomp/maps/submaps/surface_submaps/valley/warzone.dmm"
	cost = 25

/datum/map_template/surface/valley/inner/frozenlab
	name = "Frozen Lab"
	desc = "An Eclipse site for creation attempts of cryomancers"
	mappath = "modular_chomp/maps/submaps/surface_submaps/valley/frozenlab.dmm"
	cost = 25

/datum/map_template/surface/valley/wall/terror
	name = "Terror"
	desc = "A scouting group of the Eclipse"
	mappath = "modular_chomp/maps/submaps/surface_submaps/valley/terror.dmm"
	cost = 25

/datum/map_template/surface/valley/wall/toxiclake
	name = "Toxic Lake"
	desc = "A lake brimming with toxins"
	mappath = "modular_chomp/maps/submaps/surface_submaps/valley/toxiclake.dmm"
	cost = 25

/datum/map_template/surface/valley/wall/laserdome
	name = "Laser Dome"
	desc = "A strange building with a simple puzzle of sorts."
	mappath = "modular_chomp/maps/submaps/surface_submaps/valley/laserpuzzle.dmm"
	cost = 25

/datum/map_template/surface/valley/wall/alientomb
	name = "Alien Tomb"
	desc = "A strange building with a simple puzzle of sorts."
	mappath = "modular_chomp/maps/submaps/surface_submaps/valley/alientomb.dmm"
	cost = 25

/datum/map_template/surface/valley/wall/eclipseblob
	name = "Eclipse Blob"
	desc = "Blob escape 2."
	mappath = "modular_chomp/maps/submaps/surface_submaps/valley/eclipseblob.dmm"
	cost = 25

/datum/map_template/surface/valley/inner/eclipsecargo
	name = "Eclipse Cargo"
	desc = "A small cargo shuttle of the eclipse."
	mappath = "modular_chomp/maps/submaps/surface_submaps/valley/eclipsecargo.dmm"
	cost = 25

/datum/map_template/surface/valley/wall/paperworks
	name = "Paper Dome"
	desc = "A building with some minor paperwork."
	mappath = "modular_chomp/maps/submaps/surface_submaps/valley/paperworks.dmm"
	cost = 25

/datum/map_template/surface/valley/inner/raidedpod
	name = "Raided Pod"
	desc = "A crashed escape pod."
	mappath = "modular_chomp/maps/submaps/surface_submaps/valley/raidedpod.dmm"
	cost = 25

/datum/map_template/surface/valley/inner/terraformer
	name = "Terraformer"
	desc = "A strange attempt at terraforming."
	mappath = "modular_chomp/maps/submaps/surface_submaps/valley/terraformer.dmm"
	cost = 25
