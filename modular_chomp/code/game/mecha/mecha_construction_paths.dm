//Hades Construction//
/datum/construction/mecha/hades_chassis
	result = "/obj/mecha/combat/hades"
	steps = list(list("key"=/obj/item/mecha_parts/part/hades_torso),//1
					 list("key"=/obj/item/mecha_parts/part/hades_left_arm),//2
					 list("key"=/obj/item/mecha_parts/part/hades_right_arm),//3
					 list("key"=/obj/item/mecha_parts/part/hades_left_leg),//4
					 list("key"=/obj/item/mecha_parts/part/hades_right_leg),//5
					 list("key"=/obj/item/mecha_parts/part/hades_head)
					)

/datum/construction/mecha/hades_chassis/custom_action(step, obj/item/I, mob/user)
	user.visible_message("[user] has connected [I] to [holder].", "You connect [I] to [holder]")
	holder.add_overlay(I.icon_state+"+o")
	qdel(I)
	return 1

/datum/construction/mecha/hades_chassis/action(obj/item/I,mob/user as mob)
	return check_all_steps(I,user)

/datum/construction/mecha/hades_chassis/spawn_result()
	var/obj/item/mecha_parts/chassis/const_holder = holder
	const_holder.construct = new /datum/construction/reversible/mecha/phazon(const_holder)
	const_holder.icon = 'icons/mecha/mech_construction.dmi'
	const_holder.icon_state = "phazon0"
	const_holder.density = TRUE
	spawn()
		qdel(src)
	return

/datum/construction/reversible/mecha/hades
	result = "/obj/mecha/combat/phazon"
	steps = list(
					//1
					list("key"=IS_WELDER,
							"backkey"=IS_WRENCH,
							"desc"="External armor is wrenched."),
					//2
					list("key"=IS_WRENCH,
							"backkey"=IS_CROWBAR,
							"desc"="External armor is installed."),
					//3
					list("key"=/obj/item/stack/material/morphium,
							"backkey"=IS_WELDER,
							"desc"="Internal armor is welded."),
					//4
					list("key"=IS_WELDER,
							"backkey"=IS_WRENCH,
							"desc"="Internal armor is wrenched"),
					//5
					list("key"=IS_WRENCH,
							"backkey"=IS_CROWBAR,
							"desc"="Internal armor is installed"),
					//6
					list("key"=/obj/item/stack/material/void_opal,
							"backkey"=IS_SCREWDRIVER,
							"desc"="Translocator is secured"),  //Chompedit, change hand tele to translocator
					//7
					list("key"=IS_SCREWDRIVER,
							"backkey"=IS_CROWBAR,
							"desc"="Translocator is installed"),  //Chompedit, change hand tele to translocator
					//8
					list("key"=/obj/item/perfect_tele,  //Chompedit, change hand tele to translocator
							"backkey"=IS_SCREWDRIVER,
							"desc"="SMES coil is secured"),
					//9
					list("key"=IS_SCREWDRIVER,
							"backkey"=IS_CROWBAR,
							"desc"="SMES coil is installed"),
					//10
					list("key"=/obj/item/slime_extract/dark,
							"backkey"=IS_SCREWDRIVER,
							"desc"="Targeting module is secured"),
					//11
					list("key"=IS_SCREWDRIVER,
							"backkey"=IS_CROWBAR,
							"desc"="Targeting module is installed"),
					//12
					list("key"=/obj/item/circuitboard/mecha/hades/targeting,
							"backkey"=IS_SCREWDRIVER,
							"desc"="Peripherals control module is secured"),
					//13
					list("key"=IS_SCREWDRIVER,
							"backkey"=IS_CROWBAR,
							"desc"="Peripherals control module is installed"),
					//14
					list("key"=/obj/item/circuitboard/mecha/hades/peripherals,
							"backkey"=IS_SCREWDRIVER,
							"desc"="Central control module is secured"),
					//15
					list("key"=IS_SCREWDRIVER,
							"backkey"=IS_CROWBAR,
							"desc"="Central control module is installed"),
					//16
					list("key"=/obj/item/circuitboard/mecha/hades/main,
							"backkey"=IS_SCREWDRIVER,
							"desc"="The wiring is adjusted"),
					//17
					list("key"=IS_WIRECUTTER,
							"backkey"=IS_SCREWDRIVER,
							"desc"="The wiring is added"),
					//18
					list("key"=/obj/item/stack/cable_coil,
							"backkey"=IS_SCREWDRIVER,
							"desc"="The hydraulic systems are active."),
					//19
					list("key"=IS_SCREWDRIVER,
							"backkey"=IS_WRENCH,
							"desc"="The hydraulic systems are connected."),
					//20
					list("key"=IS_WRENCH,
							"desc"="The hydraulic systems are disconnected.")
					)

/datum/construction/reversible/mecha/hades/action(obj/item/I,mob/user as mob)
	return check_step(I,user)

/datum/construction/reversible/mecha/hades/custom_action(index, diff, obj/item/I, mob/user)
	if(!..())
		return 0

	switch(index)
		if(20)
			user.visible_message("[user] connects [holder] hydraulic systems", "You connect [holder] hydraulic systems.")
			holder.icon_state = "phazon1"
		if(19)
			if(diff==FORWARD)
				user.visible_message("[user] activates [holder] hydraulic systems.", "You activate [holder] hydraulic systems.")
				holder.icon_state = "phazon2"
			else
				user.visible_message("[user] disconnects [holder] hydraulic systems", "You disconnect [holder] hydraulic systems.")
				holder.icon_state = "phazon0"
		if(18)
			if(diff==FORWARD)
				user.visible_message("[user] adds the wiring to [holder].", "You add the wiring to [holder].")
				holder.icon_state = "phazon3"
			else
				user.visible_message("[user] deactivates [holder] hydraulic systems.", "You deactivate [holder] hydraulic systems.")
				holder.icon_state = "phazon1"
		if(17)
			if(diff==FORWARD)
				user.visible_message("[user] adjusts the wiring of [holder].", "You adjust the wiring of [holder].")
				holder.icon_state = "phazon4"
			else
				user.visible_message("[user] removes the wiring from [holder].", "You remove the wiring from [holder].")
				new /obj/item/stack/cable_coil(get_turf(holder), 4)
				holder.icon_state = "phazon2"
		if(16)
			if(diff==FORWARD)
				user.visible_message("[user] installs the central control module into [holder].", "You install the central computer mainboard into [holder].")
				qdel(I)
				holder.icon_state = "phazon5"
			else
				user.visible_message("[user] disconnects the wiring of [holder].", "You disconnect the wiring of [holder].")
				holder.icon_state = "phazon3"
		if(15)
			if(diff==FORWARD)
				user.visible_message("[user] secures the mainboard.", "You secure the mainboard.")
				holder.icon_state = "phazon6"
			else
				user.visible_message("[user] removes the central control module from [holder].", "You remove the central computer mainboard from [holder].")
				new /obj/item/circuitboard/mecha/hades/main(get_turf(holder))
				holder.icon_state = "phazon4"
		if(14)
			if(diff==FORWARD)
				user.visible_message("[user] installs the peripherals control module into [holder].", "You install the peripherals control module into [holder].")
				qdel(I)
				holder.icon_state = "phazon7"
			else
				user.visible_message("[user] unfastens the mainboard.", "You unfasten the mainboard.")
				holder.icon_state = "phazon5"
		if(13)
			if(diff==FORWARD)
				user.visible_message("[user] secures the peripherals control module.", "You secure the peripherals control module.")
				holder.icon_state = "phazon8"
			else
				user.visible_message("[user] removes the peripherals control module from [holder].", "You remove the peripherals control module from [holder].")
				new /obj/item/circuitboard/mecha/hades/peripherals(get_turf(holder))
				holder.icon_state = "phazon6"
		if(12)
			if(diff==FORWARD)
				user.visible_message("[user] installs the weapon control module into [holder].", "You install the weapon control module into [holder].")
				qdel(I)
				holder.icon_state = "phazon9"
			else
				user.visible_message("[user] unfastens the peripherals control module.", "You unfasten the peripherals control module.")
				holder.icon_state = "phazon7"
		if(11)
			if(diff==FORWARD)
				user.visible_message("[user] secures the weapon control module.", "You secure the weapon control module.")
				holder.icon_state = "phazon10"
			else
				user.visible_message("[user] removes the weapon control module from [holder].", "You remove the weapon control module from [holder].")
				new /obj/item/circuitboard/mecha/hades/targeting(get_turf(holder))
				holder.icon_state = "phazon8"
		if(10)
			if(diff==FORWARD)
				user.visible_message("[user] installs the SMES coil to [holder].", "You install the SMES coil to [holder].")
				qdel(I)
				holder.icon_state = "phazon11"
			else
				user.visible_message("[user] unfastens the weapon control module.", "You unfasten the weapon control module.")
				holder.icon_state = "phazon9"
		if(9)
			if(diff==FORWARD)
				user.visible_message("[user] secures the SMES coil.", "You secure the SMES coil.")
				holder.icon_state = "phazon12"
			else
				user.visible_message("[user] removes the SMES coil from [holder].", "You remove the SMES coil from [holder].")
				new /obj/item/slime_extract/dark(get_turf(holder))
				holder.icon_state = "phazon10"
		if(8)
			if(diff==FORWARD)
				user.visible_message("[user] installs the hand teleporter to [holder].", "You install the hand teleporter to [holder].")
				qdel(I)
				holder.icon_state = "phazon13"
			else
				user.visible_message("[user] unfastens the SMES coil.", "You unfasten the SMES coil.")
				holder.icon_state = "phazon11"
		if(7)
			if(diff==FORWARD)
				user.visible_message("[user] secures the hand teleporter.", "You secure the hand teleporter.")
				holder.icon_state = "phazon14"
			else
				user.visible_message("[user] removes the hand teleporter from [holder].", "You remove the hand teleporter from [holder].")
				new /obj/item/hand_tele(get_turf(holder))
				holder.icon_state = "phazon12"
		if(6)
			if(diff==FORWARD)
				user.visible_message("[user] installs the internal armor layer to [holder].", "You install the internal armor layer to [holder].")
				holder.icon_state = "phazon19"
			else
				user.visible_message("[user] unfastens the hand teleporter.", "You unfasten the hand teleporter.")
				holder.icon_state = "phazon13"
		if(5)
			if(diff==FORWARD)
				user.visible_message("[user] secures the internal armor layer.", "You secure the internal armor layer.")
				holder.icon_state = "phazon20"
			else
				user.visible_message("[user] pries the internal armor layer from [holder].", "You pry the internal armor layer from [holder].")
				new /obj/item/stack/material/void_opal(get_turf(holder), 5)
				holder.icon_state = "phazon14"
		if(4)
			if(diff==FORWARD)
				user.visible_message("[user] welds the internal armor layer to [holder].", "You weld the internal armor layer to [holder].")
				holder.icon_state = "phazon21"
			else
				user.visible_message("[user] unfastens the internal armor layer.", "You unfasten the internal armor layer.")
				holder.icon_state = "phazon19"
		if(3)
			if(diff==FORWARD)
				user.visible_message("[user] installs the external reinforced armor layer to [holder].", "You install the external reinforced armor layer to [holder].")
				holder.icon_state = "phazon22"
			else
				user.visible_message("[user] cuts internal armor layer from [holder].", "You cut the internal armor layer from [holder].")
				holder.icon_state = "phazon20"
		if(2)
			if(diff==FORWARD)
				user.visible_message("[user] secures external armor layer.", "You secure external reinforced armor layer.")
				holder.icon_state = "phazon23"
			else
				user.visible_message("[user] pries the external armor layer from [holder].", "You pry external armor layer from [holder].")
				new /obj/item/stack/material/morphium(get_turf(holder), 5)
				holder.icon_state = "phazon21"
		if(1)
			if(diff==FORWARD)
				user.visible_message("[user] welds the external armor layer to [holder].", "You weld the external armor layer to [holder].")
			else
				user.visible_message("[user] unfastens the external armor layer.", "You unfasten the external armor layer.")
				holder.icon_state = "phazon22"
	return 1

/datum/construction/reversible/mecha/hades/spawn_result()
	..()
	feedback_inc("mecha_hades_created",1)
	return