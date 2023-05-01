//
// Belly Export Panel
//

/datum/vore_look/export_panel/proc/open_export_panel(mob/user)
	tgui_interact(user)

/datum/vore_look/export_panel/tgui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "VorePanelExport", "Vore Export Panel")
		ui.open()
		ui.set_autoupdate(FALSE)

/datum/vore_look/export_panel/tgui_fallback(payload)
	if(..())
		return TRUE

	//var/mob/living/host = usr
	//host.vorebelly_printout(TRUE)

/datum/vore_look/export_panel/tgui_act(action, params)
	if(..())
		return TRUE

/datum/vore_look/export_panel/tgui_data(mob/user)
	var/list/data = list()
	var/mob/living/host = user

	data["db_version"] = "0.1"
	data["db_repo"] = "chompstation"
	data["mob_name"] = host.real_name

	for(var/belly in host.vore_organs)
		if(isbelly(belly))
			var/obj/belly/B = belly
			var/belly_data = list()

			// General Information
			belly_data["name"] = B.name
			belly_data["desc"] = B.desc
			belly_data["absorbed_desc"] = B.absorbed_desc
			belly_data["vore_verb"] = B.vore_verb
			belly_data["release_verb"] = B.release_verb

			// Controls
			belly_data["mode"] = B.digest_mode
			var/list/addons = list()
			for(var/flag_name in B.mode_flag_list)
				if(B.mode_flags & B.mode_flag_list[flag_name])
					addons.Add(flag_name)
			belly_data["addons"] = addons
			belly_data["item_mode"] = B.item_digest_mode

			// Messages
			belly_data["struggle_messages_outside"] = list()
			for(var/msg in B.struggle_messages_outside)
				belly_data["struggle_messages_outside"] += msg

			belly_data["struggle_messages_inside"] = list()
			for(var/msg in B.struggle_messages_inside)
				belly_data["struggle_messages_inside"] += msg

			belly_data["absorbed_struggle_messages_outside"] = list()
			for(var/msg in B.absorbed_struggle_messages_outside)
				belly_data["absorbed_struggle_messages_outside"] += msg

			belly_data["absorbed_struggle_messages_inside"] = list()
			for(var/msg in B.absorbed_struggle_messages_inside)
				belly_data["absorbed_struggle_messages_inside"] += msg

			belly_data["digest_messages_owner"] = list()
			for(var/msg in B.digest_messages_owner)
				belly_data["digest_messages_owner"] += msg

			belly_data["digest_messages_prey"] = list()
			for(var/msg in B.digest_messages_prey)
				belly_data["digest_messages_prey"] += msg

			belly_data["absorb_messages_owner"] = list()
			for(var/msg in B.absorb_messages_owner)
				belly_data["absorb_messages_owner"] += msg

			belly_data["absorb_messages_prey"] = list()
			for(var/msg in B.absorb_messages_prey)
				belly_data["absorb_messages_prey"] += msg

			belly_data["unabsorb_messages_owner"] = list()
			for(var/msg in B.unabsorb_messages_owner)
				belly_data["unabsorb_messages_owner"] += msg

			belly_data["unabsorb_messages_prey"] = list()
			for(var/msg in B.unabsorb_messages_prey)
				belly_data["unabsorb_messages_prey"] += msg

			belly_data["examine_messages"] = list()
			for(var/msg in B.examine_messages)
				belly_data["examine_messages"] += msg

			belly_data["examine_messages_absorbed"] = list()
			for(var/msg in B.examine_messages_absorbed)
				belly_data["examine_messages_absorbed"] += msg

			//belly_data["emote_list"] = list()
			//for(var/EL in B.emote_lists)
			//	for(var/msg in B.emote_lists[EL])
			//		msg_list += msg
			//
			//	belly_data["emote_lists"] += list(EL, msg_list)

			// I will use this first before the code above gets fixed
			belly_data["emotes_digest"] = list()
			for(var/msg in B.emote_lists[DM_DIGEST])
				belly_data["emotes_digest"] += msg

			belly_data["emotes_hold"] = list()
			for(var/msg in B.emote_lists[DM_HOLD])
				belly_data["emotes_hold"] += msg

			belly_data["emotes_holdabsorbed"] = list()
			for(var/msg in B.emote_lists[DM_HOLD_ABSORBED])
				belly_data["emotes_holdabsorbed"] += msg

			belly_data["emotes_absorb"] = list()
			for(var/msg in B.emote_lists[DM_ABSORB])
				belly_data["emotes_absorb"] += msg

			belly_data["emotes_heal"] = list()
			for(var/msg in B.emote_lists[DM_HEAL])
				belly_data["emotes_heal"] += msg

			belly_data["emotes_drain"] = list()
			for(var/msg in B.emote_lists[DM_DRAIN])
				belly_data["emotes_drain"] += msg

			belly_data["emotes_steal"] = list()
			for(var/msg in B.emote_lists[DM_SIZE_STEAL])
				belly_data["emotes_steal"] += msg

			belly_data["emotes_egg"] = list()
			for(var/msg in B.emote_lists[DM_EGG])
				belly_data["emotes_egg"] += msg

			belly_data["emotes_shrink"] = list()
			for(var/msg in B.emote_lists[DM_SHRINK])
				belly_data["emotes_shrink"] += msg

			belly_data["emotes_grow"] = list()
			for(var/msg in B.emote_lists[DM_GROW])
				belly_data["emotes_grow"] += msg

			belly_data["emotes_unabsorb"] = list()
			for(var/msg in B.emote_lists[DM_UNABSORB])
				belly_data["emotes_unabsorb"] += msg

			// Options
			belly_data["digest_brute"] = B.digest_brute
			belly_data["digest_burn"] = B.digest_burn
			belly_data["digest_oxy"] = B.digest_oxy

			belly_data["can_taste"] = B.can_taste
			belly_data["is_feedable"] = B.is_feedable
			belly_data["contaminates"] = B.contaminates
			belly_data["contamination_flavor"] = B.contamination_flavor
			belly_data["contamination_color"] = B.contamination_color
			belly_data["nutrition_percent"] = B.nutrition_percent
			belly_data["bulge_size"] = B.bulge_size
			belly_data["display_absorbed_examine"] = B.display_absorbed_examine
			belly_data["save_digest_mode"] = B.save_digest_mode
			belly_data["emote_active"] = B.emote_active
			belly_data["emote_time"] = B.emote_time
			belly_data["shrink_grow_size"] = B.shrink_grow_size
			belly_data["vorespawn_blacklist"] = B.vorespawn_blacklist
			belly_data["egg_type"] = B.egg_type
			belly_data["selective_preference"] = B.selective_preference

			// Sounds
			belly_data["is_wet"] = B.is_wet
			belly_data["wet_loop"] = B.wet_loop
			belly_data["fancy_vore"] = B.fancy_vore
			belly_data["vore_sound"] = B.vore_sound
			belly_data["release_sound"] = B.release_sound

			// Visuals
			belly_data["affects_vore_sprites"] = B.affects_vore_sprites
			belly_data["count_absorbed_prey_for_sprite"] = B.count_absorbed_prey_for_sprite
			belly_data["absorbed_multiplier"] = B.absorbed_multiplier
			belly_data["count_liquid_for_sprite"] = B.count_liquid_for_sprite
			belly_data["liquid_multiplier"] = B.liquid_multiplier
			belly_data["count_items_for_sprite"] = B.count_items_for_sprite
			belly_data["item_multiplier"] = B.item_multiplier
			belly_data["health_impacts_size"] = B.health_impacts_size
			belly_data["resist_triggers_animation"] = B.resist_triggers_animation
			belly_data["size_factor_for_sprite"] = B.size_factor_for_sprite
			belly_data["belly_sprite_to_affect"] = B.belly_sprite_to_affect
			belly_data["undergarment_chosen"] = B.undergarment_chosen
			belly_data["undergarment_if_none"] = B.undergarment_if_none
			belly_data["undergarment_color"] = B.undergarment_color

			// Visuals (Belly Fullscreens Preview and Coloring)
			belly_data["belly_fullscreen_color"] = B.belly_fullscreen_color

			// Visuals (Vore FX)
			belly_data["disable_hud"] = B.disable_hud

			// Interactions
			belly_data["escapable"] = B.escapable

			belly_data["escapechance"] = B.escapechance
			belly_data["escapetime"] = B.escapetime

			belly_data["transferchance"] = B.transferchance
			belly_data["transferlocation"] = B.transferlocation

			belly_data["transferchance_secondary"] = B.transferchance_secondary
			belly_data["transferlocation_secondary"] = B.transferlocation_secondary

			belly_data["absorbchance"] = B.absorbchance
			belly_data["digestchance"] = B.digestchance

			// Interactions (Auto-Transfer)
			belly_data["autotransferchance"] = B.autotransferchance
			belly_data["autotransferwait"] = B.autotransferwait
			belly_data["autotransferlocation"] = B.autotransferlocation
			belly_data["autotransfer_enabled"] = B.autotransfer_enabled
			belly_data["autotransferchance_secondary"] = B.autotransferchance_secondary
			belly_data["autotransferlocation_secondary"] = B.autotransferlocation_secondary
			belly_data["autotransfer_min_amount"] = B.autotransfer_min_amount
			belly_data["autotransfer_max_amount"] = B.autotransfer_max_amount

			// Liquid Options
			belly_data["show_liquids"] = B.show_liquids
			belly_data["reagentbellymode"] = B.reagentbellymode
			belly_data["reagent_chosen"] = B.reagent_chosen
			belly_data["reagent_name"] = B.reagent_name
			belly_data["reagent_transfer_verb"] = B.reagent_transfer_verb
			belly_data["gen_time_display"] = B.gen_time_display
			belly_data["custom_max_volume"] = B.custom_max_volume
			belly_data["vorefootsteps_sounds"] = B.vorefootsteps_sounds

			var/list/reagent_flags = list()
			for(var/flag_name in B.reagent_mode_flag_list)
				if(B.reagent_mode_flags & B.reagent_mode_flag_list[flag_name])
					reagent_flags.Add(flag_name)
			belly_data["reagent_mode_flag_list"] = reagent_flags

			data["bellies"] += list(belly_data)

			// Liquid Messages
			belly_data["liquid_fullness1_messages"] = B.liquid_fullness1_messages
			belly_data["liquid_fullness2_messages"] = B.liquid_fullness2_messages
			belly_data["liquid_fullness3_messages"] = B.liquid_fullness3_messages
			belly_data["liquid_fullness4_messages"] = B.liquid_fullness4_messages
			belly_data["liquid_fullness5_messages"] = B.liquid_fullness5_messages

			belly_data["fullness1_messages"] = list()
			for(var/msg in B.fullness1_messages)
				belly_data["fullness1_messages"] += msg

			belly_data["fullness2_messages"] = list()
			for(var/msg in B.fullness2_messages)
				belly_data["fullness2_messages"] += msg

			belly_data["fullness3_messages"] = list()
			for(var/msg in B.fullness3_messages)
				belly_data["fullness3_messages"] += msg

			belly_data["fullness4_messages"] = list()
			for(var/msg in B.fullness4_messages)
				belly_data["fullness4_messages"] += msg

			belly_data["fullness5_messages"] = list()
			for(var/msg in B.fullness5_messages)
				belly_data["fullness5_messages"] += msg

	return data
