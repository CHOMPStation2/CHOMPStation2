/obj/structure/event/present
	name = "decorative present"
	desc = "A gift! What cou- oh, it's made of plastic.."
	icon = 'icons/obj/items_ch.dmi'
	icon_state = "gift1_g"

	var/chaos = "I can do anything!"
	anchored = 1.0
	density = 0

/obj/structure/event/present/New()
	..()
	pixel_x = rand(-10,10)
	pixel_y = rand(-10,10)
	icon_state = "gift[pick("1", "2", "3")]_[pick("g", "r", "b", "y", "p")]"
	return