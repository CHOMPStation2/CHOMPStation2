/obj/item/clothing/head/helmet/space/void/merc/blackhole
	name = "black hole trooper helmet"
	desc = "An ominous black and purple voidsuit helmet, used by the fanatic paramilitary cult, Black Hole."
	icon_state = "helm_trooper"
	default_worn_icon = 'modular_chomp/icons/blackhole/equipment.dmi'
	icon = 'modular_chomp/icons/blackhole/equipment.dmi'
	item_state_slots = list(slot_r_hand_str = "syndie_helm", slot_l_hand_str = "syndie_helm")
	armor = list(melee = 60, bullet = 50, laser = 30,energy = 15, bomb = 65, bio = 100, rad = 100)
	siemens_coefficient = 0.6
	camera_networks = list(NETWORK_MERCENARY)
	light_overlay = null

/obj/item/clothing/head/helmet/space/void/merc/blackhole/templar
	name = "black hole templar helmet"
	desc = "An ominous black and purple voidsuit helmet, used by the fanatic paramilitary cult, Black Hole."
	icon_state = "helm_templar"

/obj/item/clothing/head/helmet/space/void/merc/blackhole/acolyte
	name = "black hole acolyte helmet"
	desc = "An ominous black and purple voidsuit helmet, used by the fanatic paramilitary cult, Black Hole."
	icon_state = "helm_acolyte"

/obj/item/clothing/suit/space/void/merc/blackhole
	icon_state = "suit"
	icon = 'modular_chomp/icons/blackhole/equipment.dmi'
	default_worn_icon = 'modular_chomp/icons/blackhole/equipment.dmi'
	name = "black hole voidsuit"
	desc = "An ominous black and purple voidsuit, used by the fanatic paramilitary cult, Black Hole."
	item_state_slots = list(slot_r_hand_str = "syndie_voidsuit", slot_l_hand_str = "syndie_voidsuit")
	w_class = ITEMSIZE_NORMAL
	armor = list(melee = 60, bullet = 50, laser = 30, energy = 15, bomb = 65, bio = 100, rad = 100)
	allowed = list(POCKET_GENERIC, POCKET_EMERGENCY, POCKET_SUIT_REGULATORS, POCKET_ALL_TANKS, POCKET_SECURITY)
	siemens_coefficient = 0.6
	breach_threshold = 16 //Extra Thicc
	resilience = 0.05 //Military Armor