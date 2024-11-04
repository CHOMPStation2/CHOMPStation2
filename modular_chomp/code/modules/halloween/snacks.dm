/obj/item/reagent_containers/food/snacks/egg/rotten
	name = "rotten egg"
	desc = "A rotten egg. It stinks!"

/obj/item/reagent_containers/food/snacks/egg/rotten/Initialize()
	. = ..()
	reagents.add_reagent("toxin", 3)

/obj/item/storage/fancy/egg_box/rotten
	starts_with = list(/obj/item/reagent_containers/food/snacks/egg/rotten = 12)
