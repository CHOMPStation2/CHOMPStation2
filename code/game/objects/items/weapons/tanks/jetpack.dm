//This file was auto-corrected by findeclaration.exe on 25.5.2012 20:42:32

/obj/item/tank/jetpack // CHOMPEdit - Removal of obj/item/weapon
	name = "jetpack (empty)"
	desc = "A tank of compressed gas for use as propulsion in zero-gravity areas. Use with caution."
	icon = 'icons/obj/tank_vr.dmi' //VOREStation Edit
	icon_state = "jetpack"
	gauge_icon = null
	w_class = ITEMSIZE_LARGE
	item_icons = list(
			slot_l_hand_str = 'icons/mob/items/lefthand_storage.dmi',
			slot_r_hand_str = 'icons/mob/items/righthand_storage.dmi',
			)
	item_state_slots = list(slot_r_hand_str = "jetpack", slot_l_hand_str = "jetpack")
	distribute_pressure = ONE_ATMOSPHERE*O2STANDARD
	var/datum/effect/effect/system/ion_trail_follow/ion_trail
	var/on = 0.0
	var/stabilization_on = 0
	var/volume_rate = 500              //Needed for borg jetpack transfer
	action_button_name = "Toggle Jetpack"

/obj/item/tank/jetpack/New() // CHOMPEdit - Removal of obj/item/weapon
	..()
	ion_trail = new /datum/effect/effect/system/ion_trail_follow()
	ion_trail.set_up(src)

/obj/item/tank/jetpack/Destroy() // CHOMPEdit - Removal of obj/item/weapon
	QDEL_NULL(ion_trail)
	return ..()

/obj/item/tank/jetpack/examine(mob/user) // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	if(air_contents.total_moles < 5)
		. += "<span class='danger'>The meter on \the [src] indicates you are almost out of gas!</span>"
		playsound(src, 'sound/effects/alert.ogg', 50, 1)

/obj/item/tank/jetpack/verb/toggle_rockets() // CHOMPEdit - Removal of obj/item/weapon
	set name = "Toggle Jetpack Stabilization"
	set category = "Object"
	stabilization_on = !( stabilization_on )
	to_chat(usr, "You toggle the stabilization [stabilization_on? "on":"off"].")

/obj/item/tank/jetpack/verb/toggle() // CHOMPEdit - Removal of obj/item/weapon
	set name = "Toggle Jetpack"
	set category = "Object"

	on = !on
	if(on)
		icon_state = "[icon_state]-on"
		ion_trail.start()
	else
		icon_state = initial(icon_state)
		ion_trail.stop()

	if (ismob(usr))
		var/mob/M = usr
		M.update_inv_back()
		M.update_action_buttons()

	to_chat(usr, "You toggle the thrusters [on? "on":"off"].")

/obj/item/tank/jetpack/proc/get_gas_supply() // CHOMPEdit - Removal of obj/item/weapon
	return air_contents

/obj/item/tank/jetpack/proc/can_thrust(num) // CHOMPEdit - Removal of obj/item/weapon
	if(!on)
		return 0

	var/datum/gas_mixture/fuel = get_gas_supply()
	if(num < 0.005 || !fuel || fuel.total_moles < num)
		ion_trail.stop()
		return 0

	return 1

/obj/item/tank/jetpack/proc/do_thrust(num, mob/living/user) // CHOMPEdit - Removal of obj/item/weapon
	if(!can_thrust(num))
		return 0

	var/datum/gas_mixture/fuel = get_gas_supply()
	fuel.remove(num)
	return 1

/obj/item/tank/jetpack/ui_action_click() // CHOMPEdit - Removal of obj/item/weapon
	toggle()

/obj/item/tank/jetpack/void // CHOMPEdit - Removal of obj/item/weapon
	name = "void jetpack (oxygen)"
	desc = "It works well in a void."
	icon_state = "jetpack-void"
	item_state_slots = list(slot_r_hand_str = "jetpack-void", slot_l_hand_str = "jetpack-void")

/obj/item/tank/jetpack/void/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	air_contents.adjust_gas("oxygen", (6*ONE_ATMOSPHERE)*volume/(R_IDEAL_GAS_EQUATION*T20C))

/obj/item/tank/jetpack/oxygen // CHOMPEdit - Removal of obj/item/weapon
	name = "jetpack (oxygen)"
	desc = "A tank of compressed oxygen for use as propulsion in zero-gravity areas. Use with caution."
	icon_state = "jetpack"
	item_state_slots = list(slot_r_hand_str = "jetpack", slot_l_hand_str = "jetpack")

/obj/item/tank/jetpack/oxygen/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	air_contents.adjust_gas("oxygen", (6*ONE_ATMOSPHERE)*volume/(R_IDEAL_GAS_EQUATION*T20C))

/obj/item/tank/jetpack/breaker // CHOMPEdit - Removal of obj/item/weapon
	name = "CSC industrial jetpack"
	desc = "A JetFast EVA thruster pack. A warning label clearly states \'WARNING: CONTAINS VOLATILE REACTION MASS TOXIC TO MOST LIFEFORMS. NOT TO BE USED WITH CLOSED CYCLE BREATHING SYSTEMS.\'"
	icon_state = "jetpack-breaker"
	item_state_slots = list(slot_r_hand_str = "jetpack", slot_l_hand_str = "jetpack")

/obj/item/tank/jetpack/breaker/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	air_contents.adjust_gas("volatile_fuel", (6*ONE_ATMOSPHERE)*volume/(R_IDEAL_GAS_EQUATION*T20C))

/obj/item/tank/jetpack/carbondioxide // CHOMPEdit - Removal of obj/item/weapon
	name = "jetpack (carbon dioxide)"
	desc = "A tank of compressed carbon dioxide for use as propulsion in zero-gravity areas. Painted black to indicate that it should not be used as a source for internals."
	distribute_pressure = 0
	icon_state = "jetpack-black"
	item_state_slots = list(slot_r_hand_str = "jetpack-black", slot_l_hand_str = "jetpack-black")

/obj/item/tank/jetpack/carbondioxide/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	air_contents.adjust_gas("carbon_dioxide", (6*ONE_ATMOSPHERE)*volume/(R_IDEAL_GAS_EQUATION*T20C))

/obj/item/tank/jetpack/rig // CHOMPEdit - Removal of obj/item/weapon
	name = "jetpack"
	var/obj/item/rig/holder // CHOMPEdit - Removal of obj/item/weapon

/obj/item/tank/jetpack/rig/examine() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	. += "It's a jetpack. If you can see this, report it on the bug tracker."

/obj/item/tank/jetpack/rig/get_gas_supply() // CHOMPEdit - Removal of obj/item/weapon
	return holder?.air_supply?.air_contents
