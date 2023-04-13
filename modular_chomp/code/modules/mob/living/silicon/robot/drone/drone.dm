//Modified copy of regula drone folder
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



var/list/mob_hat_cache = list()
/proc/get_hat_icon(var/obj/item/hat, var/offset_x = 0, var/offset_y = 0)
	var/t_state = hat.icon_state
	if(LAZYACCESS(hat.item_state_slots, slot_head_str))
		t_state = hat.item_state_slots[slot_head_str]
	else if(hat.item_state)
		t_state = hat.item_state
	var/key = "[t_state]_[offset_x]_[offset_y]"
	if(!mob_hat_cache[key])            // Not ideal as there's no guarantee all hat icon_states
		var/t_icon = INV_HEAD_DEF_ICON // are unique across multiple dmis, but whatever.
		if(hat.icon_override)
			t_icon = hat.icon_override
		else if(LAZYACCESS(hat.item_icons, slot_head_str))
			t_icon = hat.item_icons[slot_head_str]
		var/image/I = image(icon = t_icon, icon_state = t_state)
		I.pixel_x = offset_x
		I.pixel_y = offset_y
		mob_hat_cache[key] = I
	return mob_hat_cache[key]

/mob/living/silicon/robot/drone/Destroy()
	if(hat)
		hat.loc = get_turf(src)
	..()

/mob/living/silicon/robot/drone/is_sentient()
	return FALSE

/mob/living/silicon/robot/drone/New()
	..()
	verbs += /mob/living/proc/ventcrawl
	verbs += /mob/living/proc/hide
	remove_language("Robot Talk")
	add_language("Robot Talk", 0)
	add_language("Drone Talk", 1)
	serial_number = rand(0,999)

	//They are unable to be upgraded, so let's give them a bit of a better battery.
	cell.maxcharge = 10000
	cell.charge = 10000

	// NO BRAIN.
	mmi = null

	//We need to screw with their HP a bit. They have around one fifth as much HP as a full borg.
	for(var/V in components) if(V != "power cell")
		var/datum/robot_component/C = components[V]
		C.max_damage = 10

	verbs -= /mob/living/silicon/robot/verb/Namepick

	if(can_pick_shell)
		var/random = pick(shell_types)
		icon_state = shell_types[random]
		shell_accessories = list("[icon_state]-eyes-blue")

	updateicon()
	updatename()

/mob/living/silicon/robot/drone/init()
	if(!scrambledcodes && !foreign_droid)
		aiCamera = new/obj/item/device/camera/siliconcam/drone_camera(src)
	additional_law_channels["Drone"] = ":d"
	if(!laws) laws = new law_type
	if(!module) module = new module_type(src)

	flavor_text = "It's a tiny little repair drone. The casing is stamped with an corporate logo and the subscript: '[using_map.company_name] Recursive Repair Systems: Fixing Tomorrow's Problem, Today!'"
	playsound(src, 'sound/machines/twobeep.ogg', 50, 0)

/mob/living/silicon/robot/drone/Login()
	. = ..()
	if(can_pick_shell)
		to_chat(src, "<b>You can select a shell using the 'Robot Commands' > 'Customize Appearance'</b>")

//Redefining some robot procs...
/mob/living/silicon/robot/drone/SetName(pickedName as text)
	// Would prefer to call the grandparent proc but this isn't possible, so..
	real_name = pickedName
	name = real_name

/mob/living/silicon/robot/drone/updatename()
	if(name_override)
		return

	real_name = "[initial(name)] ([serial_number])"
	name = real_name

/mob/living/silicon/robot/drone/updateicon()
	cut_overlays()

	if(islist(shell_accessories))
		add_overlay(shell_accessories)

	if(hat) // Let the drones wear hats.
		add_overlay(get_hat_icon(hat, hat_x_offset, hat_y_offset))

/mob/living/silicon/robot/drone/verb/pick_shell()
	set name = "Customize Appearance"
	set category = "Robot Commands"

	if(!can_pick_shell)
		to_chat(src, "<span class='warning'>You already selected a shell or this drone type isn't customizable.</span>")
		return

	var/list/choices = shell_types.Copy()

	if(can_blitz)
		choices["Blitz"] = "blitzshell"

	var/shell_choice = tgui_input_list(src, "Select a shell. NOTE: You can only do this once during this drone-lifetime.", "Customize Shell", choices)
	if(!shell_choice)
		return

	icon_state = choices[shell_choice]

	// If you add more, datumize these. Having 'basically two' is not enough to make me bother though.
	shell_accessories = null
	if(icon_state in list("repairbot", "maintbot"))
		var/eye_color = tgui_input_list(src, "Select eye color:", "Eye Color", list("blue", "red", "orange", "green", "violet"))
		if(eye_color)
			LAZYADD(shell_accessories, "[icon_state]-eyes-[eye_color]")
		if(icon_state == "maintbot")
			var/armor_color = tgui_input_list(src, "Select plating color:", "Eye Color", list("blue", "red", "orange", "green", "brown"))
			if(armor_color)
				LAZYADD(shell_accessories, "[icon_state]-shell-[armor_color]")

	can_pick_shell = FALSE
	updateicon()

/mob/living/silicon/robot/drone/choose_icon()
	return

/mob/living/silicon/robot/drone/pick_module()
	return

/mob/living/silicon/robot/drone/proc/wear_hat(var/obj/item/new_hat)
	if(hat)
		return
	hat = new_hat
	new_hat.loc = src
	updateicon()

//Drones cannot be upgraded with borg modules so we need to catch some items before they get used in ..().
/mob/living/silicon/robot/drone/attackby(var/obj/item/weapon/W, var/mob/user)

	//Early return handler
	if(handle_attackby_return(W,user))
		return
	if(user.a_intent == "help" && istype(W, /obj/item/clothing/head))
		equip_hat(W,user)
	..()

//Denesting for the above code

/mob/living/silicon/robot/drone/proc/equip_hat(var/obj/item/clothing/head/W, var/mob/user)
	if(hat)
		to_chat(user, "<span class='warning'>\The [src] is already wearing \the [hat].</span>")
		return
	user.unEquip(W)
	wear_hat(W)
	user.visible_message("<b>\The [user]</b> puts \the [W] on \the [src].")
	return

/mob/living/silicon/robot/drone/proc/handle_attackby_return(var/obj/item/W, var/mob/user)
	var/hint
	if(W.is_crowbar())
		hint = "<span class='danger'>\The [src] is hermetically sealed. You can't open the case.</span>"
	else if(istype(W, /obj/item/borg/upgrade/))
		hint = "<span class='danger'>\The [src] is not compatible with \the [W].</span>"
	else if(stat == 2)
		hint = handle_try_reboot(W,user) //ugly as shit nesting otherwise

	if(hint!="MSG-SKIP")
		to_chat(usr,hint)
	return hint //null if we dont handle early return

/mob/living/silicon/robot/drone/proc/handle_try_reboot(var/obj/item/W,var/mob/user)
	var/datum/gender/TU = gender_datums[user.get_visible_gender()]
	if(!istype(W, /obj/item/weapon/card/id)&&!istype(W, /obj/item/device/pda))
		return handle_try_shutdown(user, TU)

	if(!config.allow_drone_spawn || emagged || health < -35) //It's dead, Dave.
		return "<span class='danger'>The interface is fried, and a distressing burned smell wafts from the robot's interior. You're not rebooting this one.</span>"

	if(!allowed(usr))
		return "<span class='danger'>Access denied.</span>"

	user.visible_message("<span class='danger'>\The [user] swipes [TU.his] ID card through \the [src], attempting to reboot it.</span>", "<span class='danger'>>You swipe your ID card through \the [src], attempting to reboot it.</span>")
	var/drones = 0
	for(var/mob/living/silicon/robot/drone/D in player_list)
		drones++
	if(drones < config.max_maint_drones)
		request_player()
	return "MSG-SKIP"

/mob/living/silicon/robot/drone/proc/handle_try_shutdown(var/mob/user, var/datum/gender/TU)
	user.visible_message("<span class='danger'>\The [user] swipes [TU.his] ID card through \the [src], attempting to shut it down.</span>", "<span class='danger'>You swipe your ID card through \the [src], attempting to shut it down.</span>")
	if(emagged)
		return "MSG-SKIP"

	if(allowed(usr))
		shut_down()
		return "MSG-SKIP"
	else
		return "<span class='danger'>Access denied.</span>"


//ATTACKBY HANDLERS END


/mob/living/silicon/robot/drone/emag_act(var/remaining_charges, var/mob/user)
	if(!client || stat == 2)
		to_chat(user, "<span class='danger'>There's not much point subverting this heap of junk.</span>")
		return

	if(emagged)
		to_chat(src, "<span class='danger'>\The [user] attempts to load subversive software into you, but your hacked subroutines ignore the attempt.</span>")
		to_chat(user, "<span class='danger'>You attempt to subvert [src], but the sequencer has no effect.</span>")
		return

	to_chat(user, "<span class='danger'>You swipe the sequencer across [src]'s interface and watch its eyes flicker.</span>")

	to_chat(src, "<span class='danger'>You feel a sudden burst of malware loaded into your execute-as-root buffer. Your tiny brain methodically parses, loads and executes the script.</span>")

	log_game("[key_name(user)] emagged drone [key_name(src)]. Laws overridden.")
	var/time = time2text(world.realtime,"hh:mm:ss")
	lawchanges.Add("[time] <B>:</B> [user.name]([user.key]) emagged [name]([key])")

	emagged = 1
	lawupdate = 0
	connected_ai = null
	clear_supplied_laws()
	clear_inherent_laws()
	laws = new /datum/ai_laws/syndicate_override
	var/datum/gender/TU = gender_datums[user.get_visible_gender()]
	set_zeroth_law("Only [user.real_name] and people [TU.he] designate[TU.s] as being such are operatives.")

	to_chat(src, "<b>Obey these laws:</b>")
	laws.show_laws(src)
	to_chat(src, "<span class='danger'>ALERT: [user.real_name] is your new master. Obey your new laws and \his commands.</span>")
	return 1

//DRONE LIFE/DEATH

//For some goddamn reason robots have this hardcoded. Redefining it for our fragile friends here.
/mob/living/silicon/robot/drone/updatehealth()
	if(status_flags & GODMODE)
		health = maxHealth
		set_stat(CONSCIOUS)
		return
	health = maxHealth - (getBruteLoss() + getFireLoss())
	return

//Easiest to check this here, then check again in the robot proc.
//Standard robots use config for crit, which is somewhat excessive for these guys.
//Drones killed by damage will gib.
/mob/living/silicon/robot/drone/handle_regular_status_updates()
	var/turf/T = get_turf(src)
	if(!T || health <= -35 )
		timeofdeath = world.time
		death() //Possibly redundant, having trouble making death() cooperate.
		gib()
		return
	..()

//DRONE MOVEMENT.
/mob/living/silicon/robot/drone/Process_Spaceslipping(var/prob_slip)
	return 0

//CONSOLE PROCS
/mob/living/silicon/robot/drone/proc/law_resync()
	if(stat == DEAD)
		return //opting for an early return here to remove unneeded nesting
	if(emagged)
		to_chat(src, "<span class='danger'>You feel something attempting to modify your programming, but your hacked subroutines are unaffected.</span>")
	else
		to_chat(src, "<span class='danger'>A reset-to-factory directive packet filters through your data connection, and you obediently modify your programming to suit it.</span>")
		full_law_reset()
		show_laws()

/mob/living/silicon/robot/drone/proc/shut_down()
	if(stat == DEAD)
		return //opting for an early return here to remove unneeded nesting
	if(emagged)
		to_chat(src, "<span class='danger'>You feel a system kill order percolate through your tiny brain, but it doesn't seem like a good idea to you.</span>")
	else
		to_chat(src, "<span class='danger'>You feel a system kill order percolate through your tiny brain, and you obediently destroy yourself.</span>")
		death()

/mob/living/silicon/robot/drone/proc/full_law_reset()
	clear_supplied_laws(1)
	clear_inherent_laws(1)
	clear_ion_laws(1)
	laws = new law_type

//Reboot procs.

/mob/living/silicon/robot/drone/proc/request_player()
	for(var/mob/observer/dead/O in player_list)
		if(jobban_isbanned(O, "Cyborg") || !O.client || !(O.client.prefs.be_special & BE_PAI))
			continue
		question(O.client)

/mob/living/silicon/robot/drone/proc/question(var/client/C)
	spawn(0)
		if(!C || jobban_isbanned(C,"Cyborg"))	return
		var/response = tgui_alert(C, "Someone is attempting to reboot a maintenance drone. Would you like to play as one?", "Maintenance drone reboot", list("Yes", "No", "Never for this round"))
		if(!C || ckey)
			return
		if(response == "Yes")
			transfer_personality(C)
		else if (response == "Never for this round")
			C.prefs.be_special ^= BE_PAI

/mob/living/silicon/robot/drone/proc/transfer_personality(var/client/player)

	if(!player) return

	src.ckey = player.ckey

	if(player.mob && player.mob.mind)
		player.mob.mind.transfer_to(src)

	lawupdate = 0
	to_chat(src, "<b>Systems rebooted</b>. Loading base pattern maintenance protocol...")
	spawn(3 SECONDS)
		full_law_reset()
		to_chat(src,"<b>Loaded</b>.")
	spawn(4 SECONDS)
		welcome_drone()

/mob/living/silicon/robot/drone/proc/welcome_drone()
	to_chat(src, "<b>You are a maintenance drone, a tiny-brained robotic repair machine</b>.")
	to_chat(src, "You have no individual will, no personality, and no drives or urges other than your laws.")
	to_chat(src, "Remember,  you are <b>lawed against interference with the crew</b>. Also remember, <b>you DO NOT take orders from the AI.</b>")
	to_chat(src, "Use <b>say ;Hello</b> to talk to other drones and <b>say Hello</b> to speak silently to your nearby fellows.")

/mob/living/silicon/robot/drone/add_robot_verbs()
	src.verbs |= silicon_subsystems

/mob/living/silicon/robot/drone/remove_robot_verbs()
	src.verbs -= silicon_subsystems