/mob/living/silicon/robot/syndicate
	lawupdate = 0
	scrambledcodes = 1
	emagged = 1
	modtype = "Syndicate"
	lawchannel = "State"
	braintype = "Drone"
	idcard_type = /obj/item/card/id/syndicate // CHOMPEdit - Removal of obj/item/weapon
	icon_selected = FALSE
	restrict_modules_to = list("Protector", "Mechanist", "Combat Medic")

/mob/living/silicon/robot/syndicate/init()
	aiCamera = new/obj/item/camera/siliconcam/robot_camera(src) // CHOMPEdit - Removal of obj/item/device

	mmi = new /obj/item/mmi/digital/robot(src) // Explicitly a drone. // CHOMPEdit - Removal of obj/item/device
	cut_overlays()
	init_id()

	updatename("Syndicate")

	if(!cell)
		cell = new /obj/item/cell/robot_syndi(src) // 25k cell, because Antag. // CHOMPEdit - Removal of obj/item/weapon

	// new /obj/item/robot_module/robot/syndicate(src) // CHOMPEdit - Removal of obj/item/weapon

	laws = new /datum/ai_laws/syndicate_override()

	radio.keyslot = new /obj/item/encryptionkey/syndicate(radio) // CHOMPEdit - Removal of obj/item/device
	radio.recalculateChannels()

	playsound(src, 'sound/mecha/nominalsyndi.ogg', 75, 0)

/mob/living/silicon/robot/syndicate/protector/init()
	..()
	module = new /obj/item/robot_module/robot/syndicate/protector(src) // CHOMPEdit - Removal of obj/item/weapon
	modtype = "Protector"
	restrict_modules_to = list("Protector")
	updatename("Protector")

/mob/living/silicon/robot/syndicate/mechanist/init()
	..()
	module = new /obj/item/robot_module/robot/syndicate/mechanist(src) // CHOMPEdit - Removal of obj/item/weapon
	modtype = "Mechanist"
	restrict_modules_to = list("Mechanist")
	updatename("Mechanist")

/mob/living/silicon/robot/syndicate/combat_medic/init()
	..()
	module = new /obj/item/robot_module/robot/syndicate/combat_medic(src) // CHOMPEdit - Removal of obj/item/weapon
	modtype = "Combat Medic"
	restrict_modules_to = list("Combat Medic")
	updatename("Combat Medic")

/mob/living/silicon/robot/syndicate/speech_bubble_appearance()
	return "synthetic_evil"
