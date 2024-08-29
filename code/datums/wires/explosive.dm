/datum/wires/explosive
	wire_count = 1
	proper_name = "Explosive wires"

/datum/wires/explosive/New(atom/_holder)
	wires = list(WIRE_EXPLODE)
	return ..()

/datum/wires/explosive/proc/explode()
	return

/datum/wires/explosive/on_pulse(wire)
	switch(wire)
		if(WIRE_EXPLODE)
			explode()

/datum/wires/explosive/on_cut(wire, mend)
	switch(wire)
		if(WIRE_EXPLODE)
			if(!mend)
				explode()

/datum/wires/explosive/c4
	holder_type = /obj/item/plastique // CHOMPEdit - Removal of obj/item/weapon

/datum/wires/explosive/c4/interactable(mob/user)
	var/obj/item/plastique/P = holder // CHOMPEdit - Removal of obj/item/weapon
	if(P.open_panel)
		return TRUE
	return FALSE

/datum/wires/explosive/c4/explode()
	var/obj/item/plastique/P = holder // CHOMPEdit - Removal of obj/item/weapon
	P.explode(get_turf(P))
