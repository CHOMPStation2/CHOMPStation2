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
	item_state = "paramedic-vest_us"
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 15, bio = 50, rad = 50)