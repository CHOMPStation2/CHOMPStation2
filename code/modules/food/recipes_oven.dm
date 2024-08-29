/datum/recipe/ovenfries
	appliance = OVEN
	items = list(
		/obj/item/reagent_containers/food/snacks/rawsticks // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/ovenfries // CHOMPEdit - Removal of obj/item/weapon

//Roasts
//---------------

/datum/recipe/dionaroast
	appliance = OVEN
	fruit = list("apple" = 1)
	reagents = list("pacid" = 5) //It dissolves the carapace. Still poisonous, though.
	items = list(/obj/item/holder/diona) // CHOMPEdit - Removal of obj/item/weapon
	result = /obj/item/reagent_containers/food/snacks/dionaroast // CHOMPEdit - Removal of obj/item/weapon
	reagent_mix = RECIPE_REAGENT_REPLACE //No eating polyacid

/datum/recipe/monkeysdelight
	appliance = OVEN
	fruit = list("banana" = 1)
	reagents = list("sodiumchloride" = 1, "blackpepper" = 1, "flour" = 10)
	items = list(
		/obj/item/reagent_containers/food/snacks/monkeycube // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/monkeysdelight // CHOMPEdit - Removal of obj/item/weapon
	reagent_mix = RECIPE_REAGENT_REPLACE

/datum/recipe/ribplate
	appliance = OVEN
	reagents = list("honey" = 5, "spacespice" = 2, "blackpepper" = 1)
	items = list(/obj/item/reagent_containers/food/snacks/meat) // CHOMPEdit - Removal of obj/item/weapon
	reagent_mix = RECIPE_REAGENT_REPLACE
	result = /obj/item/reagent_containers/food/snacks/ribplate // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/turkey
	appliance = OVEN
	reagents = list("sodiumchloride" = 1, "blackpepper" = 1)
	items = list(
		/obj/item/reagent_containers/food/snacks/meat/chicken, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/stuffing // CHOMPEdit - Removal of obj/item/weapon
		)
	result = /obj/item/reagent_containers/food/snacks/sliceable/turkey // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/tofurkey
	appliance = OVEN
	reagents = list("sodiumchloride" = 1, "blackpepper" = 1)
	items = list(
		/obj/item/reagent_containers/food/snacks/tofu, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/tofu, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/stuffing // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/tofurkey // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/zestfish
	appliance = OVEN
	fruit = list("lemon" = 1)
	reagents = list("sodiumchloride" = 3)
	items = list(
		/obj/item/reagent_containers/food/snacks/carpmeat // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/zestfish // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/limezestfish
	appliance = OVEN
	fruit = list("lime" = 1)
	reagents = list("sodiumchloride" = 3)
	items = list(
		/obj/item/reagent_containers/food/snacks/carpmeat // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/zestfish // CHOMPEdit - Removal of obj/item/weapon


//Predesigned breads
//================================
/datum/recipe/bread
	appliance = OVEN
	items = list(
		/obj/item/reagent_containers/food/snacks/dough, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/dough // CHOMPEdit - Removal of obj/item/weapon
	)
	reagents = list("sodiumchloride" = 1, "yeast" = 5)
	result = /obj/item/reagent_containers/food/snacks/sliceable/bread // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/baguette
	appliance = OVEN
	reagents = list("sodiumchloride" = 1, "blackpepper" = 1,  "yeast" = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/dough, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/dough // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/baguette // CHOMPEdit - Removal of obj/item/weapon


/datum/recipe/tofubread
	appliance = OVEN
	items = list(
		/obj/item/reagent_containers/food/snacks/dough, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/dough, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/tofu, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/tofu, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/cheesewedge, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/cheesewedge // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/sliceable/tofubread // CHOMPEdit - Removal of obj/item/weapon


/datum/recipe/creamcheesebread
	appliance = OVEN
	items = list(
		/obj/item/reagent_containers/food/snacks/dough, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/dough, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/cheesewedge, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/cheesewedge // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/sliceable/creamcheesebread // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/flatbread
	appliance = OVEN
	items = list(
		/obj/item/reagent_containers/food/snacks/sliceable/flatdough // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/flatbread // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/tortilla
	appliance = OVEN
	reagents = list("flour" = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/sliceable/flatdough // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/tortilla // CHOMPEdit - Removal of obj/item/weapon
	result_quantity = 3

/datum/recipe/meatbread
	appliance = OVEN
	items = list(
		/obj/item/reagent_containers/food/snacks/dough, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/dough, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/meat, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/meat, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/cheesewedge, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/cheesewedge // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/sliceable/meatbread // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/syntibread
	appliance = OVEN
	items = list(
		/obj/item/reagent_containers/food/snacks/dough, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/dough, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/meat/syntiflesh, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/meat/syntiflesh, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/cheesewedge, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/cheesewedge // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/sliceable/meatbread // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/xenomeatbread
	appliance = OVEN
	items = list(
		/obj/item/reagent_containers/food/snacks/dough, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/dough, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/xenomeat, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/xenomeat, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/cheesewedge, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/cheesewedge // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/sliceable/xenomeatbread // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/bananabread
	appliance = OVEN
	fruit = list("banana" = 1)
	reagents = list("milk" = 5, "sugar" = 15)
	items = list(
		/obj/item/reagent_containers/food/snacks/dough, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/dough // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/sliceable/bananabread // CHOMPEdit - Removal of obj/item/weapon


/datum/recipe/bun
	appliance = OVEN
	reagents = list("sodiumchloride" = 1)
	items = list(
		/obj/item/reagent_containers/food/snacks/dough // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/bun // CHOMPEdit - Removal of obj/item/weapon
	result_quantity = 3

//Predesigned pies
//=======================

/datum/recipe/meatpie
	appliance = OVEN
	items = list(
		/obj/item/reagent_containers/food/snacks/sliceable/flatdough, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/meat // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/meatpie // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/tofupie
	appliance = OVEN
	items = list(
		/obj/item/reagent_containers/food/snacks/sliceable/flatdough, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/tofu // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/tofupie // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/xemeatpie
	appliance = OVEN
	items = list(
		/obj/item/reagent_containers/food/snacks/sliceable/flatdough, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/xenomeat // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/xemeatpie // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/pie
	appliance = OVEN
	fruit = list("banana" = 1)
	reagents = list("sugar" = 5)
	items = list(/obj/item/reagent_containers/food/snacks/sliceable/flatdough) // CHOMPEdit - Removal of obj/item/weapon
	result = /obj/item/reagent_containers/food/snacks/pie // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/cherrypie
	appliance = OVEN
	fruit = list("cherries" = 1)
	reagents = list("sugar" = 10)
	items = list(
		/obj/item/reagent_containers/food/snacks/sliceable/flatdough // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/cherrypie // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/amanita_pie
	appliance = OVEN
	reagents = list("amatoxin" = 5)
	items = list(/obj/item/reagent_containers/food/snacks/sliceable/flatdough) // CHOMPEdit - Removal of obj/item/weapon
	result = /obj/item/reagent_containers/food/snacks/amanita_pie // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/plump_pie
	appliance = OVEN
	fruit = list("plumphelmet" = 1)
	items = list(/obj/item/reagent_containers/food/snacks/sliceable/flatdough) // CHOMPEdit - Removal of obj/item/weapon
	result = /obj/item/reagent_containers/food/snacks/plump_pie // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/applepie
	appliance = OVEN
	fruit = list("apple" = 1)
	items = list(/obj/item/reagent_containers/food/snacks/sliceable/flatdough) // CHOMPEdit - Removal of obj/item/weapon
	result = /obj/item/reagent_containers/food/snacks/applepie // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/pumpkinpie
	appliance = OVEN
	fruit = list("pumpkin" = 1)
	reagents = list("sugar" = 5)
	items = list(/obj/item/reagent_containers/food/snacks/sliceable/flatdough) // CHOMPEdit - Removal of obj/item/weapon
	result = /obj/item/reagent_containers/food/snacks/sliceable/pumpkinpie // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/appletart
	appliance = OVEN
	fruit = list("goldapple" = 1)
	reagents = list("sugar" = 10)
	items = list(/obj/item/reagent_containers/food/snacks/sliceable/flatdough) // CHOMPEdit - Removal of obj/item/weapon
	result = /obj/item/reagent_containers/food/snacks/appletart // CHOMPEdit - Removal of obj/item/weapon
	result_quantity = 2
	reagent_mix = RECIPE_REAGENT_REPLACE

/datum/recipe/keylimepie
	appliance = OVEN
	fruit = list("lime" = 2)
	reagents = list("milk" = 5, "sugar" = 5, "egg" = 3, "flour" = 10)
	result = /obj/item/reagent_containers/food/snacks/sliceable/keylimepie // CHOMPEdit - Removal of obj/item/weapon
	reagent_mix = RECIPE_REAGENT_REPLACE //No raw egg in finished product, protein after cooking causes magic meatballs otherwise

/datum/recipe/quiche
	appliance = OVEN
	reagents = list("milk" = 5, "egg" = 9, "flour" = 10)
	items = list(/obj/item/reagent_containers/food/snacks/cheesewedge) // CHOMPEdit - Removal of obj/item/weapon
	result = /obj/item/reagent_containers/food/snacks/sliceable/quiche // CHOMPEdit - Removal of obj/item/weapon
	reagent_mix = RECIPE_REAGENT_REPLACE //No raw egg in finished product, protein after cooking causes magic meatballs otherwise

//Baked sweets:
//---------------

/datum/recipe/cookie
	appliance = OVEN
	reagents = list("milk" = 10, "sugar" = 10)
	items = list(
		/obj/item/reagent_containers/food/snacks/dough, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/chocolatebar // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/cookie // CHOMPEdit - Removal of obj/item/weapon
	result_quantity = 4
	reagent_mix = RECIPE_REAGENT_REPLACE

/datum/recipe/ovenfortunecookie
	appliance = OVEN
	reagents = list("sugar" = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/doughslice, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/paper // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/fortunecookie // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/poppypretzel
	appliance = OVEN
	fruit = list("poppy" = 1)
	items = list(/obj/item/reagent_containers/food/snacks/dough) // CHOMPEdit - Removal of obj/item/weapon
	result = /obj/item/reagent_containers/food/snacks/poppypretzel // CHOMPEdit - Removal of obj/item/weapon
	result_quantity = 2

/datum/recipe/cracker
	appliance = OVEN
	reagents = list("sodiumchloride" = 1)
	items = list(
		/obj/item/reagent_containers/food/snacks/doughslice // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/cracker // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/brownies
	appliance = OVEN
	reagents = list("browniemix" = 10, "egg" = 3)
	reagent_mix = RECIPE_REAGENT_REPLACE //No egg or mix in final recipe
	result = /obj/item/reagent_containers/food/snacks/sliceable/brownies // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/cosmicbrownies
	appliance = OVEN
	reagents = list("browniemix" = 10, "egg" = 3)
	fruit = list("ambrosia" = 1)
	reagent_mix = RECIPE_REAGENT_REPLACE //No egg or mix in final recipe
	result = /obj/item/reagent_containers/food/snacks/sliceable/cosmicbrownies // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/buchedenoel
	appliance = OVEN
	fruit = list("berries" = 2)
	reagents = list("cakebatter" = 20, "cream" = 10, "coco" = 5)
	result = /obj/item/reagent_containers/food/snacks/sliceable/buchedenoel // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/cinnamonbun
	appliance = OVEN
	reagents = list("sugar" = 15, "cream" = 10)
	items = list(
		/obj/item/reagent_containers/food/snacks/dough // CHOMPEdit - Removal of obj/item/weapon
		)
	result = /obj/item/reagent_containers/food/snacks/cinnamonbun // CHOMPEdit - Removal of obj/item/weapon
	result_quantity = 4

/datum/recipe/jaffacake
	appliance = OVEN
	fruit = list("orange" = 1)
	reagents = list("cakebatter" = 15, "coco" = 10)
	result = /obj/item/reagent_containers/food/snacks/jaffacake // CHOMPEdit - Removal of obj/item/weapon
	result_quantity = 6

//Pizzas
//=========================
/datum/recipe/pizzamargherita
	appliance = OVEN
	fruit = list("tomato" = 1)
	items = list(
		/obj/item/reagent_containers/food/snacks/sliceable/flatdough, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/cheesewedge, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/cheesewedge, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/cheesewedge, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/cheesewedge // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/sliceable/pizza/margherita // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/meatpizza
	appliance = OVEN
	fruit = list("tomato" = 1)
	items = list(
		/obj/item/reagent_containers/food/snacks/sliceable/flatdough, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/meat, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/meat, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/meat, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/cheesewedge // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/sliceable/pizza/meatpizza // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/syntipizza
	appliance = OVEN
	fruit = list("tomato" = 1)
	items = list(
		/obj/item/reagent_containers/food/snacks/sliceable/flatdough, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/meat/syntiflesh, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/meat/syntiflesh, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/meat/syntiflesh, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/cheesewedge // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/sliceable/pizza/meatpizza // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/mushroompizza
	appliance = OVEN
	fruit = list("mushroom" = 5, "tomato" = 1)
	items = list(
		/obj/item/reagent_containers/food/snacks/sliceable/flatdough, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/cheesewedge // CHOMPEdit - Removal of obj/item/weapon
	)

	reagent_mix = RECIPE_REAGENT_REPLACE //No vomit taste in finished product from chanterelles
	result = /obj/item/reagent_containers/food/snacks/sliceable/pizza/mushroompizza // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/vegetablepizza
	appliance = OVEN
	fruit = list("eggplant" = 1, "carrot" = 1, "corn" = 1, "tomato" = 1)
	items = list(
		/obj/item/reagent_containers/food/snacks/sliceable/flatdough, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/cheesewedge // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/sliceable/pizza/vegetablepizza // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/pineapplepizza
	appliance = OVEN
	fruit = list("tomato" = 1)
	items = list(
		/obj/item/reagent_containers/food/snacks/sliceable/flatdough, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/cheesewedge, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/pineapple_ring, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/pineapple_ring // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/sliceable/pizza/pineapple // CHOMPEdit - Removal of obj/item/weapon

//Spicy
//================

/datum/recipe/enchiladas
	appliance = OVEN
	fruit = list("chili" = 2)
	items = list(
		/obj/item/reagent_containers/food/snacks/cutlet, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/tortilla // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/enchiladas // CHOMPEdit - Removal of obj/item/weapon


// Cakes.
//============
/datum/recipe/cake
	appliance = OVEN
	reagents = list("cakebatter" = 30, "vanilla" = 2)
	result = /obj/item/reagent_containers/food/snacks/sliceable/plaincake // CHOMPEdit - Removal of obj/item/weapon
	reagent_mix = RECIPE_REAGENT_REPLACE

/datum/recipe/cake/carrot
	appliance = OVEN
	fruit = list("carrot" = 3)
	reagents = list("cakebatter" = 30)
	result = /obj/item/reagent_containers/food/snacks/sliceable/carrotcake // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/cake/cheese
	appliance = OVEN
	reagents = list("cakebatter" = 30)
	items = list(
		/obj/item/reagent_containers/food/snacks/cheesewedge, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/cheesewedge // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/sliceable/cheesecake // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/cake/peanut
	fruit = list("peanut" = 1)
	reagents = list("cakebatter" = 30, "peanutbutter" = 5)
	result = /obj/item/reagent_containers/food/snacks/sliceable/peanutcake // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/cake/orange
	appliance = OVEN
	fruit = list("orange" = 2)
	reagents = list("cakebatter" = 30)
	result = /obj/item/reagent_containers/food/snacks/sliceable/orangecake // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/cake/lime
	appliance = OVEN
	fruit = list("lime" = 2)
	reagents = list("cakebatter" = 30)
	result = /obj/item/reagent_containers/food/snacks/sliceable/limecake // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/cake/lemon
	appliance = OVEN
	fruit = list("lemon" = 2)
	reagents = list("cakebatter" = 30)
	result = /obj/item/reagent_containers/food/snacks/sliceable/lemoncake // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/cake/chocolate
	appliance = OVEN
	reagents = list("cakebatter" = 30, "coco" = 5)
	result = /obj/item/reagent_containers/food/snacks/sliceable/chocolatecake // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/cake/birthday
	appliance = OVEN
	reagents = list("cakebatter" = 30)
	items = list(/obj/item/clothing/head/cakehat)
	result = /obj/item/reagent_containers/food/snacks/sliceable/birthdaycake // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/cake/apple
	appliance = OVEN
	fruit = list("apple" = 2)
	reagents = list("cakebatter" = 30)
	result = /obj/item/reagent_containers/food/snacks/sliceable/applecake // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/cake/brain
	appliance = OVEN
	reagents = list("cakebatter" = 30)
	items = list(/obj/item/organ/internal/brain)
	result = /obj/item/reagent_containers/food/snacks/sliceable/braincake // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/pancakes
	appliance = OVEN
	reagents = list("milk" = 5, "sugar" = 15)
	items = list(
		/obj/item/reagent_containers/food/snacks/sliceable/flatdough, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/sliceable/flatdough // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/pancakes // CHOMPEdit - Removal of obj/item/weapon
	result_quantity = 2

/datum/recipe/pancakes/berry
	appliance = OVEN
	fruit = list("berries" = 2)
	reagents = list("milk" = 5, "sugar" = 15)
	items = list(
		/obj/item/reagent_containers/food/snacks/sliceable/flatdough, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/sliceable/flatdough // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/pancakes/berry // CHOMPEdit - Removal of obj/item/weapon
	result_quantity = 2

/datum/recipe/lasagna
	appliance = OVEN
	fruit = list("tomato" = 2, "eggplant" = 1)
	items = list(
		/obj/item/reagent_containers/food/snacks/sliceable/flatdough, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/sliceable/flatdough, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/cutlet, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/cutlet // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/lasagna // CHOMPEdit - Removal of obj/item/weapon
	reagent_mix = RECIPE_REAGENT_REPLACE

/datum/recipe/honeybun
	appliance = OVEN
	items = list(
		/obj/item/reagent_containers/food/snacks/dough // CHOMPEdit - Removal of obj/item/weapon
	)
	reagents = list("milk" = 5, "egg" = 3,"honey" = 5)
	result = /obj/item/reagent_containers/food/snacks/honeybun // CHOMPEdit - Removal of obj/item/weapon
	result_quantity = 4

//Bacon
/datum/recipe/bacon_oven
	appliance = OVEN
	items = list(
		/obj/item/reagent_containers/food/snacks/rawbacon, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/rawbacon, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/rawbacon, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/rawbacon, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/rawbacon, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/rawbacon, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/spreads // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/bacon/oven // CHOMPEdit - Removal of obj/item/weapon
	result_quantity = 6

/datum/recipe/meat_pocket
	appliance = OVEN
	items = list(
		/obj/item/reagent_containers/food/snacks/sliceable/flatdough, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/meatball, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/cheesewedge // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/meat_pocket // CHOMPEdit - Removal of obj/item/weapon
	result_quantity = 2

/datum/recipe/bacon_flatbread
	appliance = OVEN
	fruit = list("tomato" = 2)
	items = list(
		/obj/item/reagent_containers/food/snacks/sliceable/flatdough, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/cheesewedge, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/bacon, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/bacon, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/bacon, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/bacon // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/bacon_flatbread // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/truffle
	appliance = OVEN
	reagents = list("sugar" = 5, "cream" = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/chocolatebar // CHOMPEdit - Removal of obj/item/weapon
	)
	reagent_mix = RECIPE_REAGENT_REPLACE
	result = /obj/item/reagent_containers/food/snacks/truffle // CHOMPEdit - Removal of obj/item/weapon
	result_quantity = 4

/datum/recipe/croissant
	appliance = OVEN
	reagents = list("sodiumchloride" = 1, "water" = 5, "milk" = 5, "yeast" = 5)
	reagent_mix = RECIPE_REAGENT_REPLACE
	items = list(/obj/item/reagent_containers/food/snacks/dough) // CHOMPEdit - Removal of obj/item/weapon
	result = /obj/item/reagent_containers/food/snacks/croissant // CHOMPEdit - Removal of obj/item/weapon
	result_quantity = 2

/datum/recipe/macncheese
	appliance = OVEN
	reagents = list("milk" = 5)
	reagent_mix = RECIPE_REAGENT_REPLACE
	items = list(
		/obj/item/reagent_containers/food/snacks/spagetti, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/cheesewedge // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/macncheese // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/suppermatter
	appliance = OVEN
	reagents = list("radium" = 5, "milk" = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/sliceable/cheesecake // CHOMPEdit - Removal of obj/item/weapon
		)
	reagent_mix = RECIPE_REAGENT_REPLACE
	result = /obj/item/reagent_containers/food/snacks/sliceable/suppermatter // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/excitingsuppermatter
	appliance = OVEN
	reagents = list("radium" = 5, "spacespice" = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/sliceable/cheesecake // CHOMPEdit - Removal of obj/item/weapon
		)
	reagent_mix = RECIPE_REAGENT_REPLACE
	result = /obj/item/reagent_containers/food/snacks/sliceable/excitingsuppermatter // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/waffles
	appliance = OVEN
	reagents = list("sugar" = 10)
	items = list(
		/obj/item/reagent_containers/food/snacks/dough, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/dough // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/waffles // CHOMPEdit - Removal of obj/item/weapon
	result_quantity = 2

/datum/recipe/loadedbakedpotatooven
	appliance = OVEN
	fruit = list("potato" = 1)
	items = list(/obj/item/reagent_containers/food/snacks/cheesewedge) // CHOMPEdit - Removal of obj/item/weapon
	result = /obj/item/reagent_containers/food/snacks/loadedbakedpotato // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/meatbun
	appliance = OVEN
	fruit = list("cabbage" = 1)
	reagents = list("water" = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/meatball, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/sliceable/flatdough, // CHOMPEdit - Removal of obj/item/weapon
	)
	reagent_mix = RECIPE_REAGENT_REPLACE //Water used up in cooking
	result = /obj/item/reagent_containers/food/snacks/meatbun // CHOMPEdit - Removal of obj/item/weapon
	result_quantity = 2

/datum/recipe/spicedmeatbun
	appliance = OVEN
	reagents = list("spacespice" = 2, "water" = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/doughslice, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/rawcutlet // CHOMPEdit - Removal of obj/item/weapon
	)
	reagent_mix = RECIPE_REAGENT_REPLACE //Water used up in cooking
	result = /obj/item/reagent_containers/food/snacks/spicedmeatbun // CHOMPEdit - Removal of obj/item/weapon
	result_quantity = 2

/datum/recipe/custardbun
	appliance = OVEN
	reagents = list("spacespice" = 1, "water" = 5, "egg" = 3)
	items = list(
		/obj/item/reagent_containers/food/snacks/doughslice // CHOMPEdit - Removal of obj/item/weapon
	)
	reagent_mix = RECIPE_REAGENT_REPLACE //Water, egg used up in cooking
	result = /obj/item/reagent_containers/food/snacks/custardbun // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/chickenmomo
	appliance = OVEN
	reagents = list("spacespice" = 2, "water" = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/doughslice, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/doughslice, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/doughslice, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/meat/chicken // CHOMPEdit - Removal of obj/item/weapon
	)
	reagent_mix = RECIPE_REAGENT_REPLACE //Simplify end product
	result = /obj/item/reagent_containers/food/snacks/chickenmomo // CHOMPEdit - Removal of obj/item/weapon
	result_quantity = 2

/datum/recipe/veggiemomo
	appliance = OVEN
	reagents = list("spacespice" = 2, "water" = 5)
	fruit = list("carrot" = 1, "cabbage" = 1)
	items = list(
		/obj/item/reagent_containers/food/snacks/doughslice, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/doughslice, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/doughslice // CHOMPEdit - Removal of obj/item/weapon
	)
	reagent_mix = RECIPE_REAGENT_REPLACE //Get that water outta here
	result = /obj/item/reagent_containers/food/snacks/veggiemomo // CHOMPEdit - Removal of obj/item/weapon
	result_quantity = 2
