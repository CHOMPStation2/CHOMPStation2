/datum/server_tools_command/who
	name = "players"	//the string to trigger this command on a chat bot. e.g. TGS3_BOT: do_this_command
	help_text = "Will broadcast the current player count"	//help text for this command
	required_parameters = 0	//number of parameters required for this command
	admin_only = FALSE	//set to TRUE if this command should only be usable by registered chat admins

/datum/server_tools_command/who/Run(sender, params)
	SERVER_TOOLS_CHAT_BROADCAST("[SERVER_TOOLS_CLIENT_COUNT]")