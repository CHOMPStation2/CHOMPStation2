//Modular honk borg
//This restructures how borg additions are done to make them sane/modular/maintainable
//Also makes it easier to make new borgs

//Add ourselves to the borg list
/hook/startup/proc/Modular_Borg_init_Honk()
	robot_modules["Clown"] = /obj/item/robot_module/robot/clerical/honkborg // CHOMPEdit - Removal of obj/item/weapon
	robot_module_types += "Clown" //Add ourselves to global
	return 1

/obj/item/robot_module/robot/clerical/honkborg // CHOMPEdit - Removal of obj/item/weapon
	name = "clown robot module"
	channels = list("Service" = 1,
					"Entertainment" = 1)
	pto_type = PTO_CIVILIAN
	can_be_pushed = 0

/obj/item/robot_module/robot/clerical/honkborg/create_equipment(var/mob/living/silicon/robot/R) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/gripper/service(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/reagent_containers/glass/bucket(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/material/minihoe(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/analyzer/plant_analyzer(src) // CHOMPEdit - Removal of obj/item/device
	src.modules += new /obj/item/storage/bag/serviceborg(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/robot_harvester(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/multitool(src) // CHOMPEdit - Removal of obj/item/device
	src.modules += new /obj/item/dogborg/pounce(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/bikehorn(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/gun/launcher/confetti_cannon/robot(src) // CHOMPEdit - Removal of obj/item/weapon

	var/obj/item/rsf/M = new /obj/item/rsf(src) // CHOMPEdit - Removal of obj/item/weapon
	M.stored_matter = 30
	src.modules += M

	src.modules += new /obj/item/reagent_containers/dropper/industrial(src) // CHOMPEdit - Removal of obj/item/weapon

	var/obj/item/flame/lighter/zippo/L = new /obj/item/flame/lighter/zippo(src) // CHOMPEdit - Removal of obj/item/weapon
	L.lit = 1
	src.modules += L

	src.modules += new /obj/item/tray/robotray(src) // CHOMPEdit - Removal of obj/item/weapon
	src.modules += new /obj/item/reagent_containers/borghypo/service(src) // CHOMPEdit - Removal of obj/item/weapon

	var/obj/item/dogborg/sleeper/compactor/honkborg/B = new /obj/item/dogborg/sleeper/compactor/honkborg(src) // CHOMPEdit - Removal of obj/item/device
	src.modules += B
	..()
