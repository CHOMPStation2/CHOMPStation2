GLOBAL_VAR_INIT(global_vantag_hud, 0)

ADMIN_VERB(drop_everything, R_ADMIN, "Drop Everything", ADMIN_VERB_NO_DESCRIPTION, ADMIN_CATEGORY_HIDDEN, mob/living/dropee in GLOB.mob_list)
	var/confirm = tgui_alert(src, "Make [dropee] drop everything?", "Message", list("Yes", "No"))
	if(confirm != "Yes")
		return

	for(var/obj/item/W in dropee)
		if(istype(W, /obj/item/implant/backup) || istype(W, /obj/item/nif))	//There's basically no reason to remove either of these
			continue
		dropee.drop_from_inventory(W)

	dropee.regenerate_icons()

	log_admin("[key_name(user)] made [key_name(dropee)] drop everything!")
	var/msg = "[key_name_admin(user)] made [ADMIN_LOOKUPFLW(dropee)] drop everything!"
	message_admins(msg)
	feedback_add_details("admin_verb","DEVR") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/client/proc/cmd_admin_prison(mob/M as mob in GLOB.mob_list)
	set category = "Admin.Game"
	set name = "Prison"
	if(!check_rights_for(src, R_HOLDER))
		return

	if (ismob(M))
		if(isAI(M))
			tgui_alert_async(usr, "The AI can't be sent to prison you jerk!")
			return
		//strip their stuff before they teleport into a cell :downs:
		for(var/obj/item/W in M)
			M.drop_from_inventory(W)
		//teleport person to cell
		M.Paralyse(5)
		sleep(5)	//so they black out before warping
		M.loc = pick(GLOB.prisonwarp)
		if(ishuman(M))
			var/mob/living/carbon/human/prisoner = M
			prisoner.equip_to_slot_or_del(new /obj/item/clothing/under/color/prison(prisoner), slot_w_uniform)
			prisoner.equip_to_slot_or_del(new /obj/item/clothing/shoes/orange(prisoner), slot_shoes)
		spawn(50)
			to_chat(M, span_red("You have been sent to the prison station!"))
		log_admin("[key_name(usr)] sent [key_name(M)] to the prison station.")
		message_admins(span_blue("[key_name_admin(usr)] sent [key_name_admin(M)] to the prison station."), 1)
		feedback_add_details("admin_verb","PRISON") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

//Allows staff to determine who the newer players are.
/client/proc/cmd_check_new_players()
	set category = "Admin.Investigate"
	set name = "Check new Players"
	if(!check_rights_for(src, R_HOLDER))
		return

	var/age = tgui_alert(src, "Age check", "Show accounts yonger then _____ days", list("7","30","All"))
	if(!age)
		return
	if(age == "All")
		age = 9999999
	else
		age = text2num(age)

	var/missing_ages = 0
	var/msg = ""

	var/highlight_special_characters = 1

	for(var/client/C in GLOB.clients)
		if(C.player_age == "Requires database")
			missing_ages = 1
			continue
		if(C.player_age < age)
			msg += "[key_name(C, 1, 1, highlight_special_characters)]: account is [C.player_age] days old<br>"

	if(missing_ages)
		to_chat(src, "Some accounts did not have proper ages set in their clients.  This function requires database to be present.")

	if(msg != "")
		var/datum/browser/popup = new(src, "Player_age_check", "Player Age Check")
		popup.set_content(msg)
		popup.open()
	else
		to_chat(src, "No matches for that age range found.")

/client/proc/cmd_admin_subtle_message(mob/M as mob in GLOB.mob_list)
	set category = "Admin"
	set name = "Subtle Message"

	if(!ismob(M))	return
	if (!check_rights_for(src, R_HOLDER))
		return

	var/msg = tgui_input_text(usr, "Message:", text("Subtle PM to [M.key]"))

	if (!msg)
		return

	if(!(msg[1] == "<" && msg[length(msg)] == ">")) //You can use HTML but only if the whole thing is HTML. Tries to prevent admin 'accidents'.
		msg = sanitize(msg)

	if(usr)
		if (usr.client)
			if(check_rights_for(usr.client, R_HOLDER))
				to_chat(M, span_bold("You hear a voice in your head...") + " " + span_italics("[msg]"))

	log_admin("SubtlePM: [key_name(usr)] -> [key_name(M)] : [msg]")
	msg = span_admin_pm_notice(span_bold(" SubtleMessage: [key_name_admin(usr)] -> [key_name_admin(M)] :") + " [msg]")
	message_admins(msg)
	admin_ticket_log(M, msg)
	feedback_add_details("admin_verb","SMS") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/client/proc/cmd_admin_world_narrate() // Allows administrators to fluff events a little easier -- TLE
	set category = "Fun.Narrate"
	set name = "Global Narrate"

	if (!check_rights_for(src, R_HOLDER))
		return

	var/msg = tgui_input_text(usr, "Message:", text("Enter the text you wish to appear to everyone:"))

	if (!msg)
		return
	if(!(msg[1] == "<" && msg[length(msg)] == ">")) //You can use HTML but only if the whole thing is HTML. Tries to prevent admin 'accidents'.
		msg = sanitize(msg)
	if (!msg)		// We check both before and after, just in case sanitization ended us up with empty message.
		return

	to_world("[msg]")
	log_admin("GlobalNarrate: [key_name(usr)] : [msg]")
	message_admins(span_blue(span_bold(" GlobalNarrate: [key_name_admin(usr)] : [msg]<BR>")), 1)
	feedback_add_details("admin_verb","GLN") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/client/proc/cmd_admin_direct_narrate(var/mob/M)	// Targetted narrate -- TLE
	set category = "Fun.Narrate"
	set name = "Direct Narrate"

	if(!check_rights_for(src, R_HOLDER))
		return

	if(!M)
		M = tgui_input_list(usr, "Direct narrate to who?", "Active Players", get_mob_with_client_list())

	if(!M)
		return

	var/msg = tgui_input_text(usr, "Message:", text("Enter the text you wish to appear to your target:"))
	if(msg && !(msg[1] == "<" && msg[length(msg)] == ">")) //You can use HTML but only if the whole thing is HTML. Tries to prevent admin 'accidents'.
		msg = sanitize(msg)

	if( !msg )
		return

	to_chat(M, msg)
	log_admin("DirectNarrate: [key_name(usr)] to ([M.name]/[M.key]): [msg]")
	msg = span_admin_pm_notice(span_bold(" DirectNarrate: [key_name(usr)] to ([M.name]/[M.key]):") + " [msg]<BR>")
	message_admins(msg)
	admin_ticket_log(M, msg)
	feedback_add_details("admin_verb","DIRN") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/client/proc/cmd_admin_godmode(mob/M as mob in GLOB.mob_list)
	set category = "Admin.Game"
	set name = "Toggle Godmode"

	if(!check_rights_for(src, R_HOLDER))
		return

	if(M.status_flags & GODMODE)
		M.RemoveElement(/datum/element/godmode)

	else if(!(M.status_flags & GODMODE))
		M.AddElement(/datum/element/godmode)

	to_chat(usr, span_blue("Toggled [(M.status_flags & GODMODE) ? "ON" : "OFF"]"))

	log_admin("[key_name(usr)] has toggled [key_name(M)]'s godmode to [(M.status_flags & GODMODE) ? "On" : "Off"]")
	var/msg = "[key_name_admin(usr)] has toggled [ADMIN_LOOKUPFLW(M)]'s godmode to [(M.status_flags & GODMODE) ? "On" : "Off"]"
	message_admins(msg)
	admin_ticket_log(M, msg)
	feedback_add_details("admin_verb","GOD_ENABLE") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/proc/cmd_admin_mute(mob/M as mob, mute_type, automute = 0)
	if(automute)
		if(!CONFIG_GET(flag/automute_on))
			return
	else
		if(!usr || !usr.client)
			return
		if(!check_rights_for(usr.client, R_HOLDER))
			to_chat(usr, span_red("Error: cmd_admin_mute: You don't have permission to do this."))
			return
		if(!M.client)
			to_chat(usr, span_red("Error: cmd_admin_mute: This mob doesn't have a client tied to it."))
		if(check_rights_for(M.client, R_HOLDER))
			to_chat(usr, span_red("Error: cmd_admin_mute: You cannot mute an admin/mod."))
	if(!M.client)
		return
	if(check_rights_for(M.client, R_HOLDER))
		return

	var/muteunmute
	var/mute_string

	switch(mute_type)
		if(MUTE_IC)			mute_string = "IC (say and emote)"
		if(MUTE_OOC)		mute_string = "OOC"
		if(MUTE_LOOC)		mute_string = "LOOC"
		if(MUTE_PRAY)		mute_string = "pray"
		if(MUTE_ADMINHELP)	mute_string = "adminhelp, admin PM and ASAY"
		if(MUTE_DEADCHAT)	mute_string = "deadchat and DSAY"
		if(MUTE_ALL)		mute_string = "everything"
		else				return

	if(automute)
		muteunmute = "auto-muted"
		M.client.prefs.muted |= mute_type
		log_admin("SPAM AUTOMUTE: [muteunmute] [key_name(M)] from [mute_string]")
		message_admins("SPAM AUTOMUTE: [muteunmute] [key_name_admin(M)] from [mute_string].", 1)
		to_chat(M, span_alert("You have been [muteunmute] from [mute_string] by the SPAM AUTOMUTE system. Contact an admin."))
		feedback_add_details("admin_verb","AUTOMUTE") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!
		return

	if(M.client.prefs.muted & mute_type)
		muteunmute = "unmuted"
		M.client.prefs.muted &= ~mute_type
	else
		muteunmute = "muted"
		M.client.prefs.muted |= mute_type

	log_admin("[key_name(usr)] has [muteunmute] [key_name(M)] from [mute_string]")
	message_admins("[key_name_admin(usr)] has [muteunmute] [key_name_admin(M)] from [mute_string].", 1)
	to_chat(M, span_alert("You have been [muteunmute] from [mute_string]."))
	feedback_add_details("admin_verb","MUTE") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/client/proc/cmd_admin_add_random_ai_law()
	set category = "Fun.Silicon"
	set name = "Add Random AI Law"

	if(!check_rights_for(src, R_HOLDER))
		return

	var/confirm = tgui_alert(src, "You sure?", "Confirm", list("Yes", "No"))
	if(confirm != "Yes") return
	log_admin("[key_name(src)] has added a random AI law.")
	message_admins("[key_name_admin(src)] has added a random AI law.", 1)

	var/show_log = tgui_alert(src, "Show ion message?", "Message", list("Yes", "No"))
	if(!show_log)
		return
	if(show_log == "Yes")
		command_announcement.Announce("Ion storm detected near \the [station_name()]. Please check all AI-controlled equipment for errors.", "Anomaly Alert", new_sound = 'sound/AI/ionstorm.ogg')

	IonStorm(0)
	feedback_add_details("admin_verb","ION") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/*
Allow admins to set players to be able to respawn/bypass 30 min wait, without the admin having to edit variables directly
Ccomp's first proc.
*/

/client/proc/get_ghosts(var/notify = 0,var/what = 2)
	// what = 1, return ghosts ass list.
	// what = 2, return mob list

	var/list/mobs = list()
	var/list/ghosts = list()
	if(!LAZYLEN(GLOB.observer_mob_list))
		if(notify)
			to_chat(src, "There doesn't appear to be any ghosts for you to select.")
		return
	var/list/sortmob = sort_names(GLOB.observer_mob_list)                           // get the mob list.

	for(var/mob/M in sortmob)
		var/name = M.name
		ghosts[name] = M                                        //get the name of the mob for the popup list
	if(what==1)
		return ghosts
	else
		return mobs


/client/proc/allow_character_respawn()
	set category = "Admin.Game"
	set name = "Allow player to respawn"
	set desc = "Let a player bypass the wait to respawn or allow them to re-enter their corpse."

	if(!check_rights_for(src, R_HOLDER))
		return

	var/target = tgui_input_list(usr, "Select a ckey to allow to rejoin", "Allow Respawn Selector", GLOB.respawn_timers)
	if(!target)
		return

	if(GLOB.respawn_timers[target] == -1) // Their respawn timer is set to -1, which is 'not allowed to respawn'
		var/response = tgui_alert(src, "Are you sure you wish to allow this individual to respawn? They would normally not be able to.","Allow impossible respawn?",list("No","Yes"))
		if(response != "Yes")
			return

	GLOB.respawn_timers -= target

	var/found_client = FALSE
	for(var/client/C as anything in GLOB.clients)
		if(C.ckey == target)
			found_client = C
			to_chat(C, span_boldnotice("You may now respawn. You should roleplay as if you learned nothing about the round during your time with the dead."))
			if(isobserver(C.mob))
				var/mob/observer/dead/G = C.mob
				G.can_reenter_corpse = 1
				to_chat(C, span_boldnotice("You can also re-enter your corpse, if you still have one!"))
			break

	if(!found_client)
		to_chat(src, span_notice("The associated client didn't appear to be connected, so they couldn't be notified, but they can now respawn if they reconnect."))

	log_admin("[key_name(usr)] allowed [found_client ? key_name(found_client) : target] to bypass the respawn time limit")
	message_admins("Admin [key_name_admin(usr)] allowed [found_client ? key_name_admin(found_client) : target] to bypass the respawn time limit", 1)


/client/proc/toggle_antagHUD_use()
	set category = "Server.Game"
	set name = "Toggle antagHUD usage"
	set desc = "Toggles antagHUD usage for observers"

	if(!check_rights_for(src, R_HOLDER))
		return

	var/action=""
	if(CONFIG_GET(flag/antag_hud_allowed))
		for(var/mob/observer/dead/g in get_ghosts())
			if(!check_rights_for(g.client, R_HOLDER))						//Remove the verb from non-admin ghosts
				remove_verb(g, /mob/observer/dead/verb/toggle_antagHUD)
			if(g.antagHUD)
				g.antagHUD = 0						// Disable it on those that have it enabled
				g.has_enabled_antagHUD = 2				// We'll allow them to respawn
				to_chat(g, span_boldwarning("The Administrator has disabled AntagHUD "))
		CONFIG_SET(flag/antag_hud_allowed, FALSE)
		to_chat(src, span_boldwarning("AntagHUD usage has been disabled"))
		action = "disabled"
	else
		for(var/mob/observer/dead/g in get_ghosts())
			if(!check_rights_for(g.client, R_HOLDER))						// Add the verb back for all non-admin ghosts
				add_verb(g, /mob/observer/dead/verb/toggle_antagHUD)
			to_chat(g, span_boldnotice("The Administrator has enabled AntagHUD"))	// Notify all observers they can now use AntagHUD
		CONFIG_SET(flag/antag_hud_allowed, TRUE)
		action = "enabled"
		to_chat(src, span_boldnotice("AntagHUD usage has been enabled"))


	log_admin("[key_name(usr)] has [action] antagHUD usage for observers")
	message_admins("Admin [key_name_admin(usr)] has [action] antagHUD usage for observers", 1)



/client/proc/toggle_antagHUD_restrictions()
	set category = "Server.Game"
	set name = "Toggle antagHUD Restrictions"
	set desc = "Restricts players that have used antagHUD from being able to join this round."

	if(!check_rights_for(src, R_HOLDER))
		return

	var/action=""
	if(CONFIG_GET(flag/antag_hud_restricted))
		for(var/mob/observer/dead/g in get_ghosts())
			to_chat(g, span_boldnotice("The administrator has lifted restrictions on joining the round if you use AntagHUD"))
		action = "lifted restrictions"
		CONFIG_SET(flag/antag_hud_restricted, FALSE)
		to_chat(src, span_boldnotice("AntagHUD restrictions have been lifted"))
	else
		for(var/mob/observer/dead/g in get_ghosts())
			to_chat(g, span_boldwarning("The administrator has placed restrictions on joining the round if you use AntagHUD"))
			to_chat(g, span_boldwarning("Your AntagHUD has been disabled, you may choose to re-enabled it but will be under restrictions "))
			g.antagHUD = 0
			g.has_enabled_antagHUD = 0
		action = "placed restrictions"
		CONFIG_SET(flag/antag_hud_restricted, TRUE)
		to_chat(src, span_boldwarning("AntagHUD restrictions have been enabled"))

	log_admin("[key_name(usr)] has [action] on joining the round if they use AntagHUD")
	message_admins("Admin [key_name_admin(usr)] has [action] on joining the round if they use AntagHUD", 1)

/*
If a guy was gibbed and you want to revive him, this is a good way to do so.
Works kind of like entering the game with a new character. Character receives a new mind if they didn't have one.
Traitors and the like can also be revived with the previous role mostly intact.
/N */
ADMIN_VERB(respawn_character, (R_ADMIN|R_REJUVINATE), "Spawn Character", "(Re)Spawn a client's loaded character.", "Fun.Event Kit")
	var/client/picked_client = tgui_input_list(user, "Please specify which client's character to spawn.", "Client", GLOB.clients)
	if(!picked_client)
		return

	user.respawn_character_proper(picked_client)

/client/proc/respawn_character_proper(client/picked_client)
	if(!istype(picked_client))
		return

	//I frontload all the questions so we don't have a half-done process while you're reading.
	var/location = tgui_alert(src, "Please specify where to spawn them.", "Location", list("Right Here", "Arrivals", "Cancel"))
	if(location == "Cancel" || !location)
		return

	var/announce = tgui_alert(src,"Announce as if they had just arrived?", "Announce", list("No", "Yes", "Cancel"))
	if(!announce || announce == "Cancel")
		return
	else if(announce == "Yes") //Too bad buttons can't just have 1/0 values and different display strings
		announce = 1
	else
		announce = 0

	var/inhabit = tgui_alert(src,"Put the person into the spawned mob?", "Inhabit", list("Yes", "No", "Cancel"))
	if(!inhabit || inhabit == "Cancel")
		return
	else if(inhabit == "Yes")
		inhabit = 1
	else
		inhabit = 0

	//Name matching is ugly but mind doesn't persist to look at.
	var/charjob
	var/records
	var/datum/data/record/record_found
	record_found = find_general_record("name",picked_client.prefs.real_name)

	//Found their record, they were spawned previously
	if(record_found)
		var/samejob = tgui_alert(src,"Found [picked_client.prefs.real_name] in data core. They were [record_found.fields["real_rank"]] this round. Assign same job? They will not be re-added to the manifest/records, either way.","Previously spawned",list("Yes","Assistant","No"))
		if(!samejob)
			return
		if(samejob == "Yes")
			charjob = record_found.fields["real_rank"]
		else if(samejob == JOB_ALT_VISITOR)
			charjob = JOB_ALT_VISITOR
	else
		records = tgui_alert(src,"No data core entry detected. Would you like add them to the manifest, and sec/med/HR records?","Records",list("No", "Yes", "Cancel"))
		if(!records || records == "Cancel")
			return
		if(records == "Yes")
			records = 1
		else
			records = 0

	//Well you're not reloading their job or they never had one.
	if(!charjob)
		var/pickjob = tgui_input_list(src,"Pick a job to assign them (or none).","Job Select", GLOB.joblist + "-No Job-", "-No Job-")
		if(!pickjob)
			return
		if(pickjob != "-No Job-")
			charjob = pickjob

	//If you've picked a job by now, you can equip them.
	var/equipment
	if(charjob)
		equipment = tgui_alert(src,"Spawn them with equipment?", "Equipment", list("Yes", "No", "Cancel"))
		if(!equipment || equipment == "Cancel")
			return
		else if(equipment == "Yes")
			equipment = 1
		else
			equipment = 0

	var/custom_job
	var/custom_job_title
	if(charjob)
		custom_job = tgui_alert(src,"Customise Job Title?", "Custom Job", list("No", "Yes", "Cancel"))
		if(!custom_job || equipment == "Cancel")
			return
		else if(custom_job == "Yes")
			custom_job = 1
			custom_job_title = tgui_input_text(src,"Choose a Job Title for the character.","Job Title")
		else
			custom_job = 0

	//For logging later
	var/admin = key_name_admin(src)
	var/player_key = picked_client.key
	var/picked_ckey = picked_client.ckey
	var/picked_slot = picked_client.prefs.default_slot

	var/mob/living/carbon/human/new_character
	var/spawnloc
	var/showy

	//Where did you want to spawn them?
	switch(location)
		if("Right Here") //Spawn them on your turf
			spawnloc = get_turf(src.mob)
			showy = tgui_input_list(src,"Showy entrance?", "Showy", list("No", "Telesparks", "Drop Pod", "Fall", "Cancel"))
			if(showy == "Cancel")
				return
			if(showy == "Drop Pod")
				showy = tgui_alert(src,"Destructive drop pods cause damage in a 3x3 and may break turfs. Polite drop pods lightly damage the turfs but won't break through.", "Drop Pod", list("Polite", "Destructive", "Cancel")) // reusing var
				if(!showy || showy == "Cancel")
					return

		if("Arrivals") //Spawn them at a latejoin spawnpoint
			if(LAZYLEN(GLOB.latejoin))
				spawnloc = get_turf(pick(GLOB.latejoin))
			else if(LAZYLEN(GLOB.latejoin_tram))
				spawnloc = pick(GLOB.latejoin_tram)
			else
				to_chat(src, "This map has no latejoin spawnpoint.")
				return

		else //I have no idea how you're here
			to_chat(src, "Invalid spawn location choice.")
			return

	//Did we actually get a loc to spawn them?
	if(!spawnloc)
		to_chat(src, "Couldn't get valid spawn location.")
		return

	new_character = new(spawnloc)

	if(showy == "Telesparks")
		anim(spawnloc,new_character,'icons/mob/mob.dmi',,"phasein",,new_character.dir)
		playsound(spawnloc, "sparks", 50, 1)
		var/datum/effect/effect/system/spark_spread/spk = new(new_character)
		spk.set_up(5, 0, new_character)
		spk.attach(new_character)
		spk.start()

	//We were able to spawn them, right?
	if(!new_character)
		to_chat(src, "Something went wrong and spawning failed.")
		return

	// Respect admin spawn record choice. There's really not a nice way to do this without butchering copy_to() code for an admin proc
	var/old_mind_scan = picked_client.prefs.resleeve_scan
	var/old_body_scan = picked_client.prefs.mind_scan
	if(!records) // Make em false for the copy_to()
		picked_client.prefs.resleeve_scan = FALSE
		picked_client.prefs.mind_scan = FALSE

	//Write the appearance and whatnot out to the character
	picked_client.prefs.copy_to(new_character)

	// Restore pref state
	picked_client.prefs.resleeve_scan = old_mind_scan
	picked_client.prefs.mind_scan = old_body_scan

	//Write the appearance and whatnot out to the character
	if(new_character.dna)
		new_character.dna.ResetUIFrom(new_character)
		new_character.sync_dna_traits(TRUE) // Traitgenes Sync traits to genetics if needed
		new_character.sync_organ_dna()
	new_character.sync_addictions() // These are addicitions our profile wants... May as well give them!
	new_character.initialize_vessel()
	if(inhabit)
		new_character.key = player_key
		//Were they any particular special role? If so, copy.
		if(new_character.mind)
			var/datum/antagonist/antag_data = get_antag_data(new_character.mind.special_role)
			if(antag_data)
				antag_data.add_antagonist(new_character.mind)
				antag_data.place_mob(new_character)
			if(new_character.mind.antag_holder)
				new_character.mind.antag_holder.apply_antags(new_character)

	if(new_character.mind)
		new_character.mind.loaded_from_ckey = picked_ckey
		new_character.mind.loaded_from_slot = picked_slot

	for(var/lang in picked_client.prefs.alternate_languages)
		var/datum/language/chosen_language = GLOB.all_languages[lang]
		if(chosen_language)
			if(is_lang_whitelisted(src,chosen_language) || (new_character.species && (chosen_language.name in new_character.species.secondary_langs)))
				new_character.add_language(lang)

	SEND_SIGNAL(new_character, COMSIG_HUMAN_DNA_FINALIZED)

	//If desired, apply equipment.
	if(equipment)
		if(charjob)
			job_master.EquipRank(new_character, charjob, 1, announce)
			if(new_character.mind)
				new_character.mind.assigned_role = charjob
				new_character.mind.role_alt_title = job_master.GetPlayerAltTitle(new_character, charjob)
		equip_custom_items(new_character)	//CHOMPEdit readded to enable custom_item.txt

	//If customised job title, modify here.
	if(custom_job && custom_job_title)
		var/character_name = new_character.name
		for(var/obj/item/card/id/I in new_character.contents)
			I.name = "[character_name]'s ID Card ([custom_job_title])"
			I.assignment = custom_job_title
		for(var/obj/item/pda/P in new_character.contents)
			P.name = "PDA-[character_name] ([custom_job_title])"
			P.ownjob = custom_job_title
		new_character.mind.assigned_role = custom_job_title
		new_character.mind.role_alt_title = custom_job_title
		to_chat(new_character, "Your job title has been changed to [custom_job_title].")

	//If desired, add records.
	if(records)
		GLOB.data_core.manifest_inject(new_character)

	//A redraw for good measure
	new_character.regenerate_icons()

	new_character.update_transform()

	//If we're announcing their arrival
	if(announce)
		AnnounceArrival(new_character, new_character.mind.assigned_role, "Common", new_character.z)

	log_admin("[admin] has spawned [player_key]'s character [new_character.real_name].")
	message_admins("[admin] has spawned [player_key]'s character [new_character.real_name].", 1)



	feedback_add_details("admin_verb","RSPCH") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

	// Drop pods and fall
	if(showy == "Polite")
		var/turf/T = get_turf(new_character)
		new /obj/structure/drop_pod/polite(T, new_character)
		to_chat(new_character, "Please wait for your arrival.")
	else if(showy == "Destructive")
		var/turf/T = get_turf(new_character)
		new /obj/structure/drop_pod(T, new_character)
		to_chat(new_character, "Please wait for your arrival.")
	else if(showy == "Fall")
		spawn(1)
			var/initial_x = new_character.pixel_x
			var/initial_y = new_character.pixel_y
			new_character.plane = 1
			new_character.pixel_x = rand(-150, 150)
			new_character.pixel_y = 500 // When you think that pixel_z is height but you are wrong
			new_character.density = FALSE
			new_character.opacity = FALSE
			animate(new_character, pixel_y = initial_y, pixel_x = initial_x , time = 7)
			spawn(7)
				new_character.end_fall()
		to_chat(new_character, "You have been fully spawned. Enjoy the game.")

	return new_character

/client/proc/cmd_admin_add_freeform_ai_law()
	set category = "Fun.Silicon"
	set name = "Add Custom AI law"

	if(!check_rights_for(src, R_HOLDER))
		return

	var/input = sanitize(tgui_input_text(usr, "Please enter anything you want the AI to do. Anything. Serious.", "What?", ""))
	if(!input)
		return
	for(var/mob/living/silicon/ai/M in GLOB.mob_list)
		if (M.stat == 2)
			to_chat(usr, "Upload failed. No signal is being detected from the AI.")
		else if (M.see_in_dark == 0)
			to_chat(usr, "Upload failed. Only a faint signal is being detected from the AI, and it is not responding to our requests. It may be low on power.")
		else
			M.add_ion_law(input)
			for(var/mob/living/silicon/ai/O in GLOB.mob_list)
				to_chat(O,input + span_red("... LAWS UPDATED!"))
				O.show_laws()

	log_admin("Admin [key_name(usr)] has added a new AI law - [input]")
	message_admins("Admin [key_name_admin(usr)] has added a new AI law - [input]", 1)

	var/show_log = tgui_alert(src, "Show ion message?", "Message", list("Yes", "No"))
	if(show_log == "Yes")
		command_announcement.Announce("Ion storm detected near the [station_name()]. Please check all AI-controlled equipment for errors.", "Anomaly Alert", new_sound = 'sound/AI/ionstorm.ogg')
	feedback_add_details("admin_verb","IONC") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/client/proc/cmd_admin_rejuvenate(mob/living/M as mob in GLOB.mob_list)
	set category = "Admin.Game"
	set name = "Rejuvenate"

	if(!check_rights_for(src, R_HOLDER))
		return

	if(!mob)
		return
	if(!istype(M))
		tgui_alert_async(usr, "Cannot revive a ghost")
		return
	if(CONFIG_GET(flag/allow_admin_rev))
		M.revive()

		log_admin("[key_name(usr)] healed / revived [key_name(M)]")
		var/msg = span_danger("Admin [key_name_admin(usr)] healed / revived [ADMIN_LOOKUPFLW(M)]!")
		message_admins(msg)
		admin_ticket_log(M, msg)
	else
		tgui_alert_async(usr, "Admin revive disabled")
	feedback_add_details("admin_verb","REJU") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/client/proc/cmd_admin_create_centcom_report()
	set category = "Fun.Event Kit"
	set name = "Create Command Report"

	if(!check_rights_for(src, R_HOLDER))
		return

	var/input = sanitize(tgui_input_text(usr, "Please enter anything you want. Anything. Serious.", "What?", "", multiline = TRUE, prevent_enter = TRUE), extra = 0)
	var/customname = sanitizeSafe(tgui_input_text(usr, "Pick a title for the report.", "Title"))
	if(!input)
		return
	if(!customname)
		customname = "[using_map.company_name] Update"

	//New message handling
	post_comm_message(customname, replacetext(input, "\n", "<br/>"))

	var/confirm = tgui_alert(usr, "Should this be announced to the general population?","Show world?",list("Yes","No"))
	if(!confirm)
		return
	if(confirm == "Yes")
		command_announcement.Announce(input, customname, new_sound = 'sound/AI/commandreport.ogg', msg_sanitized = 1);
	else
		to_world(span_red("New [using_map.company_name] Update available at all communication consoles."))
		world << sound('sound/AI/commandreport.ogg')

	log_admin("[key_name(src)] has created a command report: [input]")
	message_admins("[key_name_admin(src)] has created a command report", 1)
	feedback_add_details("admin_verb","CCR") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/client/proc/cmd_admin_delete(atom/O as obj|mob|turf in _validate_atom(O)) // I don't understand precisely how this fixes the string matching against a substring, but it does - Ater
	set category = "Admin.Game"
	set name = "Delete"

	if (!check_rights_for(src, R_HOLDER))
		return

	admin_delete(O)

/client/proc/cmd_admin_list_open_jobs()
	set category = "Admin.Investigate"
	set name = "List free slots"

	if (!check_rights_for(src, R_HOLDER))
		return

	if(job_master)
		for(var/datum/job/job in job_master.occupations)
			to_chat(src, "[job.title]: [job.total_positions]")
	feedback_add_details("admin_verb","LFS") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/*
/client/proc/cmd_manual_ban()
	set name = "Manual Ban"
	set category = "Admin.Moderation"
	if(!authenticated || !check_rights_for(src, R_HOLDER))
		to_chat(src, "Only administrators may use this command.")
		return
	var/mob/M = null
	switch(tgui_alert(usr, "How would you like to ban someone today?", "Manual Ban", "Key List", "Enter Manually", "Cancel"))
		if("Key List")
			var/list/keys = list()
			for(var/mob/M in GLOB.player_list)
				keys += M.client
			var/selection = tgui_input_list(usr, "Please, select a player!", "Admin Jumping", keys)
			if(!selection)
				return
			M = selection:mob
			if ((M.client && check_rights_for(M.client, R_HOLDER) && (M.client.holder.level >= holder.level)))
				tgui_alert_async(usr, "You cannot perform this action. You must be of a higher administrative rank!")
				return

	switch(tgui_alert(usr, "Temporary Ban?","Temporary Ban",list("Yes","No")))
	if("Yes")
		var/mins = tgui_input_number(usr,"How long (in minutes)?","Ban time",1440) as num
		if(!mins)
			return
		if(mins >= 525600) mins = 525599
		var/reason = tgui_input_text(usr,"Reason?","reason","Griefer")
		if(!reason)
			return
		if(M)
			AddBan(M.ckey, M.computer_id, reason, usr.ckey, 1, mins)
			to_chat(M, span_red(span_large(span_bold("You have been banned by [usr.client.ckey].\nReason: [reason]."))))
			to_chat(M, span_red("This is a temporary ban, it will be removed in [mins] minutes."))
			to_chat(M, span_red("To try to resolve this matter head to http://ss13.donglabs.com/forum/"))
			log_admin("[usr.client.ckey] has banned [M.ckey].\nReason: [reason]\nThis will be removed in [mins] minutes.")
			message_admins(span_blue("[usr.client.ckey] has banned [M.ckey].\nReason: [reason]\nThis will be removed in [mins] minutes."))
			world.Export("http://216.38.134.132/adminlog.php?type=ban&key=[usr.client.key]&key2=[M.key]&msg=[html_decode(reason)]&time=[mins]&server=[replacetext(config.server_name, "#", "")]")
			del(M.client)
			qdel(M)
		else

	if("No")
		var/reason = tgui_input_text(usr,"Reason?","reason","Griefer")
		if(!reason)
			return
		AddBan(M.ckey, M.computer_id, reason, usr.ckey, 0, 0)
		to_chat(M, span_red(span_large(span_bold("You have been banned by [usr.client.ckey].\nReason: [reason]."))))
		to_chat(M, span_red("This is a permanent ban."))
		to_chat(M, span_red("To try to resolve this matter head to http://ss13.donglabs.com/forum/"))
		log_admin("[usr.client.ckey] has banned [M.ckey].\nReason: [reason]\nThis is a permanent ban.")
		message_admins(span_blue("[usr.client.ckey] has banned [M.ckey].\nReason: [reason]\nThis is a permanent ban."))
		world.Export("http://216.38.134.132/adminlog.php?type=ban&key=[usr.client.key]&key2=[M.key]&msg=[html_decode(reason)]&time=perma&server=[replacetext(config.server_name, "#", "")]")
		del(M.client)
		qdel(M)
*/

/client/proc/update_world()
	// If I see anyone granting powers to specific keys like the code that was here,
	// I will both remove their SVN access and permanently ban them from my servers.
	return

/client/proc/cmd_admin_check_contents(mob/living/M as mob in GLOB.mob_list)
	set category = "Admin.Investigate"
	set name = "Check Contents"
	set popup_menu = FALSE

	if(!check_rights_for(src, R_HOLDER))
		return

	var/list/L = M.get_contents()
	for(var/t in L)
		to_chat(usr, "[t]")
	feedback_add_details("admin_verb","CC") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/* This proc is DEFERRED. Does not do anything.
/client/proc/cmd_admin_remove_phoron()
	set category = "Debug.Game"
	set name = "Stabilize Atmos."
	if(!check_rights_for(src, R_HOLDER))
		to_chat(src, "Only administrators may use this command.")
		return
	feedback_add_details("admin_verb","STATM") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!
// DEFERRED
	spawn(0)
		for(var/turf/T in view())
			T.poison = 0
			T.oldpoison = 0
			T.tmppoison = 0
			T.oxygen = 755985
			T.oldoxy = 755985
			T.tmpoxy = 755985
			T.co2 = 14.8176
			T.oldco2 = 14.8176
			T.tmpco2 = 14.8176
			T.n2 = 2.844e+006
			T.on2 = 2.844e+006
			T.tn2 = 2.844e+006
			T.tsl_gas = 0
			T.osl_gas = 0
			T.sl_gas = 0
			T.temp = 293.15
			T.otemp = 293.15
			T.ttemp = 293.15
*/

/client/proc/toggle_view_range()
	set category = "Admin.Game"
	set name = "Change View Range"
	set desc = "switches between 1x and custom views"

	if(!check_rights_for(src, R_HOLDER))
		return

	var/view = src.view
	if(view == world.view)
		view = tgui_input_list(usr, "Select view range:", "FUCK YE", list(1,2,3,4,5,6,7,8,9,10,11,12,13,14,128))
	else
		view = world.view
	mob.set_viewsize(view)

	log_admin("[key_name(usr)] changed their view range to [view].")
	message_admins(span_blue("[key_name_admin(usr)] changed their view range to [view]."), 1)

	feedback_add_details("admin_verb","CVRA") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/client/proc/admin_call_shuttle()
	set category = "Admin.Events"
	set name = "Call Shuttle"

	if ((!( ticker ) || !emergency_shuttle.location()))
		return

	if(!check_rights(R_ADMIN))	return

	var/confirm = tgui_alert(src, "You sure?", "Confirm", list("Yes", "No"))
	if(confirm != "Yes") return

	var/choice
	if(ticker.mode.auto_recall_shuttle)
		choice = tgui_input_list(usr, "The shuttle will just return if you call it. Call anyway?", "Shuttle Call", list("Confirm", "Cancel"))
		if(choice == "Confirm")
			emergency_shuttle.auto_recall = 1	//enable auto-recall
		else
			return

	choice = tgui_input_list(usr, "Is this an emergency evacuation or a crew transfer?", "Shuttle Call", list("Emergency", "Crew Transfer"))
	if (choice == "Emergency")
		emergency_shuttle.call_evac()
	else
		emergency_shuttle.call_transfer()


	feedback_add_details("admin_verb","CSHUT") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!
	log_admin("[key_name(usr)] admin-called the emergency shuttle.")
	message_admins(span_blue("[key_name_admin(usr)] admin-called the emergency shuttle."), 1)
	return

/client/proc/admin_cancel_shuttle()
	set category = "Admin.Events"
	set name = "Cancel Shuttle"

	if(!check_rights(R_ADMIN|R_FUN))	return

	if(tgui_alert(src, "You sure?", "Confirm", list("Yes", "No")) != "Yes") return

	if(!ticker || !emergency_shuttle.can_recall())
		return

	emergency_shuttle.recall()
	feedback_add_details("admin_verb","CCSHUT") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!
	log_admin("[key_name(usr)] admin-recalled the emergency shuttle.")
	message_admins(span_blue("[key_name_admin(usr)] admin-recalled the emergency shuttle."), 1)

	return

/client/proc/admin_deny_shuttle()
	set category = "Admin.Events"
	set name = "Toggle Deny Shuttle"

	if (!ticker)
		return

	if(!check_rights(R_ADMIN))	return

	emergency_shuttle.deny_shuttle = !emergency_shuttle.deny_shuttle

	log_admin("[key_name(src)] has [emergency_shuttle.deny_shuttle ? "denied" : "allowed"] the shuttle to be called.")
	message_admins("[key_name_admin(usr)] has [emergency_shuttle.deny_shuttle ? "denied" : "allowed"] the shuttle to be called.")

/client/proc/cmd_admin_attack_log(mob/M as mob in GLOB.mob_list)
	set category = "Admin.Logs"
	set name = "Attack Log"

	to_chat(usr, span_red(span_bold("Attack Log for [mob]")))
	for(var/t in M.attack_log)
		to_chat(usr,t)
	feedback_add_details("admin_verb","ATTL") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!


/client/proc/everyone_random()
	set category = "Fun.Do Not"
	set name = "Make Everyone Random"
	set desc = "Make everyone have a random appearance. You can only use this before rounds!"

	if(!check_rights(R_FUN))	return

	if (ticker && ticker.mode)
		to_chat(usr, "Nope you can't do this, the game's already started. This only works before rounds!")
		return

	if(ticker.random_players)
		ticker.random_players = 0
		message_admins("Admin [key_name_admin(usr)] has disabled \"Everyone is Special\" mode.", 1)
		to_chat(usr, "Disabled.")
		return


	var/notifyplayers = tgui_alert(src, "Do you want to notify the players?", "Options", list("Yes", "No", "Cancel"))
	if(!notifyplayers || notifyplayers == "Cancel")
		return

	log_admin("Admin [key_name(src)] has forced the players to have random appearances.")
	message_admins("Admin [key_name_admin(usr)] has forced the players to have random appearances.", 1)

	if(notifyplayers == "Yes")
		to_world(span_boldannounce(span_blue("Admin [usr.key] has forced the players to have completely random identities!")))

	to_chat(usr, "<i>Remember: you can always disable the randomness by using the verb again, assuming the round hasn't started yet</i>.")

	ticker.random_players = 1
	feedback_add_details("admin_verb","MER") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!


/client/proc/toggle_random_events()
	set category = "Server.Game"
	set name = "Toggle random events on/off"
	set desc = "Toggles random events such as meteors, black holes, blob (but not space dust) on/off"

	if(!check_rights(R_SERVER))	return

	if(!CONFIG_GET(flag/allow_random_events))
		CONFIG_SET(flag/allow_random_events, TRUE)
		to_chat(usr, "Random events enabled")
		message_admins("Admin [key_name_admin(usr)] has enabled random events.", 1)
	else
		CONFIG_SET(flag/allow_random_events, FALSE)
		to_chat(usr, "Random events disabled")
		message_admins("Admin [key_name_admin(usr)] has disabled random events.", 1)
	feedback_add_details("admin_verb","TRE") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/client/proc/despawn_player(var/mob/M in GLOB.living_mob_list)
	set name = "Cryo Player"
	set category = "Admin.Game"
	set desc = "Removes a player from the round as if they'd cryo'd."
	set popup_menu = FALSE

	if(!check_rights(R_ADMIN|R_EVENT))
		return

	if(!M)
		return

	var/confirm = tgui_alert(usr, "Are you sure you want to cryo [M]?","Confirmation",list("No","Yes"))
	if(confirm != "Yes")
		return

	var/list/human_cryopods = list()
	var/list/robot_cryopods = list()

	for(var/obj/machinery/cryopod/CP in GLOB.machines)
		if(!CP.control_computer)
			continue //Broken pod w/o computer, move on.

		var/listname = "[CP.name] ([CP.x],[CP.y],[CP.z])"
		if(istype(CP,/obj/machinery/cryopod/robot))
			robot_cryopods[listname] = CP
		else
			human_cryopods[listname] = CP

	//Gotta log this up here before they get ghostized and lose their key or anything.
	log_and_message_admins("admin cryo'd [key_name(M)].", src)
	feedback_add_details("admin_verb","ACRYO") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

	if(ishuman(M))
		var/choice = tgui_input_list(usr,"Select a cryopod to use","Cryopod Choice", human_cryopods)
		var/obj/machinery/cryopod/CP = human_cryopods[choice]
		if(!CP)
			return
		M.ghostize()
		CP.despawn_occupant(M)
		return

	else if(issilicon(M))
		if(isAI(M))
			var/mob/living/silicon/ai/ai = M
			GLOB.empty_playable_ai_cores += new /obj/structure/AIcore/deactivated(ai.loc)
			GLOB.global_announcer.autosay("[ai] has been moved to intelligence storage.", "Artificial Intelligence Oversight")
			ai.clear_client()
			return
		else
			var/choice = tgui_input_list(usr,"Select a cryopod to use","Cryopod Choice", robot_cryopods)
			var/obj/machinery/cryopod/robot/CP = robot_cryopods[choice]
			if(!CP)
				return
			M.ghostize()
			CP.despawn_occupant(M)
			return

	else if(isliving(M))
		M.ghostize()
		qdel(M) //Bye

/client/proc/cmd_admin_droppod_spawn(var/object as text)
	set name = "Drop Pod Atom"
	set desc = "Spawn a new atom/movable in a drop pod where you are."
	set category = "Fun.Drop Pod"

	if(!check_rights(R_SPAWN))
		return

	var/list/types = typesof(/atom/movable)
	var/list/matches = new()

	for(var/path in types)
		if(findtext("[path]", object))
			matches += path

	if(!matches.len)
		return

	var/chosen
	if(matches.len==1)
		chosen = matches[1]
	else
		chosen = tgui_input_list(usr, "Select a movable type:", "Spawn in Drop Pod", matches)
		if(!chosen)
			return

	var/podtype = tgui_alert(src,"Destructive drop pods cause damage in a 3x3 and may break turfs. Polite drop pods lightly damage the turfs but won't break through.", "Drop Pod", list("Polite", "Destructive", "Cancel"))
	if(!podtype || podtype == "Cancel")
		return
	var/autoopen = tgui_alert(src,"Should the pod open automatically?", "Drop Pod", list("Yes", "No", "Cancel"))
	if(!autoopen || autoopen == "Cancel")
		return
	switch(podtype)
		if("Destructive")
			var/atom/movable/AM = new chosen(usr.loc)
			new /obj/structure/drop_pod(get_turf(usr), AM, autoopen == "Yes" ? TRUE : FALSE)
		if("Polite")
			var/atom/movable/AM = new chosen(usr.loc)
			new /obj/structure/drop_pod/polite(get_turf(usr), AM, autoopen == "Yes" ? TRUE : FALSE)

	feedback_add_details("admin_verb","DPA") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/client/proc/cmd_admin_droppod_deploy()
	set name = "Drop Pod Deploy"
	set desc = "Drop an existing mob where you are in a drop pod."
	set category = "Fun.Drop Pod"

	if(!check_rights(R_SPAWN))
		return

	var/mob/living/L = tgui_input_list(usr, "Select the mob to drop:", "Mob Picker", GLOB.living_mob_list)
	if(!L)
		return

	var/podtype = tgui_alert(src,"Destructive drop pods cause damage in a 3x3 and may break turfs. Polite drop pods lightly damage the turfs but won't break through.", "Drop Pod", list("Polite", "Destructive", "Cancel"))
	if(!podtype || podtype == "Cancel")
		return
	var/autoopen = tgui_alert(src,"Should the pod open automatically?", "Drop Pod", list("Yes", "No", "Cancel"))
	if(!autoopen || autoopen == "Cancel")
		return
	if(!L || QDELETED(L))
		return
	switch(podtype)
		if("Destructive")
			new /obj/structure/drop_pod(get_turf(usr), L, autoopen == "Yes" ? TRUE : FALSE)
		if("Polite")
			new /obj/structure/drop_pod/polite(get_turf(usr), L, autoopen == "Yes" ? TRUE : FALSE)

	feedback_add_details("admin_verb","DPD") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/client/proc/toggle_vantag_hud_global(mob/target as mob)
	set category = "Fun.Event Kit"
	set name = "Toggle Global Event HUD"
	set desc = "Give everyone the Event HUD."

	GLOB.global_vantag_hud = !GLOB.global_vantag_hud
	if(GLOB.global_vantag_hud)
		for(var/mob/living/L in GLOB.living_mob_list)
			if(L.ckey)
				L.vantag_hud = TRUE
				L.recalculate_vis()

	to_chat(src, span_warning("Global Event HUD has been turned [GLOB.global_vantag_hud ? "on" : "off"]."))
