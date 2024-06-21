/obj/machinery/button/remote/blast_door/single_use
	name = "single use button"
	var/has_been_pressed = FALSE

/obj/machinery/button/remote/blast_door/single_use/attack_hand(mob/user as mob)
	if(has_been_pressed)
		to_chat(user,"<span class='notice'>Nothing happens.</span>")
		return
	. = ..()

/obj/machinery/button/remote/blast_door/single_use/trigger()
	has_been_pressed = TRUE
	..()
