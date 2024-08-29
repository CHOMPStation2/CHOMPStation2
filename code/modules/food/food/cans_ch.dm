/obj/item/reagent_containers/food/drinks/cans/waterbottle/wataur // CHOMPEdit - Removal of obj/item/weapon
	name = "bottled wataur"
	desc = "Double it's size and double it's grip, this bottle is as mean and large as a taur itself."
	icon = 'icons/obj/food_ch.dmi'
	icon_state = "wataur"
	volume = 150
	drop_sound = 'sound/items/drop/food.ogg'

/obj/item/reagent_containers/food/drinks/cans/waterbottle/wataur/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	reagents.add_reagent("water", 120)