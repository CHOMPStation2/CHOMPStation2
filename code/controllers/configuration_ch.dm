// Making this file to allow us to easily understand the location of any modifications to the config file made by Chompers and to try and prevent any conflicts happening in the future.
// Basically a copy pasta from virgo's configuration.dm file but it'll make life easer for us to just toggle on/off.


/datum/configuration
	var/discord_restriction = 0
	var/use_jobwhitelist = 1
	var/emojis = 1

	var/vorefootstep_volume = 75	//In future see about making a function to adjust volume serverside in config.txt, easy to do with reenable values. - Jack

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
//		var/value = null //Commenting out because config doesn't contain any values at the moment. - Jonathan

		if (pos)
			name = lowertext(copytext(t, 1, pos))
//			value = copytext(t, pos + 1) //Commenting out because config doesn't contain any values at the moment. - Jonathan
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
	return 1
