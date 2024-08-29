/obj/machinery/mineral/equipment_vendor/survey
	name = "exploration equipment vendor"
	desc = "An equipment vendor for explorers, points collected with a survey scanner can be spent here."
	icon = 'icons/obj/machines/mining_machines_vr.dmi' //VOREStation Edit
	icon_state = "exploration" //VOREStation Edit
	density = TRUE
	anchored = TRUE
	circuit = /obj/item/circuitboard/exploration_equipment_vendor // CHOMPEdit - Removal of obj/item/weapon
	icon_deny = "exploration-deny" //VOREStation Edit
	icon_vend = "exploration-vend" //VOREStation Add
	prize_list = list(
		new /datum/data/mining_equipment("1 Marker Beacon",				/obj/item/stack/marker_beacon,										1),
		new /datum/data/mining_equipment("10 Marker Beacons",			/obj/item/stack/marker_beacon/ten,									10),
		new /datum/data/mining_equipment("30 Marker Beacons",			/obj/item/stack/marker_beacon/thirty,								30),
		new /datum/data/mining_equipment("Whiskey",						/obj/item/reagent_containers/food/drinks/bottle/whiskey,		120), // CHOMPEdit - Removal of obj/item/weapon
		new /datum/data/mining_equipment("Absinthe",					/obj/item/reagent_containers/food/drinks/bottle/absinthe,	120), // CHOMPEdit - Removal of obj/item/weapon
		new /datum/data/mining_equipment("Cigar",						/obj/item/clothing/mask/smokable/cigarette/cigar/havana,			15),
		new /datum/data/mining_equipment("Soap",						/obj/item/soap/nanotrasen,									20), // CHOMPEdit - Removal of obj/item/weapon
		new /datum/data/mining_equipment("Laser Pointer",				/obj/item/laser_pointer,										90), // CHOMPEdit - Removal of obj/item/device
		new /datum/data/mining_equipment("Geiger Counter",				/obj/item/geiger,											75), // CHOMPEdit - Removal of obj/item/device
		new /datum/data/mining_equipment("Plush Toy",					/obj/random/plushie,												30),
		new /datum/data/mining_equipment("Umbrella",					/obj/item/melee/umbrella/random,								10), // CHOMPEdit - Removal of obj/item/weapon
		new /datum/data/mining_equipment("Extraction Equipment - Fulton Beacon",	/obj/item/fulton_core,									100),
		new /datum/data/mining_equipment("Extraction Equipment - Fulton Pack",		/obj/item/extraction_pack,								50),
		new /datum/data/mining_equipment("Point Transfer Card",			/obj/item/card/mining_point_card/survey,						50), // CHOMPEdit - Removal of obj/item/weapon
		new /datum/data/mining_equipment("Fishing Net",					/obj/item/material/fishing_net,								50), // CHOMPEdit - Removal of obj/item/weapon
		new /datum/data/mining_equipment("Titanium Fishing Rod",		/obj/item/material/fishing_rod/modern,						50), // CHOMPEdit - Removal of obj/item/weapon
		new /datum/data/mining_equipment("Direct Payment - 1000",		/obj/item/spacecash/c1000,									500), // CHOMPEdit - Removal of obj/item/weapon
		new /datum/data/mining_equipment("Industrial Equipment - Phoron Bore",	/obj/item/gun/magnetic/matfed/phoronbore/loaded,		500), // CHOMPEdit - Removal of obj/item/weapon
		new /datum/data/mining_equipment("Survey Tools - Mapping Unit",	/obj/item/mapping_unit,										150), // CHOMPEdit - Removal of obj/item/device
		new /datum/data/mining_equipment("Survey Tools - Mapping Beacon",/obj/item/holomap_beacon,									25), // CHOMPEdit - Removal of obj/item/device
		new /datum/data/mining_equipment("Survey Tools - Shovel",		/obj/item/shovel,											20), // CHOMPEdit - Removal of obj/item/weapon
		new /datum/data/mining_equipment("Survey Tools - Mechanical Trap",	/obj/item/beartrap,										30), // CHOMPEdit - Removal of obj/item/weapon
		new /datum/data/mining_equipment("Digital Tablet - Standard",	/obj/item/modular_computer/tablet/preset/custom_loadout/standard,	100),
		new /datum/data/mining_equipment("Digital Tablet - Advanced",	/obj/item/modular_computer/tablet/preset/custom_loadout/advanced,	300),
		new /datum/data/mining_equipment("Injector (L) - Glucose",/obj/item/reagent_containers/hypospray/autoinjector/biginjector/glucose,	30), // CHOMPEdit - Removal of obj/item/weapon
		new /datum/data/mining_equipment("Injector (L) - Panacea",/obj/item/reagent_containers/hypospray/autoinjector/biginjector/purity,	30), // CHOMPEdit - Removal of obj/item/weapon
		new /datum/data/mining_equipment("Injector (L) - Trauma",/obj/item/reagent_containers/hypospray/autoinjector/biginjector/brute,	50), // CHOMPEdit - Removal of obj/item/weapon
		new /datum/data/mining_equipment("Nanopaste Tube",				/obj/item/stack/nanopaste,											50),
		new /datum/data/mining_equipment("Defense Equipment - Phase Pistol",/obj/item/gun/energy/locked/phasegun/pistol,					15), //CHOMPedit // CHOMPEdit - Removal of obj/item/weapon
		new /datum/data/mining_equipment("Defense Equipment - Smoke Bomb",/obj/item/grenade/smokebomb,								50), // CHOMPEdit - Removal of obj/item/weapon
		new /datum/data/mining_equipment("Defense Equipment - Razor Drone Deployer",/obj/item/grenade/spawnergrenade/manhacks/station,	50), // CHOMPEdit - Removal of obj/item/weapon
		new /datum/data/mining_equipment("Defense Equipment - Sentry Drone Deployer",/obj/item/grenade/spawnergrenade/ward,			100), // CHOMPEdit - Removal of obj/item/weapon
		new /datum/data/mining_equipment("Defense Equipment - Steel Machete",	/obj/item/material/knife/machete,					50), // CHOMPEdit - Removal of obj/item/weapon
		new /datum/data/mining_equipment("Survival Equipment - Insulated Poncho",	/obj/random/thermalponcho,								75)
		)

/obj/machinery/mineral/equipment_vendor/survey/Initialize(mapload)
	. = ..()
	//VOREStation Edit Start - Heavily modified list
	prize_list = list()
	prize_list["Gear"] = list(
		EQUIPMENT("Defense Equipment - Smoke Bomb",				/obj/item/grenade/smokebomb,									10), // CHOMPEdit - Removal of obj/item/weapon
		EQUIPMENT("Defense Equipment - Plasteel Machete",		/obj/item/material/knife/machete,							50), // CHOMPEdit - Removal of obj/item/weapon
		EQUIPMENT("Defense Equipment - Razor Drone Deployer",	/obj/item/grenade/spawnergrenade/manhacks/station/locked,	100), // CHOMPEdit - Removal of obj/item/weapon
		EQUIPMENT("Defense Equipment - Sentry Drone Deployer",	/obj/item/grenade/spawnergrenade/ward,						150), // CHOMPEdit - Removal of obj/item/weapon
		EQUIPMENT("Defense Equipment - Marksman Frontier Phaser", 	/obj/item/gun/energy/locked/frontier/rifle,				800), //CHOMPADD // CHOMPEdit - Removal of obj/item/weapon
		EQUIPMENT("Defense Equipment - Frontier Shotgun", 	/obj/item/gun/energy/locked/frontier/shotgun,				800), //CHOMPADD // CHOMPEdit - Removal of obj/item/weapon
		EQUIPMENT("Defense Equipment - Frontier Carbine",		/obj/item/gun/energy/locked/frontier/carbine,				800), //CHOMPEDIT // CHOMPEdit - Removal of obj/item/weapon
		EQUIPMENT("Defense Equipment - Frontier Phaser",		/obj/item/gun/energy/locked/frontier,					600), //CHOMPADD // CHOMPEdit - Removal of obj/item/weapon
		EQUIPMENT("Defense Equipment - Holdout Frontier Phaser", 	/obj/item/gun/energy/locked/frontier/holdout,				300), //CHOMPADD // CHOMPEdit - Removal of obj/item/weapon
		EQUIPMENT("Hybrid Equipment - Proto-Kinetic Dagger",	/obj/item/kinetic_crusher/machete/dagger,					75), // CHOMPEdit - Removal of obj/item/weapon
		EQUIPMENT("Hybrid Equipment - Proto-Kinetic Machete",	/obj/item/kinetic_crusher/machete,							250), // CHOMPEdit - Removal of obj/item/weapon
		EQUIPMENT("Fishing Net",								/obj/item/material/fishing_net,								50), // CHOMPEdit - Removal of obj/item/weapon
		EQUIPMENT("Titanium Fishing Rod",						/obj/item/material/fishing_rod/modern,						100), // CHOMPEdit - Removal of obj/item/weapon
		EQUIPMENT("Durasteel Fishing Rod",						/obj/item/material/fishing_rod/modern/strong,				750), // CHOMPEdit - Removal of obj/item/weapon
		EQUIPMENT("Fulton Beacon",								/obj/item/fulton_core,												300),
		EQUIPMENT("Geiger Counter",								/obj/item/geiger,											75), // CHOMPEdit - Removal of obj/item/device
		EQUIPMENT("GPS Device",									/obj/item/gps/mining,										10), // CHOMPEdit - Removal of obj/item/device
		EQUIPMENT("Jump Boots",									/obj/item/clothing/shoes/bhop,										250),
		EQUIPMENT("Mini-Translocator",							/obj/item/perfect_tele/one_beacon,							120), // CHOMPEdit - Removal of obj/item/device
		EQUIPMENT("Survey Tools - Mapping Unit",				/obj/item/mapping_unit,										150), // CHOMPEdit - Removal of obj/item/device
		EQUIPMENT("Survey Tools - Mapping Beacon",				/obj/item/holomap_beacon,									25), // CHOMPEdit - Removal of obj/item/device
		EQUIPMENT("Survey Tools - Advanced Cataloguer",			/obj/item/cataloguer/advanced,								300), //CHOMPADD // CHOMPEdit - Removal of obj/item/device
		EQUIPMENT("Survival Equipment - Insulated Poncho",		/obj/random/thermalponcho,											75),
		EQUIPMENT("Survival Equipment - Glowstick", 			/obj/item/flashlight/glowstick,								5), // CHOMPEdit - Removal of obj/item/device
		EQUIPMENT("Survival Equipment - Flare", 				/obj/item/flashlight/flare,									5), // CHOMPEdit - Removal of obj/item/device
		EQUIPMENT("Survival Equipment - Radioisotope Glowstick",		/obj/item/flashlight/glowstick/radioisotope,			40), // CHOMPEdit - Removal of obj/item/device
		EQUIPMENT("Survival Equipment - Modular Explorer Suit",		/obj/item/clothing/suit/armor/pcarrier/explorer,				200),
		EQUIPMENT("Survival Equipment - Armored Jumpsuit",		/obj/item/clothing/under/explorer/armored,							200),
		EQUIPMENT("Survival Equipment - Exploration Plate",		/obj/item/clothing/accessory/armor/armorplate/explorer,			50), //CHOMPADD
		EQUIPMENT("Survival Equipment - Exploration Arm Guards",		/obj/item/clothing/accessory/armor/armguards/explorer,		50), //CHOMPADD
		EQUIPMENT("Survival Equipment - Exploration Leg Guards",		/obj/item/clothing/accessory/armor/legguards/explorer,		50), //CHOMPADD
		EQUIPMENT("Survival Equipment - Exploration Riot shield",	/obj/item/shield/riot/explorer,					75), //CHOMPADD // CHOMPEdit - Removal of obj/item/weapon
		EQUIPMENT("Survival Equipment - Storage Pouch",		/obj/item/clothing/accessory/storage/pouches/green,				10), //CHOMPADD
		EQUIPMENT("Survival Equipment - Large Storage Pouch",		/obj/item/clothing/accessory/storage/pouches/large/green,		25), //CHOMPADD
		EQUIPMENT("Survival Equipment - Pathfinder Belt",		/obj/item/storage/belt/explorer/pathfinder,					200), //CHOMPADD // CHOMPEdit - Removal of obj/item/weapon
	)
	prize_list["Consumables"] = list(
		EQUIPMENT("1 Marker Beacon",		/obj/item/stack/marker_beacon,													1),
		EQUIPMENT("10 Marker Beacons",		/obj/item/stack/marker_beacon/ten,												10),
		EQUIPMENT("30 Marker Beacons",		/obj/item/stack/marker_beacon/thirty,											30),
		EQUIPMENT("Fulton Pack",			/obj/item/extraction_pack,														125),
		EQUIPMENT("Injector (L) - Glucose",	/obj/item/reagent_containers/hypospray/autoinjector/biginjector/glucose,	50), // CHOMPEdit - Removal of obj/item/weapon
		EQUIPMENT("Injector (L) - Panacea",	/obj/item/reagent_containers/hypospray/autoinjector/biginjector/purity,	50), // CHOMPEdit - Removal of obj/item/weapon
		EQUIPMENT("Injector (L) - Trauma",	/obj/item/reagent_containers/hypospray/autoinjector/biginjector/brute,	50), // CHOMPEdit - Removal of obj/item/weapon
		EQUIPMENT("Nanopaste Tube",			/obj/item/stack/nanopaste,														100),
		EQUIPMENT("Point Transfer Card",	/obj/item/card/mining_point_card/survey,									50), // CHOMPEdit - Removal of obj/item/weapon
		EQUIPMENT("Shelter Capsule",		/obj/item/survivalcapsule,												50), // CHOMPEdit - Removal of obj/item/device
		EQUIPMENT("Burn Medipen",			/obj/item/reagent_containers/hypospray/autoinjector/burn,				25), // CHOMPEdit - Removal of obj/item/weapon
		EQUIPMENT("Detox Medipen",			/obj/item/reagent_containers/hypospray/autoinjector/detox,				25), // CHOMPEdit - Removal of obj/item/weapon
		EQUIPMENT("Oxy Medipen",			/obj/item/reagent_containers/hypospray/autoinjector/oxy,					25), // CHOMPEdit - Removal of obj/item/weapon
		EQUIPMENT("Trauma Medipen",			/obj/item/reagent_containers/hypospray/autoinjector/trauma,				25), // CHOMPEdit - Removal of obj/item/weapon
	)
	prize_list["Digging Tools"] = list(
		EQUIPMENT("Survey Tools - Shovel",			/obj/item/shovel,	40), // CHOMPEdit - Removal of obj/item/weapon
		EQUIPMENT("Survey Tools - Mechanical Trap",	/obj/item/beartrap,	50), // CHOMPEdit - Removal of obj/item/weapon
		EQUIPMENT("Survey Tools - Binoculars",		/obj/item/binoculars,40), // CHOMPEdit - Removal of obj/item/device
	)
	prize_list["Miscellaneous"] = list(
		EQUIPMENT("Absinthe",					/obj/item/reagent_containers/food/drinks/bottle/absinthe,	10), // CHOMPEdit - Removal of obj/item/weapon
		EQUIPMENT("Whiskey",					/obj/item/reagent_containers/food/drinks/bottle/whiskey,		10), // CHOMPEdit - Removal of obj/item/weapon
		EQUIPMENT("Cigar",						/obj/item/clothing/mask/smokable/cigarette/cigar/havana,			15),
		EQUIPMENT("Digital Tablet - Standard",	/obj/item/modular_computer/tablet/preset/custom_loadout/standard,	50),
		EQUIPMENT("Digital Tablet - Advanced",	/obj/item/modular_computer/tablet/preset/custom_loadout/advanced,	100),
		EQUIPMENT("Industrial Equipment - Phoron Bore",	/obj/item/gun/magnetic/matfed/phoronbore/loaded,		300), // CHOMPEdit - Removal of obj/item/weapon
		EQUIPMENT("Industrial Equipment - Inducer",			/obj/item/inducer,								750), // CHOMPEdit - Removal of obj/item/weapon
		EQUIPMENT("Laser Pointer",				/obj/item/laser_pointer,										90), // CHOMPEdit - Removal of obj/item/device
		EQUIPMENT("Luxury Shelter Capsule",		/obj/item/survivalcapsule/luxury,							310), // CHOMPEdit - Removal of obj/item/device
		EQUIPMENT("Bar Shelter Capsule",		/obj/item/survivalcapsule/luxurybar,							1000), // CHOMPEdit - Removal of obj/item/device
		EQUIPMENT("Plush Toy",					/obj/random/plushie,												30),
		EQUIPMENT("Soap",						/obj/item/soap/nanotrasen,									20), // CHOMPEdit - Removal of obj/item/weapon
		EQUIPMENT("Thalers - 100",				/obj/item/spacecash/c100,									100), // CHOMPEdit - Removal of obj/item/weapon
		EQUIPMENT("Umbrella",					/obj/item/melee/umbrella/random,								20), // CHOMPEdit - Removal of obj/item/weapon
		EQUIPMENT("UAV - Recon Skimmer",		/obj/item/uav,												40), // CHOMPEdit - Removal of obj/item/device
	//CHOMPedit Start
	    EQUIPMENT("Mining-Grade PSG",			/obj/item/personal_shield_generator/belt/mining/loaded,		100), // CHOMPEdit - Removal of obj/item/device
	    EQUIPMENT("Security-Grade PSG",			/obj/item/personal_shield_generator/belt/security/loaded,	200), // CHOMPEdit - Removal of obj/item/device
	    EQUIPMENT("PSG Variant-P",			    /obj/item/personal_shield_generator/belt/parry,	            250), // CHOMPEdit - Removal of obj/item/device
	//CHOMPedit End
	)
	//VOREStation Edit End

/obj/machinery/mineral/equipment_vendor/survey/get_points(obj/item/card/id/target) // CHOMPEdit - Removal of obj/item/weapon
	if(!istype(target))
		return 0
	return target.survey_points

/obj/machinery/mineral/equipment_vendor/survey/remove_points(obj/item/card/id/target, amt) // CHOMPEdit - Removal of obj/item/weapon
	target.survey_points -= amt