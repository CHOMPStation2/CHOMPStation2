//print an error message to world.log

//This is an external call, "true" and "false" are how rust parses out booleans
#define WRITE_LOG(log, text) rustg_log_write(log, text, "true")
#define WRITE_LOG_NO_FORMAT(log, text) rustg_log_write(log, text, "false")

/* For logging round startup. */
/proc/start_log(log)
	WRITE_LOG(log, "START: Starting up [GLOB.log_directory].")
	return log

/* Close open log handles. This should be called as late as possible, and no logging should hapen after. */
/proc/shutdown_logging()
	rustg_log_close_all()

/proc/error(msg)
	to_world_log("## ERROR: [msg]")

#define WARNING(MSG) warning("[MSG] in [__FILE__] at line [__LINE__] src: [src] usr: [usr].")
//print a warning message to world.log
/proc/warning(msg)
	to_world_log("## WARNING: [msg]")

//print a testing-mode debug message to world.log
/proc/testing(msg)
	if (CONFIG_GET(flag/log_debug)) //CHOMPEdit
		to_world_log("## TESTING: [msg]")

/proc/log_admin(text)
	GLOB.admin_log.Add(text)
	if (CONFIG_GET(flag/log_admin))
		WRITE_LOG(GLOB.diary, "ADMIN: [text]")

/proc/log_admin_private(text)
	GLOB.admin_log.Add(text)
	if (CONFIG_GET(flag/log_admin))
		WRITE_LOG(GLOB.diary, "ADMINPRIVATE: [text]")

/proc/log_adminpm(text, client/source, client/dest)
	GLOB.admin_log.Add(text)
	if (CONFIG_GET(flag/log_admin))
		WRITE_LOG(GLOB.diary, "ADMINPM: [key_name(source)]->[key_name(dest)]: [html_decode(text)]")

/proc/log_pray(text, client/source)
	GLOB.admin_log.Add(text)
	if (CONFIG_GET(flag/log_admin))
		WRITE_LOG(GLOB.diary, "PRAY: [key_name(source)]: [text]")

/proc/log_debug(text)
	if (CONFIG_GET(flag/log_debug))
		WRITE_LOG(GLOB.debug_log, "DEBUG: [sanitize(text)]")

	for(var/client/C in GLOB.admins)
		if(C.prefs?.read_preference(/datum/preference/toggle/show_debug_logs))
			to_chat(C,
					type = MESSAGE_TYPE_DEBUG,
					html = span_filter_debuglogs("DEBUG: [text]"))

/proc/log_game(text)
	if (CONFIG_GET(flag/log_game))
		WRITE_LOG(GLOB.diary, "GAME: [text]")

/proc/log_vote(text)
	if (CONFIG_GET(flag/log_vote))
		WRITE_LOG(GLOB.diary, "VOTE: [text]")

/proc/log_access_in(client/new_client)
	if (CONFIG_GET(flag/log_access))
		var/message = "[key_name(new_client)] - IP:[new_client.address] - CID:[new_client.computer_id] - BYOND v[new_client.byond_version]"
		WRITE_LOG(GLOB.diary, "ACCESS IN: [message]") //VOREStation Edit

/proc/log_access_out(mob/last_mob)
	if (CONFIG_GET(flag/log_access))
		var/message = "[key_name(last_mob)] - IP:[last_mob.lastKnownIP] - CID:Logged Out - BYOND Logged Out"
		WRITE_LOG(GLOB.diary, "ACCESS OUT: [message]")

/proc/log_say(text, mob/speaker)
	if (CONFIG_GET(flag/log_say))
		WRITE_LOG(GLOB.diary, "SAY: [speaker.simple_info_line()]: [html_decode(text)]")

	//Log the message to in-game dialogue logs, as well. //CHOMPEdit Begin
	if(speaker.client)
		//speaker.dialogue_log += span_bold("([time_stamp()])") + " (" + span_bold("[speaker]/[speaker.client]") + ") " + span_underline("SAY:") + " - " + span_green("[text]")
		if(!SSdbcore.IsConnected())
			establish_db_connection()
			if(!SSdbcore.IsConnected())
				return null
		var/datum/db_query/query_insert = SSdbcore.NewQuery("INSERT INTO erro_dialog (mid, time, ckey, mob, type, message) VALUES (null, NOW(), :sender_ckey, :sender_mob, :message_type, :message_content)", \
			list("sender_ckey" = speaker.ckey, "sender_mob" = speaker.real_name, "message_type" = "say", "message_content" = text))
		if(!query_insert.Execute())
			log_debug("Error during logging: "+query_insert.ErrorMsg())
			qdel(query_insert)
			return
		qdel(query_insert)
		//GLOB.round_text_log += span_bold("([time_stamp()])") + " (" + span_bold("[speaker]/[speaker.client]") + ") " + span_underline("SAY:") + " - " + span_green("[text]")
		//CHOMPEdit End

/proc/log_ooc(text, client/user)
	if (CONFIG_GET(flag/log_ooc))
		WRITE_LOG(GLOB.diary, "OOC: [user.simple_info_line()]: [html_decode(text)]")
	if(!SSdbcore.IsConnected())
		establish_db_connection()
		if(!SSdbcore.IsConnected())
			return null
	var/datum/db_query/query_insert = SSdbcore.NewQuery("INSERT INTO erro_dialog (mid, time, ckey, mob, type, message) VALUES (null, NOW(), :sender_ckey, :sender_mob, :message_type, :message_content)", \
		list("sender_ckey" = user.ckey, "sender_mob" = user.mob.real_name, "message_type" = "ooc", "message_content" = text))
	if(!query_insert.Execute())
		log_debug("Error during logging: "+query_insert.ErrorMsg())
		qdel(query_insert)
		return
	qdel(query_insert)
	//GLOB.round_text_log += span_bold("([time_stamp()])") + " (" + span_bold("[user]") + ") " + span_underline("OOC:") + " - " + span_blue(span_bold("[text]"))

/proc/log_aooc(text, client/user)
	if (CONFIG_GET(flag/log_ooc))
		WRITE_LOG(GLOB.diary, "AOOC: [user.simple_info_line()]: [html_decode(text)]")
	if(!SSdbcore.IsConnected())
		establish_db_connection()
		if(!SSdbcore.IsConnected())
			return null
	var/datum/db_query/query_insert = SSdbcore.NewQuery("INSERT INTO erro_dialog (mid, time, ckey, mob, type, message) VALUES (null, NOW(), :sender_ckey, :sender_mob, :message_type, :message_content)", \
		list("sender_ckey" = user.ckey, "sender_mob" = user.mob.real_name, "message_type" = "aooc", "message_content" = text))
	if(!query_insert.Execute())
		log_debug("Error during logging: "+query_insert.ErrorMsg())
		qdel(query_insert)
		return
	qdel(query_insert)
	//GLOB.round_text_log += span_bold("([time_stamp()])") + " (" + span_bold("[user]") + ") " + span_underline("AOOC:") + " - " + span_red(span_bold("[text]"))

/proc/log_looc(text, client/user)
	if (CONFIG_GET(flag/log_ooc))
		WRITE_LOG(GLOB.diary, "LOOC: [user.simple_info_line()]: [html_decode(text)]")
	if(!SSdbcore.IsConnected())
		establish_db_connection()
		if(!SSdbcore.IsConnected())
			return null
	var/datum/db_query/query_insert = SSdbcore.NewQuery("INSERT INTO erro_dialog (mid, time, ckey, mob, type, message) VALUES (null, NOW(), :sender_ckey, :sender_mob, :message_type, :message_content)", \
		list("sender_ckey" = user.ckey, "sender_mob" = user.mob.real_name, "message_type" = "looc", "message_content" = text))
	if(!query_insert.Execute())
		log_debug("Error during logging: "+query_insert.ErrorMsg())
		qdel(query_insert)
		return
	qdel(query_insert)
	//GLOB.round_text_log += span_bold("([time_stamp()])") + " (" + span_bold("[user]") + ") " + span_underline("LOOC:") + " - " + span_orange(span_bold("[text]"))

/proc/log_whisper(text, mob/speaker)
	if (CONFIG_GET(flag/log_whisper))
		WRITE_LOG(GLOB.diary, "WHISPER: [speaker.simple_info_line()]: [html_decode(text)]")

	if(speaker.client)
		//speaker.dialogue_log += span_bold("([time_stamp()])") + " (" + span_bold("[speaker]/[speaker.client]") + ") " + span_underline("SAY:") + " - " + span_gray(span_italics("[text]"))
		//GLOB.round_text_log += span_bold("([time_stamp()])") + " (" + span_bold("[speaker]/[speaker.client]") + ") " + span_underline("SAY:") + " - " + span_gray(span_italics("[text]"))
		if(!SSdbcore.IsConnected())
			establish_db_connection()
			if(!SSdbcore.IsConnected())
				return null
		var/datum/db_query/query_insert = SSdbcore.NewQuery("INSERT INTO erro_dialog (mid, time, ckey, mob, type, message) VALUES (null, NOW(), :sender_ckey, :sender_mob, :message_type, :message_content)", \
			list("sender_ckey" = speaker.ckey, "sender_mob" = speaker.real_name, "message_type" = "whisper", "message_content" = text))
		if(!query_insert.Execute())
			log_debug("Error during logging: "+query_insert.ErrorMsg())
			qdel(query_insert)
			return
		qdel(query_insert)

/proc/log_emote(text, mob/speaker)
	if (CONFIG_GET(flag/log_emote))
		WRITE_LOG(GLOB.diary, "EMOTE: [speaker.simple_info_line()]: [html_decode(text)]")
	//CHOMPEdit Begin
	if(speaker.client)
		//speaker.dialogue_log += span_bold("([time_stamp()])") + " (" + span_bold("[speaker]/[speaker.client]") + ") " + span_underline("EMOTE:") + " - " + span_pink("[text]")
		//GLOB.round_text_log += span_bold("([time_stamp()])") + " (" + span_bold("[speaker]/[speaker.client]") + ") " + span_underline("EMOTE:") + " - " + span_pink("[text]")
		if(!SSdbcore.IsConnected())
			establish_db_connection()
			if(!SSdbcore.IsConnected())
				return null
		var/datum/db_query/query_insert = SSdbcore.NewQuery("INSERT INTO erro_dialog (mid, time, ckey, mob, type, message) VALUES (null, NOW(), :sender_ckey, :sender_mob, :message_type, :message_content)", \
			list("sender_ckey" = speaker.ckey, "sender_mob" = speaker.real_name, "message_type" = "emote", "message_content" = text))
		if(!query_insert.Execute())
			log_debug("Error during logging: "+query_insert.ErrorMsg())
			qdel(query_insert)
			return
		qdel(query_insert)
	//CHOMPEdit End

/proc/log_attack(attacker, defender, message)
	if (CONFIG_GET(flag/log_attack))
		WRITE_LOG(GLOB.diary, "ATTACK: [attacker] against [defender]: [message]")

/proc/log_adminsay(text, mob/speaker)
	if (CONFIG_GET(flag/log_adminchat))
		WRITE_LOG(GLOB.diary, "ADMINSAY: [speaker.simple_info_line()]: [html_decode(text)]")

/proc/log_modsay(text, mob/speaker)
	if (CONFIG_GET(flag/log_adminchat))
		WRITE_LOG(GLOB.diary, "MODSAY: [speaker.simple_info_line()]: [html_decode(text)]")

/proc/log_eventsay(text, mob/speaker)
	if (CONFIG_GET(flag/log_adminchat))
		WRITE_LOG(GLOB.diary, "EVENTSAY: [speaker.simple_info_line()]: [html_decode(text)]")

/proc/log_ghostsay(text, mob/speaker)
	if (CONFIG_GET(flag/log_say))
		WRITE_LOG(GLOB.diary, "DEADCHAT: [speaker.simple_info_line()]: [html_decode(text)]")
	//CHOMPEdit Begin
	if(speaker.client)
		if(!SSdbcore.IsConnected())
			establish_db_connection()
			if(!SSdbcore.IsConnected())
				return null
		var/datum/db_query/query_insert = SSdbcore.NewQuery("INSERT INTO erro_dialog (mid, time, ckey, mob, type, message) VALUES (null, NOW(), :sender_ckey, :sender_mob, :message_type, :message_content)", \
			list("sender_ckey" = speaker.ckey, "sender_mob" = speaker.real_name, "message_type" = "deadsay", "message_content" = text))
		if(!query_insert.Execute())
			log_debug("Error during logging: "+query_insert.ErrorMsg())
			qdel(query_insert)
			return
		qdel(query_insert)

	//speaker.dialogue_log += span_bold("([time_stamp()])") + " (" + span_bold("[speaker]/[speaker.client]") + ") " + span_underline("DEADSAY:") + " - " + span_green("[text]")
	//GLOB.round_text_log += span_small(span_purple(span_bold("([time_stamp()])") + " (" + span_bold("[speaker]/[speaker.client]") + ") " + span_underline("DEADSAY:") + " - [text]"))
	//CHOMPEdit End

/proc/log_ghostemote(text, mob/speaker)
	if (CONFIG_GET(flag/log_emote))
		WRITE_LOG(GLOB.diary, "DEADEMOTE: [speaker.simple_info_line()]: [html_decode(text)]")
	//CHOMPEdit Begin
	if(speaker.client)
		if(!SSdbcore.IsConnected())
			establish_db_connection()
			if(!SSdbcore.IsConnected())
				return null
		var/datum/db_query/query_insert = SSdbcore.NewQuery("INSERT INTO erro_dialog (mid, time, ckey, mob, type, message) VALUES (null, NOW(), :sender_ckey, :sender_mob, :message_type, :message_content)", \
			list("sender_ckey" = speaker.ckey, "sender_mob" = speaker.real_name, "message_type" = "deademote", "message_content" = text))
		if(!query_insert.Execute())
			log_debug("Error during logging: "+query_insert.ErrorMsg())
			qdel(query_insert)
			return
		qdel(query_insert)
	//CHOMPEdit End

/proc/log_adminwarn(text)
	if (CONFIG_GET(flag/log_adminwarn))
		WRITE_LOG(GLOB.diary, "ADMINWARN: [html_decode(text)]")

/proc/log_pda(text, mob/speaker)
	if (CONFIG_GET(flag/log_pda))
		WRITE_LOG(GLOB.diary, "PDA: [speaker.simple_info_line()]: [html_decode(text)]")
	//CHOMPEdit Begin
	if(speaker.client)
		if(!SSdbcore.IsConnected())
			establish_db_connection()
			if(!SSdbcore.IsConnected())
				return null
		var/datum/db_query/query_insert = SSdbcore.NewQuery("INSERT INTO erro_dialog (mid, time, ckey, mob, type, message) VALUES (null, NOW(), :sender_ckey, :sender_mob, :message_type, :message_content)", \
			list("sender_ckey" = speaker.ckey, "sender_mob" = speaker.real_name, "message_type" = "pda", "message_content" = text))
		if(!query_insert.Execute())
			log_debug("Error during logging: "+query_insert.ErrorMsg())
			qdel(query_insert)
			return
		qdel(query_insert)

	//speaker.dialogue_log += span_bold("([time_stamp()])") + " (" + span_bold("[speaker]/[speaker.client]") + ") " + span_underline("MSG:") + " - " + span_darkgreen("[text]")
	//GLOB.round_text_log += span_bold("([time_stamp()])") + " (" + span_bold("[speaker]/[speaker.client]") + ") " + span_underline("MSG:") + " - " + span_darkgreen("[text]")
	//CHOMPEdit End

/proc/log_to_dd(text)
	to_world_log(text) //this comes before the config check because it can't possibly runtime
	if(config?.loaded && CONFIG_GET(flag/log_world_output))
		WRITE_LOG(GLOB.diary, "DD_OUTPUT: [text]")

/proc/log_error(text)
	to_world_log(text)
	WRITE_LOG(GLOB.error_log, "RUNTIME: [text]")

/proc/log_misc(text)
	WRITE_LOG(GLOB.diary, "MISC: [text]")

/proc/log_sql(text)
	WRITE_LOG(GLOB.sql_error_log, "SQL: [text]")

/proc/log_query_debug(text)
	WRITE_LOG(GLOB.query_debug_log, "SQL: [text]")

/proc/log_topic(text)
	if(GLOB.Debug2)
		WRITE_LOG(GLOB.diary, "TOPIC: [text]")

/proc/log_unit_test(text)
	to_world_log("## UNIT_TEST: [text]")

#ifdef REFERENCE_TRACKING_LOG
#define log_reftracker(msg) WRITE_LOG(GLOB.diary, "## REF SEARCH [msg]")
#else
#define log_reftracker(msg)
#endif

/proc/log_asset(text)
	WRITE_LOG(GLOB.diary, "ASSET: [text]")

/// Puts the text into the research html file, not log. See [INVESTIGATE_RESEARCH] for [/atom/proc/investigate_log]
/proc/log_research(text)
	if(!text)
		return
	var/html_file = file("[GLOB.log_directory]/[INVESTIGATE_RESEARCH].html")
	WRITE_FILE(html_file, "[time_stamp()] [text]<br>")

/proc/report_progress(var/progress_message)
	admin_notice(span_boldannounce("[progress_message]"), R_DEBUG)
	to_world_log(progress_message)

//pretty print a direction bitflag, can be useful for debugging.
/proc/print_dir(var/dir)
	var/list/comps = list()
	if(dir & NORTH) comps += "NORTH"
	if(dir & SOUTH) comps += "SOUTH"
	if(dir & EAST) comps += "EAST"
	if(dir & WEST) comps += "WEST"
	if(dir & UP) comps += "UP"
	if(dir & DOWN) comps += "DOWN"

	return english_list(comps, nothing_text="0", and_text="|", comma_text="|")

//more or less a logging utility
//Always return "Something/(Something)", even if it's an error message.
/proc/key_name(var/whom, var/include_link = FALSE, var/include_name = TRUE, var/highlight_special_characters = TRUE)
	var/mob/M
	var/client/C
	var/key

	if(!whom)
		return "INVALID/INVALID"
	if(istype(whom, /client))
		C = whom
		M = C.mob
		key = C.key
	else if(ismob(whom))
		M = whom
		C = M.client
		key = M.key
	else if(istype(whom, /datum/mind))
		var/datum/mind/D = whom
		key = D.key
		M = D.current
		if(D.current)
			C = D.current.client
	else if(istype(whom, /datum))
		var/datum/D = whom
		return "INVALID/([D.type])"
	else if(istext(whom))
		return "AUTOMATED/[whom]" //Just give them the text back
	else
		return "INVALID/INVALID"

	. = ""

	if(key)
		if(include_link && C)
			. += "<a href='byond://?priv_msg=\ref[C]'>"

		if(C && C.holder && C.holder.fakekey)
			. += C.holder.rank_names() // CHOMPEdit: Stealth mode displays staff rank in PM Messages
		else
			. += key

		if(include_link)
			if(C)	. += "</a>"
			else	. += " (DC)"
	else
		. += "INVALID"

	if(include_name)
		var/name = "INVALID"
		if(M)
			if(M.real_name)
				name = M.real_name
			else if(M.name)
				name = M.name

			if(include_link && is_special_character(M) && highlight_special_characters)
				name = span_orange("[name]") //Orange

		. += "/([name])"

	return .

/proc/key_name_admin(var/whom, var/include_name = 1)
	return key_name(whom, 1, include_name)

// Helper procs for building detailed log lines
//
// These procs must not fail under ANY CIRCUMSTANCES!
//

/datum/proc/log_info_line()
	return "[src] ([type])"

/atom/log_info_line()
	. = ..()
	var/turf/t = get_turf(src)
	if(istype(t))
		return "[.] @ [t.log_info_line()]"
	else if(loc)
		return "[.] @ ([loc]) (0,0,0) ([loc.type])"
	else
		return "[.] @ (NULL) (0,0,0) (NULL)"

/turf/log_info_line()
	return "([src]) ([x],[y],[z]) ([type])"

/mob/log_info_line()
	return "[..()] (ckey=[ckey])"

/proc/log_info_line(var/datum/d)
	if(!d)
		return "*null*"
	if(!istype(d))
		return json_encode(d)
	return d.log_info_line()

/mob/proc/simple_info_line()
	return "[key_name(src)] ([x],[y],[z])"

/client/proc/simple_info_line()
	return "[key_name(src)] ([mob.x],[mob.y],[mob.z])"
