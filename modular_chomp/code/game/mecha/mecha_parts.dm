/obj/item/mecha_parts/chassis/hades
	name = "Hades Chassis"
	origin_tech = list(TECH_MATERIAL = 7)

/obj/item/mecha_parts/chassis/hades/New()
	..()
	construct = new /datum/construction/mecha/hades_chassis(src)

/obj/item/mecha_parts/part/hades_torso
	name="Hades Torso"
	icon_state = "janus_harness"
	origin_tech = list(TECH_DATA = 5, TECH_MATERIAL = 7, TECH_BLUESPACE = 2, TECH_POWER = 6, TECH_PRECURSOR = 2)

/obj/item/mecha_parts/part/hades_head
	name="Hades Head"
	icon_state = "janus_head"
	origin_tech = list(TECH_DATA = 4, TECH_MATERIAL = 5, TECH_MAGNET = 6, TECH_PRECURSOR = 1)

/obj/item/mecha_parts/part/hades_left_arm
	name="Hades Left Arm"
	icon_state = "janus_l_arm"
	origin_tech = list(TECH_MATERIAL = 5, TECH_BLUESPACE = 2, TECH_MAGNET = 2)

/obj/item/mecha_parts/part/hades_right_arm
	name="Hades Right Arm"
	icon_state = "janus_r_arm"
	origin_tech = list(TECH_MATERIAL = 5, TECH_BLUESPACE = 2, TECH_MAGNET = 2)

/obj/item/mecha_parts/part/hades_left_leg
	name="Hades Left Leg"
	icon_state = "janus_l_leg"
	origin_tech = list(TECH_MATERIAL = 5, TECH_BLUESPACE = 3, TECH_MAGNET = 3, TECH_ARCANE = 1)

/obj/item/mecha_parts/part/hades_right_leg
	name="Prototype Durand Right Leg"
	icon_state = "janus_r_leg"
	origin_tech = list(TECH_MATERIAL = 5, TECH_BLUESPACE = 3, TECH_MAGNET = 3, TECH_ARCANE = 1)

/obj/item/circuitboard/mecha/hades/targeting
	name = "stange targeting circuit"

/obj/item/circuitboard/mecha/hades/peripherals
	name = "stange peripheral circuit"

/obj/item/circuitboard/mecha/hades/main
	name = "stange control circuit"