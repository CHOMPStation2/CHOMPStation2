/obj/item/clothing/suit/armor/yw/blueshield
	name = "Blue Shield Security Armor"
	desc = "An armored vest with the badge of a Blueshield Lieutenant."
	icon = 'icons/mob/suit_yw.dmi'
	icon_state = "blueshield"
	icon_override = 'icons/mob/suit_yw.dmi'
	item_state = "blueshield_s"
	blood_overlay_type = "armor"
	armor = list(melee = 40, bullet = 30, laser = 30, energy = 10, bomb = 10, bio = 0, rad = 0)


/obj/item/clothing/suit/storage/toggle/yw/secjacket
	name = "security jacket"
	desc = "A sturdy black jacket with reinforced fabric. Bears insignia of NT corporate security."
	icon = 'icons/mob/suit_yw.dmi'
	icon_state = "secjacket_open"
	icon_override = 'icons/mob/suit_yw.dmi'
	item_state = "secjacket_open_s"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS
	armor = list(melee = 15, bullet = 10, laser = 15, energy = 5, bomb = 15, bio = 0, rad = 0)
	cold_protection = UPPER_TORSO|LOWER_TORSO|ARMS
	heat_protection = UPPER_TORSO|LOWER_TORSO|ARMS
	flags_inv = HIDEHOLSTER
	open = 1

/obj/item/clothing/suit/storage/toggle/yw/secjacket/toggle()
	set name = "Toggle Coat Buttons"
	set category = "Object"
	set src in usr
	if(!usr.canmove || usr.stat || usr.restrained())
		return 0

	if(open == 1) //Will check whether icon state is currently set to the "open" or "closed" state and switch it around with a message to the user
		open = 0
		icon_state = "secjacket"
		item_state = "secjacket_s"
		flags_inv = HIDETIE|HIDEHOLSTER
		to_chat(usr, "You button up the coat.")
	else if(open == 0)
		open = 1
		icon_state = "secjacket_open"
		item_state = "secjacket_open_s"
		flags_inv = HIDEHOLSTER
		to_chat(usr, "You unbutton the coat.")
	else //in case some goofy admin switches icon states around without switching the icon_open or icon_closed
		to_chat(usr, "You attempt to button-up the velcro on your [src], before promptly realising how silly you are.")
		return
	update_clothing_icon()	//so our overlays update

/obj/item/clothing/suit/armor/yw/blueshieldcoat
	name = "Blue Shield Security Coat"
	desc = "NT deluxe ripoff. You finally have your own coat."
	icon = 'icons/mob/suit_yw.dmi'
	icon_state = "blueshieldcoat"
	icon_override = 'icons/mob/suit_yw.dmi'
	item_state = "blueshieldcoat_s"
	blood_overlay_type = "armor"
	armor = list(melee = 20, bullet = 15, laser = 15, energy = 10, bomb = 10, bio = 0, rad = 0)
	cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	heat_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS


/obj/item/clothing/suit/storage/hazardvest/yw/brigphysician
	name = "Brig Physician Vest"
	desc = "A vest often worn by doctors caring for inmates."
	icon = 'icons/mob/suit_yw.dmi'
	icon_state = "brigphysician-vest"
	icon_override = 'icons/mob/suit_yw.dmi'
	item_state = "brigphysician-vest_s"
	armor = list(melee = 15, bullet = 10, laser = 10, energy = 10, bomb = 10, bio = 50, rad = 15)

/obj/item/clothing/suit/storage/hazardvest/yw/Paramedic
	name = "Paramedic Vest"
	desc = "A hazard vest used in the recovery of bodies."
	icon = 'icons/mob/suit_yw.dmi'
	icon_state = "paramedic-vest"
	icon_override = 'icons/mob/suit_yw.dmi'
	item_state = "paramedic-vest_s"
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 15, bio = 50, rad = 50)
