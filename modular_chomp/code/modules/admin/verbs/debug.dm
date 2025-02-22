/client/proc/reload_configuration()
	set category = "Debug.Server"
	set name = "Reload Configuration"
	set desc = "Force config reload to world default"
	if(!check_rights(R_DEBUG))
		return
	if(tgui_alert(usr, "Are you absolutely sure you want to reload the configuration from the default path on the disk, wiping any in-round modifications?", "Really reset?", list("No", "Yes")) == "Yes")
		config.admin_reload()
