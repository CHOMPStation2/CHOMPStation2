/obj/item/reagent_containers/food/drinks/bottle/snaps
	name = REAGENT_SNAPS
	desc = "This could go well with lunch."
	icon = 'modular_chomp/icons/obj/drinks.dmi'
	icon_state = "snapsbottle"
	center_of_mass_x = 17 //CHOMPEdit
	center_of_mass_y= 3 //CHOMPEdit

/obj/item/reagent_containers/food/drinks/bottle/snaps/Initialize(mapload)
	. = ..()
	reagents.add_reagent(REAGENT_ID_SNAPS, 100)
