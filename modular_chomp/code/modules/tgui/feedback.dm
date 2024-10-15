/datum/tgui_feedback
	var/selected_window

/datum/tgui_feedback/tgui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "TguiFeedback", "TGUI Feedback Submission")
		ui.open()

/datum/tgui_feedback/tgui_state(mob/user)
	return GLOB.tgui_always_state

/datum/tgui_feedback/tgui_static_data(mob/user)
	var/list/data = list()

	data["open_windows"] = list()
	for(var/datum/tgui/ui in user.tgui_open_uis)
		data["open_windows"] += ui.title

	return data

/datum/tgui_feedback/tgui_data(mob/user)
	var/list/data = list()

	data["selected_window"] = selected_window

	return data

/datum/tgui_feedback/tgui_act(action, params)
	if(..())
		return
	switch(action)
		if("pick_window")
			if(!params["win"])
				return

			selected_window = sanitize(params["win"])
			. = TRUE
		if("submit")
			message_admins("TGUI Feedback: Rating [params["rating"]] - Comment: [params["comment"]]")
			. = TRUE

/client/verb/tgui_feedback()
	set name = "Submit TGUI Feedback"
	set category = "OOC.Debug"

	var/datum/tgui_feedback/feedback = new()
	feedback.tgui_interact(usr)
