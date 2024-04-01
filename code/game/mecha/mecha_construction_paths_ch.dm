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
					 list("key"=/obj/item/weapon/stock_parts/capacitor/adv,
					 		"backkey"=IS_SCREWDRIVER,
					 		"desc"="Advanced scanner module is secured"),
					 //9
					 list("key"=IS_SCREWDRIVER,
					 		"backkey"=IS_CROWBAR,
					 		"desc"="Advanced scanner module is installed"),
					 //10
					 list("key"=/obj/item/weapon/stock_parts/scanning_module/adv,
					 		"backkey"=IS_SCREWDRIVER,
					 		"desc"="Targeting module is secured"),
					 //11
					 list("key"=IS_SCREWDRIVER,
					 		"backkey"=IS_CROWBAR,
					 		"desc"="Targeting module is installed"),
					 //12
					 list("key"=/obj/item/weapon/circuitboard/mecha/scarab/targeting,
					 		"backkey"=IS_SCREWDRIVER,
					 		"desc"="Peripherals control module is secured"),
					 //13
					 list("key"=IS_SCREWDRIVER,
					 		"backkey"=IS_CROWBAR,
					 		"desc"="Peripherals control module is installed"),
					 //14
					 list("key"=/obj/item/weapon/circuitboard/mecha/scarab/peripherals,
					 		"backkey"=IS_SCREWDRIVER,
					 		"desc"="Central control module is secured"),
					 //15
					 list("key"=IS_SCREWDRIVER,
					 		"backkey"=IS_CROWBAR,
					 		"desc"="Central control module is installed"),
					 //16
					 list("key"=/obj/item/weapon/circuitboard/mecha/scarab/main,
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
				new /obj/item/weapon/circuitboard/mecha/scarab/main(get_turf(holder))
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
				new /obj/item/weapon/circuitboard/mecha/scarab/peripherals(get_turf(holder))
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
				new /obj/item/weapon/circuitboard/mecha/scarab/targeting(get_turf(holder))
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
				new /obj/item/weapon/stock_parts/scanning_module/adv(get_turf(holder))
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
				new /obj/item/weapon/stock_parts/capacitor/adv(get_turf(holder))
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


//Fighters

//////////////////////
//		Pinnace
//////////////////////
/datum/construction/mecha/fighter/pinnace_chassis
	result = "/obj/mecha/combat/fighter/pinnace"
	steps = list(list("key"=/obj/item/mecha_parts/fighter/part/pinnace_core),//1
					 list("key"=/obj/item/mecha_parts/fighter/part/pinnace_cockpit),//2
					 list("key"=/obj/item/mecha_parts/fighter/part/pinnace_main_engine),//3
					 list("key"=/obj/item/mecha_parts/fighter/part/pinnace_left_engine),//4
					 list("key"=/obj/item/mecha_parts/fighter/part/pinnace_right_engine),//5
					 list("key"=/obj/item/mecha_parts/fighter/part/pinnace_left_wing),//6
					 list("key"=/obj/item/mecha_parts/fighter/part/pinnace_right_wing)//final
					)

/datum/construction/mecha/fighter/pinnace_chassis/custom_action(step, obj/item/I, mob/user)
	user.visible_message("[user] has connected [I] to [holder].", "You connect [I] to [holder]")
	holder.add_overlay("[I.icon_state]+o")
	qdel(I)
	return 1

/datum/construction/mecha/fighter/pinnace_chassis/action(obj/item/I,mob/user as mob)
	return check_all_steps(I,user)

/datum/construction/mecha/fighter/pinnace_chassis/spawn_result()
	var/obj/item/mecha_parts/chassis/const_holder = holder
	const_holder.construct = new /datum/construction/reversible/mecha/fighter/pinnace(const_holder)
	const_holder.icon = 'modular_chomp/icons/mecha/fighters_construction64x64.dmi'
	const_holder.icon_state = "pinnace0"
	const_holder.density = 1
	spawn()
		qdel(src)
	return

/datum/construction/reversible/mecha/fighter/pinnace
	result = "/obj/mecha/combat/fighter/pinnace"
	steps = list(
					//1
					list("key"=/obj/item/weapon/weldingtool,
							"backkey"=IS_WRENCH,
							"desc"="External armor is bolted into place."),
					//2
					list("key"=IS_WRENCH,
							"backkey"=IS_CROWBAR,
							"desc"="External armor is installed."),
					//3
					list("key"=/obj/item/stack/material/plasteel,
							"backkey"=/obj/item/weapon/weldingtool,
							"desc"="The internal armor is welded into place."),
					//4
					list("key"=/obj/item/weapon/weldingtool,
							"backkey"=IS_WRENCH,
							"desc"="The internal armor is bolted into place."),
					//5
					list("key"=IS_WRENCH,
							"backkey"=IS_CROWBAR,
							"desc"="The internal armor is installed."),
					//6
					list("key"=/obj/item/stack/material/steel,
							"backkey"=IS_SCREWDRIVER,
							"desc"="The manual flight control instruments are secured."),
					//7
					list("key"=IS_SCREWDRIVER,
							"backkey"=IS_CROWBAR,
							"desc"="The manual flight control instruments are installed."),
					//8
					list("key"=/obj/item/circuitboard/mecha/fighter/pinnace/cockpitboard,
							"backkey"=IS_SCREWDRIVER,
							"desc"="The advanced capacitor is secured."),
					//9
					list("key"=IS_SCREWDRIVER,
							"backkey"=IS_CROWBAR,
							"desc"="The advanced capacitor is installed."),
					//10
					list("key"=/obj/item/weapon/stock_parts/capacitor/adv,
							"backkey"=IS_SCREWDRIVER,
							"desc"="The targeting module is secured."),
					//11
					list("key"=IS_SCREWDRIVER,
							"backkey"=IS_CROWBAR,
							"desc"="The targeting module is installed."),
					//12
					list("key"=/obj/item/circuitboard/mecha/fighter/pinnace/targeting,
							"backkey"=IS_SCREWDRIVER,
							"desc"="The flight control module is secured."),
					//13
					list("key"=IS_SCREWDRIVER,
							"backkey"=IS_CROWBAR,
							"desc"="The flight control module is installed."),
					//14
					list("key"=/obj/item/circuitboard/mecha/fighter/pinnace/flight,
							"backkey"=IS_SCREWDRIVER,
							"desc"="The central control module is secured."),
					//15
					list("key"=IS_SCREWDRIVER,
							"backkey"=IS_CROWBAR,
							"desc"="The central control module is installed."),
					//16
					list("key"=/obj/item/circuitboard/mecha/fighter/pinnace/main,
							"backkey"=IS_SCREWDRIVER,
							"desc"="The internal wiring is adjusted."),
					//17
					list("key"=/obj/item/weapon/tool/wirecutters,
							"backkey"=IS_SCREWDRIVER,
							"desc"="The internal wiring is added."),
					//18
					list("key"=/obj/item/stack/cable_coil,
							"backkey"=IS_SCREWDRIVER,
							"desc"="The hydraulic landing gear are deployed."),
					//19
					list("key"=IS_SCREWDRIVER,
							"backkey"=IS_WRENCH,
							"desc"="The hydraulic landing gear are attached."),
					//20
					list("key"=IS_WRENCH,
							"desc"="The hydraulic landing gear are detached.")
					)

/datum/construction/reversible/mecha/fighter/pinnace/action(obj/item/I,mob/user as mob)
	return check_step(I,user)

/datum/construction/reversible/mecha/fighter/pinnace/custom_action(index, diff, obj/item/I, mob/user)
	if(!..())
		return 0

	switch(index)
		if(20)
			user.visible_message("[user] attaches [holder]'s hydraulic landing gear.", "You attach [holder]'s hydraulic landing gear.")
			holder.icon_state = "pinnace1"
		if(19)
			if(diff==FORWARD)
				user.visible_message("[user] deploys [holder]'s hydraulic landing gear.", "You deploy [holder]'s hydraulic landing gear.")
				holder.icon_state = "pinnace2"
			else
				user.visible_message("[user] removes [holder]'s hydraulic landing gear.", "You remove [holder]'s hydraulic landing gear.")
				holder.icon_state = "pinnace0"
		if(18)
			if(diff==FORWARD)
				user.visible_message("[user] adds the internal wiring to [holder].", "You add the internal wiring to [holder].")
				holder.icon_state = "pinnace3"
			else
				user.visible_message("[user] retracts [holder]'s hydraulic landing gear.", "You retract [holder]'s hydraulic landing gear.")
				holder.icon_state = "pinnace1"
		if(17)
			if(diff==FORWARD)
				user.visible_message("[user] adjusts the internal wiring of [holder].", "You adjust the internal wiring of [holder].")
				holder.icon_state = "pinnace4"
			else
				user.visible_message("[user] removes the internal wiring from [holder].", "You remove the internal wiring from [holder].")
				var/obj/item/stack/cable_coil/coil = new /obj/item/stack/cable_coil(get_turf(holder))
				coil.amount = 4
				holder.icon_state = "pinnace2"
		if(16)
			if(diff==FORWARD)
				user.visible_message("[user] installs the central control module into [holder].", "You install the central control module into [holder].")
				qdel(I)
				holder.icon_state = "pinnace5"
			else
				user.visible_message("[user] disconnects the wiring of [holder].", "You disconnect the wiring of [holder].")
				holder.icon_state = "pinnace3"
		if(15)
			if(diff==FORWARD)
				user.visible_message("[user] secures the central control module.", "You secure the central control module.")
				holder.icon_state = "pinnace6"
			else
				user.visible_message("[user] removes the central control module from [holder].", "You remove the central control module from [holder].")
				new /obj/item/circuitboard/mecha/fighter/pinnace/main(get_turf(holder))
				holder.icon_state = "pinnace4"
		if(14)
			if(diff==FORWARD)
				user.visible_message("[user] installs the flight control module into [holder].", "You install the flight control module into [holder].")
				qdel(I)
				holder.icon_state = "pinnace7"
			else
				user.visible_message("[user] unfastens the central control module.", "You unfasten the central control module.")
				holder.icon_state = "pinnace5"
		if(13)
			if(diff==FORWARD)
				user.visible_message("[user] secures the flight control module.", "You secure the flight control module.")
				holder.icon_state = "pinnace8"
			else
				user.visible_message("[user] removes the flight control module from [holder].", "You remove the flight control module from [holder].")
				new /obj/item/circuitboard/mecha/fighter/pinnace/flight(get_turf(holder))
				holder.icon_state = "pinnace6"
		if(12)
			if(diff==FORWARD)
				user.visible_message("[user] installs the targeting control module into [holder].", "You install the targeting control module into [holder].")
				qdel(I)
				holder.icon_state = "pinnace9"
			else
				user.visible_message("[user] unfastens the peripherals control module.", "You unfasten the peripherals control module.")
				holder.icon_state = "pinnace7"
		if(11)
			if(diff==FORWARD)
				user.visible_message("[user] secures the targeting control module.", "You secure the targeting control module.")
				holder.icon_state = "pinnace10"
			else
				user.visible_message("[user] removes the targeting control module from [holder].", "You remove the targeting control module from [holder].")
				new /obj/item/circuitboard/mecha/fighter/pinnace/targeting(get_turf(holder))
				holder.icon_state = "pinnace8"
		if(10)
			if(diff==FORWARD)
				user.visible_message("[user] installs the advanced capacitor into [holder].", "You install the advanced capacitor into [holder].")
				qdel(I)
				holder.icon_state = "pinnace11"
			else
				user.visible_message("[user] unfastens the targeting control module.", "You unfasten the targeting control module.")
				holder.icon_state = "pinnace9"
		if(9)
			if(diff==FORWARD)
				user.visible_message("[user] secures the advanced capacitor.", "You secure the advanced capacitor.")
				holder.icon_state = "pinnace12"
			else
				user.visible_message("[user] removes the advanced capacitor from [holder].", "You remove the advanced capacitor from [holder].")
				new /obj/item/weapon/stock_parts/capacitor/adv(get_turf(holder))
				holder.icon_state = "pinnace10"
		if(8)
			if(diff==FORWARD)
				user.visible_message("[user] installs the manual flight controls to [holder].", "You install the manual flight controls to [holder].")
				qdel(I)
				holder.icon_state = "pinnace13"
			else
				user.visible_message("[user] unfastens the advanced capacitor.", "You unfasten the advanced capacitor.")
				holder.icon_state = "pinnace11"
		if(7)
			if(diff==FORWARD)
				user.visible_message("[user] secures the manual flight controls.", "You secure the manual flight controls.")
				holder.icon_state = "pinnace14"
			else
				user.visible_message("[user] removes the manual flight controls from [holder].", "You remove the manual flight controls from [holder].")
				new /obj/item/circuitboard/mecha/fighter/pinnace/cockpitboard(get_turf(holder))
				holder.icon_state = "pinnace12"
		if(6)
			if(diff==FORWARD)
				user.visible_message("[user] installs the internal armor layer to [holder].", "You install the internal armor layer to [holder].")
				holder.icon_state = "pinnace19"
			else
				user.visible_message("[user] unfastens the manual flight controls.", "You unfasten the manual flight controls.")
				holder.icon_state = "pinnace13"
		if(5)
			if(diff==FORWARD)
				user.visible_message("[user] bolts the internal armor layer.", "You bolt the internal armor layer.")
				holder.icon_state = "pinnace20"
			else
				user.visible_message("[user] pries the internal armor layer from [holder].", "You pry the internal armor layer from [holder].")
				var/obj/item/stack/material/steel/MS = new /obj/item/stack/material/steel(get_turf(holder))
				MS.amount = 5
				holder.icon_state = "pinnace14"
		if(4)
			if(diff==FORWARD)
				user.visible_message("[user] welds the internal armor layer into place on [holder].", "You weld the internal armor layer into place on [holder].")
				holder.icon_state = "pinnace21"
			else
				user.visible_message("[user] unbolt the internal armor layer.", "You unbolt the internal armor layer.")
				holder.icon_state = "pinnace19"
		if(3)
			if(diff==FORWARD)
				user.visible_message("[user] installs the external reinforced armor layer to [holder].", "You install the external reinforced armor layer to [holder].")
				holder.icon_state = "pinnace22"
			else
				user.visible_message("[user] cuts internal armor layer from [holder].", "You cut the internal armor layer from [holder].")
				holder.icon_state = "pinnace20"
		if(2)
			if(diff==FORWARD)
				user.visible_message("[user] bolts external armor layer.", "You bolt external reinforced armor layer.")
				holder.icon_state = "pinnace23"
			else
				user.visible_message("[user] pries the external armor layer from [holder].", "You pry external armor layer from [holder].")
				var/obj/item/stack/material/plasteel/MS = new /obj/item/stack/material/plasteel(get_turf(holder))
				MS.amount = 5
				holder.icon_state = "pinnace21"
		if(1)
			if(diff==FORWARD)
				user.visible_message("[user] welds the external armor layer to [holder].", "You weld the external armor layer to [holder].")
			else
				user.visible_message("[user] unbolts the external armor layer.", "You unbolt the external armor layer.")
				holder.icon_state = "pinnace22"
	return 1

/datum/construction/reversible/mecha/fighter/pinnace/spawn_result()
	..()
	feedback_inc("mecha_fighter_pinnace_created",1)
	return

//////////////////////
//		Baron
//////////////////////
/datum/construction/mecha/fighter/baron_chassis
	result = "/obj/mecha/combat/fighter/baron"
	steps = list(list("key"=/obj/item/mecha_parts/fighter/part/baron_core),//1
					 list("key"=/obj/item/mecha_parts/fighter/part/baron_cockpit),//2
					 list("key"=/obj/item/mecha_parts/fighter/part/baron_main_engine),//3
					 list("key"=/obj/item/mecha_parts/fighter/part/baron_left_engine),//4
					 list("key"=/obj/item/mecha_parts/fighter/part/baron_right_engine),//5
					 list("key"=/obj/item/mecha_parts/fighter/part/baron_left_wing),//6
					 list("key"=/obj/item/mecha_parts/fighter/part/baron_right_wing)//final
					)

/datum/construction/mecha/fighter/baron_chassis/custom_action(step, obj/item/I, mob/user)
	user.visible_message("[user] has connected [I] to [holder].", "You connect [I] to [holder]")
	holder.add_overlay("[I.icon_state]+o")
	qdel(I)
	return 1

/datum/construction/mecha/fighter/baron_chassis/action(obj/item/I,mob/user as mob)
	return check_all_steps(I,user)

/datum/construction/mecha/fighter/baron_chassis/spawn_result()
	var/obj/item/mecha_parts/chassis/const_holder = holder
	const_holder.construct = new /datum/construction/reversible/mecha/fighter/baron(const_holder)
	const_holder.icon = 'modular_chomp/icons/mecha/fighters_construction64x64.dmi'
	const_holder.icon_state = "baron0"
	const_holder.density = 1
	spawn()
		qdel(src)
	return

/datum/construction/reversible/mecha/fighter/baron
	result = "/obj/mecha/combat/fighter/baron"
	steps = list(
					//1
					list("key"=/obj/item/weapon/weldingtool,
							"backkey"=IS_WRENCH,
							"desc"="External armor is bolted into place."),
					//2
					list("key"=IS_WRENCH,
							"backkey"=IS_CROWBAR,
							"desc"="External armor is installed."),
					//3
					list("key"=/obj/item/stack/material/plasteel,
							"backkey"=/obj/item/weapon/weldingtool,
							"desc"="The internal armor is welded into place."),
					//4
					list("key"=/obj/item/weapon/weldingtool,
							"backkey"=IS_WRENCH,
							"desc"="The internal armor is bolted into place."),
					//5
					list("key"=IS_WRENCH,
							"backkey"=IS_CROWBAR,
							"desc"="The internal armor is installed."),
					//6
					list("key"=/obj/item/stack/material/steel,
							"backkey"=IS_SCREWDRIVER,
							"desc"="The manual flight control instruments are secured."),
					//7
					list("key"=IS_SCREWDRIVER,
							"backkey"=IS_CROWBAR,
							"desc"="The manual flight control instruments are installed."),
					//8
					list("key"=/obj/item/circuitboard/mecha/fighter/baron/cockpitboard,
							"backkey"=IS_SCREWDRIVER,
							"desc"="The advanced capacitor is secured."),
					//9
					list("key"=IS_SCREWDRIVER,
							"backkey"=IS_CROWBAR,
							"desc"="The advanced capacitor is installed."),
					//10
					list("key"=/obj/item/weapon/stock_parts/capacitor/adv,
							"backkey"=IS_SCREWDRIVER,
							"desc"="The targeting module is secured."),
					//11
					list("key"=IS_SCREWDRIVER,
							"backkey"=IS_CROWBAR,
							"desc"="The targeting module is installed."),
					//12
					list("key"=/obj/item/circuitboard/mecha/fighter/baron/targeting,
							"backkey"=IS_SCREWDRIVER,
							"desc"="The flight control module is secured."),
					//13
					list("key"=IS_SCREWDRIVER,
							"backkey"=IS_CROWBAR,
							"desc"="The flight control module is installed."),
					//14
					list("key"=/obj/item/circuitboard/mecha/fighter/baron/flight,
							"backkey"=IS_SCREWDRIVER,
							"desc"="The central control module is secured."),
					//15
					list("key"=IS_SCREWDRIVER,
							"backkey"=IS_CROWBAR,
							"desc"="The central control module is installed."),
					//16
					list("key"=/obj/item/circuitboard/mecha/fighter/baron/main,
							"backkey"=IS_SCREWDRIVER,
							"desc"="The internal wiring is adjusted."),
					//17
					list("key"=/obj/item/weapon/tool/wirecutters,
							"backkey"=IS_SCREWDRIVER,
							"desc"="The internal wiring is added."),
					//18
					list("key"=/obj/item/stack/cable_coil,
							"backkey"=IS_SCREWDRIVER,
							"desc"="The hydraulic landing gear are deployed."),
					//19
					list("key"=IS_SCREWDRIVER,
							"backkey"=IS_WRENCH,
							"desc"="The hydraulic landing gear are attached."),
					//20
					list("key"=IS_WRENCH,
							"desc"="The hydraulic landing gear are detached.")
					)

/datum/construction/reversible/mecha/fighter/baron/action(obj/item/I,mob/user as mob)
	return check_step(I,user)

/datum/construction/reversible/mecha/fighter/baron/custom_action(index, diff, obj/item/I, mob/user)
	if(!..())
		return 0

	switch(index)
		if(20)
			user.visible_message("[user] attaches [holder]'s hydraulic landing gear.", "You attach [holder]'s hydraulic landing gear.")
			holder.icon_state = "baron1"
		if(19)
			if(diff==FORWARD)
				user.visible_message("[user] deploys [holder]'s hydraulic landing gear.", "You deploy [holder]'s hydraulic landing gear.")
				holder.icon_state = "baron2"
			else
				user.visible_message("[user] removes [holder]'s hydraulic landing gear.", "You remove [holder]'s hydraulic landing gear.")
				holder.icon_state = "baron0"
		if(18)
			if(diff==FORWARD)
				user.visible_message("[user] adds the internal wiring to [holder].", "You add the internal wiring to [holder].")
				holder.icon_state = "baron3"
			else
				user.visible_message("[user] retracts [holder]'s hydraulic landing gear.", "You retract [holder]'s hydraulic landing gear.")
				holder.icon_state = "baron1"
		if(17)
			if(diff==FORWARD)
				user.visible_message("[user] adjusts the internal wiring of [holder].", "You adjust the internal wiring of [holder].")
				holder.icon_state = "baron4"
			else
				user.visible_message("[user] removes the internal wiring from [holder].", "You remove the internal wiring from [holder].")
				var/obj/item/stack/cable_coil/coil = new /obj/item/stack/cable_coil(get_turf(holder))
				coil.amount = 4
				holder.icon_state = "baron2"
		if(16)
			if(diff==FORWARD)
				user.visible_message("[user] installs the central control module into [holder].", "You install the central control module into [holder].")
				qdel(I)
				holder.icon_state = "baron5"
			else
				user.visible_message("[user] disconnects the wiring of [holder].", "You disconnect the wiring of [holder].")
				holder.icon_state = "baron3"
		if(15)
			if(diff==FORWARD)
				user.visible_message("[user] secures the central control module.", "You secure the central control module.")
				holder.icon_state = "baron6"
			else
				user.visible_message("[user] removes the central control module from [holder].", "You remove the central control module from [holder].")
				new /obj/item/circuitboard/mecha/fighter/baron/main(get_turf(holder))
				holder.icon_state = "baron4"
		if(14)
			if(diff==FORWARD)
				user.visible_message("[user] installs the flight control module into [holder].", "You install the flight control module into [holder].")
				qdel(I)
				holder.icon_state = "baron7"
			else
				user.visible_message("[user] unfastens the central control module.", "You unfasten the central control module.")
				holder.icon_state = "baron5"
		if(13)
			if(diff==FORWARD)
				user.visible_message("[user] secures the flight control module.", "You secure the flight control module.")
				holder.icon_state = "baron8"
			else
				user.visible_message("[user] removes the flight control module from [holder].", "You remove the flight control module from [holder].")
				new /obj/item/circuitboard/mecha/fighter/baron/flight(get_turf(holder))
				holder.icon_state = "baron6"
		if(12)
			if(diff==FORWARD)
				user.visible_message("[user] installs the targeting control module into [holder].", "You install the targeting control module into [holder].")
				qdel(I)
				holder.icon_state = "baron9"
			else
				user.visible_message("[user] unfastens the peripherals control module.", "You unfasten the peripherals control module.")
				holder.icon_state = "baron7"
		if(11)
			if(diff==FORWARD)
				user.visible_message("[user] secures the targeting control module.", "You secure the targeting control module.")
				holder.icon_state = "baron10"
			else
				user.visible_message("[user] removes the targeting control module from [holder].", "You remove the targeting control module from [holder].")
				new /obj/item/circuitboard/mecha/fighter/baron/targeting(get_turf(holder))
				holder.icon_state = "baron8"
		if(10)
			if(diff==FORWARD)
				user.visible_message("[user] installs the advanced capacitor into [holder].", "You install the advanced capacitor into [holder].")
				qdel(I)
				holder.icon_state = "baron11"
			else
				user.visible_message("[user] unfastens the targeting control module.", "You unfasten the targeting control module.")
				holder.icon_state = "baron9"
		if(9)
			if(diff==FORWARD)
				user.visible_message("[user] secures the advanced capacitor.", "You secure the advanced capacitor.")
				holder.icon_state = "baron12"
			else
				user.visible_message("[user] removes the advanced capacitor from [holder].", "You remove the advanced capacitor from [holder].")
				new /obj/item/weapon/stock_parts/capacitor/adv(get_turf(holder))
				holder.icon_state = "baron10"
		if(8)
			if(diff==FORWARD)
				user.visible_message("[user] installs the manual flight controls to [holder].", "You install the manual flight controls to [holder].")
				qdel(I)
				holder.icon_state = "baron13"
			else
				user.visible_message("[user] unfastens the advanced capacitor.", "You unfasten the advanced capacitor.")
				holder.icon_state = "baron11"
		if(7)
			if(diff==FORWARD)
				user.visible_message("[user] secures the manual flight controls.", "You secure the manual flight controls.")
				holder.icon_state = "baron14"
			else
				user.visible_message("[user] removes the manual flight controls from [holder].", "You remove the manual flight controls from [holder].")
				new /obj/item/circuitboard/mecha/fighter/baron/cockpitboard(get_turf(holder))
				holder.icon_state = "baron12"
		if(6)
			if(diff==FORWARD)
				user.visible_message("[user] installs the internal armor layer to [holder].", "You install the internal armor layer to [holder].")
				holder.icon_state = "baron19"
			else
				user.visible_message("[user] unfastens the manual flight controls.", "You unfasten the manual flight controls.")
				holder.icon_state = "baron13"
		if(5)
			if(diff==FORWARD)
				user.visible_message("[user] bolts the internal armor layer.", "You bolt the internal armor layer.")
				holder.icon_state = "baron20"
			else
				user.visible_message("[user] pries the internal armor layer from [holder].", "You pry the internal armor layer from [holder].")
				var/obj/item/stack/material/steel/MS = new /obj/item/stack/material/steel(get_turf(holder))
				MS.amount = 5
				holder.icon_state = "baron14"
		if(4)
			if(diff==FORWARD)
				user.visible_message("[user] welds the internal armor layer into place on [holder].", "You weld the internal armor layer into place on [holder].")
				holder.icon_state = "baron21"
			else
				user.visible_message("[user] unbolt the internal armor layer.", "You unbolt the internal armor layer.")
				holder.icon_state = "baron19"
		if(3)
			if(diff==FORWARD)
				user.visible_message("[user] installs the external reinforced armor layer to [holder].", "You install the external reinforced armor layer to [holder].")
				holder.icon_state = "baron22"
			else
				user.visible_message("[user] cuts internal armor layer from [holder].", "You cut the internal armor layer from [holder].")
				holder.icon_state = "baron20"
		if(2)
			if(diff==FORWARD)
				user.visible_message("[user] bolts external armor layer.", "You bolt external reinforced armor layer.")
				holder.icon_state = "baron23"
			else
				user.visible_message("[user] pries the external armor layer from [holder].", "You pry external armor layer from [holder].")
				var/obj/item/stack/material/plasteel/MS = new /obj/item/stack/material/plasteel(get_turf(holder))
				MS.amount = 5
				holder.icon_state = "baron21"
		if(1)
			if(diff==FORWARD)
				user.visible_message("[user] welds the external armor layer to [holder].", "You weld the external armor layer to [holder].")
			else
				user.visible_message("[user] unbolts the external armor layer.", "You unbolt the external armor layer.")
				holder.icon_state = "baron22"
	return 1

/datum/construction/reversible/mecha/fighter/baron/spawn_result()
	..()
	feedback_inc("mecha_fighter_baron_created",1)
	return