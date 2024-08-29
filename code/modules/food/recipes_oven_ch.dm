/datum/recipe/buttspie
	appliance = OVEN
	reagents = list("cinnamonpowder" = 10)
	items = list(
		/obj/item/reagent_containers/food/snacks/butterscotch, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/sliceable/flatdough // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/slicable/buttspie // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/cinnamon_roll
	appliance = OVEN
	reagents = list("cinnamonpowder" = 5, "sugar" = 10)
	items = list(
		/obj/item/reagent_containers/food/snacks/dough, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/spreads/butter // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/cinnamonroll // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/spicy_boys //TODO: Possibly see if recipe can be in the candymaker?
	appliance = OVEN
	reagents = list("cinnamonpowder" = 5, "sugar" = 10, "cornoil" = 10)
	result = /obj/item/reagent_containers/food/snacks/spicy_boys // CHOMPEdit - Removal of obj/item/weapon
	result_quantity = 6

/datum/recipe/welders_original //TODO: Possibly see if recipe can be in the candymaker?
	appliance = OVEN
	reagents = list("sugar" = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/butterscotch // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/welders_original // CHOMPEdit - Removal of obj/item/weapon
	result_quantity = 6

/datum/recipe/blondies
	appliance = OVEN
	reagents = list("blondiemix" = 10, "egg" = 3)
	reagent_mix = RECIPE_REAGENT_REPLACE //No egg or mix in final recipe
	result = /obj/item/reagent_containers/food/snacks/sliceable/blondies // CHOMPEdit - Removal of obj/item/weapon
