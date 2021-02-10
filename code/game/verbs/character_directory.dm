/client/verb/show_character_directory()
	set name = "Character Directory"
	set category = "OOC"
	set desc = "Shows a listing of all active characters, along with their associated OOC notes, flavor text, and more."

	if(mob.next_move >= world.time)	//This is primarily to stop malicious users from trying to lag the server by spamming this verb
		return

<<<<<<< HEAD
	mob.next_move = world.time + 10
||||||| parent of 6c0c21e8a8... Merge pull request #9672 from KillianKirilenko/kk-misc4
/datum/character_directory/tgui_data(mob/user, datum/tgui/ui, datum/tgui_state/state)
	var/list/data = ..()
	
	data["personalVisibility"] = user?.client?.prefs?.show_in_directory
	data["personalTag"] = user?.client?.prefs?.directory_tag
=======
/datum/character_directory/tgui_data(mob/user, datum/tgui/ui, datum/tgui_state/state)
	var/list/data = ..()
	
	data["personalVisibility"] = user?.client?.prefs?.show_in_directory
	data["personalTag"] = user?.client?.prefs?.directory_tag
	data["personalErpTag"] = user?.client?.prefs?.directory_erptag
>>>>>>> 6c0c21e8a8... Merge pull request #9672 from KillianKirilenko/kk-misc4

	var/html = "<script> function togglesection(targetsection) { var targettext = document.getElementById(targetsection); if (targettext.style.display === 'none') { targettext.style.display = ''; } else { targettext.style.display = 'none'; } } </script>"

	var/curID = 0
	for(var/client/C in GLOB.clients)
		if(C.prefs && !C.prefs.show_in_directory)
			continue
<<<<<<< HEAD
||||||| parent of 6c0c21e8a8... Merge pull request #9672 from KillianKirilenko/kk-misc4
		
		// These are the three vars we're trying to find
		// The approach differs based on the mob the client is controlling
		var/name = null
		var/ooc_notes = null
		var/flavor_text = null
		var/tag = C.prefs.directory_tag
		var/character_ad = C.prefs.directory_ad

=======
		
		// These are the three vars we're trying to find
		// The approach differs based on the mob the client is controlling
		var/name = null
		var/ooc_notes = null
		var/flavor_text = null
		var/tag = C.prefs.directory_tag
		var/erptag = C.prefs.directory_erptag
		var/character_ad = C.prefs.directory_ad

>>>>>>> 6c0c21e8a8... Merge pull request #9672 from KillianKirilenko/kk-misc4
		if(ishuman(C.mob))
			var/mob/living/carbon/human/H = C.mob
			if(data_core && data_core.general)
				if(!find_general_record("name", H.real_name))
					if(!find_record("name", H.real_name, data_core.hidden_general))
						continue
			curID++
			html += "<div class='block'>"
			html += "<h3 class='uiContent highlight' style='font-size:16px'>[H.real_name]</h3><br>"
			if(H.flavor_texts["general"])
				html += "<a onclick='togglesection(\"[ckey(H.real_name)] [curID] flavor\")'>Flavor text</a>"
				html += "<p class='uiContent' style='display:none' id='[ckey(H.real_name)] [curID] flavor'>[H.flavor_texts["general"]]</p>"
			if(H.ooc_notes)
				html += "<a onclick='togglesection(\"[ckey(H.real_name)] [curID] ooc\")'>OOC notes</a>"
				html += "<p class='uiContent' style='display:none' id='[ckey(H.real_name)] [curID] ooc'>[H.ooc_notes]</p>"
			html += "</div>"
		if(isAI(C.mob))
			var/mob/living/silicon/ai/A = C.mob
			curID++
			html += "<div class='block'>"
			html += "<h3 class='uiContent highlight' style='font-size:16px'>[A.name] (Artificial Intelligence)</h3><br>"
			if(A.ooc_notes)
				html += "<a onclick='togglesection(\"[ckey(A.name)] [curID] ooc\")'>OOC notes</a>"
				html += "<p class='uiContent' style='display:none' id='[ckey(A.name)] [curID] ooc'>[A.ooc_notes]</p>"
			html += "</div>"
		if(isrobot(C.mob))
			var/mob/living/silicon/robot/R = C.mob
			if(R.scrambledcodes || (R.module && R.module.hide_on_manifest))
				continue
<<<<<<< HEAD
			curID++
			html += "<div class='block'>"
			html += "<h3 class='uiContent highlight' style='font-size:16px'>[R.name] ([R.modtype] [R.braintype])</h3><br>"
			if(R.flavor_text)
				html += "<a onclick='togglesection(\"[ckey(R.name)] [curID] flavor\")'>Flavor text</a>"
				html += "<p class='uiContent' style='display:none' id='[ckey(R.name)] [curID] flavor'>[R.flavor_text]</p>"
			if(R.ooc_notes)
				html += "<a onclick='togglesection(\"[ckey(R.name)] [curID] ooc\")'>OOC notes</a>"
				html += "<p class='uiContent' style='display:none' id='[ckey(R.name)] [curID] ooc'>[R.ooc_notes]</p>"
			html += "</div>"
	if(!curID)
		html += "<p class='uiContent'>404: Station not found</p>"

	var/datum/browser/popup = new(mob, "chardir", "Character Directory", 640, 480)
	popup.set_content(html)
	popup.open()
||||||| parent of 6c0c21e8a8... Merge pull request #9672 from KillianKirilenko/kk-misc4
			name = "[R.name] ([R.modtype] [R.braintype])"
			ooc_notes = R.ooc_notes
			flavor_text = R.flavor_text

		// It's okay if we fail to find OOC notes and flavor text
		// But if we can't find the name, they must be using a non-compatible mob type currently.
		if(!name)
			continue
		
		directory_mobs.Add(list(list(
			"name" = name,
			"ooc_notes" = ooc_notes,
			"tag" = tag,
			"character_ad" = character_ad,
			"flavor_text" = flavor_text,
		)))

	data["directory"] = directory_mobs

	return data


/datum/character_directory/tgui_act(action, list/params, datum/tgui/ui, datum/tgui_state/state)
	. = ..()
	if(.)
		return

	switch(action)
		if("refresh")
			// This is primarily to stop malicious users from trying to lag the server by spamming this verb
			if(!usr.checkMoveCooldown())
				to_chat(usr, "<span class='warning'>Don't spam character directory refresh.</span>")
				return
			usr.setMoveCooldown(10)
			update_tgui_static_data(usr, ui)
			return TRUE
		if("setTag")
			var/list/new_tag = input(usr, "Pick a new tag for the character directory", "Character Tag", usr?.client?.prefs?.directory_tag) as null|anything in GLOB.char_directory_tags
			if(!new_tag)
				return
			usr?.client?.prefs?.directory_tag = new_tag
			return TRUE
		if("setVisible")
			usr?.client?.prefs?.show_in_directory = !usr?.client?.prefs?.show_in_directory
			to_chat(usr, "<span class='notice'>You are now [usr.client.prefs.show_in_directory ? "shown" : "not shown"] in the directory.</span>")
			return TRUE
		if("editAd")
			if(!usr?.client?.prefs)
				return

			var/current_ad = usr.client.prefs.directory_ad
			var/new_ad = sanitize(input(usr, "Change your character ad", "Character Ad", current_ad) as message|null, extra = 0)
			if(isnull(new_ad))
				return
			usr.client.prefs.directory_ad = new_ad
			return TRUE
=======
			name = "[R.name] ([R.modtype] [R.braintype])"
			ooc_notes = R.ooc_notes
			flavor_text = R.flavor_text

		// It's okay if we fail to find OOC notes and flavor text
		// But if we can't find the name, they must be using a non-compatible mob type currently.
		if(!name)
			continue
		
		directory_mobs.Add(list(list(
			"name" = name,
			"ooc_notes" = ooc_notes,
			"tag" = tag,
			"erptag" = erptag,
			"character_ad" = character_ad,
			"flavor_text" = flavor_text,
		)))

	data["directory"] = directory_mobs

	return data


/datum/character_directory/tgui_act(action, list/params, datum/tgui/ui, datum/tgui_state/state)
	. = ..()
	if(.)
		return

	switch(action)
		if("refresh")
			// This is primarily to stop malicious users from trying to lag the server by spamming this verb
			if(!usr.checkMoveCooldown())
				to_chat(usr, "<span class='warning'>Don't spam character directory refresh.</span>")
				return
			usr.setMoveCooldown(10)
			update_tgui_static_data(usr, ui)
			return TRUE
		if("setTag")
			var/list/new_tag = input(usr, "Pick a new Vore tag for the character directory", "Character Tag", usr?.client?.prefs?.directory_tag) as null|anything in GLOB.char_directory_tags
			if(!new_tag)
				return
			usr?.client?.prefs?.directory_tag = new_tag
			return TRUE
		if("setErpTag")
			var/list/new_erptag = input(usr, "Pick a new ERP tag for the character directory", "Character ERP Tag", usr?.client?.prefs?.directory_erptag) as null|anything in GLOB.char_directory_erptags
			if(!new_erptag)
				return
			usr?.client?.prefs?.directory_erptag = new_erptag
			return TRUE
		if("setVisible")
			usr?.client?.prefs?.show_in_directory = !usr?.client?.prefs?.show_in_directory
			to_chat(usr, "<span class='notice'>You are now [usr.client.prefs.show_in_directory ? "shown" : "not shown"] in the directory.</span>")
			return TRUE
		if("editAd")
			if(!usr?.client?.prefs)
				return

			var/current_ad = usr.client.prefs.directory_ad
			var/new_ad = sanitize(input(usr, "Change your character ad", "Character Ad", current_ad) as message|null, extra = 0)
			if(isnull(new_ad))
				return
			usr.client.prefs.directory_ad = new_ad
			return TRUE
>>>>>>> 6c0c21e8a8... Merge pull request #9672 from KillianKirilenko/kk-misc4
