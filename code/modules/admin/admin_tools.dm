/client/proc/cmd_admin_check_player_logs(mob/living/M as mob in mob_list)
	set category = "Admin"
	set name = "Check Player Attack Logs"
	set desc = "Check a player's attack logs."

//Views specific attack logs belonging to one player.
	var/dat = "<B>[M]'s Attack Log:<HR></B>"
	dat += "<b>Viewing attack logs of [M]</b> - (Played by ([key_name(M)]).<br>"
	if(M.mind)
		dat += "<b>Current Antag?:</b> [(M.mind.special_role)?"Yes":"No"]<br>"
	dat += "<br><b>Note:</b> This is arranged from earliest to latest. <br><br>"
	//CHOMPEdit Begin
	/*for(var/d in M.dialogue_log)
		dat += "[d]<br>"*/
	var/DBQuery/query = SSdbcore.NewQuery("SELECT id,time,ckey,mob,message from erro_attacklog WHERE ckey = :t_ckey", list("t_ckey" = M.ckey))
	if(!query.Execute())
		dat += "<i>Database query error</i>"
	else
		var/messages = ""
		while(query.NextRow())
			messages += "([query.item[2]]) (ckey:[query.item[3]] real_name:[query.item[4]]) [query.item[5]]<br>"

		if(messages=="")
			dat+="<i>Query returned nothing.</i>"
		else
			dat += "<fieldset style='border: 2px solid white; display: inline'>"
			dat += messages
			dat += "</fieldset>"
	qdel(query)
	//CHOMPEdit End

	var/datum/browser/popup = new(usr, "admin_attack_log", "[src]", 650, 650, src)
	popup.set_content(jointext(dat,null))
	popup.open()

	onclose(usr, "admin_attack_log")

	feedback_add_details("admin_verb","PL") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/client/proc/cmd_admin_check_dialogue_logs(mob/living/M as mob in mob_list)
	set category = "Admin"
	set name = "Check Player Dialogue Logs"
	set desc = "Check a player's dialogue logs."

//Views specific dialogue logs belonging to one player.
	var/dat = "<B>[M]'s Dialogue Log:<HR></B>"
	dat += "<b>Viewing say and emote logs of [M]</b> - (Played by ([key_name(M)]).<br>"
	if(M.mind)
		dat += "<b>Current Antag?:</b> [(M.mind.special_role)?"Yes":"No"]<br>"
	dat += "<br><b>Note:</b> This is arranged from earliest to latest. <br><br>"

	
	//CHOMPEdit Begin
	/*for(var/d in M.dialogue_log)
		dat += "[d]<br>"*/
	var/DBQuery/query = SSdbcore.NewQuery("SELECT mid,time,ckey,mob,type,message from erro_dialog WHERE ckey = :t_ckey", list("t_ckey" = M.ckey))
	if(!query.Execute())
		dat += "<i>Database query error</i>"
	else
		var/messages = ""
		while(query.NextRow())
			messages += "([query.item[2]]) (ckey:[query.item[3]] real_name:[query.item[4]] type:[query.item[5]]) [query.item[6]]<br>"

		if(messages=="")
			dat+="<i>Query returned nothing.</i>"
		else
			dat += "<fieldset style='border: 2px solid white; display: inline'>"
			dat += messages
			dat += "</fieldset>"
	qdel(query)
	//CHOMPEdit End
	var/datum/browser/popup = new(usr, "admin_dialogue_log", "[src]", 650, 650, src)
	popup.set_content(jointext(dat,null))
	popup.open()

	onclose(usr, "admin_dialogue_log")


	feedback_add_details("admin_verb","PDL") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!