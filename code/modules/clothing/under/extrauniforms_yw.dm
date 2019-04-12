/*any items must be put under /obj/item/clothing/under/yw as a base path for icons to work, if put in uniforms_yw/uniform_yw and suits_yw/suit_yw.*/
/obj/item/clothing/under/yw

/obj/item/clothing/under/yw/blueshield //fancy blueshield suit,
	name = "Blueshield officer Formal suit"
	desc = "Gold trim on blue cloth, this uniform displays the rank of \"Lieutenant\" and bears \"Nanotrasen Blueshield officer\" on the left shoulder"
	icon = 'icons/mob/uniform_yw.dmi'
	icon_state = "blueshield"
	icon_override = 'icons/mob/uniform_yw.dmi'
	item_state = "blueshield"

/obj/item/clothing/under/yw/blueshield2 //fancy blueshield suit,
	name = "Blueshield officer suit"
	desc = "A snazzy combat uniform with the a blueshield insignia on the back."
	icon = 'icons/mob/uniform_yw.dmi'
	icon_state = "blueshield2"
	icon_override = 'icons/mob/uniform_yw.dmi'
	item_state = "blueshield2"
	armor = list(melee = 15, bullet = 10, laser = 10,energy = 5, bomb = 15, bio = 0, rad = 0)

/obj/item/clothing/under/yw/rank/security/formal
	name = "security suit"
	desc = "A formal security suit for officers complete with nanotrasen belt buckle."
	icon = 'icons/mob/uniform_yw.dmi'
	icon_state = "securityformal"
	icon_override = 'icons/mob/uniform_yw.dmi'
	item_state = "securityformal"
	armor = list(melee = 10, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 0, rad = 0)

/obj/item/clothing/under/yw/rank/warden/formal
	name = "warden's suit"
	desc = "A formal security suit for the warden with blue desginations and '/Warden/' stiched into the shoulders."
	icon = 'icons/mob/uniform_yw.dmi'
	icon_state = "wardenformal"
	icon_override = 'icons/mob/uniform_yw.dmi'
	item_state = "wardenformal"
	armor = list(melee = 10, bullet = 5, laser = 5,energy = 0, bomb = 0, bio = 0, rad = 0)

/obj/item/clothing/under/yw/rank/head_of_security/formal
	name = "head of security's suit"
	desc = "A security suit decorated for those few with the dedication to achieve the position of Head of Security."
	icon = 'icons/mob/uniform_yw.dmi'
	icon_state = "hosformal"
	icon_override = 'icons/mob/uniform_yw.dmi'
	item_state = "hosformal"
	armor = list(melee = 10, bullet = 10, laser = 10,energy = 5, bomb = 0, bio = 0, rad = 0)

//Brig Physician
/obj/item/clothing/under/yw/rank/security/brigphys
	desc = "Jumpsuit for Brig Physician it has both medical and security protection."
	name = "brig physician's jumpsuit"
	icon = 'icons/mob/uniform_yw.dmi'
	icon_state = "brigphysician"
	icon_override = 'icons/mob/uniform_yw.dmi'
	item_state = "brigphysician"
	permeability_coefficient = 0.50
	armor = list(melee = 10, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 10, rad = 0)

/obj/item/clothing/under/yw/rank/security/brigphys/skirt
	desc = "A skirted Brig Physician uniform. It has both security and medical protection."
	name = "brig physician's jumpskirt"
	icon = 'icons/mob/uniform_yw.dmi'
	icon_state = "brigphysicianf_s"
	icon_override = 'icons/mob/uniform_yw.dmi'
	item_state = "brigphysicianf"
	permeability_coefficient = 0.50
	armor = list(melee = 10, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 10, rad = 0)


/obj/item/clothing/under/yw/robotics //fancy blueshield suit,
	name = "A cybernetic uniform"
	desc = "A roboticist uniform with glowing trim, and some sort of machine port on the back."
	icon = 'icons/mob/uniform_yw.dmi'
	icon_state = "robotics2"
	icon_override = 'icons/mob/uniform_yw.dmi'
	item_state = "Robotics2"

