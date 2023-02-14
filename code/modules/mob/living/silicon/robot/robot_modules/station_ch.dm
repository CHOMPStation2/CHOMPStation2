//Lets make this shit more sane-shark
/hook/startup/proc/robot_modules_ch()
//define OUR modules
	robot_modules["ExploreHound"] = /obj/item/weapon/robot_module/robot/exploration //Array define
	robot_module_types += "ExploreHound" //Add to global
	robot_modules["Honk-Hound"] = /obj/item/weapon/robot_module/robot/clerical/honkborg
	robot_modules["UnityHound"] = /obj/item/weapon/robot_module/robot/chound



//TFF 5/1/20 - Add Ore Scanner for mining drones
/obj/item/weapon/robot_module/drone/mining/New()
	..()
	src.modules += new /obj/item/weapon/mining_scanner(src)

/obj/item/weapon/robot_module/robot/engineering/New()
	..()
	src.modules += new /obj/item/weapon/pipe_dispenser(src)


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


/obj/item/weapon/robot_module/robot/clerical/honkborg
	name = "honk-hound module"
	sprites = list(
					"Honkborg" = "honkborg"
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