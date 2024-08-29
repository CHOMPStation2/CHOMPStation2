/obj/item/reagent_containers/food/drinks/glass2/fitnessflask/proteanshake // CHOMPEdit - Removal of obj/item/weapon
	name = "protean shake"
	icon = 'icons/obj/drinks.dmi'
	icon_state = "protean_shake"
	base_icon = "protean_shake"
	desc = "A strangely unlabeled, unbranded pre-workout drink carton."

/obj/item/reagent_containers/food/drinks/glass2/fitnessflask/proteanshake/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	cut_overlays()
	reagents.add_reagent("liquid_protean", 50)
	reagents.add_reagent("nutriment", 50)

/obj/item/reagent_containers/food/drinks/glass2/fitnessflask/proteanshake/update_icon() // CHOMPEdit - Removal of obj/item/weapon
	return