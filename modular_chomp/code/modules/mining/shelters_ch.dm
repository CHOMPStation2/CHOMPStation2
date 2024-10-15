/datum/map_template/shelter
	var/superpose = FALSE
	var/shuttle = FALSE

// Subtype to mark maps for use with the superpose capsule. This is mostly to prevent automatic additions from upstream changes.
/datum/map_template/shelter/superpose
	superpose = TRUE
	name = "ERROR: string 'name' cannot be null!"
	description = "ERROR: string 'description' cannot be null!"
	mappath = null

/* Does not spawn properly
/datum/map_template/shelter/superpose/CrashedInfestedShip
	shelter_id = "CrashedInfestedShip"
	mappath = "modular_chomp/maps/submaps/shelters/CrashedInfestedShip-56x25.dmm"
	name = "Crashed infested ship."
	description = "A large alien ship that is heavily damaged, there is signs of xeno infestation."
*/

/* Does not spawn properly
/datum/map_template/shelter/superpose/CrashedQurantineShip
	shelter_id = "CrashedQurantineShip"
	mappath = "modular_chomp/maps/submaps/shelters/CrashedQurantineShip-25x25.dmm"
	name = "Crashed Qurantine Ship."
	description = "A white medical ship that is heavily damaged, there is signs of a viral outbreak."
*/
/datum/map_template/shelter/superpose/CultShip
	shelter_id = "CultShip"
	mappath = "modular_chomp/maps/submaps/shelters/CultShip-28x17.dmm"
	name = "Cultist ship."
	description = "A medium size cult themed ship, it has some basic cultist gear."

/datum/map_template/shelter/superpose/dragoncave
	shelter_id = "DragonCave"
	mappath = "modular_chomp/maps/submaps/shelters/DragonCave-18x18.dmm"
	name = "Dragon Cave"
	description = "A small cave with treasure featuring a tucked away hotspring."

/datum/map_template/shelter/superpose/DemonPool
	shelter_id = "DemonPool"
	mappath = "modular_chomp/maps/submaps/shelters/DemonPool-21x21.dmm"
	name = "Demon pool."
	description = "A large redspace corruption with lava, flesh tiles and a small cultist room in the middle."

/datum/map_template/shelter/superpose/Dinner
	shelter_id = "Dinner"
	mappath = "modular_chomp/maps/submaps/shelters/Dinner-25x25.dmm"
	name = "Local diner."
	description = "A medium size diner with all kitchen appliances and food."

/datum/map_template/shelter/superpose/ExplorerHome
	shelter_id = "ExplorerHome"
	mappath = "modular_chomp/maps/submaps/shelters/ExplorerHome-17x20.dmm"
	name = "Explorer home."
	description = "A small wooden home with various hunting prizes and the basics to survive in the wilderness."

/datum/map_template/shelter/superpose/Farm
	shelter_id = "Farm"
	mappath = "modular_chomp/maps/submaps/shelters/Farm-32x32.dmm"
	name = "Farm."
	description = "A medium size farm with all the needs to grow food!"

/datum/map_template/shelter/superpose/FieldLab
	shelter_id = "FieldLab"
	mappath = "modular_chomp/maps/submaps/shelters/FieldLab-20x20.dmm"
	name = "Field laboratory."
	description = "A compact laboratory with various science machines and equipment."

/datum/map_template/shelter/superpose/HellCave
	shelter_id = "HellCave"
	mappath = "modular_chomp/maps/submaps/shelters/HellCave-40x25.dmm"
	name = "Hell cave."
	description = "A small cave corrupted by redspace, filled with various cultist items."

/datum/map_template/shelter/superpose/HydroCave
	shelter_id = "HydroCave"
	mappath = "modular_chomp/maps/submaps/shelters/HydroCave-40x40.dmm"
	name = "Hydroponics cave."
	description = "A burried hydroponics facility with various living quarters needs and equipment."

/* Does not spawn properly/Too OP for outsider use
/datum/map_template/shelter/superpose/LargeAlienShip
	shelter_id = "LargeAlienShip"
	mappath = "modular_chomp/maps/submaps/shelters/LargeAlienShip-57x25.dmm"
	name = "Large alien ship."
	description = "A large alien ship filled with various alien machines and items."
*/

/datum/map_template/shelter/superpose/LoneHome
	shelter_id = "LoneHome"
	mappath = "modular_chomp/maps/submaps/shelters/LoneHome-18x22.dmm"
	name = "Lonely home."
	description = "An old very worn down wooden house, with enough materials and tools to refurnish and repair it."

/datum/map_template/shelter/superpose/LoneHomeclean
	shelter_id = "LoneHomeclean"
	mappath = "modular_chomp/maps/submaps/shelters/LoneHomeclean-18x22.dmm"
	name = "Lonely home. (Repaired)"


/datum/map_template/shelter/superpose/MechFabShip
	shelter_id = "MechFabShip"
	mappath = "modular_chomp/maps/submaps/shelters/MechFabShip-27x24.dmm"
	name = "Mech fabrication ship."
	description = "A medium size ship equiped with mech fabrication machines."

/datum/map_template/shelter/superpose/MechStorageFab
	shelter_id = "MechStorageFab"
	mappath = "modular_chomp/maps/submaps/shelters/MechStorageFab-32x24.dmm"
	name = "Mech storage facility."
	description = "An old abandoned mech fabrication facility, most of the facility seems functional."

/* Does not spawn properly/too OP for outsider use
/datum/map_template/shelter/superpose/MercShip
	shelter_id = "MercShip"
	mappath = "modular_chomp/maps/submaps/shelters/MercShip-57x25.dmm"
	name = "Mercenary ship."
	description = "A old mercenery ship filled with various trading goods."
*/

/datum/map_template/shelter/superpose/MethLab
	shelter_id = "MethLab"
	mappath = "modular_chomp/maps/submaps/shelters/MethLab-20x20.dmm"
	name = "Meth laboratory."
	description = "A old worn down chemical lab used to produce illegal goods."

/datum/map_template/shelter/superpose/OldHotel
	shelter_id = "OldHotel"
	mappath = "modular_chomp/maps/submaps/shelters/OldHotel-25x25.dmm"
	name = "Old hotel."
	description = "An old worn down wooden hotel, heavily damaged but with enough materials to patch it up."

/datum/map_template/shelter/superpose/NewHotel
	shelter_id = "NewHotel"
	mappath = "modular_chomp/maps/submaps/shelters/NewHotel-18x22.dmm"
	name = "New Hotel."
	description = "An new not-worn down wooden hotel, not heavily damaged but with enough materials to do whatever."
/* Commented out due to poor implemantation, might be re-added as an outsider OM object.
/datum/map_template/shelter/superpose/ScienceShip
	shelter_id = "ScienceShip"
	mappath = "modular_chomp/maps/submaps/shelters/ScienceShip-25x33.dmm"
	name = "Science ship."
	description = "An expedition science ship with all the needs to host a small team."
*/
/datum/map_template/shelter/superpose/SmallCombatShip
	shelter_id = "SmallCombatShip"
	mappath = "modular_chomp/maps/submaps/shelters/SmallCombatShip-9x11.dmm"
	name = "Small combat ship."
	description = "A small combat ship with the bare minimum needs for survival."

/datum/map_template/shelter/superpose/SurvivalBarracks
	shelter_id = "SurvivalBarracks"
	mappath = "modular_chomp/maps/submaps/shelters/SurvivalBarracks-11x11.dmm"
	name = "Survival barracks."
	description = "NT patented living quarters survival pod, all the needs to host 4 crew-mates."

/datum/map_template/shelter/superpose/SurvivalCargo
	shelter_id = "SurvivalCargo"
	mappath = "modular_chomp/maps/submaps/shelters/SurvivalCargo-11x11.dmm"
	name = "Survival cargo dep."
	description = "NT patented cargo department survival pod, loaded with mining, crates and cargo gear."

/datum/map_template/shelter/superpose/SurvivalDIY_11x11
	shelter_id = "SurvivalDIY_11x11"
	mappath = "modular_chomp/maps/submaps/shelters/SurvivalDIY-11x11.dmm"
	name = "Survival DIY large."
	description = "NT patented Do-it-yourself survival pod, a large inflatable building filled with building materials. It even has a RCD and a cargo vehicle."

/datum/map_template/shelter/superpose/SurvivalDIYlite_11x11
	shelter_id = "SurvivalDIY_11x11lite"
	mappath = "modular_chomp/maps/submaps/shelters/SurvivalDIYlite-11x11.dmm"
	name = "Survival DIY large. (Lite version)"
	description = "NT patented Do-it-yourself survival pod, a much more stripped down of the existing large pod for more construction freedom."

/datum/map_template/shelter/superpose/SurvivalDIY_7x7
	shelter_id = "SurvivalDIY_7x7"
	mappath = "modular_chomp/maps/submaps/shelters/SurvivalDIY-7x7.dmm"
	name = "Survival DIY medium."
	description = "NT patented Do-it-yourself survival pod, a medium inflatable building filled with building materials. It even has a RCD and a quad-bike."

/datum/map_template/shelter/superpose/SurvivalDIY_9x9
	shelter_id = "SurvivalDIY_9x9"
	mappath = "modular_chomp/maps/submaps/shelters/SurvivalDIY-9x9.dmm"
	name = "Survival DIY small."
	description = "NT patented Do-it-yourself survival pod, a small inflatable building filled with building materials. It even has a RCD."

/datum/map_template/shelter/superpose/SurvivalDinner
	shelter_id = "SurvivalDinner"
	mappath = "modular_chomp/maps/submaps/shelters/SurvivalDinner-11x11.dmm"
	name = "Survival mess hall."
	description = "NT patented mess hall and kitchen survival pod, it has all a kitchen requires to cook food. Bathroom included!"

/datum/map_template/shelter/superpose/SurvivalEngineering
	shelter_id = "SurvivalEngineering"
	mappath = "modular_chomp/maps/submaps/shelters/SurvivalEngineering-9x9.dmm"
	name = "Survival engineering dep."
	description = "NT patented engineering survival pod, loaded with tools, machines and materials to patch and fix any facility."

/datum/map_template/shelter/superpose/SurvivalHome
	shelter_id = "SurvivalHome"
	mappath = "modular_chomp/maps/submaps/shelters/SurvivalHome-9x9.dmm"
	name = "Survival home pod."
	description = "A medium survival pod that can host a small team, has some basic survival gear."

/datum/map_template/shelter/superpose/SurvivalHydro
	shelter_id = "SurvivalHydro"
	mappath = "modular_chomp/maps/submaps/shelters/SurvivalHydro-9x9.dmm"
	name = "Survival hydroponics bay. "
	description = "NT patented hydroponics survival pod, loaded with everything you need to start growing food."

/datum/map_template/shelter/superpose/SurvivalJanitor
	shelter_id = "SurvivalJanitor"
	mappath = "modular_chomp/maps/submaps/shelters/SurvivalJanitor-7x7.dmm"
	name = "Survival janitor pod."
	description = "NT patented janitor survival pod, loaded with enough cleaning supplies to clean any mess."

/datum/map_template/shelter/superpose/SurvivalLeisure
	shelter_id = "SurvivalLeisure"
	mappath = "modular_chomp/maps/submaps/shelters/SurvivalLeisure-9x9.dmm"
	name = "Survival leisure pod."
	description = "NT patented leisure survival pod, loaded with various recreational goods to stave off boredom."

/datum/map_template/shelter/superpose/SurvivalLuxuryBar
	shelter_id = "SurvivalLuxuryBar"
	mappath = "modular_chomp/maps/submaps/shelters/SurvivalLuxuryBar-11x11.dmm"
	name = "Survival luxury bar."
	description = "A luxurious bar pod, includes a large selection of liquors, bathroom and even a strip room!"

/datum/map_template/shelter/superpose/SurvivalLuxuryHome
	shelter_id = "SurvivalLuxuryHome"
	mappath = "modular_chomp/maps/submaps/shelters/SurvivalLuxuryHome-11x11.dmm"
	name = "Survival luxury home."
	description = "A luxurious pod filled with various home amenities, is a home away from home!"

/datum/map_template/shelter/superpose/SurvivalMedical
	shelter_id = "SurvivalMedical"
	mappath = "modular_chomp/maps/submaps/shelters/SurvivalMedical-9x9.dmm"
	name = "Survival medical dep."
	description = "NT patented medical survival pod, loaded with medical equipment, scanner, sleeper and a surgery table."

/datum/map_template/shelter/superpose/SurvivalPool
	shelter_id = "SurvivalPool"
	mappath = "modular_chomp/maps/submaps/shelters/SurvivalPool-11x11.dmm"
	name = "Survival pool pod."
	description = "NT patented leisure pool survival pod, a leisure structure for crew to workout and relax."

/datum/map_template/shelter/superpose/SurvivalQuarters
	shelter_id = "SurvivalQuarters"
	mappath = "modular_chomp/maps/submaps/shelters/SurvivalQuarters-9x9.dmm"
	name = "Survival living quarters."
	description = "NT patented survival quarters pod, loaded with survival equipment and enough beds for 4 crewmates."
/* Commented out due to powergame
/datum/map_template/shelter/superpose/SurvivalScience
	shelter_id = "SurvivalScience"
	mappath = "modular_chomp/maps/submaps/shelters/SurvivalScience-9x9.dmm"
	name = "Survival science dep."
	description = "NT patented science survival pod, loaded with research terminals, mech fabricator, autolathe and everything to do field research."
*/
/datum/map_template/shelter/superpose/SurvivalSecurity
	shelter_id = "SurvivalSecurity"
	mappath = "modular_chomp/maps/submaps/shelters/SurvivalSecurity-9x9.dmm"
	name = "Survival security dep."
	description = "NT patented security survival pod, a high security brig with and some security equipment."

/datum/map_template/shelter/superpose/TinyCombatShip
	shelter_id = "TinyCombatShip"
	mappath = "modular_chomp/maps/submaps/shelters/TinyCombatShip-9x7.dmm"
	name = "Tiny combat ship."
	description = "A very small combat ship with the bare minimum of survival gear."

/datum/map_template/shelter/superpose/TradingShip
	shelter_id = "TradingShip"
	mappath = "modular_chomp/maps/submaps/shelters/TradingShip-40x22.dmm"
	name = "Trading ship."
	description = "A trading ship stocked with various goods."

/datum/map_template/shelter/superpose/WoodenCamp
	shelter_id = "WoodenCamp"
	mappath = "modular_chomp/maps/submaps/shelters/WoodenCamp-10x10.dmm"
	name = "Wooden camp."
	description = "A very small camping lodge, a quick emergency hut to stave off the planets weather."

/datum/map_template/shelter/superpose/AnimalHospital
	shelter_id = "AnimalHospital"
	mappath = "modular_chomp/maps/submaps/shelters/AnimalHospital-20x28.dmm"
	name = "Low-Tech Hospital."
	description = "An animal hospital, does not contain high end medical supplies, better then nothing."

/datum/map_template/shelter/superpose/RestaurationBar
	shelter_id = "RestaurationBar"
	mappath = "modular_chomp/maps/submaps/shelters/RestaurationBar-32x32.dmm"
	name = "Resto-Bar"
	description = "A large restaurant for food and drink, two overnight rental rooms and a small garden."

/datum/map_template/shelter/superpose/BroadcastingPod
	shelter_id = "BroadcastingPod"
	mappath = "modular_chomp/maps/submaps/shelters/BroadcastingPod-11x9.dmm"
	name = "Broadcasting Pod"
	description = "A small NanoTransen news pod, everything you need to start live news in the most inhospitable places!"

/datum/map_template/shelter/superpose/DemonPoolV2
	shelter_id = "DemonPoolV2"
	mappath = "modular_chomp/maps/submaps/shelters/DemonPoolV2-43x28.dmm"
	name = "Demon Pool V2"
	description = "A large redspace corruption with lava, flesh tiles and a small cultist room in the middle. This one is enclosed in rock!"

/datum/map_template/shelter/superpose/PirateShip
	shelter_id = "PirateShip"
	mappath = "modular_chomp/maps/submaps/shelters/PirateShip-13x30.dmm"
	name = "Pirate Ship"
	description = "Yarg, a medium size pirate ship filled with loaded canons and empty chest, booty awaits."

/datum/map_template/shelter/superpose/SurvivalHomeV2
	shelter_id = "SurvivalHomeV2"
	mappath = "modular_chomp/maps/submaps/shelters/SurvivalHomeV2-9x9.dmm"
	name = "Survival Home V2"
	description = "A medium survival pod that can host a small team, has some basic survival gear."


/datum/map_template/shelter/superpose/SurvivalMechFab
	shelter_id = "SurvivalMechFab"
	mappath = "modular_chomp/maps/submaps/shelters/SurvivalMechFab-9x9.dmm"
	name = "Survival Mech Fab"
	description = "A medium survival pod with a mech and some basic mech fabrication machinery, fix and retrofit!"

/datum/map_template/shelter/superpose/SurvivalMethLab
	shelter_id = "SurvivalMethLab"
	mappath = "modular_chomp/maps/submaps/shelters/SurvivalMethLab-9x10.dmm"
	name = "Survival Meth Lab"
	description = "A medium survival pod, repurposed and locked for the production of illegal chems. Don't get caught."
/* Removed due to powergaming
/datum/map_template/shelter/superpose/SurvivalScienceV2
	shelter_id = "SurvivalScienceV2"
	mappath = "modular_chomp/maps/submaps/shelters/SurvivalScience2-9x9.dmm"
	name = "Survival Science V2"
	description = "NT patented science survival pod, loaded with research terminals, mech fabricator, autolathe and everything to do field research."
*/
/datum/map_template/shelter/superpose/SurvivalSecurityV2
	shelter_id = "SurvivalSecurityV2"
	mappath = "modular_chomp/maps/submaps/shelters/SurvivalSecurity2-9x9.dmm"
	name = "Survival Security V2"
	description = "NT patented security survival pod, a high security brig with and some security equipment."

/datum/map_template/shelter/superpose/HillOutpost
	shelter_id = "HillOutpost"
	mappath = "modular_chomp/maps/submaps/shelters/HillOutpost-15x11.dmm"
	name = "Hill Outpost"
	description = "A small camping site on top of a hill, with all the basics for survival."

/datum/map_template/shelter/superpose/pizzaparlor
	shelter_id = "PizzaParlor"
	mappath = "modular_chomp/maps/submaps/shelters/PizzaParlor-18x19.dmm"
	name = "Pizza Parlor"
	description = "A small locally owned pizza parlor, now with delivery services."

/datum/map_template/shelter/superpose/GrandLibrary
	shelter_id = "GrandLibrary"
	mappath = "modular_chomp/maps/submaps/shelters/GrandLibrary-31x24.dmm"
	name = "Pizza Parlor"
	description = "A grand ornate library, more books than you can count."

/datum/map_template/shelter/superpose/logcabin
	shelter_id = "logcabin"
	mappath = "modular_chomp/maps/submaps/shelters/Logcabin-19x9.dmm"
	name = "Log Cabin"
	description = "A cozy log cabin with some 'magical' items."

/datum/map_template/shelter/superpose/hotel
	shelter_id = "hotel"
	mappath = "modular_chomp/maps/submaps/shelters/Hotel-36x18.dmm"
	name = "Large Sif Hotel"
	description = "A large hotel designed for hospitality of up to 8 people, comes with a kitchen and a bar. May contain pests."

/datum/map_template/shelter/superpose/XenoBotanySetup
	shelter_id = "XenoBotanySetup"
	mappath = "modular_chomp/maps/submaps/shelters/XenobotanySetup-19x11.dmm"
	name = "Xenobotany Lab"
	description = "A cozy little lab made for plant life."
