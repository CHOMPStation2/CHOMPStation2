/datum/supply_pack/vending_refills
	group = "Vendor Refills"
	containertype = /obj/structure/closet/crate/plastic
	containername = "vendor refill cartridge crate"

/datum/supply_pack/randomised/vending_refills
	group = "Vendor Refills"
	containertype = /obj/structure/closet/crate/plastic
	containername = "vendor refill cartridge crate"

/datum/supply_pack/vending_refills/snack
	contains = list(/obj/item/refill_cartridge/autoname/food/snack) // CHOMPEdit - Removal of obj/item/weapon
	name = "Getmore Chocolate Corp Vendor Refill Cartridge"
	cost = 10

/datum/supply_pack/vending_refills/fitness
	contains = list(/obj/item/refill_cartridge/autoname/food/fitness) // CHOMPEdit - Removal of obj/item/weapon
	name = "SweatMAX Vendor Refill Cartridge"
	cost = 10

/datum/supply_pack/vending_refills/weeb
	contains = list(/obj/item/refill_cartridge/autoname/food/weeb) // CHOMPEdit - Removal of obj/item/weapon
	name = "Nippon-tan Vendor Refill Cartridge"
	cost = 10

/datum/supply_pack/vending_refills/sol
	contains = list(/obj/item/refill_cartridge/autoname/food/sol) // CHOMPEdit - Removal of obj/item/weapon
	name = "Sol-Snacks Vendor Refill Cartridge"
	cost = 10

/datum/supply_pack/vending_refills/snix
	contains = list(/obj/item/refill_cartridge/autoname/food/snix) // CHOMPEdit - Removal of obj/item/weapon
	name = "Snix Vendor Refill Cartridge"
	cost = 10

/datum/supply_pack/vending_refills/snlvend
	contains = list(/obj/item/refill_cartridge/autoname/food/snlvend) // CHOMPEdit - Removal of obj/item/weapon
	name = "Shop-n-Large Snacks Vendor Refill Cartridge"
	cost = 10

/datum/supply_pack/vending_refills/sovietvend
	contains = list(/obj/item/refill_cartridge/autoname/food/sovietvend) // CHOMPEdit - Removal of obj/item/weapon
	name = "Ration Station Vendor Refill Cartridge"
	cost = 10

/datum/supply_pack/vending_refills/altevian
	contains = list(/obj/item/refill_cartridge/autoname/food/altevian) // CHOMPEdit - Removal of obj/item/weapon
	name = "Altevian Vendor Refill Cartridge"
	cost = 10

/datum/supply_pack/vending_refills/coffee
	contains = list(/obj/item/refill_cartridge/autoname/drink/coffee) // CHOMPEdit - Removal of obj/item/weapon
	name = "Hot Drinks Vendor Refill Cartridge"
	cost = 10

/datum/supply_pack/vending_refills/cola
	contains = list(/obj/item/refill_cartridge/autoname/drink/cola) // CHOMPEdit - Removal of obj/item/weapon
	name = "Robust Softdrinks Vendor Refill Cartridge"
	cost = 10

/datum/supply_pack/vending_refills/sovietsoda
	contains = list(/obj/item/refill_cartridge/autoname/drink/sovietsoda) // CHOMPEdit - Removal of obj/item/weapon
	name = "BODA Vendor Refill Cartridge"
	cost = 10

/datum/supply_pack/vending_refills/bepis
	contains = list(/obj/item/refill_cartridge/autoname/drink/bepis) // CHOMPEdit - Removal of obj/item/weapon
	name = "Bepis Softdrinks Vendor Refill Cartridge"
	cost = 10

/datum/supply_pack/vending_refills/cigarette
	contains = list(/obj/item/refill_cartridge/autoname/cigarette) // CHOMPEdit - Removal of obj/item/weapon
	name = "Cigarette Vendor Refill Cartridge"
	cost = 15

/datum/supply_pack/vending_refills/wardrobe
	contains = list(/obj/item/refill_cartridge/multitype/wardrobe) // CHOMPEdit - Removal of obj/item/weapon
	name = "Wardrobe Vendor Refill Cartridge"
	cost = 10

/datum/supply_pack/vending_refills/giftvendor
	contains = list(/obj/item/refill_cartridge/autoname/giftvendor) // CHOMPEdit - Removal of obj/item/weapon
	name = "AlliCo Baubles and Confectionaries Vendor Refill Cartridge"
	cost = 20

/datum/supply_pack/vending_refills/general_food
	contains = list(/obj/item/refill_cartridge/multitype/food = 5) // CHOMPEdit - Removal of obj/item/weapon
	name = "5-Pack Food Vendor Refill Cartridges"
	cost = 75

/datum/supply_pack/vending_refills/general_drink
	contains = list(/obj/item/refill_cartridge/multitype/drink = 5) // CHOMPEdit - Removal of obj/item/weapon
	name = "5-Pack Drink Vendor Refill Cartridges"
	cost = 75

/datum/supply_pack/vending_refills/general_clothing
	contains = list(/obj/item/refill_cartridge/multitype/clothing = 5) // CHOMPEdit - Removal of obj/item/weapon
	name = "5-Pack Clothing Vendor Refill Cartridges"
	cost = 75

/datum/supply_pack/vending_refills/general_technical
	contains = list(/obj/item/refill_cartridge/multitype/technical = 5) // CHOMPEdit - Removal of obj/item/weapon
	name = "5-Pack Technical Vendor Refill Cartridges"
	cost = 75

/datum/supply_pack/vending_refills/general_specialty
	contains = list(/obj/item/refill_cartridge/multitype/specialty = 5) // CHOMPEdit - Removal of obj/item/weapon
	name = "5-Pack Specialty Vendor Refill Cartridges"
	cost = 150

/datum/supply_pack/randomised/vending_refills/value_pack			// 5 random vendor-specific cartridges at lower average price. But why?
	num_contained = 5
	contains = list(/obj/item/refill_cartridge/autoname/food/snack, // CHOMPEdit - Removal of obj/item/weapon
					/obj/item/refill_cartridge/autoname/food/fitness, // CHOMPEdit - Removal of obj/item/weapon
					/obj/item/refill_cartridge/autoname/food/weeb, // CHOMPEdit - Removal of obj/item/weapon
					/obj/item/refill_cartridge/autoname/food/sol, // CHOMPEdit - Removal of obj/item/weapon
					/obj/item/refill_cartridge/autoname/food/snix, // CHOMPEdit - Removal of obj/item/weapon
					/obj/item/refill_cartridge/autoname/food/snlvend, // CHOMPEdit - Removal of obj/item/weapon
					/obj/item/refill_cartridge/autoname/food/sovietvend, // CHOMPEdit - Removal of obj/item/weapon
					/obj/item/refill_cartridge/autoname/drink/coffee, // CHOMPEdit - Removal of obj/item/weapon
					/obj/item/refill_cartridge/autoname/drink/cola, // CHOMPEdit - Removal of obj/item/weapon
					/obj/item/refill_cartridge/autoname/drink/sovietsoda, // CHOMPEdit - Removal of obj/item/weapon
					/obj/item/refill_cartridge/autoname/drink/bepis, // CHOMPEdit - Removal of obj/item/weapon
					/obj/item/refill_cartridge/autoname/cigarette, // CHOMPEdit - Removal of obj/item/weapon
					/obj/item/refill_cartridge/multitype/wardrobe, // CHOMPEdit - Removal of obj/item/weapon
					/obj/item/refill_cartridge/autoname/technical/assist, // CHOMPEdit - Removal of obj/item/weapon
					/obj/item/refill_cartridge/autoname/technical/tool, // CHOMPEdit - Removal of obj/item/weapon
					/obj/item/refill_cartridge/autoname/giftvendor) // CHOMPEdit - Removal of obj/item/weapon
	name = "5-pack Extra-Cheap Vendor Refill Cartridges"
	cost = 35