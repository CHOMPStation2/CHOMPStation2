/obj/item/clothing/accessory/collar/casinoslave
	name = "a disabled Sentient Prize Collar"
	desc = "A collar worn by sentient prizes on the Golden Goose Casino. Although the red text on it shows its disconnected and nonfunctional."
	icon = 'icons/obj/clothing/ties_ch.dmi'
	icon_override = 'icons/mob/ties_ch.dmi'

	icon_state = "casinoslave"
	item_state = "casinoslave"
	overlay_state = "casinoslave"

	var/slavename = null	//Name for system to put on collar description
	var/ownername = null	//Name for system to put on collar description
	var/slaveckey = null	//Ckey for system to check who is the person and ensure no abuse of system or errors
	var/slaveflavor = null	//Description to show on the SPASM
	var/slaveooc = null		//OOC text to show on the SPASM

/obj/item/clothing/accessory/collar/casinoslave/attack_self(mob/user as mob)
	//keeping it blank so people don't tag and reset collar status

/obj/item/clothing/accessory/collar/casinoslave_fake
	name = "a Sentient Prize Collar"
	desc = "A collar worn by sentient prizes on the Golden Goose Casino. This one has been disconnected from the system and is now an accessory!"
	icon = 'icons/obj/clothing/ties_ch.dmi'
	icon_override = 'icons/mob/ties_ch.dmi'

	icon_state = "casinoslave_owned"
	item_state = "casinoslave_owned"
	overlay_state = "casinoslave_owned"
	
/obj/item/clothing/accessory/poncho/roles/cloak/blueshield
	name = "bodyguard's cloak"
	desc = "A dark blue cloak with silver trim around the neck. The mark of a professional bodyguard, and ideal for concealing holsters or other items."
	icon = 'icons/obj/clothing/ties_ch.dmi'
	icon_state = "cloak_blueshield"
	icon_override = 'icons/mob/ties_ch.dmi'
	item_state = "cloak_blueshield"


/obj/item/clothing/accessory/poncho/roles/cloak/blueshield/dropped() //makes the blueshield suit not kek when used by a teshari
	icon_override = 'icons/mob/ties_ch.dmi'


/obj/item/clothing/accessory/poncho/cloak/fluff/dropped() //makes the fluff cloaks not kek when used by a teshari
	icon_override = 'icons/vore/custom_clothes_yw.dmi'