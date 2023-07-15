/obj/item/integrated_circuit/built_in
	name = "integrated circuit"
	desc = "It's a tiny chip!  This one doesn't seem to do much, however."
	icon = 'icons/obj/integrated_electronics/electronic_setups.dmi'
	icon_state = "template"
	size = -1
	w_class = ITEMSIZE_TINY
	removable = FALSE 			// Determines if a circuit is removable from the assembly.
	var/volume = 0
	unacidable = TRUE

/obj/item/integrated_circuit/built_in/New()
	..()
	if(volume)
		create_reagents(volume)

/obj/item/integrated_circuit/built_in/device_input
	name = "assembly input"
	desc = "A built in chip for handling pulses from attached assembly items."
	complexity = 0 				//This acts as a limitation on building machines, more resource-intensive components cost more 'space'.
	activators = list("on pulsed" = IC_PINTYPE_PULSE_OUT)

/obj/item/integrated_circuit/built_in/device_input/do_work()
	activate_pin(1)

/obj/item/integrated_circuit/built_in/device_output
	name = "assembly out"
	desc = "A built in chip for pulsing attached assembly items."
	complexity = 0 				//This acts as a limitation on building machines, more resource-intensive components cost more 'space'.
	activators = list("pulse attached" = IC_PINTYPE_PULSE_IN)

/obj/item/integrated_circuit/built_in/device_output/do_work()
	if(istype(assembly, /obj/item/device/electronic_assembly/device))
		var/obj/item/device/electronic_assembly/device/device = assembly
		device.holder.pulse()

// Triggered when clothing assembly's hud button is clicked (or used inhand).
/obj/item/integrated_circuit/built_in/action_button
	name = "external trigger circuit"
	desc = "A built in chip that outputs a pulse when an external control event occurs."
	extended_desc = "This outputs a pulse if the assembly's HUD button is clicked while the assembly is closed."
	complexity = 0
	activators = list("on activation" = IC_PINTYPE_PULSE_OUT)

/obj/item/integrated_circuit/built_in/action_button/do_work()
	activate_pin(1)

/obj/item/integrated_circuit/built_in/tank
	name = "integrated fluid tank"
	desc = "A built in tank for storing huge quantities of liquids. Can store up to 600u"
	icon = 'icons/obj/integrated_electronics/electronic_components.dmi'
	icon_state = "reagent_storage_big"
	volume = 600
	flags = OPENCONTAINER
	inputs = list()
	outputs = list("volume used" = IC_PINTYPE_NUMBER,"self reference" = IC_PINTYPE_REF)
	activators = list()


/obj/item/integrated_circuit/built_in/tank/interact(mob/user)
	set_pin_data(IC_OUTPUT, 2, WEAKREF(src))
	push_data()
	..()

/obj/item/integrated_circuit/built_in/tank/on_reagent_change()
	set_pin_data(IC_OUTPUT, 1, reagents.total_volume)
	push_data()
