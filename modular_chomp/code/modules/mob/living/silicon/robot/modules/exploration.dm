/hook/startup/proc/Modular_Borg_init_Exploration()
	robot_modules["Exploration"] = /obj/item/weapon/robot_module/robot/exploration //add to array
	robot_module_types += "Exploration" //Add to global list
	return 1

//Explo doggos
/obj/item/weapon/robot_module/robot/exploration
	name = "exploration robot module"
	channels = list("Explorer" = 1)
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
	can_be_pushed = 0

/obj/item/weapon/robot_module/robot/exploration/New(var/mob/living/silicon/robot/R)
	src.modules += new /obj/item/device/dogborg/sleeper/exploration(src)
	src.modules += new /obj/item/device/cataloguer(src)
	src.modules += new /obj/item/weapon/gun/energy/taser/mounted/cyborg/flare(src)
	src.modules += new /obj/item/weapon/dogborg/pounce(src)
	src.modules += new /obj/item/weapon/melee/combat_borgblade/explotailspear(src)
	src.modules += new /obj/item/weapon/gun/energy/medigun/mounted/smallmedigun(src)
	src.modules += new /obj/item/shield_projector/line/exploborg(src)
	src.modules += new /obj/item/roller_holder(src)
	src.modules += new /obj/item/device/self_repair_system(src)
	src.modules += new /obj/item/weapon/card/id/exploration/borg(src)

	src.emag += new /obj/item/weapon/melee/dogborg/jaws/big/explojaws(src)

	..()
