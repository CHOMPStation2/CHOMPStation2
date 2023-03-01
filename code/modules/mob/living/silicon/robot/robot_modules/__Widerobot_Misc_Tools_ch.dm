//This file is where we define modules we made but where we did not make the borg
//as an example, Medihound has some new additions from us but upstream defines its additions
//This file is offset in compilation to run before any of the station files.

/obj/item/weapon/robot_module/robot/medihound/New()
	..()
	src.modules += new /obj/item/weapon/autopsy_scanner(src)
	src.modules += new /obj/item/weapon/surgical/scalpel/cyborg(src)
	src.modules += new /obj/item/weapon/surgical/hemostat/cyborg(src)
	src.modules += new /obj/item/weapon/surgical/retractor/cyborg(src)
	src.modules += new /obj/item/weapon/surgical/cautery/cyborg(src)
	src.modules += new /obj/item/weapon/surgical/bonegel/cyborg(src)
	src.modules += new /obj/item/weapon/surgical/FixOVein/cyborg(src)
	src.modules += new /obj/item/weapon/surgical/bonesetter/cyborg(src)
	src.modules += new /obj/item/weapon/surgical/circular_saw/cyborg(src)
	src.modules += new /obj/item/weapon/surgical/surgicaldrill/cyborg(src)
	src.modules += new /obj/item/weapon/surgical/bioregen(src)
	src.modules += new /obj/item/weapon/gripper/no_use/organ(src)
	src.modules += new /obj/item/weapon/reagent_containers/dropper(src)
	src.modules += new /obj/item/roller_holder(src) //So we can save people without voring them

//TFF 5/1/20 - Add Ore Scanner for mining drones
/obj/item/weapon/robot_module/drone/mining/New()
	..()
	src.modules += new /obj/item/weapon/mining_scanner(src)

/obj/item/weapon/robot_module/robot/engineering/New()
	..()
	src.modules += new /obj/item/weapon/pipe_dispenser(src)

