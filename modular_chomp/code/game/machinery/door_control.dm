/obj/machinery/button/remote/blast_door/single_use
	name = "single use button"
	var/has_been_pressed = FALSE

/obj/machinery/button/remote/blast_door/single_use/attack_hand(mob/user as mob)
	if(has_been_pressed)
		to_chat(user,span_notice("Nothing happens."))
		return
	. = ..()

/obj/machinery/button/remote/blast_door/single_use/trigger()
	has_been_pressed = TRUE
	update_icon()
	..()


/obj/machinery/button/remote/blast_door/single_use/slab
	name = "Button Slab Parent"
	icon = 'modular_chomp/icons/obj/stationobjs.dmi'
	icon_state = "slab1-off"
	use_power = USE_POWER_OFF

/obj/machinery/button/remote/blast_door/single_use/slab/attack_hand(mob/user as mob)
	. = ..()
	to_chat(user,span_notice("You hear a heavy mechanism open somewhere in the distance."))
	icon_state = "slab1"

/obj/machinery/button/remote/blast_door/single_use/slab/update_icon()
	return

/obj/machinery/button/remote/blast_door/single_use/slab/slab1
	name = "Button Slab 1"
	icon_state = "slab1-off"

/obj/machinery/button/remote/blast_door/single_use/slab/slab1/attack_hand(mob/user as mob)
	. = ..()
	icon_state = "slab1"

/obj/machinery/button/remote/blast_door/single_use/slab/slab2
	name = "Button Slab 2"
	icon_state = "slab2-off"

/obj/machinery/button/remote/blast_door/single_use/slab/slab2/attack_hand(mob/user as mob)
	. = ..()
	icon_state = "slab2"

/obj/machinery/button/remote/blast_door/single_use/slab/slab3
	name = "Button Slab 3"
	icon_state = "slab3-off"

/obj/machinery/button/remote/blast_door/single_use/slab/slab3/attack_hand(mob/user as mob)
	. = ..()
	icon_state = "slab3"

/obj/machinery/button/remote/blast_door/single_use/slab/slab4
	name = "Button Slab 4"
	icon_state = "slab4-off"

/obj/machinery/button/remote/blast_door/single_use/slab/slab4/attack_hand(mob/user as mob)
	. = ..()
	icon_state = "slab4"
