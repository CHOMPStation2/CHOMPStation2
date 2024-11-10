/obj/item/storage/wallet/casino
	name = "casino wallet"
	desc = "A fancy casino wallet with flashy lights, oooh~"
	icon = 'icons/obj/casino_ch.dmi'
	icon_state = "casinowallet_black"
	can_hold = list(
		/obj/item/spacecash,
		/obj/item/card,
		/obj/item/clothing/mask/smokable/cigarette/,
		/obj/item/flashlight/pen,
		/obj/item/tape,
		/obj/item/cartridge,
		/obj/item/encryptionkey,
		/obj/item/seeds,
		/obj/item/stack/medical,
		/obj/item/coin,
		/obj/item/dice,
		/obj/item/disk,
		/obj/item/implanter,
		/obj/item/flame/lighter,
		/obj/item/flame/match,
		/obj/item/forensics,
		/obj/item/glass_extra,
		/obj/item/haircomb,
		/obj/item/hand,
		/obj/item/key,
		/obj/item/lipstick,
		/obj/item/paper,
		/obj/item/pen,
		/obj/item/photo,
		/obj/item/reagent_containers/dropper,
		/obj/item/sample,
		/obj/item/tool/screwdriver,
		/obj/item/stamp,
		/obj/item/clothing/accessory/permit,
		/obj/item/clothing/accessory/badge,
		/obj/item/makeover,
		/obj/item/spacecasinocash,
		/obj/item/casino_platinum_chip,
		/obj/item/deck,
		/obj/item/book/codex/casino
		)

/obj/item/storage/wallet/casino/verb/toggle_design()
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
