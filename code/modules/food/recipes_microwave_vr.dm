/*
/datum/recipe/unique_name
	fruit = list("example_fruit1" = 1, "example_fruit2" = 2)
	reagents = list("example_reagent1" = 10, "example_reagent2" = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/meat/imaginary_meat_ingredient, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/meat/this_won't_compile // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/path_to_some_food // CHOMPEdit - Removal of obj/item/weapon
*/
// All of this shit needs to be gone through and reorganized into different recipes per machine - Rykka 7/16/2020

/datum/recipe/sushi
	fruit = list("cabbage" = 1)
	reagents = list("rice" = 20)
	items = list(
		/obj/item/reagent_containers/food/snacks/meat, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/meat, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/meat // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/sliceable/sushi // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/goulash
	fruit = list("tomato" = 1)
	items = list(
		/obj/item/reagent_containers/food/snacks/cutlet, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/spagetti // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/goulash // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/donerkebab
	fruit = list("tomato" = 1, "cabbage" = 1)
	reagents = list("sodiumchloride" = 1)
	items = list(
		/obj/item/reagent_containers/food/snacks/meatsteak, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/sliceable/flatdough // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/donerkebab // CHOMPEdit - Removal of obj/item/weapon


/datum/recipe/roastbeef
	fruit = list("carrot" = 2, "potato" = 2)
	items = list(
		/obj/item/reagent_containers/food/snacks/meat // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/roastbeef // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/reishicup
	reagents = list("psilocybin" = 3, "sugar" = 3)
	items = list(
		/obj/item/reagent_containers/food/snacks/chocolatebar // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/reishicup // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/hotandsoursoup
	fruit = list("cabbage" = 1, "mushroom" = 1)
	reagents = list("sodiumchloride" = 2, "blackpepper" = 2, "water" = 10)
	items = list(
		/obj/item/reagent_containers/food/snacks/tofu // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/hotandsoursoup // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/kitsuneudon
	reagents = list("egg" = 3)
	items = list(
		/obj/item/reagent_containers/food/snacks/spagetti, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/tofu // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/kitsuneudon // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/pillbugball
	reagents = list("carbon" = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/meat/grubmeat // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/bugball // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/mammi
	fruit = list("orange" = 1)
	reagents = list("water" = 10, "flour" = 10, "milk" = 5, "sodiumchloride" = 1)
	result = /obj/item/reagent_containers/food/snacks/mammi // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/makaroni
	reagents = list("flour" = 15, "milk" = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/meat/grubmeat, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/egg, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/cheesewedge, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/cheesewedge // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/makaroni // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/carpsushi
	fruit = list("cabbage" = 1)
	reagents = list("rice" = 20)
	items = list(
		/obj/item/reagent_containers/food/snacks/carpmeat, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/carpmeat, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/carpmeat // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/sliceable/sushi // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/lobster
	fruit = list("lemon" = 1, "lettuce" = 1)
	items = list(
		/obj/item/reagent_containers/food/snacks/lobster // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/lobstercooked // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/cuttlefish
	items = list(
		/obj/item/reagent_containers/food/snacks/cuttlefish // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/cuttlefishcooked // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/monkfish
	fruit = list("chili" = 1, "onion" = 1)
	items = list(
		/obj/item/reagent_containers/food/snacks/monkfishfillet // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/monkfishcooked // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/sharksteak
	reagents = list("blackpepper"= 1, "sodiumchloride" = 1)
	items = list(
		/obj/item/reagent_containers/food/snacks/carpmeat/fish/sharkmeat // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/sharkmeatcooked // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/sharkdip
	reagents = list("sodiumchloride" = 1)
	fruit = list("chili" = 1)
	items = list(
		/obj/item/reagent_containers/food/snacks/carpmeat/fish/sharkmeat // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/sharkmeatdip // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/sharkcubes
	reagents = list("soysauce" = 5, "sodiumchloride" = 1)
	fruit = list("potato" = 1)
	items = list(
		/obj/item/reagent_containers/food/snacks/carpmeat/fish/sharkmeat // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/sharkmeatcubes // CHOMPEdit - Removal of obj/item/weapon

//// food cubes

/datum/recipe/foodcubes
	reagents = list("enzyme" = 20, "virusfood" = 5, "nutriment" = 15, "protein" = 15) // labor intensive
	items = list()
	result = /obj/item/storage/box/wings/tray // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/bucket
	fruit = list("durian" = 1)
	items = list(
		/obj/item/reagent_containers/food/snacks/meat, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/meat, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/meat, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/meat // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/storage/box/wings/bucket // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/grub_pink
	fruit = list("cherries" = 1)
	items = list(
		/obj/item/reagent_containers/food/snacks/grub // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/grub_pink // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/grub_blue
	fruit = list("berries" = 1)
	items = list(
		/obj/item/reagent_containers/food/snacks/grub // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/grub_blue // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/grub_purple
	fruit = list("grapes" = 1)
	items = list(
		/obj/item/reagent_containers/food/snacks/grub // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/grub_purple // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/honey_candy
	reagents = list("sugar" = 5, "nutriment" = 5)
	items = list()
	result = /obj/item/reagent_containers/food/snacks/honey_candy // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/altevian_steak
	items = list(
		/obj/item/reagent_containers/food/snacks/ratprotein, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/ratveggies, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/ratliquid // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/ratsteak // CHOMPEdit - Removal of obj/item/weapon
