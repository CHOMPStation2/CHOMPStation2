//Modular command borg
//This restructures how borg additions are done to make them sane/modular/maintainable
//Also makes it easier to make new borgs

//Add ourselves to the borg list
/hook/startup/proc/Modular_Borg_init_Unity()
	robot_modules["Command"] = /obj/item/robot_module/robot/chound //Add to module array
	robot_module_types += "Command" //Add ourselves to global
	return 1

//Create our list of known languages.
/obj/item/robot_module/robot/chound
	languages = list(
					LANGUAGE_SOL_COMMON	= 1,
					LANGUAGE_TRADEBAND	= 1,
					LANGUAGE_UNATHI		= 1,
					LANGUAGE_SIIK		= 1,
					LANGUAGE_SKRELLIAN	= 1,
					LANGUAGE_ROOTLOCAL	= 0,
					LANGUAGE_GUTTER		= 0,
					LANGUAGE_SCHECHI	= 1,
					//LANGUAGE_EAL		= 1, //missed this in my other EAL removal. same reason as before, dont want borgs to lose eal
					LANGUAGE_SIGN		= 0,
					LANGUAGE_BIRDSONG	= 1,
					LANGUAGE_SAGARU		= 1,
					LANGUAGE_CANILUNZT	= 1,
					LANGUAGE_ECUREUILIAN= 1,
					LANGUAGE_DAEMON		= 1,
					LANGUAGE_ENOCHIAN	= 1,
					LANGUAGE_DRUDAKAR	= 1,
					LANGUAGE_TAVAN		= 1
					)

//Build our Module
/obj/item/robot_module/robot/chound
	name = "command robot module"
	channels = list(
			"Medical" = 1,
			"Engineering" = 1,
			"Security" = 1,
			"Service" = 1,
			"Supply" = 0,
			"Science" = 1,
			"Command" = 1,
			"Explorer" = 0
			)
	pto_type = PTO_CIVILIAN
	can_be_pushed = 0

/obj/item/robot_module/robot/chound/create_equipment(var/mob/living/silicon/robot/R)
	src.modules += new /obj/item/pen/robopen(src)
	src.modules += new /obj/item/form_printer(src)
	src.modules += new /obj/item/gripper/paperwork(src)
	src.modules += new /obj/item/hand_labeler(src)
	src.modules += new /obj/item/stamp(src)
	src.modules += new /obj/item/stamp/denied(src)
	src.modules += new /obj/item/taskmanager(src)
	src.emag += new /obj/item/stamp/chameleon(src)
	src.emag += new /obj/item/pen/chameleon(src)

	src.modules += new /obj/item/dogborg/sleeper/command(src)
	src.emag += new /obj/item/dogborg/pounce(src)
	..()
