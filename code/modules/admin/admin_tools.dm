/client/proc/cmd_admin_check_player_logs(mob/living/M as mob in mob_list)
	set category = "Admin.Logs" //CHOMPEdit
	set name = "Check Player Attack Logs"
	set desc = "Check a player's attack logs."
	show_cmd_admin_check_player_logs(M) //CHOMPEdit
//Views specific attack logs belonging to one player.
/client/proc/show_cmd_admin_check_player_logs(mob/living/M) //CHOMPEdit
	var/dat = span_bold("[M]'s Attack Log:<HR>")
	dat += span_bold("Viewing attack logs of [M]") + " - (Played by ([key_name(M)]).<br>"
	if(M.mind)
		dat += span_bold("Current Antag?:") + " [(M.mind.special_role)?"Yes":"No"]<br>"
	dat += "<br>" + span_bold("Note:") + " This is arranged from earliest to latest. <br><br>"
	//CHOMPEdit Begin
	/*for(var/d in M.dialogue_log)
		dat += "[d]<br>"*/
	var/datum/db_query/query = SSdbcore.NewQuery("SELECT id,time,ckey,mob,message from erro_attacklog WHERE ckey = :t_ckey", list("t_ckey" = M.ckey))
	if(!query.Execute())
		dat += span_italics("Database query error")
	else
		var/messages = ""
		while(query.NextRow())
			messages += "([query.item[2]]) (ckey:[query.item[3]] real_name:[query.item[4]]) [query.item[5]]<br>"

		if(messages=="")
			dat+= span_italics("Query returned nothing.")
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
	set category = "Admin.Logs" //CHOMPEdit
	set name = "Check Player Dialogue Logs"
	set desc = "Check a player's dialogue logs."
	show_cmd_admin_check_dialogue_logs(M) //CHOMPEdit

/client/proc/show_cmd_admin_check_dialogue_logs(mob/living/M) //CHOMPEdit
//Views specific dialogue logs belonging to one player.
	var/dat = span_bold("[M]'s Dialogue Log:<HR>")
	dat += span_bold("Viewing say and emote logs of [M]") + " - (Played by ([key_name(M)]).<br>"
	if(M.mind)
		dat += span_bold("Current Antag?:") + " [(M.mind.special_role)?"Yes":"No"]<br>"
	dat += "<br>" + span_bold("Note:") + " This is arranged from earliest to latest. <br><br>"


	//CHOMPEdit Begin
	/*for(var/d in M.dialogue_log)
		dat += "[d]<br>"*/
	var/datum/db_query/query = SSdbcore.NewQuery("SELECT mid,time,ckey,mob,type,message from erro_dialog WHERE ckey = :t_ckey", list("t_ckey" = M.ckey))
	if(!query.Execute())
		dat += span_italics("Database query error")
	else
		var/messages = ""
		while(query.NextRow())
			messages += "([query.item[2]]) (ckey:[query.item[3]] real_name:[query.item[4]] type:[query.item[5]]) [query.item[6]]<br>"

		if(messages=="")
			dat+=span_italics("Query returned nothing.")
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
