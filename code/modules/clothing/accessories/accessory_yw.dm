/obj/item/clothing/accessory/poncho/roles/cloak/blueshield
	name = "bodyguard's cloak"
	desc = "A dark blue cloak with silver trim around the neck. The mark of a professional bodyguard, and ideal for concealing holsters or other items."
	icon = 'icons/obj/clothing/ties_yw.dmi'
	icon_state = "cloak_blueshield"
	icon_override = 'icons/mob/ties_yw.dmi'
	item_state = "cloak_blueshield"


/obj/item/clothing/accessory/poncho/roles/cloak/blueshield/dropped(mob/user) //makes the blueshield suit not kek when used by a teshari
	..()
	icon_override = 'icons/mob/ties_yw.dmi'


/obj/item/clothing/accessory/poncho/cloak/fluff/dropped(mob/user) //makes the fluff cloaks not kek when used by a teshari
	..()
	icon_override = 'icons/vore/custom_clothes_yw.dmi'
