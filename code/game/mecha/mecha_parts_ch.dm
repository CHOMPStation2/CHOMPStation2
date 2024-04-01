/obj/item/mecha_parts/chassis/scarab
	name = "Scarab Chassis"
	icon = 'icons/mecha/mech_construct_ch.dmi'
	icon_state = "scarab_chassis"

/obj/item/mecha_parts/chassis/scarab/New()
	..()
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


///Fighters///

/obj/item/mecha_parts/fighter
	icon = 'modular_chomp/icons/mecha/fighters_construct64x64.dmi'

/obj/item/mecha_parts/fighter/chassis
	name="Fighter Chassis"
	icon_state = "backbone"
	var/datum/construction/construct

/obj/item/mecha_parts/fighter/chassis/attackby(obj/item/W, mob/user)
	if(!construct || !construct.action(W, user))
		..()
	return

/obj/item/mecha_parts/fighter/chassis/attack_hand(mob/user, list/params)
	return


//! Pinnace

/obj/item/mecha_parts/fighter/chassis/pinnace
	name = "\improper Pinnace Chassis"
	icon_state = "pinnace_chassis"

	origin_tech = list(TECH_MATERIAL = 2)

/obj/item/mecha_parts/fighter/chassis/pinnace/New()
	..()
	construct = new /datum/construction/mecha/fighter/pinnace_chassis(src)


/obj/item/mecha_parts/fighter/part/pinnace_core
	name="\improper Pinnace Core"
	icon_state = "pinnace_core"
	origin_tech = list(TECH_DATA = 2, TECH_MATERIAL = 2, TECH_ENGINEERING = 2)

/obj/item/mecha_parts/fighter/part/pinnace_cockpit
	name="\improper Pinnace Cockpit"
	icon_state = "pinnace_cockpit"
	origin_tech = list(TECH_DATA = 2, TECH_MATERIAL = 2, TECH_ENGINEERING = 2)

/obj/item/mecha_parts/fighter/part/pinnace_left_wing
	name="\improper Pinnace Left Wing"
	icon_state = "pinnace_l_wing"
	origin_tech = list(TECH_DATA = 2, TECH_MATERIAL = 2, TECH_ENGINEERING = 2)

/obj/item/mecha_parts/fighter/part/pinnace_right_wing
	name="\improper Pinnace Right Wing"
	icon_state = "pinnace_r_wing"
	origin_tech = list(TECH_DATA = 2, TECH_MATERIAL = 2, TECH_ENGINEERING = 2)

/obj/item/mecha_parts/fighter/part/pinnace_main_engine
	name="\improper Pinnace Main Engine"
	icon_state = "pinnace_m_engine"
	origin_tech = list(TECH_DATA = 2, TECH_MATERIAL = 2, TECH_ENGINEERING = 2)

/obj/item/mecha_parts/fighter/part/pinnace_left_engine
	name="\improper Pinnace Left Engine"
	icon_state = "pinnace_l_engine"
	origin_tech = list(TECH_DATA = 2, TECH_MATERIAL = 2, TECH_ENGINEERING = 2)

/obj/item/mecha_parts/fighter/part/pinnace_right_engine
	name="\improper Pinnace Right Engine"
	icon_state = "pinnace_r_engine"
	origin_tech = list(TECH_DATA = 2, TECH_MATERIAL = 2, TECH_ENGINEERING = 2)

//! Baron

/obj/item/mecha_parts/fighter/chassis/baron
	name = "\improper Baron Chassis"
	icon_state = "baron_chassis"

	origin_tech = list(TECH_MATERIAL = 2)

/obj/item/mecha_parts/fighter/chassis/baron/New()
	..()
	construct = new /datum/construction/mecha/fighter/baron_chassis(src)


/obj/item/mecha_parts/fighter/part/baron_core
	name="\improper Baron Core"
	icon_state = "baron_core"
	origin_tech = list(TECH_DATA = 2, TECH_MATERIAL = 5, TECH_BIO = 2, TECH_ENGINEERING = 4)

/obj/item/mecha_parts/fighter/part/baron_cockpit
	name="\improper Baron Cockpit"
	icon_state = "baron_cockpit"
	origin_tech = list(TECH_DATA = 2, TECH_MATERIAL = 5, TECH_BIO = 2, TECH_ENGINEERING = 4)

/obj/item/mecha_parts/fighter/part/baron_left_wing
	name="\improper Baron Left Wing"
	icon_state = "baron_l_wing"
	origin_tech = list(TECH_DATA = 2, TECH_MATERIAL = 5, TECH_ENGINEERING = 4)

/obj/item/mecha_parts/fighter/part/baron_right_wing
	name="\improper Baron Right Wing"
	icon_state = "baron_r_wing"
	origin_tech = list(TECH_DATA = 2, TECH_MATERIAL = 5, TECH_ENGINEERING = 4)

/obj/item/mecha_parts/fighter/part/baron_main_engine
	name="\improper Baron Main Engine"
	icon_state = "baron_m_engine"
	origin_tech = list(TECH_DATA = 2, TECH_MATERIAL = 5, TECH_ENGINEERING = 4)

/obj/item/mecha_parts/fighter/part/baron_left_engine
	name="\improper Baron Left Engine"
	icon_state = "baron_l_engine"
	origin_tech = list(TECH_DATA = 2, TECH_MATERIAL = 5, TECH_ENGINEERING = 4)

/obj/item/mecha_parts/fighter/part/baron_right_engine
	name="\improper Baron Right Engine"
	icon_state = "baron_r_engine"
	origin_tech = list(TECH_DATA = 2, TECH_MATERIAL = 5, TECH_ENGINEERING = 4)