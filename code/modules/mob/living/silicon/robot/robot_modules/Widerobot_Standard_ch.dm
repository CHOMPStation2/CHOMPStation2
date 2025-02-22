//Modular Standard borg hound edition
//This restructures how borg additions are done to make them sane/modular/maintainable
//Also makes it easier to make new borgs

//INCOMPLETE and not ready, no sprites other than tall and basically useless, also lacking a belly

//Add ourselves to the borg list
/hook/startup/proc/Modular_Borg_init_standardhound()
	//robot_modules["Honk-Hound"] = /obj/item/robot_module/robot/clerical/honkborg - done in station_vr modular chomp for ordering reasons
	robot_module_types += "Standard-Hound" //Add ourselves to global
	return 1

/obj/item/robot_module/robot/standard/hound
	name = "Standard-Hound"
	sprites = list(
					"MEKA" = 		list(SKIN_ICON_STATE = "mekastandard", SKIN_ICON = 'modular_chomp/icons/mob/tallborg/tallrobots.dmi', SKIN_OFFSET = 0, SKIN_HEIGHT = 64),
					"NIKO" = 		list(SKIN_ICON_STATE = "mmekastandard", SKIN_ICON = 'modular_chomp/icons/mob/tallborg/tallrobots.dmi', SKIN_OFFSET = 0, SKIN_HEIGHT = 64),
					"NIKA" = 		list(SKIN_ICON_STATE = "fmekastandard", SKIN_ICON = 'modular_chomp/icons/mob/tallborg/tallrobots.dmi', SKIN_OFFSET = 0, SKIN_HEIGHT = 64),
					"K4T" = 		list(SKIN_ICON_STATE = "k4tclown", SKIN_ICON = 'modular_chomp/icons/mob/tallborg/tallrobots.dmi', SKIN_OFFSET = 0, SKIN_HEIGHT = 64)
					)

	can_be_pushed = 0

/obj/item/robot_module/robot/standard/hound/New(var/mob/living/silicon/robot/R)
	..()
	src.modules += new /obj/item/melee/baton/loaded(src)
	src.modules += new /obj/item/tool/wrench/cyborg(src)
	src.modules += new /obj/item/healthanalyzer(src)
	src.emag += new /obj/item/melee/energy/sword(src)

	var/datum/matter_synth/water = new /datum/matter_synth(500)
	water.name = "Water reserves"
	water.recharge_rate = 10
	water.max_energy = 1000
	R.water_res = water
	synths += water

	var/obj/item/dogborg/tongue/T = new /obj/item/dogborg/tongue(src)
	T.water = water
	src.modules += T

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
	add_verb(R,/mob/living/silicon/robot/proc/ex_reserve_refill) //CHOMPEdit TGPanel
	add_verb(R,/mob/living/silicon/robot/proc/robot_mount) //CHOMPEdit TGPanel
	add_verb(R,/mob/living/proc/toggle_rider_reins) //CHOMPEdit TGPanel
	add_verb(R,/mob/living/proc/shred_limb) //CHOMPEdit TGPanel
	add_verb(R,/mob/living/silicon/robot/proc/rest_style) //CHOMPEdit TGPanel
	..()
