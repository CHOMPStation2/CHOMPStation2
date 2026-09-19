/obj/item/clothing/shoes/mech_shoes
	name = "mech shoes"
	desc = "Thud thud."
	//No unit test shortcuts, just make invisible shoes. It's not that hard. This makes sure Digitigrade versions don't thrown an error
	icon_state = "mechshoes" // 1 alpha recolors of dress shoes, so you can technically pick them up?
	armor = list(melee = 30, bullet = 10, laser = 10, energy = 15, bomb = 20, bio = 0, rad = 0) // Same as loadout jackboots.
	siemens_coefficient = 0.7 // Same as loadout jackboots.
	can_hold_knife = 1
	force = 2
	species_restricted = null
	var/list/squeak_sound = list("mechstep"=1)	//Squeak sound list. Necessary so our subtypes can have different sounds loaded into their component

/obj/item/clothing/shoes/mech_shoes/Initialize(mapload)
	.=..()
	LoadComponent(/datum/component/squeak, squeak_sound, 15*step_volume_mod)

/obj/item/clothing/shoes/mech_shoes/light
	name = "light mech shoes"
	desc = "Thud thud, but quieter."
	squeak_sound = list("powerloaderstep"=1)

/obj/item/clothing/shoes/mech_shoes/heavy
	name = "heavy mech shoes"
	desc = "Thud thud, but heavy."
	squeak_sound = list('sound/mob/footstep_large.ogg'=1,'sound/mob/footstep_large2.ogg'=1)
	step_volume_mod = 4

/obj/item/clothing/shoes/mech_shoes/mister_x
	name = "concealed extra large jackboots"
	desc = "Lets hope there's no evil in this residence."
	squeak_sound = list('sound/mob/heavy_boots.ogg'=1)
	step_volume_mod = 5

/obj/item/clothing/shoes/mech_shoes/mister_x/visible
	name = "visible extra large jackboots"
	icon = 'icons/inventory/feet/item.dmi'
	icon_state = "jackboots"

/obj/item/clothing/shoes/clown_shoes
	var/list/squeak_sound = list("clownstep"=1)

/obj/item/clothing/shoes/clown_shoes/Initialize(mapload)
	.=..()
	LoadComponent(/datum/component/squeak, squeak_sound, 20*step_volume_mod)

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
