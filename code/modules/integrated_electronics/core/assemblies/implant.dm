// Note that this is contained inside an actual implant subtype.
// See code/game/objects/items/weapons/implants/implantcircuits.dm for where this gets held.

/obj/item/electronic_assembly/implant // CHOMPEdit - Removal of obj/item/device
	name = "electronic implant"
	icon_state = "setup_implant"
	desc = "It's a case, for building very tiny electronics with."
	w_class = ITEMSIZE_TINY
	max_components = IC_COMPONENTS_BASE / 2
	max_complexity = IC_COMPLEXITY_BASE / 2
	var/obj/item/implant/integrated_circuit/implant = null // CHOMPEdit - Removal of obj/item/weapon

/obj/item/electronic_assembly/implant/tgui_host() // CHOMPEdit - Removal of obj/item/device
	return implant.tgui_host()

/obj/item/electronic_assembly/implant/update_icon() // CHOMPEdit - Removal of obj/item/device
	..()
	implant.icon_state = icon_state