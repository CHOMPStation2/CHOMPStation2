/obj/item/clothing/accessory/collar/casinoslave
	name = "a disabled Sentient Prize Collar"
	desc = "A collar worn by sentient prizes on the Golden Goose Casino. Although the red text on it shows its disconnected and nonfunctional."
	icon = 'icons/obj/clothing/ties_ch.dmi'
	icon_override = 'icons/mob/ties_ch.dmi'

	icon_state = "casinoslave"
	item_state = "casinoslave"
	overlay_state = "casinoslave"
	sprite_sheets = list(SPECIES_TESHARI = 'icons/inventory/accessory/mob_ch_teshari.dmi')

	var/slavename = null	//Name for system to put on collar description
	var/ownername = null	//Name for system to put on collar description
	var/slaveckey = null	//Ckey for system to check who is the person and ensure no abuse of system or errors
	var/slaveflavor = null	//Description to show on the SPASM
	var/slaveooc = null		//OOC text to show on the SPASM

/obj/item/clothing/accessory/collar/casinoslave/attack_self(mob/user as mob)
	//keeping it blank so people don't tag and reset collar status

/obj/item/clothing/accessory/collar/holo/casinoslave_fake
	name = "a Sentient Prize Collar"
	desc = "A collar worn by sentient prizes on the Golden Goose Casino. This one has been disconnected from the system and is now an accessory!"
	icon = 'icons/obj/clothing/ties_ch.dmi'
	icon_override = 'icons/mob/ties_ch.dmi'

	icon_state = "casinoslave_owned"
	item_state = "casinoslave_owned"
	overlay_state = "casinoslave_owned"
	sprite_sheets = list(SPECIES_TESHARI = 'icons/inventory/accessory/mob_ch_teshari.dmi')
