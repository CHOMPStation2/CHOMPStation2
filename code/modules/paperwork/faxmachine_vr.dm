/obj/machinery/photocopier/faxmachine
	req_one_access = list()

/**
 * Write the fax to disk as (potentially multiple) HTML files.
 * If the fax is a paper_bundle, do so recursively for each page.
 * returns a random unique faxid.
 */
/obj/machinery/photocopier/faxmachine/proc/export_fax(fax) //CHOMPEdit Begin
	var faxid = "[num2text(world.realtime,12)]_[rand(9999)+1]"
	if (istype(fax, /obj/item/weapon/paper))
		var/obj/item/weapon/paper/P = fax
		var/text = "<HTML><HEAD><TITLE>[P.name]</TITLE></HEAD><BODY>[P.info][P.stamps]</BODY></HTML>";
		rustg_file_write(text, "[config.fax_export_dir]/fax_[faxid].html")
	else if (istype(fax, /obj/item/weapon/photo))
		var/obj/item/weapon/photo/H = fax
		fcopy(H.img, "[config.fax_export_dir]/photo_[faxid].png")
		var/text = "<html><head><title>[H.name]</title></head>" \
			+ "<body style='overflow:hidden;margin:0;text-align:center'>" \
			+ "<img src='photo_[faxid].png'>" \
			+ "[H.scribble ? "<br>Written on the back:<br><i>[H.scribble]</i>" : ""]"\
			+ "</body></html>"
		rustg_file_write(text, "[config.fax_export_dir]/fax_[faxid].html")
	else if (istype(fax, /obj/item/weapon/paper_bundle))
		var/def_faxid = faxid
		faxid += "_0"
		var/obj/item/weapon/paper_bundle/B = fax
		var/data = ""
		for (var/page = 1, page <= B.pages.len, page++)
			var/obj/pageobj = B.pages[page]
			var/page_faxid = export_fax_id(pageobj,def_faxid + "_[page]")
			data += "<a href='fax_[page_faxid].html'>Page [page] - [pageobj.name]</a><br>"
		var/text = "<html><head><title>[B.name]</title></head><body>[data]</body></html>"
		rustg_file_write(text, "[config.fax_export_dir]/fax_[faxid].html")
	return faxid

/obj/machinery/photocopier/faxmachine/proc/export_fax_id(fax,faxid)
	if (istype(fax, /obj/item/weapon/paper))
		var/obj/item/weapon/paper/P = fax
		var/text = "<HTML><HEAD><TITLE>[P.name]</TITLE></HEAD><BODY>[P.info][P.stamps]</BODY></HTML>";
		rustg_file_write(text, "[config.fax_export_dir]/fax_[faxid].html")
	else if (istype(fax, /obj/item/weapon/photo))
		var/obj/item/weapon/photo/H = fax
		fcopy(H.img, "[config.fax_export_dir]/photo_[faxid].png")
		var/text = "<html><head><title>[H.name]</title></head>" \
			+ "<body style='overflow:hidden;margin:0;text-align:center'>" \
			+ "<img src='photo_[faxid].png'>" \
			+ "[H.scribble ? "<br>Written on the back:<br><i>[H.scribble]</i>" : ""]"\
			+ "</body></html>"
		rustg_file_write(text, "[config.fax_export_dir]/fax_[faxid].html")
	return faxid
//CHOMPEdit End
/**
 * Call the chat webhook to transmit a notification of an admin fax to the admin chat.
 */
/obj/machinery/photocopier/faxmachine/proc/message_chat_admins(var/mob/sender, var/faxname, var/obj/item/sent, var/faxid, font_colour="#006100")
	if(config.discord_faxes_disabled) //CHOMPEdit
		return
	if (config.chat_webhook_url)
		spawn(0)
			var/query_string = "type=fax"
			query_string += "&key=[url_encode(config.chat_webhook_key)]"
			query_string += "&faxid=[url_encode(faxid)]"
			query_string += "&color=[url_encode(font_colour)]"
			query_string += "&faxname=[url_encode(faxname)]"
			query_string += "&sendername=[url_encode(sender.name)]"
			query_string += "&sentname=[url_encode(sent.name)]"
			world.Export("[config.chat_webhook_url]?[query_string]")
	//YW EDIT //CHOMPEdit also
	var/idlen = length(faxid) + 1
	if (istype(sent, /obj/item/weapon/paper_bundle))
		var/obj/item/weapon/paper_bundle/B = sent
		faxid = copytext(faxid,1,idlen-2)
		var/faxids = "FAXMULTIID: [faxid]_0"
		var/contents = ""

		if((!config.nodebot_enabled) && config.discord_faxes_autoprint)
			var/faxmsg = return_file_text("[config.fax_export_dir]/fax_[faxid]_0.html")
			contents += "\nFAX: ```[strip_html_properly(faxmsg)]```"

		for(var/page = 1, page <= B.pages.len, page++)
			var/curid = "[faxid]_[page]"
			faxids+= "|[curid]"
			if((!config.nodebot_enabled) && config.discord_faxes_autoprint)
				var/faxmsg = return_file_text("[config.fax_export_dir]/fax_[curid].html")
				contents += "\nFAX PAGE [page]: ```[strip_html_properly(faxmsg)]```"

		world.TgsTargetedChatBroadcast("MULTIFAX: [sanitize(faxname)] / [sanitize(sent.name)] - SENT BY: [sanitize(sender.name)] - [faxids] [contents]", TRUE) 
	else
		var/contents = ""
		if((!config.nodebot_enabled) && config.discord_faxes_autoprint)
			var/faxmsg = return_file_text("[config.fax_export_dir]/fax_[faxid].html")
			contents += "\nFAX: ```[strip_html_properly(faxmsg)]```"
		world.TgsTargetedChatBroadcast("FAX: [sanitize(faxname)] / [sanitize(sent.name)] - SENT BY: [sanitize(sender.name)] - FAXID: **[sanitize(faxid)]** [contents]", TRUE) 
	//YW EDIT END

//
// Overrides/additions to stock defines go here, as well as hooks. Sort them by
// the object they are overriding. So all /mob/living together, etc.
//
/datum/configuration
	var/chat_webhook_url = ""		// URL of the webhook for sending announcements/faxes to discord chat.
	var/chat_webhook_key = ""		// Shared secret for authenticating to the chat webhook
	var/fax_export_dir = "data/faxes"	// Directory in which to write exported fax HTML files.
