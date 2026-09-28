/obj/item/clothing/shoes/dry_galoshes
	desc = "A pair of purple rubber boots, designed to prevent slipping on wet surfaces while also drying them."
	name = "absorbent galoshes"
	icon = 'modular_chomp/icons/inventory/feet/item.dmi'
	icon_state = "galoshes_dry"
	permeability_coefficient = 0.05
	siemens_coefficient = 0
	flags = NOCONDUCT
	item_flags = NOSLIP
	slowdown = SHOES_SLOWDOWN+0.5
	species_restricted = null
	drop_sound = 'sound/items/drop/rubber.ogg'
	pickup_sound = 'sound/items/pickup/rubber.ogg'

/obj/item/clothing/shoes/dry_galoshes/Initialize(mapload)
	.=..()
	LoadComponent(/datum/component/dry)
