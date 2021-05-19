/datum/gear/head/cap/med
	display_name = "cap, medical (Medical)"
	path = /obj/item/clothing/head/soft/med
	allowed_roles = list("Chief Medical Officer","Medical Doctor","Chemist","Psychiatrist","Paramedic","Field Medic")

/*/datum/gear/head/cap/sol
	display_name = "cap, sol"
	path = /obj/item/clothing/head/soft/sol*/

/datum/gear/head/headbando
	display_name = "basic headband"
	path = /obj/item/clothing/head/fluff/headbando

/datum/gear/head/maid
	display_name = "maid headband"
	path = /obj/item/clothing/head/headband/maid

/datum/gear/head/headbando/New()
	..()
	gear_tweaks += gear_tweak_free_color_choice

//Detective alternative
/datum/gear/head/detective_alt
	display_name = "cyberscope headgear, detective"
	path = /obj/item/clothing/head/helmet/detective_alt
	allowed_roles = list("Head of Security", "Detective")