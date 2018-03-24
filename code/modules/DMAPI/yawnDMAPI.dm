/datum/server_tools_command/status
	name = "status"	//the string to trigger this command on a chat bot. e.g. TGS3_BOT: do_this_command
	help_text = "Will broadcast the current player count and other round information"	//help text for this command
	required_parameters = 0	//number of parameters required for this command
	admin_only = FALSE	//set to TRUE if this command should only be usable by registered chat admins

/datum/server_tools_command/status/Run(sender, params)
	return "```PLAYERCOUNT: [SERVER_TOOLS_CLIENT_COUNT]	ROUND DURATION: [roundduration2text()]```"

// - FAX
/datum/server_tools_command/readfax
	name = "readfax"
	help_text = "Reads a fax with specified faxid"
	required_parameters = 1
	admin_only = TRUE

/datum/server_tools_command/readfax/Run(sender, params)
	var/list/all_params = splittext(params, " ")
	var/faxid = all_params[1]
	var/faxmsg = return_file_text("[config.fax_export_dir]/fax_[faxid].html")
	return "FAX: ```[strip_html_properly(faxmsg)]```"