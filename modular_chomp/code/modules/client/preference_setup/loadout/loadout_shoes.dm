/datum/gear/shoes/mech_shoes
	display_name = "mech shoes selection"
	path = /obj/item/clothing/shoes/mech_shoes
	cost = 1

/datum/gear/shoes/mech_shoes/New()
	..()
	var/list/mechshoes = list(
	"heavy mech shoes" = /obj/item/clothing/shoes/mech_shoes,
	"light mech shoes" = /obj/item/clothing/shoes/mech_shoes/light
	)
	gear_tweaks += new/datum/gear_tweak/path(mechshoes)