/datum/admin_help/proc/send2adminchat()
	if(!config.chat_webhook_url)
		return

	var/list/adm = get_admin_counts()
	var/list/afkmins = adm["afk"]
	var/list/allmins = adm["total"]

	spawn(0) //Unreliable world.Exports()
		var/query_string = "type=adminhelp"
		query_string += "&key=[url_encode(config.chat_webhook_key)]"
		query_string += "&from=[url_encode(key_name(initiator))]"
		query_string += "&msg=[url_encode(html_decode(name))]"
		query_string += "&admin_number=[allmins.len]"
		query_string += "&admin_number_afk=[afkmins.len]"
		world.Export("[config.chat_webhook_url]?[query_string]")


/* //CHOMPStation Addition 14/1/20 Ksc - Committing this out to be replaced with a improved request spice.
/client/verb/adminspice()
	set category = "Admin"
	set name = "Request Spice"
	set desc = "Request admins to spice round up for you"

	//handle muting and automuting
	if(prefs.muted & MUTE_ADMINHELP)
		to_chat(usr, "<span class='danger'>Error: You cannot request spice (muted from adminhelps).</span>")
		return

	if(alert(usr, "Are you sure you want to request the admins spice things up for you? You accept the consequences if you do.",,"No","Yes") != "No")
		message_admins("[ADMIN_FULLMONTY(usr)] has requested the round be spiced up a little.")
		to_chat(usr, "<span class='notice'>You have requested some more spice in your round.</span>")
	else
		to_chat(usr, "<span class='notice'>Spice request cancelled.</span>")
		return

	//if they requested spice, then remove spice verb temporarily to prevent spamming
	usr.verbs -= /client/verb/adminspice
	spawn(6000)
		usr.verbs += /client/verb/adminspice	// 10 minute cool-down for spice request
*/

/mob/verb/Spice(msg as text) //CHOMPStation Addition 14/1/20 Ksc - The improved request spice command.
	set category = "Admin"
	set name = "Request Spice"
	set desc = "Request for admins to challange your shift"

	if(say_disabled)	//This is here to try to identify lag problems
		to_chat (usr, "<font color='red'>Speech is currently admin-disabled.</font>")
		return

	msg = sanitize(msg)
	if(!msg)	return

	if(usr.client)
		if(msg)
			client.handle_spam_prevention(MUTE_PRAY)
			if(usr.client.prefs.muted & MUTE_PRAY)
				to_chat (usr, "<font color='red'> No spice for you. (muted).</font>")
				return

	var/image/cross = image('icons/obj/food.dmi',"enchiladas")
	msg = "<font color='blue'>\icon[cross] <b><font color=#AD5AAD>SPICE: </font>[key_name(src, 1)] (<A HREF='?_src_=holder;adminmoreinfo=\ref[src]'>?</A>) (<A HREF='?_src_=holder;adminplayeropts=\ref[src]'>PP</A>) (<A HREF='?_src_=vars;Vars=\ref[src]'>VV</A>) (<A HREF='?_src_=holder;subtlemessage=\ref[src]'>SM</A>) ([admin_jump_link(src, src)]) (<A HREF='?_src_=holder;secretsadmin=check_antagonist'>CA</A>) (<A HREF='?_src_=holder;adminspawncookie=\ref[src]'>SC</a>) (<A HREF='?_src_=holder;adminsmite=\ref[src]'>SMITE</a>):</b> [msg]</font>"

	for(var/client/C in admins)
		if(R_ADMIN & C.holder.rights)
			if(C.is_preference_enabled(/datum/client_preference/admin/show_chat_prayers))
				C << msg
				C << 'sound/effects/ding.ogg'
	to_chat (usr, "Be wary of the cookie.")

	feedback_add_details("admin_verb","spicech")	//If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!
	//log_admin("HELP: [key_name(src)]: [msg]")

