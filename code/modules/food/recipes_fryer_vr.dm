/datum/recipe/generalschicken
	appliance = FRYER
	reagents = list("capsaicin" = 2, "sugar" = 2, "batter" = 10)
	items = list(
		/obj/item/reagent_containers/food/snacks/meat, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/meat // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/generalschicken // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/chickenwings
	appliance = FRYER
	reagents = list("capsaicin" = 5, "batter" = 10)
	items = list(
		/obj/item/reagent_containers/food/snacks/meat, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/meat, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/meat, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/meat // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/storage/box/wings //This is kinda like the donut box. // CHOMPEdit - Removal of obj/item/weapon

//CHOMP remove start
/*/datum/recipe/chickenwings
*	appliance = FRYER
*	items = list(
*		/obj/item/reagent_containers/food/snacks/meat, // CHOMPEdit - Removal of obj/item/weapon
*		/obj/item/reagent_containers/food/snacks/meat, // CHOMPEdit - Removal of obj/item/weapon
*		/obj/item/reagent_containers/food/snacks/meat, // CHOMPEdit - Removal of obj/item/weapon
*		/obj/item/reagent_containers/food/snacks/meat // CHOMPEdit - Removal of obj/item/weapon
*	)
*	result = /obj/item/reagent_containers/food/snacks/generalschicken // CHOMPEdit - Removal of obj/item/weapon
*CHOMP remove end */

/datum/recipe/locust
	appliance = FRYER
	reagents = list("sodiumchloride" = 1)
	items = list(
		/obj/item/reagent_containers/food/snacks/locust // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/locust_cooked // CHOMPEdit - Removal of obj/item/weapon
