/obj/structure/reagent_dispensers/space_cleaner
	name = "Space Cleaner Dispenser"
	desc = "A dispenser of space cleaner, every janitor's dream!"
	icon = 'icons/obj/objects.dmi'
	icon_state = "virusfoodtank"
	amount_per_transfer_from_this = 60
	anchored = 1

/obj/structure/reagent_dispensers/space_cleaner/Initialize(mapload)
	. = ..()
	reagents.add_reagent(REAGENT_ID_CLEANER, 1000)
