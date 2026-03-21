//admin verb groups - They can overlap if you so wish. Only one of each verb will exist in the verbs list regardless
GLOBAL_LIST_INIT(admin_verbs_admin, list(
	/datum/admins/proc/intercom,		//send a fake intercom message, like an arrivals announcement,
	/datum/admins/proc/intercom_convo,	//send a fake intercom conversation, like an ATC exchange,
	/client/proc/hide_verbs,			//hides all our adminverbs,
	/client/proc/hide_most_verbs,		//hides all our hideable adminverbs,
	/client/proc/jumptocoord,			//we ghost and jump to a coordinate,
	/client/proc/Getmob,				//teleports a mob to our location,
	/client/proc/Getkey,				//teleports a mob with a certain ckey to our location,
	/client/proc/Jump,
	/client/proc/jumptokey,				//allows us to jump to the location of a mob with a certain ckey,
	/client/proc/jumptomob,				//allows us to jump to a specific mob,
	/client/proc/check_ai_laws,			//shows AI and borg laws,
	/client/proc/rename_silicon,		//properly renames silicons,
	/client/proc/modify_robot,
	/client/proc/free_slot,			//frees slot for chosen job,
	/client/proc/cmd_admin_change_custom_event,
	/client/proc/toggleghostwriters,
	/client/proc/toggledrones,
	/client/proc/man_up,
	/client/proc/global_man_up,
	/client/proc/response_team, // Response Teams admin verb,
	/client/proc/trader_ship, // Trader ship admin verb,
	/client/proc/aooc,
	/client/proc/change_security_level,
<<<<<<< HEAD
	/client/proc/view_chemical_reaction_logs,
	/client/proc/makepAI,
	/datum/admins/proc/paralyze_mob,
	/datum/admins/proc/quick_authentic_nif, //CHOMPStation add
=======
>>>>>>> 89fb9871e0 (next set of admin verbs (#19260))
	/datum/admins/proc/set_uplink,
	/client/proc/delbook,
	/client/proc/start_vote,
<<<<<<< HEAD
	/client/proc/hide_motion_tracker_feedback,
	))

GLOBAL_LIST_INIT(admin_verbs_spawn, list(
	/datum/admins/proc/spawn_fruit,
	/datum/admins/proc/spawn_custom_item,
	/datum/admins/proc/check_custom_items,
	/datum/admins/proc/spawn_plant,
	/datum/admins/proc/spawn_atom,		//allows us to spawn instances,
	/datum/admins/proc/spawn_mail,
	/client/proc/spawn_character_mob,
	/client/proc/spawn_chemdisp_cartridge,
	/client/proc/map_template_load,
	/client/proc/map_template_upload,
	/client/proc/map_template_load_on_new_z,
	/client/proc/eventkit_open_mob_spawner,
	/client/proc/generic_structure,
	/client/proc/generic_item,
	/client/proc/create_gm_message,
	/client/proc/remove_gm_message,
	/client/proc/AdminCreateVirus,
	/client/proc/ReleaseVirus,
	/client/proc/spawn_reagent
	))

GLOBAL_LIST_INIT(admin_verbs_server, list(
	/datum/admins/proc/capture_map,
	/client/proc/Set_Holiday,
	/client/proc/ToRban,
	/datum/admins/proc/startnow,
	/datum/admins/proc/delay,
	/datum/admins/proc/toggleaban,
	/datum/admins/proc/togglepersistence,
	/client/proc/toggle_log_hrefs,
	/datum/admins/proc/toggleAI,
	/client/proc/cmd_debug_del_all,
	/datum/admins/proc/adrev,
	/datum/admins/proc/adspawn,
	/datum/admins/proc/adjump,
	/client/proc/check_customitem_activity,
	/client/proc/modify_server_news,
	/client/proc/recipe_dump,
	/client/proc/panicbunker,
	/client/proc/paranoia_logging,
	/client/proc/ip_reputation
=======
>>>>>>> 89fb9871e0 (next set of admin verbs (#19260))
	))

GLOBAL_LIST_INIT(admin_verbs_debug, list(
	/client/proc/kill_air,
	/client/proc/air_report,
	/client/proc/reload_admins,
	/client/proc/print_random_map,
	/client/proc/create_random_map,
	/client/proc/apply_random_map,
	/client/proc/overlay_random_map,
	/client/proc/delete_random_map,
	/client/proc/show_plant_genes,
	/client/proc/Jump,
	/client/proc/jumptomob,
	/client/proc/jumptocoord,
	/client/proc/hide_verbs,			//hides all our adminverbs,
	/client/proc/hide_most_verbs,		//hides all our hideable adminverbs,
	/datum/admins/proc/set_uplink,
	/client/proc/stop_sounds,
<<<<<<< HEAD
	/client/proc/spawn_reagent,
	/datum/admins/proc/quick_authentic_nif, //CHOMPStation add
	/client/proc/reload_configuration //CHOMPAdd
=======
>>>>>>> 89fb9871e0 (next set of admin verbs (#19260))
	))

//verbs which can be hidden - needs work
GLOBAL_LIST_INIT(admin_verbs_hideable, list(
	/client/proc/reload_admins,
	/client/proc/kill_air,
	/client/proc/air_report,
	/datum/admins/proc/set_uplink,
	/client/proc/stop_sounds
	))

GLOBAL_LIST_INIT(admin_verbs_mod, list(
	/client/proc/hide_verbs,			//hides all our adminverbs,
	/client/proc/hide_most_verbs,		//hides all our hideable adminverbs,
	/client/proc/aooc,
<<<<<<< HEAD
	/client/proc/cmd_admin_subtle_message, 	//send an message to somebody as a 'voice in their head',
	/datum/admins/proc/paralyze_mob,
	/client/proc/cmd_admin_direct_narrate,
	/datum/admins/proc/sendFax,
	/datum/admins/proc/view_persistent_data,
	/client/proc/start_vote,
=======
	/client/proc/start_vote
>>>>>>> 89fb9871e0 (next set of admin verbs (#19260))
))

GLOBAL_LIST_INIT(admin_verbs_event_manager, list(
	/client/proc/hide_verbs,			//hides all our adminverbs,
	/client/proc/hide_most_verbs,		//hides all our hideable adminverbs,
	/client/proc/aooc,
	/client/proc/Jump,
	/client/proc/jumptomob,
	/client/proc/jumptocoord,
	/datum/admins/proc/intercom,            //send a fake intercom message, like an arrivals announcement,
	/datum/admins/proc/intercom_convo,      //send a fake intercom conversation, like an ATC exchange,
	/client/proc/jumptocoord,                       //we ghost and jump to a coordinate,
	/client/proc/Getmob,                            //teleports a mob to our location,
	/client/proc/Getkey,                            //teleports a mob with a certain ckey to our location,
	/client/proc/Jump,
	/client/proc/jumptokey,                         //allows us to jump to the location of a mob with a certain ckey,
	/client/proc/jumptomob,                         //allows us to jump to a specific mob,
	/client/proc/check_ai_laws,                     //shows AI and borg laws,
	/client/proc/rename_silicon,            //properly renames silicons,
	/client/proc/modify_robot,
	/client/proc/free_slot,                 //frees slot for chosen job,
	/client/proc/cmd_admin_change_custom_event,
	/client/proc/toggleghostwriters,
	/client/proc/man_up,
	/client/proc/global_man_up,
	/client/proc/response_team, // Response Teams admin verb,
	/client/proc/trader_ship, // Trader ship admin verb,
	/client/proc/aooc,
	/client/proc/change_security_level,
	/client/proc/start_vote,
	/client/proc/add_hidden_area,
	/client/proc/remove_hidden_area,
<<<<<<< HEAD
	/client/proc/hide_motion_tracker_feedback,
	/client/proc/modify_event_collector,
	/client/proc/induce_malfunction,
	/datum/admins/proc/quick_authentic_nif, //CHOMPStation add
=======
>>>>>>> 89fb9871e0 (next set of admin verbs (#19260))
))
