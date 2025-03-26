/datum/construction/mecha/scarab_chassis
	steps = list(list("key"=/obj/item/mecha_parts/part/scarab_torso),//1
					list("key"=/obj/item/mecha_parts/part/scarab_left_arm),//2
					list("key"=/obj/item/mecha_parts/part/scarab_right_arm),//3
					list("key"=/obj/item/mecha_parts/part/scarab_left_legs),//4
					list("key"=/obj/item/mecha_parts/part/scarab_right_legs),//5
					list("key"=/obj/item/mecha_parts/part/scarab_head)
				)

/datum/construction/mecha/scarab_chassis/custom_action(step, obj/item/I, mob/user)
	user.visible_message("[user] has connected [I] to [holder].", "You connect [I] to [holder]")
	holder.overlays += I.icon_state
	qdel(I)
	return 1

/datum/construction/mecha/scarab_chassis/action(obj/item/I,mob/user as mob)
	return check_all_steps(I,user)

/datum/construction/mecha/scarab_chassis/spawn_result()
	var/obj/item/mecha_parts/chassis/const_holder = holder
	const_holder.construct = new /datum/construction/reversible/mecha/scarab(const_holder)
	const_holder.icon = 'icons/mecha/mech_construction_ch.dmi'
	const_holder.icon_state = "scarab_chassis_complete"
	const_holder.density = 1
	spawn()
		qdel(src)
	return


/datum/construction/reversible/mecha/scarab
	result = "/obj/mecha/combat/scarab"
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
					list("key"=/obj/item/stack/material/plasteel,
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
					list("key"=/obj/item/stack/material/steel,
							"backkey"=IS_SCREWDRIVER,
							"desc"="Advanced capacitor is secured"),
					//7
					list("key"=IS_SCREWDRIVER,
							"backkey"=IS_CROWBAR,
							"desc"="Advanced capacitor is installed"),
					//8
					list("key"=/obj/item/stock_parts/capacitor/adv,
							"backkey"=IS_SCREWDRIVER,
							"desc"="Advanced scanner module is secured"),
					//9
					list("key"=IS_SCREWDRIVER,
							"backkey"=IS_CROWBAR,
							"desc"="Advanced scanner module is installed"),
					//10
					list("key"=/obj/item/stock_parts/scanning_module/adv,
							"backkey"=IS_SCREWDRIVER,
							"desc"="Targeting module is secured"),
					//11
					list("key"=IS_SCREWDRIVER,
							"backkey"=IS_CROWBAR,
							"desc"="Targeting module is installed"),
					//12
					list("key"=/obj/item/circuitboard/mecha/scarab/targeting,
							"backkey"=IS_SCREWDRIVER,
							"desc"="Peripherals control module is secured"),
					//13
					list("key"=IS_SCREWDRIVER,
							"backkey"=IS_CROWBAR,
							"desc"="Peripherals control module is installed"),
					//14
					list("key"=/obj/item/circuitboard/mecha/scarab/peripherals,
							"backkey"=IS_SCREWDRIVER,
							"desc"="Central control module is secured"),
					//15
					list("key"=IS_SCREWDRIVER,
							"backkey"=IS_CROWBAR,
							"desc"="Central control module is installed"),
					//16
					list("key"=/obj/item/circuitboard/mecha/scarab/main,
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

/datum/construction/reversible/mecha/scarab/action(obj/item/I,mob/user as mob)
	return check_step(I,user)

/datum/construction/reversible/mecha/scarab/custom_action(index, diff, obj/item/I, mob/user)
	if(!..())
		return 0

	switch(index)
		if(20)
			user.visible_message("[user] connects [holder] hydraulic systems", "You connect [holder] hydraulic systems.")
			holder.icon_state = "scarab_chassis_complete"
		if(19)
			if(diff==FORWARD)
				user.visible_message("[user] activates [holder] hydraulic systems.", "You activate [holder] hydraulic systems.")
				holder.icon_state = "scarab_chassis_complete"
			else
				user.visible_message("[user] disconnects [holder] hydraulic systems", "You disconnect [holder] hydraulic systems.")
				holder.icon_state = "scarab_chassis_complete"
		if(18)
			if(diff==FORWARD)
				user.visible_message("[user] adds the wiring to [holder].", "You add the wiring to [holder].")
				holder.icon_state = "scarab_wire1"
			else
				user.visible_message("[user] deactivates [holder] hydraulic systems.", "You deactivate [holder] hydraulic systems.")
				holder.icon_state = "scarab_chassis_complete"
		if(17)
			if(diff==FORWARD)
				user.visible_message("[user] adjusts the wiring of [holder].", "You adjust the wiring of [holder].")
				holder.icon_state = "scarab_wire2"
			else
				user.visible_message("[user] removes the wiring from [holder].", "You remove the wiring from [holder].")
				new /obj/item/stack/cable_coil(get_turf(holder), 4)
				holder.icon_state = "scarab_chassis_complete"
		if(16)
			if(diff==FORWARD)
				user.visible_message("[user] installs the central control module into [holder].", "You install the central computer mainboard into [holder].")
				qdel(I)
				holder.icon_state = "scarab_chip1"
			else
				user.visible_message("[user] disconnects the wiring of [holder].", "You disconnect the wiring of [holder].")
				holder.icon_state = "scarab_wire1"
		if(15)
			if(diff==FORWARD)
				user.visible_message("[user] secures the mainboard.", "You secure the mainboard.")
				holder.icon_state = "scarab_chip1"
			else
				user.visible_message("[user] removes the central control module from [holder].", "You remove the central computer mainboard from [holder].")
				new /obj/item/circuitboard/mecha/scarab/main(get_turf(holder))
				holder.icon_state = "scarab_wire2"
		if(14)
			if(diff==FORWARD)
				user.visible_message("[user] installs the peripherals control module into [holder].", "You install the peripherals control module into [holder].")
				qdel(I)
				holder.icon_state = "scarab_chip2"
			else
				user.visible_message("[user] unfastens the mainboard.", "You unfasten the mainboard.")
				holder.icon_state = "scarab_chip1"
		if(13)
			if(diff==FORWARD)
				user.visible_message("[user] secures the peripherals control module.", "You secure the peripherals control module.")
				holder.icon_state = "scarab_chip2"
			else
				user.visible_message("[user] removes the peripherals control module from [holder].", "You remove the peripherals control module from [holder].")
				new /obj/item/circuitboard/mecha/scarab/peripherals(get_turf(holder))
				holder.icon_state = "scarab_chip1"
		if(12)
			if(diff==FORWARD)
				user.visible_message("[user] installs the weapon control module into [holder].", "You install the weapon control module into [holder].")
				qdel(I)
				holder.icon_state = "scarab_chip3"
			else
				user.visible_message("[user] unfastens the peripherals control module.", "You unfasten the peripherals control module.")
				holder.icon_state = "scarab_chip1"
		if(11)
			if(diff==FORWARD)
				user.visible_message("[user] secures the weapon control module.", "You secure the weapon control module.")
				holder.icon_state = "scarab_chip3"
			else
				user.visible_message("[user] removes the weapon control module from [holder].", "You remove the weapon control module from [holder].")
				new /obj/item/circuitboard/mecha/scarab/targeting(get_turf(holder))
				holder.icon_state = "scarab_chip2"
		if(10)
			if(diff==FORWARD)
				user.visible_message("[user] installs advanced scanner module to [holder].", "You install advanced scanner module to [holder].")
				qdel(I)
				holder.icon_state = "scarab_chip4"
			else
				user.visible_message("[user] unfastens the weapon control module.", "You unfasten the weapon control module.")
				holder.icon_state = "scarab_chip3"
		if(9)
			if(diff==FORWARD)
				user.visible_message("[user] secures the advanced scanner module.", "You secure the advanced scanner module.")
				holder.icon_state = "scarab_chip4"
			else
				user.visible_message("[user] removes the advanced scanner module from [holder].", "You remove the advanced scanner module from [holder].")
				new /obj/item/stock_parts/scanning_module/adv(get_turf(holder))
				holder.icon_state = "scarab_chip3"
		if(8)
			if(diff==FORWARD)
				user.visible_message("[user] installs advanced capacitor to [holder].", "You install advanced capacitor to [holder].")
				qdel(I)
				holder.icon_state = "scarab_chip5"
			else
				user.visible_message("[user] unfastens the advanced scanner module.", "You unfasten the advanced scanner module.")
				holder.icon_state = "scarab_chip3"
		if(7)
			if(diff==FORWARD)
				user.visible_message("[user] secures the advanced capacitor.", "You secure the advanced capacitor.")
				holder.icon_state = "scarab_chip5"
			else
				user.visible_message("[user] removes the advanced capacitor from [holder].", "You remove the advanced capacitor from [holder].")
				new /obj/item/stock_parts/capacitor/adv(get_turf(holder))
				holder.icon_state = "scarab_chip5"
		if(6)
			if(diff==FORWARD)
				user.visible_message("[user] installs internal armor layer to [holder].", "You install internal armor layer to [holder].")
				holder.icon_state = "scarab_chip5"
			else
				user.visible_message("[user] unfastens the advanced capacitor.", "You unfasten the advanced capacitor.")
				holder.icon_state = "scarab_chip4"
		if(5)
			if(diff==FORWARD)
				user.visible_message("[user] secures internal armor layer.", "You secure internal armor layer.")
				holder.icon_state = "scarab_chip5"
			else
				user.visible_message("[user] pries internal armor layer from [holder].", "You prie internal armor layer from [holder].")
				new /obj/item/stack/material/steel(get_turf(holder), 5)
				holder.icon_state = "scarab_chip5"
		if(4)
			if(diff==FORWARD)
				user.visible_message("[user] welds internal armor layer to [holder].", "You weld the internal armor layer to [holder].")
				holder.icon_state = "scarab_weld1"
			else
				user.visible_message("[user] unfastens the internal armor layer.", "You unfasten the internal armor layer.")
				holder.icon_state = "scarab_chip5"
		if(3)
			if(diff==FORWARD)
				user.visible_message("[user] installs external armour layers to [holder].", "You install the external armor layer to [holder].")
				holder.icon_state = "scarab_weld2"
			else
				user.visible_message("[user] cuts internal armor layer from [holder].", "You cut the internal armor layer from [holder].")
				holder.icon_state = "scarab_chip5"
		if(2)
			if(diff==FORWARD)
				user.visible_message("[user] secures external armor layer.", "You secure the external armor layer.")
				holder.icon_state = "scarab_weld2"
			else
				user.visible_message("[user] pries the external armor layer from [holder].", "You pry external armor layer from [holder].")
				new /obj/item/stack/material/plasteel(get_turf(holder), 5)
				holder.icon_state = "scarab_weld1"
		if(1)
			if(diff==FORWARD)
				user.visible_message("[user] welds external armor layer to [holder].", "You weld external armor layer to [holder].")
			else
				user.visible_message("[user] unfastens external armor layer.", "You unfasten the external armor layer.")
				holder.icon_state = "scarab_weld2"
	return 1

/datum/construction/reversible/mecha/scarab/spawn_result()
	..()
	feedback_inc("mecha_scarab_created",1)
	return
