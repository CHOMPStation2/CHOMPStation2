/datum/recipe/fries
	appliance = FRYER
	items = list(
		/obj/item/reagent_containers/food/snacks/rawsticks // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/fries // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/cheesyfries
	appliance = FRYER
	items = list(
		/obj/item/reagent_containers/food/snacks/fries, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/cheesewedge, // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/cheesyfries // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/jpoppers
	appliance = FRYER
	fruit = list("chili" = 1)
	coating = /datum/reagent/nutriment/coating/batter
	result = /obj/item/reagent_containers/food/snacks/jalapeno_poppers // CHOMPEdit - Removal of obj/item/weapon
	result_quantity = 2

/datum/recipe/risottoballs
	appliance = FRYER
	reagents = list("sodiumchloride" = 1, "blackpepper" = 1)
	items = list(/obj/item/reagent_containers/food/snacks/risotto) // CHOMPEdit - Removal of obj/item/weapon
	coating = /datum/reagent/nutriment/coating/batter
	reagent_mix = RECIPE_REAGENT_REPLACE //Simplify end product
	result = /obj/item/reagent_containers/food/snacks/risottoballs // CHOMPEdit - Removal of obj/item/weapon
	result_quantity = 2

/datum/recipe/bellefritter
	appliance = FRYER
	coating = /datum/reagent/nutriment/coating/batter
	reagents = list("sugar" = 5)
	items = list(/obj/item/reagent_containers/food/snacks/frostbelle) // CHOMPEdit - Removal of obj/item/weapon
	result = /obj/item/reagent_containers/food/snacks/bellefritter // CHOMPEdit - Removal of obj/item/weapon
	result_quantity = 2

/datum/recipe/onionrings
	appliance = FRYER
	coating = /datum/reagent/nutriment/coating/batter
	fruit = list("onion" = 1)
	result = /obj/item/reagent_containers/food/snacks/onionrings // CHOMPEdit - Removal of obj/item/weapon
	result_quantity = 2

//Meaty Recipes
//====================
/datum/recipe/cubancarp
	appliance = FRYER
	fruit = list("chili" = 1)
	items = list(
		/obj/item/reagent_containers/food/snacks/dough, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/carpmeat // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/cubancarp // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/batteredsausage
	appliance = FRYER
	items = list(
		/obj/item/reagent_containers/food/snacks/sausage // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/sausage/battered // CHOMPEdit - Removal of obj/item/weapon
	coating = /datum/reagent/nutriment/coating/batter


/datum/recipe/katsu
	appliance = FRYER
	items = list(
		/obj/item/reagent_containers/food/snacks/meat/chicken // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/chickenkatsu // CHOMPEdit - Removal of obj/item/weapon
	coating = /datum/reagent/nutriment/coating/beerbatter


/datum/recipe/pizzacrunch_1
	appliance = FRYER
	items = list(
		/obj/item/reagent_containers/food/snacks/sliceable/pizza // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/sliceable/pizza/crunch // CHOMPEdit - Removal of obj/item/weapon
	coating = /datum/reagent/nutriment/coating/batter

//Alternate pizza crunch recipe for combination pizzas made in oven
/datum/recipe/pizzacrunch_2
	appliance = FRYER
	items = list(
		/obj/item/reagent_containers/food/snacks/variable/pizza // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/sliceable/pizza/crunch // CHOMPEdit - Removal of obj/item/weapon
	coating = /datum/reagent/nutriment/coating/batter

/datum/recipe/friedmushroom
	appliance = FRYER
	fruit = list("plumphelmet" = 1)
	coating = /datum/reagent/nutriment/coating/beerbatter
	reagent_mix = RECIPE_REAGENT_REPLACE //Simplify end product
	result = /obj/item/reagent_containers/food/snacks/friedmushroom // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/fishfingers
	items = list(
		/obj/item/reagent_containers/food/snacks/carpmeat, // CHOMPEdit - Removal of obj/item/weapon
	)
	coating = /datum/reagent/nutriment/coating/batter
	result = /obj/item/reagent_containers/food/snacks/fishfingers // CHOMPEdit - Removal of obj/item/weapon
	reagent_mix = RECIPE_REAGENT_REPLACE

/datum/recipe/corn_dog
	appliance = FRYER
	items = list(
		/obj/item/reagent_containers/food/snacks/sausage // CHOMPEdit - Removal of obj/item/weapon
	)
	fruit = list("corn" = 1)
	coating = /datum/reagent/nutriment/coating/batter
	result = /obj/item/reagent_containers/food/snacks/corn_dog // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/sweet_and_sour
	appliance = FRYER
	items = list(
		/obj/item/reagent_containers/food/snacks/bacon, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/cutlet // CHOMPEdit - Removal of obj/item/weapon
	)
	reagents = list("soysauce" = 5, "batter" = 10)
	result = /obj/item/reagent_containers/food/snacks/sweet_and_sour // CHOMPEdit - Removal of obj/item/weapon

//Sweet Recipes.
//==================
// All donuts were given reagents of 5 to equal old recipes and make for faster cook times.
/datum/recipe/jellydonut
	appliance = FRYER
	reagents = list("berryjuice" = 5, "sugar" = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/doughslice // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/donut/plain/jelly // CHOMPEdit - Removal of obj/item/weapon
	result_quantity = 2

/datum/recipe/jellydonut/poisonberry
	reagents = list("poisonberryjuice" = 5, "sugar" = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/dough // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/donut/plain/jelly/poisonberry // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/jellydonut/slime // Subtypes of jellydonut, appliance inheritance applies.
	reagents = list("slimejelly" = 5, "sugar" = 5)
	result = /obj/item/reagent_containers/food/snacks/donut/plain/jelly/slimejelly // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/jellydonut/cherry // Subtypes of jellydonut, appliance inheritance applies.
	reagents = list("cherryjelly" = 5, "sugar" = 5)
	result = /obj/item/reagent_containers/food/snacks/donut/plain/jelly/cherryjelly // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/donut
	appliance = FRYER
	reagents = list("sugar" = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/doughslice // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/donut/plain // CHOMPEdit - Removal of obj/item/weapon
	result_quantity = 2

/datum/recipe/chaosdonut
	appliance = FRYER
	reagents = list("frostoil" = 10, "capsaicin" = 10, "sugar" = 10)
	reagent_mix = RECIPE_REAGENT_REPLACE //This creates its own reagents
	items = list(
		/obj/item/reagent_containers/food/snacks/doughslice // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/donut/chaos // CHOMPEdit - Removal of obj/item/weapon
	result_quantity = 2

/datum/recipe/funnelcake
	appliance = FRYER
	reagents = list("sugar" = 5, "batter" = 10)
	result = /obj/item/reagent_containers/food/snacks/funnelcake // CHOMPEdit - Removal of obj/item/weapon
	result_quantity = 2

/datum/recipe/pisanggoreng
	appliance = FRYER
	fruit = list("banana" = 2)
	reagent_mix = RECIPE_REAGENT_REPLACE //Simplify end product
	result = /obj/item/reagent_containers/food/snacks/pisanggoreng // CHOMPEdit - Removal of obj/item/weapon
	coating = /datum/reagent/nutriment/coating/batter

//VOREStation Add Start
//CHOMP removal start
/*/datum/recipe/generalschicken
*	appliance = FRYER
*	reagents = list("capsaicin" = 2, "sugar" = 2, "batter" = 10)
*	items = list(
*		/obj/item/reagent_containers/food/snacks/meat, // CHOMPEdit - Removal of obj/item/weapon
*		/obj/item/reagent_containers/food/snacks/meat // CHOMPEdit - Removal of obj/item/weapon
*	)
*	result = /obj/item/reagent_containers/food/snacks/generalschicken // CHOMPEdit - Removal of obj/item/weapon
*
/datum/recipe/chickenwings
*	appliance = FRYER
*	reagents = list("capsaicin" = 5, "batter" = 10)
*	items = list(
*		/obj/item/reagent_containers/food/snacks/meat, // CHOMPEdit - Removal of obj/item/weapon
*		/obj/item/reagent_containers/food/snacks/meat, // CHOMPEdit - Removal of obj/item/weapon
*		/obj/item/reagent_containers/food/snacks/meat, // CHOMPEdit - Removal of obj/item/weapon
*		/obj/item/reagent_containers/food/snacks/meat // CHOMPEdit - Removal of obj/item/weapon
*	)
*	result = /obj/item/storage/box/wings //This is kinda like the donut box. // CHOMPEdit - Removal of obj/item/weapon
//VOREStation Add End
Chomp remove end */
