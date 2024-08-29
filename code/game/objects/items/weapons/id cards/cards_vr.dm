/obj/item/card/emag/examine(mob/user) // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	. += "[uses] uses remaining."

/obj/item/card/emag/used // CHOMPEdit - Removal of obj/item/weapon
	uses = 1

/obj/item/card/emag/used/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	uses = rand(1, 5)
