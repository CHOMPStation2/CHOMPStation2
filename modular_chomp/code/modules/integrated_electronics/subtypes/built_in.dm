/obj/item/integrated_circuit/built_in
	var/volume = 0
	unacidable = TRUE

/obj/item/integrated_circuit/built_in/New()
	..()
	if(volume)
		create_reagents(volume)

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
