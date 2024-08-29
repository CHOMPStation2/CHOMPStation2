
// see code/datums/recipe.dm


/* No telebacon. just no...
/datum/recipe/telebacon
	items = list(
		/obj/item/reagent_containers/food/snacks/meat, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/assembly/signaler // CHOMPEdit - Removal of obj/item/device
	)
	result = /obj/item/reagent_containers/food/snacks/telebacon // CHOMPEdit - Removal of obj/item/weapon

I said no!
/datum/recipe/syntitelebacon
	items = list(
		/obj/item/reagent_containers/food/snacks/meat/syntiflesh, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/assembly/signaler // CHOMPEdit - Removal of obj/item/device
	)
	result = /obj/item/reagent_containers/food/snacks/telebacon // CHOMPEdit - Removal of obj/item/weapon
*/

/datum/recipe/friedegg
	reagents = list("sodiumchloride" = 1, "blackpepper" = 1)
	items = list(
		/obj/item/reagent_containers/food/snacks/egg // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/friedegg // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/boiledegg
	reagents = list("water" = 5)
	reagent_mix = RECIPE_REAGENT_REPLACE
	items = list(
		/obj/item/reagent_containers/food/snacks/egg // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/boiledegg // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/devilledegg
	fruit = list("chili" = 1)
	reagents = list("sodiumchloride" = 2, "mayo" = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/egg, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/egg // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/devilledegg // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/donkpocket
	items = list(
		/obj/item/reagent_containers/food/snacks/dough, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/meatball // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/donkpocket //SPECIAL // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/donkpocket/proc/warm_up(var/obj/item/reagent_containers/food/snacks/donkpocket/being_cooked) // CHOMPEdit - Removal of obj/item/weapon
	being_cooked.heat()

/datum/recipe/donkpocket/make_food(var/obj/container as obj)
	. = ..(container)
	for (var/obj/item/reagent_containers/food/snacks/donkpocket/D in .) // CHOMPEdit - Removal of obj/item/weapon
		if (!D.warm)
			warm_up(D)

/datum/recipe/donkpocket/warm
	reagents = list() //This is necessary since this is a child object of the above recipe and we don't want donk pockets to need flour
	items = list(
		/obj/item/reagent_containers/food/snacks/donkpocket // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/donkpocket //SPECIAL // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/muffin
	reagents = list("milk" = 5, "sugar" = 5)
	reagent_mix = RECIPE_REAGENT_REPLACE
	items = list(
		/obj/item/reagent_containers/food/snacks/dough, // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/muffin // CHOMPEdit - Removal of obj/item/weapon
	result_quantity = 2

/datum/recipe/eggplantparm
	fruit = list("eggplant" = 1)
	items = list(
		/obj/item/reagent_containers/food/snacks/cheesewedge, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/cheesewedge // CHOMPEdit - Removal of obj/item/weapon
		)
	result = /obj/item/reagent_containers/food/snacks/eggplantparm // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/soylenviridians
	fruit = list("soybeans" = 1)
	reagents = list("flour" = 10)
	reagent_mix = RECIPE_REAGENT_REPLACE
	result = /obj/item/reagent_containers/food/snacks/soylenviridians // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/soylentgreen
	reagents = list("flour" = 10)
	reagent_mix = RECIPE_REAGENT_REPLACE
	items = list(
		/obj/item/reagent_containers/food/snacks/meat/human, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/meat/human // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/soylentgreen // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/berryclafoutis
	fruit = list("berries" = 1)
	items = list(
		/obj/item/reagent_containers/food/snacks/sliceable/flatdough // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/berryclafoutis/berry // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/poisonberryclafoutis
	fruit = list("poisonberries" = 1)
	items = list(
		/obj/item/reagent_containers/food/snacks/sliceable/flatdough // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/berryclafoutis/poison // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/wingfangchu
	reagents = list("soysauce" = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/xenomeat // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/wingfangchu // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/loadedbakedpotato
	fruit = list("potato" = 1)
	items = list(/obj/item/reagent_containers/food/snacks/cheesewedge) // CHOMPEdit - Removal of obj/item/weapon
	result = /obj/item/reagent_containers/food/snacks/loadedbakedpotato // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/microfries
	appliance = MICROWAVE
	items = list(
		/obj/item/reagent_containers/food/snacks/rawsticks // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/microfries // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/bangersandmash
	items = list(
		/obj/item/reagent_containers/food/snacks/mashedpotato, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/sausage, // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/bangersandmash // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/cheesymash
	items = list(
		/obj/item/reagent_containers/food/snacks/mashedpotato, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/cheesewedge, // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/cheesymash // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/blackpudding
	reagents = list("blood" = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/sausage, // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/blackpudding // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/popcorn
	fruit = list("corn" = 1)
	result = /obj/item/reagent_containers/food/snacks/popcorn // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/fortunecookie
	reagents = list("sugar" = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/doughslice, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/paper, // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/fortunecookie // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/syntisteak
	reagents = list("sodiumchloride" = 1, "blackpepper" = 1)
	items = list(/obj/item/reagent_containers/food/snacks/meat/syntiflesh) // CHOMPEdit - Removal of obj/item/weapon
	result = /obj/item/reagent_containers/food/snacks/meatsteak // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/spacylibertyduff
	reagents = list("water" = 5, "vodka" = 5, "psilocybin" = 5)
	result = /obj/item/reagent_containers/food/snacks/spacylibertyduff // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/amanitajelly
	reagents = list("water" = 5, "vodka" = 5, "amatoxin" = 5)
	result = /obj/item/reagent_containers/food/snacks/amanitajelly // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/amanitajelly/make_food(var/obj/container as obj)
	. = ..(container)
	for(var/obj/item/reagent_containers/food/snacks/amanitajelly/being_cooked in .) // CHOMPEdit - Removal of obj/item/weapon
		being_cooked.reagents.del_reagent("amatoxin")

/datum/recipe/meatballsoup
	fruit = list("carrot" = 1, "potato" = 1)
	reagents = list("water" = 10)
	items = list(/obj/item/reagent_containers/food/snacks/meatball) // CHOMPEdit - Removal of obj/item/weapon
	result = /obj/item/reagent_containers/food/snacks/meatballsoup // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/vegetablesoup
	fruit = list("carrot" = 1, "potato" = 1, "corn" = 1, "eggplant" = 1)
	reagents = list("water" = 10)
	result = /obj/item/reagent_containers/food/snacks/vegetablesoup // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/nettlesoup
	fruit = list("nettle" = 1, "potato" = 1)
	reagents = list("water" = 10, "egg" = 3)
	result = /obj/item/reagent_containers/food/snacks/nettlesoup // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/wishsoup
	reagents = list("water" = 20)
	result= /obj/item/reagent_containers/food/snacks/wishsoup // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/hotchili
	fruit = list("chili" = 1, "tomato" = 1)
	items = list(/obj/item/reagent_containers/food/snacks/meat) // CHOMPEdit - Removal of obj/item/weapon
	result = /obj/item/reagent_containers/food/snacks/hotchili // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/coldchili
	fruit = list("icechili" = 1, "tomato" = 1)
	items = list(/obj/item/reagent_containers/food/snacks/meat) // CHOMPEdit - Removal of obj/item/weapon
	result = /obj/item/reagent_containers/food/snacks/coldchili // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/fishandchips
	items = list(
		/obj/item/reagent_containers/food/snacks/fries, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/carpmeat, // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/fishandchips // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/sandwich
	items = list(
		/obj/item/reagent_containers/food/snacks/meatsteak, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/slice/bread, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/slice/bread, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/cheesewedge, // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/sandwich // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/peanutbutterjellysandwich
	reagents = list("cherryjelly" = 5, "peanutbutter" = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/slice/bread, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/slice/bread // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/jellysandwich/peanutbutter // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/clubsandwich
	reagents = list("mayo" = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/slice/bread, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/slice/bread, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/meat/chicken, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/bacon, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/cheesewedge // CHOMPEdit - Removal of obj/item/weapon
	)
	fruit = list("tomato" = 1, "lettuce" = 1)
	result = /obj/item/reagent_containers/food/snacks/clubsandwich // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/tomatosoup
	fruit = list("tomato" = 2)
	reagents = list("water" = 10)
	result = /obj/item/reagent_containers/food/snacks/tomatosoup // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/rofflewaffles
	reagents = list("psilocybin" = 5, "sugar" = 10)
	items = list(
		/obj/item/reagent_containers/food/snacks/dough, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/dough, // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/rofflewaffles // CHOMPEdit - Removal of obj/item/weapon
	result_quantity = 2

/datum/recipe/stew
	fruit = list("potato" = 1, "tomato" = 1, "carrot" = 1, "eggplant" = 1, "mushroom" = 1)
	reagents = list("water" = 10)
	items = list(/obj/item/reagent_containers/food/snacks/meat) // CHOMPEdit - Removal of obj/item/weapon
	result = /obj/item/reagent_containers/food/snacks/stew // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/slimetoast
	reagents = list("slimejelly" = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/slice/bread, // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/jelliedtoast/slime // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/jelliedtoast
	reagents = list("cherryjelly" = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/slice/bread, // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/jelliedtoast/cherry // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/milosoup
	reagents = list("water" = 10)
	items = list(
		/obj/item/reagent_containers/food/snacks/soydope, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/soydope, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/tofu, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/tofu, // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/milosoup // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/stewedsoymeat
	fruit = list("carrot" = 1, "tomato" = 1)
	items = list(
		/obj/item/reagent_containers/food/snacks/soydope, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/soydope // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/stewedsoymeat // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/boiledspagetti
	reagents = list("water" = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/spagetti, // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/boiledspagetti // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/boiledrice
	reagents = list("water" = 5, "rice" = 10)
	result = /obj/item/reagent_containers/food/snacks/boiledrice // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/ricepudding
	reagents = list("milk" = 5, "rice" = 10)
	result = /obj/item/reagent_containers/food/snacks/ricepudding // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/pastatomato
	fruit = list("tomato" = 2)
	reagents = list("water" = 5)
	items = list(/obj/item/reagent_containers/food/snacks/spagetti) // CHOMPEdit - Removal of obj/item/weapon
	result = /obj/item/reagent_containers/food/snacks/pastatomato // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/meatballspagetti
	reagents = list("water" = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/spagetti, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/meatball, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/meatball, // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/meatballspagetti // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/spesslaw
	reagents = list("water" = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/spagetti, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/meatball, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/meatball, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/meatball, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/meatball, // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/spesslaw // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/candiedapple
	fruit = list("apple" = 1)
	reagents = list("water" = 5, "sugar" = 5) //Makes sense seeing as how it's just syrup on the exterior
	result = /obj/item/reagent_containers/food/snacks/candiedapple // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/caramelapple
	fruit = list("apple" = 1)
	reagents = list("milk" = 5, "sugar" = 5) //Since caramel can be made with milk I thought this was appropriate
	result = /obj/item/reagent_containers/food/snacks/caramelapple // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/twobread
	reagents = list("redwine" = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/slice/bread, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/slice/bread, // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/twobread // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/slimesandwich
	reagents = list("slimejelly" = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/slice/bread, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/slice/bread, // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/jellysandwich/slime // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/cherrysandwich
	reagents = list("cherryjelly" = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/slice/bread, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/slice/bread, // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/jellysandwich/cherry // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/bloodsoup
	reagents = list("blood" = 30)
	result = /obj/item/reagent_containers/food/snacks/bloodsoup // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/slimesoup
	reagents = list("water" = 10, "slimejelly" = 5)
	items = list()
	result = /obj/item/reagent_containers/food/snacks/slimesoup // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/boiledslimeextract
	reagents = list("water" = 5)
	items = list(
		/obj/item/slime_extract,
	)
	result = /obj/item/reagent_containers/food/snacks/boiledslimecore // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/chocolateegg
	items = list(
		/obj/item/reagent_containers/food/snacks/egg, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/chocolatebar, // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/chocolateegg // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/sausage
	items = list(
		/obj/item/reagent_containers/food/snacks/meatball, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/cutlet, // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/sausage // CHOMPEdit - Removal of obj/item/weapon
	result_quantity = 2

/datum/recipe/kudzudonburi
	fruit = list("kudzu" = 1)
	reagents = list("rice" = 10)
	items = list(
		/obj/item/reagent_containers/food/snacks/carpmeat // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/kudzudonburi // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/mysterysoup
	reagents = list("water" = 10, "egg" = 3)
	items = list(
		/obj/item/reagent_containers/food/snacks/badrecipe, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/tofu, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/cheesewedge, // CHOMPEdit - Removal of obj/item/weapon
	)
	reagent_mix = RECIPE_REAGENT_REPLACE
	result = /obj/item/reagent_containers/food/snacks/mysterysoup // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/plumphelmetbiscuit
	fruit = list("plumphelmet" = 1)
	reagents = list("water" = 5, "flour" = 5)
	result = /obj/item/reagent_containers/food/snacks/plumphelmetbiscuit // CHOMPEdit - Removal of obj/item/weapon
	result_quantity = 2

/datum/recipe/mushroomsoup
	fruit = list("mushroom" = 1)
	reagents = list("water" = 5, "milk" = 5)
	reagent_mix = RECIPE_REAGENT_REPLACE
	result = /obj/item/reagent_containers/food/snacks/mushroomsoup // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/chawanmushi
	fruit = list("mushroom" = 1)
	reagents = list("water" = 5, "soysauce" = 5, "egg" = 6)
	result = /obj/item/reagent_containers/food/snacks/chawanmushi // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/beetsoup
	fruit = list("whitebeet" = 1, "cabbage" = 1)
	reagents = list("water" = 10)
	result = /obj/item/reagent_containers/food/snacks/beetsoup // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/tossedsalad
	fruit = list("lettuce" = 2, "tomato" = 1, "carrot" = 1, "apple" = 1)
	result = /obj/item/reagent_containers/food/snacks/tossedsalad // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/flowersalad
	fruit = list("harebell" = 1, "poppy" = 1)
	items = list(
		/obj/item/reagent_containers/food/snacks/roastedsunflower // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/flowerchildsalad // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/rosesalad
	fruit = list("harebell" = 1, "rose" = 1)
	items = list(
		/obj/item/reagent_containers/food/snacks/roastedsunflower // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/rosesalad // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/aesirsalad
	fruit = list("goldapple" = 1, "ambrosiadeus" = 1)
	result = /obj/item/reagent_containers/food/snacks/aesirsalad // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/validsalad
	fruit = list("potato" = 1, "ambrosia" = 3)
	items = list(/obj/item/reagent_containers/food/snacks/meatball) // CHOMPEdit - Removal of obj/item/weapon
	result = /obj/item/reagent_containers/food/snacks/validsalad // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/dankpocket
	fruit = list("ambrosia" = 2)
	items = list(
		/obj/item/reagent_containers/food/snacks/meatball, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/doughslice // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/donkpocket/dankpocket // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/validsalad/make_food(var/obj/container as obj)
	. = ..(container)
	for (var/obj/item/reagent_containers/food/snacks/validsalad/being_cooked in .) // CHOMPEdit - Removal of obj/item/weapon
		being_cooked.reagents.del_reagent("toxin")

/datum/recipe/stuffing
	reagents = list("water" = 5, "sodiumchloride" = 1, "blackpepper" = 1)
	items = list(
		/obj/item/reagent_containers/food/snacks/sliceable/bread, // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/stuffing // CHOMPEdit - Removal of obj/item/weapon
	result_quantity = 2

/datum/recipe/mashedpotato
	items = list(
		/obj/item/reagent_containers/food/snacks/spreads // CHOMPEdit - Removal of obj/item/weapon
	)
	fruit = list("potato" = 1)
	result = /obj/item/reagent_containers/food/snacks/mashedpotato // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/icecreamsandwich
	reagents = list("milk" = 5, "ice" = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/icecream // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/icecreamsandwich // CHOMPEdit - Removal of obj/item/weapon

// Fuck Science!
/datum/recipe/ruinedvirusdish
	items = list(
		/obj/item/virusdish // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/ruinedvirusdish // CHOMPEdit - Removal of obj/item/weapon


/datum/recipe/onionsoup
	fruit = list("onion" = 1)
	reagents = list("water" = 10)
	result = /obj/item/reagent_containers/food/snacks/soup/onion // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/microwavebun
	reagents = list("sodiumchloride" = 1)
	items = list(
		/obj/item/reagent_containers/food/snacks/dough // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/bun // CHOMPEdit - Removal of obj/item/weapon
	result_quantity = 3

/datum/recipe/microwaveflatbread
	items = list(
		/obj/item/reagent_containers/food/snacks/sliceable/flatdough // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/flatbread // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/meatball
	items = list(
		/obj/item/reagent_containers/food/snacks/rawmeatball // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/meatball // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/cutlet
	items = list(
		/obj/item/reagent_containers/food/snacks/rawcutlet // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/cutlet // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/roastedcornsunflowerseeds
	reagents = list("sodiumchloride" = 1, "cornoil" = 1)
	items = list(
		/obj/item/reagent_containers/food/snacks/rawsunflower // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/roastedsunflower // CHOMPEdit - Removal of obj/item/weapon
	result_quantity = 2

/datum/recipe/roastedsunflowerseeds
	reagents = list("sodiumchloride" = 1, "cookingoil" = 1)
	items = list(
		/obj/item/reagent_containers/food/snacks/rawsunflower // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/roastedsunflower // CHOMPEdit - Removal of obj/item/weapon
	result_quantity = 2

/datum/recipe/roastedpeanutsunflowerseeds
	reagents = list("sodiumchloride" = 1, "peanutoil" = 1)
	items = list(
		/obj/item/reagent_containers/food/snacks/rawsunflower // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/roastedsunflower // CHOMPEdit - Removal of obj/item/weapon
	result_quantity = 2

/datum/recipe/roastedpeanuts
	fruit = list("peanut" = 2)
	reagents = list("sodiumchloride" = 2, "cookingoil" = 1)
	result = /obj/item/reagent_containers/food/snacks/roastedpeanuts // CHOMPEdit - Removal of obj/item/weapon
	result_quantity = 2

/datum/recipe/roastedpeanutscorn
	fruit = list("peanut" = 2)
	reagents = list("sodiumchloride" = 2, "cornoil" = 1)
	result = /obj/item/reagent_containers/food/snacks/roastedpeanuts // CHOMPEdit - Removal of obj/item/weapon
	result_quantity = 2

/datum/recipe/roastedpeanutspeanut
	fruit = list("peanut" = 2)
	reagents = list("sodiumchloride" = 2, "peanutoil" = 1)
	result = /obj/item/reagent_containers/food/snacks/roastedpeanuts // CHOMPEdit - Removal of obj/item/weapon
	result_quantity = 2

/datum/recipe/mint
	reagents = list("sugar" = 5, "frostoil" = 5)
	result = /obj/item/reagent_containers/food/snacks/mint // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/sashimi
	reagents = list("soysauce" = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/carpmeat // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/sashimi // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/benedict
	items = list(
		/obj/item/reagent_containers/food/snacks/cutlet, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/friedegg, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/slice/bread // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/benedict // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/bakedbeans
	fruit = list("soybeans" = 2)
	reagents = list("ketchup" = 5)
	result = /obj/item/reagent_containers/food/snacks/beans // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/sugarcookie
	items = list(
		/obj/item/reagent_containers/food/snacks/dough // CHOMPEdit - Removal of obj/item/weapon
	)
	reagents = list("sugar" = 5, "egg" = 3)
	result = /obj/item/reagent_containers/food/snacks/sugarcookie // CHOMPEdit - Removal of obj/item/weapon
	result_quantity = 4

/datum/recipe/berrymuffin
	reagents = list("milk" = 5, "sugar" = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/dough // CHOMPEdit - Removal of obj/item/weapon
	)
	fruit = list("berries" = 1)
	result = /obj/item/reagent_containers/food/snacks/berrymuffin/berry // CHOMPEdit - Removal of obj/item/weapon
	result_quantity = 2

/datum/recipe/poisonberrymuffin
	reagents = list("milk" = 5, "sugar" = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/dough // CHOMPEdit - Removal of obj/item/weapon
	)
	fruit = list("poisonberries" = 1)
	result = /obj/item/reagent_containers/food/snacks/berrymuffin/poison // CHOMPEdit - Removal of obj/item/weapon
	result_quantity = 2

/datum/recipe/ghostmuffin
	reagents = list("milk" = 5, "sugar" = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/dough, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/ectoplasm // CHOMPEdit - Removal of obj/item/weapon
	)
	fruit = list("berries" = 1)
	result = /obj/item/reagent_containers/food/snacks/ghostmuffin/berry // CHOMPEdit - Removal of obj/item/weapon
	result_quantity = 2

/datum/recipe/poisonghostmuffin
	reagents = list("milk" = 5, "sugar" = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/dough, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/ectoplasm // CHOMPEdit - Removal of obj/item/weapon
	)
	fruit = list("poisonberries" = 1)
	result = /obj/item/reagent_containers/food/snacks/ghostmuffin/poison // CHOMPEdit - Removal of obj/item/weapon
	result_quantity = 2

/datum/recipe/eggroll
	reagents = list("soysauce" = 10)
	items = list(
		/obj/item/reagent_containers/food/snacks/friedegg // CHOMPEdit - Removal of obj/item/weapon
	)
	fruit = list("cabbage" = 1)
	result = /obj/item/reagent_containers/food/snacks/eggroll // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/fruitsalad
	fruit = list("orange" = 1, "apple" = 1, "grapes" = 1, "watermelon" = 1)
	result = /obj/item/reagent_containers/food/snacks/fruitsalad // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/eggbowl
	reagents = list("water" = 5, "rice" = 10, "egg" = 3)
	result = /obj/item/reagent_containers/food/snacks/eggbowl // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/porkbowl
	reagents = list("water" = 5, "rice" = 10)
	items = list(
		/obj/item/reagent_containers/food/snacks/cutlet // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/porkbowl // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/cubannachos
	fruit = list("chili" = 1)
	reagents = list("ketchup" = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/tortilla // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/cubannachos // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/curryrice
	fruit = list("chili" = 1)
	reagents = list("rice" = 10)
	result = /obj/item/reagent_containers/food/snacks/curryrice // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/piginblanket
	items = list(
		/obj/item/reagent_containers/food/snacks/doughslice, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/sausage // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/piginblanket // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/bagelplain
	reagents = list("water" = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/bun // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/bagelplain // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/bagelsunflower
	reagents = list("water" = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/bun, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/rawsunflower // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/bagelsunflower // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/bagelcheese
	reagents = list("water" = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/bun, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/cheesewedge // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/bagelcheese // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/bagelraisin
	reagents = list("water" = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/bun, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/no_raisin // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/bagelraisin // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/bagelpoppy
	fruit = list("poppy" = 1)
	reagents = list("water" = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/bun // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/bagelpoppy // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/bageleverything
	reagents = list("water" = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/bun, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/fuel_assembly/supermatter // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/bageleverything // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/bageltwo
	reagents = list("water" = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/bun, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/soulstone // CHOMPEdit - Removal of obj/item/device
	)
	result = /obj/item/reagent_containers/food/snacks/bageltwo // CHOMPEdit - Removal of obj/item/weapon

//Recipes that use RECIPE_REAGENT_REPLACE will
//simplify the end product and balance the amount of reagents
//in some foods. Many require the space spice reagent/condiment
//to reduce the risk of future recipe conflicts.

/datum/recipe/redcurry
	reagents = list("cream" = 5, "spacespice" = 2, "rice" = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/cutlet, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/cutlet // CHOMPEdit - Removal of obj/item/weapon
	)
	reagent_mix = RECIPE_REAGENT_REPLACE //Simplify end product
	result = /obj/item/reagent_containers/food/snacks/redcurry // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/greencurry
	reagents = list("cream" = 5, "spacespice" = 2, "rice" = 5)
	fruit = list("chili" = 1)
	items = list(
		/obj/item/reagent_containers/food/snacks/tofu, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/tofu // CHOMPEdit - Removal of obj/item/weapon
	)
	reagent_mix = RECIPE_REAGENT_REPLACE //Simplify end product
	result = /obj/item/reagent_containers/food/snacks/greencurry // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/yellowcurry
	reagents = list("cream" = 5, "spacespice" = 2, "rice" = 5)
	fruit = list("peanut" = 2, "potato" = 1)
	reagent_mix = RECIPE_REAGENT_REPLACE //Simplify end product
	result = /obj/item/reagent_containers/food/snacks/yellowcurry // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/bearchili
	fruit = list("chili" = 1, "tomato" = 1)
	items = list(/obj/item/reagent_containers/food/snacks/bearmeat) // CHOMPEdit - Removal of obj/item/weapon
	reagent_mix = RECIPE_REAGENT_REPLACE //Simplify end product
	result = /obj/item/reagent_containers/food/snacks/bearchili // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/bearstew
	fruit = list("potato" = 1, "tomato" = 1, "carrot" = 1, "eggplant" = 1, "mushroom" = 1)
	reagents = list("water" = 10)
	items = list(/obj/item/reagent_containers/food/snacks/bearmeat) // CHOMPEdit - Removal of obj/item/weapon
	reagent_mix = RECIPE_REAGENT_REPLACE //Simplify end product
	result = /obj/item/reagent_containers/food/snacks/bearstew // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/bibimbap
	fruit = list("carrot" = 1, "cabbage" = 1, "mushroom" = 1)
	reagents = list("rice" = 5, "spacespice" = 2)
	items = list(
		/obj/item/reagent_containers/food/snacks/egg, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/cutlet // CHOMPEdit - Removal of obj/item/weapon
	)
	reagent_mix = RECIPE_REAGENT_REPLACE //Simplify end product
	result = /obj/item/reagent_containers/food/snacks/bibimbap // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/friedrice
	reagents = list("water" = 5, "rice" = 10, "soysauce" = 5)
	fruit = list("carrot" = 1, "cabbage" = 1)
	reagent_mix = RECIPE_REAGENT_REPLACE //Simplify end product
	result = /obj/item/reagent_containers/food/snacks/friedrice // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/lomein
	reagents = list("water" = 5, "soysauce" = 5)
	fruit = list("carrot" = 1, "cabbage" = 1)
	items = list(
		/obj/item/reagent_containers/food/snacks/spagetti // CHOMPEdit - Removal of obj/item/weapon
	)
	reagent_mix = RECIPE_REAGENT_REPLACE //Simplify end product
	result = /obj/item/reagent_containers/food/snacks/lomein // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/chickennoodlesoup
	fruit = list("carrot" = 1)
	reagents = list("water" = 10)
	items = list( /obj/item/reagent_containers/food/snacks/spagetti, /obj/item/reagent_containers/food/snacks/rawcutlet) // CHOMPEdit - Removal of obj/item/weapon
	reagent_mix = RECIPE_REAGENT_REPLACE //Simplify end product
	result = /obj/item/reagent_containers/food/snacks/chickennoodlesoup // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/chilicheesefries
	items = list(
		/obj/item/reagent_containers/food/snacks/fries, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/cheesewedge, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/hotchili // CHOMPEdit - Removal of obj/item/weapon
	)
	reagent_mix = RECIPE_REAGENT_REPLACE //Simplify end product
	result = /obj/item/reagent_containers/food/snacks/chilicheesefries // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/risotto
	reagents = list("redwine" = 5, "rice" = 10, "spacespice" = 1)
	fruit = list("mushroom" = 1)
	reagent_mix = RECIPE_REAGENT_REPLACE //Get that rice and wine outta here
	result = /obj/item/reagent_containers/food/snacks/risotto // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/poachedegg
	reagents = list("spacespice" = 1, "sodiumchloride" = 1, "blackpepper" = 1, "water" = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/egg // CHOMPEdit - Removal of obj/item/weapon
	)
	reagent_mix = RECIPE_REAGENT_REPLACE //Get that water outta here
	result = /obj/item/reagent_containers/food/snacks/poachedegg // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/nugget
	reagents = list("flour" = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/meat/chicken // CHOMPEdit - Removal of obj/item/weapon
	)
	reagent_mix = RECIPE_REAGENT_REPLACE
	result = /obj/item/reagent_containers/food/snacks/nugget // CHOMPEdit - Removal of obj/item/weapon
	result_quantity = 3

// Chip update
/datum/recipe/microwavetortilla
	reagents = list("flour" = 5, "water" = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/sliceable/flatdough // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/tortilla // CHOMPEdit - Removal of obj/item/weapon
	reagent_mix = RECIPE_REAGENT_REPLACE //no gross flour or water
	result_quantity = 3

/datum/recipe/taco
	items = list(
		/obj/item/reagent_containers/food/snacks/tortilla, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/cutlet, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/cheesewedge // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/taco // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/chips
	reagents = list("sodiumchloride" = 1)
	items = list(
		/obj/item/reagent_containers/food/snacks/tortilla // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/chipplate // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/nachos
	items = list(
		/obj/item/reagent_containers/food/snacks/chipplate, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/cheesewedge // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/chipplate/nachos // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/salsa
	fruit = list("chili" = 1, "tomato" = 1, "lime" = 1)
	reagents = list("spacespice" = 1, "blackpepper" = 1,"sodiumchloride" = 1)
	result = /obj/item/reagent_containers/food/snacks/dip/salsa // CHOMPEdit - Removal of obj/item/weapon
	reagent_mix = RECIPE_REAGENT_REPLACE //Ingredients are mixed together.

/datum/recipe/guac
	fruit = list("chili" = 1, "lime" = 1)
	reagents = list("spacespice" = 1, "blackpepper" = 1,"sodiumchloride" = 1)
	items = list(
		/obj/item/reagent_containers/food/snacks/tofu // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/dip/guac // CHOMPEdit - Removal of obj/item/weapon
	reagent_mix = RECIPE_REAGENT_REPLACE //Ingredients are mixed together.

/datum/recipe/cheesesauce
	fruit = list("chili" = 1, "tomato" = 1)
	reagents = list("spacespice" = 1, "blackpepper" = 1,"sodiumchloride" = 1)
	items = list(
		/obj/item/reagent_containers/food/snacks/cheesewedge // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/dip // CHOMPEdit - Removal of obj/item/weapon
	reagent_mix = RECIPE_REAGENT_REPLACE //Ingredients are mixed together.

/datum/recipe/burrito
	items = list(
		/obj/item/reagent_containers/food/snacks/tortilla, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/meatball, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/meatball // CHOMPEdit - Removal of obj/item/weapon
	)
	reagents = list("spacespice" = 1)
	result = /obj/item/reagent_containers/food/snacks/burrito // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/burrito_vegan
	items = list(
		/obj/item/reagent_containers/food/snacks/tortilla, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/tofu // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/burrito_vegan // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/burrito_cheese
	items = list(
		/obj/item/reagent_containers/food/snacks/tortilla, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/meatball, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/meatball, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/cheesewedge // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/burrito_cheese // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/burrito_cheese_spicy
	fruit = list("chili" = 2, "soybeans" = 1)
	items = list(
		/obj/item/reagent_containers/food/snacks/tortilla, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/cheesewedge, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/cheesewedge, // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/burrito_cheese_spicy // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/burrito_hell
	fruit = list("soybeans" = 1, "chili" = 10)
	reagents = list("spacespice" = 1)
	items = list(
		/obj/item/reagent_containers/food/snacks/tortilla, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/meatball, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/meatball // CHOMPEdit - Removal of obj/item/weapon
	)
	result
	result = /obj/item/reagent_containers/food/snacks/burrito_hell // CHOMPEdit - Removal of obj/item/weapon
	reagent_mix = RECIPE_REAGENT_REPLACE //Already hot sauce

/datum/recipe/meatburrito
	fruit = list("soybeans" = 1)
	items = list(
		/obj/item/reagent_containers/food/snacks/tortilla, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/cutlet, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/cutlet // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/meatburrito // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/cheeseburrito
	fruit = list("soybeans" = 1)
	items = list(
		/obj/item/reagent_containers/food/snacks/tortilla, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/cheesewedge, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/cheesewedge // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/cheeseburrito // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/fuegoburrito
	fruit = list("soybeans" = 1, "chili" = 2)
	items = list(
		/obj/item/reagent_containers/food/snacks/tortilla // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/fuegoburrito // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/breakfast_wrap
	items = list(
		/obj/item/reagent_containers/food/snacks/bacon, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/tortilla, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/cheesewedge, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/egg // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/breakfast_wrap // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/burrito_mystery
	items = list(
		/obj/item/reagent_containers/food/snacks/tortilla, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/mysterysoup // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/burrito_mystery // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/baconmicrowave
	items = list(
		/obj/item/reagent_containers/food/snacks/rawbacon // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/bacon/microwave // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/chilied_eggs
	items = list(
		/obj/item/reagent_containers/food/snacks/hotchili, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/boiledegg, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/boiledegg, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/boiledegg // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/chilied_eggs // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/red_sun_special
	items = list(
		/obj/item/reagent_containers/food/snacks/sausage, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/cheesewedge // CHOMPEdit - Removal of obj/item/weapon

	)
	result = /obj/item/reagent_containers/food/snacks/red_sun_special // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/hatchling_suprise
	items = list(
		/obj/item/reagent_containers/food/snacks/poachedegg, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/bacon, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/bacon, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/bacon // CHOMPEdit - Removal of obj/item/weapon

	)
	result = /obj/item/reagent_containers/food/snacks/hatchling_suprise // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/riztizkzi_sea
	items = list(
		/obj/item/reagent_containers/food/snacks/egg, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/egg, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/egg // CHOMPEdit - Removal of obj/item/weapon
	)
	reagents = list("blood" = 15)
	result = /obj/item/reagent_containers/food/snacks/riztizkzi_sea // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/father_breakfast
	items = list(
		/obj/item/reagent_containers/food/snacks/sausage, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/meatsteak // CHOMPEdit - Removal of obj/item/weapon
	)
	reagents = list("egg" = 6)
	result = /obj/item/reagent_containers/food/snacks/father_breakfast // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/stuffed_meatball
	items = list(
		/obj/item/reagent_containers/food/snacks/meatball, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/cheesewedge // CHOMPEdit - Removal of obj/item/weapon
	)
	fruit = list("cabbage" = 1)
	result = /obj/item/reagent_containers/food/snacks/stuffed_meatball // CHOMPEdit - Removal of obj/item/weapon
	result_quantity = 2

/datum/recipe/egg_pancake
	items = list(
		/obj/item/reagent_containers/food/snacks/meatball, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/meatball, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/meatball // CHOMPEdit - Removal of obj/item/weapon
	)
	reagents = list("egg" = 6)
	result = /obj/item/reagent_containers/food/snacks/egg_pancake // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/bacon_stick
	items = list(
		/obj/item/reagent_containers/food/snacks/bacon, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/boiledegg // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/bacon_stick // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/bacon_and_eggs
	items = list(
		/obj/item/reagent_containers/food/snacks/bacon, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/friedegg // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/bacon_and_eggs // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/ntmuffin
	items = list(
		/obj/item/reagent_containers/food/snacks/plumphelmetbiscuit, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/sausage, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/friedegg, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/cheesewedge // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/nt_muffin // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/fish_taco
	fruit = list("chili" = 1, "lemon" = 1)
	items = list(
		/obj/item/reagent_containers/food/snacks/carpmeat, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/tortilla // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/fish_taco // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/blt
	fruit = list("tomato" = 1, "lettuce" = 1)
	items = list(
		/obj/item/reagent_containers/food/snacks/slice/bread, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/slice/bread, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/bacon, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/bacon // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/blt // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/gigapuddi
	reagents = list("milk" = 15)
	items = list(
		/obj/item/reagent_containers/food/snacks/egg, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/egg // CHOMPEdit - Removal of obj/item/weapon
		)
	result = /obj/item/reagent_containers/food/snacks/gigapuddi // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/gigapuddi/happy
	reagents = list("milk" = 15, "sugar" = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/egg, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/egg // CHOMPEdit - Removal of obj/item/weapon
		)
	result = /obj/item/reagent_containers/food/snacks/gigapuddi/happy // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/gigapuddi/anger
	reagents = list("milk" = 15, "sodiumchloride" = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/egg, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/egg // CHOMPEdit - Removal of obj/item/weapon
		)
	result = /obj/item/reagent_containers/food/snacks/gigapuddi/anger // CHOMPEdit - Removal of obj/item/weapon
