/datum/tgs_chat_command/sharktest
	name = "flip"
	help_text = "babies first TGS command"
	admin_only = FALSE

/datum/tgs_chat_command/sharktest/Run(datum/tgs_chat_user/sender, params)
	var/x
	if(params != "tails" && params != "heads")
		return "```You need to guess!\n either heads or tails!```"
	if(prob(50))
		if(params == "tails")
			x = "correct"
		else
			x = "wrong"
		return "```Tails. [x]!```"

	if(params == "tails")
		x = "wrong"
	else
		x = "correct"
	return "```Heads. [x]!```"

/datum/tgs_chat_command/sharktest/alias
	name = "coin"

/datum/tgs_chat_command/manifest
	name = "manifest"
	help_text = "Shows the current crew manifest"
	admin_only = FALSE

/proc/ManifestToHtml()
	var/html = ""
	if(data_core)
		html = data_core.get_manifest(FALSE,TRUE,snowflake = TRUE)
	else
		html = span_bold("ERROR: NO DATACORE") //Could make the error more fancy later
	rustg_file_write(html,"[CONFIG_GET(string/nodebot_location)]\\html.html")

/datum/tgs_chat_command/manifest/Run(datum/tgs_chat_user/sender, params)
	if(CONFIG_GET(flag/nodebot_enabled))
		ManifestToHtml()
		return "http://manifest.chompstation13.net/"
	else
		var/outp = "Crew Manifest:"
		var/list/total = list()
		if(data_core)
			data_core.get_manifest_list()
		for(var/list/item in PDA_Manifest)
			outp += "\n__**[item["cat"]]:**__"
			for(var/list/person in item["elems"])
				total |= person
				outp += "\n[person["name"]] -:- [person["rank"]]"

		return "**Total crew members:** [total.len]\n" + outp


/datum/tgs_chat_command/discordping
	name = "discordping"
	help_text = "Pings the discord associated with the associated ckey"
	admin_only = TRUE

/datum/tgs_chat_command/discordping/Run(datum/tgs_chat_user/sender, params)
	var/key_to_find = "[ckey(params)]"

	// They didn't provide anything worth looking up.
	if(!length(key_to_find))
		return "[sender.friendly_name], you need to provide a Byond username at the end of the command. It can be in 'key' format (with spaces and characters) or 'ckey' format (without spaces or special characters)."

	var/datum/db_query/query = SSdbcore.NewQuery("SELECT discord_id FROM erro_player WHERE ckey = :t_ckey",list("t_ckey" = key_to_find))
	query.Execute()

	if(!query.NextRow())
		qdel(query)
		return "[sender.friendly_name], the server's database is either not responding or there's no such ckey in the database."

	if(!query.item[1])
		qdel(query)
		return "[sender.friendly_name], [key_to_find] is in the database, but has no discord ID associated with them."
	var/discord_id = query.item[1]
	qdel(query)
	return "[key_to_find]'s discord is <@[discord_id]>"

/datum/tgs_chat_command/getkey
	name = "getkey"
	help_text = "Finds the key associated with a discord id"
	admin_only = TRUE

/datum/tgs_chat_command/getkey/Run(datum/tgs_chat_user/sender, params)
	if(!params)
		return "[sender.friendly_name], you need to provide a Discord ID at the end of the command. To obtain someone's Discord ID, you need to enable developer mode on discord, and then right click on their name and click Copy ID."

	var/datum/db_query/query = SSdbcore.NewQuery("SELECT ckey FROM erro_player WHERE discord_id = :t_discord", list("t_discord"=params))
	query.Execute()

	if(!query.NextRow())
		qdel(query)
		return "[sender.friendly_name], the server's database is either not responding or there's no such Discord ID in the database."

	var/user_key = query.item[1]
	qdel(query)
	return "<@[params]>'s ckey is [user_key]"

//modded fax code to properly handle non existing files before accessing the void
/datum/tgs_chat_command/readfax/Run(sender, params)
	var/list/all_params = splittext(params, " ")
	var/faxid = all_params[1]
	if(!all_params[1] || !fexists("[CONFIG_GET(string/fax_export_dir)]/fax_[faxid].html"))
		return "I’m sorry Dave, I’m afraid I can’t do that"
	var/faxmsg = return_file_text("[CONFIG_GET(string/fax_export_dir)]/fax_[faxid].html")
	return "FAX: ```[strip_html_properly(faxmsg)]```"

/datum/tgs_chat_command/vore
	name = "vore"
	help_text = "vore"
	admin_only = FALSE

/datum/tgs_chat_command/vore/Run(datum/tgs_chat_user/sender, params)
	return "vore"
