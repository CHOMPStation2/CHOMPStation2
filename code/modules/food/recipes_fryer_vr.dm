/datum/recipe/generalschicken
	appliance = FRYER
	reagents = list("capsaicin" = 2, "sugar" = 2, "batter" = 10)
	items = list(
		/obj/item/reagent_containers/food/snacks/meat,
		/obj/item/reagent_containers/food/snacks/meat
	)
	result = /obj/item/reagent_containers/food/snacks/generalschicken

/datum/recipe/chickenwings
	appliance = FRYER
	reagents = list("capsaicin" = 5, "batter" = 10)
	items = list(
		/obj/item/reagent_containers/food/snacks/meat,
		/obj/item/reagent_containers/food/snacks/meat,
		/obj/item/reagent_containers/food/snacks/meat,
		/obj/item/reagent_containers/food/snacks/meat
	)
	result = /obj/item/storage/box/wings //This is kinda like the donut box.

<<<<<<< HEAD
//CHOMP remove start
/*/datum/recipe/chickenwings
*	appliance = FRYER
*	items = list(
*		/obj/item/weapon/reagent_containers/food/snacks/meat,
*		/obj/item/weapon/reagent_containers/food/snacks/meat,
*		/obj/item/weapon/reagent_containers/food/snacks/meat,
*		/obj/item/weapon/reagent_containers/food/snacks/meat
*	)
*	result = /obj/item/weapon/reagent_containers/food/snacks/generalschicken
*CHOMP remove end */
=======
/datum/recipe/chickenwings
	appliance = FRYER
	items = list(
		/obj/item/reagent_containers/food/snacks/meat,
		/obj/item/reagent_containers/food/snacks/meat,
		/obj/item/reagent_containers/food/snacks/meat,
		/obj/item/reagent_containers/food/snacks/meat
	)
	result = /obj/item/reagent_containers/food/snacks/generalschicken
>>>>>>> 55942407f2... Merge pull request #16327 from TheCaramelion/weapon-removal

/datum/recipe/locust
	appliance = FRYER
	reagents = list("sodiumchloride" = 1)
	items = list(
		/obj/item/reagent_containers/food/snacks/locust
	)
<<<<<<< HEAD
	result = /obj/item/weapon/reagent_containers/food/snacks/locust_cooked
=======
	result = /obj/item/reagent_containers/food/snacks/locust_cooked
>>>>>>> 55942407f2... Merge pull request #16327 from TheCaramelion/weapon-removal
