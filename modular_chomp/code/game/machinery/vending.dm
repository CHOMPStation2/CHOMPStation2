/* CONTAINS:
	Explo equipment vending machines
*/

/obj/machinery/vending/exploration_armor
	name = "Exploration Equipment Vendor"
	desc = "A large vending machine stocked with surplus uniforms, armor and pouches for exploration members."
	vend_delay = 1
	icon_state = "sec" // Placeholder
	req_one_access = list(access_explorer,access_pilot,access_medical_equip)
	products = list(
				// Clothing
					/obj/item/clothing/under/explorer = 10,
					/obj/item/clothing/shoes/boots/winter/explorer = 10,
					/obj/item/clothing/gloves/black = 10,
					/obj/item/weapon/storage/belt/explorer = 10,
				// Armor
					/obj/item/clothing/suit/armor/pcarrier/explorer/light = 10,
					/obj/item/clothing/suit/storage/hooded/explorer = 10,
					/obj/item/clothing/head/helmet/explorer = 10,
				// Pouches
					/obj/item/weapon/storage/pouch = 10,
					/obj/item/weapon/storage/pouch/ammo = 10,
					/obj/item/weapon/storage/pouch/flares/full_flare = 10,
					/obj/item/weapon/storage/pouch/holster = 5,
				// Misc
					/obj/item/device/radio/headset/explorer = 10,
					/obj/item/device/radio/headset/explorer/alt = 10,
					/obj/item/clothing/mask/gas/explorer = 10,
					/obj/item/weapon/storage/backpack/satchel/explorer = 10,
					/obj/item/weapon/storage/backpack/dufflebag/explorer = 10,
					/obj/item/weapon/storage/backpack/explorer = 10
					)

/obj/machinery/vending/exploration_weapons
	name = "Exploration Weapon Vendor"
	desc = "A large vending machine stocked with surplus phase, laser and ballistic weaponry for exploration members."
	vend_delay = 1
	icon_state = "sec" // Placeholder
	req_one_access = list(access_explorer,access_pilot,access_medical_equip)
	products = list(
				// Phase
					/obj/item/weapon/gun/energy/locked/phasegun/pistol = 10,
					/obj/item/weapon/gun/energy/locked/phasegun = 10,
					/obj/item/weapon/gun/energy/locked/phasegun/rifle = 5,
				// Laser
					/obj/item/weapon/gun/energy/laser = 5,
				// Ballistic
					/obj/item/weapon/gun/projectile/colt = 5,
				// Ammo
					/obj/item/weapon/cell/device/weapon = 25,
					/obj/item/ammo_magazine/m45 = 25,
				// Melee
					/obj/item/weapon/material/knife/tacknife/survival = 10,
					/obj/item/weapon/material/knife/machete = 10,
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
	req_one_access = list(access_explorer,access_pilot,access_medical_equip)
	products = list(
				/obj/item/device/cataloguer = 10,
				/obj/item/weapon/cell/device = 10,
				/obj/item/device/geiger = 10,
				/obj/item/device/gps/explorer = 10,
				/obj/item/device/flashlight = 10,
				/obj/item/weapon/storage/backpack/parachute = 5,
				/obj/item/weapon/storage/box/flare = 5,
				/obj/item/weapon/storage/box/cdeathalarm_kit = 1,
				/obj/item/weapon/storage/box/backup_kit = 1
				)

/obj/machinery/vending/exploration_pilot
	name = "Pilot Equipment Vendor"
	desc = "A large vending machine stocked with surplus uniforms and equipment for pilots."
	vend_delay = 1
	icon_state = "sec" // Placeholder
	req_access = list(access_pilot)
	products = list(
				// Clothing
					/obj/item/clothing/under/rank/pilot1 = 5,
					/obj/item/clothing/suit/storage/toggle/bomber/pilot = 5,
					/obj/item/clothing/head/pilot = 5,
					/obj/item/clothing/gloves/fingerless = 5,
					/obj/item/clothing/shoes/boots/winter/explorer = 5,
				// Pouches
					/obj/item/weapon/storage/pouch/eng_tool = 5,
					/obj/item/weapon/storage/pouch/eng_supply = 5,
					/obj/item/weapon/storage/pouch/eng_parts = 5
				)

/obj/machinery/vending/exploration_fieldmedic
	name = "Field Medic Equipment Vendor"
	desc = "A large vending machine stocked with surplus uniforms and equipment for field medics."
	vend_delay = 1
	icon_state = "sec" // Placeholder
	req_access = list(access_medical_equip)
	products = list(
				// Clothing
					/obj/item/clothing/under/explorer = 5,
					/obj/item/clothing/shoes/boots/winter/explorer = 5,
					/obj/item/clothing/gloves/black = 5,
					/obj/item/weapon/storage/belt/medical/emt = 5,
					/obj/item/device/radio/headset/sar = 5,
				// Pouches
					/obj/item/weapon/storage/pouch/medical = 5,
				// Medical Equipment
					/obj/item/weapon/storage/pill_bottle/bicaridine = 3,
					/obj/item/weapon/storage/pill_bottle/kelotane = 3,
					/obj/item/weapon/storage/pill_bottle/tramadol = 3,
					/obj/item/weapon/storage/pill_bottle/dylovene = 3,
					/obj/item/device/healthanalyzer = 5,
					/obj/item/bodybag/cryobag = 4,
					/obj/item/roller/adv = 2,
					/obj/item/extraction_pack = 1,
					/obj/item/fulton_core = 1
				)