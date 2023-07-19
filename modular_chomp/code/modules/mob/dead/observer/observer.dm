/mob/observer
	var/mob/living/body_backup = null //add reforming
	low_priority = TRUE

/mob/observer/Destroy()
	if(body_backup)
		qdel(body_backup)
	..()

// Persistence vars not included as we probably don't want losing limbs in the game mean losing limbs in real life. Definitely can't backfire.
/mob/observer/dead/verb/fake_enter_vr()
	set name = "Join virtual reality"
	set category = "Ghost"
	set desc = "Log into NanoTrasen's local virtual reality server."

	var/time_till_respawn = time_till_respawn()
	if(time_till_respawn == -1) // Special case, never allowed to respawn
		to_chat(usr, "<span class='warning'>Respawning is not allowed!</span>")
		return
	if(time_till_respawn) // Nonzero time to respawn
		to_chat(usr, "<span class='warning'>You can't do that yet! You died too recently. You need to wait another [round(time_till_respawn/10/60, 0.1)] minutes.</span>")
		return

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
	avatar.species.equip_survival_gear(avatar)
	avatar.verbs += /mob/living/carbon/human/proc/fake_exit_vr
	avatar.verbs += /mob/living/carbon/human/proc/vr_transform_into_mob
	avatar.verbs |= /mob/living/proc/set_size // Introducing NeosVR
	avatar.virtual_reality_mob = TRUE
	log_and_message_admins("[key_name_admin(avatar)] joined virtual reality from the ghost menu.")

	var/newname = sanitize(tgui_input_text(avatar, "You are entering virtual reality. Your username is currently [src.name]. Would you like to change it to something else?", "Name change", null, MAX_NAME_LEN), MAX_NAME_LEN)
	if(newname)
		avatar.real_name = newname

/mob/living/carbon/human/proc/vr_transform_into_mob()
	set name = "Transform Into Creature"
	set category = "Abilities"
	set desc = "Become a different creature"

	var/tf = null
	var/k = tgui_input_list(usr, "Please select a creature:", "Mob list", vr_mob_tf_options)
	if(!k)
		return 0
	tf = vr_mob_tf_options[k]

	var/mob/living/new_form = transform_into_mob(tf, TRUE, TRUE)
	if(isliving(new_form)) // Sanity check
		new_form.verbs += /mob/living/proc/vr_revert_mob_tf
		new_form.virtual_reality_mob = TRUE

/mob/living/proc/vr_revert_mob_tf()
	set name = "Revert Transformation"
	set category = "Abilities"

	revert_mob_tf()

// Exiting VR but for ghosts
/mob/living/carbon/human/proc/fake_exit_vr()
	set name = "Log Out Of Virtual Reality"
	set category = "Abilities"

	if(tgui_alert(usr, "Would you like to log out of virtual reality?", "Log out?", list("Yes", "No")) == "Yes")
		release_vore_contents(TRUE)
		for(var/obj/item/I in src)
			drop_from_inventory(I)
		qdel(src)
//CHOMPedit end