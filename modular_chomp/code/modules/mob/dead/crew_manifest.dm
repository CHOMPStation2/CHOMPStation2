/datum/crew_manifest

/datum/crew_manifest/tgui_state(mob/user)
	return GLOB.tgui_always_state

/datum/crew_manifest/tgui_status(mob/user, datum/tgui_state/state)
	return (isnewplayer(user) || isobserver(user) || isAI(user) || ispAI(user)) ? STATUS_INTERACTIVE : STATUS_CLOSE

/datum/crew_manifest/tgui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if (!ui)
		ui = new(user, src, "CrewManifest")
		ui.open()

/datum/crew_manifest/tgui_act(action, list/params, datum/tgui/ui, datum/tgui_state/state)
	if (..())
		return

/datum/crew_manifest/tgui_data(mob/user)
	var/list/positions = list(
		"Command" = 0,
		"Security" = 0,
		"Engineering" = 0,
		"Medical" = 0,
		"Science" = 0,
		"Supply" = 0,
		"Service" = 0,
		"Silicon" = 0
	)
	var/list/departments = list(
		list("flag" = DEPARTMENT_COMMAND, "name" = "Command"),
		list("flag" = DEPARTMENT_SECURITY, "name" = "Security"),
		list("flag" = DEPARTMENT_ENGINEERING, "name" = "Engineering"),
		list("flag" = DEPARTMENT_MEDICAL, "name" = "Medical"),
		list("flag" = DEPARTMENT_RESEARCH, "name" = "Science"),
		list("flag" = DEPARTMENT_CARGO, "name" = "Supply"),
		list("flag" = DEPARTMENT_CIVILIAN, "name" = "Service"),
		list("flag" = DEPARTMENT_SYNTHETIC, "name" = "Silicon")
	)

	for(var/job in SSjob.occupations)
		for(var/department in departments)
			// Check if the job is part of a department using its flag
			// Will return true for Research Director if the department is Science or Command, for example
			if(job["departments"] & department["flag"])
				// Add open positions to current department
				positions[department["name"]] += (job["total_positions"] - job["current_positions"])

	return list(
		"manifest" = data_core.get_manifest(),
		"positions" = positions
	)
