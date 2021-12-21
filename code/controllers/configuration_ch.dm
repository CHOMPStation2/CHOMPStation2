// Making this file to allow us to easily understand the location of any modifications to the config file made by Chompers and to try and prevent any conflicts happening in the future.
// Basically a copy pasta from virgo's configuration.dm file but it'll make life easer for us to just toggle on/off.


/datum/configuration
	var/discord_restriction = 0
	var/use_jobwhitelist = 1
	var/emojis = 1

	var/vorefootstep_volume = 75	//In future see about making a function to adjust volume serverside in config.txt, easy to do with reenable values. - Jack

	var/nodebot_enabled = 0				//So, nodebot is a supplement to the TGS discord bot pretty much. For things likes faxes and the manifest it's very helpful because it's able to render html into an image and post it.
	var/nodebot_location				//We need to print the manifest to this location so nodebot can render it to chat.		//NOTE: TO BE REPLACED BY BETTER CODE FOR FETCHING MANIFEST
	var/ahelp_channel_tag				//This is for tgs4 channels, if you're not running on tgs4, this won't work anyways. If it's not set, it will default to the admin channel.
	var/discord_faxes_autoprint = 0		//Only turn this on if you're not using the nodebot.
	var/discord_faxes_disabled = 0		//Turn this off if you don't want the TGS bot sending you messages whenever a fax is sent to central.
	var/discord_ahelps_disabled = 0		//Turn this off if you don't want the TGS bot sending you messages whenever an ahelp ticket is created.
	var/discord_ahelps_all = 0			//Turn this on if you want all admin-PMs to go to be sent to discord, and not only the first message of a ticket.

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
	return 1
