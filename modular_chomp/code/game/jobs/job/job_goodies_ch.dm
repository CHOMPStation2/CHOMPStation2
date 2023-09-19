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
		/obj/item/weapon/storage/box/donkpockets = 10,
		/obj/item/clothing/mask/gas/explorer = 10,
		/obj/item/clothing/gloves/yellow = 7,
		/obj/item/instrument/musicalmoth = 5,
		/obj/item/toy/snake_popper = 3,
		/obj/item/weapon/tool/prybar = 1
	)

// Cargo

/datum/job/qm
	mail_goodies = list(
		/obj/item/weapon/pen/fountain = 15,
		/obj/item/weapon/pen/fountain3 = 10,
		/obj/item/weapon/pen/fountain7 = 3,
		/obj/item/weapon/pen/fountain6 = 5
	)

/datum/job/cargo_tech
	mail_goodies = list(
		/obj/item/pizzavoucher = 10,
		/obj/item/stack/material/gold = 5,
		/obj/item/stack/material/uranium = 4,
		/obj/item/stack/material/diamond = 4,
	)

/datum/job/mining
	mail_goodies = list(
		/obj/item/stack/material/gold = 5,
		/obj/item/stack/material/uranium = 4,
		/obj/item/stack/material/diamond = 3,
		/obj/item/weapon/gun/projectile/shotgun/pump/rifle = 1,
	)

// Civilian

/datum/job/bartender
	mail_goodies = list(
		/obj/item/weapon/reagent_containers/food/drinks/metaglass/metapint = 30,
		/obj/item/weapon/reagent_containers/food/snacks/clownstears = 10,
		/obj/item/stack/material/phoron = 10,
		/obj/item/stack/material/uranium = 10,
	)

/datum/job/chef
	mail_goodies = list(
		/datum/reagent/cakebatter = 20,
		/obj/item/weapon/reagent_containers/food/condiment/carton/flour = 20,
		/obj/item/weapon/reagent_containers/food/condiment/enzyme = 15,
		/obj/item/weapon/reagent_containers/food/drinks/soymilk = 15,
		/obj/item/weapon/kitchenknife = 4,
	)

/datum/job/hydro
	mail_goodies = list(
		/datum/reagent/mutagen = 35,
		/datum/reagent/diethylamine = 35,
		/obj/item/weapon/gun/energy/floragun = 10,
		/obj/machinery/beehive = 3,
		/obj/item/weapon/grenade/chem_grenade/antiweed = 3,
	)

/datum/job/janitor
	mail_goodies = list(
		/obj/item/weapon/grenade/chem_grenade/cleaner = 30,
		/obj/item/weapon/storage/box/lights/mixed = 20,
		/obj/item/device/lightreplacer = 5,
		/obj/item/device/lightpainter = 5,
	)

/datum/job/librarian
	mail_goodies = list(
		/obj/item/weapon/pen/fountain = 15,
		/obj/item/weapon/pen/fountain2 = 15,
		/obj/item/weapon/pen/fountain3 = 10,
		/obj/item/weapon/pen/fountain4 = 10,
		/obj/item/weapon/pen/fountain7 = 3,
		/obj/item/weapon/pen/fountain8 = 5,
	)

/datum/job/lawyer
	mail_goodies = list(
		/obj/item/weapon/pen/fountain = 15,
		/obj/item/weapon/pen/fountain2 = 15,
		/obj/item/weapon/pen/fountain3 = 10,
		/obj/item/weapon/pen/fountain4 = 10,
		/obj/item/weapon/pen/fountain7 = 3,
		/obj/item/weapon/pen/fountain8 = 5
	)

/datum/job/chaplain
	mail_goodies = list(
		/obj/item/weapon/reagent_containers/food/drinks/bottle/holywater = 30,
		/obj/item/toy/plushie/shark = 2,
		/obj/item/toy/plushie/bigcat = 1
	)

/datum/job/entertainer
		// Still need to separate the goodies for each title, mimes and clows shouldn't get the same thing.
	mail_goodies = list(
		/obj/item/weapon/reagent_containers/food/drinks/bottle/bottleofnothing = 10,
	)

/datum/job/entrepreneur // Same for these guys! Working on it.
	mail_goodies = list(
		/obj/item/weapon/reagent_containers/food/drinks/bottle/bottleofnothing = 10,
	)

// Command

/datum/job/captain
	mail_goodies = list(
		/obj/item/weapon/storage/fancy/cigar/havana = 10,
		/obj/item/weapon/reagent_containers/food/drinks/bottle/champagne = 10,
		/obj/item/weapon/pen/fountain6 = 5
	)

/datum/job/hop
	mail_goodies = list(
		/obj/item/weapon/pen/fountain = 15,
		/obj/item/weapon/pen/fountain3 = 10,
		/obj/item/weapon/pen/fountain7 = 3,
		/obj/item/weapon/pen/fountain6 = 5
	)

/datum/job/secretary
	mail_goodies = list(
		/obj/item/weapon/pen/fountain = 15,
		/obj/item/weapon/pen/fountain3 = 10,
		/obj/item/weapon/pen/fountain7 = 3,
		/obj/item/weapon/pen/fountain6 = 5
	)

// Engineering

/datum/job/chief_engineer
	mail_goodies = list(
		/obj/item/stack/material/steel = 20,
		/obj/item/stack/material/uranium = 15,
		/obj/item/stack/material/phoron = 15,
		/obj/item/stack/cable_coil = 10,
		/obj/item/weapon/weldingtool/electric = 4,
		/obj/item/weapon/tool/crowbar/power = 2,
		/obj/item/weapon/tool/wrench/power = 2,
		/obj/item/weapon/tool/screwdriver/power = 2,
	)

/datum/job/engineer
	mail_goodies = list(
		/obj/item/weapon/storage/box/lights/mixed = 20,
		/obj/item/device/lightreplacer = 10,
		/obj/item/weapon/rcd_ammo = 10,
		/obj/item/clothing/head/hardhat/red = 3,
	)

/datum/job/atmos
	mail_goodies = list(
		/obj/item/weapon/storage/box/lights/mixed = 20,
		/obj/item/device/analyzer = 10,
		/obj/item/weapon/holosign_creator/combifan = 8,
		/obj/item/clothing/head/hardhat/red = 3,
	)

// Exploration

/datum/job/pathfinder
	mail_goodies = list(
		/obj/item/device/binoculars/spyglass = 20,
		/obj/item/device/cataloguer/advanced = 10,
		/obj/item/device/flashlight/slime = 5,
	)

/datum/job/pilot
	mail_goodies = list(
		/obj/item/weapon/tank/air = 20,
		/obj/item/device/binoculars/spyglass = 15,
		/obj/random/tetheraid = 5,
	)

/datum/job/explorer
	mail_goodies = list(
		/obj/item/weapon/reagent_containers/food/snacks/liquidfood = 20,
		/obj/item/device/binoculars/spyglass = 15,
	)

/datum/job/sar
	mail_goodies = list(
		/obj/item/weapon/reagent_containers/food/snacks/liquidfood = 20,
		/obj/random/tetheraid = 5,
	)

/datum/job/cmo
	mail_goodies = list(
		/obj/item/weapon/surgical/scalpel/laser1 = 2,
		/obj/item/weapon/surgical/scalpel/manager = 2,
		/obj/item/weapon/surgical/circular_saw/manager = 2
	)

/datum/job/doctor
	mail_goodies = list(
		/obj/item/device/healthanalyzer/advanced = 15,
		/datum/reagent/drink/doctor_delight = 10,
	)

/datum/job/chemist
	mail_goodies = list(
		/obj/item/stack/material/phoron = 15,
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
		/obj/item/weapon/reagent_containers/hypospray/autoinjector/burn = 10,
		/obj/item/weapon/reagent_containers/hypospray/autoinjector/detox = 10,
		/obj/item/weapon/reagent_containers/hypospray/autoinjector/trauma = 10,
		/obj/item/weapon/reagent_containers/hypospray/autoinjector/oxy = 5,
		/obj/item/stack/nanopaste = 5,
		/obj/item/weapon/reagent_containers/hypospray/autoinjector/bonemed = 2,
	)

// Science

/datum/job/rd
	mail_goodies = list(
		/obj/item/weapon/reagent_containers/food/snacks/monkeycube = 30,
	)

/datum/job/scientist
	mail_goodies = list(
		/obj/item/weapon/storage/box/camerabug = 1,
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
		/obj/item/clothing/head/helmet = 5,
	)

/datum/job/xenobotanist
	mail_goodies = list(
		/datum/reagent/mutagen = 35,
		/datum/reagent/diethylamine = 35,
		/obj/item/weapon/gun/energy/floragun = 10,
		/obj/machinery/beehive = 3,
		/obj/item/weapon/grenade/chem_grenade/antiweed = 3,
	)

// Security

/datum/job/hos
	mail_goodies = list(
		/obj/item/weapon/reagent_containers/food/snacks/donut/homer = 10,
		/obj/item/weapon/grenade/chem_grenade/teargas = 5,
		/obj/item/weapon/grenade/flashbang = 5,
		/obj/item/weapon/storage/box/handcuffs = 5
	)

/datum/job/warden
	mail_goodies = list(
		/obj/item/clothing/mask/smokable/cigarette/cigar/havana = 10,
		/obj/item/weapon/reagent_containers/food/snacks/donut/homer = 10,
		/obj/item/weapon/grenade/chem_grenade/teargas = 5,
		/obj/item/weapon/grenade/flashbang = 5,
		/obj/item/weapon/storage/box/handcuffs = 5
	)

/datum/job/detective
	mail_goodies = list(
		/obj/item/weapon/storage/fancy/cigar/havana = 10,
		/obj/item/weapon/reagent_containers/food/drinks/bottle/rum = 10,
		/obj/item/weapon/storage/box/matches = 5,
		/obj/item/weapon/flame/lighter/supermatter/syndismzippo = 2,
	)

/datum/job/officer
	mail_goodies = list(
		/obj/item/weapon/reagent_containers/food/snacks/donut/olive = 10,
		/obj/item/weapon/reagent_containers/food/snacks/donut/homer/jelly = 10,
		/obj/item/weapon/reagent_containers/food/snacks/donut/purple = 10,
		/obj/item/weapon/reagent_containers/food/snacks/donut/plain = 10,
		/obj/item/device/hailer = 5,
	)
