/datum/sprite_accessory/tail/taur
    var/vore_tail_sprite_variant = ""
    var/belly_variant_when_loaf = FALSE

/datum/sprite_accessory/tail/taur/wolf
	vore_tail_sprite_variant = "N"

/datum/sprite_accessory/tail/taur/ch/longvirus
	name = "Long Virus (Taur)"
	icon_state = "longvirus_s"
	extra_overlay = "longvirus_markings"
	icon_sprite_tag = "virus"
	//suit_sprites = 'icons/mob/taursuits_noodle.dmi' Aye, I've gotta sprite that shit.´

/datum/sprite_accessory/tail/taur/ch/fox
	name = "Fox (Taur, 3-color)"
	icon_state = "fox"
	extra_overlay = "fox_markings"
	extra_overlay2 = "fox_markings2"

/datum/sprite_accessory/tail/taur/ch/sectdrone
	name = "Sect Drone (Taur)"
	icon_state = "sectdrone"
	extra_overlay = "sectdrone_markings"
	can_loaf = TRUE
	icon_loaf = 'icons/mob/vore/taurs_ch_loaf.dmi'
	taur_belly_icon = 'icons/mob/vore/Taur_Bellies_ch.dmi'
	vore_tail_sprite_variant = "SectDrone"
	belly_variant_when_loaf = TRUE
	loaf_offset = 3

	msg_owner_disarm_run = "You quickly push %prey to the ground with your leg!"
	msg_prey_disarm_run = "%owner pushes you down to the ground with their leg!"

	msg_owner_disarm_walk = "You firmly push your leg down on %prey, painfully but harmlessly pinning them to the ground!"
	msg_prey_disarm_walk = "%owner firmly pushes their leg down on you, quite painfully but harmlessly pinning you to the ground!"

	msg_owner_harm_walk = "You methodically place your leg down upon %prey's body, slowly applying pressure, crushing them against the floor!"
	msg_prey_harm_walk = "%owner methodically places their leg upon your body, slowly applying pressure, crushing you against the floor!"

	msg_owner_grab_success = "You pin %prey down on the ground with your front leg before using your other leg to pick them up, trapping them between two of your front legs!"
	msg_prey_grab_success = "%owner pins you down on the ground with their front leg before using their other leg to pick you up, trapping you between two of their front legs!"

	msg_owner_grab_fail = "You step down onto %prey, squishing them and forcing them down to the ground!"
	msg_prey_grab_fail = "%owner steps down and squishes you with their leg, forcing you down to the ground!"

/datum/sprite_accessory/tail/taur/ch/fatsectdrone
	name = "Fat Sect Drone (Taur)"
	icon_state = "fatsectdrone"
	extra_overlay = "fatsectdrone_markings"

/obj/item/weapon/pen/debughelper
	name = "debug pen"

/obj/item/weapon/pen/debugpen/attack_self(var/mob/user)
	if (user.client)
		var/mob/living/pred = user.client.spawn_character_debug()
		if (istype(pred))
			inbelly_spawn_debug(user.client, pred, FALSE)


/client/proc/spawn_character_debug()
	var/client/picked_client = src
	if(!istype(picked_client))
		return

	//I frontload all the questions so we don't have a half-done process while you're reading.
	var/location = "Right Here"
	if(location == "Cancel" || !location)
		return

	var/announce = "No"
	if(announce == "Cancel")
		return
	else if(announce == "Yes") //Too bad buttons can't just have 1/0 values and different display strings
		announce = 1
	else
		announce = 0

	var/inhabit = "No"
	if(inhabit == "Cancel")
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
		var/samejob = "Yes"
		if(samejob == "Yes")
			charjob = record_found.fields["real_rank"]
		else if(samejob == USELESS_JOB) //VOREStation Edit - Visitor not Assistant
			charjob = USELESS_JOB //VOREStation Edit - Visitor not Assistant
	else
		records = "No"
		if(records == "Cancel")
			return
		if(records == "Yes")
			records = 1
		else
			records = 0

	//Well you're not reloading their job or they never had one.
	if(!charjob)
		var/pickjob = "-No Job-"
		if(!pickjob)
			return
		if(pickjob != "-No Job-")
			charjob = pickjob

	//If you've picked a job by now, you can equip them.
	var/equipment
	if(charjob)
		equipment = "No"
		if(equipment == "Cancel")
			return
		else if(equipment == "Yes")
			equipment = 1
		else
			equipment = 0

	//For logging later
	var/admin = key_name_admin(src)
	var/player_key = picked_client.key
	//VOREStation Add - Needed for persistence
	var/picked_ckey = picked_client.ckey
	var/picked_slot = picked_client.prefs.default_slot
	//VOREStation Add End

	var/mob/living/carbon/human/new_character
	var/spawnloc
	var/showy

	//Where did you want to spawn them?
	switch(location)
		if("Right Here") //Spawn them on your turf
			spawnloc = get_turf(src.mob)
			showy = "No"
			if(showy == "Cancel")
				return
			if(showy == "Drop Pod")
				showy = tgui_alert(src,"Destructive drop pods cause damage in a 3x3 and may break turfs. Polite drop pods lightly damage the turfs but won't break through.", "Drop Pod", list("Polite", "Destructive", "Cancel")) // reusing var
				if(showy == "Cancel")
					return

		if("Arrivals") //Spawn them at a latejoin spawnpoint
			spawnloc = pick(latejoin)

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

	//Write the appearance and whatnot out to the character
	picked_client.prefs.copy_to(new_character)
	if(new_character.dna)
		new_character.dna.ResetUIFrom(new_character)
		new_character.sync_organ_dna()
	if(inhabit)
		new_character.key = player_key
		//Were they any particular special role? If so, copy.
		if(new_character.mind)
			var/datum/antagonist/antag_data = get_antag_data(new_character.mind.special_role)
			if(antag_data)
				antag_data.add_antagonist(new_character.mind)
				antag_data.place_mob(new_character)

	//VOREStation Add - Required for persistence
	if(new_character.mind)
		new_character.mind.loaded_from_ckey = picked_ckey
		new_character.mind.loaded_from_slot = picked_slot
	//VOREStation Add End

	for(var/lang in picked_client.prefs.alternate_languages)
		var/datum/language/chosen_language = GLOB.all_languages[lang]
		if(chosen_language)
			if(is_lang_whitelisted(src,chosen_language) || (new_character.species && (chosen_language.name in new_character.species.secondary_langs)))
				new_character.add_language(lang)

	//If desired, apply equipment.
	if(equipment)
		if(charjob)
			job_master.EquipRank(new_character, charjob, 1, announce)
			if(new_character.mind)
				new_character.mind.assigned_role = charjob
				new_character.mind.role_alt_title = job_master.GetPlayerAltTitle(new_character, charjob)
		equip_custom_items(new_character)	//CHOMPEdit readded to enable custom_item.txt

	//If desired, add records.
	if(records)
		data_core.manifest_inject(new_character)

	//A redraw for good measure
	new_character.regenerate_icons()

	new_character.update_transform() //VOREStation Edit

	//If we're announcing their arrival
	if(announce)
		AnnounceArrival(new_character, new_character.mind.assigned_role, "Common", new_character.z)

	log_admin("[admin] has spawned [player_key]'s character [new_character.real_name].")
	message_admins("[admin] has spawned [player_key]'s character [new_character.real_name].", 1)



	feedback_add_details("admin_verb","RSPCH") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

	// Drop pods
	if(showy == "Polite")
		var/turf/T = get_turf(new_character)
		new /obj/structure/drop_pod/polite(T, new_character)
		to_chat(new_character, "Please wait for your arrival.")
	else if(showy == "Destructive")
		var/turf/T = get_turf(new_character)
		new /obj/structure/drop_pod(T, new_character)
		to_chat(new_character, "Please wait for your arrival.")
	else
		to_chat(new_character, "You have been fully spawned. Enjoy the game.")

	return new_character


/proc/inbelly_spawn_debug(client/prey, mob/living/pred, var/absorbed = FALSE)
	var/obj/belly/target_belly = pick(pred.vore_organs)
	// All this is basically admin late spawn-in, but skipping all parts related to records and equipment and with predteremined location
	var/player_key = prey.key
	var/picked_ckey = prey.ckey
	var/picked_slot = prey.prefs.default_slot
	var/mob/living/carbon/human/new_character

	new_character = new(null)		// Spawn them in nullspace first. Can't have "Defaultname Defaultnameson slides into your Stomach".

	if(!new_character)
		return

	prey.prefs.copy_to(new_character)
	if(new_character.dna)
		new_character.dna.ResetUIFrom(new_character)
		new_character.sync_organ_dna()
	if(new_character.mind)
		var/datum/antagonist/antag_data = get_antag_data(new_character.mind.special_role)
		if(antag_data)
			antag_data.add_antagonist(new_character.mind)
			antag_data.place_mob(new_character)

	for(var/lang in prey.prefs.alternate_languages)
		var/datum/language/chosen_language = GLOB.all_languages[lang]
		if(chosen_language)
			if(is_lang_whitelisted(prey,chosen_language) || (new_character.species && (chosen_language.name in new_character.species.secondary_langs)))
				new_character.add_language(lang)
	for(var/key in prey.prefs.language_custom_keys)
		if(prey.prefs.language_custom_keys[key])
			var/datum/language/keylang = GLOB.all_languages[prey.prefs.language_custom_keys[key]]
			if(keylang)
				new_character.language_keys[key] = keylang

	new_character.regenerate_icons()

	new_character.update_transform()

	new_character.forceMove(target_belly)		// Now that they're all setup and configured, send them to their destination.

	if(absorbed)
		target_belly.absorb_living(new_character)	// Glorp.

	log_admin("[prey] (as [new_character.real_name] has spawned inside one of [pred]'s bellies.")				// Log it. Avoid abuse.
	message_admins("[prey] (as [new_character.real_name] has spawned inside one of [pred]'s bellies.", 1)

	return new_character			// incase its ever needed