

var/global/client_count = 0

/client/New()
	..()
	++global.client_count

/client/Del()
	..()
	--global.client_count

/datum/tgs_chat_command/status
	name = "status"	//the string to trigger this command on a chat bot. e.g. TGS3_BOT: do_this_command
	help_text = "Will broadcast the current player count and other round information"	//help text for this command
	admin_only = FALSE	//set to TRUE if this command should only be usable by registered chat admins

/datum/tgs_chat_command/status/Run(datum/tgs_chat_user/sender, params)
	return "```PLAYERCOUNT: [SERVER_TOOLS_CLIENT_COUNT]	ROUND DURATION: [roundduration2text()]```"

// - FAX
/datum/tgs_chat_command/readfax
	name = "readfax"
	help_text = "Reads a fax with specified faxid"
	admin_only = TRUE

/datum/tgs_chat_command/readfax/Run(datum/tgs_chat_user/sender, params)
	var/list/all_params = splittext(params, " ")
	var/faxid = all_params[1]
	var/faxmsg = return_file_text("[config.fax_export_dir]/fax_[faxid].html")
	return "FAX: ```[strip_html_properly(faxmsg)]```"