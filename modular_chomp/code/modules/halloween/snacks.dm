/obj/item/reagent_containers/food/snacks/egg/rotten
	name = "rotten egg"
	desc = "A rotten egg. It stinks!"

/obj/item/reagent_containers/food/snacks/egg/rotten/Initialize(mapload)
	. = ..()
	reagents.add_reagent(REAGENT_ID_TOXIN, 3)

/obj/item/storage/fancy/egg_box/rotten
	starts_with = list(/obj/item/reagent_containers/food/snacks/egg/rotten = 12)
