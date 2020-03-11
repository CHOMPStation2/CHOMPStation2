/obj/item/weapon/reagent_containers/food/drinks/bottle/snaps
	name = "Akvavit"
	desc = "This could go well with lunch."
	icon_state = "snapsbottle"
	center_of_mass = list("x"=17, "y"=3)

/obj/item/weapon/reagent_containers/food/drinks/bottle/snaps/Initialize()
	. = ..()
	reagents.add_reagent("snaps", 100)