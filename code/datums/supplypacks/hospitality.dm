/*
*	Here is where any supply packs related
*		to being hospitable tasks live
*/


/datum/supply_pack/hospitality
	group = "Hospitality"

/datum/supply_pack/hospitality/party
	name = "Party equipment"
	contains = list(
			/obj/item/storage/box/mixedglasses = 2, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/storage/box/glasses/square, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/food/drinks/shaker, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/food/drinks/flask/barflask, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/food/drinks/bottle/patron, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/food/drinks/bottle/goldschlager, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/food/drinks/bottle/specialwhiskey, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/food/drinks/bottle/jager, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/storage/fancy/cigarettes/dromedaryco, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/lipstick/random, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/food/drinks/bottle/small/ale = 2, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/food/drinks/bottle/small/beer = 4, // CHOMPEdit - Removal of obj/item/weapon
			)
	cost = 10
	containertype = /obj/structure/closet/crate/gilthari
	containername = "Party equipment"

/datum/supply_pack/hospitality/barsupplies
	name = "Bar supplies"
	contains = list(
			/obj/item/storage/box/glasses/cocktail, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/storage/box/glasses/rocks, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/storage/box/glasses/square, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/storage/box/glasses/pint, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/storage/box/glasses/wine, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/storage/box/glasses/shake, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/storage/box/glasses/shot, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/storage/box/glasses/mug, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/storage/box/glasses/meta, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/storage/box/glasses/meta/metapint, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/food/drinks/shaker, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/storage/box/glass_extras/straws, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/storage/box/glass_extras/sticks // CHOMPEdit - Removal of obj/item/weapon
			)
	cost = 10
	containertype = /obj/structure/closet/crate/gilthari
	containername = "crate of bar supplies"

/datum/supply_pack/hospitality/cookingoil
	name = "Cooking oil tank crate"
	contains = list(/obj/structure/reagent_dispensers/cookingoil)
	cost = 10
	containertype = /obj/structure/largecrate
	containername = "cooking oil tank crate"

/datum/supply_pack/hospitality/pizza
	name = "Surprise pack of five pizzas"
	contains = list(
			/obj/random/pizzabox/supplypack = 5,
			/obj/item/material/knife/plastic, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/clothing/under/pizzaguy,
			/obj/item/clothing/head/pizzaguy
			)
	cost = 15
	containertype = /obj/structure/closet/crate/freezer/centauri
	containername = "Pizza crate"

/datum/supply_pack/hospitality/gifts
	name = "Gift crate"
	contains = list(
		/obj/item/toy/bouquet = 3,
		/obj/item/storage/fancy/heartbox = 2, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/paper/card/smile, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/paper/card/heart, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/paper/card/cat, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/paper/card/flower // CHOMPEdit - Removal of obj/item/weapon
		)
	cost = 10
	containertype = /obj/structure/closet/crate/allico
	containername = "crate of gifts"

/datum/supply_pack/hospitality/painting
	name = "Painting equipment"
	contains = list(
		/obj/item/paint_brush = 2,
		/obj/item/paint_palette = 2,
		/obj/item/reagent_containers/glass/rag = 2, // CHOMPEdit - Removal of obj/item/weapon
		/obj/structure/easel = 1, // How does that even fit
		/obj/item/canvas = 1,
		/obj/item/canvas/nineteen_nineteen = 1,
		/obj/item/canvas/twentyfour_twentyfour = 1,
		/obj/item/canvas/twentythree_nineteen = 1,
		/obj/item/canvas/twentythree_twentythree = 1
	)
	cost = 20
	containertype = /obj/structure/closet/crate/centauri
	containername = "Painting equipment"

/datum/supply_pack/hospitality/holywater
	name = "Holy water crate"
	contains = list(
		/obj/item/reagent_containers/food/drinks/bottle/holywater = 3 // CHOMPEdit - Removal of obj/item/weapon
		)
	cost = 15
	containertype = /obj/structure/closet/crate/gilthari
	containername = "holy water crate"

/datum/supply_pack/randomised/hospitality/
	group = "Hospitality"

/datum/supply_pack/randomised/hospitality/burgers_vr
	num_contained = 5
	contains = list(
			/obj/item/reagent_containers/food/snacks/bigbiteburger, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/food/snacks/cheeseburger, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/food/snacks/jellyburger, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/food/snacks/tofuburger, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/food/snacks/fries // CHOMPEdit - Removal of obj/item/weapon
			)
	name = "Burger crate"
	cost = 25
	containertype = /obj/structure/closet/crate/freezer
	containername = "Burger crate"
/*
/datum/supply_pack/randomised/hospitality/bakery_vr
	num_contained = 5
	contains = list(
			/obj/item/reagent_containers/food/snacks/baguette, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/food/snacks/appletart, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/food/snacks/berrymuffin, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/food/snacks/bunbun, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/food/snacks/cherrypie, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/food/snacks/cookie, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/food/snacks/croissant, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/food/snacks/donut/normal, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/food/snacks/donut/jelly, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/food/snacks/donut/cherryjelly, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/food/snacks/muffin, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/food/snacks/pie, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/food/snacks/plump_pie, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/food/snacks/plumphelmetbiscuit, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/food/snacks/poppypretzel, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/food/snacks/sugarcookie, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/food/snacks/waffles // CHOMPEdit - Removal of obj/item/weapon
			)
	name = "Bakery products crate"
	cost = 25
	containertype = /obj/structure/closet/crate/freezer
	containername = "Bakery products crate"

/datum/supply_pack/randomised/hospitality/cakes_vr
	num_contained = 2
	contains = list(
			/obj/item/reagent_containers/food/snacks/sliceable/applecake, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/food/snacks/sliceable/birthdaycake, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/food/snacks/sliceable/carrotcake, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/food/snacks/sliceable/cheesecake, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/food/snacks/sliceable/chocolatecake, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/food/snacks/sliceable/lemoncake, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/food/snacks/sliceable/limecake, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/food/snacks/sliceable/orangecake, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/food/snacks/sliceable/plaincake // CHOMPEdit - Removal of obj/item/weapon
			)
	name = "Cake crate"
	cost = 100
	containertype = /obj/structure/closet/crate/freezer
	containername = "Cake crate"

/datum/supply_pack/randomised/hospitality/mexican_vr
	num_contained = 5
	contains = list(
			/obj/item/reagent_containers/food/snacks/cheeseburrito, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/food/snacks/enchiladas, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/food/snacks/meatburrito, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/food/snacks/taco // CHOMPEdit - Removal of obj/item/weapon
			)
	name = "Mexican takeout crate"
	cost = 50
	containertype = /obj/structure/closet/crate/freezer
	containername = "Mexican takeout crate"
*/
/datum/supply_pack/randomised/hospitality/asian_vr
	num_contained = 5
	contains = list(
			/obj/item/reagent_containers/food/snacks/generalschicken, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/food/snacks/hotandsoursoup // CHOMPEdit - Removal of obj/item/weapon
			)
	name = "Chinese takeout crate"
	cost = 50
	containertype = /obj/structure/closet/crate/freezer
	containername = "Chinese takeout crate"

/datum/supply_pack/randomised/hospitality/jaffacake
	contains = list(
		/obj/item/storage/box/jaffacake, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/box/jaffacake, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/box/jaffacake, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/box/jaffacake, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/box/jaffacake, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/box/jaffacake, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/box/jaffacake, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/box/jaffacake, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/box/jaffacake, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/box/jaffacake // CHOMPEdit - Removal of obj/item/weapon
		)
	name = "Desatti jaffa cake crate"
	cost = 25
	containertype = /obj/structure/closet/crate/freezer
	containername = "Desatti jaffa cake crate"

/datum/supply_pack/randomised/hospitality/sweets
	num_contained = 5
	contains = list(
			/obj/item/storage/box/jaffacake, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/storage/box/winegum, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/storage/box/saucer, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/storage/box/shrimpsandbananas, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/storage/box/rhubarbcustard // CHOMPEdit - Removal of obj/item/weapon
			)
	name = "Sweets crate"
	cost = 25
	containertype = /obj/structure/closet/crate/freezer
	containername = "Sweets crate"
