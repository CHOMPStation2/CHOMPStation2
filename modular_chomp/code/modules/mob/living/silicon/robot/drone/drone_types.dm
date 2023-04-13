//All of the different types of drones

/mob/living/silicon/robot/drone/construction
	name = "construction drone"
	icon_state = "constructiondrone"
	law_type = /datum/ai_laws/construction_drone
	module_type = /obj/item/weapon/robot_module/drone/construction
	hat_x_offset = 1
	hat_y_offset = -12
	can_pull_mobs = MOB_PULL_SAME
	can_pick_shell = FALSE
	shell_accessories = list("eyes-constructiondrone")
	//These are short overrides dont do this for long shit
	welcome_drone()
		to_chat(src, "<b>You are a construction drone, an autonomous engineering and fabrication system.</b>.")
		to_chat(src, "You are assigned to a Sol Central construction project. The name is irrelevant. Your task is to complete construction and subsystem integration as soon as possible.")
		to_chat(src, "Use <b>:d</b> to talk to other drones and <b>say</b> to speak silently to your nearby fellows.")
		to_chat(src, "<b>You do not follow orders from anyone; not the AI, not humans, and not other synthetics.</b>.")
	//These are short overrides dont do this for long shit
	init()
		..()
		flavor_text = "It's a bulky construction drone stamped with a Sol Central glyph."

/mob/living/silicon/robot/drone/mining
	icon_state = "miningdrone"
	item_state = "constructiondrone"
	law_type = /datum/ai_laws/mining_drone
	module_type = /obj/item/weapon/robot_module/drone/mining
	hat_x_offset = 1
	hat_y_offset = -12
	can_pull_mobs = MOB_PULL_SAME
	can_pick_shell = FALSE
	shell_accessories = list("eyes-miningdrone")
	//These are short overrides dont do this for long shit
	init()
		..()
		flavor_text = "It's a bulky mining drone stamped with a Grayson logo."

/mob/living/silicon/robot/drone
	name = "unified drone" //Maintenance drones can be a Jani specific shell now, the normal drone will be a blank shell not really intended for use
	law_type = /datum/ai_laws/drone

/mob/living/silicon/robot/drone/jan
	name = "maintenance drone"
	law_type = /datum/ai_laws/jani_drone

/mob/living/silicon/robot/drone/sec
	name = "security drone"
	law_type = /datum/ai_laws/security_drone

/mob/living/silicon/robot/drone/min
	name = "mining drone"
	law_type = /datum/ai_laws/mining_drone