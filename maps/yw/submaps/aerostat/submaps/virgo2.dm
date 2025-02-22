#include "virgo2_submap_areas.dm"

#ifdef MAP_TEST
#include "Flake.dmm"
#include "MCamp1.dmm"
#include "Rocky1.dmm"
#include "Shack1.dmm"
#include "Smol1.dmm"
#include "Mudpit.dmm"
#include "Snowrock1.dmm"
//#include "Boombase.dmm" //Remove boombase
#include "Blackshuttledown.dmm"
#include "Lab1.dmm"
#include "Rocky4.dmm"
#include "DJOutpost1.dmm"
#include "DJOutpost2.dmm"
#include "Rockybase.dmm"
#include "MHR.dmm"
#include "GovPatrol.dmm"
#include "DecoupledEngine.dmm"
#include "DoomP.dmm"
#include "CaveS.dmm"
#include "Drugden.dmm"
#include "Musk.dmm"
#include "Manor1.dmm"
#include "Epod3.dmm"
#include "Epod4.dmm"
#include "ButcherShack.dmm"
#endif

/datum/map_template/virgo2
	name = "Surface Content - Virgo 2"
	desc = "For seeding submaps on Virgo 2"
	allow_duplicates = FALSE

/datum/map_template/virgo2/Flake
	name = "Forest Lake"
	desc = "A serene lake sitting amidst the surface."
	mappath = "maps/yw/submaps/aerostat/submaps/Flake.dmm"
	cost = 10

/datum/map_template/virgo2/Mcamp1
	name = "Military Camp 1"
	desc = "A derelict military camp host to some unsavory dangers"
	mappath = "maps/yw/submaps/aerostat/submaps/MCamp1.dmm"
	cost = 5

/datum/map_template/virgo2/Mudpit
	name = "Mudpit"
	desc = "What happens when someone is a bit too careless with gas.."
	mappath = "maps/yw/submaps/aerostat/submaps/Mudpit.dmm"
	cost = 5

/datum/map_template/virgo2/Rocky1
	name = "Rocky1"
	desc = "DununanununanununuNAnana"
	mappath = "maps/yw/submaps/aerostat/submaps/Rocky1.dmm"
	allow_duplicates = TRUE
	cost = 5

/datum/map_template/virgo2/Shack1
	name = "Shack1"
	desc = "A small shack in the middle of nowhere, Your halloween murder happens here"
	mappath = "maps/yw/submaps/aerostat/submaps/Shack1.dmm"
	cost = 5

/datum/map_template/virgo2/Smol1
	name = "Smol1"
	desc = "A tiny grove of trees, The Nemesis of thicc"
	mappath = "maps/yw/submaps/aerostat/submaps/Smol1.dmm"
	cost = 5

/datum/map_template/virgo2/Snowrock1
	name = "Snowrock1"
	desc = "A rocky snow covered area"
	mappath = "maps/yw/submaps/aerostat/submaps/Snowrock1.dmm"
	cost = 5

/datum/map_template/virgo2/Lab1
	name = "Lab1"
	desc = "An isolated small robotics lab."
	mappath = "maps/yw/submaps/aerostat/submaps/Lab1.dmm"
	cost = 5

/datum/map_template/virgo2/Rocky4
	name = "Rocky4"
	desc = "An interesting geographic formation."
	mappath = "maps/yw/submaps/aerostat/submaps/Rocky4.dmm"
	cost = 5

/datum/map_template/virgo2/DJOutpost1
	name = "DJOutpost1"
	desc = "Home of Sif Free Radio, the best - and only - radio station for miles around."
	mappath = "maps/yw/submaps/aerostat/submaps/DJOutpost1.dmm"
	template_group = "Sif Free Radio"
	cost = 5

/datum/map_template/virgo2/DJOutpost2
	name = "DJOutpost2"
	desc = "The cratered remains of Sif Free Radio, the best - and only - radio station for miles around."
	mappath = "maps/yw/submaps/aerostat/submaps/DJOutpost2.dmm"
	template_group = "Sif Free Radio"
	cost = 5

/*/datum/map_template/virgo2/Boombase Remove boombase
	name = "Boombase"
	desc = "What happens when you don't follow SOP."
	mappath = "maps/yw/submaps/aerostat/submaps/Boombase.dmm"
	cost = 5*/

/datum/map_template/virgo2/BSD
	name = "Black Shuttle Down"
	desc = "You REALLY shouldn't be near this."
	mappath = "maps/yw/submaps/aerostat/submaps/Blackshuttledown.dmm"
	cost = 30

/datum/map_template/virgo2/Rockybase
	name = "Rocky Base"
	desc = "A guide to upsetting Icarus and the EIO"
	mappath = "maps/yw/submaps/aerostat/submaps/Rockybase.dmm"
	cost = 35

/datum/map_template/virgo2/MHR
	name = "Manhack Rock"
	desc = "A rock filled with nasty Synthetics."
	mappath = "maps/yw/submaps/aerostat/submaps/MHR.dmm"
	cost = 15

/datum/map_template/virgo2/GovPatrol
	name = "Government Patrol"
	desc = "A long lost SifGuard ground survey patrol. Now they have you guys!"
	mappath = "maps/yw/submaps/aerostat/submaps/GovPatrol.dmm"
	cost = 5

/datum/map_template/virgo2/DecoupledEngine
	name = "Decoupled Engine"
	desc = "A damaged fission engine jettisoned from a starship long ago."
	mappath = "maps/yw/submaps/aerostat/submaps/DecoupledEngine.dmm"
	cost = 15

/datum/map_template/virgo2/DoomP
	name = "DoomP"
	desc = "Witty description here."
	mappath = "maps/yw/submaps/aerostat/submaps/DoomP.dmm"
	cost = 30

/datum/map_template/virgo2/Cave
	name = "CaveS"
	desc = "Chitter chitter!"
	mappath = "maps/yw/submaps/aerostat/submaps/CaveS.dmm"
	cost = 20

/datum/map_template/virgo2/Drugden
	name = "Drugden"
	desc = "The remains of ill thought out whims."
	mappath = "maps/yw/submaps/aerostat/submaps/Drugden.dmm"
	cost = 20

/datum/map_template/virgo2/Musk
	name = "Musk"
	desc = "0 to 60 in 1.9 seconds."
	mappath = "maps/yw/submaps/aerostat/submaps/Musk.dmm"
	cost = 10

/datum/map_template/virgo2/Manor1
	name = "Manor1"
	desc = "Whodunit"
	mappath = "maps/yw/submaps/aerostat/submaps/Manor1.dmm"
	cost = 20

/datum/map_template/virgo2/Epod3
	name = "Emergency Pod 3"
	desc = "A webbed Emergency pod in the middle of nowhere."
	mappath = "maps/yw/submaps/aerostat/submaps/Epod3.dmm"
	cost = 5

/datum/map_template/virgo2/Epod4
	name = "Emergency Pod 4"
	desc = "A flooded Emergency pod in the middle of nowhere."
	mappath = "maps/yw/submaps/aerostat/submaps/Epod4.dmm"
	cost = 5

/datum/map_template/virgo2/ButcherShack
	name = "Butcher Shack"
	desc = "An old, bloody butcher's shack. Get your meat here!"
	mappath = "maps/yw/submaps/aerostat/submaps/butchershack.dmm"
	cost = 5
