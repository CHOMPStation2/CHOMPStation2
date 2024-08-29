	//Imported food from old code
/datum/recipe/sauerkraut
	reagents = list("sodiumchloride" = 3)
	fruit = list("cabbage" = 1)
	result = /obj/item/reagent_containers/food/snacks/sauerkraut // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/tamales
	fruit = list("corn" = 1)
	items = list(
		/obj/item/reagent_containers/food/snacks/doughslice, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/doughslice, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/doughslice, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/meat // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/tamales // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/bigos
	reagents = list("flour" = 5, "water" = 5)
	fruit = list("onion" = 1)
	items = list(
		/obj/item/reagent_containers/food/snacks/sauerkraut, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/sausage // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/bigos // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/concha
	reagents = list("berryjuice" = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/dough, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/egg // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/concha // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/pandenata
	reagents = list("sugar" = 10, "cream" = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/doughslice, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/doughslice, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/doughslice // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/pandenata // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/tocino
	reagents = list("sodiumchloride" = 5, "redwine" = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/rawcutlet // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/tocino // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/garlicbread
	fruit = list("onion" = 1)
	items = list(
		/obj/item/reagent_containers/food/snacks/cheesewedge, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/slice/bread // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/garlicbread // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/plumpburger
	fruit = list("plumphelmet" = 1)
	items = list(
		/obj/item/reagent_containers/food/snacks/cheesewedge, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/bun // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/plumpburger // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/wataur
	reagents = list("water" = 100)
	result = /obj/item/reagent_containers/food/drinks/cans/waterbottle/wataur // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/bigbeanburrito
	fruit = list("soybeans" = 3)
	items = list(
	/obj/item/reagent_containers/food/snacks/meatburrito, // CHOMPEdit - Removal of obj/item/weapon
	/obj/item/reagent_containers/food/snacks/rawcutlet, // CHOMPEdit - Removal of obj/item/weapon
	/obj/item/reagent_containers/food/snacks/cheesewedge // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/slice/bigbeanburrito // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/supremoburrito
	fruit = list("soybeans" = 3, "chili" = 1)
	items = list(
	/obj/item/reagent_containers/food/snacks/slice/bigbeanburrito, // CHOMPEdit - Removal of obj/item/weapon
	/obj/item/reagent_containers/food/snacks/sliceable/cheesewheel, // CHOMPEdit - Removal of obj/item/weapon
	/obj/item/reagent_containers/food/snacks/tortilla, // CHOMPEdit - Removal of obj/item/weapon
	/obj/item/reagent_containers/food/snacks/meat // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/sliceable/supremoburrito // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/steamtealeaf
	reagents = list("water" = 5)
	fruit = list("tea" = 1)

	result = /obj/item/reagent_containers/food/snacks/steamtealeaf // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/greentealeaf //TODO: Figure out how to make this recipe with a drying rack.
	items = list(
		/obj/item/reagent_containers/food/snacks/steamrolltealeaf // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/greentealeaf // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/butterscotch
	reagents = list("sugar" = 10, "cream" = 5)
	reagent_mix = RECIPE_REAGENT_REPLACE //No actual reagents since it's meant to be a cooking item
	items = list(
		/obj/item/reagent_containers/food/snacks/spreads/butter // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/butterscotch // CHOMPEdit - Removal of obj/item/weapon
	result_quantity = 2

/datum/recipe/hotbuttericecream
	reagents = list("ice" = 5, "cream" = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/spreads/butter // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/hotbuttericecream // CHOMPEdit - Removal of obj/item/weapon
