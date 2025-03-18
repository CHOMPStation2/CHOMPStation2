/datum/gear/shoes/mech_shoes
	display_name = "stepsound shoes selection"
	path = /obj/item/clothing/shoes/mech_shoes
	cost = 1

/datum/gear/shoes/mech_shoes/New()
	..()
	var/list/mechshoes = list(
	"heavy mech shoes" = /obj/item/clothing/shoes/mech_shoes,
	"light mech shoes" = /obj/item/clothing/shoes/mech_shoes/light,
	"extra large jackboots" = /obj/item/clothing/shoes/mech_shoes/mister_x,
	"visible extra large jackboots" = /obj/item/clothing/shoes/mech_shoes/mister_x/visible
	)
	gear_tweaks += new/datum/gear_tweak/path(mechshoes)
