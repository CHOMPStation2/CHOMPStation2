/datum/recipe/buttspie
	appliance = OVEN
	reagents = list("cinnamonpowder" = 10)
	items = list(
		/obj/item/weapon/reagent_containers/food/snacks/butterscotch,
		/obj/item/weapon/reagent_containers/food/snacks/sliceable/flatdough
	)
	result = /obj/item/weapon/reagent_containers/food/snacks/slicable/buttspie

/datum/recipe/cinnamon_roll
	appliance = OVEN
	reagents = list("cinnamonpowder" = 5, "sugar" = 10)
	items = list(
		/obj/item/weapon/reagent_containers/food/snacks/dough,
		/obj/item/weapon/reagent_containers/food/snacks/spreads/butter
	)
	result = /obj/item/weapon/reagent_containers/food/snacks/cinnamonroll

/datum/recipe/spicy_boys
	appliance = OVEN
	reagents = list("cinnamonpowder" = 5, "sugar" = 10, "cornoil" = 10)
	result = /obj/item/weapon/reagent_containers/food/snacks/spicy_boys
	result_quantity = 6