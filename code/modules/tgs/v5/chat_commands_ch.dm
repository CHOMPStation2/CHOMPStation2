/datum/tgs_chat_command/manifest
	name = "manifest"
	help_text = "Shows the current crew manifest"
	admin_only = FALSE

/datum/tgs_chat_command/manifest/Run(datum/tgs_chat_user/sender, params)
	var/outp = "Crew Manifest:"
	if(data_core)
		data_core.get_manifest_list()
	for(var/list/item in PDA_Manifest)
		outp += "\n__**[item["cat"]]:**__"
		for(var/list/person in item["elems"])
			outp += "\n[person["name"]] -:- [person["rank"]]"
	return outp

/datum/tgs_chat_command/discordping
	name = "discordping"
	help_text = "Pings the discord associated with the associated ckey"
	admin_only = TRUE

/datum/tgs_chat_command/discordping/Run(datum/tgs_chat_user/sender, params)
	var/key_to_find = "[ckey(params)]"

	// They didn't provide anything worth looking up.
	if(!length(key_to_find))
		return "[sender.friendly_name], you need to provide a Byond username at the end of the command. It can be in 'key' format (with spaces and characters) or 'ckey' format (without spaces or special characters)."

	var/DBQuery/query = SSdbcore.NewQuery("SELECT discord_id FROM erro_player WHERE ckey = :t_ckey",list("t_ckey" = key_to_find))
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

	var/DBQuery/query = SSdbcore.NewQuery("SELECT discord_id FROM erro_player WHERE discord_id = :t_discord", list("t_discord"=params))
	query.Execute()

	if(!query.NextRow())
		qdel(query)
		return "[sender.friendly_name], the server's database is either not responding or there's no such Discord ID in the database."

	var/user_key = query.item[1]
	return "<@[params]>'s ckey is [user_key]"