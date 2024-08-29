/obj/machinery/power/smes/batteryrack/mapped
	var/cell_type = /obj/item/cell/apc // CHOMPEdit - Removal of obj/item/weapon
	var/cell_number = 3

/obj/machinery/power/smes/batteryrack/mapped/Initialize()
	. = ..()
	for(var/i = 1 to cell_number)
		if(i > max_cells)
			break
		var/obj/item/cell/newcell = new cell_type(src.loc) // CHOMPEdit - Removal of obj/item/weapon
		insert_cell(newcell)

/obj/item/module/power_control/attackby(var/obj/item/I, var/mob/user) // CHOMPEdit - Removal of obj/item/weapon
	if(I.has_tool_quality(TOOL_MULTITOOL))
		to_chat(user, SPAN_NOTICE("You begin tweaking the power control circuits to support a power cell rack."))
		if(do_after(user, 50 * I.toolspeed))
			var/obj/item/newcircuit = new/obj/item/circuitboard/batteryrack(get_turf(user)) // CHOMPEdit - Removal of obj/item/weapon
			qdel(src)
			user.put_in_hands(newcircuit)
			return
	return ..()
