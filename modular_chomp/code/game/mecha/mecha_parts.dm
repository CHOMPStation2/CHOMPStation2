/obj/item/mecha_parts/chassis/hades
	name = "Hades Chassis"

/obj/item/mecha_parts/chassis/hades/Initialize(mapload)
	. = ..()
	construct = new /datum/construction/mecha/hades_chassis(src)

/obj/item/mecha_parts/part/hades_torso
	name="Hades Torso"
	icon_state = "janus_harness"

/obj/item/mecha_parts/part/hades_head
	name="Hades Head"
	icon_state = "janus_head"

/obj/item/mecha_parts/part/hades_left_arm
	name="Hades Left Arm"
	icon_state = "janus_l_arm"

/obj/item/mecha_parts/part/hades_right_arm
	name="Hades Right Arm"
	icon_state = "janus_r_arm"

/obj/item/mecha_parts/part/hades_left_leg
	name="Hades Left Leg"
	icon_state = "janus_l_leg"

/obj/item/mecha_parts/part/hades_right_leg
	name="Prototype Durand Right Leg"
	icon_state = "janus_r_leg"

/obj/item/circuitboard/mecha/hades/targeting
	name = "stange targeting circuit"

/obj/item/circuitboard/mecha/hades/peripherals
	name = "stange peripheral circuit"

/obj/item/circuitboard/mecha/hades/main
	name = "stange control circuit"
