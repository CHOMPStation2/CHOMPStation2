//Modular honk borg
//This restructures how borg additions are done to make them sane/modular/maintainable
//Also makes it easier to make new borgs

//Add ourselves to the borg list
/hook/startup/proc/Modular_Borg_init_Honk()
	robot_modules["Honk-Hound"] = /obj/item/weapon/robot_module/robot/clerical/honkborg
	robot_module_types += "Honk-Hound" //Add ourselves to global
	return 1

/obj/item/weapon/robot_module/robot/clerical/honkborg
	name = "honk-hound module"
	sprites = list(
					"Honkborg" = "honkborg",
					"K4T" = "k4tclown" //CHOMPEdit - Tallborgs
					)
	channels = list("Service" = 1,
					"Entertainment" = 1)
	pto_type = PTO_CIVILIAN
	can_be_pushed = 0

/obj/item/weapon/robot_module/robot/clerical/honkborg/New(var/mob/living/silicon/robot/R)
	src.modules += new /obj/item/weapon/gripper/service(src)
	src.modules += new /obj/item/weapon/reagent_containers/glass/bucket(src)
	src.modules += new /obj/item/weapon/material/minihoe(src)
	src.modules += new /obj/item/device/analyzer/plant_analyzer(src)
	src.modules += new /obj/item/weapon/storage/bag/dogborg(src)
	src.modules += new /obj/item/weapon/robot_harvester(src)
	src.modules += new /obj/item/device/multitool(src)
	src.modules += new /obj/item/weapon/dogborg/jaws/small(src)
	src.modules += new /obj/item/device/dogborg/boop_module(src)
	src.modules += new /obj/item/weapon/dogborg/pounce(src)
	src.modules += new /obj/item/weapon/bikehorn(src)
	src.modules += new /obj/item/weapon/gun/launcher/confetti_cannon/honkborg(src)

	var/datum/matter_synth/water = new /datum/matter_synth(500)
	water.name = "Water reserves"
	water.recharge_rate = 10
	water.max_energy = 1000
	R.water_res = water
	synths += water

	var/obj/item/device/dogborg/tongue/T = new /obj/item/device/dogborg/tongue(src)
	T.water = water
	src.modules += T

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
	B.water = water
	src.modules += B

	R.icon 		 = 'modular_chomp/icons/mob/widerobot_ch.dmi'
	R.wideborg_dept  = 'modular_chomp/icons/mob/widerobot_ch.dmi'
	R.hands.icon = 'icons/mob/screen1_robot_vr.dmi'
	R.ui_style_vr = TRUE
	R.pixel_x 	 = -16
	R.old_x 	 = -16
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


