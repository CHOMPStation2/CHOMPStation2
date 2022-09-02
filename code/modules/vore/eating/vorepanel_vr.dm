//
// Vore management panel for players
//

#define BELLIES_MAX 40
#define BELLIES_NAME_MIN 2
#define BELLIES_NAME_MAX 40
#define BELLIES_DESC_MAX 4096
#define FLAVOR_MAX 400

/mob/living
	var/datum/vore_look/vorePanel

/mob/living/proc/insidePanel()
	set name = "Vore Panel"
	set category = "IC"

	if(!vorePanel)
		log_debug("[src] ([type], \ref[src]) didn't have a vorePanel and tried to use the verb.")
		vorePanel = new(src)

	vorePanel.tgui_interact(src)

/mob/living/proc/updateVRPanel() //Panel popup update call from belly events.
	if(vorePanel)
		SStgui.update_uis(vorePanel)

//
// Callback Handler for the Inside form
//
/datum/vore_look
	var/mob/living/host // Note, we do this in case we ever want to allow people to view others vore panels
	var/unsaved_changes = FALSE
	var/show_pictures = TRUE
	var/max_icon_content = 21 //CHOMPedit: Contents above this disable icon mode. 21 for nice 3 rows to fill the default panel window.

/datum/vore_look/New(mob/living/new_host)
	if(istype(new_host))
		host = new_host
	. = ..()

/datum/vore_look/Destroy()
	host = null
	. = ..()

/datum/vore_look/ui_assets(mob/user)
	. = ..()
	. += get_asset_datum(/datum/asset/spritesheet/vore)

/datum/vore_look/tgui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		update_preview_icon()	//CHOMPEdit
		give_client_previews(user.client) //CHOMPEdit
		ui = new(user, src, "VorePanel", "Vore Panel")
		ui.open()
		ui.set_autoupdate(FALSE)

// This looks weird, but all tgui_host is used for is state checking
// So this allows us to use the self_state just fine.
/datum/vore_look/tgui_host(mob/user)
	return host

// Note, in order to allow others to look at others vore panels, this state would need
// to be modified.
/datum/vore_look/tgui_state(mob/user)
	return GLOB.tgui_vorepanel_state

/datum/vore_look/var/static/list/nom_icons
/datum/vore_look/proc/cached_nom_icon(atom/target)
	LAZYINITLIST(nom_icons)

	var/key = ""
	if(isobj(target))
		key = "[target.type]"
	else if(ismob(target))
		var/mob/M = target
		if(istype(M,/mob/living/simple_mob)) //CHOMPedit: not generating unique icons for every simplemob(number)
			var/mob/living/simple_mob/S = M
			key = "[S.icon_living]"
		else
			key = "\ref[target][M.real_name]"
	if(nom_icons[key])
		. = nom_icons[key]
	else
		. = icon2base64(getFlatIcon(target,defdir=SOUTH,no_anim=TRUE))
		nom_icons[key] = .


/datum/vore_look/tgui_data(mob/user)
	var/list/data = list()

	if(!host)
		return data

	data["unsaved_changes"] = unsaved_changes
	data["show_pictures"] = show_pictures

	var/atom/hostloc = host.loc
	var/list/inside = list()
	if(isbelly(hostloc))
		var/obj/belly/inside_belly = hostloc
		var/mob/living/pred = inside_belly.owner

		var/inside_desc = "No description."
		if(host.absorbed && inside_belly.absorbed_desc)
			inside_desc = inside_belly.absorbed_desc
		else if(inside_belly.desc)
			inside_desc = inside_belly.desc

		//I'd rather not copy-paste this code twice into the previous if-statement
		//Technically we could just format the text anyway, but IDK how demanding unnecessary text-replacements are
		if((host.absorbed && inside_belly.absorbed_desc) || (inside_belly.desc))
			var/formatted_desc
			formatted_desc = replacetext(inside_desc, "%belly", lowertext(inside_belly.name)) //replace with this belly's name
			formatted_desc = replacetext(formatted_desc, "%pred", pred) //replace with the pred of this belly
			formatted_desc = replacetext(formatted_desc, "%prey", host) //replace with whoever's reading this
			inside_desc = formatted_desc

		inside = list(
			"absorbed" = host.absorbed,
			"belly_name" = inside_belly.name,
			"belly_mode" = inside_belly.digest_mode,
			"desc" = inside_desc,
			"pred" = pred,
			"ref" = "\ref[inside_belly]",
		)

		var/list/inside_contents = list()
		for(var/atom/movable/O in inside_belly)
			if(O == host)
				continue

			var/list/info = list(
				"name" = "[O]",
				"absorbed" = FALSE,
				"stat" = 0,
				"ref" = "\ref[O]",
				"outside" = FALSE,
			)
			if(show_pictures) //CHOMPedit: disables icon mode
				if(inside_belly.contents.len <= max_icon_content)
					info["icon"] = cached_nom_icon(O)
				else
					show_pictures = !show_pictures
			if(isliving(O))
				var/mob/living/M = O
				info["stat"] = M.stat
				if(M.absorbed)
					info["absorbed"] = TRUE
			inside_contents.Add(list(info))
		inside["contents"] = inside_contents
	data["inside"] = inside

	var/list/our_bellies = list()
	for(var/obj/belly/B as anything in host.vore_organs)
		our_bellies.Add(list(list(
			"selected" = (B == host.vore_selected),
			"name" = B.name,
			"ref" = "\ref[B]",
			"digest_mode" = B.digest_mode,
			"contents" = LAZYLEN(B.contents),
		)))
	data["our_bellies"] = our_bellies

	var/list/selected_list = null
	if(host.vore_selected)
		var/obj/belly/selected = host.vore_selected
		selected_list = list(
			"belly_name" = selected.name,
			"is_wet" = selected.is_wet,
			"wet_loop" = selected.wet_loop,
			"mode" = selected.digest_mode,
			"item_mode" = selected.item_digest_mode,
			"verb" = selected.vore_verb,
			"release_verb" = selected.release_verb,
			"desc" = selected.desc,
			"absorbed_desc" = selected.absorbed_desc,
			"fancy" = selected.fancy_vore,
			"sound" = selected.vore_sound,
			"release_sound" = selected.release_sound,
			// "messages" // TODO
			"can_taste" = selected.can_taste,
			"egg_type" = selected.egg_type,
			"nutrition_percent" = selected.nutrition_percent,
			"digest_brute" = selected.digest_brute,
			"digest_burn" = selected.digest_burn,
			"digest_oxy" = selected.digest_oxy,
			"digest_tox" = selected.digest_tox,
			"digest_clone" = selected.digest_clone,
			"bulge_size" = selected.bulge_size,
			"save_digest_mode" = selected.save_digest_mode,
			"display_absorbed_examine" = selected.display_absorbed_examine,
			"shrink_grow_size" = selected.shrink_grow_size,
			"emote_time" = selected.emote_time,
			"emote_active" = selected.emote_active,
			"selective_preference" = selected.selective_preference,
			"nutrition_ex" = host.nutrition_message_visible,
			"weight_ex" = host.weight_message_visible,
			"belly_fullscreen" = selected.belly_fullscreen,
			"belly_fullscreen_color" = selected.belly_fullscreen_color,	//CHOMPEdit
			"mapRef" = map_name,	//CHOMPEdit
			"vorespawn_blacklist" = selected.vorespawn_blacklist, //CHOMP Addition: vorespawn blacklist
			//CHOMP add: vore sprite options
			"affects_voresprite" = selected.affects_vore_sprites,
			"absorbed_voresprite" = selected.count_absorbed_prey_for_sprite,
			"resist_animation" = selected.resist_triggers_animation,
			"voresprite_size_factor" = selected.size_factor_for_sprite,
			"belly_sprite_to_affect" = selected.belly_sprite_to_affect,
			"belly_sprite_option_shown" = LAZYLEN(host.vore_icon_bellies) > 1 ? TRUE : FALSE,
			"tail_option_shown" = istype(host, /mob/living/carbon/human),
			"tail_to_change_to" = selected.tail_to_change_to,
			"tail_colouration" = selected.tail_colouration,
			"tail_extra_overlay" = selected.tail_extra_overlay,
			"tail_extra_overlay2" = selected.tail_extra_overlay2
			//"marking_to_add" = selected.marking_to_add
			//CHOMPEdit end
		)

		var/list/addons = list()
		for(var/flag_name in selected.mode_flag_list)
			if(selected.mode_flags & selected.mode_flag_list[flag_name])
				addons.Add(flag_name)
		selected_list["addons"] = addons

		//CHOMPEdit voresprite flags
		var/list/vs_flags = list()
		for(var/flag_name in selected.vore_sprite_flag_list)
			if(selected.vore_sprite_flags & selected.vore_sprite_flag_list[flag_name])
				vs_flags.Add(flag_name)
		selected_list["vore_sprite_flags"] = vs_flags
		//CHOMPEdit END

		selected_list["egg_type"] = selected.egg_type
		selected_list["contaminates"] = selected.contaminates
		selected_list["contaminate_flavor"] = null
		selected_list["contaminate_color"] = null
		if(selected.contaminates)
			selected_list["contaminate_flavor"] = selected.contamination_flavor
			selected_list["contaminate_color"] = selected.contamination_color

		selected_list["escapable"] = selected.escapable
		selected_list["interacts"] = list()
		if(selected.escapable)
			selected_list["interacts"]["escapechance"] = selected.escapechance
			selected_list["interacts"]["escapetime"] = selected.escapetime
			selected_list["interacts"]["transferchance"] = selected.transferchance
			selected_list["interacts"]["transferlocation"] = selected.transferlocation
			selected_list["interacts"]["transferchance_secondary"] = selected.transferchance_secondary
			selected_list["interacts"]["transferlocation_secondary"] = selected.transferlocation_secondary
			selected_list["interacts"]["absorbchance"] = selected.absorbchance
			selected_list["interacts"]["digestchance"] = selected.digestchance

		selected_list["autotransfer_enabled"] = selected.autotransfer_enabled
		selected_list["autotransfer"] = list()
		if(selected.autotransfer_enabled)
			selected_list["autotransfer"]["autotransferchance"] = selected.autotransferchance
			selected_list["autotransfer"]["autotransferwait"] = selected.autotransferwait
			selected_list["autotransfer"]["autotransferlocation"] = selected.autotransferlocation
			selected_list["autotransfer"]["autotransfer_min_amount"] = selected.autotransfer_min_amount
			selected_list["autotransfer"]["autotransfer_max_amount"] = selected.autotransfer_max_amount

		selected_list["disable_hud"] = selected.disable_hud
		selected_list["possible_fullscreens"] = icon_states('icons/mob/screen_preview_vore_ch.dmi') //CHOMPedit

		var/list/selected_contents = list()
		for(var/O in selected)
			var/list/info = list(
				"name" = "[O]",
				"absorbed" = FALSE,
				"stat" = 0,
				"ref" = "\ref[O]",
				"outside" = TRUE,
			)
			if(show_pictures) //CHOMPedit: disables icon mode
				if(selected.contents.len <= max_icon_content)
					info["icon"] = cached_nom_icon(O)
				else
					show_pictures = !show_pictures
			if(isliving(O))
				var/mob/living/M = O
				info["stat"] = M.stat
				if(M.absorbed)
					info["absorbed"] = TRUE
			selected_contents.Add(list(info))
		selected_list["contents"] = selected_contents

		selected_list["show_liq"] = selected.show_liquids //CHOMPedit start: liquid belly options
		selected_list["liq_interacts"] = list()
		if(selected.show_liquids)
			selected_list["liq_interacts"]["liq_reagent_gen"] = selected.reagentbellymode
			selected_list["liq_interacts"]["liq_reagent_type"] = selected.reagent_chosen
			selected_list["liq_interacts"]["liq_reagent_name"] = selected.reagent_name
			selected_list["liq_interacts"]["liq_reagent_transfer_verb"] = selected.reagent_transfer_verb
			selected_list["liq_interacts"]["liq_reagent_nutri_rate"] = selected.gen_time
			selected_list["liq_interacts"]["liq_reagent_capacity"] = selected.custom_max_volume
			selected_list["liq_interacts"]["liq_sloshing"] = selected.vorefootsteps_sounds
			selected_list["liq_interacts"]["liq_reagent_addons"] = list()
			for(var/flag_name in selected.reagent_mode_flag_list)
				if(selected.reagent_mode_flags & selected.reagent_mode_flag_list[flag_name])
					var/list/selected_list_member = selected_list["liq_interacts"]["liq_reagent_addons"]
					ASSERT(islist(selected_list_member))
					selected_list_member.Add(flag_name)

		selected_list["show_liq_fullness"] = selected.show_fullness_messages
		selected_list["liq_messages"] = list()
		if(selected.show_fullness_messages)
			selected_list["liq_messages"]["liq_msg_toggle1"] = selected.liquid_fullness1_messages
			selected_list["liq_messages"]["liq_msg_toggle2"] = selected.liquid_fullness2_messages
			selected_list["liq_messages"]["liq_msg_toggle3"] = selected.liquid_fullness3_messages
			selected_list["liq_messages"]["liq_msg_toggle4"] = selected.liquid_fullness4_messages
			selected_list["liq_messages"]["liq_msg_toggle5"] = selected.liquid_fullness5_messages

			selected_list["liq_messages"]["liq_msg1"] = selected.liquid_fullness1_messages
			selected_list["liq_messages"]["liq_msg2"] = selected.liquid_fullness2_messages
			selected_list["liq_messages"]["liq_msg3"] = selected.liquid_fullness3_messages
			selected_list["liq_messages"]["liq_msg4"] = selected.liquid_fullness4_messages
			selected_list["liq_messages"]["liq_msg5"] = selected.liquid_fullness5_messages //CHOMPedit end

	data["selected"] = selected_list
	data["prefs"] = list(
		"digestable" = host.digestable,
		"devourable" = host.devourable,
		"resizable" = host.resizable,
		"feeding" = host.feeding,
		"absorbable" = host.absorbable,
		"digest_leave_remains" = host.digest_leave_remains,
		"allowmobvore" = host.allowmobvore,
		"permit_healbelly" = host.permit_healbelly,
		"show_vore_fx" = host.show_vore_fx,
		"can_be_drop_prey" = host.can_be_drop_prey,
		"can_be_drop_pred" = host.can_be_drop_pred,
		"latejoin_vore" = host.latejoin_vore, //CHOMPedit
		"latejoin_prey" = host.latejoin_prey, //CHOMPedit
		"allow_spontaneous_tf" = host.allow_spontaneous_tf,
		"step_mechanics_active" = host.step_mechanics_pref,
		"pickup_mechanics_active" = host.pickup_pref,
		"noisy" = host.noisy,
		//CHOMPedit start, liquid belly prefs
		"liq_rec" = host.receive_reagents,
		"liq_giv" = host.give_reagents,
		"autotransferable" = host.autotransferable,
		"noisy_full" = host.noisy_full, //Belching while full
		//CHOMPedit end
		"drop_vore" = host.drop_vore,
		"slip_vore" = host.slip_vore,
		"stumble_vore" = host.stumble_vore,
		"nutrition_message_visible" = host.nutrition_message_visible,
		"nutrition_messages" = host.nutrition_messages,
		"weight_message_visible" = host.weight_message_visible,
		"weight_messages" = host.weight_messages
	)

	return data

/datum/vore_look/tgui_act(action, params)
	if(..())
		return TRUE

	switch(action)
		if("show_pictures")
			show_pictures = !show_pictures
			return TRUE
		if("int_help")
			tgui_alert(usr, "These control how your belly responds to someone using 'resist' while inside you. The percent chance to trigger each is listed below, \
					and you can change them to whatever you see fit. Setting them to 0% will disable the possibility of that interaction. \
					These only function as long as interactions are turned on in general. Keep in mind, the 'belly mode' interactions (digest/absorb) \
					will affect all prey in that belly, if one resists and triggers digestion/absorption. If multiple trigger at the same time, \
					only the first in the order of 'Escape > Transfer > Absorb > Digest' will occur.","Interactions Help")
			return TRUE

		// Host is inside someone else, and is trying to interact with something else inside that person.
		if("pick_from_inside")
			return pick_from_inside(usr, params)

		// Host is trying to interact with something in host's belly.
		if("pick_from_outside")
			return pick_from_outside(usr, params)

		if("newbelly")
			if(host.vore_organs.len >= BELLIES_MAX)
				return FALSE

			var/new_name = html_encode(tgui_input_text(usr,"New belly's name:","New Belly"))

			var/failure_msg
			if(length(new_name) > BELLIES_NAME_MAX || length(new_name) < BELLIES_NAME_MIN)
				failure_msg = "Entered belly name length invalid (must be longer than [BELLIES_NAME_MIN], no more than than [BELLIES_NAME_MAX])."
			// else if(whatever) //Next test here.
			else
				for(var/obj/belly/B as anything in host.vore_organs)
					if(lowertext(new_name) == lowertext(B.name))
						failure_msg = "No duplicate belly names, please."
						break

			if(failure_msg) //Something went wrong.
				tgui_alert_async(usr, failure_msg, "Error!")
				return TRUE

			var/obj/belly/NB = new(host)
			NB.name = new_name
			host.vore_selected = NB
			unsaved_changes = TRUE
			return TRUE

		if("bellypick")
			host.vore_selected = locate(params["bellypick"])
			return TRUE
		if("move_belly")
			var/dir = text2num(params["dir"])
			if(LAZYLEN(host.vore_organs) <= 1)
				to_chat(usr, "<span class='warning'>You can't sort bellies with only one belly to sort...</span>")
				return TRUE

			var/current_index = host.vore_organs.Find(host.vore_selected)
			if(current_index)
				var/new_index = clamp(current_index + dir, 1, LAZYLEN(host.vore_organs))
				host.vore_organs.Swap(current_index, new_index)
				unsaved_changes = TRUE
			return TRUE

		if("set_attribute")
			return set_attr(usr, params)

		if("saveprefs")
			if(host.real_name != host.client.prefs.real_name || (!ishuman(host) && !issilicon(host)))
				var/choice = tgui_alert(usr, "Warning: Saving your vore panel while playing what is very-likely not your normal character will overwrite whatever character you have loaded in character setup. Maybe this is your 'playing a simple mob' slot, though. Are you SURE you want to overwrite your current slot with these vore bellies?", "WARNING!", list("No, abort!", "Yes, save."))
				if(choice != "Yes, save.")
					return TRUE
			if(!host.save_vore_prefs())
				tgui_alert_async(usr, "ERROR: Chomp-specific preferences failed to save!","Error")
			else
				to_chat(usr, "<span class='notice'>Chomp-specific preferences saved!</span>")
				unsaved_changes = FALSE
			return TRUE
		if("reloadprefs")
			var/alert = tgui_alert(usr, "Are you sure you want to reload character slot preferences? This will remove your current vore organs and eject their contents.","Confirmation",list("Reload","Cancel"))
			if(alert != "Reload")
				return FALSE
			if(!host.apply_vore_prefs())
				tgui_alert_async(usr, "ERROR: Chomp-specific preferences failed to apply!","Error")
			else
				to_chat(usr,"<span class='notice'>Chomp-specific preferences applied from active slot!</span>")
				unsaved_changes = FALSE
			return TRUE
		//CHOMPEdit - "Belly HTML Export Earlyport"
		if("exportpanel")
			var/mob/living/user = usr
			if(!user)
				to_chat(usr,"<span class='notice'>Mob undefined: [user]</span>")
				return FALSE

			var/datum/vore_look/export_panel/exportPanel
			if(!exportPanel)
				exportPanel = new(usr)

			if(!exportPanel)
				to_chat(user,"<span class='notice'>Export panel undefined: [exportPanel]</span>")
				return FALSE

			exportPanel.open_export_panel(user)

			return TRUE
		//CHOMPEdit End
		if("setflavor")
			var/new_flavor = html_encode(tgui_input_text(usr,"What your character tastes like (400ch limit). This text will be printed to the pred after 'X tastes of...' so just put something like 'strawberries and cream':","Character Flavor",host.vore_taste))
			if(!new_flavor)
				return FALSE

			new_flavor = readd_quotes(new_flavor)
			if(length(new_flavor) > FLAVOR_MAX)
				tgui_alert_async(usr, "Entered flavor/taste text too long. [FLAVOR_MAX] character limit.","Error!")
				return FALSE
			host.vore_taste = new_flavor
			unsaved_changes = TRUE
			return TRUE
		if("setsmell")
			var/new_smell = html_encode(tgui_input_text(usr,"What your character smells like (400ch limit). This text will be printed to the pred after 'X smells of...' so just put something like 'strawberries and cream':","Character Smell",host.vore_smell))
			if(!new_smell)
				return FALSE

			new_smell = readd_quotes(new_smell)
			if(length(new_smell) > FLAVOR_MAX)
				tgui_alert_async(usr, "Entered perfume/smell text too long. [FLAVOR_MAX] character limit.","Error!")
				return FALSE
			host.vore_smell = new_smell
			unsaved_changes = TRUE
			return TRUE
		if("toggle_dropnom_pred")
			host.can_be_drop_pred = !host.can_be_drop_pred
			if(host.client.prefs_vr)
				host.client.prefs_vr.can_be_drop_pred = host.can_be_drop_pred
			unsaved_changes = TRUE
			return TRUE
		if("toggle_dropnom_prey")
			host.can_be_drop_prey = !host.can_be_drop_prey
			if(host.client.prefs_vr)
				host.client.prefs_vr.can_be_drop_prey = host.can_be_drop_prey
			unsaved_changes = TRUE
			return TRUE
		if("toggle_latejoin_vore")
			host.latejoin_vore = !host.latejoin_vore
			if(host.client.prefs_vr)
				host.client.prefs_vr.latejoin_vore = host.latejoin_vore
			unsaved_changes = TRUE
			return TRUE
		if("toggle_latejoin_prey")
			host.latejoin_prey = !host.latejoin_prey
			if(host.client.prefs_vr)
				host.client.prefs_vr.latejoin_prey = host.latejoin_prey
			unsaved_changes = TRUE
			return TRUE
		if("toggle_allow_spontaneous_tf")
			host.allow_spontaneous_tf = !host.allow_spontaneous_tf
			if(host.client.prefs_vr)
				host.client.prefs_vr.allow_spontaneous_tf = host.allow_spontaneous_tf
			unsaved_changes = TRUE
			return TRUE
		if("toggle_digest")
			host.digestable = !host.digestable
			if(host.client.prefs_vr)
				host.client.prefs_vr.digestable = host.digestable
			unsaved_changes = TRUE
			return TRUE
		if("toggle_devour")
			host.devourable = !host.devourable
			if(host.client.prefs_vr)
				host.client.prefs_vr.devourable = host.devourable
			unsaved_changes = TRUE
			return TRUE
		if("toggle_resize")
			host.resizable = !host.resizable
			if(host.client.prefs_vr)
				host.client.prefs_vr.resizable = host.resizable
			unsaved_changes = TRUE
			return TRUE
		if("toggle_feed")
			host.feeding = !host.feeding
			if(host.client.prefs_vr)
				host.client.prefs_vr.feeding = host.feeding
			unsaved_changes = TRUE
			return TRUE
		if("toggle_absorbable")
			host.absorbable = !host.absorbable
			if(host.client.prefs_vr)
				host.client.prefs_vr.absorbable = host.absorbable
			unsaved_changes = TRUE
			return TRUE
		if("toggle_leaveremains")
			host.digest_leave_remains = !host.digest_leave_remains
			if(host.client.prefs_vr)
				host.client.prefs_vr.digest_leave_remains = host.digest_leave_remains
			unsaved_changes = TRUE
			return TRUE
		if("toggle_mobvore")
			host.allowmobvore = !host.allowmobvore
			if(host.client.prefs_vr)
				host.client.prefs_vr.allowmobvore = host.allowmobvore
			unsaved_changes = TRUE
			return TRUE
		if("toggle_steppref")
			host.step_mechanics_pref = !host.step_mechanics_pref
			if(host.client.prefs_vr)
				host.client.prefs_vr.step_mechanics_pref = host.step_mechanics_pref
			unsaved_changes = TRUE
			return TRUE
		if("toggle_pickuppref")
			host.pickup_pref = !host.pickup_pref
			if(host.client.prefs_vr)
				host.client.prefs_vr.pickup_pref = host.pickup_pref
			unsaved_changes = TRUE
			return TRUE
		if("toggle_healbelly")
			host.permit_healbelly = !host.permit_healbelly
			if(host.client.prefs_vr)
				host.client.prefs_vr.permit_healbelly = host.permit_healbelly
			unsaved_changes = TRUE
			return TRUE
		if("toggle_fx")
			host.show_vore_fx = !host.show_vore_fx
			if(host.client.prefs_vr)
				host.client.prefs_vr.show_vore_fx = host.show_vore_fx
			if(!host.show_vore_fx)
				host.clear_fullscreen("belly")
				if(!host.hud_used.hud_shown)
					host.toggle_hud_vis()
			unsaved_changes = TRUE
			return TRUE
		if("toggle_noisy")
			host.noisy = !host.noisy
			unsaved_changes = TRUE
			return TRUE
		//CHOMPedit start: liquid belly code
		if("liq_set_attribute")
			return liq_set_attr(usr, params)
		if("liq_set_messages")
			return liq_set_msg(usr, params)
		if("toggle_liq_rec")
			host.receive_reagents = !host.receive_reagents
			if(host.client.prefs_vr)
				host.client.prefs_vr.receive_reagents = host.receive_reagents
			unsaved_changes = TRUE
			return TRUE
		if("toggle_liq_giv")
			host.give_reagents = !host.give_reagents
			if(host.client.prefs_vr)
				host.client.prefs_vr.give_reagents = host.give_reagents
			unsaved_changes = TRUE
			return TRUE
		if("toggle_autotransferable")
			host.autotransferable = !host.autotransferable
			if(host.client.prefs_vr)
				host.client.prefs_vr.autotransferable = host.autotransferable
			unsaved_changes = TRUE
			return TRUE
		//Belch code
		if("toggle_noisy_full")
			host.noisy_full = !host.noisy_full
			unsaved_changes = TRUE
			return TRUE
		//CHOMPedit end
		if("toggle_drop_vore")
			host.drop_vore = !host.drop_vore
			unsaved_changes = TRUE
			return TRUE
		if("toggle_slip_vore")
			host.slip_vore = !host.slip_vore
			unsaved_changes = TRUE
			return TRUE
		if("toggle_stumble_vore")
			host.stumble_vore = !host.stumble_vore
			unsaved_changes = TRUE
			return TRUE
		if("switch_selective_mode_pref")
			host.selective_preference = tgui_input_list(usr, "What would you prefer happen to you with selective bellymode?","Selective Bellymode", list(DM_DEFAULT, DM_DIGEST, DM_ABSORB, DM_DRAIN))
			if(!(host.selective_preference))
				host.selective_preference = DM_DEFAULT
			if(host.client.prefs_vr)
				host.client.prefs_vr.selective_preference = host.selective_preference
			unsaved_changes = TRUE
			return TRUE
		if("toggle_nutrition_ex")
			host.nutrition_message_visible = !host.nutrition_message_visible
			unsaved_changes = TRUE
			return TRUE
		if("toggle_weight_ex")
			host.weight_message_visible = !host.weight_message_visible
			unsaved_changes = TRUE
			return TRUE

/datum/vore_look/proc/pick_from_inside(mob/user, params)
	var/atom/movable/target = locate(params["pick"])
	var/obj/belly/OB = locate(params["belly"])

	if(!(target in OB))
		return TRUE // Aren't here anymore, need to update menu

	var/intent = "Examine"
	if(isliving(target))
		intent = tgui_alert(usr, "What do you want to do to them?","Query",list("Examine","Help Out","Devour"))

	else if(istype(target, /obj/item))
		intent = tgui_alert(usr, "What do you want to do to that?","Query",list("Examine","Use Hand"))

	switch(intent)
		if("Examine") //Examine a mob inside another mob
			var/list/results = target.examine(host)
			if(!results || !results.len)
				results = list("You were unable to examine that. Tell a developer!")
			to_chat(user, jointext(results, "<br>"))
			return TRUE

		if("Use Hand")
			if(host.stat)
				to_chat(user, "<span class='warning'>You can't do that in your state!</span>")
				return TRUE

			host.ClickOn(target)
			return TRUE

	if(!isliving(target))
		return

	var/mob/living/M = target
	switch(intent)
		if("Help Out") //Help the inside-mob out
			if(host.stat || host.absorbed || M.absorbed)
				to_chat(user, "<span class='warning'>You can't do that in your state!</span>")
				return TRUE

			to_chat(user,"<font color='green'>You begin to push [M] to freedom!</font>")
			to_chat(M,"[host] begins to push you to freedom!")
			to_chat(OB.owner,"<span class='warning'>Someone is trying to escape from inside you!</span>")
			sleep(50)
			if(prob(33))
				OB.release_specific_contents(M)
				to_chat(user,"<font color='green'>You manage to help [M] to safety!</font>")
				to_chat(M,"<font color='green'>[host] pushes you free!</font>")
				to_chat(OB.owner,"<span class='alert'>[M] forces free of the confines of your body!</span>")
			else
				to_chat(user,"<span class='alert'>[M] slips back down inside despite your efforts.</span>")
				to_chat(M,"<span class='alert'> Even with [host]'s help, you slip back inside again.</span>")
				to_chat(OB.owner,"<font color='green'>Your body efficiently shoves [M] back where they belong.</font>")
			return TRUE

		if("Devour") //Eat the inside mob
			if(host.absorbed || host.stat)
				to_chat(user,"<span class='warning'>You can't do that in your state!</span>")
				return TRUE

			if(!host.vore_selected)
				to_chat(user,"<span class='warning'>Pick a belly on yourself first!</span>")
				return TRUE

			var/obj/belly/TB = host.vore_selected
			to_chat(user,"<span class='warning'>You begin to [lowertext(TB.vore_verb)] [M] into your [lowertext(TB.name)]!</span>")
			to_chat(M,"<span class='warning'>[host] begins to [lowertext(TB.vore_verb)] you into their [lowertext(TB.name)]!</span>")
			to_chat(OB.owner,"<span class='warning'>Someone inside you is eating someone else!</span>")

			sleep(TB.nonhuman_prey_swallow_time) //Can't do after, in a stomach, weird things abound.
			if((host in OB) && (M in OB)) //Make sure they're still here.
				to_chat(user,"<span class='warning'>You manage to [lowertext(TB.vore_verb)] [M] into your [lowertext(TB.name)]!</span>")
				to_chat(M,"<span class='warning'>[host] manages to [lowertext(TB.vore_verb)] you into their [lowertext(TB.name)]!</span>")
				to_chat(OB.owner,"<span class='warning'>Someone inside you has eaten someone else!</span>")
				if(M.absorbed)
					M.absorbed = FALSE
					OB.handle_absorb_langs(M, OB.owner)
				TB.nom_mob(M)

/datum/vore_look/proc/pick_from_outside(mob/user, params)
	var/intent

	//Handle the [All] choice. Ugh inelegant. Someone make this pretty.
	if(params["pickall"])
		intent = tgui_alert(user, "Eject all, Move all?","Query",list("Eject all","Cancel","Move all"))
		switch(intent)
			if("Cancel")
				return TRUE

			if("Eject all")
				if(host.stat)
					to_chat(user,"<span class='warning'>You can't do that in your state!</span>")
					return TRUE

				host.vore_selected.release_all_contents()
				return TRUE

			if("Move all")
				if(host.stat)
					to_chat(user,"<span class='warning'>You can't do that in your state!</span>")
					return TRUE

				var/obj/belly/choice = tgui_input_list(user, "Move all where?","Select Belly", host.vore_organs)
				if(!choice)
					return FALSE

				for(var/atom/movable/target in host.vore_selected)
					to_chat(target,"<span class='warning'>You're squished from [host]'s [lowertext(host.vore_selected)] to their [lowertext(choice.name)]!</span>")
					host.vore_selected.transfer_contents(target, choice, 1)
				return TRUE
		return

	var/atom/movable/target = locate(params["pick"])
	if(!(target in host.vore_selected))
		return TRUE // Not in our X anymore, update UI
	var/list/available_options = list("Examine", "Eject", "Move", "Transfer")
	if(ishuman(target))
		available_options += "Transform"
	intent = tgui_input_list(user, "What would you like to do with [target]?", "Vore Pick", available_options)
	switch(intent)
		if("Examine")
			var/list/results = target.examine(host)
			if(!results || !results.len)
				results = list("You were unable to examine that. Tell a developer!")
			to_chat(user, jointext(results, "<br>"))
			return TRUE

		if("Eject")
			if(host.stat)
				to_chat(user,"<span class='warning'>You can't do that in your state!</span>")
				return TRUE

			host.vore_selected.release_specific_contents(target)
			return TRUE

		if("Move")
			if(host.stat)
				to_chat(user,"<span class='warning'>You can't do that in your state!</span>")
				return TRUE
			var/obj/belly/choice = tgui_input_list(usr, "Move [target] where?","Select Belly", host.vore_organs)
			if(!choice || !(target in host.vore_selected))
				return TRUE
			to_chat(target,"<span class='warning'>You're squished from [host]'s [lowertext(host.vore_selected.name)] to their [lowertext(choice.name)]!</span>")
			host.vore_selected.transfer_contents(target, choice)


		if("Transfer")
			if(host.stat)
				to_chat(user,"<span class='warning'>You can't do that in your state!</span>")
				return TRUE

			var/mob/living/belly_owner = host

			var/list/viable_candidates = list()
			for(var/mob/living/candidate in range(1, host))
				if(istype(candidate) && !(candidate == host))
					if(candidate.vore_organs.len && candidate.feeding && !candidate.no_vore)
						viable_candidates += candidate
			if(!viable_candidates.len)
				to_chat(user, "<span class='notice'>There are no viable candidates around you!</span>")
				return TRUE
			belly_owner = tgui_input_list(user, "Who do you want to recieve the target?", "Select Predator", viable_candidates)

			if(!belly_owner || !(belly_owner in range(1, host)))
				return TRUE

			var/obj/belly/choice = tgui_input_list(user, "Move [target] where?","Select Belly", belly_owner.vore_organs)
			if(!choice || !(target in host.vore_selected) || !belly_owner || !(belly_owner in range(1, host)))
				return TRUE

			if(belly_owner != host)
				to_chat(user, "<span class='notice'>Transfer offer sent. Await their response.</span>")
				var/accepted = tgui_alert(belly_owner, "[host] is trying to transfer [target] from their [lowertext(host.vore_selected.name)] into your [lowertext(choice.name)]. Do you accept?", "Feeding Offer", list("Yes", "No"))
				if(accepted != "Yes")
					to_chat(user, "<span class='warning'>[belly_owner] refused the transfer!!</span>")
					return TRUE
				if(!belly_owner || !(belly_owner in range(1, host)))
					return TRUE
				to_chat(target,"<span class='warning'>You're squished from [host]'s [lowertext(host.vore_selected.name)] to [belly_owner]'s [lowertext(choice.name)]!</span>")
				to_chat(belly_owner,"<span class='warning'>[target] is squished from [host]'s [lowertext(host.vore_selected.name)] to your [lowertext(choice.name)]!</span>")
				host.vore_selected.transfer_contents(target, choice)
			else
				to_chat(target,"<span class='warning'>You're squished from [host]'s [lowertext(host.vore_selected.name)] to their [lowertext(choice.name)]!</span>")
				host.vore_selected.transfer_contents(target, choice)
			return TRUE

		if("Transform")
			if(host.stat)
				to_chat(user,"<span class='warning'>You can't do that in your state!</span>")
				return TRUE

			var/mob/living/carbon/human/H = target
			if(!istype(H))
				return

			var/datum/tgui_module/appearance_changer/vore/V = new(host, H)
			V.tgui_interact(user)
			return TRUE

/datum/vore_look/proc/set_attr(mob/user, params)
	if(!host.vore_selected)
		tgui_alert_async(usr, "No belly selected to modify.")
		return FALSE

	var/attr = params["attribute"]
	switch(attr)
		if("b_name")
			var/new_name = html_encode(tgui_input_text(usr,"Belly's new name:","New Name"))

			var/failure_msg
			if(length(new_name) > BELLIES_NAME_MAX || length(new_name) < BELLIES_NAME_MIN)
				failure_msg = "Entered belly name length invalid (must be longer than [BELLIES_NAME_MIN], no more than than [BELLIES_NAME_MAX])."
			// else if(whatever) //Next test here.
			else
				for(var/obj/belly/B as anything in host.vore_organs)
					if(lowertext(new_name) == lowertext(B.name))
						failure_msg = "No duplicate belly names, please."
						break

			if(failure_msg) //Something went wrong.
				tgui_alert_async(user,failure_msg,"Error!")
				return FALSE

			host.vore_selected.name = new_name
			. = TRUE
		if("b_wetness")
			host.vore_selected.is_wet = !host.vore_selected.is_wet
			. = TRUE
		if("b_wetloop")
			host.vore_selected.wet_loop = !host.vore_selected.wet_loop
			. = TRUE
		if("b_mode")
			var/list/menu_list = host.vore_selected.digest_modes.Copy()
			var/new_mode = tgui_input_list(usr, "Choose Mode (currently [host.vore_selected.digest_mode])", "Mode Choice", menu_list)
			if(!new_mode)
				return FALSE

			host.vore_selected.digest_mode = new_mode
			host.vore_selected.updateVRPanels()
			. = TRUE
		if("b_addons")
			var/list/menu_list = host.vore_selected.mode_flag_list.Copy()
			var/toggle_addon = tgui_input_list(usr, "Toggle Addon", "Addon Choice", menu_list)
			if(!toggle_addon)
				return FALSE
			host.vore_selected.mode_flags ^= host.vore_selected.mode_flag_list[toggle_addon]
			host.vore_selected.items_preserved.Cut() //Re-evaltuate all items in belly on
			. = TRUE
		if("b_item_mode")
			var/list/menu_list = host.vore_selected.item_digest_modes.Copy()

			var/new_mode = tgui_input_list(usr, "Choose Mode (currently [host.vore_selected.item_digest_mode])", "Mode Choice", menu_list)
			if(!new_mode)
				return FALSE

			host.vore_selected.item_digest_mode = new_mode
			host.vore_selected.items_preserved.Cut() //Re-evaltuate all items in belly on belly-mode change
			. = TRUE
		if("b_contaminates") // CHOMPedit: Reverting upstream's change because why reset save files due to a different server's drama?
			host.vore_selected.contaminates = !host.vore_selected.contaminates
			. = TRUE
		if("b_contamination_flavor")
			var/list/menu_list = contamination_flavors.Copy()
			var/new_flavor = tgui_input_list(usr, "Choose Contamination Flavor Text Type (currently [host.vore_selected.contamination_flavor])", "Flavor Choice", menu_list)
			if(!new_flavor)
				return FALSE
			host.vore_selected.contamination_flavor = new_flavor
			. = TRUE
		if("b_contamination_color")
			var/list/menu_list = contamination_colors.Copy()
			var/new_color = tgui_input_list(usr, "Choose Contamination Color (currently [host.vore_selected.contamination_color])", "Color Choice", menu_list)
			if(!new_color)
				return FALSE
			host.vore_selected.contamination_color = new_color
			host.vore_selected.items_preserved.Cut() //To re-contaminate for new color
			. = TRUE
		if("b_egg_type")
			var/list/menu_list = global_vore_egg_types.Copy()
			var/new_egg_type = tgui_input_list(usr, "Choose Egg Type (currently [host.vore_selected.egg_type])", "Egg Choice", menu_list)
			if(!new_egg_type)
				return FALSE
			host.vore_selected.egg_type = new_egg_type
			. = TRUE
		if("b_desc")
			var/new_desc = html_encode(tgui_input_text(usr,"Belly Description, '%pred' will be replaced with your name. '%prey' will be replaced with the prey's name. '%belly' will be replaced with your belly's name. ([BELLIES_DESC_MAX] char limit):","New Description",host.vore_selected.desc, multiline = TRUE, prevent_enter = TRUE))

			if(new_desc)
				new_desc = readd_quotes(new_desc)
				if(length(new_desc) > BELLIES_DESC_MAX)
					tgui_alert_async(usr, "Entered belly desc too long. [BELLIES_DESC_MAX] character limit.","Error")
					return FALSE
				host.vore_selected.desc = new_desc
				. = TRUE
		if("b_absorbed_desc")
			var/new_desc = html_encode(tgui_input_text(usr,"Belly Description for absorbed prey, '%pred' will be replaced with your name. '%prey' will be replaced with the prey's name. '%belly' will be replaced with your belly's name. ([BELLIES_DESC_MAX] char limit):","New Description",host.vore_selected.absorbed_desc, multiline = TRUE, prevent_enter = TRUE))

			if(new_desc)
				new_desc = readd_quotes(new_desc)
				if(length(new_desc) > BELLIES_DESC_MAX)
					tgui_alert_async(usr, "Entered belly desc too long. [BELLIES_DESC_MAX] character limit.","Error")
					return FALSE
				host.vore_selected.absorbed_desc = new_desc
				. = TRUE
		if("b_msgs")
			tgui_alert(user,"Setting abusive or deceptive messages will result in a ban. Consider this your warning. Max 150 characters per message (250 for examines, 500 for idle messages), max 10 messages per topic.","Really, don't.") // Should remain tgui_alert() (blocking)
			var/help = " Press enter twice to separate messages. '%pred' will be replaced with your name. '%prey' will be replaced with the prey's name. '%belly' will be replaced with your belly's name. '%count' will be replaced with the number of anything in your belly. '%countprey' will be replaced with the number of living prey in your belly."
			switch(params["msgtype"])
				if("dmp")
					var/new_message = sanitize(tgui_input_text(user,"These are sent to prey when they expire. Write them in 2nd person ('you feel X'). Avoid using %prey in this type."+help,"Digest Message (to prey)",host.vore_selected.get_messages("dmp"), multiline = TRUE, prevent_enter = TRUE),MAX_MESSAGE_LEN,0,0,0)
					if(new_message)
						host.vore_selected.set_messages(new_message,"dmp")

				if("dmo")
					var/new_message = sanitize(tgui_input_text(user,"These are sent to you when prey expires in you. Write them in 2nd person ('you feel X'). Avoid using %pred in this type."+help,"Digest Message (to you)",host.vore_selected.get_messages("dmo"), multiline = TRUE, prevent_enter = TRUE),MAX_MESSAGE_LEN,0,0,0)
					if(new_message)
						host.vore_selected.set_messages(new_message,"dmo")

				if("amp")
					var/new_message = sanitize(tgui_input_text(user,"These are sent to prey when their absorption finishes. Write them in 2nd person ('you feel X'). Avoid using %prey in this type. %count will not work for this type, and %countprey will only count absorbed victims."+help,"Digest Message (to prey)",host.vore_selected.get_messages("amp"), multiline = TRUE, prevent_enter = TRUE),MAX_MESSAGE_LEN,0,0,0)
					if(new_message)
						host.vore_selected.set_messages(new_message,"amp")

				if("amo")
					var/new_message = sanitize(tgui_input_text(user,"These are sent to you when prey's absorption finishes. Write them in 2nd person ('you feel X'). Avoid using %pred in this type. %count will not work for this type, and %countprey will only count absorbed victims."+help,"Digest Message (to you)",host.vore_selected.get_messages("amo"), multiline = TRUE, prevent_enter = TRUE),MAX_MESSAGE_LEN,0,0,0)
					if(new_message)
						host.vore_selected.set_messages(new_message,"amo")

				if("uamp")
					var/new_message = sanitize(tgui_input_text(user,"These are sent to prey when their unnabsorption finishes. Write them in 2nd person ('you feel X'). Avoid using %prey in this type. %count will not work for this type, and %countprey will only count absorbed victims."+help,"Digest Message (to prey)",host.vore_selected.get_messages("uamp"), multiline = TRUE, prevent_enter = TRUE),MAX_MESSAGE_LEN,0,0,0)
					if(new_message)
						host.vore_selected.set_messages(new_message,"uamp")

				if("uamo")
					var/new_message = sanitize(tgui_input_text(user,"These are sent to you when prey's unabsorption finishes. Write them in 2nd person ('you feel X'). Avoid using %pred in this type. %count will not work for this type, and %countprey will only count absorbed victims."+help,"Digest Message (to you)",host.vore_selected.get_messages("uamo"), multiline = TRUE, prevent_enter = TRUE),MAX_MESSAGE_LEN,0,0,0)
					if(new_message)
						host.vore_selected.set_messages(new_message,"uamo")

				if("smo")
					var/new_message = sanitize(tgui_input_text(user,"These are sent to those nearby when prey struggles. Write them in 3rd person ('X's Y bulges')."+help,"Struggle Message (outside)",host.vore_selected.get_messages("smo"), multiline = TRUE, prevent_enter = TRUE),MAX_MESSAGE_LEN,0,0,0)
					if(new_message)
						host.vore_selected.set_messages(new_message,"smo")

				if("smi")
					var/new_message = sanitize(tgui_input_text(user,"These are sent to prey when they struggle. Write them in 2nd person ('you feel X'). Avoid using %prey in this type."+help,"Struggle Message (inside)",host.vore_selected.get_messages("smi"), multiline = TRUE, prevent_enter = TRUE),MAX_MESSAGE_LEN,0,0,0)
					if(new_message)
						host.vore_selected.set_messages(new_message,"smi")

				if("asmo")
					var/new_message = sanitize(tgui_input_text(user,"These are sent to those nearby when absorbed prey struggles. Write them in 3rd person ('X's Y bulges'). %count will not work for this type, and %countprey will only count absorbed victims."+help,"Struggle Message (outside)",host.vore_selected.get_messages("asmo"), multiline = TRUE, prevent_enter = TRUE),MAX_MESSAGE_LEN,0,0,0)
					if(new_message)
						host.vore_selected.set_messages(new_message,"asmo")

				if("asmi")
					var/new_message = sanitize(tgui_input_text(user,"These are sent to absorbed prey when they struggle. Write them in 2nd person ('you feel X'). Avoid using %prey in this type. %count will not work for this type, and %countprey will only count absorbed victims."+help,"Struggle Message (inside)",host.vore_selected.get_messages("asmi"), multiline = TRUE, prevent_enter = TRUE),MAX_MESSAGE_LEN,0,0,0)
					if(new_message)
						host.vore_selected.set_messages(new_message,"asmi")

				if("em")
					var/new_message = sanitize(tgui_input_text(user,"These are sent to people who examine you when this belly has contents. Write them in 3rd person ('Their %belly is bulging')."+help,"Examine Message (when full)",host.vore_selected.get_messages("em"), multiline = TRUE, prevent_enter = TRUE),MAX_MESSAGE_LEN,0,0,0)
					if(new_message)
						host.vore_selected.set_messages(new_message,"em")

				if("ema")
					var/new_message = sanitize(tgui_input_text(user,"These are sent to people who examine you when this belly has absorbed victims. Write them in 3rd person ('Their %belly is larger'). %count will not work for this type, and %countprey will only count absorbed victims."+help,"Examine Message (with absorbed victims)",host.vore_selected.get_messages("ema"), multiline = TRUE, prevent_enter = TRUE),MAX_MESSAGE_LEN,0,0,0)
					if(new_message)
						host.vore_selected.set_messages(new_message,"ema")

				if("en")
					var/list/indices = list(1,2,3,4,5,6,7,8,9,10)
					var/index = tgui_input_list(user,"Select a message to edit:","Select Message", indices)
					if(index && index <= 10)
						var/alert = tgui_alert(user, "What do you wish to do with this message?","Selection",list("Edit","Clear","Cancel"))
						switch(alert)
							if("Clear")
								host.nutrition_messages[index] = ""
							if("Edit")
								var/new_message = sanitize(tgui_input_text(user, "Input a message", "Input", host.nutrition_messages[index], multiline = TRUE, prevent_enter = TRUE),MAX_MESSAGE_LEN,0,0,0)
								if(new_message)
									host.nutrition_messages[index] = new_message

				if("ew")
					var/list/indices = list(1,2,3,4,5,6,7,8,9,10)
					var/index = tgui_input_list(user,"Select a message to edit:","Select Message", indices)
					if(index && index <= 10)
						var/alert = tgui_alert(user, "What do you wish to do with this message?","Selection",list("Edit","Clear","Cancel"))
						switch(alert)
							if("Clear")
								host.weight_messages[index] = ""
							if("Edit")
								var/new_message = sanitize(tgui_input_text(user, "Input a message", "Input", host.weight_messages[index], multiline = TRUE, prevent_enter = TRUE),MAX_MESSAGE_LEN,0,0,0)
								if(new_message)
									host.weight_messages[index] = new_message

				if("im_digest")
					var/new_message = sanitize(tgui_input_text(user,"These are sent to prey every minute when you are on Digest mode. Write them in 2nd person ('%pred's %belly squishes down on you.')."+help,"Idle Message (Digest)",host.vore_selected.get_messages("im_digest"), multiline = TRUE, prevent_enter = TRUE),MAX_MESSAGE_LEN,0,0,0)
					if(new_message)
						host.vore_selected.set_messages(new_message,"im_digest")

				if("im_hold")
					var/new_message = sanitize(tgui_input_text(user,"These are sent to prey every minute when you are on Hold mode. Write them in 2nd person ('%pred's %belly squishes down on you.')"+help,"Idle Message (Hold)",host.vore_selected.get_messages("im_hold"), multiline = TRUE, prevent_enter = TRUE),MAX_MESSAGE_LEN,0,0,0)
					if(new_message)
						host.vore_selected.set_messages(new_message,"im_hold")

				if("im_holdabsorbed")
					var/new_message = sanitize(tgui_input_text(user,"These are sent to prey every minute when you are absorbed. Write them in 2nd person ('%pred's %belly squishes down on you.') %count will not work for this type, and %countprey will only count absorbed victims."+help,"Idle Message (Hold Absorbed)",host.vore_selected.get_messages("im_holdabsorbed"), multiline = TRUE, prevent_enter = TRUE),MAX_MESSAGE_LEN,0,0,0)
					if(new_message)
						host.vore_selected.set_messages(new_message,"im_holdabsorbed")

				if("im_absorb")
					var/new_message = sanitize(tgui_input_text(user,"These are sent to prey every minute when you are on Absorb mode. Write them in 2nd person ('%pred's %belly squishes down on you.')"+help,"Idle Message (Absorb)",host.vore_selected.get_messages("im_absorb"), multiline = TRUE, prevent_enter = TRUE),MAX_MESSAGE_LEN,0,0,0)
					if(new_message)
						host.vore_selected.set_messages(new_message,"im_absorb")

				if("im_heal")
					var/new_message = sanitize(tgui_input_text(user,"These are sent to prey every minute when you are on Heal mode. Write them in 2nd person ('%pred's %belly squishes down on you.')"+help,"Idle Message (Heal)",host.vore_selected.get_messages("im_heal"), multiline = TRUE, prevent_enter = TRUE),MAX_MESSAGE_LEN,0,0,0)
					if(new_message)
						host.vore_selected.set_messages(new_message,"im_heal")

				if("im_drain")
					var/new_message = sanitize(tgui_input_text(user,"These are sent to prey every minute when you are on Drain mode. Write them in 2nd person ('%pred's %belly squishes down on you.')"+help,"Idle Message (Drain)",host.vore_selected.get_messages("im_drain"), multiline = TRUE, prevent_enter = TRUE),MAX_MESSAGE_LEN,0,0,0)
					if(new_message)
						host.vore_selected.set_messages(new_message,"im_drain")

				if("im_steal")
					var/new_message = sanitize(tgui_input_text(user,"These are sent to prey every minute when you are on Size Steal mode. Write them in 2nd person ('%pred's %belly squishes down on you.')"+help,"Idle Message (Size Steal)",host.vore_selected.get_messages("im_steal"), multiline = TRUE, prevent_enter = TRUE),MAX_MESSAGE_LEN,0,0,0)
					if(new_message)
						host.vore_selected.set_messages(new_message,"im_steal")

				if("im_egg")
					var/new_message = sanitize(tgui_input_text(user,"These are sent to prey every minute when you are on Encase In Egg mode. Write them in 2nd person ('%pred's %belly squishes down on you.')"+help,"Idle Message (Encase In Egg)",host.vore_selected.get_messages("im_egg"), multiline = TRUE, prevent_enter = TRUE),MAX_MESSAGE_LEN,0,0,0)
					if(new_message)
						host.vore_selected.set_messages(new_message,"im_egg")

				if("im_shrink")
					var/new_message = sanitize(tgui_input_text(user,"These are sent to prey every minute when you are on Shrink mode. Write them in 2nd person ('%pred's %belly squishes down on you.')"+help,"Idle Message (Shrink)",host.vore_selected.get_messages("im_shrink"), multiline = TRUE, prevent_enter = TRUE),MAX_MESSAGE_LEN,0,0,0)
					if(new_message)
						host.vore_selected.set_messages(new_message,"im_shrink")

				if("im_grow")
					var/new_message = sanitize(tgui_input_text(user,"These are sent to prey every minute when you are on Grow mode. Write them in 2nd person ('%pred's %belly squishes down on you.')"+help,"Idle Message (Grow)",host.vore_selected.get_messages("im_grow"), multiline = TRUE, prevent_enter = TRUE),MAX_MESSAGE_LEN,0,0,0)
					if(new_message)
						host.vore_selected.set_messages(new_message,"im_grow")

				if("im_unabsorb")
					var/new_message = sanitize(tgui_input_text(user,"These are sent to prey every minute when you are on Unabsorb mode. Write them in 2nd person ('%pred's %belly squishes down on you.')"+help,"Idle Message (Unabsorb)",host.vore_selected.get_messages("im_unabsorb"), multiline = TRUE, prevent_enter = TRUE),MAX_MESSAGE_LEN,0,0,0)
					if(new_message)
						host.vore_selected.set_messages(new_message,"im_unabsorb")

				if("reset")
					var/confirm = tgui_alert(user,"This will delete any custom messages. Are you sure?","Confirmation",list("Cancel","DELETE"))
					if(confirm == "DELETE")
						host.vore_selected.digest_messages_prey = initial(host.vore_selected.digest_messages_prey)
						host.vore_selected.digest_messages_owner = initial(host.vore_selected.digest_messages_owner)
						host.vore_selected.absorb_messages_prey = initial(host.vore_selected.absorb_messages_prey)
						host.vore_selected.absorb_messages_owner = initial(host.vore_selected.absorb_messages_owner)
						host.vore_selected.unabsorb_messages_prey = initial(host.vore_selected.unabsorb_messages_prey)
						host.vore_selected.unabsorb_messages_owner = initial(host.vore_selected.unabsorb_messages_owner)
						host.vore_selected.struggle_messages_outside = initial(host.vore_selected.struggle_messages_outside)
						host.vore_selected.struggle_messages_inside = initial(host.vore_selected.struggle_messages_inside)
						host.vore_selected.absorbed_struggle_messages_outside = initial(host.vore_selected.absorbed_struggle_messages_outside)
						host.vore_selected.absorbed_struggle_messages_inside = initial(host.vore_selected.absorbed_struggle_messages_inside)
						host.vore_selected.examine_messages = initial(host.vore_selected.examine_messages)
						host.vore_selected.examine_messages_absorbed = initial(host.vore_selected.examine_messages_absorbed)
						host.vore_selected.emote_lists = initial(host.vore_selected.emote_lists)
			. = TRUE
		if("b_verb")
			var/new_verb = html_encode(tgui_input_text(usr,"New verb when eating (infinitive tense, e.g. nom or swallow):","New Verb"))

			if(length(new_verb) > BELLIES_NAME_MAX || length(new_verb) < BELLIES_NAME_MIN)
				tgui_alert_async(usr, "Entered verb length invalid (must be longer than [BELLIES_NAME_MIN], no longer than [BELLIES_NAME_MAX]).","Error")
				return FALSE

			host.vore_selected.vore_verb = new_verb
			. = TRUE
		if("b_release_verb")
			var/new_release_verb = html_encode(tgui_input_text(usr,"New verb when releasing from stomach (e.g. expels or coughs or drops):","New Release Verb"))

			if(length(new_release_verb) > BELLIES_NAME_MAX || length(new_release_verb) < BELLIES_NAME_MIN)
				tgui_alert_async(usr, "Entered verb length invalid (must be longer than [BELLIES_NAME_MIN], no longer than [BELLIES_NAME_MAX]).","Error")
				return FALSE

			host.vore_selected.release_verb = new_release_verb
			. = TRUE
		if("b_fancy_sound")
			host.vore_selected.fancy_vore = !host.vore_selected.fancy_vore
			host.vore_selected.vore_sound = "Gulp"
			host.vore_selected.release_sound = "Splatter"
			// defaults as to avoid potential bugs
			. = TRUE
		if("b_release")
			var/choice
			if(host.vore_selected.fancy_vore)
				choice = tgui_input_list(user,"Currently set to [host.vore_selected.release_sound]","Select Sound", fancy_release_sounds)
			else
				choice = tgui_input_list(user,"Currently set to [host.vore_selected.release_sound]","Select Sound", classic_release_sounds)

			if(!choice)
				return FALSE

			host.vore_selected.release_sound = choice
			. = TRUE
		if("b_releasesoundtest")
			var/sound/releasetest
			if(host.vore_selected.fancy_vore)
				releasetest = fancy_release_sounds[host.vore_selected.release_sound]
			else
				releasetest = classic_release_sounds[host.vore_selected.release_sound]

			if(releasetest)
				SEND_SOUND(user, releasetest)
			. = TRUE
		if("b_sound")
			var/choice
			if(host.vore_selected.fancy_vore)
				choice = tgui_input_list(user,"Currently set to [host.vore_selected.vore_sound]","Select Sound", fancy_vore_sounds)
			else
				choice = tgui_input_list(user,"Currently set to [host.vore_selected.vore_sound]","Select Sound", classic_vore_sounds)

			if(!choice)
				return FALSE

			host.vore_selected.vore_sound = choice
			. = TRUE
		if("b_soundtest")
			var/sound/voretest
			if(host.vore_selected.fancy_vore)
				voretest = fancy_vore_sounds[host.vore_selected.vore_sound]
			else
				voretest = classic_vore_sounds[host.vore_selected.vore_sound]
			if(voretest)
				SEND_SOUND(user, voretest)
			. = TRUE
		if("b_tastes")
			host.vore_selected.can_taste = !host.vore_selected.can_taste
			. = TRUE
		if("b_bulge_size")
			var/new_bulge = tgui_input_number(user, "Choose the required size prey must be to show up on examine, ranging from 25% to 200% Set this to 0 for no text on examine.", "Set Belly Examine Size.", max_value = 200, min_value = 0)
			if(new_bulge == null)
				return FALSE
			if(new_bulge == 0) //Disable.
				host.vore_selected.bulge_size = 0
				to_chat(user,"<span class='notice'>Your stomach will not be seen on examine.</span>")
			else if (!ISINRANGE(new_bulge,25,200))
				host.vore_selected.bulge_size = 0.25 //Set it to the default.
				to_chat(user,"<span class='notice'>Invalid size.</span>")
			else if(new_bulge)
				host.vore_selected.bulge_size = (new_bulge/100)
			. = TRUE
		if("b_display_absorbed_examine")
			host.vore_selected.display_absorbed_examine = !host.vore_selected.display_absorbed_examine
			. = TRUE
		if("b_grow_shrink")
			var/new_grow = tgui_input_number(user, "Choose the size that prey will be grown/shrunk to, ranging from 25% to 200%", "Set Growth Shrink Size.", host.vore_selected.shrink_grow_size, 200, 25)
			if (new_grow == null)
				return FALSE
			if (!ISINRANGE(new_grow,25,200))
				host.vore_selected.shrink_grow_size = 1 //Set it to the default
				to_chat(user,"<span class='notice'>Invalid size.</span>")
			else if(new_grow)
				host.vore_selected.shrink_grow_size = (new_grow*0.01)
			. = TRUE
		if("b_nutritionpercent")
			var/new_nutrition = tgui_input_number(user, "Choose the nutrition gain percentage you will recieve per tick from prey. Ranges from 0.01 to 100.", "Set Nutrition Gain Percentage.", host.vore_selected.nutrition_percent, 100, 0.01)
			if(new_nutrition == null)
				return FALSE
			var/new_new_nutrition = CLAMP(new_nutrition, 0.01, 100)
			host.vore_selected.nutrition_percent = new_new_nutrition
			. = TRUE
		if("b_burn_dmg")
			var/new_damage = tgui_input_number(user, "Choose the amount of burn damage prey will take per tick. Ranges from 0 to 6.", "Set Belly Burn Damage.", host.vore_selected.digest_burn, 6, 0)
			if(new_damage == null)
				return FALSE
			var/new_new_damage = CLAMP(new_damage, 0, 6)
			host.vore_selected.digest_burn = new_new_damage
			. = TRUE
		if("b_brute_dmg")
			var/new_damage = tgui_input_number(user, "Choose the amount of brute damage prey will take per tick. Ranges from 0 to 6", "Set Belly Brute Damage.", host.vore_selected.digest_brute, 6, 0)
			if(new_damage == null)
				return FALSE
			var/new_new_damage = CLAMP(new_damage, 0, 6)
			host.vore_selected.digest_brute = new_new_damage
			. = TRUE
		if("b_oxy_dmg")
			var/new_damage = tgui_input_number(user, "Choose the amount of suffocation damage prey will take per tick. Ranges from 0 to 12.", "Set Belly Suffocation Damage.", host.vore_selected.digest_oxy, 12, 0)
			if(new_damage == null)
				return FALSE
			var/new_new_damage = CLAMP(new_damage, 0, 12)
			host.vore_selected.digest_oxy = new_new_damage
			. = TRUE
		if("b_tox_dmg")
			var/new_damage = tgui_input_number(user, "Choose the amount of toxins damage prey will take per tick. Ranges from 0 to 6", "Set Belly Toxins Damage.", host.vore_selected.digest_tox, 6, 0)
			if(new_damage == null)
				return FALSE
			var/new_new_damage = CLAMP(new_damage, 0, 6)
			host.vore_selected.digest_tox = new_new_damage
			. = TRUE
		if("b_clone_dmg")
			var/new_damage = tgui_input_number(user, "Choose the amount of brute DNA damage (clone) prey will take per tick. Ranges from 0 to 6", "Set Belly Clone Damage.", host.vore_selected.digest_clone, 6, 0)
			if(new_damage == null)
				return FALSE
			var/new_new_damage = CLAMP(new_damage, 0, 6)
			host.vore_selected.digest_clone = new_new_damage
			. = TRUE
		if("b_emoteactive")
			host.vore_selected.emote_active = !host.vore_selected.emote_active
			. = TRUE
		if("b_selective_mode_pref_toggle")
			if(host.vore_selected.selective_preference == DM_DIGEST)
				host.vore_selected.selective_preference = DM_ABSORB
			else
				host.vore_selected.selective_preference = DM_DIGEST
			. = TRUE
		if("b_emotetime")
			var/new_time = tgui_input_number(user, "Choose the period it takes for idle belly emotes to be shown to prey. Measured in seconds, Minimum 1 minute, Maximum 10 minutes.", "Set Belly Emote Delay.", host.vore_selected.digest_brute, 600, 60)
			if(new_time == null)
				return FALSE
			var/new_new_time = CLAMP(new_time, 60, 600)
			host.vore_selected.emote_time = new_new_time
			. = TRUE
		if("b_escapable")
			if(host.vore_selected.escapable == 0) //Possibly escapable and special interactions.
				host.vore_selected.escapable = 1
				to_chat(usr,"<span class='warning'>Prey now have special interactions with your [lowertext(host.vore_selected.name)] depending on your settings.</span>")
			else if(host.vore_selected.escapable == 1) //Never escapable.
				host.vore_selected.escapable = 0
				to_chat(usr,"<span class='warning'>Prey will not be able to have special interactions with your [lowertext(host.vore_selected.name)].</span>")
			else
				tgui_alert_async(usr, "Something went wrong. Your stomach will now not have special interactions. Press the button enable them again and tell a dev.","Error") //If they somehow have a varable that's not 0 or 1
				host.vore_selected.escapable = 0
			. = TRUE
		if("b_escapechance")
			var/escape_chance_input = tgui_input_number(user, "Set prey escape chance on resist (as %)", "Prey Escape Chance", null, 100, 0)
			if(!isnull(escape_chance_input)) //These have to be 'null' because both cancel and 0 are valid, separate options
				host.vore_selected.escapechance = sanitize_integer(escape_chance_input, 0, 100, initial(host.vore_selected.escapechance))
			. = TRUE
		if("b_escapetime")
			var/escape_time_input = tgui_input_number(user, "Set number of seconds for prey to escape on resist (1-60)", "Prey Escape Time", null, 60, 1)
			if(!isnull(escape_time_input))
				host.vore_selected.escapetime = sanitize_integer(escape_time_input*10, 10, 600, initial(host.vore_selected.escapetime))
			. = TRUE
		if("b_transferchance")
			var/transfer_chance_input = tgui_input_number(user, "Set belly transfer chance on resist (as %). You must also set the location for this to have any effect.", "Prey Escape Time", null, 100, 0)
			if(!isnull(transfer_chance_input))
				host.vore_selected.transferchance = sanitize_integer(transfer_chance_input, 0, 100, initial(host.vore_selected.transferchance))
			. = TRUE
		if("b_transferlocation")
			var/obj/belly/choice = tgui_input_list(usr, "Where do you want your [lowertext(host.vore_selected.name)] to lead if prey resists?","Select Belly", (host.vore_organs + "None - Remove" - host.vore_selected))
			if(!choice) //They cancelled, no changes
				return FALSE
			else if(choice == "None - Remove")
				host.vore_selected.transferlocation = null
			else
				host.vore_selected.transferlocation = choice.name
			. = TRUE
		if("b_transferchance_secondary")
			var/transfer_secondary_chance_input = tgui_input_number(user, "Set secondary belly transfer chance on resist (as %). You must also set the location for this to have any effect.", "Prey Escape Time", null, 100, 0)
			if(!isnull(transfer_secondary_chance_input))
				host.vore_selected.transferchance_secondary = sanitize_integer(transfer_secondary_chance_input, 0, 100, initial(host.vore_selected.transferchance_secondary))
			. = TRUE
		if("b_transferlocation_secondary")
			var/obj/belly/choice_secondary = tgui_input_list(usr, "Where do you want your [lowertext(host.vore_selected.name)] to alternately lead if prey resists?","Select Belly", (host.vore_organs + "None - Remove" - host.vore_selected))

			if(!choice_secondary) //They cancelled, no changes
				return FALSE
			else if(choice_secondary == "None - Remove")
				host.vore_selected.transferlocation_secondary = null
			else
				host.vore_selected.transferlocation_secondary = choice_secondary.name
			. = TRUE
		if("b_absorbchance")
			var/absorb_chance_input = tgui_input_number(user, "Set belly absorb mode chance on resist (as %)", "Prey Absorb Chance", null, 100, 0)
			if(!isnull(absorb_chance_input))
				host.vore_selected.absorbchance = sanitize_integer(absorb_chance_input, 0, 100, initial(host.vore_selected.absorbchance))
			. = TRUE
		if("b_digestchance")
			var/digest_chance_input = tgui_input_number(user, "Set belly digest mode chance on resist (as %)", "Prey Digest Chance", null, 100, 0)
			if(!isnull(digest_chance_input))
				host.vore_selected.digestchance = sanitize_integer(digest_chance_input, 0, 100, initial(host.vore_selected.digestchance))
			. = TRUE
		if("b_autotransferchance") //CHOMPedit Start
			var/autotransferchance_input = input(user, "Set belly auto-transfer chance (as %). You must also set the location for this to have any effect.", "Auto-Transfer Chance") as num|null
			if(!isnull(autotransferchance_input))
				host.vore_selected.autotransferchance = sanitize_integer(autotransferchance_input, 0, 100, initial(host.vore_selected.autotransferchance))
			. = TRUE
		if("b_autotransferwait")
			var/autotransferwait_input = input(user, "Set minimum number of seconds for auto-transfer wait delay.", "Auto-Transfer Time") as num|null //CHOMPEdit: Wiggle room for rougher time resolution in process cycles.
			if(!isnull(autotransferwait_input))
				host.vore_selected.autotransferwait = sanitize_integer(autotransferwait_input*10, 10, 18000, initial(host.vore_selected.autotransferwait))
			. = TRUE
		if("b_autotransferlocation")
			var/obj/belly/choice = tgui_input_list(usr, "Where do you want your [lowertext(host.vore_selected.name)] auto-transfer to?","Select Belly", (host.vore_organs + "None - Remove" - host.vore_selected))
			if(!choice) //They cancelled, no changes
				return FALSE
			else if(choice == "None - Remove")
				host.vore_selected.autotransferlocation = null
			else
				host.vore_selected.autotransferlocation = choice.name
			. = TRUE
		if("b_autotransfer_min_amount")
			var/autotransfer_min_amount_input = input(user, "Set the minimum amount of items your belly can belly auto-transfer at once. Set to 0 for no limit.", "Auto-Transfer Min Amount") as num|null
			if(!isnull(autotransfer_min_amount_input))
				host.vore_selected.autotransfer_min_amount = sanitize_integer(autotransfer_min_amount_input, 0, 100, initial(host.vore_selected.autotransfer_min_amount))
			. = TRUE
		if("b_autotransfer_max_amount")
			var/autotransfer_max_amount_input = input(user, "Set the maximum amount of items your belly can belly auto-transfer at once. Set to 0 for no limit.", "Auto-Transfer Max Amount") as num|null
			if(!isnull(autotransfer_max_amount_input))
				host.vore_selected.autotransfer_max_amount = sanitize_integer(autotransfer_max_amount_input, 0, 100, initial(host.vore_selected.autotransfer_max_amount))
			. = TRUE
		if("b_autotransfer_enabled")
			host.vore_selected.autotransfer_enabled = !host.vore_selected.autotransfer_enabled
			. = TRUE //CHOMPedit End
		if("b_fullscreen")
			host.vore_selected.belly_fullscreen = params["val"]
			update_preview_icon()	//CHOMPEdit Begin
			. = TRUE
		if("b_fullscreen_color")
			var/newcolor = input(usr, "Choose a color.", "", host.vore_selected.belly_fullscreen_color) as color|null
			if(newcolor)
				host.vore_selected.belly_fullscreen_color = newcolor
			update_preview_icon()
			. = TRUE 				//CHOMPEdit End
		if("b_disable_hud")
			host.vore_selected.disable_hud = !host.vore_selected.disable_hud
			. = TRUE
		if("b_save_digest_mode")
			host.vore_selected.save_digest_mode = !host.vore_selected.save_digest_mode
			. = TRUE
		if("b_del")
			var/alert = tgui_alert(usr, "Are you sure you want to delete your [lowertext(host.vore_selected.name)]?","Confirmation",list("Cancel","Delete"))
			if(!(alert == "Delete"))
				return FALSE

			var/failure_msg = ""

			var/dest_for //Check to see if it's the destination of another vore organ.
			for(var/obj/belly/B as anything in host.vore_organs)
				if(B.transferlocation == host.vore_selected)
					dest_for = B.name
					failure_msg += "This is the destiantion for at least '[dest_for]' belly transfers. Remove it as the destination from any bellies before deleting it. "
					break
				if(B.transferlocation_secondary == host.vore_selected)
					dest_for = B.name
					failure_msg += "This is the destiantion for at least '[dest_for]' secondary belly transfers. Remove it as the destination from any bellies before deleting it. "
					break

			if(host.vore_selected.contents.len)
				failure_msg += "You cannot delete bellies with contents! " //These end with spaces, to be nice looking. Make sure you do the same.
			if(host.vore_selected.immutable)
				failure_msg += "This belly is marked as undeletable. "
			if(host.vore_organs.len == 1)
				failure_msg += "You must have at least one belly. "

			if(failure_msg)
				tgui_alert_async(user,failure_msg,"Error!")
				return FALSE

			qdel(host.vore_selected)
			host.vore_selected = host.vore_organs[1]
			. = TRUE
		if("b_vorespawn_blacklist") //CHOMP Addition
			host.vore_selected.vorespawn_blacklist = !host.vore_selected.vorespawn_blacklist
			. = TRUE
		if("b_belly_sprite_to_affect") //CHOMP Addition
			var/belly_choice = tgui_input_list(usr, "Which belly sprite do you want your [lowertext(host.vore_selected.name)] to affect?","Select Region", host.vore_icon_bellies)
			if(!belly_choice) //They cancelled, no changes
				return FALSE
			else
				host.vore_selected.belly_sprite_to_affect = belly_choice
				host.update_fullness()
			. = TRUE
		if("b_vore_sprite_flags") //CHOMP Addition
			var/list/menu_list = host.vore_selected.vore_sprite_flag_list.Copy()
			var/toggle_vs_flag = tgui_input_list(usr, "Toggle Vore Sprite Modes", "Mode Choice", menu_list)
			if(!toggle_vs_flag)
				return FALSE
			host.vore_selected.vore_sprite_flags ^= host.vore_selected.vore_sprite_flag_list[toggle_vs_flag]
			. = TRUE
		if("b_affects_vore_sprites") //CHOMP Addition
			host.vore_selected.affects_vore_sprites = !host.vore_selected.affects_vore_sprites
			host.update_fullness()
			. = TRUE
		if("b_count_absorbed_prey_for_sprites") //CHOMP Addition
			host.vore_selected.count_absorbed_prey_for_sprite = !host.vore_selected.count_absorbed_prey_for_sprite
			host.update_fullness()
			. = TRUE
		if("b_resist_animation") //CHOMP Addition
			host.vore_selected.resist_triggers_animation = !host.vore_selected.resist_triggers_animation
			. = TRUE
		if("b_size_factor_sprites") //CHOMP Addition
			var/size_factor_input = input(user, "Set the impact prey's size have on your vore sprite. 1 means no scaling, 0.5 means prey count half as much, 2 means prey count double. (Range from 0.1 - 3)", "Size Factor") as num|null
			if(!isnull(size_factor_input))
				host.vore_selected.size_factor_for_sprite = CLAMP(size_factor_input, 0.1, 3)
				host.update_fullness()
			. = TRUE
		if("b_tail_to_change_to") //CHOMP Addition
			var/tail_choice = tgui_input_list(usr, "Which tail sprite do you want to use when your [lowertext(host.vore_selected.name)] is filled?","Select Sprite", global.tail_styles_list)
			if(!tail_choice) //They cancelled, no changes
				return FALSE
			else
				host.vore_selected.tail_to_change_to = tail_choice
			. = TRUE
		if("b_tail_color") // CHOMP Addition
			var/newcolor = input(usr, "Choose tail color.", "", host.vore_selected.tail_colouration) as color|null
			if(newcolor)
				host.vore_selected.tail_colouration = newcolor
			update_preview_icon()
			. = TRUE
		if("b_tail_color2") // CHOMP Addition
			var/newcolor = input(usr, "Choose tail secondary color.", "", host.vore_selected.tail_extra_overlay) as color|null
			if(newcolor)
				host.vore_selected.tail_extra_overlay = newcolor
			update_preview_icon()
			. = TRUE
		if("b_tail_color3") // CHOMP Addition
			var/newcolor = input(usr, "Choose tail tertiary color.", "", host.vore_selected.tail_extra_overlay2) as color|null
			if(newcolor)
				host.vore_selected.tail_extra_overlay2 = newcolor
			update_preview_icon()
			. = TRUE

	if(.)
		unsaved_changes = TRUE

//CHOMPedit start: liquid belly procs
/datum/vore_look/proc/liq_set_attr(mob/user, params)
	if(!host.vore_selected)
		alert("No belly selected to modify.")
		return FALSE

	var/attr = params["liq_attribute"]
	switch(attr)
		if("b_show_liq")
			if(!host.vore_selected.show_liquids)
				host.vore_selected.show_liquids = 1
				to_chat(usr,"<span class='warning'>Your [lowertext(host.vore_selected.name)] now has liquid options.</span>")
			else
				host.vore_selected.show_liquids = 0
				to_chat(usr,"<span class='warning'>Your [lowertext(host.vore_selected.name)] no longer has liquid options.</span>")
			. = TRUE
		if("b_liq_reagent_gen")
			if(!host.vore_selected.reagentbellymode) //liquid container adjustments and interactions.
				host.vore_selected.reagentbellymode = 1
				to_chat(usr,"<span class='warning'>Your [lowertext(host.vore_selected.name)] now has interactions which can produce liquids.</span>")
			else //Doesnt produce liquids
				host.vore_selected.reagentbellymode = 0
				to_chat(usr,"<span class='warning'>Your [lowertext(host.vore_selected.name)] wont produce liquids, liquids already in your [lowertext(host.vore_selected.name)] must be emptied out or removed with purge.</span>")
			. = TRUE
		if("b_liq_reagent_type")
			var/list/menu_list = host.vore_selected.reagent_choices.Copy() //Useful if we want to make certain races, synths, borgs, and other things result in additional reagents to produce - Jack
			var/new_reagent = input("Choose Reagent (currently [host.vore_selected.reagent_chosen])") as null|anything in menu_list
			if(!new_reagent)
				return FALSE

			host.vore_selected.reagent_chosen = new_reagent
			host.vore_selected.ReagentSwitch() // For changing variables when a new reagent is chosen
			. = TRUE
		if("b_liq_reagent_name")
			var/new_name = html_encode(input(usr,"New name for liquid shown when transfering and dumping on floor (The actual liquid's name is still the same):","New Name") as text|null)

			if(length(new_name) > BELLIES_NAME_MAX || length(new_name) < BELLIES_NAME_MIN)
				alert("Entered name length invalid (must be longer than [BELLIES_NAME_MIN], no longer than [BELLIES_NAME_MAX]).","Error")
				return FALSE

			host.vore_selected.reagent_name = new_name
			. = TRUE
		if("b_liq_reagent_transfer_verb")
			var/new_verb = html_encode(input(usr,"New verb when liquid is transfered from this belly:","New Verb") as text|null)

			if(length(new_verb) > BELLIES_NAME_MAX || length(new_verb) < BELLIES_NAME_MIN)
				alert("Entered verb length invalid (must be longer than [BELLIES_NAME_MIN], no longer than [BELLIES_NAME_MAX]).","Error")
				return FALSE

			host.vore_selected.reagent_transfer_verb = new_verb
			. = TRUE
		if("b_liq_reagent_nutri_rate")
			host.vore_selected.gen_time_display = input(user, "Choose the time it takes to fill the belly from empty state using nutrition.", "Set Liquid Production Time.")  in list("10 minutes","30 minutes","1 hour","3 hours","6 hours","12 hours","24 hours")|null
			switch(host.vore_selected.gen_time_display)
				if("10 minutes")
					host.vore_selected.gen_time = 0
				if("30 minutes")
					host.vore_selected.gen_time = 2
				if("1 hour")
					host.vore_selected.gen_time = 5
				if("3 hours")
					host.vore_selected.gen_time = 17
				if("6 hours")
					host.vore_selected.gen_time = 35
				if("12 hours")
					host.vore_selected.gen_time = 71
				if("24 hours")
					host.vore_selected.gen_time = 143
				if(null)
					return FALSE
			. = TRUE
		if("b_liq_reagent_capacity")
			var/new_custom_vol = input(user, "Choose the amount of liquid the belly can contain at most. Ranges from 0 to 100.", "Set Custom Belly Capacity.", host.vore_selected.custom_max_volume) as num|null
			if(new_custom_vol == null)
				return FALSE
			var/new_new_custom_vol = CLAMP(new_custom_vol, 10, 100)
			host.vore_selected.custom_max_volume = new_new_custom_vol
			. = TRUE
		if("b_liq_sloshing")
			if(!host.vore_selected.vorefootsteps_sounds)
				host.vore_selected.vorefootsteps_sounds = 1
				to_chat(usr,"<span class='warning'>Your [lowertext(host.vore_selected.name)] can now make sounds when you walk around depending on how full you are.</span>")
			else
				host.vore_selected.vorefootsteps_sounds = 0
				to_chat(usr,"<span class='warning'>Your [lowertext(host.vore_selected.name)] wont make any liquid sounds no matter how full it is.</span>")
			. = TRUE
		if("b_liq_reagent_addons")
			var/list/menu_list = host.vore_selected.reagent_mode_flag_list.Copy()
			var/reagent_toggle_addon = input("Toggle Addon") as null|anything in menu_list
			if(!reagent_toggle_addon)
				return FALSE
			host.vore_selected.reagent_mode_flags ^= host.vore_selected.reagent_mode_flag_list[reagent_toggle_addon]
			. = TRUE
		if("b_liq_purge")
			var/alert = alert("Are you sure you want to delete the liquids in your [lowertext(host.vore_selected.name)]?","Confirmation","Delete","Cancel")
			if(!(alert == "Delete"))
				return FALSE
			else
				host.vore_selected.reagents.clear_reagents()
			. = TRUE

/datum/vore_look/proc/liq_set_msg(mob/user, params)
	if(!host.vore_selected)
		alert("No belly selected to modify.")
		return FALSE

	var/attr = params["liq_messages"]
	switch(attr)
		if("b_show_liq_fullness")
			if(!host.vore_selected.show_fullness_messages)
				host.vore_selected.show_fullness_messages = 1
				to_chat(usr,"<span class='warning'>Your [lowertext(host.vore_selected.name)] now has liquid examination options.</span>")
			else
				host.vore_selected.show_fullness_messages = 0
				to_chat(usr,"<span class='warning'>Your [lowertext(host.vore_selected.name)] no longer has liquid examination options.</span>")
			. = TRUE
		if("b_liq_msg_toggle1")
			host.vore_selected.liquid_fullness1_messages = !host.vore_selected.liquid_fullness1_messages
			. = TRUE
		if("b_liq_msg_toggle2")
			host.vore_selected.liquid_fullness2_messages = !host.vore_selected.liquid_fullness2_messages
			. = TRUE
		if("b_liq_msg_toggle3")
			host.vore_selected.liquid_fullness3_messages = !host.vore_selected.liquid_fullness3_messages
			. = TRUE
		if("b_liq_msg_toggle4")
			host.vore_selected.liquid_fullness4_messages = !host.vore_selected.liquid_fullness4_messages
			. = TRUE
		if("b_liq_msg_toggle5")
			host.vore_selected.liquid_fullness5_messages = !host.vore_selected.liquid_fullness5_messages
			. = TRUE
		if("b_liq_msg1")
			alert(user,"Setting abusive or deceptive messages will result in a ban. Consider this your warning. Max 150 characters per message, max 10 messages per topic.","Really, don't.")
			var/help = " Press enter twice to separate messages. '%pred' will be replaced with your name. '%prey' will be replaced with the prey's name. '%belly' will be replaced with your belly's name."

			var/new_message = input(user,"These are sent to people who examine you when this belly is 0 to 20% full. Write them in 3rd person ('Their %belly is bulging')."+help,"Liquid Examine Message (0 - 20%)",host.vore_selected.get_reagent_messages("full1")) as message
			if(new_message)
				host.vore_selected.set_reagent_messages(new_message,"full1")
			. = TRUE
		if("b_liq_msg2")
			alert(user,"Setting abusive or deceptive messages will result in a ban. Consider this your warning. Max 150 characters per message, max 10 messages per topic.","Really, don't.")
			var/help = " Press enter twice to separate messages. '%pred' will be replaced with your name. '%prey' will be replaced with the prey's name. '%belly' will be replaced with your belly's name."

			var/new_message = input(user,"These are sent to people who examine you when this belly is 20 to 40% full. Write them in 3rd person ('Their %belly is bulging')."+help,"Liquid Examine Message (20 - 40%)",host.vore_selected.get_reagent_messages("full2")) as message
			if(new_message)
				host.vore_selected.set_reagent_messages(new_message,"full2")
			. = TRUE
		if("b_liq_msg3")
			alert(user,"Setting abusive or deceptive messages will result in a ban. Consider this your warning. Max 150 characters per message, max 10 messages per topic.","Really, don't.")
			var/help = " Press enter twice to separate messages. '%pred' will be replaced with your name. '%prey' will be replaced with the prey's name. '%belly' will be replaced with your belly's name."

			var/new_message = input(user,"These are sent to people who examine you when this belly is 40 to 60% full. Write them in 3rd person ('Their %belly is bulging')."+help,"Liquid Examine Message (40 - 60%)",host.vore_selected.get_reagent_messages("full3")) as message
			if(new_message)
				host.vore_selected.set_reagent_messages(new_message,"full3")
			. = TRUE
		if("b_liq_msg4")
			alert(user,"Setting abusive or deceptive messages will result in a ban. Consider this your warning. Max 150 characters per message, max 10 messages per topic.","Really, don't.")
			var/help = " Press enter twice to separate messages. '%pred' will be replaced with your name. '%prey' will be replaced with the prey's name. '%belly' will be replaced with your belly's name."

			var/new_message = input(user,"These are sent to people who examine you when this belly is 60 to 80% full. Write them in 3rd person ('Their %belly is bulging')."+help,"Liquid Examine Message (60 - 80%)",host.vore_selected.get_reagent_messages("full4")) as message
			if(new_message)
				host.vore_selected.set_reagent_messages(new_message,"full4")
			. = TRUE
		if("b_liq_msg5")
			alert(user,"Setting abusive or deceptive messages will result in a ban. Consider this your warning. Max 150 characters per message, max 10 messages per topic.","Really, don't.")
			var/help = " Press enter twice to separate messages. '%pred' will be replaced with your name. '%prey' will be replaced with the prey's name. '%belly' will be replaced with your belly's name."

			var/new_message = input(user,"These are sent to people who examine you when this belly is 80 to 100% full. Write them in 3rd person ('Their %belly is bulging')."+help,"Liquid Examine Message (80 - 100%)",host.vore_selected.get_reagent_messages("full5")) as message
			if(new_message)
				host.vore_selected.set_reagent_messages(new_message,"full5")
			. = TRUE
//CHOMPedit end
