/var/global/spacevines_spawned = 0

/datum/event/spacevine
	announceWhen	= 60

/datum/event/spacevine/start()
	spacevine_infestation()
	spacevines_spawned = 1

/datum/event/spacevine/announce()
	//level_seven_announcement() // Chomp Edit, this was stupid and vague and wrong.
	command_announcement.Announce("Hazardous plant infestation detected on \the [station_name()]. Station facilities may be overgrown.", "Hazardous Biomass")
