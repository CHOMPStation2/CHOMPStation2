// This file holds things required for remote borg control by an AI.

GLOBAL_LIST_EMPTY(available_ai_shells)

/mob/living/silicon/robot
	var/shell = FALSE
	var/deployed = FALSE
	var/mob/living/silicon/ai/mainframe = null
	var/first_transfer = TRUE

// Premade AI shell, for roundstart shells.
/mob/living/silicon/robot/ai_shell/Initialize()
	add_verb(src,/mob/living/silicon/robot/proc/transfer_shell_act) //CHOMPEdit TGPanel //CHOMPEDIT: add sideloader
	mmi = new /obj/item/mmi/inert/ai_remote(src)
	post_mmi_setup()
	return ..()

// Call after inserting or instantiating an MMI.
/mob/living/silicon/robot/proc/post_mmi_setup()
	if(istype(mmi, /obj/item/mmi/inert/ai_remote))
		make_shell()
		playsound(src, 'sound/machines/twobeep.ogg', 50, 0)
	else
		playsound(src, 'sound/voice/liveagain.ogg', 75, 1)
	return

/mob/living/silicon/robot/proc/make_shell()
	add_verb(src,/mob/living/silicon/robot/proc/transfer_shell_act) //CHOMPEdit TGPanel //CHOMPEDIT: add sideloader
	shell = TRUE
	braintype = "AI Shell"
	SetName("[modtype] AI Shell [num2text(ident)]")
	rbPDA = new /obj/item/pda/ai/shell(src)
	setup_PDA()
	GLOB.available_ai_shells |= src
	if(!QDELETED(camera))
		camera.c_tag = real_name	//update the camera name too
	notify_ai(ROBOT_NOTIFICATION_AI_SHELL)
	update_icon()

//CHOMPADDITION: Ai shell sideloading
/mob/living/silicon/robot/proc/transfer_shell_act()
	set category = "Abilities.Silicon" //ChompEDIT - TGPanel
	set name = "Transfer to Shell"
	transfer_shell()


/mob/living/silicon/robot/proc/transfer_shell(var/mob/living/silicon/robot/target)
	var/mob/living/silicon/ai/AI = mainframe
	//relay AI
	if(!CONFIG_GET(flag/allow_ai_shells)) // CHOMPEdit
		to_chat(src, span("warning", "AI Shells are not allowed on this server. You shouldn't have this verb because of it, so consider making a bug report."))
		return

	if(incapacitated())
		to_chat(src, span("warning", "You are incapacitated!"))
		return

	if(AI.lacks_power())
		to_chat(src, span("warning", "Your core lacks power, wireless is disabled."))
		return

	if(AI.control_disabled)
		to_chat(src, span("warning", "Wireless networking module is offline."))
		return

	var/list/possible = list()
	for(var/mob/living/silicon/robot/R as anything in GLOB.available_ai_shells)
		if(R != src && R.shell && !R.deployed && (R.stat != DEAD) && (!R.connected_ai || (R.connected_ai == AI) ) )	//VOREStation Edit: shell restrictions
			if(istype(R.loc, /obj/machinery/recharge_station))	//Check Rechargers
				var/obj/machinery/recharge_station/RS = R.loc
				if(!(using_map.ai_shell_restricted && !(RS.z in using_map.ai_shell_allowed_levels)))	//Allow station borgs to be redeployed from Chargers.
					possible += R

			if(isbelly(R.loc))	//check belly space
				var/obj/belly/B = R.loc
				if(!(using_map.ai_shell_restricted && !(B.owner.z in using_map.ai_shell_allowed_levels)))	//No smuggling in borgs
					possible += R

			if(!(using_map.ai_shell_restricted && !(R.z in using_map.ai_shell_allowed_levels)))
				possible += R

	if(!LAZYLEN(possible))
		to_chat(src, span("warning", "No usable AI shell beacons detected."))

	if(LAZYLEN(possible) < 2)
		target = possible[1]

	if(!target || !(target in possible)) //If the AI is looking for a new shell, or its pre-selected shell is no longer valid
		target = tgui_input_list(src, "Which body to control?", "Shell Choice", possible)


	if(!target || target.stat == DEAD || target.deployed || !(!target.connected_ai || (target.connected_ai == AI) ) )
		if(target)
			to_chat(src, span("warning", "It is no longer possible to deploy to \the [target]."))
		else
			to_chat(src, span("notice", "Deployment aborted."))
		return

	else if(mind)
		to_chat(src, span("notice", "Transferring Shell"))
		deployed = FALSE
		update_icon()
		mainframe.teleop = null
		mainframe.deployed_shell = null
		SetName("[modtype] AI Shell [num2text(ident)]")
		if(radio) //Return radio to normal
			radio.recalculateChannels()
		if(!QDELETED(camera))
			camera.c_tag = real_name	//update the camera name too
		if(mainframe.laws)
			mainframe.laws.show_laws(mainframe) //Always remind the AI when switching
		mainframe = null
		soul_link(/datum/soul_link/shared_body, AI, target)
		AI.deployed_shell = target
		target.deploy_init(AI)
		if(src.client) //CHOMPADDITION: Resize shell based on our preffered size
			target.resize(src.client.prefs.size_multiplier) //CHOMPADDITION: Resize shell based on our preffered size
		mind.transfer_to(target)
		if(target.first_transfer)
			target.first_transfer = FALSE
			target.copy_from_prefs_vr()
			if(LAZYLEN(target.vore_organs))
				target.vore_selected = target.vore_organs[1]
		src.copy_vore_prefs_to_mob(target)
		AI.teleop = target // So the AI 'hears' messages near its core.
		target.post_deploy()
//CHOMPADDITION END

/mob/living/silicon/robot/proc/revert_shell()
	if(!shell)
		return
	remove_verb(src,/mob/living/silicon/robot/proc/transfer_shell_act ) //CHOMPEDIT: remove sideloader //CHOMPEdit
	undeploy()
	shell = FALSE
	GLOB.available_ai_shells -= src
	if(!QDELETED(camera))
		camera.c_tag = real_name
	update_icon()

// This should be called before the AI client/mind is actually moved.
/mob/living/silicon/robot/proc/deploy_init(mob/living/silicon/ai/AI)
	// Set the name when the AI steps inside.
	SetName("[AI.real_name] shell [num2text(ident)]")
	if(isnull(sprite_name)) // For custom sprites. It can only chance once in case there are two AIs with custom borg sprites.
		sprite_name = AI.real_name
	if(!QDELETED(camera))
		camera.c_tag = real_name

	// Have the borg have eyes when active.
	mainframe = AI
	deployed = TRUE
	update_icon()

	// Laws.
	connected_ai = mainframe // So they share laws.
	mainframe.connected_robots |= src
	lawsync()

	// Give button to leave.
	add_verb(src,/mob/living/silicon/robot/proc/undeploy_act) //CHOMPEdit TGPanel
	to_chat(AI, span("notice", "You have connected to an AI Shell remotely, and are now in control of it.<br>\
	To return to your core, use the <b>Release Control</b> verb."))

	// Languages and comms.
	languages = AI.languages.Copy()
	speech_synthesizer_langs = AI.speech_synthesizer_langs.Copy()
	if(radio && AI.aiRadio) //AI keeps all channels, including Syndie if it is an Infiltrator.
//		if(AI.radio.syndie)
//			radio.make_syndie()
		radio.subspace_transmission = TRUE
		radio.channels = AI.aiRadio.channels

// Called after the AI transfers over.
/mob/living/silicon/robot/proc/post_deploy()
	return

/mob/living/silicon/robot/proc/undeploy(message)
	if(!deployed || !mind || !mainframe)
		return
//	mainframe.redeploy_action.Grant(mainframe)
//	mainframe.redeploy_action.last_used_shell = src
	if(message)
		to_chat(src, span("notice", message))
	mind.transfer_to(mainframe)
	src.copy_vore_prefs_to_mob(mainframe)
	deployed = FALSE
	update_icon()
	mainframe.teleop = null
	mainframe.deployed_shell = null
	SetName("[modtype] AI Shell [num2text(ident)]")
//	undeployment_action.Remove(src)
	if(radio) //Return radio to normal
		radio.recalculateChannels()
	if(!QDELETED(camera))
		camera.c_tag = real_name	//update the camera name too
//	diag_hud_set_aishell()
//	mainframe.diag_hud_set_deployed()
	if(mainframe.laws)
		mainframe.laws.show_laws(mainframe) //Always remind the AI when switching
	mainframe = null

/mob/living/silicon/robot/proc/undeploy_act()
	set name = "Release Control"
	set desc = "Release control of a remote drone."
	set category = "Abilities.Silicon" //ChompEDIT - TGPanel

	undeploy("Remote session terminated.")

/mob/living/silicon/robot/attack_ai(mob/user)
	if(shell && CONFIG_GET(flag/allow_ai_shells) && (!connected_ai || connected_ai == user)) // CHOMPEdit
		var/mob/living/silicon/ai/AI = user
		if(istype(AI))		// Just in case we're clicked by a borg
			AI.deploy_to_shell(src)
	else
		return ..()

// Place this on your map to mark where a free AI shell will be.
// This can be turned off in the config (and is off by default).
// Note that mapping in more than one of these will result in multiple shells.
/obj/effect/landmark/free_ai_shell
	name = "free ai shell spawner"
	icon = 'icons/mob/screen1.dmi'
	icon_state = "x3"
	delete_me = TRUE

/obj/effect/landmark/free_ai_shell/Initialize()
	if(CONFIG_GET(flag/allow_ai_shells) && CONFIG_GET(flag/give_free_ai_shell)) // CHOMPEdit
		new /mob/living/silicon/robot/ai_shell(get_turf(src))
	return ..()
