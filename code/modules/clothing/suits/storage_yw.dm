/obj/item/clothing/suit/storage/explorer
	name = "service jacket"
	desc = "A uniform service jacket, plain and undecorated."
	icon_state = "blackservice"
	item_state_slots = list(slot_r_hand_str = "suit_black", slot_l_hand_str = "suit_black")
	body_parts_covered = UPPER_TORSO|ARMS
	armor = list(melee = 0, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 0, rad = 0)
	siemens_coefficient = 0.9
	flags_inv = HIDEHOLSTER //VOREStation Add - These obviously do.
	allowed = list(/obj/item/tank/emergency/oxygen,/obj/item/flashlight,/obj/item/pen,/obj/item/clothing/head/soft,/obj/item/clothing/head/beret,/obj/item/storage/fancy/cigarettes,/obj/item/flame/lighter,/obj/item/taperecorder,/obj/item/analyzer,/obj/item/radio,/obj/item/taperoll)

/obj/item/clothing/suit/storage/explorer/crew
	name = "\improper Explorer jacket"
	desc = "A exploration jacket belonging to the the Explorer's association. It has silver buttons."
	icon_state = "blackservice_crew"

/obj/item/clothing/suit/storage/explorer/medical
	name = "\improper Explorer medical jacket"
	desc = "A exploration jacket belonging to the Explorer's association. It has silver buttons and blue trim."
	icon_state = "blackservice_med"

/obj/item/clothing/suit/storage/explorer/medical/command
	name = "\improper Explorer medical command jacket"
	desc = "A exploration jacket belonging to the Explorer's association. It has gold buttons and blue trim."
	icon_state = "blackservice_medcom"

/obj/item/clothing/suit/storage/explorer/engineering
	name = "\improper Explorer engineering jacket"
	desc = "A exploration jacket belonging to the Explorer's association. It has silver buttons and orange trim."
	icon_state = "blackservice_eng"

/obj/item/clothing/suit/storage/explorer/engineering/command
	name = "\improper Explorer engineering command jacket"
	desc = "A exploration jacket belonging to the Explorer's association. It has gold buttons and orange trim."
	icon_state = "blackservice_engcom"

/obj/item/clothing/suit/storage/explorer/supply
	name = "\improper Explorer supply jacket"
	desc = "A exploration jacket belonging to the Explorer's association. It has silver buttons and brown trim."
	icon_state = "blackservice_sup"

/obj/item/clothing/suit/storage/explorer/security
	name = "\improper Explorer security jacket"
	desc = "A exploration jacket belonging to the Explorer's association. It has silver buttons and red trim."
	icon_state = "blackservice_sec"

/obj/item/clothing/suit/storage/explorer/security/command
	name = "\improper Explorer security command jacket"
	desc = "A exploration jacket belonging to the Explorer's association. It has gold buttons and red trim."
	icon_state = "blackservice_seccom"

/obj/item/clothing/suit/storage/explorer/command
	name = "\improper Explorer command jacket"
	desc = "A exploration jacket belonging to the Explorer's association. It has gold buttons and gold trim."
	icon_state = "blackservice_com"


/obj/item/clothing/suit/storage/tailcoat
	name = "victorian tailcoat"
	desc = "A fancy victorian tailcoat."
	icon = 'icons/mob/suit_yw.dmi'
	icon_state = "tailcoat"
	icon_override = 'icons/mob/suit_yw.dmi'
	item_state = "tailcoat_s"

/obj/item/clothing/suit/storage/victcoat
	name = "ladies black victorian coat"
	desc = "A fancy victorian coat."
	icon = 'icons/mob/suit_yw.dmi'
	icon_state = "ladiesvictoriancoat"
	icon_override = 'icons/mob/suit_yw.dmi'
	item_state = "ladiesvictoriancoat_s"

/obj/item/clothing/suit/storage/victcoat/red
	name = "ladies red victorian coat"
	icon_state = "ladiesredvictoriancoat"
	item_state = "ladiesredvictoriancoat_s"