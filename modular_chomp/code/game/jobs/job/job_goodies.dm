// Mail goodies
/datum/job/
	var/list/mail_goodies = list()		  // Goodies that can be received via the mail system
	var/exclusive_mail_goodies = FALSE	  // If this job's mail goodies compete with generic goodies.

// Get mail goodies
/datum/job/proc/get_mail_goodies(mob/recipient)
	return mail_goodies

// Assistant

/datum/job/intern
	mail_goodies = list(
		/obj/random/donkpocketbox = 10,
		/obj/random/toy = 10,
		/obj/random/tech_supply = 5,
		/obj/random/action_figure = 2
	)

// Cargo

/datum/job/qm
	mail_goodies = list(
		/obj/random/material = 10,
		/obj/item/weapon/pen/fountain8 = 5,
		/obj/random/coin = 5,
		/obj/item/toy/plushie/borgplushie/drake/mine = 2
	)

/datum/job/cargo_tech
	mail_goodies = list(
		/obj/item/poster = 15,
		/obj/random/pizzabox = 10,
		/obj/random/material = 10,
		/obj/random/coin = 2,
	)

/datum/job/mining
	mail_goodies = list(
		/obj/item/stack/marker_beacon/ten = 15,
		/obj/item/weapon/pickaxe/diamond = 15,
		/obj/item/weapon/storage/bag/ore/holding = 10,
		/obj/item/device/perfect_tele/one_beacon = 10,
		/obj/item/clothing/shoes/bhop = 10,
		/obj/item/weapon/inducer/ = 10,
		/obj/item/weapon/plastique/seismic/locked = 10,
		/obj/item/weapon/pickaxe/advdrill = 5
	)

// Civilian

/datum/job/bartender
	mail_goodies = list(
		/obj/item/weapon/reagent_containers/food/drinks/metaglass/metapint = 30,
		/obj/item/clothing/accessory/bowtie/black = 15,
		/obj/item/stack/material/uranium = 5
	)

/datum/job/chef
	mail_goodies = list(
		"cakebatter" = 20,
		/obj/item/weapon/reagent_containers/food/condiment/soysauce = 20,
		/obj/item/weapon/reagent_containers/food/drinks/soymilk = 15,
		/obj/item/weapon/reagent_containers/food/snacks/cuttlefish = 10,
		/obj/item/weapon/reagent_containers/glass/beaker/large = 10,
		/obj/random/meat = 5,
		/obj/item/weapon/kitchenknife = 4
	)

/datum/job/hydro
	mail_goodies = list(
		"mutagen" = 35,
		"diethylamine" = 35,
		/obj/item/weapon/reagent_containers/spray/plantbgone = 15,
		/obj/item/weapon/gun/energy/floragun = 5,
		/obj/item/weapon/grenade/chem_grenade/antiweed = 3
	)

/datum/job/janitor
	mail_goodies = list(
		/obj/item/weapon/grenade/chem_grenade/cleaner = 30,
		/obj/item/weapon/storage/box/lights/mixed = 20,
		/obj/item/weapon/reagent_containers/spray/cleaner = 10,
		/obj/random/soap_common = 10,
		/obj/item/device/lightreplacer = 5,
		/obj/item/device/lightpainter = 5,
		/obj/item/toy/plushie/borgplushie/drake/jani = 2
	)

/datum/job/librarian
	mail_goodies = list(
		/obj/item/weapon/book/manual/wizzoffguide = 10,
		/obj/item/weapon/book/bundle/custom_library/fiction/ghostship = 10,
		/obj/item/weapon/book/bundle/custom_library/reference/ThermodynamicReactionsandResearch = 10,
		/obj/item/weapon/book/bundle/custom_library/nonfiction/riseandfallofpersianempire = 10,
		/obj/item/weapon/book/bundle/custom_library/nonfiction/skrelliancastesystem = 10,
		/obj/item/weapon/book/codex/lore/robutt = 10,
		/obj/item/weapon/book/codex/lore/news = 5,
		/obj/item/weapon/pen/fountain3 = 5,
		/obj/item/weapon/reagent_containers/food/snacks/egg = 1
	)

/datum/job/lawyer
	mail_goodies = list(
		/obj/item/weapon/pen/fountain8 = 5,
	)

/datum/job/chaplain
	mail_goodies = list(
		/obj/item/weapon/storage/fancy/candle_box = 10,
		/obj/item/weapon/storage/fancy/whitecandle_box = 10,
		/obj/item/weapon/storage/fancy/blackcandle_box = 10
	)

/datum/job/entertainer
		// Still need to separate the goodies for each title, mimes and clows shouldn't get the same thing.
	mail_goodies = list(
		/obj/fruitspawner/banana = 10,	// Perfect for clowns.
		/obj/item/weapon/reagent_containers/food/snacks/baguette = 10,	// Of course, MIMES. They're FRENCH.
		/obj/item/weapon/reagent_containers/food/drinks/bottle/wine = 10,
		/obj/item/weapon/reagent_containers/food/drinks/bottle/bottleofnothing = 10,
		/obj/random/instrument = 10,
		/obj/item/weapon/storage/pill_bottle/dice_nerd = 5,
	)

/datum/job/entrepreneur // Same for these guys! Working on it.
	mail_goodies = list(
		/obj/item/weapon/reagent_containers/food/drinks/coffee = 20, // For now, they'll get extra on coffee.
	)

// Command

/datum/job/captain
	mail_goodies = list(
		/obj/item/weapon/storage/fancy/cigar/havana = 10,
		/obj/random/drinkbottle = 10,
		/obj/item/weapon/pen/fountain6 = 5,
	)

/datum/job/hop
	mail_goodies = list(
		/obj/item/weapon/pen/fountain6 = 5,
		/obj/item/toy/figure/corgi = 2,
	)

/datum/job/secretary
	mail_goodies = list(
		/obj/item/weapon/pen/fountain6 = 5,
		/obj/item/toy/figure/cmo = 2,
		/obj/item/toy/figure/ce = 2,
		/obj/item/toy/figure/hop = 2,
		/obj/item/toy/figure/hos = 2,
		/obj/item/toy/figure/rd = 2
	)

// Engineering

/datum/job/chief_engineer
	mail_goodies = list(
		/obj/item/stack/material/steel{amount = 10} = 20,
		/obj/item/weapon/rcd_ammo = 15,
		/obj/item/stack/cable_coil = 10,
		/obj/item/stack/material/phoron{amount = 5} = 10,
		/obj/item/weapon/pen/fountain6 = 5,
		/obj/random/material = 5,
		/obj/item/toy/plushie/borgplushie/drake/eng = 2,
	)

/datum/job/engineer
	mail_goodies = list(
		/obj/item/weapon/storage/box/lights/mixed = 20,
		/obj/item/stack/cable_coil = 15,
		/obj/item/device/lightreplacer = 10,
		/obj/item/weapon/rcd_ammo = 10,
		/obj/random/material = 5,
		/obj/item/clothing/head/hardhat/red = 3,
		/obj/random/tool/power = 1,
	)

/datum/job/atmos
	mail_goodies = list(
		/obj/item/device/analyzer = 10,
		/obj/item/weapon/holosign_creator/combifan = 8,
		/obj/item/weapon/pipe_dispenser = 5,
		/obj/item/clothing/head/hardhat/red = 3
	)

// Exploration

/datum/job/pathfinder
	mail_goodies = list(
		/obj/item/device/binoculars/spyglass = 20,
		/obj/random/mre = 15,
		/obj/item/device/cataloguer/advanced = 10,
		/obj/item/device/flashlight/slime = 5,
	)

/datum/job/pilot
	mail_goodies = list(
		/obj/random/tank = 20,
		/obj/random/mre = 10,
		/obj/random/tetheraid = 5,
	)

/datum/job/explorer
	mail_goodies = list(
		/obj/random/mre = 20,
		/obj/item/device/binoculars/spyglass = 15,
	)

/datum/job/sar
	mail_goodies = list(
		/obj/random/mre = 20,
		/obj/random/tetheraid = 5,
	)

/datum/job/cmo
	mail_goodies = list(
		/obj/random/medical = 25,
		/obj/item/weapon/surgical/scalpel/laser1 = 2,
		/obj/item/weapon/surgical/scalpel/manager = 2,
		/obj/item/weapon/surgical/circular_saw/manager = 2,
		/obj/item/weapon/pen/fountain6 = 5,
		/obj/item/weapon/reagent_containers/pill/myelamine = 2,
		/obj/item/toy/plushie/borgplushie/medihound = 2,
	)

/datum/job/doctor
	mail_goodies = list(
		/obj/random/medical = 25,
		/obj/item/device/healthanalyzer/advanced = 15,
		/obj/item/weapon/reagent_containers/spray/sterilizine = 10,
		/obj/item/weapon/reagent_containers/blood/OMinus = 5,
		/obj/item/weapon/reagent_containers/pill/myelamine = 1
	)

/datum/job/chemist
	mail_goodies = list(
		/obj/item/stack/material/phoron = 10,
		/obj/item/weapon/reagent_containers/glass/beaker/large = 10,
		/obj/item/weapon/reagent_containers/pill/nutriment = 10,
		/obj/item/weapon/reagent_containers/pill/hyronalin = 10,
		/obj/item/weapon/reagent_containers/pill/carthatoline = 5,
		/obj/item/weapon/reagent_containers/pill/healing_nanites = 1
	)

/datum/job/psychiatrist
	mail_goodies = list(
		/obj/item/toy/plushie/orange_cat = 10,
		/obj/item/toy/plushie/borgplushie/drake/jani = 10,
		/obj/item/toy/plushie/carp = 10,
		/obj/item/toy/plushie/blue_fox = 10,
		/obj/item/toy/plushie/shark = 5,
		/obj/item/weapon/storage/pill_bottle/happy = 3,
	)

/datum/job/paramedic
	mail_goodies = list(
		/obj/random/medical = 35,
		/obj/item/weapon/reagent_containers/pill/myelamine = 1
	)

// Science

/datum/job/rd
	mail_goodies = list(
		/obj/random/powercell = 10,
		/obj/random/powercell/device = 10,
		/obj/item/weapon/pen/fountain6 = 5,
		/obj/random/material/precious = 4,
		/obj/random/material/refined = 2,
		/obj/item/toy/plushie/borgplushie/drake/sci = 2,
	)

/datum/job/scientist
	mail_goodies = list(
		/obj/item/stack/material/steel = 15,
		/obj/random/powercell = 10,
		/obj/random/powercell/device = 10,
		/obj/random/tech_supply = 5,
		/obj/random/tech_supply/component = 5,
		/obj/item/stack/nanopaste = 3,
		/obj/random/material/precious = 2,
		/obj/random/material/refined = 1,
		/obj/item/weapon/storage/box/camerabug = 1
	)

/datum/job/xenobiologist
	mail_goodies = list(
		/obj/item/weapon/reagent_containers/food/snacks/monkeycube = 30,
		/obj/item/clothing/head/helmet = 5,
		/obj/item/weapon/melee/baton/slime = 5,
	)

/datum/job/roboticist
	mail_goodies = list(
		/obj/item/trash/rkibble = 20,
		/obj/item/stack/material/steel = 15,
		/obj/item/stack/nanopaste = 5,
		/obj/item/toy/mecha/fireripley = 2,
		/obj/item/toy/mecha/gygax = 5,
		/obj/item/toy/mecha/honk = 1,
		/obj/item/toy/mecha/marauder = 5,
		/obj/item/toy/mecha/mauler = 5,
		/obj/item/toy/mecha/odysseus = 5,
		/obj/item/toy/mecha/phazon = 5,
		/obj/item/toy/mecha/ripley = 5,
		/obj/item/toy/mecha/seraph = 5,
	)

/datum/job/xenobotanist
	mail_goodies = list(
		"mutagen" = 35,
		"diethylamine" = 35,
		/obj/item/weapon/reagent_containers/spray/plantbgone = 10,
		/obj/item/weapon/gun/energy/floragun = 5,
		/obj/item/weapon/grenade/chem_grenade/antiweed = 3,
	)

// Security

/datum/job/hos
	mail_goodies = list(
		/obj/item/weapon/reagent_containers/food/snacks/donut/homer = 10,
		/obj/item/weapon/grenade/chem_grenade/teargas = 5,
		/obj/item/weapon/grenade/flashbang = 5,
		/obj/item/weapon/storage/box/handcuffs = 5,
		/obj/item/weapon/pen/fountain6 = 5,
		/obj/random/gun/random = 5,
		/obj/item/toy/plushie/borgplushie/drake/sec = 2
	)

/datum/job/warden
	mail_goodies = list(
		/obj/item/clothing/mask/smokable/cigarette/cigar/havana = 10,
		/obj/item/weapon/reagent_containers/food/snacks/donut/homer = 10,
		/obj/random/grenade/less_lethal = 5,
		/obj/item/weapon/storage/box/handcuffs = 5,
		/obj/random/gun/random = 5,
	)

/datum/job/detective
	mail_goodies = list(
		/obj/random/cigarettes = 15,
		/obj/item/weapon/storage/box/matches = 10,
		/obj/item/weapon/storage/fancy/cigar/havana = 10,
		/obj/item/weapon/reagent_containers/food/drinks/bottle/whiskey = 5,
		/obj/item/weapon/flame/lighter/supermatter/syndismzippo = 2,
	)

/datum/job/officer
	mail_goodies = list(
		/obj/item/weapon/reagent_containers/food/snacks/donut/olive = 10,
		/obj/item/weapon/reagent_containers/food/snacks/donut/homer/jelly = 10,
		/obj/item/weapon/reagent_containers/food/snacks/donut/purple = 10,
		/obj/item/weapon/reagent_containers/food/snacks/donut/plain = 10,
		/obj/random/ammo = 10,
		/obj/item/weapon/handcuffs = 5,
		/obj/item/device/hailer = 5,
		/obj/random/handgun/sec = 5
	)
