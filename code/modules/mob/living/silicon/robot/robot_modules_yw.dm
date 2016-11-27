/hook/startup/proc/robot_modules_yw()
	robot_modules["XenoMaid"] = /obj/item/weapon/robot_module/xenomaid
	robot_modules["Blade"] = /obj/item/weapon/robot_module/blade
	return 1

/obj/item/weapon/robot_module/xenomaid
	name = "Xenomorph Maid module"
	sprites = list(
					"Xenomorph Maid" = "xenomaid"
					)
	can_be_pushed = 0

/obj/item/weapon/robot_module/xenomaid/New(var/mob/living/silicon/robot/R)
	src.modules += new /obj/item/device/flash(src)
	src.modules += new /obj/item/weapon/soap/nanotrasen(src)
	src.modules += new /obj/item/weapon/storage/bag/trash(src)
	src.modules += new /obj/item/weapon/mop(src)
	src.modules += new /obj/item/device/lightreplacer(src)
	src.emag = new /obj/item/weapon/reagent_containers/spray(src)
	src.emag.reagents.add_reagent("lube", 250)
	src.emag.name = "Lube spray"
	R.icon 		 = 'icons/mob/robots_yw.dmi'
	R.hands.icon = 'icons/mob/screen1_robot_vr.dmi'
	..()



/obj/item/weapon/robot_module/blade
	name = "Blade robot module"
	sprites = list(
					"Blade" = "blade",
					)
	channels = list("Security" = 1)
	networks = list(NETWORK_SECURITY)
	can_be_pushed = 0

/obj/item/weapon/robot_module/blade/New(var/mob/living/silicon/robot/R)
	src.modules += new /obj/item/device/flash(src)
	src.modules += new /obj/item/weapon/handcuffs/cyborg(src) //You need cuffs to be a proper sec borg!
	src.modules += new /obj/item/weapon/dogborg/jaws/big(src) //In case there's some kind of hostile mob.
	src.modules += new /obj/item/weapon/melee/baton/robot(src) //Since the pounce module refused to work, they get a stunbaton instead.
	src.modules += new /obj/item/device/dogborg/boop_module(src) //Boop people on the nose.
	src.modules += new /obj/item/device/dogborg/tongue(src) //This is so they can clean up bloody evidence after it's examined, and so they can lick crew.
	src.modules += new /obj/item/taperoll/police(src) //Block out crime scenes.
	src.modules += new /obj/item/device/dogborg/sleeper/K9(src) //Eat criminals. Bring them to the brig.
	src.modules += new /obj/item/weapon/gun/energy/taser/mounted/cyborg(src) //They /are/ a security borg, after all.
	src.modules += new /obj/item/borg/sight/hud/sec(src) //Security hud to see criminals.
	src.modules += new /obj/item/device/dogborg/pounce_module(src) //Pounce shit test
	src.emag 	 = new /obj/item/weapon/gun/energy/laser/mounted(src) //Emag. Not a big problem.
	R.icon 		 = 'icons/mob/widerobot_vr.dmi'
	R.hands.icon = 'icons/mob/screen1_robot_vr.dmi'
	R.pixel_x 	 = -16
	R.old_x 	 = -16
	..()