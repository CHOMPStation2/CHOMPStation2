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
	. += get_asset_datum(/datum/asset/spritesheet/vore_fixed) //Either this isn't working or my cache is corrupted and won't show them. //CHOMPedit

/datum/vore_look/tgui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
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

	var/is_dogborg = FALSE
	var/is_vore_simple_mob = FALSE
	if(isrobot(host))
		var/mob/living/silicon/robot/R = host
		is_dogborg = R.dogborg
	else if(istype(host, /mob/living/simple_mob/vore))	//So far, this does nothing. But, creating this for future belly work
		is_vore_simple_mob = TRUE
	data["host_mobtype"] = list(
		"is_dogborg" = is_dogborg,
		"is_vore_simple_mob" = is_vore_simple_mob
	)

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
			"is_feedable" = selected.is_feedable, //CHOMPAdd
			"egg_type" = selected.egg_type,
			"egg_name" = selected.egg_name, //CHOMPAdd
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
			"eating_privacy_local" = selected.eating_privacy_local,
			"silicon_belly_overlay_preference"	= selected.silicon_belly_overlay_preference,
			"visible_belly_minimum_prey"	= selected.visible_belly_minimum_prey,
			"overlay_min_prey_size"	= selected.overlay_min_prey_size,
			"override_min_prey_size" = selected.override_min_prey_size,
			"override_min_prey_num"	= selected.override_min_prey_num,
			//CHOMP add: vore sprite options and additional stuff
			"belly_fullscreen_color" = selected.belly_fullscreen_color,
			"belly_fullscreen_color2" = selected.belly_fullscreen_color2,
			"belly_fullscreen_color3" = selected.belly_fullscreen_color3,
			"belly_fullscreen_color4" = selected.belly_fullscreen_color4,
			"belly_fullscreen_alpha" = selected.belly_fullscreen_alpha,
			"colorization_enabled" = selected.colorization_enabled,
			"vorespawn_blacklist" = selected.vorespawn_blacklist,
			"sound_volume" = selected.sound_volume,
			"affects_voresprite" = selected.affects_vore_sprites,
			"absorbed_voresprite" = selected.count_absorbed_prey_for_sprite,
			"absorbed_multiplier" = selected.absorbed_multiplier,
			"liquid_voresprite" = selected.count_liquid_for_sprite,
			"liquid_multiplier" = selected.liquid_multiplier,
			"item_voresprite" = selected.count_items_for_sprite,
			"item_multiplier" = selected.item_multiplier,
			"health_voresprite" = selected.health_impacts_size,
			"resist_animation" = selected.resist_triggers_animation,
			"voresprite_size_factor" = selected.size_factor_for_sprite,
			"belly_sprite_to_affect" = selected.belly_sprite_to_affect,
			"undergarment_chosen" = selected.undergarment_chosen,
			"undergarment_if_none" = selected.undergarment_if_none || "None",
			"undergarment_color" = selected.undergarment_color,
			"belly_sprite_option_shown" = LAZYLEN(host.vore_icon_bellies) >= 1 ? TRUE : FALSE,
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
		selected_list["egg_name"] = selected.egg_name //CHOMPAdd
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
			selected_list["autotransfer"]["autotransferchance_secondary"] = selected.autotransferchance_secondary		//CHOMPAdd
			selected_list["autotransfer"]["autotransferlocation_secondary"] = selected.autotransferlocation_secondary	//CHOMPAdd
			selected_list["autotransfer"]["autotransfer_min_amount"] = selected.autotransfer_min_amount
			selected_list["autotransfer"]["autotransfer_max_amount"] = selected.autotransfer_max_amount

		selected_list["disable_hud"] = selected.disable_hud
		selected_list["colorization_enabled"] = selected.colorization_enabled
		selected_list["belly_fullscreen_color"] = selected.belly_fullscreen_color
		selected_list["belly_fullscreen_color2"] = selected.belly_fullscreen_color2
		selected_list["belly_fullscreen_color3"] = selected.belly_fullscreen_color3
		selected_list["belly_fullscreen_color4"] = selected.belly_fullscreen_color4
		selected_list["belly_fullscreen_alpha"] = selected.belly_fullscreen_alpha

		if(selected.colorization_enabled)
			selected_list["possible_fullscreens"] = icon_states('modular_chomp/icons/mob/screen_full_vore_ch.dmi') //Makes any icons inside of here selectable. //CHOMPedit
		else
			selected_list["possible_fullscreens"] = icon_states('icons/mob/screen_full_vore.dmi') //Where all upstream stomachs are stored. I'm not touching the chunks of comments below but they are inaccurate here.
			//INSERT COLORIZE-ONLY STOMACHS HERE.
			//This manually removed color-only stomachs from the above list.
			//For some reason, colorized stomachs have to be added to both colorized_vore(to be selected) and full_vore (to show the preview in tgui)
			//Why? I have no flipping clue. As you can see above, vore_colorized is included in the assets but isn't working. It makes no sense.
			//I can only imagine this is a BYOND/TGUI issue with the cache. If you can figure out how to fix this and make it so you only need to
			//include things in full_colorized_vore, that would be great. For now, this is the only workaround that I could get to work.
			selected_list["possible_fullscreens"] -= "a_synth_flesh_mono"
			selected_list["possible_fullscreens"] -= "a_synth_flesh_mono_hole"
			selected_list["possible_fullscreens"] -= "a_anim_belly"
			//INSERT COLORIZE-ONLY STOMACHS HERE

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
		"throw_vore" = host.throw_vore,
		"nutrition_message_visible" = host.nutrition_message_visible,
		"nutrition_messages" = host.nutrition_messages,
		"weight_message_visible" = host.weight_message_visible,
		"weight_messages" = host.weight_messages,
		"eating_privacy_global" = host.eating_privacy_global,
		//CHOMPEdit start, vore sprites
		"vore_sprite_color" = host.vore_sprite_color,
		"vore_sprite_multiply" = host.vore_sprite_multiply
		//CHOMPEdit end
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
		//CHOMPAdd Start
		if("importpanel")
			var/panel_choice = tgui_input_list(usr, "Belly Import", "Pick an option", list("Import all bellies from VRDB","Import one belly from VRDB"))
			if(!panel_choice) return
			var/pickOne = FALSE
			if(panel_choice == "Import one belly from VRDB")
				pickOne = TRUE
			var/input_file = input(usr,"Please choose a valid VRDB file to import from.","Belly Import") as file
			var/input_data
			try
				input_data = json_decode(file2text(input_file))
			catch(var/exception/e)
				tgui_alert_async(usr, "The supplied file contains errors: [e]", "Error!")
				return FALSE

			if(!islist(input_data))
				tgui_alert_async(usr, "The supplied file was not a valid VRDB file.", "Error!")
				return FALSE

			var/list/valid_names = list()
			var/list/valid_lists = list()
			var/list/updated = list()

			for(var/list/raw_list in input_data)
				if(length(valid_names) >= BELLIES_MAX) break
				if(!islist(raw_list)) continue
				if(!istext(raw_list["name"])) continue
				if(length(raw_list["name"]) > BELLIES_NAME_MAX || length(raw_list["name"]) < BELLIES_NAME_MIN) continue
				if(raw_list["name"] in valid_names) continue
				for(var/obj/belly/B in host.vore_organs)
					if(lowertext(B.name) == lowertext(raw_list["name"]))
						updated += raw_list["name"]
						break
				if(!pickOne && length(host.vore_organs)+length(valid_names)-length(updated) >= BELLIES_MAX) continue
				valid_names += raw_list["name"]
				valid_lists += list(raw_list)

			if(length(valid_names) == 0)
				tgui_alert_async(usr, "The supplied VRDB file does not contain any valid bellies.", "Error!")
				return FALSE

			if(pickOne)
				var/picked = tgui_input_list(usr, "Belly Import", "Which belly?", valid_names)
				if(!picked) return
				for(var/B in valid_lists)
					if(lowertext(picked) == lowertext(B["name"]))
						valid_names = list(picked)
						valid_lists = list(B)
						break
				if(picked in updated)
					updated = list(picked)
				else
					updated = list()

			var/list/alert_msg = list()
			if(length(valid_names)-length(updated) > 0)
				alert_msg += "add [length(valid_names)-length(updated)] new bell[length(valid_names)-length(updated) == 1 ? "y" : "ies"]"
			if(length(updated) > 0)
				alert_msg += "update [length(updated)] existing bell[length(updated) == 1 ? "y" : "ies"]. Please make sure you have saved a copy of your existing bellies"

			var/confirm = tgui_alert(host, "WARNING: This will [jointext(alert_msg," and ")]. You can revert the import by using the Reload Prefs button under Preferences as long as you don't Save Prefs. Are you sure?","Import bellies?",list("Yes","Cancel"))
			if(confirm != "Yes") return FALSE

			for(var/list/belly_data in valid_lists)
				var/obj/belly/new_belly
				for(var/obj/belly/existing_belly in host.vore_organs)
					if(lowertext(existing_belly.name) == lowertext(belly_data["name"]))
						new_belly = existing_belly
						break
				if(!new_belly && length(host.vore_organs) < BELLIES_MAX)
					new_belly = new(host)
					new_belly.name = belly_data["name"]
				if(!new_belly) continue

				// Controls
				if(istext(belly_data["mode"]))
					var/new_mode = html_encode(belly_data["mode"])
					if(new_mode in new_belly.digest_modes)
						new_belly.digest_mode = new_mode

				if(istext(belly_data["item_mode"]))
					var/new_item_mode = html_encode(belly_data["item_mode"])
					if(new_item_mode in new_belly.item_digest_modes)
						new_belly.item_digest_mode = new_item_mode

				if(islist(belly_data["addons"]))
					new_belly.mode_flags = 0
					new_belly.slow_digestion = FALSE
					new_belly.speedy_mob_processing = FALSE
					STOP_PROCESSING(SSbellies, new_belly)
					STOP_PROCESSING(SSobj, new_belly)
					START_PROCESSING(SSbellies, new_belly)
					for(var/addon in belly_data["addons"])
						new_belly.mode_flags += new_belly.mode_flag_list[addon]
						switch(addon)
							if("Slow Body Digestion")
								new_belly.slow_digestion = TRUE
							if("TURBO MODE")
								new_belly.speedy_mob_processing = TRUE
								STOP_PROCESSING(SSbellies, new_belly)
								START_PROCESSING(SSobj, new_belly)

				// Descriptions
				if(istext(belly_data["desc"]))
					var/new_desc = html_encode(belly_data["desc"])
					if(new_desc)
						new_desc = readd_quotes(new_desc)
					if(length(new_desc) > 0 && length(new_desc) <= BELLIES_DESC_MAX)
						new_belly.desc = new_desc

				if(istext(belly_data["absorbed_desc"]))
					var/new_absorbed_desc = html_encode(belly_data["absorbed_desc"])
					if(new_absorbed_desc)
						new_absorbed_desc = readd_quotes(new_absorbed_desc)
					if(length(new_absorbed_desc) > 0 && length(new_absorbed_desc) <= BELLIES_DESC_MAX)
						new_belly.absorbed_desc = new_absorbed_desc

				if(istext(belly_data["vore_verb"]))
					var/new_vore_verb = html_encode(belly_data["vore_verb"])
					if(new_vore_verb)
						new_vore_verb = readd_quotes(new_vore_verb)
					if(length(new_vore_verb) >= BELLIES_NAME_MIN && length(new_vore_verb) <= BELLIES_NAME_MAX)
						new_belly.vore_verb = new_vore_verb

				if(istext(belly_data["release_verb"]))
					var/new_release_verb = html_encode(belly_data["release_verb"])
					if(new_release_verb)
						new_release_verb = readd_quotes(new_release_verb)
					if(length(new_release_verb) >= BELLIES_NAME_MIN && length(new_release_verb) <= BELLIES_NAME_MAX)
						new_belly.release_verb = new_release_verb

				if(islist(belly_data["digest_messages_prey"]))
					var/new_digest_messages_prey = sanitize(jointext(belly_data["digest_messages_prey"],"\n\n"),MAX_MESSAGE_LEN,0,0,0)
					if(new_digest_messages_prey)
						new_belly.set_messages(new_digest_messages_prey,"dmp")

				if(islist(belly_data["digest_messages_owner"]))
					var/new_digest_messages_owner = sanitize(jointext(belly_data["digest_messages_owner"],"\n\n"),MAX_MESSAGE_LEN,0,0,0)
					if(new_digest_messages_owner)
						new_belly.set_messages(new_digest_messages_owner,"dmo")

				if(islist(belly_data["absorb_messages_prey"]))
					var/new_absorb_messages_prey = sanitize(jointext(belly_data["absorb_messages_prey"],"\n\n"),MAX_MESSAGE_LEN,0,0,0)
					if(new_absorb_messages_prey)
						new_belly.set_messages(new_absorb_messages_prey,"amp")

				if(islist(belly_data["absorb_messages_owner"]))
					var/new_absorb_messages_owner = sanitize(jointext(belly_data["absorb_messages_owner"],"\n\n"),MAX_MESSAGE_LEN,0,0,0)
					if(new_absorb_messages_owner)
						new_belly.set_messages(new_absorb_messages_owner,"amo")

				if(islist(belly_data["unabsorb_messages_prey"]))
					var/new_unabsorb_messages_prey = sanitize(jointext(belly_data["unabsorb_messages_prey"],"\n\n"),MAX_MESSAGE_LEN,0,0,0)
					if(new_unabsorb_messages_prey)
						new_belly.set_messages(new_unabsorb_messages_prey,"uamp")

				if(islist(belly_data["unabsorb_messages_owner"]))
					var/new_unabsorb_messages_owner = sanitize(jointext(belly_data["unabsorb_messages_owner"],"\n\n"),MAX_MESSAGE_LEN,0,0,0)
					if(new_unabsorb_messages_owner)
						new_belly.set_messages(new_unabsorb_messages_owner,"uamo")

				if(islist(belly_data["struggle_messages_outside"]))
					var/new_struggle_messages_outside = sanitize(jointext(belly_data["struggle_messages_outside"],"\n\n"),MAX_MESSAGE_LEN,0,0,0)
					if(new_struggle_messages_outside)
						new_belly.set_messages(new_struggle_messages_outside,"smo")

				if(islist(belly_data["struggle_messages_inside"]))
					var/new_struggle_messages_inside = sanitize(jointext(belly_data["struggle_messages_inside"],"\n\n"),MAX_MESSAGE_LEN,0,0,0)
					if(new_struggle_messages_inside)
						new_belly.set_messages(new_struggle_messages_inside,"smi")

				if(islist(belly_data["absorbed_struggle_messages_outside"]))
					var/new_absorbed_struggle_messages_outside = sanitize(jointext(belly_data["absorbed_struggle_messages_outside"],"\n\n"),MAX_MESSAGE_LEN,0,0,0)
					if(new_absorbed_struggle_messages_outside)
						new_belly.set_messages(new_absorbed_struggle_messages_outside,"asmo")

				if(islist(belly_data["absorbed_struggle_messages_inside"]))
					var/new_absorbed_struggle_messages_inside = sanitize(jointext(belly_data["absorbed_struggle_messages_inside"],"\n\n"),MAX_MESSAGE_LEN,0,0,0)
					if(new_absorbed_struggle_messages_inside)
						new_belly.set_messages(new_absorbed_struggle_messages_inside,"asmi")

				if(islist(belly_data["examine_messages"]))
					var/new_examine_messages = sanitize(jointext(belly_data["examine_messages"],"\n\n"),MAX_MESSAGE_LEN,0,0,0)
					if(new_examine_messages)
						new_belly.set_messages(new_examine_messages,"em")

				if(islist(belly_data["examine_messages_absorbed"]))
					var/new_examine_messages_absorbed = sanitize(jointext(belly_data["examine_messages_absorbed"],"\n\n"),MAX_MESSAGE_LEN,0,0,0)
					if(new_examine_messages_absorbed)
						new_belly.set_messages(new_examine_messages_absorbed,"ema")

				if(islist(belly_data["emotes_digest"]))
					var/new_emotes_digest = sanitize(jointext(belly_data["emotes_digest"],"\n\n"),MAX_MESSAGE_LEN,0,0,0)
					if(new_emotes_digest)
						new_belly.set_messages(new_emotes_digest,"im_digest")

				if(islist(belly_data["emotes_hold"]))
					var/new_emotes_hold = sanitize(jointext(belly_data["emotes_hold"],"\n\n"),MAX_MESSAGE_LEN,0,0,0)
					if(new_emotes_hold)
						new_belly.set_messages(new_emotes_hold,"im_hold")

				if(islist(belly_data["emotes_holdabsorbed"]))
					var/new_emotes_holdabsorbed = sanitize(jointext(belly_data["emotes_holdabsorbed"],"\n\n"),MAX_MESSAGE_LEN,0,0,0)
					if(new_emotes_holdabsorbed)
						new_belly.set_messages(new_emotes_holdabsorbed,"im_holdabsorbed")

				if(islist(belly_data["emotes_absorb"]))
					var/new_emotes_absorb = sanitize(jointext(belly_data["emotes_absorb"],"\n\n"),MAX_MESSAGE_LEN,0,0,0)
					if(new_emotes_absorb)
						new_belly.set_messages(new_emotes_absorb,"im_absorb")

				if(islist(belly_data["emotes_heal"]))
					var/new_emotes_heal = sanitize(jointext(belly_data["emotes_heal"],"\n\n"),MAX_MESSAGE_LEN,0,0,0)
					if(new_emotes_heal)
						new_belly.set_messages(new_emotes_heal,"im_heal")

				if(islist(belly_data["emotes_drain"]))
					var/new_emotes_drain = sanitize(jointext(belly_data["emotes_drain"],"\n\n"),MAX_MESSAGE_LEN,0,0,0)
					if(new_emotes_drain)
						new_belly.set_messages(new_emotes_drain,"im_drain")

				if(islist(belly_data["emotes_steal"]))
					var/new_emotes_steal = sanitize(jointext(belly_data["emotes_steal"],"\n\n"),MAX_MESSAGE_LEN,0,0,0)
					if(new_emotes_steal)
						new_belly.set_messages(new_emotes_steal,"im_steal")

				if(islist(belly_data["emotes_egg"]))
					var/new_emotes_egg = sanitize(jointext(belly_data["emotes_egg"],"\n\n"),MAX_MESSAGE_LEN,0,0,0)
					if(new_emotes_egg)
						new_belly.set_messages(new_emotes_egg,"im_egg")

				if(islist(belly_data["emotes_shrink"]))
					var/new_emotes_shrink = sanitize(jointext(belly_data["emotes_shrink"],"\n\n"),MAX_MESSAGE_LEN,0,0,0)
					if(new_emotes_shrink)
						new_belly.set_messages(new_emotes_shrink,"im_shrink")

				if(islist(belly_data["emotes_grow"]))
					var/new_emotes_grow = sanitize(jointext(belly_data["emotes_grow"],"\n\n"),MAX_MESSAGE_LEN,0,0,0)
					if(new_emotes_grow)
						new_belly.set_messages(new_emotes_grow,"im_grow")

				if(islist(belly_data["emotes_unabsorb"]))
					var/new_emotes_unabsorb = sanitize(jointext(belly_data["emotes_unabsorb"],"\n\n"),MAX_MESSAGE_LEN,0,0,0)
					if(new_emotes_unabsorb)
						new_belly.set_messages(new_emotes_unabsorb,"im_unabsorb")

				// Options
				if(isnum(belly_data["can_taste"]))
					var/new_can_taste = belly_data["can_taste"]
					if(new_can_taste == 0)
						new_belly.can_taste = FALSE
					if(new_can_taste == 1)
						new_belly.can_taste = TRUE

				if(isnum(belly_data["is_feedable"]))
					var/new_is_feedable = belly_data["is_feedable"]
					if(new_is_feedable == 0)
						new_belly.is_feedable = FALSE
					if(new_is_feedable == 1)
						new_belly.is_feedable = TRUE

				if(isnum(belly_data["contaminates"]))
					var/new_contaminates = belly_data["contaminates"]
					if(new_contaminates == 0)
						new_belly.contaminates = FALSE
					if(new_contaminates == 1)
						new_belly.contaminates = TRUE

				if(istext(belly_data["contamination_flavor"]))
					var/new_contamination_flavor = sanitize(belly_data["contamination_flavor"],MAX_MESSAGE_LEN,0,0,0)
					if(new_contamination_flavor)
						if(new_contamination_flavor in contamination_flavors)
							new_belly.contamination_flavor = new_contamination_flavor

				if(istext(belly_data["contamination_color"]))
					var/new_contamination_color = sanitize(belly_data["contamination_color"],MAX_MESSAGE_LEN,0,0,0)
					if(new_contamination_color)
						if(new_contamination_color in contamination_colors)
							new_belly.contamination_color = new_contamination_color

				if(isnum(belly_data["nutrition_percent"]))
					var/new_nutrition_percent = belly_data["nutrition_percent"]
					new_belly.nutrition_percent = CLAMP(new_nutrition_percent,0.01,100)

				if(isnum(belly_data["bulge_size"]))
					var/new_bulge_size = belly_data["bulge_size"]
					if(new_bulge_size == 0)
						new_belly.bulge_size = 0
					else
						new_belly.bulge_size = CLAMP(new_bulge_size,0.25,2)

				if(isnum(belly_data["display_absorbed_examine"]))
					var/new_display_absorbed_examine = belly_data["display_absorbed_examine"]
					if(new_display_absorbed_examine == 0)
						new_belly.display_absorbed_examine = FALSE
					if(new_display_absorbed_examine == 1)
						new_belly.display_absorbed_examine = TRUE

				if(isnum(belly_data["save_digest_mode"]))
					var/new_save_digest_mode = belly_data["save_digest_mode"]
					if(new_save_digest_mode == 0)
						new_belly.save_digest_mode = FALSE
					if(new_save_digest_mode == 1)
						new_belly.save_digest_mode = TRUE

				if(isnum(belly_data["emote_active"]))
					var/new_emote_active = belly_data["emote_active"]
					if(new_emote_active == 0)
						new_belly.emote_active = FALSE
					if(new_emote_active == 1)
						new_belly.emote_active = TRUE

				if(isnum(belly_data["emote_time"]))
					var/new_emote_time = belly_data["emote_time"]
					new_belly.emote_time = CLAMP(new_emote_time, 60, 600)

				if(isnum(belly_data["digest_brute"]))
					var/new_digest_brute = belly_data["digest_brute"]
					new_belly.digest_brute = CLAMP(new_digest_brute, 0, 6)

				if(isnum(belly_data["digest_burn"]))
					var/new_digest_burn = belly_data["digest_burn"]
					new_belly.digest_burn = CLAMP(new_digest_burn, 0, 6)

				if(isnum(belly_data["digest_oxy"]))
					var/new_digest_oxy = belly_data["digest_oxy"]
					new_belly.digest_oxy = CLAMP(new_digest_oxy, 0, 12)

				if(isnum(belly_data["digest_tox"]))
					var/new_digest_tox = belly_data["digest_tox"]
					new_belly.digest_tox = CLAMP(new_digest_tox, 0, 6)

				if(isnum(belly_data["digest_clone"]))
					var/new_digest_clone = belly_data["digest_clone"]
					new_belly.digest_clone = CLAMP(new_digest_clone, 0, 6)

				if(isnum(belly_data["shrink_grow_size"]))
					var/new_shrink_grow_size = belly_data["shrink_grow_size"]
					new_belly.shrink_grow_size = CLAMP(new_shrink_grow_size, 0.25, 2)

				if(isnum(belly_data["vorespawn_blacklist"]))
					var/new_vorespawn_blacklist = belly_data["vorespawn_blacklist"]
					if(new_vorespawn_blacklist == 0)
						new_belly.vorespawn_blacklist = FALSE
					if(new_vorespawn_blacklist == 1)
						new_belly.vorespawn_blacklist = TRUE

				if(istext(belly_data["egg_type"]))
					var/new_egg_type = sanitize(belly_data["egg_type"],MAX_MESSAGE_LEN,0,0,0)
					if(new_egg_type)
						if(new_egg_type in global_vore_egg_types)
							new_belly.egg_type = new_egg_type

				if(istext(belly_data["egg_name"]))
					var/new_egg_name = html_encode(belly_data["egg_name"])
					if(new_egg_name)
						new_egg_name = readd_quotes(new_egg_name)
					if(length(new_egg_name) >= BELLIES_NAME_MIN && length(new_egg_name) <= BELLIES_NAME_MAX)
						new_belly.egg_name = new_egg_name

				if(istext(belly_data["selective_preference"]))
					var/new_selective_preference = belly_data["selective_preference"]
					if(new_selective_preference == "Digest")
						new_belly.selective_preference = DM_DIGEST
					if(new_selective_preference == "Absorb")
						new_belly.selective_preference = DM_ABSORB

				// Sounds
				if(isnum(belly_data["is_wet"]))
					var/new_is_wet = belly_data["is_wet"]
					if(new_is_wet == 0)
						new_belly.is_wet = FALSE
					if(new_is_wet == 1)
						new_belly.is_wet = TRUE

				if(isnum(belly_data["wet_loop"]))
					var/new_wet_loop = belly_data["wet_loop"]
					if(new_wet_loop == 0)
						new_belly.wet_loop = FALSE
					if(new_wet_loop == 1)
						new_belly.wet_loop = TRUE

				if(isnum(belly_data["fancy_vore"]))
					var/new_fancy_vore = belly_data["fancy_vore"]
					if(new_fancy_vore == 0)
						new_belly.fancy_vore = FALSE
					if(new_fancy_vore == 1)
						new_belly.fancy_vore = TRUE

				if(new_belly.fancy_vore)
					if(!(new_belly.vore_sound in fancy_vore_sounds))
						new_belly.vore_sound = "Gulp"
					if(!(new_belly.release_sound in fancy_vore_sounds))
						new_belly.release_sound = "Splatter"
				else
					if(!(new_belly.vore_sound in classic_vore_sounds))
						new_belly.vore_sound = "Gulp"
					if(!(new_belly.release_sound in classic_vore_sounds))
						new_belly.release_sound = "Splatter"

				if(istext(belly_data["vore_sound"]))
					var/new_vore_sound = sanitize(belly_data["vore_sound"],MAX_MESSAGE_LEN,0,0,0)
					if(new_vore_sound)
						if (new_belly.fancy_vore && (new_vore_sound in fancy_vore_sounds))
							new_belly.vore_sound = new_vore_sound
						if (!new_belly.fancy_vore && (new_vore_sound in classic_vore_sounds))
							new_belly.vore_sound = new_vore_sound

				if(istext(belly_data["release_sound"]))
					var/new_release_sound = sanitize(belly_data["release_sound"],MAX_MESSAGE_LEN,0,0,0)
					if(new_release_sound)
						if (new_belly.fancy_vore && (new_release_sound in fancy_release_sounds))
							new_belly.release_sound = new_release_sound
						if (!new_belly.fancy_vore && (new_release_sound in classic_release_sounds))
							new_belly.release_sound = new_release_sound

				if(isnum(belly_data["sound_volume"]))
					var/new_sound_volume = belly_data["sound_volume"]
					new_belly.sound_volume = sanitize_integer(new_sound_volume, 0, 100, initial(new_belly.sound_volume))

				// Visuals
				if(isnum(belly_data["affects_vore_sprites"]))
					var/new_affects_vore_sprites = belly_data["affects_vore_sprites"]
					if(new_affects_vore_sprites == 0)
						new_belly.affects_vore_sprites = FALSE
					if(new_affects_vore_sprites == 1)
						new_belly.affects_vore_sprites = TRUE

				if(islist(belly_data["vore_sprite_flags"]))
					new_belly.vore_sprite_flags = 0
					for(var/sprite_flag in belly_data["vore_sprite_flags"])
						new_belly.vore_sprite_flags += new_belly.vore_sprite_flag_list[sprite_flag]

				if(isnum(belly_data["count_absorbed_prey_for_sprite"]))
					var/new_count_absorbed_prey_for_sprite = belly_data["count_absorbed_prey_for_sprite"]
					if(new_count_absorbed_prey_for_sprite == 0)
						new_belly.count_absorbed_prey_for_sprite = FALSE
					if(new_count_absorbed_prey_for_sprite == 1)
						new_belly.count_absorbed_prey_for_sprite = TRUE

				if(isnum(belly_data["absorbed_multiplier"]))
					var/new_absorbed_multiplier = belly_data["absorbed_multiplier"]
					new_belly.absorbed_multiplier = CLAMP(new_absorbed_multiplier, 0.1, 3)

				if(isnum(belly_data["count_liquid_for_sprite"]))
					var/new_count_liquid_for_sprite = belly_data["count_liquid_for_sprite"]
					if(new_count_liquid_for_sprite == 0)
						new_belly.count_liquid_for_sprite = FALSE
					if(new_count_liquid_for_sprite == 1)
						new_belly.count_liquid_for_sprite = TRUE

				if(isnum(belly_data["liquid_multiplier"]))
					var/new_liquid_multiplier = belly_data["liquid_multiplier"]
					new_belly.liquid_multiplier = CLAMP(new_liquid_multiplier, 0.1, 10)

				if(isnum(belly_data["count_items_for_sprite"]))
					var/new_count_items_for_sprite = belly_data["count_items_for_sprite"]
					if(new_count_items_for_sprite == 0)
						new_belly.count_items_for_sprite = FALSE
					if(new_count_items_for_sprite == 1)
						new_belly.count_items_for_sprite = TRUE

				if(isnum(belly_data["item_multiplier"]))
					var/new_item_multiplier = belly_data["item_multiplier"]
					new_belly.item_multiplier = CLAMP(new_item_multiplier, 0.1, 10)

				if(isnum(belly_data["health_impacts_size"]))
					var/new_health_impacts_size = belly_data["health_impacts_size"]
					if(new_health_impacts_size == 0)
						new_belly.health_impacts_size = FALSE
					if(new_health_impacts_size == 1)
						new_belly.health_impacts_size = TRUE

				if(isnum(belly_data["resist_triggers_animation"]))
					var/new_resist_triggers_animation = belly_data["resist_triggers_animation"]
					if(new_resist_triggers_animation == 0)
						new_belly.resist_triggers_animation = FALSE
					if(new_resist_triggers_animation == 1)
						new_belly.resist_triggers_animation = TRUE

				if(isnum(belly_data["size_factor_for_sprite"]))
					var/new_size_factor_for_sprite = belly_data["size_factor_for_sprite"]
					new_belly.size_factor_for_sprite = CLAMP(new_size_factor_for_sprite, 0.1, 3)

				if(istext(belly_data["belly_sprite_to_affect"]))
					var/new_belly_sprite_to_affect = sanitize(belly_data["belly_sprite_to_affect"],MAX_MESSAGE_LEN,0,0,0)
					if(new_belly_sprite_to_affect)
						if (new_belly_sprite_to_affect in host.vore_icon_bellies)
							new_belly.belly_sprite_to_affect = new_belly_sprite_to_affect

				if(istext(belly_data["undergarment_chosen"]))
					var/new_undergarment_chosen = sanitize(belly_data["undergarment_chosen"],MAX_MESSAGE_LEN,0,0,0)
					if(new_undergarment_chosen)
						for(var/datum/category_group/underwear/U in global_underwear.categories)
							if(lowertext(U.name) == lowertext(new_undergarment_chosen))
								new_belly.undergarment_chosen = U.name
								break

				var/datum/category_group/underwear/UWC = global_underwear.categories_by_name[new_belly.undergarment_chosen]
				var/invalid_if_none = TRUE
				for(var/datum/category_item/underwear/U in UWC.items)
					if(lowertext(U.name) == lowertext(new_belly.undergarment_if_none))
						invalid_if_none = FALSE
						break
				if(invalid_if_none)
					new_belly.undergarment_if_none = null

				if(istext(belly_data["undergarment_if_none"]))
					var/new_undergarment_if_none = sanitize(belly_data["undergarment_if_none"],MAX_MESSAGE_LEN,0,0,0)
					if(new_undergarment_if_none)
						for(var/datum/category_item/underwear/U in UWC.items)
							if(lowertext(U.name) == lowertext(new_undergarment_if_none))
								new_belly.undergarment_if_none = U.name
								break

				if(istext(belly_data["undergarment_color"]))
					var/new_undergarment_color = sanitize_hexcolor(belly_data["undergarment_color"],new_belly.undergarment_color)
					new_belly.undergarment_color = new_undergarment_color
				/* These don't seem to actually be available yet
				if(istext(belly_data["tail_to_change_to"]))
					var/new_tail_to_change_to = sanitize(belly_data["tail_to_change_to"],MAX_MESSAGE_LEN,0,0,0)
					if(new_tail_to_change_to)
						if (new_tail_to_change_to in tail_styles_list)
							new_belly.tail_to_change_to = new_tail_to_change_to

				if(istext(belly_data["tail_colouration"]))
					var/new_tail_colouration = sanitize_hexcolor(belly_data["tail_colouration"],new_belly.tail_colouration)
					new_belly.tail_colouration = new_tail_colouration

				if(istext(belly_data["tail_extra_overlay"]))
					var/new_tail_extra_overlay = sanitize_hexcolor(belly_data["tail_extra_overlay"],new_belly.tail_extra_overlay)
					new_belly.tail_extra_overlay = new_tail_extra_overlay

				if(istext(belly_data["tail_extra_overlay2"]))
					var/new_tail_extra_overlay2 = sanitize_hexcolor(belly_data["tail_extra_overlay2"],new_belly.tail_extra_overlay2)
					new_belly.tail_extra_overlay2 = new_tail_extra_overlay2
				*/
				if(istext(belly_data["belly_fullscreen_color"]))
					var/new_belly_fullscreen_color = sanitize_hexcolor(belly_data["belly_fullscreen_color"],new_belly.belly_fullscreen_color)
					new_belly.belly_fullscreen_color = new_belly_fullscreen_color

				if(istext(belly_data["belly_fullscreen_color2"]))
					var/new_belly_fullscreen_color2 = sanitize_hexcolor(belly_data["belly_fullscreen_color2"],new_belly.belly_fullscreen_color2)
					new_belly.belly_fullscreen_color2 = new_belly_fullscreen_color2

				if(istext(belly_data["belly_fullscreen_color3"]))
					var/new_belly_fullscreen_color3 = sanitize_hexcolor(belly_data["belly_fullscreen_color3"],new_belly.belly_fullscreen_color3)
					new_belly.belly_fullscreen_color3 = new_belly_fullscreen_color3

				if(istext(belly_data["belly_fullscreen_color4"]))
					var/new_belly_fullscreen_color4 = sanitize_hexcolor(belly_data["belly_fullscreen_color4"],new_belly.belly_fullscreen_color4)
					new_belly.belly_fullscreen_color4 = new_belly_fullscreen_color4

				if(istext(belly_data["belly_fullscreen_alpha"]))
					var/new_belly_fullscreen_alpha = sanitize_integer(belly_data["belly_fullscreen_alpha"],0,255,initial(new_belly.belly_fullscreen_alpha))
					new_belly.belly_fullscreen_alpha = new_belly_fullscreen_alpha

				if(isnum(belly_data["colorization_enabled"]))
					var/new_colorization_enabled = belly_data["colorization_enabled"]
					if(new_colorization_enabled == 0)
						new_belly.colorization_enabled = FALSE
					if(new_colorization_enabled == 1)
						new_belly.colorization_enabled = TRUE

				if(isnum(belly_data["disable_hud"]))
					var/new_disable_hud = belly_data["disable_hud"]
					if(new_disable_hud == 0)
						new_belly.disable_hud = FALSE
					if(new_disable_hud == 1)
						new_belly.disable_hud = TRUE

				var/possible_fullscreens = icon_states('modular_chomp/icons/mob/screen_full_vore_ch.dmi')
				if(!new_belly.colorization_enabled)
					possible_fullscreens = icon_states('icons/mob/screen_full_vore.dmi')
					possible_fullscreens -= "a_synth_flesh_mono"
					possible_fullscreens -= "a_synth_flesh_mono_hole"
					possible_fullscreens -= "a_anim_belly"
				if(!(new_belly.belly_fullscreen in possible_fullscreens))
					new_belly.belly_fullscreen = ""

				if(istext(belly_data["belly_fullscreen"]))
					var/new_belly_fullscreen = sanitize(belly_data["belly_fullscreen"],MAX_MESSAGE_LEN,0,0,0)
					if(new_belly_fullscreen)
						if(new_belly_fullscreen in possible_fullscreens)
							new_belly.belly_fullscreen = new_belly_fullscreen

				// Interactions
				if(isnum(belly_data["escapable"]))
					var/new_escapable = belly_data["escapable"]
					if(new_escapable == 0)
						new_belly.escapable = FALSE
					if(new_escapable == 1)
						new_belly.escapable = TRUE

				if(isnum(belly_data["escapechance"]))
					var/new_escapechance = belly_data["escapechance"]
					new_belly.escapechance = sanitize_integer(new_escapechance, 0, 100, initial(new_belly.escapechance))

				if(isnum(belly_data["escapetime"]))
					var/new_escapetime = belly_data["escapetime"]
					new_belly.escapetime = sanitize_integer(new_escapetime*10, 10, 600, initial(new_belly.escapetime))

				if(isnum(belly_data["transferchance"]))
					var/new_transferchance = belly_data["transferchance"]
					new_belly.transferchance = sanitize_integer(new_transferchance, 0, 100, initial(new_belly.transferchance))

				if(istext(belly_data["transferlocation"]))
					var/new_transferlocation = sanitize(belly_data["transferlocation"],MAX_MESSAGE_LEN,0,0,0)
					if(new_transferlocation)
						for(var/obj/belly/existing_belly in host.vore_organs)
							if(existing_belly.name == new_transferlocation)
								new_belly.transferlocation = new_transferlocation
								break
						if(new_transferlocation in valid_names)
							new_belly.transferlocation = new_transferlocation
						if(new_transferlocation == new_belly.name)
							new_belly.transferlocation = null

				if(isnum(belly_data["transferchance_secondary"]))
					var/new_transferchance_secondary = belly_data["transferchance_secondary"]
					new_belly.transferchance_secondary = sanitize_integer(new_transferchance_secondary, 0, 100, initial(new_belly.transferchance_secondary))

				if(istext(belly_data["transferlocation_secondary"]))
					var/new_transferlocation_secondary = sanitize(belly_data["transferlocation_secondary"],MAX_MESSAGE_LEN,0,0,0)
					if(new_transferlocation_secondary)
						for(var/obj/belly/existing_belly in host.vore_organs)
							if(existing_belly.name == new_transferlocation_secondary)
								new_belly.transferlocation_secondary = new_transferlocation_secondary
								break
						if(new_transferlocation_secondary in valid_names)
							new_belly.transferlocation_secondary = new_transferlocation_secondary
						if(new_transferlocation_secondary == new_belly.name)
							new_belly.transferlocation_secondary = null

				if(isnum(belly_data["absorbchance"]))
					var/new_absorbchance = belly_data["absorbchance"]
					new_belly.absorbchance = sanitize_integer(new_absorbchance, 0, 100, initial(new_belly.absorbchance))

				if(isnum(belly_data["digestchance"]))
					var/new_digestchance = belly_data["digestchance"]
					new_belly.digestchance = sanitize_integer(new_digestchance, 0, 100, initial(new_belly.digestchance))

				if(isnum(belly_data["autotransfer_enabled"]))
					var/new_autotransfer_enabled = belly_data["autotransfer_enabled"]
					if(new_autotransfer_enabled == 0)
						new_belly.autotransfer_enabled = FALSE
					if(new_autotransfer_enabled == 1)
						new_belly.autotransfer_enabled = TRUE

				if(isnum(belly_data["autotransferwait"]))
					var/new_autotransferwait = belly_data["autotransferwait"]
					new_belly.autotransferwait = sanitize_integer(new_autotransferwait*10, 10, 18000, initial(new_belly.autotransferwait))

				if(isnum(belly_data["autotransferchance"]))
					var/new_autotransferchance = belly_data["autotransferchance"]
					new_belly.autotransferchance = sanitize_integer(new_autotransferchance, 0, 100, initial(new_belly.autotransferchance))

				if(istext(belly_data["autotransferlocation"]))
					var/new_autotransferlocation = sanitize(belly_data["autotransferlocation"],MAX_MESSAGE_LEN,0,0,0)
					if(new_autotransferlocation)
						for(var/obj/belly/existing_belly in host.vore_organs)
							if(existing_belly.name == new_autotransferlocation)
								new_belly.autotransferlocation = new_autotransferlocation
								break
						if(new_autotransferlocation in valid_names)
							new_belly.autotransferlocation = new_autotransferlocation
						if(new_autotransferlocation == new_belly.name)
							new_belly.autotransferlocation = null

				if(isnum(belly_data["autotransferchance_secondary"]))
					var/new_autotransferchance_secondary = belly_data["autotransferchance_secondary"]
					new_belly.autotransferchance_secondary = sanitize_integer(new_autotransferchance_secondary, 0, 100, initial(new_belly.autotransferchance_secondary))

				if(istext(belly_data["autotransferlocation_secondary"]))
					var/new_autotransferlocation_secondary = sanitize(belly_data["autotransferlocation_secondary"],MAX_MESSAGE_LEN,0,0,0)
					if(new_autotransferlocation_secondary)
						for(var/obj/belly/existing_belly in host.vore_organs)
							if(existing_belly.name == new_autotransferlocation_secondary)
								new_belly.autotransferlocation_secondary = new_autotransferlocation_secondary
								break
						if(new_autotransferlocation_secondary in valid_names)
							new_belly.autotransferlocation_secondary = new_autotransferlocation_secondary
						if(new_autotransferlocation_secondary == new_belly.name)
							new_belly.autotransferlocation_secondary = null

				if(isnum(belly_data["autotransfer_min_amount"]))
					var/new_autotransfer_min_amount = belly_data["autotransfer_min_amount"]
					new_belly.autotransfer_min_amount = sanitize_integer(new_autotransfer_min_amount, 0, 100, initial(new_belly.autotransfer_min_amount))

				if(isnum(belly_data["autotransfer_max_amount"]))
					var/new_autotransfer_max_amount = belly_data["autotransfer_max_amount"]
					new_belly.autotransfer_max_amount = sanitize_integer(new_autotransfer_max_amount, 0, 100, initial(new_belly.autotransfer_max_amount))

				// Liquid Options
				if(isnum(belly_data["show_liquids"]))
					var/new_show_liquids = belly_data["show_liquids"]
					if(new_show_liquids == 0)
						new_belly.show_liquids = FALSE
					if(new_show_liquids == 1)
						new_belly.show_liquids = TRUE

				if(isnum(belly_data["reagentbellymode"]))
					var/new_reagentbellymode = belly_data["reagentbellymode"]
					if(new_reagentbellymode == 0)
						new_belly.reagentbellymode = FALSE
					if(new_reagentbellymode == 1)
						new_belly.reagentbellymode = TRUE

				if(istext(belly_data["reagent_chosen"]))
					var/new_reagent_chosen = sanitize(belly_data["reagent_chosen"],MAX_MESSAGE_LEN,0,0,0)
					if(new_reagent_chosen)
						if(new_reagent_chosen in new_belly.reagent_choices)
							new_belly.reagent_chosen = new_reagent_chosen
							new_belly.ReagentSwitch()

				if(istext(belly_data["reagent_name"]))
					var/new_reagent_name = html_encode(belly_data["reagent_name"])
					if(new_reagent_name)
						new_reagent_name = readd_quotes(new_reagent_name)
					if(length(new_reagent_name) >= BELLIES_NAME_MIN && length(new_reagent_name) <= BELLIES_NAME_MAX)
						new_belly.reagent_name = new_reagent_name

				if(istext(belly_data["reagent_transfer_verb"]))
					var/new_reagent_transfer_verb = html_encode(belly_data["reagent_transfer_verb"])
					if(new_reagent_transfer_verb)
						new_reagent_transfer_verb = readd_quotes(new_reagent_transfer_verb)
					if(length(new_reagent_transfer_verb) >= BELLIES_NAME_MIN && length(new_reagent_transfer_verb) <= BELLIES_NAME_MAX)
						new_belly.reagent_transfer_verb = new_reagent_transfer_verb

				if(istext(belly_data["gen_time_display"]))
					var/new_gen_time_display = sanitize(belly_data["gen_time_display"],MAX_MESSAGE_LEN,0,0,0)
					if(new_gen_time_display)
						if(new_gen_time_display in list("10 minutes","30 minutes","1 hour","3 hours","6 hours","12 hours","24 hours"))
							new_belly.gen_time_display = new_gen_time_display
							switch(new_gen_time_display)
								if("10 minutes")
									new_belly.gen_time = 0
								if("30 minutes")
									new_belly.gen_time = 2
								if("1 hour")
									new_belly.gen_time = 5
								if("3 hours")
									new_belly.gen_time = 17
								if("6 hours")
									new_belly.gen_time = 35
								if("12 hours")
									new_belly.gen_time = 71
								if("24 hours")
									new_belly.gen_time = 143

				if(isnum(belly_data["custom_max_volume"]))
					var/new_custom_max_volume = belly_data["custom_max_volume"]
					new_belly.custom_max_volume = CLAMP(new_custom_max_volume, 10, 300)

				if(isnum(belly_data["vorefootsteps_sounds"]))
					var/new_vorefootsteps_sounds = belly_data["vorefootsteps_sounds"]
					if(new_vorefootsteps_sounds == 0)
						new_belly.vorefootsteps_sounds = FALSE
					if(new_vorefootsteps_sounds == 1)
						new_belly.vorefootsteps_sounds = TRUE

				if(islist(belly_data["reagent_mode_flag_list"]))
					new_belly.reagent_mode_flags = 0
					for(var/reagent_flag in belly_data["reagent_mode_flag_list"])
						new_belly.reagent_mode_flags += new_belly.reagent_mode_flag_list[reagent_flag]

				// Liquid Messages
				if(isnum(belly_data["show_fullness_messages"]))
					var/new_show_fullness_messages = belly_data["show_fullness_messages"]
					if(new_show_fullness_messages == 0)
						new_belly.show_fullness_messages = FALSE
					if(new_show_fullness_messages == 1)
						new_belly.show_fullness_messages = TRUE

				if(isnum(belly_data["liquid_fullness1_messages"]))
					var/new_liquid_fullness1_messages = belly_data["liquid_fullness1_messages"]
					if(new_liquid_fullness1_messages == 0)
						new_belly.liquid_fullness1_messages = FALSE
					if(new_liquid_fullness1_messages == 1)
						new_belly.liquid_fullness1_messages = TRUE

				if(isnum(belly_data["liquid_fullness2_messages"]))
					var/new_liquid_fullness2_messages = belly_data["liquid_fullness2_messages"]
					if(new_liquid_fullness2_messages == 0)
						new_belly.liquid_fullness2_messages = FALSE
					if(new_liquid_fullness2_messages == 1)
						new_belly.liquid_fullness2_messages = TRUE

				if(isnum(belly_data["liquid_fullness3_messages"]))
					var/new_liquid_fullness3_messages = belly_data["liquid_fullness3_messages"]
					if(new_liquid_fullness3_messages == 0)
						new_belly.liquid_fullness3_messages = FALSE
					if(new_liquid_fullness3_messages == 1)
						new_belly.liquid_fullness3_messages = TRUE

				if(isnum(belly_data["liquid_fullness4_messages"]))
					var/new_liquid_fullness4_messages = belly_data["liquid_fullness4_messages"]
					if(new_liquid_fullness4_messages == 0)
						new_belly.liquid_fullness4_messages = FALSE
					if(new_liquid_fullness4_messages == 1)
						new_belly.liquid_fullness4_messages = TRUE

				if(isnum(belly_data["liquid_fullness5_messages"]))
					var/new_liquid_fullness5_messages = belly_data["liquid_fullness5_messages"]
					if(new_liquid_fullness5_messages == 0)
						new_belly.liquid_fullness5_messages = FALSE
					if(new_liquid_fullness5_messages == 1)
						new_belly.liquid_fullness5_messages = TRUE

				if(islist(belly_data["fullness1_messages"]))
					var/new_fullness1_messages = sanitize(jointext(belly_data["fullness1_messages"],"\n\n"),MAX_MESSAGE_LEN,0,0,0)
					if(new_fullness1_messages)
						new_belly.set_reagent_messages(new_fullness1_messages,"full1")

				if(islist(belly_data["fullness2_messages"]))
					var/new_fullness2_messages = sanitize(jointext(belly_data["fullness2_messages"],"\n\n"),MAX_MESSAGE_LEN,0,0,0)
					if(new_fullness2_messages)
						new_belly.set_reagent_messages(new_fullness2_messages,"full2")

				if(islist(belly_data["fullness3_messages"]))
					var/new_fullness3_messages = sanitize(jointext(belly_data["fullness3_messages"],"\n\n"),MAX_MESSAGE_LEN,0,0,0)
					if(new_fullness3_messages)
						new_belly.set_reagent_messages(new_fullness3_messages,"full3")

				if(islist(belly_data["fullness4_messages"]))
					var/new_fullness4_messages = sanitize(jointext(belly_data["fullness4_messages"],"\n\n"),MAX_MESSAGE_LEN,0,0,0)
					if(new_fullness4_messages)
						new_belly.set_reagent_messages(new_fullness4_messages,"full4")

				if(islist(belly_data["fullness5_messages"]))
					var/new_fullness5_messages = sanitize(jointext(belly_data["fullness5_messages"],"\n\n"),MAX_MESSAGE_LEN,0,0,0)
					if(new_fullness5_messages)
						new_belly.set_reagent_messages(new_fullness5_messages,"full5")

				// After import updates
				new_belly.items_preserved.Cut()
				new_belly.update_internal_overlay()

			host.update_fullness()
			host.updateVRPanel()
			unsaved_changes = TRUE
			return TRUE
		//CHOMPAdd End
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
		if("toggle_global_privacy")
			host.eating_privacy_global = !host.eating_privacy_global
			if(host.client.prefs_vr)
				host.eating_privacy_global = host.eating_privacy_global
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
			if (isbelly(host.loc)) //CHOMPEdit
				var/obj/belly/B = host.loc
				B.vore_fx(host, TRUE)
			else
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
		if("toggle_throw_vore")
			host.throw_vore = !host.throw_vore
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
		//CHOMPEdit start - vore sprites color
		if("set_vs_color")
			var/belly_choice = tgui_input_list(usr, "Which vore sprite are you going to edit the color of?", "Vore Sprite Color", host.vore_icon_bellies)
			var/newcolor = input(usr, "Choose a color.", "", host.vore_sprite_color[belly_choice]) as color|null
			if(newcolor)
				host.vore_sprite_color[belly_choice] = newcolor
				var/multiply = tgui_input_list(usr, "Set the color to be applied multiplicatively or additively? Currently in [host.vore_sprite_multiply[belly_choice] ? "Multiply" : "Add"]", "Vore Sprite Color", list("Multiply", "Add"))
				if(multiply == "Multiply")
					host.vore_sprite_multiply[belly_choice] = TRUE
				else if(multiply == "Add")
					host.vore_sprite_multiply[belly_choice] = FALSE
				host.update_icons_body()
			return TRUE
		//CHOMPEdit end

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
	//CHOMPEdit Begin - Add Reforming
	if(isobserver(target) || istype(target,/obj/item/device/mmi))
		available_options += "Reform"
	//CHOMPEdit End
	if(isliving(target))
		var/mob/living/datarget = target
		if(datarget.client)
			available_options += "Process"
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
			belly_owner = tgui_input_list(user, "Who do you want to receive the target?", "Select Predator", viable_candidates)

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

		//CHOMPEdit Begin - Add Reforming
		if("Reform")
			if(host.stat)
				to_chat(user,"<span class='warning'>You can't do that in your state!</span>")
				return TRUE

			if(isobserver(target))
				var/mob/observer/T = target
				if(!ismob(T.body_backup) || prevent_respawns.Find(T.mind.name) || ispAI(T.body_backup))
					to_chat(user,"<span class='warning'>They don't seem to be reformable!</span>")
					return TRUE

				var/accepted = tgui_alert(T, "[host] is trying to reform your body! Would you like to get reformed inside [host]'s [lowertext(host.vore_selected.name)]?", "Reforming Attempt", list("Yes", "No"))
				if(accepted != "Yes")
					to_chat(user,"<span class='warning'>[T] refused to be reformed!</span>")
					return TRUE

				if(isliving(T.body_backup))
					var/mob/living/body_backup = T.body_backup
					if(ishuman(body_backup))
						var/mob/living/carbon/human/H = body_backup
						body_backup.adjustBruteLoss(-6)
						body_backup.adjustFireLoss(-6)
						body_backup.setOxyLoss(0)
						if(H.isSynthetic())
							H.adjustToxLoss(-H.getToxLoss())
						else
							H.adjustToxLoss(-6)
						body_backup.adjustCloneLoss(-6)
						body_backup.updatehealth()
						// Now we do the check to see if we should revive...
						var/should_proceed_with_revive = TRUE
						var/obj/item/organ/internal/brain/brain = H.internal_organs_by_name[O_BRAIN]
						should_proceed_with_revive &&= !H.should_have_organ(O_BRAIN) || (brain && (!istype(brain) || brain.defib_timer > 0))
						if(!H.isSynthetic())
							should_proceed_with_revive &&= !(HUSK in H.mutations) && H.can_defib
						if(should_proceed_with_revive)
							for(var/organ_tag in H.species.has_organ)
								var/obj/item/organ/O = H.species.has_organ[organ_tag]
								var/vital = initial(O.vital) //check for vital organs
								if(vital)
									O = H.internal_organs_by_name[organ_tag]
									if(!O || O.damage > O.max_damage)
										should_proceed_with_revive = FALSE
										break
						if(should_proceed_with_revive)
							dead_mob_list.Remove(H)
							if((H in living_mob_list) || (H in dead_mob_list))
								WARNING("Mob [H] was defibbed but already in the living or dead list still!")
							living_mob_list += H

							H.timeofdeath = 0
							H.set_stat(UNCONSCIOUS) //Life() can bring them back to consciousness if it needs to.
							H.failed_last_breath = 0 //So mobs that died of oxyloss don't revive and have perpetual out of breath.
							H.reload_fullscreen()
					else
						body_backup.revive()
					body_backup.forceMove(T.loc)
					body_backup.enabled = TRUE
					body_backup.ajourn = 0
					body_backup.key = T.key
					body_backup.teleop = null
					T.body_backup = null
					host.vore_selected.release_specific_contents(T, TRUE)
					if(istype(body_backup, /mob/living/simple_mob))
						var/mob/living/simple_mob/sm = body_backup
						if(sm.icon_rest && sm.resting)
							sm.icon_state = sm.icon_rest
						else
							sm.icon_state = sm.icon_living
					T.update_icon()
					announce_ghost_joinleave(T.mind, 0, "They now occupy their body again.")
			else if(istype(target,/obj/item/device/mmi)) // A good bit of repeated code, sure, but... cleanest way to do this.
				var/obj/item/device/mmi/MMI = target
				if(!ismob(MMI.body_backup) || !MMI.brainmob.mind || prevent_respawns.Find(MMI.brainmob.mind.name))
					to_chat(user,"<span class='warning'>They don't seem to be reformable!</span>")
					return TRUE
				var/accepted = tgui_alert(MMI.brainmob, "[host] is trying to reform your body! Would you like to get reformed inside [host]'s [lowertext(host.vore_selected.name)]?", "Reforming Attempt", list("Yes", "No"))
				if(accepted != "Yes")
					to_chat(user,"<span class='warning'>[MMI] refused to be reformed!</span>")
					return TRUE

				if(isliving(MMI.body_backup))
					var/mob/living/body_backup = MMI.body_backup
					body_backup.enabled = TRUE
					body_backup.forceMove(MMI.loc)
					body_backup.ajourn = 0
					body_backup.teleop = null
					//And now installing the MMI into the body...
					if(isrobot(body_backup)) //Just do the reverse of getting the MMI pulled out in /obj/belly/proc/digestion_death
						var/mob/living/silicon/robot/R = body_backup
						R.revive()
						MMI.brainmob.mind.transfer_to(R)
						MMI.loc = R
						R.mmi = MMI
						R.mmi.brainmob.add_language("Robot Talk")
					else //reference /datum/surgery_step/robotics/install_mmi/end_step
						var/obj/item/organ/internal/mmi_holder/holder
						if(istype(MMI, /obj/item/device/mmi/digital/posibrain))
							var/obj/item/organ/internal/mmi_holder/posibrain/holdertmp = new(body_backup, 1)
							holder = holdertmp
						else if(istype(MMI, /obj/item/device/mmi/digital/robot))
							var/obj/item/organ/internal/mmi_holder/robot/holdertmp = new(body_backup, 1)
							holder = holdertmp
						else
							holder = new(body_backup, 1)
						body_backup.internal_organs_by_name["brain"] = holder
						MMI.loc = holder
						holder.stored_mmi = MMI
						holder.update_from_mmi()

						if(MMI.brainmob && MMI.brainmob.mind)
							MMI.brainmob.mind.transfer_to(body_backup)
							body_backup.languages = MMI.brainmob.languages
						//You've hopefully already named yourself, so... not implementing that bit.
						var/mob/living/carbon/human/H = body_backup
						body_backup.adjustBruteLoss(-6, TRUE)
						body_backup.adjustFireLoss(-6, TRUE)
						body_backup.setOxyLoss(0)
						H.adjustToxLoss(-H.getToxLoss())
						body_backup.adjustCloneLoss(-6)
						body_backup.updatehealth()
						// Now we do the check to see if we should revive...
						var/should_proceed_with_revive = TRUE
						var/obj/item/organ/internal/brain/brain = H.internal_organs_by_name[O_BRAIN]
						should_proceed_with_revive &&= !H.should_have_organ(O_BRAIN) || (brain && brain.defib_timer > 0 )
						if(should_proceed_with_revive)
							for(var/organ_tag in H.species.has_organ)
								var/obj/item/organ/O = H.species.has_organ[organ_tag]
								var/vital = initial(O.vital) //check for vital organs
								if(vital)
									O = H.internal_organs_by_name[organ_tag]
									if(!O || O.damage > O.max_damage)
										should_proceed_with_revive = FALSE
										break
						if(should_proceed_with_revive)
							dead_mob_list.Remove(H)
							if((H in living_mob_list) || (H in dead_mob_list))
								WARNING("Mob [H] was defibbed but already in the living or dead list still!")
							living_mob_list += H

							H.timeofdeath = 0
							H.set_stat(UNCONSCIOUS) //Life() can bring them back to consciousness if it needs to.
							H.failed_last_breath = 0 //So mobs that died of oxyloss don't revive and have perpetual out of breath.
							H.reload_fullscreen()
					MMI.body_backup = null
			return TRUE
		//CHOMPEdit End
		if("Process")
			var/mob/living/ourtarget = target
			var/list/process_options = list()

			if(ourtarget.digestable)
				process_options += "Digest"

			if(ourtarget.absorbable)
				process_options += "Absorb"

			if(process_options.len)
				process_options += "Cancel"
			else
				to_chat(usr, "<span class= 'warning'>You cannot instantly process [ourtarget].</span>")
				return

			var/ourchoice = tgui_input_list(usr, "How would you prefer to process \the [target]? This will perform the given action instantly if the prey accepts.","Instant Process", process_options)
			if(!ourchoice)
				return
			if(!ourtarget.client)
				to_chat(usr, "<span class= 'warning'>You cannot instantly process [ourtarget].</span>")
				return
			var/obj/belly/b = ourtarget.loc
			switch(ourchoice)
				if("Digest")
					if(ourtarget.absorbed)
						to_chat(usr, "<span class= 'warning'>\The [ourtarget] is absorbed, and cannot presently be digested.</span>")
						return
					if(tgui_alert(ourtarget, "\The [usr] is attempting to instantly digest you. Is this something you are okay with happening to you?","Instant Digest", list("No", "Yes")) != "Yes")
						to_chat(usr, "<span class= 'warning'>\The [ourtarget] declined your digest attempt.</span>")
						to_chat(ourtarget, "<span class= 'warning'>You declined the digest attempt.</span>")
						return
					if(ourtarget.loc != b)
						to_chat(usr, "<span class= 'warning'>\The [ourtarget] is no longer in \the [b].</span>")
						return
					if(isliving(usr))
						var/mob/living/l = usr
						var/thismuch = ourtarget.health + 100
						if(ishuman(l))
							var/mob/living/carbon/human/h = l
							thismuch = thismuch * h.species.digestion_nutrition_modifier
						l.adjust_nutrition(thismuch)
					ourtarget.death()		// To make sure all on-death procs get properly called
					if(ourtarget)
						b.handle_digestion_death(ourtarget)
				if("Absorb")
					if(tgui_alert(ourtarget, "\The [usr] is attempting to instantly absorb you. Is this something you are okay with happening to you?","Instant Absorb", list("No", "Yes")) != "Yes")
						to_chat(usr, "<span class= 'warning'>\The [ourtarget] declined your absorb attempt.</span>")
						to_chat(ourtarget, "<span class= 'warning'>You declined the absorb attempt.</span>")
						return
					if(ourtarget.loc != b)
						to_chat(usr, "<span class= 'warning'>\The [ourtarget] is no longer in \the [b].</span>")
						return
					if(isliving(usr))
						var/mob/living/l = usr
						l.adjust_nutrition(ourtarget.nutrition)
						var/n = 0 - ourtarget.nutrition
						ourtarget.adjust_nutrition(n)
					b.absorb_living(ourtarget)
				if("Cancel")
					return

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
			host.vore_selected.slow_digestion = FALSE //CHOMPAdd Start
			if(host.vore_selected.mode_flags & DM_FLAG_SLOWBODY)
				host.vore_selected.slow_digestion = TRUE
			if(toggle_addon == "TURBO MODE")
				STOP_PROCESSING(SSbellies, host.vore_selected)
				STOP_PROCESSING(SSobj, host.vore_selected)
				if(host.vore_selected.mode_flags & DM_FLAG_TURBOMODE)
					host.vore_selected.speedy_mob_processing = TRUE
					START_PROCESSING(SSobj, host.vore_selected)
					to_chat(usr, "<span class= 'warning'>TURBO MODE activated! Belly processing speed tripled! This also affects timed settings, such as autotransfer and liquid generation.</span>")
				else
					host.vore_selected.speedy_mob_processing = FALSE
					START_PROCESSING(SSbellies, host.vore_selected)
					to_chat(usr, "<span class= 'warning'>TURBO MODE deactivated. Belly processing returned to normal speed.</span>")//CHOMPAdd End
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
		if("b_egg_name") //CHOMPAdd Start
			var/new_egg_name = html_encode(tgui_input_text(usr,"Custom Egg Name (Leave empty for default egg name)","New Egg Name"))
			if(length(new_egg_name) > BELLIES_NAME_MAX)
				tgui_alert_async(usr, "Entered name too long (max [BELLIES_NAME_MAX]).","Error")
				return FALSE
			host.vore_selected.egg_name = new_egg_name
			. = TRUE //CHOMPAdd End
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
		if("b_eating_privacy")
			var/privacy_choice = tgui_input_list(usr, "Choose your belly-specific preference. Default uses global preference!", "Eating message privacy", list("default", "subtle", "loud"), "default")
			if(privacy_choice == null)
				return FALSE
			host.vore_selected.eating_privacy_local = privacy_choice
			. = TRUE
		if("b_silicon_belly")
			var/belly_choice = tgui_alert(usr, "Choose whether you'd like your belly overlay to show from sleepers \
			or from normal vore bellies. NOTE: This ONLY applies to silicons, not human mobs!", "Belly Overlay Preference",
			list("Sleeper", "Vorebelly"))
			if(belly_choice == null)
				return FALSE
			host.vore_selected.silicon_belly_overlay_preference = belly_choice
			host.updateicon()
			. = TRUE
		if("b_min_belly_number_flat")
			var/new_min_belly = tgui_input_number(user, "Choose the amount of prey your belly must contain \
			at absolute minimum (should be lower or equal to minimum prey override if prey override is ON)",
			"Set minimum prey amount", host.vore_selected.visible_belly_minimum_prey, max_value = 100, min_value = 1)
			if(new_min_belly == null)
				return FALSE
			var/new_new_min_belly = CLAMP(new_min_belly, 1, 100)	//Clamping at 100 rather than infinity. Should be close to infinity tho.
			host.vore_selected.visible_belly_minimum_prey = new_new_min_belly
			host.updateicon()
			. = TRUE
		if("b_min_belly_prey_size")
			var/new_belly_size = tgui_input_number(user, "Choose the required size prey must be to trigger belly overlay, \
			ranging from 25% to 200%. Set to 0 to disable size checks", "Set Belly Examine Size.", max_value = 200, min_value = 0)
			if(new_belly_size == null)
				return FALSE
			else if(new_belly_size == 0)
				host.vore_selected.overlay_min_prey_size = 0
			else
				var/new_new_belly_size = CLAMP(new_belly_size, 25, 200)
				host.vore_selected.overlay_min_prey_size = (new_new_belly_size/100)
			host.updateicon()
			. = TRUE
		if("b_override_min_belly_prey_size")
			host.vore_selected.override_min_prey_size = !host.vore_selected.override_min_prey_size
			host.updateicon()
			. = TRUE
		if("b_min_belly_number_override")
			var/new_min_prey = tgui_input_number(user, "Choose the amount of prey your belly must contain to override min prey size \
			to show belly overlay ignoring prey size requirement. Toggle Prey Override MUST be ON to work",
			"Set minimum prey amount", host.vore_selected.override_min_prey_num, max_value = 100, min_value = 1)
			if(new_min_prey == null)
				return FALSE
			var/new_new_min_prey = CLAMP(new_min_prey, 1, 100)	//Clamping at 100 rather than infinity. Should be close to infinity tho.
			host.vore_selected.override_min_prey_num = new_new_min_prey
			host.updateicon()
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
		if("b_sound_volume") //CHOMPAdd
			var/sound_volume_input = tgui_input_number(user, "Set belly sound volume percentage.", "Sound Volume", null, 100, 0)
			if(!isnull(sound_volume_input)) //These have to be 'null' because both cancel and 0 are valid, separate options
				host.vore_selected.sound_volume = sanitize_integer(sound_volume_input, 0, 100, initial(host.vore_selected.sound_volume))
			. = TRUE
		if("b_tastes")
			host.vore_selected.can_taste = !host.vore_selected.can_taste
			. = TRUE
		if("b_feedable") //CHOMPAdd
			host.vore_selected.is_feedable = !host.vore_selected.is_feedable
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
			var/new_nutrition = tgui_input_number(user, "Choose the nutrition gain percentage you will receive per tick from prey. Ranges from 0.01 to 100.", "Set Nutrition Gain Percentage.", host.vore_selected.nutrition_percent, 100, 0.01)
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
			host.vore_selected.items_preserved.Cut() //CHOMPAdd
			. = TRUE
		if("b_brute_dmg")
			var/new_damage = tgui_input_number(user, "Choose the amount of brute damage prey will take per tick. Ranges from 0 to 6", "Set Belly Brute Damage.", host.vore_selected.digest_brute, 6, 0)
			if(new_damage == null)
				return FALSE
			var/new_new_damage = CLAMP(new_damage, 0, 6)
			host.vore_selected.digest_brute = new_new_damage
			host.vore_selected.items_preserved.Cut() //CHOMPAdd
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
		if("b_autotransferchance_secondary")
			var/autotransferchance_secondary_input = input(user, "Set secondary belly auto-transfer chance (as %). You must also set the location for this to have any effect.", "Secondary Auto-Transfer Chance") as num|null
			if(!isnull(autotransferchance_secondary_input))
				host.vore_selected.autotransferchance_secondary = sanitize_integer(autotransferchance_secondary_input, 0, 100, initial(host.vore_selected.autotransferchance_secondary))
			. = TRUE
		if("b_autotransferlocation_secondary")
			var/obj/belly/choice = tgui_input_list(usr, "Where do you want your secondary [lowertext(host.vore_selected.name)] auto-transfer to?","Select Belly", (host.vore_organs + "None - Remove" - host.vore_selected))
			if(!choice) //They cancelled, no changes
				return FALSE
			else if(choice == "None - Remove")
				host.vore_selected.autotransferlocation_secondary = null
			else
				host.vore_selected.autotransferlocation_secondary = choice.name
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
			host.vore_selected.update_internal_overlay()
			. = TRUE
		if("b_disable_hud")
			host.vore_selected.disable_hud = !host.vore_selected.disable_hud
			. = TRUE
		if("b_colorization_enabled") //ALLOWS COLORIZATION.
			host.vore_selected.colorization_enabled = !host.vore_selected.colorization_enabled
			host.vore_selected.belly_fullscreen = "dark" //This prevents you from selecting a belly that is not meant to be colored and then turning colorization on.
			. = TRUE
		/*
		if("b_multilayered") //Allows for 'multilayered' stomachs. Currently not implemented. Add to TGUI.
			host.vore_selected.multilayered = !host.vore_selected.multilayered 				//Add to stomach vars.
			host.vore_selected.belly_fullscreen = "dark"
			. = TRUE
		*/
		if("b_preview_belly")
			host.vore_selected.vore_preview(host) //Gives them the stomach overlay. It fades away after ~2 seconds as human/life.dm removes the overlay if not in a gut.
			. = TRUE
		if("b_clear_preview")
			host.vore_selected.clear_preview(host) //Clears the stomach overlay. This is a failsafe but shouldn't occur.
			. = TRUE
		if("b_fullscreen_color")
			var/newcolor = input(usr, "Choose a color.", "", host.vore_selected.belly_fullscreen_color) as color|null
			if(newcolor)
				host.vore_selected.belly_fullscreen_color = newcolor
				host.vore_selected.update_internal_overlay()
			. = TRUE
		if("b_fullscreen_color2")
			var/newcolor2 = input(usr, "Choose a color.", "", host.vore_selected.belly_fullscreen_color2) as color|null
			if(newcolor2)
				host.vore_selected.belly_fullscreen_color2 = newcolor2
				host.vore_selected.update_internal_overlay()
			. = TRUE
		if("b_fullscreen_color3")
			var/newcolor3 = input(usr, "Choose a color.", "", host.vore_selected.belly_fullscreen_color3) as color|null
			if(newcolor3)
				host.vore_selected.belly_fullscreen_color3 = newcolor3
				host.vore_selected.update_internal_overlay()
			. = TRUE
		if("b_fullscreen_color4")
			var/newcolor4 = input(usr, "Choose a color.", "", host.vore_selected.belly_fullscreen_color4) as color|null
			if(newcolor4)
				host.vore_selected.belly_fullscreen_color4 = newcolor4
				host.vore_selected.update_internal_overlay()
			. = TRUE
		if("b_fullscreen_alpha")
			var/newalpha = tgui_input_number(usr, "Set alpha transparency between 0-255", "Vore Alpha",255,255,0,0,1)
			if(newalpha)
				host.vore_selected.belly_fullscreen_alpha = newalpha
				host.vore_selected.update_internal_overlay()
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
		if("b_absorbed_multiplier") //CHOMP Addition
			var/absorbed_multiplier_input = input(user, "Set the impact absorbed prey's size have on your vore sprite. 1 means no scaling, 0.5 means absorbed prey count half as much, 2 means absorbed prey count double. (Range from 0.1 - 3)", "Absorbed Multiplier") as num|null
			if(!isnull(absorbed_multiplier_input))
				host.vore_selected.absorbed_multiplier = CLAMP(absorbed_multiplier_input, 0.1, 3)
				host.update_fullness()
			. = TRUE
		if("b_count_liquid_for_sprites") //CHOMP Addition
			host.vore_selected.count_liquid_for_sprite = !host.vore_selected.count_liquid_for_sprite
			host.update_fullness()
			. = TRUE
		if("b_liquid_multiplier") //CHOMP Addition
			var/liquid_multiplier_input = input(user, "Set the impact amount of liquid reagents will have on your vore sprite. 1 means a belly with 100 reagents of fluid will count as 1 normal sized prey-thing's worth, 0.5 means liquid counts half as much, 2 means liquid counts double. (Range from 0.1 - 10)", "Liquid Multiplier") as num|null
			if(!isnull(liquid_multiplier_input))
				host.vore_selected.liquid_multiplier = CLAMP(liquid_multiplier_input, 0.1, 10)
				host.update_fullness()
			. = TRUE
		if("b_count_items_for_sprites") //CHOMP Addition
			host.vore_selected.count_items_for_sprite = !host.vore_selected.count_items_for_sprite
			host.update_fullness()
			. = TRUE
		if("b_item_multiplier") //CHOMP Addition
			var/item_multiplier_input = input(user, "Set the impact items will have on your vore sprite. 1 means a belly with 8 normal-sized items will count as 1 normal sized prey-thing's worth, 0.5 means items count half as much, 2 means items count double. (Range from 0.1 - 10)", "Item Multiplier") as num|null
			if(!isnull(item_multiplier_input))
				host.vore_selected.item_multiplier = CLAMP(item_multiplier_input, 0.1, 10)
				host.update_fullness()
			. = TRUE
		if("b_health_impacts_size") //CHOMP Addition
			host.vore_selected.health_impacts_size = !host.vore_selected.health_impacts_size
			host.update_fullness()
			. = TRUE
		if("b_resist_animation") //CHOMP Addition
			host.vore_selected.resist_triggers_animation = !host.vore_selected.resist_triggers_animation
			. = TRUE
		if("b_size_factor_sprites") //CHOMP Addition
			var/size_factor_input = input(user, "Set the impact all belly content's collective size has on your vore sprite. 1 means no scaling, 0.5 means content counts half as much, 2 means contents count double. (Range from 0.1 - 3)", "Size Factor") as num|null
			if(!isnull(size_factor_input))
				host.vore_selected.size_factor_for_sprite = CLAMP(size_factor_input, 0.1, 3)
				host.update_fullness()
			. = TRUE
		if("b_undergarment_choice") //CHOMP Addition
			var/datum/category_group/underwear/undergarment_choice = tgui_input_list(usr, "Which undergarment do you want to enable when your [lowertext(host.vore_selected.name)] is filled?","Select Undergarment Class", global_underwear.categories)
			if(!undergarment_choice) //They cancelled, no changes
				return FALSE
			else
				host.vore_selected.undergarment_chosen = undergarment_choice.name
				host.update_fullness()
			. = TRUE
		if("b_undergarment_if_none") //CHOMP Addition
			var/datum/category_group/underwear/UWC = global_underwear.categories_by_name[host.vore_selected.undergarment_chosen]
			var/datum/category_item/underwear/selected_underwear = tgui_input_list(usr, "If no undergarment is equipped, which undergarment style do you want to use?","Select Underwear Style",UWC.items,host.vore_selected.undergarment_if_none)
			if(!selected_underwear) //They cancelled, no changes
				return FALSE
			else
				host.vore_selected.undergarment_if_none = selected_underwear
				host.update_fullness()
				host.updateVRPanel()
		if("b_undergarment_color") //CHOMP Addition
			var/newcolor = input(usr, "Choose a color.", "", host.vore_selected.undergarment_color) as color|null
			if(newcolor)
				host.vore_selected.undergarment_color = newcolor
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
			. = TRUE
		if("b_tail_color2") // CHOMP Addition
			var/newcolor = input(usr, "Choose tail secondary color.", "", host.vore_selected.tail_extra_overlay) as color|null
			if(newcolor)
				host.vore_selected.tail_extra_overlay = newcolor
			. = TRUE
		if("b_tail_color3") // CHOMP Addition
			var/newcolor = input(usr, "Choose tail tertiary color.", "", host.vore_selected.tail_extra_overlay2) as color|null
			if(newcolor)
				host.vore_selected.tail_extra_overlay2 = newcolor
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
			var/new_custom_vol = input(user, "Choose the amount of liquid the belly can contain at most. Ranges from 10 to 300.", "Set Custom Belly Capacity.", host.vore_selected.custom_max_volume) as num|null
			if(new_custom_vol == null)
				return FALSE
			var/new_new_custom_vol = CLAMP(new_custom_vol, 10, 300)
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
