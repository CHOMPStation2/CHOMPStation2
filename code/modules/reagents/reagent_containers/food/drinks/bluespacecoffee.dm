/obj/item/reagent_containers/food/drinks/bluespace_coffee // CHOMPEdit - Removal of obj/item/weapon
	name = "bluespace coffee"
	desc = "Dreamt up in a strange feverish dream, this coffee cup seems to have been heavily modified with a variety of unlikely parts and wires, and never seems to run out of coffee. Truly the differance between madmen and genius is success."
	icon = 'icons/obj/coffee.dmi'
	icon_state = "bluespace_coffee"
	center_of_mass_x = 15 //CHOMPEdit
	center_of_mass_y= 10 //CHOMPEdit
	volume = 50

/obj/item/reagent_containers/food/drinks/bluespace_coffee/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	..()
	reagents.add_reagent("coffee", 50)

	//Infinite Coffee
/obj/item/reagent_containers/food/drinks/bluespace_coffee/attack(mob/M as mob, mob/user as mob, def_zone) // CHOMPEdit - Removal of obj/item/weapon
	..()
	src.reagents.add_reagent("coffee", 50)
