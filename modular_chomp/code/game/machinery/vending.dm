/* CONTAINS:
	Explo equipment vending machines
	Sec equipment vending machines
*/

/obj/machinery/vending/exploration_armor
	name = "Exploration Equipment Vendor"
	desc = "A large vending machine stocked with surplus uniforms, armor and pouches for exploration members."
	vend_delay = 1
	icon_state = "sec" // Placeholder
	req_one_access = list(ACCESS_EXPLORER,ACCESS_PILOT,ACCESS_MEDICAL_EQUIP)
	products = list(
				// Clothing
					/obj/item/clothing/under/explorer = 10,
					/obj/item/clothing/shoes/boots/winter/explorer = 10,
					/obj/item/clothing/gloves/black = 10,
					/obj/item/storage/belt/explorer = 10,
				// Armor
					/obj/item/clothing/suit/armor/pcarrier/explorer/light = 10,
					/obj/item/clothing/suit/storage/hooded/explorer = 10,
					/obj/item/clothing/head/helmet/explorer = 10,
				// Pouches
					/obj/item/storage/pouch = 10,
					/obj/item/storage/pouch/ammo = 10,
					/obj/item/storage/pouch/flares/full_flare = 10,
					/obj/item/storage/pouch/holster = 5,
				// Misc
					/obj/item/radio/headset/explorer = 10,
					/obj/item/radio/headset/alt/explorer = 10,
					/obj/item/clothing/mask/gas/explorer = 10,
					/obj/item/storage/backpack/satchel/explorer = 10,
					/obj/item/storage/backpack/dufflebag/explorer = 10,
					/obj/item/storage/backpack/explorer = 10
					)

/obj/machinery/vending/exploration_weapons
	name = "Exploration Weapon Vendor"
	desc = "A large vending machine stocked with surplus phase, laser and ballistic weaponry for exploration members."
	vend_delay = 1
	icon_state = "sec" // Placeholder
	req_one_access = list(ACCESS_EXPLORER,ACCESS_PILOT,ACCESS_MEDICAL_EQUIP)
	products = list(
				// Phase
					/obj/item/gun/energy/locked/phasegun/pistol = 10,
					/obj/item/gun/energy/locked/phasegun = 10,
					/obj/item/gun/energy/locked/phasegun/rifle = 5,
				// Ammo
					/obj/item/cell/device/weapon = 25,
				// Melee
					/obj/item/material/knife/tacknife/survival = 10,
					/obj/item/material/knife/machete = 10,
				// Holsters
					/obj/item/clothing/accessory/holster/machete = 10,
					/obj/item/clothing/accessory/holster/leg = 5,
					/obj/item/clothing/accessory/holster/hip = 5,
					/obj/item/clothing/accessory/holster/waist = 5,
					/obj/item/clothing/accessory/holster/armpit = 5
					)

/obj/machinery/vending/exploration_misc
	name = "Exploration Misc Vendor"
	desc = "A large vending machine stocked with an assortment of miscellaneous equipment handy for explorers."
	vend_delay = 1
	icon_state = "sec" // Placeholder
	req_one_access = list(ACCESS_EXPLORER,ACCESS_PILOT,ACCESS_MEDICAL_EQUIP)
	products = list(
				/obj/item/cataloguer = 10,
				/obj/item/cell/device = 10,
				/obj/item/geiger = 10,
				/obj/item/gps/explorer = 10,
				/obj/item/flashlight = 10,
				/obj/item/storage/backpack/parachute = 5,
				/obj/item/storage/box/flare = 5,
				/obj/item/storage/box/cdeathalarm_kit = 1,
				/obj/item/storage/box/backup_kit = 1
				)

/obj/machinery/vending/exploration_pilot
	name = "Pilot Equipment Vendor"
	desc = "A large vending machine stocked with surplus uniforms and equipment for pilots."
	vend_delay = 1
	icon_state = "sec" // Placeholder
	req_access = list(ACCESS_PILOT)
	products = list(
				// Clothing
					/obj/item/clothing/under/rank/pilot1 = 5,
					/obj/item/clothing/suit/storage/toggle/bomber/pilot = 5,
					/obj/item/clothing/head/pilot = 5,
					/obj/item/clothing/gloves/fingerless = 5,
					/obj/item/clothing/shoes/boots/winter/explorer = 5,
				// Pouches
					/obj/item/storage/pouch/eng_tool = 5,
					/obj/item/storage/pouch/eng_supply = 5,
					/obj/item/storage/pouch/eng_parts = 5
				)

/obj/machinery/vending/exploration_fieldmedic
	name = "Field Medic Equipment Vendor"
	desc = "A large vending machine stocked with surplus uniforms and equipment for field medics."
	vend_delay = 1
	icon_state = "sec" // Placeholder
	req_access = list(ACCESS_MEDICAL_EQUIP)
	products = list(
				// Clothing
					/obj/item/clothing/under/explorer = 5,
					/obj/item/clothing/shoes/boots/winter/explorer = 5,
					/obj/item/clothing/gloves/black = 5,
					/obj/item/storage/belt/medical/emt = 5,
					/obj/item/radio/headset/sar = 5,
				// Pouches
					/obj/item/storage/pouch/medical = 5,
				// Medical Equipment
					/obj/item/storage/pill_bottle/bicaridine = 3,
					/obj/item/storage/pill_bottle/kelotane = 3,
					/obj/item/storage/pill_bottle/tramadol = 3,
					/obj/item/storage/pill_bottle/dylovene = 3,
					/obj/item/healthanalyzer = 5,
					/obj/item/bodybag/cryobag = 4,
					/obj/item/roller/adv = 2,
					/obj/item/extraction_pack = 1,
					/obj/item/fulton_core = 1
				)

/obj/machinery/vending/security_armor
	name = "Security Plate Carrier Vendor"
	desc = "A large vending machine stocked with a variety of plate carriers and accessories to accompany them."
	vend_delay = 1
	icon_state = "sec"
	req_access = list(ACCESS_SECURITY)
	products = list(
				// The vests. No green, don't want to confuse exploration
					/obj/item/clothing/suit/armor/pcarrier = 5,
					/obj/item/clothing/suit/armor/pcarrier/blue = 5,
					/obj/item/clothing/suit/armor/pcarrier/tan = 5,
					/obj/item/clothing/suit/armor/pcarrier/navy = 5,
				// Accessories
					/obj/item/clothing/accessory/armor/tag/nt = 5,
					/obj/item/clothing/accessory/armor/tag/sec = 5,
					/obj/item/clothing/accessory/storage/pouches/large = 5,
					/obj/item/clothing/accessory/storage/pouches/large/blue = 5,
					/obj/item/clothing/accessory/storage/pouches/large/tan = 5,
					/obj/item/clothing/accessory/storage/pouches/large/navy = 5,
				// Armor fittings
					/obj/item/clothing/accessory/armor/armguards = 5,
					/obj/item/clothing/accessory/armor/armguards/blue = 5,
					/obj/item/clothing/accessory/armor/armguards/tan = 5,
					/obj/item/clothing/accessory/armor/armguards/navy = 5,
					/obj/item/clothing/accessory/armor/armguards/merc = 5,
					/obj/item/clothing/accessory/armor/legguards = 5,
					/obj/item/clothing/accessory/armor/legguards/blue = 5,
					/obj/item/clothing/accessory/armor/legguards/tan = 5,
					/obj/item/clothing/accessory/armor/legguards/navy = 5,
					/obj/item/clothing/accessory/armor/legguards/merc = 5,
					/obj/item/clothing/accessory/armor/armorplate/tactical = 5
				)


//Temp Starhunter Fix
/obj/machinery/vending/starhunter_farmer
	name = "Starhunter Trade Vendor: Farming"
	desc = "A large vending machine stocked with strange farming goods."
	vend_delay = 1
	icon_state = "sec" // Placeholder
	products	= list(/obj/item/slime_extract/sepia =3,
		/obj/item/slime_extract/ruby = 3,
		/obj/item/slime_extract/bluespace = 3,
		/obj/item/slime_extract/oil = 3,
		/obj/item/slime_extract/sapphire = 3,
		/obj/item/slime_extract/emerald = 3,
		/obj/item/seeds/shrinkshroom = 12,
		/obj/item/seeds/megashroom = 12,
		/obj/item/seeds/pitcherseed = 6,
		/obj/item/seeds/deathberryseed = 6,
		/obj/item/seeds/ambrosiainfernusseed = 6,
		/obj/item/seeds/thaadra = 6,
		/obj/item/seeds/icepepperseed = 6,
		/obj/item/seeds/jurlmah = 6,
		/obj/item/seeds/amauri = 6,
		/obj/item/seeds/gelthi = 6,
		/obj/item/seeds/vale = 6
		) // For each, use the following pattern:

	premium 	= list() // No specified amount = only one in stock

	prices     = list(/obj/item/slime_extract/sepia = 2250,
		/obj/item/slime_extract/ruby = 3250,
		/obj/item/slime_extract/bluespace = 3250,
		/obj/item/slime_extract/oil = 3250,
		/obj/item/slime_extract/sapphire = 3250,
		/obj/item/slime_extract/emerald = 3250,
		/obj/item/seeds/shrinkshroom = 50,
		/obj/item/seeds/megashroom = 50,
		/obj/item/seeds/pitcherseed = 125,
		/obj/item/seeds/deathberryseed = 125,
		/obj/item/seeds/ambrosiainfernusseed = 125,
		/obj/item/seeds/thaadra = 125,
		/obj/item/seeds/icepepperseed = 125,
		/obj/item/seeds/jurlmah = 125,
		/obj/item/seeds/amauri = 125,
		/obj/item/seeds/gelthi = 125,
		/obj/item/seeds/vale = 125)

/obj/machinery/vending/starhunter_miner
	name = "Starhunter Trade Vendor: Miner"
	desc = "A large vending machine stocked with strange mining goods."
	vend_delay = 1
	icon_state = "sec" // Placeholder
	products	= list(/obj/item/kinetic_crusher/glaive = 3,
		/obj/item/kinetic_crusher = 3,
		/obj/item/gun/energy/mininglaser = 3,
		/obj/item/stack/material/phoron = 50,
		/obj/item/stack/material/uranium = 50,
		/obj/item/stack/material/tritium = 50,
		/obj/item/stack/material/deuterium = 50,
		/obj/item/stack/material/bronze = 50,
		) // For each, use the following pattern:

	premium 	= list(/obj/item/circuitboard/defenseonelisk) // No specified amount = only one in stock

	prices     = list(/obj/item/kinetic_crusher/glaive = 1200,
		/obj/item/kinetic_crusher = 1200,
		/obj/item/gun/energy/mininglaser = 1800,
		/obj/item/stack/material/phoron = 12,
		/obj/item/stack/material/uranium = 12,
		/obj/item/stack/material/tritium = 12,
		/obj/item/stack/material/deuterium = 12,
		/obj/item/stack/material/bronze = 12,
		/obj/item/circuitboard/defenseonelisk = 5000
		)

/obj/machinery/vending/starhunter_neon
	name = "Startravler Trade"
	desc = "A foxfolk sits at a manmade store stall."
	vend_delay = 1
	icon = 'modular_chomp/icons/mob/starhunters.dmi'
	use_power = 0
	icon_state = "shop_keeper"
	products	= list(/obj/item/kinetic_crusher/glaive = 3,
		/obj/item/kinetic_crusher = 3,
		/obj/item/gun/energy/mininglaser = 3,
		/obj/item/stack/material/phoron = 50,
		/obj/item/stack/material/uranium = 50,
		/obj/item/stack/material/tritium = 50,
		/obj/item/stack/material/deuterium = 50,
		/obj/item/stack/material/bronze = 50,
		/obj/item/slime_extract/sepia = 5,
		/obj/item/gun/energy/sickshot = 3,
		/obj/item/gun/energy/ratminer = 1
		)

	prices     = list(/obj/item/kinetic_crusher/glaive = 1600,
		/obj/item/kinetic_crusher = 1600,
		/obj/item/gun/energy/mininglaser = 2200,
		/obj/item/stack/material/phoron = 35,
		/obj/item/stack/material/uranium = 35,
		/obj/item/stack/material/tritium = 35,
		/obj/item/stack/material/deuterium = 35,
		/obj/item/stack/material/bronze = 35,
		/obj/item/slime_extract/sepia = 3000,
		/obj/item/gun/energy/sickshot = 2400
		)

//Some stuff to let sec do things
/obj/machinery/vending/nifsoft_shop
	req_log_access = ACCESS_SECURITY
	has_logs = 1
