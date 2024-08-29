/obj/item/storage/wallet/casino // CHOMPEdit - Removal of obj/item/weapon
	name = "casino wallet"
	desc = "A fancy casino wallet with flashy lights, oooh~"
	icon = 'icons/obj/casino_ch.dmi'
	icon_state = "casinowallet_black"
	can_hold = list(
		/obj/item/spacecash, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/card, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/clothing/mask/smokable/cigarette/,
		/obj/item/flashlight/pen, // CHOMPEdit - Removal of obj/item/device
		/obj/item/tape, // CHOMPEdit - Removal of obj/item/device
		/obj/item/cartridge, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/encryptionkey, // CHOMPEdit - Removal of obj/item/device
		/obj/item/seeds,
		/obj/item/stack/medical,
		/obj/item/coin, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/dice, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/disk, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/implanter, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/flame/lighter, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/flame/match, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/forensics, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/glass_extra, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/haircomb, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/hand, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/key, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/lipstick, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/paper, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/pen, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/photo, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/dropper, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/sample, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/tool/screwdriver, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/stamp, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/clothing/accessory/permit,
		/obj/item/clothing/accessory/badge,
		/obj/item/makeover, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/spacecasinocash, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/casino_platinum_chip, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/deck, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/book/codex/casino // CHOMPEdit - Removal of obj/item/weapon
		)

/obj/item/storage/wallet/casino/verb/toggle_design() // CHOMPEdit - Removal of obj/item/weapon
	set category = "Object"
	set name = "Toggle design"
	set src in usr

	if (icon_state == "casinowallet_black")
		icon_state = "casinowallet_brown"
		return
	if (icon_state == "casinowallet_brown")
		icon_state = "casinowallet_white"
		return
	else
		icon_state = "casinowallet_black"

/obj/structure/stripper_pole
	name = "stripper pole"
	icon = 'icons/obj/casino_ch.dmi'
	icon_state = "stripper_pole"
	plane = MOB_PLANE
	layer = BELOW_MOB_LAYER
	density = 0

/obj/structure/stripper_pole/attack_hand(mob/user)
	dance(user)
	user.spin(32,2)
	..()

/obj/structure/stripper_pole/proc/dance(mob/user)
	if(layer == BELOW_MOB_LAYER)
		layer = ABOVE_MOB_LAYER
	else
		layer = BELOW_MOB_LAYER
