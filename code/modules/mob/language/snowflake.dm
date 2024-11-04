/mob
	var/hive_lang_range = 0

/mob/proc/adjust_hive_range()
	set name = "Adjust Special Language Range"
	set desc = "Changes the range you will transmit your hive language to!"
<<<<<<< HEAD
	set category = "IC.Settings" //CHOMPEdit
=======
	set category = "IC.Settings"
>>>>>>> 4879a52633 (Server maint subsystem (#16518))

	var/option = tgui_alert(src, "What range?", "Adjust special language range", list("Global","This Z level","Local", "Subtle"))

	switch(option)
		if("Global")
			hive_lang_range = 0
		if("This Z level")
			hive_lang_range = -1
		if("Local")
			hive_lang_range = world.view
		if("Subtle")
			hive_lang_range = 1
