	//Imported food from old code
/datum/recipe/sauerkraut
	reagents = list("sodiumchloride" = 3)
	fruit = list("cabbage" = 1)
	result = /obj/item/weapon/reagent_containers/food/snacks/sauerkraut

/datum/recipe/tamales
	reagents = list("sodiumchloride" = 3, "water" = 5)
	fruit = list("corn" = 1, "chili" = 1, "potato" = 1)
	items = list(
		/obj/item/weapon/reagent_containers/food/snacks/doughslice,
		/obj/item/weapon/reagent_containers/food/snacks/doughslice,
		/obj/item/weapon/reagent_containers/food/snacks/doughslice,
		/obj/item/weapon/reagent_containers/food/snacks/meat
	)
	result = /obj/item/weapon/reagent_containers/food/snacks/tamales

/datum/recipe/tamales
	reagents = list("sodiumchloride" = 3, "water" = 5)
	fruit = list("corn" = 1, "chili" = 1, "potato" = 1)
	items = list(
		/obj/item/weapon/reagent_containers/food/snacks/doughslice,
		/obj/item/weapon/reagent_containers/food/snacks/doughslice,
		/obj/item/weapon/reagent_containers/food/snacks/doughslice,
		/obj/item/weapon/reagent_containers/food/snacks/meat
	)
	result = /obj/item/weapon/reagent_containers/food/snacks/tamales

/datum/recipe/bigos
	reagents = list("flour" = 5, "water" = 5)
	fruit = list("onion" = 1, "carrot" = 1, "mushroom" = 1)
	items = list(
		/obj/item/weapon/reagent_containers/food/snacks/sauerkraut,
		/obj/item/weapon/reagent_containers/food/snacks/sausage
	)
	result = /obj/item/weapon/reagent_containers/food/snacks/bigos

/datum/recipe/concha
	reagents = list("flour" = 5, "sugar" = 5, "berryjuice" = 5)
	items = list(
		/obj/item/weapon/reagent_containers/food/snacks/egg
	)
	result = /obj/item/weapon/reagent_containers/food/snacks/concha

/datum/recipe/pandenata
	reagents = list("sugar" = 10, "cream" = 5)
	items = list(
		/obj/item/weapon/reagent_containers/food/snacks/doughslice,
		/obj/item/weapon/reagent_containers/food/snacks/doughslice,
		/obj/item/weapon/reagent_containers/food/snacks/doughslice,
		/obj/item/weapon/reagent_containers/food/snacks/egg
	)
	result = /obj/item/weapon/reagent_containers/food/snacks/pandenata

/datum/recipe/tocino
	reagents = list("sodiumchloride" = 5, "wine" = 5, "sugar" = 5)
	items = list(
		/obj/item/weapon/reagent_containers/food/snacks/rawcutlet
	)
	result = /obj/item/weapon/reagent_containers/food/snacks/tocino

/datum/recipe/garlicbread
	reagents = list("sodiumchloride" = 2, "blackpepper" = 2)
	fruit = list("onion" = 1)
	items = list(
		/obj/item/weapon/reagent_containers/food/snacks/cheesewedge,
		/obj/item/weapon/reagent_containers/food/snacks/slice/bread,
		/obj/item/weapon/reagent_containers/food/snacks/slice/bread
	)
	result = /obj/item/weapon/reagent_containers/food/snacks/garlicbread
	
/datum/recipe/steamtealeaf
	reagents = list("water" = 5)
	fruit = list("tea" = 1)

	result = /obj/item/weapon/reagent_containers/food/snacks/steamtealeaf

/datum/recipe/greentealeaf //TODO: Figure out how to make this recipe with a drying rack.
	items = list(
		/obj/item/weapon/reagent_containers/food/snacks/steamrolltealeaf
	)
	result = /obj/item/weapon/reagent_containers/food/snacks/greentealeaf