//Lets make this shit more sane-shark
//Modular Exploration borg
//This restructures how borg additions are done to make them sane/modular/maintainable
//Also makes it easier to make new borgs
//CHOMPedit: Moving this all to a modular file
/*
/hook/startup/proc/Modular_Borg_init_Exploration()
	robot_modules["Exploration"] = /obj/item/robot_module/robot/exploration //add to array
	robot_module_types += "Exploration" //Add to global list
	return 1

//Explo doggos
/obj/item/robot_module/robot/exploration
	name = "exploration robot module"
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

/obj/item/robot_module/robot/exploration
	can_be_pushed = 0
/obj/item/robot_module/robot/exploration/New(var/mob/living/silicon/robot/R)
	src.modules += new /obj/item/dogborg/sleeper/exploration(src)
	src.modules += new /obj/item/gun/energy/locked/phasegun/unlocked/mounted/cyborg(src)
	src.modules += new /obj/item/cataloguer(src)
	src.modules += new /obj/item/roller_holder(src)
	src.modules += new /obj/item/gun/energy/taser/mounted/cyborg/flare(src)

	src.emag 	 += new /obj/item/dogborg/pounce(src)

	..()

/obj/item/dogborg/sleeper/exploration //No need to inherit from the brig one, we cna direclty make a proper new one
	name = "Store-Belly"
	desc = "Equipment for a ExploreHound unit. A mounted portable-storage device that holds supplies/person."
	icon_state = "sleeperlost"
	injection_chems = null
	stabilizer = TRUE
	compactor = TRUE
	max_item_count = 4
	medsensor = FALSE
	recycles = TRUE

/obj/item/gun/energy/taser/mounted/cyborg/flare
	name = "flare gun"
	desc = "A flare-gun"
	projectile_type = /obj/item/projectile/energy/flash/flare
	fire_sound = 'sound/weapons/tablehit1.ogg'
*/