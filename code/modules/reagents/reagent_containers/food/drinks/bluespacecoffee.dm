/obj/item/weapon/reagent_containers/food/drinks/bluespace_coffee
	name = "bluespace coffee"
	desc = "This revolutionary device is always full of hot 'coffee'; no one knows where it comes from..."
	icon = 'icons/obj/coffee.dmi'
	icon_state = "bluespace_coffee"
	center_of_mass = list("x"=15, "y"=10)
	volume = 50
	New()
		..()
		reagents.add_reagent("coffee", 50)

	//Infinite Coffee
	attack(mob/M as mob, mob/user as mob, def_zone)
		..()
		src.reagents.add_reagent("coffee", 50)