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
<<<<<<< Updated upstream
	mappath = 'maps/submaps/surface_submaps/valley/begderg.dmm
=======
	mappath = 'maps/submaps/surface_submaps/valley/begderg.dmm'
>>>>>>> Stashed changes
	cost = 25

/datum/map_template/surface/valley/walls/blobden
	name = "Blob Den"
	desc = "An large supply drop with an unfortante guest"
<<<<<<< Updated upstream
	mappath = 'maps/submaps/surface_submaps/valley/blobden.dmm
=======
	mappath = 'maps/submaps/surface_submaps/valley/blobden.dmm'
>>>>>>> Stashed changes
	cost = 25

/datum/map_template/surface/valley/inner/bloodchurch
	name = "Blood Church"
	desc = "A chorus of carnage sung from high above."
<<<<<<< Updated upstream
	mappath = 'maps/submaps/surface_submaps/valley/bloodchurch.dmm
=======
	mappath = 'maps/submaps/surface_submaps/valley/bloodchurch.dmm'
>>>>>>> Stashed changes
	cost = 25

/datum/map_template/surface/valley/walls/clockwork
	name = "Clockwork Den"
	desc = "A firey pit with what remains of a nigh fallen church"
<<<<<<< Updated upstream
	mappath = 'maps/submaps/surface_submaps/valley/clockwork.dmm
=======
	mappath = 'maps/submaps/surface_submaps/valley/clockwork.dmm'
>>>>>>> Stashed changes
	cost = 25

/datum/map_template/surface/valley/walls/cove
	name = "Pirate Cove"
	desc = "A cove full of pirates. And a brawl outside."
<<<<<<< Updated upstream
	mappath = 'maps/submaps/surface_submaps/valley/cove.dmm
=======
	mappath = 'maps/submaps/surface_submaps/valley/cove.dmm'
>>>>>>> Stashed changes
	cost = 25

/datum/map_template/surface/valley/inner/crashedexplo
	name = "Spider Explo"
<<<<<<< Updated upstream
	desc = "Oh look, some spider explorers."
	mappath = 'maps/submaps/surface_submaps/valley/crashedexplo.dmm
=======
	desc = "Oh look, some spider explorers"
	mappath = 'maps/submaps/surface_submaps/valley/crashedexplo.dmm'
>>>>>>> Stashed changes
	cost = 25

/datum/map_template/surface/valley/inner/demonranch
	name = "Demon Ranch"
	desc = "A farm made in an attempt to reduced demon summoning costs."
<<<<<<< Updated upstream
	mappath = 'maps/submaps/surface_submaps/valley/demonranch.dmm
=======
	mappath = 'maps/submaps/surface_submaps/valley/demonranch.dmm'
>>>>>>> Stashed changes
	cost = 25

/datum/map_template/surface/valley/walls/dronelord
	name = "Drone Overlords"
<<<<<<< Updated upstream
	desc = "A duo of bounty hunters utlizing drones."
	mappath = 'maps/submaps/surface_submaps/valley/dronelord.dmm
=======
	desc = "A duo of bounty hunters utlizing drones"
	mappath = 'maps/submaps/surface_submaps/valley/dronelord.dmm'
>>>>>>> Stashed changes
	cost = 25

/datum/map_template/surface/valley/walls/fallenlab
	name = "Fallen Lab"
	desc = "A lab created to expirment with nanites, long since forgotten"
<<<<<<< Updated upstream
	mappath = 'maps/submaps/surface_submaps/valley/fallenlab.dmm
=======
	mappath = 'maps/submaps/surface_submaps/valley/fallenlab.dmm'
>>>>>>> Stashed changes
	cost = 25

/datum/map_template/surface/valley/inner/fallenportal
	name = "Failed Portal"
	desc = "Someone attemted to create a portal to redspace. Forgot the BSA"
<<<<<<< Updated upstream
	mappath = 'maps/submaps/surface_submaps/valley/fallenportal.dmm
=======
	mappath = 'maps/submaps/surface_submaps/valley/fallenportal.dmm'
>>>>>>> Stashed changes
	cost = 25

/datum/map_template/surface/valley/inner/frostlake
	name = "Frost Lake"
	desc = "Ice Puzzle, now with death"
<<<<<<< Updated upstream
	mappath = 'maps/submaps/surface_submaps/valley/frostlake.dmm
=======
	mappath = 'maps/submaps/surface_submaps/valley/frostlake.dmm'
>>>>>>> Stashed changes
	cost = 25

/datum/map_template/surface/valley/walls/leppy
	name = "Leppy Den"
	desc = "A rare leppy with some rare friends."
<<<<<<< Updated upstream
	mappath = 'maps/submaps/surface_submaps/valley/leppy.dmm
=======
	mappath = 'maps/submaps/surface_submaps/valley/leppy.dmm'
>>>>>>> Stashed changes
	cost = 25

/datum/map_template/surface/valley/inner/mausarmy
	name = "Mouse Takeover"
	desc = "Mice trying to take over a warehouse"
<<<<<<< Updated upstream
	mappath = 'maps/submaps/surface_submaps/valley/mausarmy.dmm
=======
	mappath = 'maps/submaps/surface_submaps/valley/mausarmy.dmm'
>>>>>>> Stashed changes
	cost = 25

/datum/map_template/surface/valley/walls/metroidmaze
	name = "Maze"
<<<<<<< Updated upstream
	desc = "A strange maze with several metroids."
	mappath = 'maps/submaps/surface_submaps/valley/metroidmae.dmm
=======
	desc = "A strange maze with several metroids"
	mappath = 'maps/submaps/surface_submaps/valley/metroidmae.dmm'
>>>>>>> Stashed changes
	cost = 25

/datum/map_template/surface/valley/walls/phorondragon
	name = "Phoron Den"
	desc = "A den of several phoron dragons"
<<<<<<< Updated upstream
	mappath = 'maps/submaps/surface_submaps/valley/phorondragon.dmm
=======
	mappath = 'maps/submaps/surface_submaps/valley/phorondragon.dmm'
>>>>>>> Stashed changes
	cost = 25

/datum/map_template/surface/valley/inner/piratefortress
	name = "Pirate Fort"
	desc = "A goodie and pirate filled base with a moat"
<<<<<<< Updated upstream
	mappath = 'maps/submaps/surface_submaps/valley/piratefortress.dmm
=======
	mappath = 'maps/submaps/surface_submaps/valley/piratefortress.dmm'
>>>>>>> Stashed changes
	cost = 25

/datum/map_template/surface/valley/inner/piratevessel
	name = "Pirate Vessel"
	desc = "A vessel meant for short jaunts and raids"
<<<<<<< Updated upstream
	mappath = 'maps/submaps/surface_submaps/valley/piratevessel.dmm
=======
	mappath = 'maps/submaps/surface_submaps/valley/piratevessel.dmm'
>>>>>>> Stashed changes
	cost = 25

/datum/map_template/surface/valley/inner/piratevpx
	name = "Vox Pirates"
<<<<<<< Updated upstream
	desc = "A mercanry vessel having some vox raiders attack."
	mappath = 'maps/submaps/surface_submaps/valley/piratevox.dmm
=======
	desc = "A mercanry vessel having some vox raiders attack"
	mappath = 'maps/submaps/surface_submaps/valley/piratevox.dmm'
>>>>>>> Stashed changes
	cost = 25

/datum/map_template/surface/valley/walls/plontden
	name = "Plant Den"
	desc = "A familiar looking plant set up"
<<<<<<< Updated upstream
	mappath = 'maps/submaps/surface_submaps/valley/plontden.dmm
=======
	mappath = 'maps/submaps/surface_submaps/valley/plontden.dmm'
>>>>>>> Stashed changes
	cost = 25

/datum/map_template/surface/valley/inner/redshuttledown
	name = "Red Shuttle Down"
	desc = "The mercanry bringing out some of their best to scout Sif"
<<<<<<< Updated upstream
	mappath = 'maps/submaps/surface_submaps/valley/Redshuttledown.dmm
	cost = 25

/datum/map_template/surface/valley/walls/solarmoff
	name = ""
	desc = "."
	mappath = 'maps/submaps/surface_submaps/valley/solarmoff.dmm
=======
	mappath = 'maps/submaps/surface_submaps/valley/Redshuttledown.dmm'
	cost = 25

/datum/map_template/surface/valley/walls/solarmoff
	name = "Solar Pond"
	desc = "A pond with fesh and a small sun"
	mappath = 'maps/submaps/surface_submaps/valley/solarmoff.dmm'
>>>>>>> Stashed changes
	cost = 25

/datum/map_template/surface/valley/inner/spooderchurch
	name = "Spider Church"
	desc = "Trust us, it's a cult about spiders, ignore the mercs"
<<<<<<< Updated upstream
	mappath = 'maps/submaps/surface_submaps/valley/spooderchurch.dmm
=======
	mappath = 'maps/submaps/surface_submaps/valley/spooderchurch.dmm'
>>>>>>> Stashed changes
	cost = 25

/datum/map_template/surface/valley/inner/teppifarm
	name = "Teppi Farm"
	desc = "Cute a teppi"
<<<<<<< Updated upstream
	mappath = 'maps/submaps/surface_submaps/valley/teppifarm.dmm
=======
	mappath = 'maps/submaps/surface_submaps/valley/teppifarm.dmm'
>>>>>>> Stashed changes
	cost = 25

/datum/map_template/surface/valley/walls/vault
	name = "Vault"
	desc = "The vault holds many secerts"
<<<<<<< Updated upstream
	mappath = 'maps/submaps/surface_submaps/valley/vault.dmm
=======
	mappath = 'maps/submaps/surface_submaps/valley/vault.dmm'
>>>>>>> Stashed changes
	cost = 25

/datum/map_template/surface/valley/inner/xenobio
	name = "Xenobio Lab"
	desc = "A ruined xenobio"
<<<<<<< Updated upstream
	mappath = 'maps/submaps/surface_submaps/valley/xenobio.dmm
=======
	mappath = 'maps/submaps/surface_submaps/valley/xenobio.dmm'
>>>>>>> Stashed changes
	cost = 25
