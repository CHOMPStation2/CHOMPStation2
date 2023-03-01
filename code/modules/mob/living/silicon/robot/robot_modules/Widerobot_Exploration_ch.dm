//Lets make this shit more sane-shark
//Modular Exploration borg
//This restructures how borg additions are done to make them sane/modular/maintainable
//Also makes it easier to make new borgs
/hook/startup/proc/Modular_Borg_init_Exploration()
	robot_modules["ExploreHound"] = /obj/item/weapon/robot_module/robot/exploration //add to array
	robot_module_types += "ExploreHound" //Add to global list

//Explo doggos
/obj/item/weapon/robot_module/robot/exploration
	name = "ExploreHound"
	channels = list("Exploration" = 1)
	languages = list(
					LANGUAGE_SOL_COMMON	= 1,
					LANGUAGE_UNATHI		= 1,
					LANGUAGE_SIIK		= 1,
					LANGUAGE_AKHANI		= 1,
					LANGUAGE_SKRELLIAN	= 1,
					LANGUAGE_SKRELLIANFAR = 0,
					LANGUAGE_ROOTLOCAL	= 0,
					LANGUAGE_TRADEBAND	= 1,
					LANGUAGE_GUTTER		= 0,
					LANGUAGE_SCHECHI	= 1,
					LANGUAGE_EAL		= 1,
					LANGUAGE_TERMINUS	= 1,
					LANGUAGE_SIGN		= 0
					)

/obj/item/weapon/robot_module/robot/exploration
	sprites = list(
				"ExploreHound" = "exploration",
				)
	can_be_pushed = 0
/obj/item/weapon/robot_module/robot/exploration/New(var/mob/living/silicon/robot/R)
	src.modules += new /obj/item/weapon/dogborg/jaws/small(src)
	src.modules += new /obj/item/device/dogborg/boop_module(src)
	src.modules += new /obj/item/device/dogborg/sleeper/K9/exploration(src)
	src.modules += new /obj/item/weapon/gun/energy/locked/phasegun/unlocked/mounted/cyborg(src)
	src.modules += new /obj/item/device/cataloguer(src)
	src.modules += new /obj/item/roller_holder(src)
	src.modules += new /obj/item/weapon/gun/energy/taser/mounted/cyborg/flare(src)

	src.emag 	 = new /obj/item/weapon/dogborg/pounce(src)

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

	R.can_buckle = 1
	R.icon 		 = 'modular_chomp/icons/mob/widerobot_exp_ch.dmi'
	R.wideborg_dept = R.icon
	R.hands.icon = 'icons/mob/screen1_robot_vr.dmi'
	R.ui_style_vr = TRUE
	R.pixel_x 	 = -16
	R.old_x 	 = -16
	R.default_pixel_x = -16
	R.dogborg = TRUE
	R.vore_capacity = 1
	R.vore_capacity_ex = list("stomach" = 1)
	R.wideborg = TRUE
	..()

/obj/item/device/dogborg/sleeper/K9/exploration //The K9 portabrig
	name = "Store-Belly"
	desc = "Equipment for a ExploreHound unit. A mounted portable-storage device that holds supplies/person."
	icon_state = "sleeperb"
	injection_chems = null
	medsensor = FALSE
	recycles = TRUE
	max_item_count = 4

/obj/item/weapon/gun/energy/taser/mounted/cyborg/flare
	name = "flare gun"
	desc = "A flare-gun"
	projectile_type = /obj/item/projectile/energy/flash/flare
	fire_sound = 'sound/weapons/tablehit1.ogg'