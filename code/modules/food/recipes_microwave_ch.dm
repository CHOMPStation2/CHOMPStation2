	//Imported food from old code
/datum/recipe/sauerkraut
	reagents = list("sodiumchloride" = 3)
	fruit = list("cabbage" = 1)
	result = /obj/item/reagent_containers/food/snacks/sauerkraut

/datum/recipe/tamales
	fruit = list("corn" = 1)
	items = list(
		/obj/item/reagent_containers/food/snacks/doughslice,
		/obj/item/reagent_containers/food/snacks/doughslice,
		/obj/item/reagent_containers/food/snacks/doughslice,
		/obj/item/reagent_containers/food/snacks/meat
	)
	result = /obj/item/reagent_containers/food/snacks/tamales

/datum/recipe/bigos
	reagents = list("flour" = 5, "water" = 5)
	fruit = list("onion" = 1)
	items = list(
		/obj/item/reagent_containers/food/snacks/sauerkraut,
		/obj/item/reagent_containers/food/snacks/sausage
	)
	result = /obj/item/reagent_containers/food/snacks/bigos

/datum/recipe/concha
	reagents = list("berryjuice" = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/dough,
		/obj/item/reagent_containers/food/snacks/egg
	)
	result = /obj/item/reagent_containers/food/snacks/concha

/datum/recipe/pandenata
	reagents = list("sugar" = 10, "cream" = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/doughslice,
		/obj/item/reagent_containers/food/snacks/doughslice,
		/obj/item/reagent_containers/food/snacks/doughslice
	)
	result = /obj/item/reagent_containers/food/snacks/pandenata

/datum/recipe/tocino
	reagents = list("sodiumchloride" = 5, "redwine" = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/rawcutlet
	)
	result = /obj/item/reagent_containers/food/snacks/tocino

/datum/recipe/garlicbread
	fruit = list("onion" = 1)
	items = list(
		/obj/item/reagent_containers/food/snacks/cheesewedge,
		/obj/item/reagent_containers/food/snacks/slice/bread
	)
	result = /obj/item/reagent_containers/food/snacks/garlicbread

/datum/recipe/plumpburger
	fruit = list("plumphelmet" = 1)
	items = list(
		/obj/item/reagent_containers/food/snacks/cheesewedge,
		/obj/item/reagent_containers/food/snacks/bun
	)
	result = /obj/item/reagent_containers/food/snacks/plumpburger

/datum/recipe/wataur
	reagents = list("water" = 100)
	result = /obj/item/reagent_containers/food/drinks/cans/waterbottle/wataur

/datum/recipe/bigbeanburrito
	fruit = list("soybeans" = 3)
	items = list(
	/obj/item/reagent_containers/food/snacks/meatburrito,
	/obj/item/reagent_containers/food/snacks/rawcutlet,
	/obj/item/reagent_containers/food/snacks/cheesewedge
	)
	result = /obj/item/reagent_containers/food/snacks/slice/bigbeanburrito

/datum/recipe/supremoburrito
	fruit = list("soybeans" = 3, "chili" = 1)
	items = list(
	/obj/item/reagent_containers/food/snacks/slice/bigbeanburrito,
	/obj/item/reagent_containers/food/snacks/sliceable/cheesewheel,
	/obj/item/reagent_containers/food/snacks/tortilla,
	/obj/item/reagent_containers/food/snacks/meat
	)
	result = /obj/item/reagent_containers/food/snacks/sliceable/supremoburrito

/datum/recipe/steamtealeaf
	reagents = list("water" = 5)
	fruit = list("tea" = 1)

	result = /obj/item/reagent_containers/food/snacks/steamtealeaf

/datum/recipe/greentealeaf //TODO: Figure out how to make this recipe with a drying rack.
	items = list(
		/obj/item/reagent_containers/food/snacks/steamrolltealeaf
	)
	result = /obj/item/reagent_containers/food/snacks/greentealeaf

/datum/recipe/butterscotch
	reagents = list("sugar" = 10, "cream" = 5)
	reagent_mix = RECIPE_REAGENT_REPLACE //No actual reagents since it's meant to be a cooking item
	items = list(
		/obj/item/reagent_containers/food/snacks/spreads/butter
	)
	result = /obj/item/reagent_containers/food/snacks/butterscotch
	result_quantity = 2

/datum/recipe/hotbuttericecream
	reagents = list("ice" = 5, "cream" = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/spreads/butter
	)
	result = /obj/item/reagent_containers/food/snacks/hotbuttericecream
