
//Original Casino Code created by Shadowfire117#1269 - Ported from CHOMPstation
//Modified by GhostActual#2055 for use with VOREstation

//
//The code for Casino Vendors
//Devs Feel free to modify this to vend what you please
//

//
//Locked Vendors (require access to use)
//
/obj/machinery/vending/deluxe_boozeomat
	name = "Deluxe Drink Distributor" //CHOMPEdit
	desc = "A top of the line and experimental drink vendor, it uses bluespace technology for storage!" //CHOMPEdit
	icon = 'icons/obj/casino.dmi'
	icon_state = "premiumbooze"
	products = list(/obj/item/glass_extra/stick = 50, // CHOMPEdit - Removal of obj/item/weapon
					/obj/item/glass_extra/straw = 50, // CHOMPEdit - Removal of obj/item/weapon
					/obj/item/reagent_containers/food/drinks/glass2/square = 25, // CHOMPEdit - Removal of obj/item/weapon
					/obj/item/reagent_containers/food/drinks/glass2/rocks = 25, // CHOMPEdit - Removal of obj/item/weapon
					/obj/item/reagent_containers/food/drinks/glass2/shake = 25, // CHOMPEdit - Removal of obj/item/weapon
					/obj/item/reagent_containers/food/drinks/glass2/cocktail = 25, // CHOMPEdit - Removal of obj/item/weapon
					/obj/item/reagent_containers/food/drinks/glass2/shot = 25, // CHOMPEdit - Removal of obj/item/weapon
					/obj/item/reagent_containers/food/drinks/glass2/pint = 25, // CHOMPEdit - Removal of obj/item/weapon
					/obj/item/reagent_containers/food/drinks/glass2/mug = 25, // CHOMPEdit - Removal of obj/item/weapon
					/obj/item/reagent_containers/food/drinks/glass2/wine = 25, // CHOMPEdit - Removal of obj/item/weapon
					/obj/item/reagent_containers/food/drinks/glass2/carafe = 2, // CHOMPEdit - Removal of obj/item/weapon
					/obj/item/reagent_containers/food/drinks/glass2/pitcher = 2, // CHOMPEdit - Removal of obj/item/weapon
					/obj/item/reagent_containers/food/drinks/metaglass = 25, // CHOMPEdit - Removal of obj/item/weapon
					/obj/item/reagent_containers/food/drinks/metaglass/metapint = 25, // CHOMPEdit - Removal of obj/item/weapon
					/obj/item/reagent_containers/food/drinks/bottle/gin = 10, // CHOMPEdit - Removal of obj/item/weapon
					/obj/item/reagent_containers/food/drinks/bottle/absinthe = 10, // CHOMPEdit - Removal of obj/item/weapon
					/obj/item/reagent_containers/food/drinks/bottle/bluecuracao = 10, // CHOMPEdit - Removal of obj/item/weapon
					/obj/item/reagent_containers/food/drinks/bottle/cognac = 10, // CHOMPEdit - Removal of obj/item/weapon
					/obj/item/reagent_containers/food/drinks/bottle/grenadine = 10, // CHOMPEdit - Removal of obj/item/weapon
					/obj/item/reagent_containers/food/drinks/bottle/kahlua = 10, // CHOMPEdit - Removal of obj/item/weapon
					/obj/item/reagent_containers/food/drinks/bottle/melonliquor = 10, // CHOMPEdit - Removal of obj/item/weapon
					/obj/item/reagent_containers/food/drinks/bottle/rum = 10, // CHOMPEdit - Removal of obj/item/weapon
					/obj/item/reagent_containers/food/drinks/bottle/sake = 10, // CHOMPEdit - Removal of obj/item/weapon
					/obj/item/reagent_containers/food/drinks/bottle/specialwhiskey = 10, // CHOMPEdit - Removal of obj/item/weapon
					/obj/item/reagent_containers/food/drinks/bottle/tequilla = 10, // CHOMPEdit - Removal of obj/item/weapon
					/obj/item/reagent_containers/food/drinks/bottle/vermouth = 10, // CHOMPEdit - Removal of obj/item/weapon
					/obj/item/reagent_containers/food/drinks/bottle/vodka = 10, // CHOMPEdit - Removal of obj/item/weapon
					/obj/item/reagent_containers/food/drinks/bottle/whiskey = 10, // CHOMPEdit - Removal of obj/item/weapon
					/obj/item/reagent_containers/food/drinks/bottle/wine = 10, // CHOMPEdit - Removal of obj/item/weapon
					/obj/item/reagent_containers/food/drinks/bottle/redeemersbrew = 10, // CHOMPEdit - Removal of obj/item/weapon
					/obj/item/reagent_containers/food/drinks/bottle/patron = 10, // CHOMPEdit - Removal of obj/item/weapon
					/obj/item/reagent_containers/food/drinks/bottle/goldschlager = 10, // CHOMPEdit - Removal of obj/item/weapon
					/obj/item/reagent_containers/food/drinks/bottle/champagne = 10, // CHOMPEdit - Removal of obj/item/weapon
					/obj/item/reagent_containers/food/drinks/bottle/bottleofnothing = 10, // CHOMPEdit - Removal of obj/item/weapon
					/obj/item/reagent_containers/food/drinks/bottle/snaps = 10, //CHOMPAdd // CHOMPEdit - Removal of obj/item/weapon
					/obj/item/reagent_containers/food/drinks/bottle/holywater = 10, // CHOMPEdit - Removal of obj/item/weapon
					/obj/item/reagent_containers/food/drinks/bottle/small/ale = 50, //CHOMPEdit // CHOMPEdit - Removal of obj/item/weapon
					/obj/item/reagent_containers/food/drinks/bottle/small/ale/hushedwhisper = 15, // CHOMPEdit - Removal of obj/item/weapon
					/obj/item/reagent_containers/food/drinks/bottle/small/beer = 50, //CHOMPEdit // CHOMPEdit - Removal of obj/item/weapon
					/obj/item/reagent_containers/food/drinks/bottle/small/beer/silverdragon = 15, // CHOMPEdit - Removal of obj/item/weapon
					/obj/item/reagent_containers/food/drinks/bottle/small/beer/meteor = 15, // CHOMPEdit - Removal of obj/item/weapon
					/obj/item/reagent_containers/food/drinks/bottle/small/litebeer = 15, // CHOMPEdit - Removal of obj/item/weapon
					/obj/item/reagent_containers/food/drinks/bottle/small/cider = 15, // CHOMPEdit - Removal of obj/item/weapon
					/obj/item/reagent_containers/food/drinks/cans/tonic = 50, // CHOMPEdit - Removal of obj/item/weapon
					/obj/item/reagent_containers/food/drinks/cans/gingerale = 50, // CHOMPEdit - Removal of obj/item/weapon
					/obj/item/reagent_containers/food/drinks/cans/sodawater = 50, // CHOMPEdit - Removal of obj/item/weapon
					/obj/item/reagent_containers/food/drinks/tea = 50, // CHOMPEdit - Removal of obj/item/weapon
					/obj/item/reagent_containers/food/drinks/bottle/cola = 15, // CHOMPEdit - Removal of obj/item/weapon
					/obj/item/reagent_containers/food/drinks/bottle/space_up = 15, // CHOMPEdit - Removal of obj/item/weapon
					/obj/item/reagent_containers/food/drinks/bottle/space_mountain_wind = 15, // CHOMPEdit - Removal of obj/item/weapon
					/obj/item/reagent_containers/food/drinks/bottle/orangejuice = 10, // CHOMPEdit - Removal of obj/item/weapon
					/obj/item/reagent_containers/food/drinks/bottle/tomatojuice = 10, // CHOMPEdit - Removal of obj/item/weapon
					/obj/item/reagent_containers/food/drinks/bottle/limejuice = 10, // CHOMPEdit - Removal of obj/item/weapon
					/obj/item/reagent_containers/food/drinks/bottle/lemonjuice = 10, // CHOMPEdit - Removal of obj/item/weapon
					/obj/item/reagent_containers/food/drinks/bottle/applejuice = 10, // CHOMPEdit - Removal of obj/item/weapon
					/obj/item/reagent_containers/food/drinks/bottle/milk = 10, // CHOMPEdit - Removal of obj/item/weapon
					/obj/item/reagent_containers/food/drinks/bottle/cream = 10, // CHOMPEdit - Removal of obj/item/weapon
					/obj/item/reagent_containers/food/drinks/ice = 10, // CHOMPEdit - Removal of obj/item/weapon
					/obj/item/reagent_containers/food/drinks/flask/barflask = 10, //CHOMPAdd // CHOMPEdit - Removal of obj/item/weapon
					/obj/item/reagent_containers/food/drinks/flask/vacuumflask = 10 //CHOMPAdd // CHOMPEdit - Removal of obj/item/weapon
					)

	contraband = list()
	vend_delay = 15
	idle_power_usage = 211 //refrigerator - believe it or not, this is actually the average power consumption of a refrigerated vending machine according to NRCan.
	req_access = list(access_bar)
	req_log_access = access_bar
	has_logs = 1

/obj/machinery/vending/deluxe_dinner
	name = "Deluxe Dining Distributor" //CHOMPEdit
	desc = "A top of the line and experimental food vendor, it uses bluespace technology for storage!" //CHOMPEdit
	icon = 'icons/obj/casino.dmi'
	icon_state = "premiumfood"
	products = list(
		//CHOMPAdd Start
		/obj/item/tray = 8, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/material/kitchen/utensil/fork = 15, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/material/knife/plastic = 15, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/material/kitchen/utensil/spoon = 15, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/material/kitchen/rollingpin = 5, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/material/knife = 5, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/material/knife/butch = 3, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/clothing/suit/chef/classic = 3,
		/obj/item/storage/bag/food = 3, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/toolbox/lunchbox = 10, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/toolbox/lunchbox/heart = 10, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/toolbox/lunchbox/cat = 10, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/toolbox/lunchbox/nt = 10, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/toolbox/lunchbox/mars = 10, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/toolbox/lunchbox/cti = 10, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/toolbox/lunchbox/nymph = 10, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/toolbox/lunchbox/syndicate = 10, // CHOMPEdit - Removal of obj/item/weapon
		//CHOMPAdd End
		/obj/item/reagent_containers/food/snacks/bigbiteburger = 30, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/meatsteak = 30, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/fries = 30, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/onionrings = 30, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/cheeseburrito= 30, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/enchiladas= 30, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/meatburrito= 30, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/taco= 30, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/cheesenachos= 30, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/cubannachos= 30, // CHOMPEdit - Removal of obj/item/weapon
		//CHOMPAdd Start
		/obj/item/reagent_containers/food/snacks/tamales = 30, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/bigos = 30, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/concha = 30, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/pandenata = 30, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/tocino = 30, // CHOMPEdit - Removal of obj/item/weapon
		//CHOMPAdd End
		/obj/item/reagent_containers/food/snacks/stew= 20, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/roastbeef = 20, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/aesirsalad = 20, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/sliceable/sushi = 20, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/kitsuneudon = 20, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/baguette = 30, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/appletart = 30, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/muffin = 30, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/berrymuffin = 30, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/cherrypie = 30, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/sugarcookie = 30, //CHOMPadd // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/croissant = 30, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/pie = 30, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/poppypretzel = 30, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/sugarcookie = 30, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/waffles = 30, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/sliceable/applecake = 10, //CHOMPEdit // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/sliceable/birthdaycake = 10, //CHOMPEdit // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/sliceable/carrotcake = 10, //CHOMPEdit // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/sliceable/cheesecake = 10, //CHOMPEdit // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/sliceable/chocolatecake = 10, //CHOMPEdit // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/sliceable/lemoncake = 10, //CHOMPEdit // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/sliceable/limecake = 10, //CHOMPEdit // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/sliceable/orangecake = 10, //CHOMPEdit // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/sliceable/plaincake = 10) //CHOMPEdit // CHOMPEdit - Removal of obj/item/weapon

	contraband = list()
	vend_delay = 15
	idle_power_usage = 211 //refrigerator - believe it or not, this is actually the average power consumption of a refrigerated vending machine according to NRCan.
	req_access = list(access_bar)
	req_log_access = access_bar
	has_logs = 1
	vending_sound = "machines/vending/vending_cans.ogg"

/obj/machinery/vending/deluxe_cigs
	name = "Premium Tobacco Distributor"
	desc = "A top of the line smokes vendor that carries some of the finest tobacco based goods in the frontier."
	icon = 'icons/obj/casino.dmi'
	icon_state = "premiumcigs"
	products = list(/obj/item/storage/fancy/cigar = 15, // CHOMPEdit - Removal of obj/item/weapon
					/obj/item/storage/fancy/cigarettes/carcinomas = 15, // CHOMPEdit - Removal of obj/item/weapon
					/obj/item/storage/fancy/cigarettes/professionals = 15, // CHOMPEdit - Removal of obj/item/weapon
					/obj/item/clothing/mask/smokable/cigarette/cigar/cohiba = 30,
					/obj/item/clothing/mask/smokable/cigarette/cigar/havana = 30,
					/obj/item/storage/box/matches = 5, // CHOMPEdit - Removal of obj/item/weapon
					/obj/item/flame/lighter/zippo = 10 // CHOMPEdit - Removal of obj/item/weapon
					)

	contraband = list()
	vend_delay = 15
	idle_power_usage = 211 //refrigerator - believe it or not, this is actually the average power consumption of a refrigerated vending machine according to NRCan.
	req_access = list(access_bar)
	req_log_access = access_bar
	has_logs = 1
	vending_sound = "machines/vending/vending_cans.ogg"

//
//Unlocked Vendors
//
/obj/machinery/vending/deluxe_boozeomat/open
	req_access = null
	req_log_access = null

/obj/machinery/vending/deluxe_dinner/open
	req_access = null
	req_log_access = null

/obj/machinery/vending/deluxe_cigs/open
	req_access = null
	req_log_access = null
