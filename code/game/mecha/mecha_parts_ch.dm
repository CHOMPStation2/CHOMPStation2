/obj/item/mecha_parts/chassis/scarab
	name = "Scarab Chassis"
	icon = 'icons/mecha/mech_construct_ch.dmi'
	icon_state = "scarab_chassis"

/obj/item/mecha_parts/chassis/scarab/Initialize(mapload)
	. = ..()
	construct = new /datum/construction/mecha/scarab_chassis(src)

/obj/item/mecha_parts/part/scarab_torso
	name="Scarab Torso"
	desc="A torso part of Scarab. Contains power unit, processing core and life support systems."
	icon = 'icons/mecha/mech_construct_ch.dmi'
	icon_state = "scarab_torso"
	origin_tech = list(TECH_DATA = 2, TECH_MATERIAL = 2, TECH_BIO = 4, TECH_ENGINEERING = 3)

/obj/item/mecha_parts/part/scarab_head
	name="Scarab Head"
	desc="A Scarab head. Houses advanced surveilance and target marking equipment."
	icon = 'icons/mecha/mech_construct_ch.dmi'
	icon_state = "scarab_head"
	origin_tech = list(TECH_DATA = 2, TECH_MATERIAL = 2, TECH_MAGNET = 3, TECH_ENGINEERING = 3)

/obj/item/mecha_parts/part/scarab_left_arm
	name="Scarab Left Arm"
	desc="A Scarab left arm. Data and power sockets are compatible with most exosuit tools and weapons."
	icon = 'icons/mecha/mech_construct_ch.dmi'
	icon_state = "scarab_l_arm"
	origin_tech = list(TECH_DATA = 2, TECH_MATERIAL = 2, TECH_ENGINEERING = 3)

/obj/item/mecha_parts/part/scarab_right_arm
	name="Scarab Right Arm"
	desc="A Scarab right arm. Data and power sockets are compatible with most exosuit tools and weapons."
	icon = 'icons/mecha/mech_construct_ch.dmi'
	icon_state = "scarab_r_arm"
	origin_tech = list(TECH_DATA = 2, TECH_MATERIAL = 2, TECH_ENGINEERING = 3)

/obj/item/mecha_parts/part/scarab_left_legs
	name="Scarab Left Legs"
	desc="A powerful, yet lightweight, pair of legs."
	icon = 'icons/mecha/mech_construct_ch.dmi'
	icon_state = "scarab_l_legs"
	origin_tech = list(TECH_DATA = 2, TECH_MATERIAL = 2, TECH_ENGINEERING = 3)

/obj/item/mecha_parts/part/scarab_right_legs
	name="Scarab Right Legs"
	desc="A powerful, yet lightweight, pair of legs."
	icon = 'icons/mecha/mech_construct_ch.dmi'
	icon_state = "scarab_r_legs"
	origin_tech = list(TECH_DATA = 2, TECH_MATERIAL = 2, TECH_ENGINEERING = 3)
