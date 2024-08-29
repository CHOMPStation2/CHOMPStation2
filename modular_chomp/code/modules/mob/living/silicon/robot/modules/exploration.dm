/hook/startup/proc/Modular_Borg_init_Exploration()
	robot_modules["Exploration"] = /obj/item/robot_module/robot/exploration //add to array // CHOMPEdit - Removal of obj/item/weapon
	robot_module_types += "Exploration" //Add to global list
	return 1

//Explo doggos
/obj/item/robot_module/robot/exploration // CHOMPEdit - Removal of obj/item/weapon
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

/obj/item/robot_module/robot/exploration // CHOMPEdit - Removal of obj/item/weapon
	can_be_pushed = 0

/obj/item/robot_module/robot/exploration/New(var/mob/living/silicon/robot/R) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/dogborg/sleeper/exploration(src) // CHOMPEdit - Removal of obj/item/device
	src.modules += new /obj/item/cataloguer(src) // CHOMPEdit - Removal of obj/item/device
	src.modules += new /obj/item/gun/energy/taser/mounted/cyborg/flare(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/dogborg/pounce(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/melee/combat_borgblade/explotailspear(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/gun/energy/medigun/mounted/smallmedigun(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/shield_projector/line/exploborg(src)
	src.modules += new /obj/item/roller_holder(src)
	src.modules += new /obj/item/self_repair_system(src) // CHOMPEdit - Removal of obj/item/device

	src.emag += new /obj/item/melee/dogborg/jaws/big/explojaws(src) // CHOMPEdit - Removal of obj/item/weapon

	..()
