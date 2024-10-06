// Making this file to allow us to easily understand the location of any modifications to the config file made by Chompers and to try and prevent any conflicts happening in the future.
// Basically a copy pasta from virgo's configuration.dm file but it'll make life easer for us to just toggle on/off.


/datum/configuration
	var/discord_restriction = FALSE
	var/use_jobwhitelist = FALSE
	var/emojis = FALSE

	var/vorefootstep_volume = 75	//In future see about making a function to adjust volume serverside in config.txt, easy to do with reenable values. - Jack

	var/nodebot_enabled = 0				//So, nodebot is a supplement to the TGS discord bot pretty much. For things likes faxes and the manifest it's very helpful because it's able to render html into an image and post it.
	var/nodebot_location				//We need to print the manifest to this location so nodebot can render it to chat.		//NOTE: TO BE REPLACED BY BETTER CODE FOR FETCHING MANIFEST

	//These are for tgs4 channels, for discord chatbots used in TGS.
	var/ahelp_channel_tag
	var/fax_channel_tag
	var/role_request_channel_tag

	//These are for the role request TGS discord bot. Role IDs to ping.
	var/role_request_id_command
	var/role_request_id_security
	var/role_request_id_engineering
	var/role_request_id_medical
	var/role_request_id_research
	var/role_request_id_supply
	var/role_request_id_service
	var/role_request_id_expedition
	var/role_request_id_silicon

	var/discord_faxes_autoprint = 0		//Only turn this on if you're not using the nodebot.
	var/discord_faxes_disabled = 0		//Turn this off if you don't want the TGS bot sending you messages whenever a fax is sent to central.
	var/discord_ahelps_disabled = 0		//Turn this off if you don't want the TGS bot sending you messages whenever an ahelp ticket is created.
	var/discord_ahelps_all = 0			//Turn this on if you want all admin-PMs to go to be sent to discord, and not only the first message of a ticket.


	var/list/ip_whitelist = list()

/hook/startup/proc/read_ch_config()
	var/list/Lines = file2list("config/config.txt")
	for(var/t in Lines)
		if(!t)	continue

		t = trim(t)
		if (length(t) == 0)
			continue
		else if (copytext(t, 1, 2) == "#")
			continue

		var/pos = findtext(t, " ")
		var/name = null
		var/value = null

		if (pos)
			name = lowertext(copytext(t, 1, pos))
			value = copytext(t, pos + 1)
		else
			name = lowertext(t)

		if (!name)
			continue

		switch (name)
			if ("discord_restriction")
				config.discord_restriction = 1
			if ("use_jobwhitelist")
				config.use_jobwhitelist = 1
			if ("disable_emojis")
				config.emojis = 0
			if ("nodebot_enabled")
				config.nodebot_enabled = 1
			if ("discord_faxes_autoprint")
				config.discord_faxes_autoprint = 1
			if ("discord_faxes_disabled")
				config.discord_faxes_disabled = 1
			if ("discord_ahelps_disabled")
				config.discord_ahelps_disabled = 1
			if ("discord_ahelps_all")
				config.discord_ahelps_all = 1
			if ("nodebot_location")
				config.nodebot_location = value
			if ("ahelp_channel_tag")
				config.ahelp_channel_tag = value
			if ("fax_channel_tag")
				config.fax_channel_tag = value
			if ("role_request_channel_tag")
				config.role_request_channel_tag = value
			if ("role_request_id_command")
				config.role_request_id_command = value
			if ("role_request_id_security")
				config.role_request_id_security = value
			if ("role_request_id_engineering")
				config.role_request_id_engineering = value
			if ("role_request_id_medical")
				config.role_request_id_medical = value
			if ("role_request_id_research")
				config.role_request_id_research = value
			if ("role_request_id_supply")
				config.role_request_id_supply = value
			if ("role_request_id_service")
				config.role_request_id_service = value
			if ("role_request_id_expedition")
				config.role_request_id_expedition = value
			if ("role_request_id_silicon")
				config.role_request_id_silicon = value
			if("job_camp_time_limit")
				config.job_camp_time_limit = value MINUTES


	var/list/ip_whitelist_lines = file2list("config/ip_whitelist.txt")
	var/increment = 1
	for(var/t in ip_whitelist_lines)
		if (!t) continue
		t = trim(t)
		if (length(t) == 0)
			continue
		else if (copytext(t, 1, 2) == "#")
			continue
		var/ip_address = splittext(t, ",")
		for (var/name in ip_address)
			config.ip_whitelist[name] = increment
		increment += 1


	return 1
