/mob/observer
	var/mob/living/body_backup = null //add reforming
	low_priority = TRUE

/mob/observer/Destroy()
	if(body_backup)
		body_backup.moveToNullspace() //YEET
		qdel(body_backup)
		body_backup = null
	return ..()

// Persistence vars not included as we probably don't want losing limbs in the game mean losing limbs in real life. Definitely can't backfire.
/mob/observer/dead/verb/fake_enter_vr()
	set name = "Join virtual reality"
	set category = "Ghost.Join"
	set desc = "Log into NanoTrasen's local virtual reality server."

/* Temp removal while I figure out how to reduce the respawn time to 1 minute
	var/time_till_respawn = time_till_respawn()
	if(time_till_respawn == -1) // Special case, never allowed to respawn
		to_chat(usr, "<span class='warning'>Respawning is not allowed!</span>")
		return
	if(time_till_respawn) // Nonzero time to respawn
		to_chat(usr, "<span class='warning'>You can't do that yet! You died too recently. You need to wait another [round(time_till_respawn/10/60, 0.1)] minutes.</span>")
		return
*/
	var/datum/data/record/record_found
	record_found = find_general_record("name", client.prefs.real_name)
	// Found their record, they were spawned previously. Remind them corpses cannot play games.
	if(record_found)
		var/answer = tgui_alert(src,"You seem to have previously joined this round. If you are currently dead, you should not enter VR as this character. Would you still like to proceed?","Previously spawned",list("Yes","No"))
		if(answer != "Yes")
			return

	var/S = null
	var/list/vr_landmarks = list()
	for(var/obj/effect/landmark/virtual_reality/sloc in landmarks_list)
		vr_landmarks += sloc.name

	S = tgui_input_list(usr, "Please select a location to spawn your avatar at:", "Spawn location", vr_landmarks)
	if(!S)
		return 0
	for(var/obj/effect/landmark/virtual_reality/i in landmarks_list)
		if(i.name == S)
			S = i
			break

	var/mob/living/carbon/human/avatar = new(get_turf(S), "Virtual Reality Avatar")
	if(!avatar)
		to_chat(src, "Something went wrong and spawning failed.")
		return

	//Write the appearance and whatnot out to the character
	var/client/C = client
	C.prefs.copy_to(avatar) // Unfortunately the cascade of procs this calls will add the body to the transcore body DB. Don't see a simple way to prevent that.
	avatar.key = key
	for(var/lang in C.prefs.alternate_languages)
		var/datum/language/chosen_language = GLOB.all_languages[lang]
		if(chosen_language)
			if(is_lang_whitelisted(usr,chosen_language) || (avatar.species && (chosen_language.name in avatar.species.secondary_langs)))
				avatar.add_language(lang)

	avatar.regenerate_icons()
	avatar.update_transform()
	job_master.EquipRank(avatar,JOB_VR, 1, FALSE)  //CHOMPEdit
	add_verb(avatar,/mob/living/carbon/human/proc/fake_exit_vr)  //CHOMPEdit
	add_verb(avatar,/mob/living/carbon/human/proc/vr_transform_into_mob)  //CHOMPEdit
	add_verb(avatar,/mob/living/proc/set_size) //CHOMPEdit TGPanel // Introducing NeosVR
	avatar.virtual_reality_mob = TRUE
	log_and_message_admins("[key_name_admin(avatar)] joined virtual reality from the ghost menu.")

	var/newname = sanitize(tgui_input_text(avatar, "You are entering virtual reality. Your username is currently [src.name]. Would you like to change it to something else?", "Name change", null, MAX_NAME_LEN), MAX_NAME_LEN)
	if(newname)
		avatar.real_name = newname
