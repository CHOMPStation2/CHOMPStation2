//Modular command borg
//This restructures how borg additions are done to make them sane/modular/maintainable
//Also makes it easier to make new borgs

//Add ourselves to the borg list
/hook/startup/proc/Modular_Borg_init_Unity()
	robot_modules["UnityHound"] = /obj/item/weapon/robot_module/robot/chound //Add to module array
	robot_module_types += "UnityHound" //Add ourselves to global
	return 1

//Create our list of known languages.
/obj/item/weapon/robot_module/robot/chound
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
/obj/item/weapon/robot_module/robot/chound
	name = "Unity Hound Module"
	sprites = list(
					"Kcom" = 			list(SKIN_ICON_STATE = "kcom", SKIN_ICON = 'modular_chomp/icons/mob/widerobot_ch.dmi', SKIN_OFFSET = -16, SKIN_HEIGHT = 32),
					"Raptor V-4.1" = 	list(SKIN_ICON_STATE = "chraptor", SKIN_ICON = 'modular_chomp/icons/mob/raptorborg/raptor_ch.dmi', SKIN_OFFSET = -16, SKIN_HEIGHT = 45),
					"Borgi" = 			list(SKIN_ICON_STATE = "borgi", SKIN_ICON = 'modular_chomp/icons/mob/widerobot_ch.dmi', SKIN_OFFSET = -16, SKIN_HEIGHT = 32),
					"MEKA" = 						list(SKIN_ICON_STATE = "mekaunity", SKIN_ICON = 'modular_chomp/icons/mob/tallborg/tallrobots.dmi', SKIN_OFFSET = 0, SKIN_HEIGHT = 64)
					)
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

/obj/item/weapon/robot_module/robot/chound/New(var/mob/living/silicon/robot/R)
	src.modules += new /obj/item/weapon/pen/robopen(src)
	src.modules += new /obj/item/weapon/form_printer(src)
	src.modules += new /obj/item/weapon/gripper/paperwork(src)
	src.modules += new /obj/item/weapon/hand_labeler(src)
	src.modules += new /obj/item/weapon/stamp(src)
	src.modules += new /obj/item/weapon/stamp/denied(src)
	src.modules += new /obj/item/weapon/taskmanager(src)
	src.emag = new /obj/item/weapon/stamp/chameleon(src)
	//src.emag = new /obj/item/weapon/pen/chameleon(src)

	var/datum/matter_synth/water = new /datum/matter_synth(500)
	water.name = "Water reserves"
	water.recharge_rate = 0
	R.water_res = water
	synths += water

	var/obj/item/device/dogborg/tongue/T = new /obj/item/device/dogborg/tongue(src)
	T.water = water
	src.modules += T

	var/obj/item/device/dogborg/sleeper/B = new /obj/item/device/dogborg/sleeper/command(src)
	B.water = water
	src.modules += B

	R.icon = 'modular_chomp/icons/mob/widerobot_ch.dmi'
	R.wideborg_dept = 'modular_chomp/icons/mob/widerobot_ch.dmi'
	R.hands.icon = 'icons/mob/screen1_robot_vr.dmi'
	R.ui_style_vr = TRUE
	R.pixel_x 	 = -16
	R.old_x  	 = -16
	R.default_pixel_x = -16
	R.dogborg = TRUE
	R.vore_capacity = 1
	R.vore_capacity_ex = list("stomach" = 1)
	R.wideborg = TRUE
	R.verbs |= /mob/living/silicon/robot/proc/ex_reserve_refill
	R.verbs |= /mob/living/silicon/robot/proc/robot_mount
	R.verbs |= /mob/living/proc/toggle_rider_reins
	R.verbs |= /mob/living/proc/shred_limb
	R.verbs |= /mob/living/silicon/robot/proc/rest_style

	..()
