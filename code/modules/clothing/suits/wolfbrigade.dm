//Putting all the wolfbrigade stuff here because stupidop armor
/obj/item/clothing/suit/armor/wolfbrigade
	name = "Protect Gear chestpiece"
	desc = "Die Wölfe sind geschützt"
	icon = 'icons/obj/clothing/wolfbrigade.dmi'
	icon_override = 'icons/obj/clothing/wolfbrigade.dmi'
	icon_state = "wbsuit"
	item_state = "wbsuit-mob"
	blood_overlay_type = "suit"
	armor = list(melee = 80, bullet = 70, laser = 50, energy = 50, bomb = 100, bio = 0, rad = 10)
	body_parts_covered = UPPER_TORSO

/obj/item/clothing/suit/storage/armor/wolfbrigade2
	name = "Protect Gear chestpiece mod"
	desc = "Die Wölfe können mehr tragen"
	icon = 'icons/obj/clothing/wolfbrigade.dmi'
	icon_override = 'icons/obj/clothing/wolfbrigade.dmi'
	icon_state = "wbsuit2"
	item_state = "wbsuit2-mob"
	blood_overlay_type = "suit"
	slowdown = 0.5
	armor = list(melee = 80, bullet = 70, laser = 50, energy = 50, bomb = 100, bio = 0, rad = 10)
	body_parts_covered = UPPER_TORSO

/obj/item/clothing/mask/gas/wolfbrigade
	name = "Protect Gear mask"
	desc = "Die Wölfe können atmen"
	icon = 'icons/obj/clothing/wolfbrigade.dmi'
	icon_override = 'icons/obj/clothing/wolfbrigade.dmi'
	icon_state = "wbmask-mob"
	item_state = "wbmask-mob"
	item_state_slots = list(slot_r_hand_str = "gas", slot_l_hand_str = "gas")
	armor = list(melee = 60, bullet = 50, laser = 30,energy = 30, bomb = 80, bio = 20, rad = 10)
	body_parts_covered = HEAD|FACE|EYES

/obj/item/clothing/head/helmet/wolfbrigade
	name = "Protect Gear helmet"
	desc = "Die Wölfe haben Köpfe aus Eisen"
	icon = 'icons/obj/clothing/wolfbrigade.dmi'
	icon_override = 'icons/obj/clothing/wolfbrigade.dmi'
	icon_state = "wbhelmet"
	item_state = "wbhelmet-mob"
	armor = list(melee = 60, bullet = 50, laser = 30, energy = 30, bomb = 80, bio = 0, rad = 10)

/obj/item/clothing/shoes/combat/wolfbrigade
	name = "Protect Gear boots"
	desc = "Die Wölfe können nicht ausrutschen"
	icon = 'icons/obj/clothing/wolfbrigade.dmi'
	icon_override = 'icons/obj/clothing/wolfbrigade.dmi'
	icon_state = "wbboots-mob"
	item_state = "wbboots-mob"
	force = 5
	armor = list(melee = 60, bullet = 60, laser = 40,energy = 30, bomb = 50, bio = 0, rad = 10)
	item_flags = NOSLIP
	siemens_coefficient = 0.6
	cold_protection = FEET
	min_cold_protection_temperature = SHOE_MIN_COLD_PROTECTION_TEMPERATURE
	heat_protection = FEET
	max_heat_protection_temperature = SHOE_MAX_HEAT_PROTECTION_TEMPERATURE

/obj/item/clothing/gloves/arm_guard/combat/wolfbrigade
	name = "Protect Gear armguards"
	desc = "Die Wölfe haben scharfe krallen" // 2 edgy

/obj/item/clothing/under/acj/wolfbrigade //Because never OP enough when you want to adminbuse
	name = "Kerberos uniform"
	desc = "Fürchte die Wölfe"
