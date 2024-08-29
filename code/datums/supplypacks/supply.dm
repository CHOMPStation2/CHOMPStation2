/*
*	Here is where any supply packs
*	related to civilian tasks live
*/

/datum/supply_pack/supply
	group = "Supplies"

/datum/supply_pack/supply/food
	name = "Kitchen supply crate"
	contains = list(
			/obj/item/reagent_containers/food/condiment/carton/flour = 6, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/food/drinks/milk = 3, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/food/drinks/soymilk = 2, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/storage/fancy/egg_box = 2, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/food/snacks/tofu = 4, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/food/snacks/meat = 4, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/food/condiment/yeast = 3, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/food/condiment/sprinkles = 1 // CHOMPEdit - Removal of obj/item/weapon
			)
	cost = 10
	containertype = /obj/structure/closet/crate/freezer/centauri
	containername = "Food crate"

/datum/supply_pack/supply/fancyfood
	name = "Artisanal food delivery"
	contains = list(
			/obj/item/reagent_containers/food/condiment/carton/flour/rustic = 6, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/food/condiment/carton/sugar/rustic = 6 // CHOMPEdit - Removal of obj/item/weapon
			)
	cost = 25
	containertype = /obj/structure/closet/crate/freezer/centauri
	containername = "Artisanal food crate"


/datum/supply_pack/supply/toner
	name = "Toner cartridges"
	contains = list(/obj/item/toner = 6) // CHOMPEdit - Removal of obj/item/device
	cost = 10
	containertype = /obj/structure/closet/crate/ummarcar
	containername = "Toner cartridges"

/datum/supply_pack/supply/janitor
	name = "Janitorial supplies"
	contains = list(
			/obj/item/reagent_containers/glass/bucket, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/mop, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/clothing/under/rank/janitor,
			/obj/item/cartridge/janitor, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/clothing/gloves/black,
			/obj/item/clothing/head/soft/purple,
			/obj/item/storage/belt/janitor, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/clothing/shoes/galoshes,
			/obj/item/clothing/suit/caution = 4,
			/obj/item/storage/bag/trash, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/lightreplacer, // CHOMPEdit - Removal of obj/item/device
			/obj/item/reagent_containers/spray/cleaner, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/glass/rag, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/grenade/chem_grenade/cleaner = 3, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/vac_attachment, //CHOMPAdd // CHOMPEdit - Removal of obj/item/device
			/obj/item/clothing/glasses/hud/janitor,
			/obj/structure/mopbucket
			)
	cost = 10
	containertype = /obj/structure/closet/crate/galaksi
	containername = "Janitorial supplies"

/datum/supply_pack/supply/shipping
	name = "Shipping supplies"
	contains = list(
				/obj/fiftyspawner/cardboard,
				/obj/item/packageWrap = 4, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/wrapping_paper = 2, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/destTagger, // CHOMPEdit - Removal of obj/item/device
				/obj/item/hand_labeler, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/tool/wirecutters, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/tape_roll = 2) // CHOMPEdit - Removal of obj/item/weapon
	cost = 10
	containertype = /obj/structure/closet/crate/ummarcar
	containername = "Shipping supplies crate"

/datum/supply_pack/supply/bureaucracy
	contains = list(
			/obj/item/clipboard = 2, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/pen/red, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/pen/blue, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/pen/blue, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/camera_film, // CHOMPEdit - Removal of obj/item/device
			/obj/item/folder/blue, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/folder/red, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/folder/yellow, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/hand_labeler, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/tape_roll, // CHOMPEdit - Removal of obj/item/weapon
			/obj/structure/filingcabinet/chestdrawer{anchored = FALSE},
			/obj/item/paper_bin // CHOMPEdit - Removal of obj/item/weapon
			)
	name = "Office supplies"
	cost = 15
	containertype = /obj/structure/closet/crate/ummarcar
	containername = "Office supplies crate"

/datum/supply_pack/supply/sticky_notes
	name = "Stationery - sticky notes (50)"
	contains = list(/obj/item/sticky_pad/random)
	cost = 10
	containertype = /obj/structure/closet/crate/ummarcar
	containername = "\improper Sticky notes crate"

/datum/supply_pack/supply/spare_pda
	name = "Spare PDAs"
	cost = 10
	containertype = /obj/structure/closet/crate/thinktronic
	containername = "Spare PDA crate"
	contains = list(/obj/item/pda = 3) // CHOMPEdit - Removal of obj/item/device

/datum/supply_pack/supply/minergear
	name = "Shaft miner equipment"
	contains = list(
			/obj/item/storage/backpack/industrial, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/storage/backpack/satchel/eng, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/clothing/suit/storage/hooded/wintercoat/miner,
			/obj/item/radio/headset/headset_cargo, // CHOMPEdit - Removal of obj/item/device
			/obj/item/clothing/under/rank/miner,
			/obj/item/clothing/gloves/black,
			/obj/item/clothing/shoes/black,
			/obj/item/analyzer, // CHOMPEdit - Removal of obj/item/device
			/obj/item/storage/bag/ore, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/flashlight/lantern, // CHOMPEdit - Removal of obj/item/device
			/obj/item/shovel, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/pickaxe, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/mining_scanner, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/clothing/glasses/material,
			/obj/item/clothing/glasses/meson
			)
	cost = 10
	containertype = /obj/structure/closet/crate/secure/xion
	containername = "Shaft miner equipment"
	access = access_mining

/* //No longer supported on our current maps, as it requires specialized dropoff beacons and the pathfinding doesn't work well on multi-z
//plus we have the destination tagger
/datum/supply_pack/supply/mule
	name = "Mulebot Crate"
	contains = list()
	cost = 20
	containertype = /obj/structure/largecrate/animal/mulebot
	containername = "Mulebot Crate"
*/

/datum/supply_pack/supply/cargotrain
	name = "Cargo Train Tug"
	contains = list(/obj/vehicle/train/engine)
	cost = 35

/datum/supply_pack/supply/cargotrailer
	name = "Cargo Train Trolley"
	contains = list(/obj/vehicle/train/trolley)
	cost = 15

/datum/supply_pack/explorergear
	name="Explorer gear" //CHOMP explo keep
	contains = list (
					/obj/item/cataloguer, // CHOMPEdit - Removal of obj/item/device
					/obj/item/geiger, // CHOMPEdit - Removal of obj/item/device
					/obj/item/clothing/suit/storage/hooded/explorer,
					/obj/item/flashlight/glowstick, // CHOMPEdit - Removal of obj/item/device
					/obj/item/flashlight, // CHOMPEdit - Removal of obj/item/device
					/obj/item/stack/marker_beacon/thirty,
					/obj/item/storage/belt/explorer, // CHOMPEdit - Removal of obj/item/weapon
					/obj/item/clothing/mask/gas/explorer,
					/obj/item/cartridge/explorer, // CHOMPEdit - Removal of obj/item/weapon
			 		/obj/item/gps/explorer, // CHOMPEdit - Removal of obj/item/device
			 		/obj/item/clothing/under/explorer,
			 		/obj/item/radio/headset/explorer, // CHOMPEdit - Removal of obj/item/device
			 		/obj/item/clothing/shoes/boots/winter/explorer,
					/obj/item/material/knife/tacknife/survival, // CHOMPEdit - Removal of obj/item/weapon
					/obj/item/material/knife/machete, // CHOMPEdit - Removal of obj/item/weapon
			 		/obj/item/clothing/accessory/holster/machete,
					/obj/item/clothing/gloves/watch/survival
					)
	cost=25
	containertype = /obj/structure/closet/crate/secure/xion
	containername = "Explorer equipment" //CHOMP explo keep
	access = access_explorer //CHOMP explo keep

/datum/supply_pack/pilotgear
	name= "Pilot gear"
	contains = list (
					/obj/item/storage/backpack/parachute, // CHOMPEdit - Removal of obj/item/weapon
					/obj/item/radio/headset/pilot, // CHOMPEdit - Removal of obj/item/device
					/obj/item/radio/headset/pilot/alt, // CHOMPEdit - Removal of obj/item/device
					/obj/item/clothing/mask/gas/half,
					/obj/item/flashlight/glowstick, // CHOMPEdit - Removal of obj/item/device
					/obj/item/stack/marker_beacon/thirty,
					/obj/item/gps/explorer, // CHOMPEdit - Removal of obj/item/device
					/obj/item/clothing/gloves/fingerless,
					/obj/item/cataloguer/compact, //CHOMP explo keep // CHOMPEdit - Removal of obj/item/device
					/obj/item/clothing/suit/storage/toggle/bomber/pilot,
			 		/obj/item/clothing/shoes/boots/winter/explorer,
					/obj/item/flashlight, // CHOMPEdit - Removal of obj/item/device
					/obj/item/material/knife/tacknife/survival, // CHOMPEdit - Removal of obj/item/weapon
					/obj/item/clothing/head/pilot_vr,
					/obj/item/clothing/under/rank/pilot1,
					/obj/item/gun/energy/gun/protector/pilotgun/locked, // CHOMPEdit - Removal of obj/item/weapon
					/obj/item/clothing/gloves/watch/survival
					)
	cost=20
	containertype = /obj/structure/closet/crate/secure/xion
	containername = "Pilot equipment"
	access = access_pilot

/datum/supply_pack/supply/foodcubes
	name = "Emergency food cubes"
	contains = list(
				/obj/machinery/vending/emergencyfood/filled = 1)
	cost = 75
	containertype = /obj/structure/closet/crate/freezer
	containername = "food cubes"

/datum/supply_pack/pathfindergear
	name="Explorer Leader gear" //CHOMPEdit Keep Explo
	contains = list (
					/obj/item/cataloguer/compact/pathfinder, // CHOMPEdit - Removal of obj/item/device
					/obj/item/geiger, // CHOMPEdit - Removal of obj/item/device
					/obj/item/clothing/suit/storage/hooded/explorer,
					/obj/item/flashlight/glowstick, // CHOMPEdit - Removal of obj/item/device
					/obj/item/flashlight, // CHOMPEdit - Removal of obj/item/device
					/obj/item/stack/marker_beacon/thirty,
					/obj/item/storage/belt/explorer/pathfinder, // CHOMPEdit - Removal of obj/item/weapon
					/obj/item/clothing/mask/gas/explorer,
					/obj/item/cartridge/explorer, // CHOMPEdit - Removal of obj/item/weapon
			 		/obj/item/gps/explorer, // CHOMPEdit - Removal of obj/item/device
			 		/obj/item/clothing/under/explorer,
			 		/obj/item/radio/headset/pathfinder, // CHOMPEdit - Removal of obj/item/device
			 		/obj/item/clothing/shoes/boots/winter/explorer,
					/obj/item/material/knife/tacknife/survival, // CHOMPEdit - Removal of obj/item/weapon
					/obj/item/material/knife/machete/deluxe, // CHOMPEdit - Removal of obj/item/weapon
			 		/obj/item/clothing/accessory/holster/machete,
					/obj/item/storage/box/explorerkeys, // CHOMPEdit - Removal of obj/item/weapon
					/obj/item/mapping_unit, // CHOMPEdit - Removal of obj/item/device
					/obj/item/clothing/gloves/watch/survival
					)
	cost = 75
	containertype = /obj/structure/closet/crate/secure/xion
	containername = "Explorer Leader equipment" //CHOMPEdit Keep Explo
	access = list(access_explorer)
