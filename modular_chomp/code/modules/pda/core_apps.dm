/datum/data/pda/app/timeclock
	name = "Timeclock"
	icon = "clock"
	template = "pda_timeclock"

	var/channel = "Common"
	var/mob/pdaUser = null
	var/obj/item/radio/intercom/announce
/datum/data/pda/app/timeclock/start()
	. = ..()
	//Initialize an intercom to announce going on/off duty
	if(!announce)
		announce = new /obj/item/radio/intercom(src)
/datum/data/pda/app/timeclock/stop()
	pdaUser = null

/datum/data/pda/app/timeclock/update_ui(mob/user as mob, list/data)
	//Because tgui_data seems a bit weird with pda apps
	// Okay, data for showing the user's OWN PTO stuff
	if(user.client)
		data["department_hours"] = SANITIZE_LIST(user.client.department_hours)
	data["user_name"] = "[user]"
	//Grab the user while we're at it, this is useful for a few bookeeping/logging things
	pdaUser = user
	// Data about the card that we put into it.
	data["card"] = null
	data["assignment"] = null
	data["job_datum"] = null
	data["allow_change_job"] = null
	data["job_choices"] = null
	if(pda.id)
		data["card"] = "[pda.id]"
		data["assignment"] = pda.id.assignment
		var/datum/job/job = job_master.GetJob(pda.id.rank)
		if(job)
			data["job_datum"] = list(
				"title" = job.title,
				"departments" = english_list(job.departments),
				"selection_color" = job.selection_color,
				"economic_modifier" = job.economic_modifier,
				"timeoff_factor" = job.timeoff_factor,
				"pto_department" = job.pto_type
			)
		if(CONFIG_GET(flag/time_off) && CONFIG_GET(flag/pto_job_change))
			data["allow_change_job"] = TRUE
			if(job && job.timeoff_factor < 0) // Currently are Off Duty, so gotta lookup what on-duty jobs are open
				data["job_choices"] = getOpenOnDutyJobs(user, job.pto_type)

/datum/data/pda/app/timeclock/tgui_act(action, list/params, datum/tgui/ui, datum/tgui_state/state)
	if(..())
		return TRUE

	switch(action)
		if("switch-to-onduty-rank")
			if(checkFace())
				if(checkCardCooldown())
					makeOnDuty(params["switch-to-onduty-rank"], params["switch-to-onduty-assignment"])
			return TRUE
		if("switch-to-offduty")
			if(checkFace())
				if(checkCardCooldown())
					makeOffDuty()
			return TRUE

/datum/data/pda/app/timeclock/proc/getOpenOnDutyJobs(var/mob/user, var/department)
	var/list/available_jobs = list()
	for(var/datum/job/job in job_master.occupations)
		if(isOpenOnDutyJob(user, department, job))
			available_jobs[job.title] = list(job.title)
			if(job.alt_titles)
				for(var/alt_job in job.alt_titles)
					if(alt_job != job.title)
						available_jobs[job.title] += alt_job
	return available_jobs

/datum/data/pda/app/timeclock/proc/isOpenOnDutyJob(var/mob/user, var/department, var/datum/job/job)
	return job \
		   && job.is_position_available() \
		   && !job.whitelist_only \
		   && !jobban_isbanned(user,job.title) \
		   && job.player_old_enough(user.client) \
		   && job.player_has_enough_playtime(user.client) \
		   && job.pto_type == department \
		   && !job.disallow_jobhop \
		   && job.timeoff_factor > 0

/datum/data/pda/app/timeclock/proc/makeOnDuty(var/newrank, var/newassignment)
	var/datum/job/oldjob = job_master.GetJob(pda.id.rank)
	var/datum/job/newjob = job_master.GetJob(newrank)
	if(!oldjob || !isOpenOnDutyJob(pdaUser, oldjob.pto_type, newjob))
		return
	if(newassignment != newjob.title && !(newassignment in newjob.alt_titles))
		return
	if(newjob.camp_protection && round_duration_in_ds < CONFIG_GET(number/job_camp_time_limit))
		if(SSjob.restricted_keys.len)
			var/list/check = SSjob.restricted_keys[newjob.title]
			if(pdaUser.client.ckey in check)
				to_chat(pdaUser,span_danger("[newjob.title] is not presently selectable because you played as it last round. It will become available to you in [round((CONFIG_GET(number/job_camp_time_limit) - round_duration_in_ds) / 600)] minutes, if slots remain open."))
				return

	if(newjob)
		newjob.register_shift_key(pdaUser.client.ckey)
		pda.id.access = newjob.get_access()
		pda.id.rank = newjob.title
		pda.id.assignment = newassignment
		pda.id.name = text("[pda.id.registered_name]'s ID Card ([pda.id.assignment])")
		data_core.manifest_modify(pda.id.registered_name, pda.id.assignment, pda.id.rank)
		pda.id.last_job_switch = world.time
		callHook("reassign_employee", list(pda.id))
		newjob.current_positions++
		var/mob/living/carbon/human/H = pdaUser
		H.mind.assigned_role = pda.id.rank
		H.mind.role_alt_title = pda.id.assignment
		announce.autosay("[pda.id.registered_name] has moved On-Duty as [pda.id.assignment].", "Employee Oversight", channel, zlevels = using_map.get_map_levels(get_z(src)))
	return

/datum/data/pda/app/timeclock/proc/makeOffDuty()
	var/datum/job/foundjob = job_master.GetJob(pda.id.rank)
	if(!foundjob)
		return
	//If we're not in an area that allows clockout and not in a belly, shouldn't be able to clock out.
	if(!get_area(pdaUser).flag_check(AREA_ALLOW_CLOCKOUT) && !isbelly(pdaUser.loc))
		to_chat(pdaUser, span_notice("You cannot clock out from your PDA in this area"))
		return
	var/new_dept = foundjob.pto_type || PTO_CIVILIAN
	var/datum/job/ptojob = null
	for(var/datum/job/job in job_master.occupations)
		if(job.pto_type == new_dept && job.timeoff_factor < 0)
			ptojob = job
			break
	if(ptojob)
		var/oldtitle = pda.id.assignment
		pda.id.access = ptojob.get_access()
		pda.id.rank = ptojob.title
		pda.id.assignment = ptojob.title
		pda.id.name = text("[pda.id.registered_name]'s ID Card ([pda.id.assignment])")
		data_core.manifest_modify(pda.id.registered_name, pda.id.assignment, pda.id.rank)
		pda.id.last_job_switch = world.time
		callHook("reassign_employee", list(pda.id))
		var/mob/living/carbon/human/H = pdaUser
		H.mind.assigned_role = ptojob.title
		H.mind.role_alt_title = ptojob.title
		foundjob.current_positions--
		announce.autosay("[pda.id.registered_name], [oldtitle], has moved Off-Duty.", "Employee Oversight", channel, zlevels = using_map.get_map_levels(get_z(src)))
	return

/datum/data/pda/app/timeclock/proc/checkCardCooldown()
	if(!pda.id)
		return FALSE
	var/time_left = 1 MINUTE - (world.time - pda.id.last_job_switch)
	if(time_left > 0)
		to_chat(pdaUser, span_notice("You need to wait another [round((time_left/10)/60, 1)] minute\s before you can switch."))
		return FALSE
	return TRUE

/datum/data/pda/app/timeclock/proc/checkFace()
	var/turf/location = get_turf(pdaUser)
	if(!pda.id)
		to_chat(pdaUser, span_notice("No ID is inserted."))
		return FALSE
	else
		message_admins("[key_name_admin(pdaUser)] has modified '[pda.id.registered_name]' 's ID with a pda timeclock. [ADMIN_JMP(location)]")
		log_game("[key_name_admin(pdaUser)] has modified '[pda.id.registered_name]' 's ID with a pda timeclock.")
		return TRUE
