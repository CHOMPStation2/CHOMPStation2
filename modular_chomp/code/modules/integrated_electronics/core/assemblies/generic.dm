/obj/item/device/electronic_assembly/medium/tank
	name = "type-g electronic mechanism"
	icon_state = "setup_stationary"
	desc = "It's a case, for building medium-sized electronics with. This one has a boxy design and comes with an integrated tank."
	can_anchor = TRUE

/obj/item/device/electronic_assembly/medium/tank/Initialize()
	src.force_add_circuit(new /obj/item/integrated_circuit/built_in/tank)
	return ..()
