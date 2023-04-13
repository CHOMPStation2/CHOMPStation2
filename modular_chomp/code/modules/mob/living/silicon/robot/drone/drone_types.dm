//All of the different types of drones
//CORE TYPE
/mob/living/silicon/robot/drone
	name = "maintenance drone"
	real_name = "drone"
	icon = 'icons/mob/robots.dmi'
	icon_state = "repairbot"
	maxHealth = 35
	health = 35
	cell_emp_mult = 1
	universal_speak = 0
	universal_understand = 1
	gender = NEUTER
	pass_flags = PASSTABLE
	braintype = "Drone"
	lawupdate = 0
	density = TRUE
	req_access = list(access_engine, access_robotics)
	integrated_light_power = 3
	local_transmit = 1

	can_pull_size = ITEMSIZE_NO_CONTAINER
	can_pull_mobs = MOB_PULL_SMALLER
	can_enter_vent_with = list(
		/obj,
		/atom/movable/emissive_blocker)

	mob_bump_flag = SIMPLE_ANIMAL
	mob_swap_flags = SIMPLE_ANIMAL
	mob_push_flags = SIMPLE_ANIMAL
	mob_always_swap = 1

	mob_size = MOB_LARGE // Small mobs can't open doors, it's a huge pain for drones.

	//Used for self-mailing.
	var/mail_destination = ""
	var/obj/machinery/drone_fabricator/master_fabricator
	var/law_type = /datum/ai_laws/drone
	var/module_type = /obj/item/weapon/robot_module/drone
	var/obj/item/hat
	var/hat_x_offset = 0
	var/hat_y_offset = -13
	var/serial_number = 0
	var/name_override = 0

	var/foreign_droid = FALSE

	holder_type = /obj/item/weapon/holder/drone

	can_be_antagged = FALSE

	var/static/list/shell_types = list("Classic" = "repairbot", "Eris" = "maintbot")
	var/can_pick_shell = TRUE
	var/list/shell_accessories
	var/can_blitz = FALSE
	//vore addition
	mob_size = MOB_SMALL
/mob/living/silicon/robot/drone/proc/welcome_drone()
	to_chat(src, "<b>You are a maintenance drone, a tiny-brained robotic repair machine</b>.")
	to_chat(src, "You have no individual will, no personality, and no drives or urges other than your laws.")
	to_chat(src, "Remember,  you are <b>lawed against interference with the crew</b>. Also remember, <b>you DO NOT take orders from the AI.</b>")
	to_chat(src, "Use <b>say ;Hello</b> to talk to other drones and <b>say Hello</b> to speak silently to your nearby fellows.")
	if(faction == "malf_drone")
		to_chat(src, "Use <b>Directive 0 in effect.")
/mob/living/silicon/robot/drone/init()
	if(!scrambledcodes && !foreign_droid)
		aiCamera = new/obj/item/device/camera/siliconcam/drone_camera(src)
	additional_law_channels["Drone"] = ":d"
	if(!laws) laws = new law_type
	if(!module) module = new module_type(src)

	flavor_text = "It's a tiny little repair drone. The casing is stamped with an corporate logo and the subscript: '[using_map.company_name] Recursive Repair Systems: Fixing Tomorrow's Problem, Today!'"
	playsound(src, 'sound/machines/twobeep.ogg', 50, 0)
//CORE END

//VARIANTS
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
/mob/living/silicon/robot/drone/construction/welcome_drone()
	to_chat(src, "<b>You are a construction drone, an autonomous engineering and fabrication system.</b>.")
	to_chat(src, "You are assigned to a Sol Central construction project. The name is irrelevant. Your task is to complete construction and subsystem integration as soon as possible.")
	to_chat(src, "Use <b>:d</b> to talk to other drones and <b>say</b> to speak silently to your nearby fellows.")
	to_chat(src, "<b>You do not follow orders from anyone; not the AI, not humans, and not other synthetics.</b>.")
	if(faction == "malf_drone")
		to_chat(src, "Use <b>Directive 0 in effect.")
/mob/living/silicon/robot/drone/construction/init()
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
/mob/living/silicon/robot/drone/mining/init()
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