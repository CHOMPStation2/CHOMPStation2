/proc/log_nsay(text, inside, mob/speaker)
	if (config.log_say)
		WRITE_LOG(diary, "NSAY (NIF:[inside]): [speaker.simple_info_line()]: [html_decode(text)]")
	//CHOMPEdit Begin
	if(speaker.client)
		if(!SSdbcore.IsConnected())
			establish_db_connection()
			if(!SSdbcore.IsConnected())
				return null
		SSdbcore.ReturnlessQuery("INSERT INTO erro_dialog (mid, time, ckey, mob, type, message) VALUES (null, '[time2text(world.timeofday, "YYYY-MM-DD hh:mm:ss")]', :sender_ckey, :sender_mob, :message_type, :message_content)", \
			list("sender_ckey" = speaker.ckey, "sender_mob" = speaker.real_name, "message_type" = "nsay", "message_content" = text))
		//SSdbcore.QuerySelect(list(query_insert), warn = FALSE, qdel = TRUE)
	//CHOMPEdit End

/proc/log_nme(text, inside, mob/speaker)
	if (config.log_emote)
		WRITE_LOG(diary, "NME (NIF:[inside]): [speaker.simple_info_line()]: [html_decode(text)]")
	//CHOMPEdit Begin
	if(speaker.client)
		if(!SSdbcore.IsConnected())
			establish_db_connection()
			if(!SSdbcore.IsConnected())
				return null
		SSdbcore.ReturnlessQuery("INSERT INTO erro_dialog (mid, time, ckey, mob, type, message) VALUES (null, '[time2text(world.timeofday, "YYYY-MM-DD hh:mm:ss")]', :sender_ckey, :sender_mob, :message_type, :message_content)", \
			list("sender_ckey" = speaker.ckey, "sender_mob" = speaker.real_name, "message_type" = "nme", "message_content" = text))
		//SSdbcore.QuerySelect(list(query_insert), warn = FALSE, qdel = TRUE)
	//CHOMPEdit End

/proc/log_subtle(text, mob/speaker)
	if (config.log_emote)
		WRITE_LOG(diary, "SUBTLE: [speaker.simple_info_line()]: [html_decode(text)]")
	//CHOMPEdit Begin
	if(speaker.client)
		if(!SSdbcore.IsConnected())
			establish_db_connection()
			if(!SSdbcore.IsConnected())
				return null
		SSdbcore.ReturnlessQuery("INSERT INTO erro_dialog (mid, time, ckey, mob, type, message) VALUES (null, '[time2text(world.timeofday, "YYYY-MM-DD hh:mm:ss")]', :sender_ckey, :sender_mob, :message_type, :message_content)", \
			list("sender_ckey" = speaker.ckey, "sender_mob" = speaker.real_name, "message_type" = "subtle", "message_content" = text))
		//SSdbcore.QuerySelect(list(query_insert), warn = FALSE, qdel = TRUE)
	//CHOMPEdit End
