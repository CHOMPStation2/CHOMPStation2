//Datum that's initialized on first calling the client procs. It's stored in /client
//We keep a distinct names/refs list in an effort to make things speedy, and for easy checking if something is on our list.
//We manually add to list element with procs to avoid dealing with clunky global lists that might not be relevant
//and for ability to narrate from long range.
/datum/entity_narrate
	var/list/entity_names = list()
	var/list/entity_refs = list()


	//TGUI Helper Vars
	var/tgui_id = "EntityNarrate"
	var/tgui_selection_mode = 0 //0 for single entity, 1 for multi entity
	var/tgui_selected_name = "" //String for single selection in-game name
	var/tgui_selected_type = "" //String for single selection type
	var/tgui_selected_id = ""   //String to retrieve ref from entity_refs
	var/tgui_selected_refs //object references
	var/list/tgui_selected_id_multi = list() //List of strings containing mob ids for multi selection
	var/tgui_narrate_mode = 0 //0 for speak, 1 for emote
	var/tgui_narrate_privacy = 0 //0 for loud, 1 for subtle
	var/tgui_last_message = 0 // int to avoid spam




//Appears as a right click verb on any obj and mob within view range.
//when not right clicking we get a list to pick from in aforementioned view range.
ADMIN_VERB_AND_CONTEXT_MENU(add_mob_for_narration, R_FUN, "Narrate Entity (Add ref)", "Saves a reference of target mob to be called when narrating.", "Fun.Narrate", E as obj|mob|turf in orange(world.view))
	//Making sure we got the list datum on our client.
	if(!user.entity_narrate_holder)
		user.entity_narrate_holder = new /datum/entity_narrate()
	if(!istype(user.entity_narrate_holder, /datum/entity_narrate))
		return
	var/datum/entity_narrate/holder = user.entity_narrate_holder

	//Since we extended to include all atoms, we're shutting things down with a guard clause for ghosts
	if(istype(E, /mob/observer))
		to_chat(user, span_notice("Ghosts shouldn't be narrated! If you want a ghost, make it a subtype of mob/living!"))
		return
	//We require a static mob/living type to check for .client and also later on, to use the unique .say mechanics for stuttering and language
	if(isliving(E))
		var/mob/living/L = E
		if(L.client)
			to_chat(user, span_notice("[L.name] is a player. All attempts to speak through them \
			gets logged in case of abuse."))
			log_and_message_admins("has added [L.ckey]'s mob to their entity narrate list", user)
			return
		var/unique_name = sanitize(tgui_input_text(user, "Please give the entity a unique name to track internally. \
		This doesn't override how it appears in game", "tracker", L.name))
		if(unique_name in holder.entity_names)
			to_chat(user, span_notice("[unique_name] is not unique! Pick another!"))
			SSadmin_verbs.dynamic_invoke_verb(user, /datum/admin_verb/add_mob_for_narration, L) //Recursively calling ourselves until cancelled or a unique name is given.
			return
		holder.entity_names += unique_name
		holder.entity_refs[unique_name] = WEAKREF(L)
		log_and_message_admins("added [L.name] for their personal list to narrate", user) //Logging here to avoid spam, while still safeguarding abuse

	//Covering functionality for turfs and objs. We need static type to access the name var
	else if(istype(E, /atom))
		var/atom/A = E
		var/unique_name = sanitize(tgui_input_text(user, "Please give the entity a unique name to track internally. \
		This doesn't override how it appears in game", "tracker", A.name))
		if(unique_name in holder.entity_names)
			to_chat(user, span_notice("[unique_name] is not unique! Pick another!"))
			SSadmin_verbs.dynamic_invoke_verb(user, /datum/admin_verb/add_mob_for_narration, A)
			return
		holder.entity_names += unique_name
		holder.entity_refs[unique_name] = WEAKREF(A)
		log_and_message_admins("added [A.name] for their personal list to narrate", user) //Logging here to avoid spam, while still safeguarding abuse

//Proc for keeping our ref list relevant, deleting mobs that are no longer relevant for our event
ADMIN_VERB(remove_mob_for_narration, R_FUN, "Narrate Entity (Remove ref)", "Remove mobs you're no longer narrating from your list for easier work.", "Fun.Narrate")
	if(!user.entity_narrate_holder)
		user.entity_narrate_holder = new /datum/entity_narrate()
		to_chat(user, "No references were added yet! First add references!")
		return
	if(!istype(user.entity_narrate_holder, /datum/entity_narrate))
		return
	var/datum/entity_narrate/holder = user.entity_narrate_holder

	var/options = holder.entity_names + "Clear All"
	var/removekey = tgui_input_list(user, "Choose which entity to remove", "remove reference", options, null)
	if(removekey == "Clear All")
		if(tgui_alert(user, "Do you really want to clear your entity list?", "confirm", list("Yes", "No")) != "Yes")
			return
		holder.entity_names = list()
		holder.entity_refs = list()
	else if(removekey)
		holder.entity_refs -= removekey
		holder.entity_names -= removekey

//Planned to have TGUI functionality
//For now brings up a list of all entities on our reference list and gives us the option to choose what we wanna do
//using TGUI/Byond list/alert inputs
//Does not actually interact with the game world, it passes user input to narrate_mob_args(name, mode, message) after sanitizing
ADMIN_VERB(narrate_mob, R_FUN, "Narrate Entity (Interface)", "Send either a visible or audiable message through your chosen entities using an interface.", "Fun.Narrate")
	if(!user.entity_narrate_holder)
		user.entity_narrate_holder = new /datum/entity_narrate()
		to_chat(user, "No references were added yet! First add references!")
		return
	if(!istype(user.entity_narrate_holder, /datum/entity_narrate))
		return
	var/datum/entity_narrate/holder = user.entity_narrate_holder

	//Obtaining and sanitizing arguments for the actual proc
	var/choices = holder.entity_names + "Open TGUI"
	var/which_entity = tgui_input_list(user, "Choose which mob to narrate", "Narrate mob", choices, null)
	if(!which_entity) return
	if(which_entity == "Open TGUI")
		holder.tgui_interact(user.mob)
	else
		var/mode = tgui_alert(user, "Speak or emote?", "mode", list("Speak", "Emote", "Cancel"))
		if(!mode || mode == "Cancel") return
		var/message = tgui_input_text(user, "Input what you want [which_entity] to [mode]", "narrate",
		null, multiline = TRUE, prevent_enter = TRUE)
		if(message)
			SSadmin_verbs.dynamic_invoke_verb(user, /datum/admin_verb/narrate_mob_args, which_entity, mode, message)

//The actual logic of the verb. Called by narrate_mob() when used.
ADMIN_VERB(narrate_mob_args, R_FUN, "Narrate Entity", "Narrate entities using positional arguments. Name should be as saved in ref list, mode should be Speak or Emote, follow with message.", "Fun.Narrate", name as text, mode as text, message as text)
	if(!user.entity_narrate_holder)
		user.entity_narrate_holder = new /datum/entity_narrate()
		to_chat(user, "No references were added yet! First add references!")
		return
	if(!istype(user.entity_narrate_holder, /datum/entity_narrate))
		return
	var/datum/entity_narrate/holder = user.entity_narrate_holder

	//Sanitizing args
	name = sanitize(name)
	mode = sanitize(mode)

	if(!(mode in list("Speak", "Emote")))
		to_chat(user, span_notice("Valid modes are 'Speak' and 'Emote'."))
		return
	if(!holder.entity_refs[name])
		to_chat(user, span_notice("[name] not in saved references!"))

	//Separate definition for mob/living and /obj due to .say() code allowing us to engage with languages, stuttering etc
	//We also need this so we can check for .client
	var/datum/weakref/wref = holder.entity_refs[name]
	var/selection = wref?.resolve()
	if(!selection)
		to_chat(user, span_notice("[name] has invalid reference, deleting"))
		holder.entity_names -= name
		holder.entity_refs -= name
	if(isliving(selection))
		var/mob/living/our_entity = selection
		if(our_entity.client) //Making sure we can't speak for players
			log_and_message_admins("used entity-narrate to speak through [our_entity.ckey]'s mob", user)
		if(!message)
			message = tgui_input_text(user, "Input what you want [our_entity] to [mode]", "narrate", null) //say/emote sanitize already
		if(message && mode == "Speak")
			our_entity.say(message)
		else if(message && mode == "Emote")
			our_entity.custom_emote(VISIBLE_MESSAGE, message)
		else
			return

	//This does cost us some code duplication, but I think it's worth it.
	//furthermore, objs/turfs require the user to specify the verb when speaking, otherwise it looks like an emote.
	else if(istype(selection, /atom))
		var/atom/our_entity = selection
		if(!message)
			message = tgui_input_text(user, "Input what you want [our_entity] to [mode]", "narrate", null)
		message = encode_html_emphasis(sanitize(message))
		if(message && mode == "Speak")
			our_entity.audible_message(span_bold("[our_entity.name]") + " [message]")
		else if(message && mode == "Emote")
			our_entity.visible_message(span_bold("[our_entity.name]") + " [message]")
		else
			return


/datum/entity_narrate/tgui_state(mob/user)
	return ADMIN_STATE(R_FUN)

/datum/entity_narrate/tgui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, tgui_id, "Entity Narration")
		ui.open()

/datum/entity_narrate/tgui_data(mob/user)
	var/list/data = list()
	data["mode_select"] = tgui_narrate_mode
	data["privacy_select"] = tgui_narrate_privacy
	data["selected_id"] = tgui_selected_id
	data["selected_name"] = tgui_selected_name
	data["selected_type"] = tgui_selected_type
	data["selection_mode"] = tgui_selection_mode
	data["multi_id_selection"] = tgui_selected_id_multi
	data["number_mob_selected"] = LAZYLEN(tgui_selected_id_multi)
	data["entity_names"] = entity_names

	return data

/datum/entity_narrate/tgui_act(action, list/params, datum/tgui/ui)
	. = ..()

	if(.)	return
	if(!check_rights_for(ui.user.client, R_FUN)) return

	switch(action)
		if("change_mode_multi")
			tgui_selection_mode = !tgui_selection_mode
			//Clearing selections after switching mode
			tgui_selected_id_multi = list()
			tgui_selected_id = ""
			tgui_selected_type = ""
			tgui_selected_name = ""
			tgui_selected_refs = null
			return TRUE
		if("change_mode_privacy")
			tgui_narrate_privacy = !tgui_narrate_privacy
			return TRUE
		if("change_mode_narration")
			tgui_narrate_mode = !tgui_narrate_mode
			return TRUE
		if("select_entity")
			if(tgui_selection_mode)
				if(params["id_selected"] in tgui_selected_id_multi)
					tgui_selected_id_multi -= params["id_selected"]
				else
					tgui_selected_id_multi += params["id_selected"]
			else
				if(params["id_selected"] in tgui_selected_id_multi)
					tgui_selected_id_multi -= params["id_selected"]
					tgui_selected_id = ""
					tgui_selected_type = ""
					tgui_selected_name = ""
					tgui_selected_refs = null
				else
					tgui_selected_id_multi = list() //Using the same var for ease of implementation. Thus, we must reset to empty each time.
					tgui_selected_id_multi += params["id_selected"]
					tgui_selected_id = params["id_selected"]
					var/datum/weakref/wref = entity_refs[tgui_selected_id]
					tgui_selected_refs = wref.resolve()
					if(!tgui_selected_refs)
						to_chat(ui.user, span_notice("[tgui_selected_id] has invalid reference, deleting"))
						entity_names -= tgui_selected_id
						entity_refs -= tgui_selected_id
						tgui_selected_id = ""
						tgui_selected_type = ""
						tgui_selected_name = ""
						tgui_selected_refs = null
					if(isliving(tgui_selected_refs))
						var/mob/living/L = tgui_selected_refs
						if(L.client)
							tgui_selected_type = "!!!!PLAYER!!!!"
							tgui_selected_name = L.name
						else
							tgui_selected_type = L.type
							tgui_selected_name = L.name
					else if(istype(tgui_selected_refs, /atom))
						var/atom/A = tgui_selected_refs
						tgui_selected_type = A.type
						tgui_selected_name = A.name
			return TRUE
		if("narrate")
			if(world.time < (tgui_last_message + 0.5 SECONDS))
				to_chat(ui.user, span_notice("You can't messages that quickly! Wait at least half a second"))
			else
				to_chat(ui.user, span_notice("Message successfully sent!"))
				tgui_last_message = world.time
				var/message = params["message"] //Sanitizing before speaking it
				if(tgui_selection_mode)
					for(var/entity in tgui_selected_id_multi)
						var/datum/weakref/wref = entity_refs[entity]
						var/ref = wref.resolve()
						if(!ref)
							to_chat(ui.user, span_notice("[entity] has invalid reference, deleting"))
							entity_names -= entity
							entity_refs -= entity
							tgui_selected_id_multi -= entity
							continue
						if(isliving(ref))
							var/mob/living/L = ref
							if(L.client)
								log_and_message_admins("used entity-narrate to speak through [L.ckey]'s mob", ui.user)
							narrate_tgui_mob(L, message)
						else if(istype(ref, /atom))
							var/atom/A = ref
							narrate_tgui_atom(A, message)
				else
					var/datum/weakref/wref = entity_refs[tgui_selected_id]
					var/ref = wref.resolve()
					if(!ref)
						to_chat(ui.user, span_notice("[tgui_selected_id] has invalid reference, deleting"))
						entity_names -= tgui_selected_id
						entity_refs -= tgui_selected_id
						tgui_selected_id = ""
						tgui_selected_type = ""
						tgui_selected_name = ""
						tgui_selected_refs = null
						return TRUE
					if(isliving(ref))
						var/mob/living/L = ref
						if(L.client)
							log_and_message_admins("used entity-narrate to speak through [L.ckey]'s mob", ui.user)
						narrate_tgui_mob(L, message)
					else if(istype(ref, /atom))
						var/atom/A = ref
						narrate_tgui_atom(A, message)
			return TRUE

/datum/entity_narrate/proc/narrate_tgui_mob(mob/living/L, message as text)
	//say and custom_emote sanitize it themselves, not sanitizing here to avoid double encoding.
	if(tgui_narrate_mode && tgui_narrate_privacy)
		L.custom_emote_vr(m_type = VISIBLE_MESSAGE, message = message)
	else if(tgui_narrate_mode && !tgui_narrate_privacy)
		L.custom_emote(VISIBLE_MESSAGE, message)
	else if(!tgui_narrate_mode && tgui_narrate_privacy)
		L.say(message, whispering = 1)
	else if(!tgui_narrate_mode && !tgui_narrate_privacy)
		L.say(message)

/datum/entity_narrate/proc/narrate_tgui_atom(atom/A, message as text)
	message = encode_html_emphasis(sanitize(message))
	if(tgui_narrate_mode && tgui_narrate_privacy)
		A.visible_message(span_italics(span_bold("\The [A.name]") + " [message]"), range = 1)
	else if(tgui_narrate_mode && !tgui_narrate_privacy)
		A.visible_message(span_bold("\The [A.name]") + " [message]",)
	else if(!tgui_narrate_mode && tgui_narrate_privacy)
		A.audible_message(span_italics(span_bold("\The [A.name]") + " [message]"), hearing_distance = 1)
	else if(!tgui_narrate_mode && !tgui_narrate_privacy)
		A.audible_message(span_bold("\The [A.name]") + " [message]")
