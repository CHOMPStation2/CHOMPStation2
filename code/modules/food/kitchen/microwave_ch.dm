/***********************************
*   CHOMP advanced microwave
************************************/


/obj/machinery/microwave/advanced
	name = "deluxe microwave"
	icon = 'icons/obj/machines/machinery_ch.dmi'
	circuit = /obj/item/circuitboard/microwave/advanced
	circuit_item_capacity = 100
	item_level = 1

/obj/machinery/microwave/advanced/Initialize(mapload)
	. = ..()
	reagents.maximum_volume = 1000
