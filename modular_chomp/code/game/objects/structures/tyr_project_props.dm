/obj/structure/prop/blackbox/tyr_precursor_a
	catalogue_data = list(/datum/category_item/catalogue/information/blackbox/tyr_precursor_a)

/datum/category_item/catalogue/information/blackbox/tyr_precursor_a

/obj/structure/prop/blackbox/tyr_precursor_b
	catalogue_data = list(/datum/category_item/catalogue/information/blackbox/tyr_precursor_b)

/datum/category_item/catalogue/information/blackbox/tyr_precursor_b

/obj/structure/prop/blackbox/tyr_precursor_c
	catalogue_data = list(/datum/category_item/catalogue/information/blackbox/tyr_precursor_c)

/datum/category_item/catalogue/information/blackbox/tyr_precursor_c

//oooh, shiny
/obj/structure/prop/tyr_elevator //This won't function for a while, if ever
	name = "odd elevator"
	desc = "A strange metal cylandir. Seems sealed shut."
	icon = 'modular_chomp/icons/obj/tribal_gear.dmi'
	icon_state = "elevator"
	anchored = TRUE

/obj/machinery/door/blast/puzzle/tyrdoor
	name = "strange door"
	icon = 'modular_chomp/icons/obj/weather_ruins.dmi'

/obj/machinery/door/blast/puzzle/tyrdoor
	name = "strange door"
	icon = 'modular_chomp/icons/obj/weather_ruins.dmi'
	icon_state_open = "open_door"
	icon_state_closed = "star_door"
	icon_state = "star_door"

/obj/machinery/door/blast/puzzle/tyrdoor/finale
	name = "strange door"
	desc = "A strange door. With no way to open it, they will remain shut for quite some time.."
	icon_state_closed = "final_door"