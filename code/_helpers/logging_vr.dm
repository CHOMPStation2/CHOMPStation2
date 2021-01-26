/proc/log_nsay(text, inside, mob/speaker)
	if (config.log_say)
		WRITE_LOG(diary, "NSAY (NIF:[inside]): [speaker.simple_info_line()]: [html_decode(text)]")
	//CHOMPEdit Begin
	if(speaker.client)
		if(!dbcon.IsConnected())
			establish_db_connection()
			if(!dbcon.IsConnected())
				return null
		var/DBQuery/query_insert = dbcon.NewQuery("INSERT INTO erro_dialog (mid, time, ckey, mob, type, message) VALUES (null, Now(), '[speaker.ckey]', '[speaker.real_name]', 'nsay', '[html_decode(text)]')")
		query_insert.ErrorMsg()
	//CHOMPEdit End

/proc/log_nme(text, inside, mob/speaker)
	if (config.log_emote)
		WRITE_LOG(diary, "NME (NIF:[inside]): [speaker.simple_info_line()]: [html_decode(text)]")
	//CHOMPEdit Begin
	if(speaker.client)
		if(!dbcon.IsConnected())
			establish_db_connection()
			if(!dbcon.IsConnected())
				return null
		var/DBQuery/query_insert = dbcon.NewQuery("INSERT INTO erro_dialog (mid, time, ckey, mob, type, message) VALUES (null, Now(), '[speaker.ckey]', '[speaker.real_name]', 'nme', '[html_decode(text)]')")
		query_insert.Execute()
	//CHOMPEdit End

/proc/log_subtle(text, mob/speaker)
	if (config.log_emote)
		WRITE_LOG(diary, "SUBTLE: [speaker.simple_info_line()]: [html_decode(text)]")
	//CHOMPEdit Begin
	if(speaker.client)
		if(!dbcon.IsConnected())
			establish_db_connection()
			if(!dbcon.IsConnected())
				return null
		var/DBQuery/query_insert = dbcon.NewQuery("INSERT INTO erro_dialog (mid, time, ckey, mob, type, message) VALUES (null, Now(), '[speaker.ckey]', '[speaker.real_name]', 'subtle', '[html_decode(text)]')")
		query_insert.Execute()
	//CHOMPEdit End
