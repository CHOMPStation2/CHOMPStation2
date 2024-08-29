/obj/item/shield_diffuser // CHOMPEdit - Removal of obj/item/weapon
	name = "portable shield diffuser"
	desc = "A small handheld device designed to disrupt energy barriers."
	description_info = "This device disrupts shields on directly adjacent tiles (in a + shaped pattern), in a similar way the floor mounted variant does. It is, however, portable and run by an internal battery. Can be recharged with a regular recharger."
	icon = 'icons/obj/machines/shielding.dmi'
	icon_state = "hdiffuser_off"
	origin_tech = list(TECH_MAGNET = 5, TECH_POWER = 5, TECH_ILLEGAL = 2)
	var/obj/item/cell/device/cell // CHOMPEdit - Removal of obj/item/weapon
	var/enabled = 0


/obj/item/shield_diffuser/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	cell = new(src)

/obj/item/shield_diffuser/Destroy() // CHOMPEdit - Removal of obj/item/weapon
	QDEL_NULL(cell)
	if(enabled)
		STOP_PROCESSING(SSobj, src)
	. = ..()

/obj/item/shield_diffuser/get_cell() // CHOMPEdit - Removal of obj/item/weapon
	return cell

/obj/item/shield_diffuser/process() // CHOMPEdit - Removal of obj/item/weapon
	if(!enabled)
		return PROCESS_KILL

	for(var/direction in cardinal)
		var/turf/simulated/shielded_tile = get_step(get_turf(src), direction)
		for(var/obj/effect/shield/S in shielded_tile)
			// 10kJ per pulse, but gap in the shield lasts for longer than regular diffusers.
			if(istype(S) && !S.diffused_for && !S.disabled_for && cell.checked_use(10 KILOWATTS * CELLRATE))
				S.diffuse(20)
		// Legacy shield support
		for(var/obj/effect/energy_field/S in shielded_tile)
			if(istype(S) && cell.checked_use(10 KILOWATTS * CELLRATE))
				qdel(S)

/obj/item/shield_diffuser/update_icon() // CHOMPEdit - Removal of obj/item/weapon
	if(enabled)
		icon_state = "hdiffuser_on"
	else
		icon_state = "hdiffuser_off"

/obj/item/shield_diffuser/attack_self(mob/user) // CHOMPEdit - Removal of obj/item/weapon
	enabled = !enabled
	update_icon()
	if(enabled)
		START_PROCESSING(SSobj, src)
	else
		STOP_PROCESSING(SSobj, src)
	to_chat(user, "You turn \the [src] [enabled ? "on" : "off"].")

/obj/item/shield_diffuser/examine(mob/user) // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	. += "The charge meter reads [cell ? cell.percent() : 0]%"
	. += "It is [enabled ? "enabled" : "disabled"]."
