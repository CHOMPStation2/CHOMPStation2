/hook/startup/proc/robot_modules_yw()
	robot_modules["XenoMaid"] = /obj/item/weapon/robot_module/xenomaid
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

