/obj/soulgem
	name = "Mind imprintation matrix"
	desc = "A mind storage and processing system capable of capturing and supporting human-level minds in a small VR space."
	var/mob/living/owner
	var/datum/own_mind
	var/obj/belly/linked_belly

	var/setting_flags = (NIF_SC_ALLOW_EARS|NIF_SC_ALLOW_EYES|NIF_SC_BACKUPS|NIF_SC_PROJECTING)
	var/mob/selected_soul = null
	var/list/brainmobs = list()
	var/inside_flavor = "A small completely white room with a couch, and a window to what seems to be the outside world. A small sign in the corner says 'Configure Me'."
	var/capture_message = "Your vision fades in a haze of static, before returning.\nAround you, you see...\n"
	var/transit_message = "Your surroundings change to..."
	var/release_message = "Release Message"
	var/transfer_message = "Transfer Message"
	var/delete_message = "Delete Message"

/obj/soulgem/vars_to_save()
	var/list/saving = list (
		"setting_flags",
		"inside_flavor",
		"capture_message",
		"transit_message",
		"release_message",
		"transfer_message",
		"delete_message",
		"linked_belly"
	)
	return ..() + saving

/obj/soulgem/Initialize()
	. = ..()
	if(ismob(loc))
		owner = loc

/obj/soulgem/deserialize(list/data)
	. = ..()
	for(var/obj/belly in owner.vore_organs)
		if(belly.name == data["linked_belly"])
			update_linked_belly(belly, TRUE)
			return
	linked_belly = null

/obj/soulgem/proc/transfer_self(var/mob/target)
	QDEL_NULL(target.soulgem)
	owner.soulgem = null
	forceMove(target)
	owner = target
	target.soulgem = src

/obj/soulgem/Destroy()
	owner = null
	selected_soul = null
	own_mind = null
	QDEL_LIST_NULL(brainmobs)
	if(istype(linked_belly))
		UnregisterSignal(linked_belly, COMSIG_BELLY_UPDATE_VORE_FX)
		linked_belly = null
	..()

/obj/soulgem/proc/notify_holder(var/message)
	to_chat(owner, span_nif("<b>[name]</b> displays, \"<span class='notice nif'>[message]</span>\""))

	for(var/mob/living/carbon/brain/caught_soul/CS as anything in brainmobs)
		to_chat(CS, span_nif("<b>[name]</b> displays, \"<span class='notice nif'>[message]</span>\""))

/obj/soulgem/proc/use_speech(var/message, var/mob/living/sender, var/mob/eyeobj)
	var/sender_name = eyeobj ? eyeobj.name : sender.name

	//AR Projecting
	if(eyeobj)
		sender.eyeobj.visible_message("<span class='game say'><b>[sender_name]</b> says, \"[message]\"</span>")

	//Not AR Projecting
	else
		to_chat(owner, span_nif("<b>\[SC\] [sender_name]</b> speaks, \"[message]\""))
		for(var/mob/living/carbon/brain/caught_soul/CS as anything in brainmobs)
			to_chat(CS, span_nif("<b>\[SC\] [sender_name]</b> speaks, \"[message]\""))

	log_nsay(message, owner.real_name, sender)

/obj/soulgem/proc/use_emote(var/message, var/mob/living/sender, var/mob/eyeobj)
	var/sender_name = eyeobj ? eyeobj.name : sender.name

	//AR Projecting
	if(eyeobj)
		sender.eyeobj.visible_message("<span class='emote'>[sender_name] [message]</span>")

	//Not AR Projecting
	else
		to_chat(owner, span_nif("<b>[sender_name]</b> [message]"))
		for(var/mob/living/carbon/brain/caught_soul/CS as anything in brainmobs)
			to_chat(CS, span_nif("<b>[sender_name]</b> [message]"))

	log_nme(message, owner.real_name,sender)

/obj/soulgem/proc/update_linked_belly(var/obj/belly, var/skip_unreg = FALSE)
	if(!belly && linked_belly)
		UnregisterSignal(linked_belly, COMSIG_BELLY_UPDATE_VORE_FX)
		linked_belly = null
		return
	if(!isbelly(belly))
		return
	if(!linked_belly)
		linked_belly = belly
		RegisterSignal(linked_belly, COMSIG_BELLY_UPDATE_VORE_FX, PROC_REF(soulgem_vfx))
		return
	if(belly != linked_belly)
		if(!skip_unreg)
			UnregisterSignal(linked_belly, COMSIG_BELLY_UPDATE_VORE_FX)
		linked_belly = belly
		RegisterSignal(linked_belly, COMSIG_BELLY_UPDATE_VORE_FX, PROC_REF(soulgem_vfx))

/obj/soulgem/proc/soulgem_vfx(var/update, var/severity = 0)
	if(linked_belly)
		for(var/mob/living/L in brainmobs)
			if(flag_check(SOULGEM_SHOW_VORE_SFX))
				show_vore_fx(L, update, severity)
			else
				clear_vore_fx()

/obj/soulgem/proc/show_vore_fx(var/mob/living/L, var/update, var/severity = 0)
	if(!linked_belly || !flag_check(SOULGEM_SHOW_VORE_SFX))
		return
	if(!istype(L) || L.eyeobj)
		return
	linked_belly.vore_fx(L, update, severity)

/obj/soulgem/proc/clear_vore_fx(var/mob/M)
	M.clear_fullscreen("belly")

/obj/soulgem/proc/catch_mob(var/mob/M, var/custom_name)
	if(!(M.soulcatcher_pref_flags & SOULCATCHER_ALLOW_CAPTURE)) return
	if(!M.mind)	return
	if(isbrain(owner)) return
	//Create a new brain mob
	var/mob/living/carbon/brain/caught_soul/vore/brainmob = new(src)
	brainmob.gem = src
	brainmob.container = src
	brainmob.stat = 0
	brainmob.silent = FALSE
	dead_mob_list -= brainmob
	brainmob.add_language(LANGUAGE_GALCOM)
	brainmobs |= brainmob

	//Put the mind and player into the mob
	M.mind.transfer_to(brainmob)
	brainmob.name = custom_name ? custom_name : brainmob.mind.name
	brainmob.real_name = custom_name ? custom_name : brainmob.mind.name

	//If we caught our owner, special settings.
	if(M == owner)
		brainmob.ext_deaf = FALSE
		brainmob.ext_blind = FALSE
		brainmob.parent_mob = TRUE
		own_mind = brainmob.mind
		remove_verb(brainmob, /mob/proc/enter_soulcatcher) //No recursive self capturing...
		add_verb(brainmob, /mob/living/carbon/brain/caught_soul/vore/proc/transfer_self)
		add_verb(brainmob, /mob/living/carbon/brain/caught_soul/vore/proc/reenter_body)

	//If they have these values, apply them
	if(isliving(M))
		var/mob/living/L = M
		brainmob.dna = L.dna
		brainmob.ooc_notes = L.ooc_notes
		brainmob.ooc_notes_likes = L.ooc_notes_likes
		brainmob.ooc_notes_dislikes = L.ooc_notes_dislikes
		//CHOMPEdit Start
		brainmob.ooc_notes_favs = L.ooc_notes_favs
		brainmob.ooc_notes_maybes = L.ooc_notes_maybes
		brainmob.ooc_notes_style = L.ooc_notes_style
		//CHOMPEdit End
		brainmob.timeofhostdeath = L.timeofdeath
		if(ishuman(L))
			SStranscore.m_backup(brainmob.mind,0) //It does ONE, so medical will hear about it.

	//Else maybe they're a joining ghost
	else if(isobserver(M))
		brainmob.transient = TRUE
		qdel(M) //Bye ghost

	//Give them a flavortext message
	var/message = span_notice("[capture_message][inside_flavor]")

	to_chat(brainmob, message)

	//Reminder on how this works to host
	if(brainmobs.len == 1) //Only spam this on the first one
		to_chat(owner, span_notice("Your occupant's messages/actions can only be seen by you, and you can \
		send messages that only they can hear/see by using the NSay and NMe verbs (or the *nsay and *nme emotes)."))

	//Announce to host and other minds
	notify_holder("New mind loaded: [brainmob.name]")
	show_vore_fx(brainmob, TRUE)
	return TRUE

/obj/soulgem/proc/release_selected()
	release_mob(selected_soul)
	if(brainmobs.len > 1)
		selected_soul = brainmobs[1]
	else
		selected_soul = null

/obj/soulgem/proc/release_mobs()
	selected_soul = null
	if(!brainmobs.len) return
	for(var/mob/M in brainmobs)
		release_mob(M)

/obj/soulgem/proc/release_mob(var/mob/M)
	to_chat(M, span_notice("[release_message]"))
	brainmobs -= M
	M.ghostize(FALSE)
	qdel(M)

/obj/soulgem/proc/find_transfer_objects()
	var/list/valid_trasfer_objects = list(
		/obj/item/device/sleevemate,
		/obj/item/device/mmi
	)
	var/list/valid_objects = list()
	if(isrobot(owner))
		var/mob/living/silicon/robot/R = owner
		if(istype(R.module_active, /obj/item/device/sleevemate))
			valid_objects += R.module_active
	if(ishuman(owner))
		var/mob/living/carbon/human/H = owner
		if(is_type_in_list(H.get_left_hand(), valid_trasfer_objects))
			valid_objects += H.get_left_hand()
		if(is_type_in_list(H.get_right_hand(), valid_trasfer_objects))
			valid_objects += H.get_right_hand()
	for(var/obj/item/I in range(0, get_turf(owner)))
		if(is_type_in_list(I))
			valid_objects += I
	for(var/mob/M in range(1, get_turf(owner)))
		if(M == owner)
			continue
		if(!(M.soulcatcher_pref_flags & SOULCATCHER_ALLOW_TRANSFER))
			continue
		if(M.client && M.soulgem)
			valid_objects += M.soulgem
	if(!valid_objects.len)
		to_chat(owner, span_warning("No valid objects found!"))
		return
	return valid_objects

/obj/soulgem/proc/transfer_selected()
	if(!selected_soul) return
	if(!(selected_soul.soulcatcher_pref_flags & SOULCATCHER_ALLOW_TRANSFER)) return
	var/list/valid_objects = find_transfer_objects()
	if(!valid_objects || !valid_objects.len)
		return
	var/obj/target = tgui_input_list(owner, "Select where you want to store the mind into.", "Mind Transfer Target", valid_objects)
	if(istype(target, /obj/soulgem))
		var/obj/soulgem/gem = target
		if(!gem.owner)
			return
		if((tgui_alert(gem.owner, "Do you want to allow [owner] to transfer [selected_soul] to your soulcatcher?", "Allow Transfer", list("No", "Yes")) == "Yes"))
			if(!in_range(gem.owner, owner))
				return
			if(!(gem.owner.soulcatcher_pref_flags & SOULCATCHER_ALLOW_TRANSFER))
				return
			transfer_mob_soulcatcher(selected_soul, gem)
		return
	transfer_mob(selected_soul, target)

/obj/soulgem/proc/transfer_mob(var/mob/M, var/obj/target)
	if(!M || !target) return
	if(istype(target, /obj/item/device/sleevemate))
		var/obj/item/device/sleevemate/mate = target
		if(!mate.stored_mind)
			to_chat(owner, span_notice("You scan yourself to transfer the soul into the [target]!"))
			to_chat(M, span_notice("[transfer_message]"))
			mate.get_mind(M)
	else if(istype(M, /obj/item/device/mmi))
		var/obj/item/device/mmi/mm = target
		if(!mm.brainmob)
			to_chat(owner, span_notice("You transfer the soul into the [target]!"))
			to_chat(M, span_notice("[transfer_message]"))
			mm.transfer_identity(M)
	else
		return
	if(M.mind == own_mind)
		own_mind = null
	brainmobs -= M
	if(M == selected_soul)
		if(brainmobs.len > 1)
			selected_soul = brainmobs[1]
		else
			selected_soul = null
	qdel(M)

/obj/soulgem/proc/transfer_mob_soulcatcher(var/mob/living/carbon/brain/caught_soul/vore/M, var/obj/soulgem/gem)
	if(!istype(M) || !gem) return
	brainmobs -= M
	M.gem = gem
	M.container = gem
	gem.brainmobs += M

/obj/soulgem/proc/delete_selected()
	if(!selected_soul) return
	delete_mob(selected_soul)
	if(brainmobs.len > 1)
		selected_soul = brainmobs[1]
	else
		selected_soul = null

/obj/soulgem/proc/erase_mobs()
	if(!brainmobs.len) return
	for(var/mob/M in brainmobs)
		delete_mob(M)

/obj/soulgem/proc/delete_mob(var/mob/M)
	if(!(M.soulcatcher_pref_flags & SOULCATCHER_ALLOW_DELETION))
		release_mob(M)
		return
	if(!(M.soulcatcher_pref_flags & SOULCATCHER_ALLOW_DELETION_INSTANT))
		if(!(tgui_alert(M, "Do you really want to allow [owner] to delete you? On decline, you'll be ghosted.", "Allow Deletion", list("No", "Yes")) == "Yes"))
			release_mob(M)
			return
	to_chat(M, span_danger("[delete_message]"))
	brainmobs -= M
	var/mob/observer/dead/ghost = M.ghostize(FALSE)
	ghost.abandon_mob()
	qdel(M)

/obj/soulgem/proc/adjust_interior(var/new_flavor)
	new_flavor = sanitize(new_flavor, MAX_MESSAGE_LEN * 2)
	inside_flavor = new_flavor
	notify_holder("Updating environment...")
	for(var/mob/living/carbon/brain/caught_soul/vore/CS as anything in brainmobs)
		to_chat(CS, span_notice("[transit_message]") + "\n[inside_flavor]")

/obj/soulgem/proc/return_to_body(var/datum/mind)
	if(own_mind != mind)
		to_chat(src, span_warning("You aren't in your own soulcatcher!"))
		return
	var/mob/self = null
	for(var/mob/mob in brainmobs)
		if(mob.mind == mind)
			self = mob
			break
	if(!self)
		return
	self.mind.transfer_to(owner)
	own_mind = null
	qdel(self)

/obj/soulgem/proc/set_custom_message(var/message, var/target)
	message = sanitize(message, MAX_MESSAGE_LEN / 4)
	switch(target)
		if("capture")
			capture_message = message
		if("transit")
			transit_message = message
		if("release")
			release_message = message
		if("transfer")
			transfer_message = message
		if("delete")
			delete_message = message

/obj/soulgem/proc/rename(var/new_name)
	if(length(new_name) < 3 || length(new_name) > 60)
		to_chat(owner, span_warning("Your soulcatcher's name needs to be between 3 and 60 characters long!"))
		return
	new_name = sanitize(new_name, 60)
	name = new_name

/obj/soulgem/proc/toggle_setting(var/flag)
	setting_flags ^= flag
	if(flag & SOULGEM_SHOW_VORE_SFX)
		soulgem_vfx(TRUE)

// Checks a single flag, or an entire list if all elements in it are true
/obj/soulgem/proc/flag_check(var/flag, var/match_all = FALSE)
	if(match_all)
		return (setting_flags & flag) == flag
	return setting_flags & flag
