/proc/log_nsay(text, inside, mob/speaker)
<<<<<<< HEAD
	if (CONFIG_GET(flag/log_say)) // CHOMPEdit
=======
	if (CONFIG_GET(flag/log_say))
>>>>>>> 242fa3a66b (Ports over configuration controller (#16484))
		WRITE_LOG(diary, "NSAY (NIF:[inside]): [speaker.simple_info_line()]: [html_decode(text)]")
	//CHOMPEdit Begin
	if(speaker.client)
		if(!SSdbcore.IsConnected())
			establish_db_connection()
			if(!SSdbcore.IsConnected())
				return null
		var/datum/db_query/query_insert = SSdbcore.NewQuery("INSERT INTO erro_dialog (mid, time, ckey, mob, type, message) VALUES (null, NOW(), :sender_ckey, :sender_mob, :message_type, :message_content)", \
			list("sender_ckey" = speaker.ckey, "sender_mob" = speaker.real_name, "message_type" = "nsay", "message_content" = text))
		if(!query_insert.Execute())
			log_debug("Error during logging: "+query_insert.ErrorMsg())
			qdel(query_insert)
			return
		qdel(query_insert)
	//CHOMPEdit End

/proc/log_nme(text, inside, mob/speaker)
<<<<<<< HEAD
	if (CONFIG_GET(flag/log_emote)) // CHOMPEdit
=======
	if (CONFIG_GET(flag/log_emote))
>>>>>>> 242fa3a66b (Ports over configuration controller (#16484))
		WRITE_LOG(diary, "NME (NIF:[inside]): [speaker.simple_info_line()]: [html_decode(text)]")
	//CHOMPEdit Begin
	if(speaker.client)
		if(!SSdbcore.IsConnected())
			establish_db_connection()
			if(!SSdbcore.IsConnected())
				return null
		var/datum/db_query/query_insert = SSdbcore.NewQuery("INSERT INTO erro_dialog (mid, time, ckey, mob, type, message) VALUES (null, NOW(), :sender_ckey, :sender_mob, :message_type, :message_content)", \
			list("sender_ckey" = speaker.ckey, "sender_mob" = speaker.real_name, "message_type" = "nme", "message_content" = text))
		if(!query_insert.Execute())
			log_debug("Error during logging: "+query_insert.ErrorMsg())
			qdel(query_insert)
			return
		qdel(query_insert)
	//CHOMPEdit End

/proc/log_subtle(text, mob/speaker)
<<<<<<< HEAD
	if (CONFIG_GET(flag/log_emote)) // CHOMPEdit
=======
	if (CONFIG_GET(flag/log_emote))
>>>>>>> 242fa3a66b (Ports over configuration controller (#16484))
		WRITE_LOG(diary, "SUBTLE: [speaker.simple_info_line()]: [html_decode(text)]")
	//CHOMPEdit Begin
	if(speaker.client)
		if(!SSdbcore.IsConnected())
			establish_db_connection()
			if(!SSdbcore.IsConnected())
				return null
		var/datum/db_query/query_insert = SSdbcore.NewQuery("INSERT INTO erro_dialog (mid, time, ckey, mob, type, message) VALUES (null, NOW(), :sender_ckey, :sender_mob, :message_type, :message_content)", \
			list("sender_ckey" = speaker.ckey, "sender_mob" = speaker.real_name, "message_type" = "subtle", "message_content" = text))
		if(!query_insert.Execute())
			log_debug("Error during logging: "+query_insert.ErrorMsg())
			qdel(query_insert)
			return
		qdel(query_insert)
	//CHOMPEdit End
