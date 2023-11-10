//Modular honk borg
//This restructures how borg additions are done to make them sane/modular/maintainable
//Also makes it easier to make new borgs

//Add ourselves to the borg list
/hook/startup/proc/Modular_Borg_init_Honk()
	robot_modules["Clown"] = /obj/item/weapon/robot_module/robot/clerical/honkborg
	robot_module_types += "Clown" //Add ourselves to global
	return 1

/obj/item/weapon/robot_module/robot/clerical/honkborg
	name = "clown robot module"
	channels = list("Service" = 1,
					"Entertainment" = 1)
	pto_type = PTO_CIVILIAN
	can_be_pushed = 0

/obj/item/weapon/robot_module/robot/clerical/honkborg/create_equipment(var/mob/living/silicon/robot/R)
	src.modules += new /obj/item/weapon/gripper/service(src)
	src.modules += new /obj/item/weapon/reagent_containers/glass/bucket(src)
	src.modules += new /obj/item/weapon/material/minihoe(src)
	src.modules += new /obj/item/device/analyzer/plant_analyzer(src)
	src.modules += new /obj/item/weapon/storage/bag/serviceborg(src)
	src.modules += new /obj/item/weapon/robot_harvester(src)
	src.modules += new /obj/item/device/multitool(src)
	src.modules += new /obj/item/weapon/dogborg/jaws/small(src)
	src.modules += new /obj/item/device/boop_module(src)
	src.modules += new /obj/item/weapon/dogborg/pounce(src)
	src.modules += new /obj/item/weapon/bikehorn(src)
	src.modules += new /obj/item/weapon/gun/launcher/confetti_cannon/robot(src)

	var/obj/item/weapon/rsf/M = new /obj/item/weapon/rsf(src)
	M.stored_matter = 30
	src.modules += M

	src.modules += new /obj/item/weapon/reagent_containers/dropper/industrial(src)

	var/obj/item/weapon/flame/lighter/zippo/L = new /obj/item/weapon/flame/lighter/zippo(src)
	L.lit = 1
	src.modules += L

	src.modules += new /obj/item/weapon/tray/robotray(src)
	src.modules += new /obj/item/weapon/reagent_containers/borghypo/service(src)

	var/obj/item/device/dogborg/sleeper/compactor/honkborg/B = new /obj/item/device/dogborg/sleeper/compactor/honkborg(src)
	src.modules += B
	src.emag += new /obj/item/weapon/dogborg/pounce(src)
	..()
