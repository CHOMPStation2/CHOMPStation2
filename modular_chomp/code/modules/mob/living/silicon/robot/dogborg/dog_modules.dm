/obj/item/device/robot_tongue/examine(user)
	. = ..()
	if(Adjacent(user))
		if(water.energy)
			. += "<span class='notice'>[src] is wet. Just like it should be.</span>"
		if(water.energy < 5)
			. += "<span class='notice'>[src] is dry.</span>"
