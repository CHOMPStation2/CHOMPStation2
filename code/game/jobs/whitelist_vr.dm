var/list/job_whitelist = list()

/hook/startup/proc/loadJobWhitelist()
	if(config.use_jobwhitelist) // CHOMPedit
		load_jobwhitelist() // CHOMPedit
	return 1

/proc/load_jobwhitelist()
	var/text = file2text("config/jobwhitelist.txt")
	if (!text)
		log_misc("Failed to load config/jobwhitelist.txt")
	else
		job_whitelist = splittext(text, "\n")

/proc/is_job_whitelisted(mob/M, var/rank)
	if(!config.use_jobwhitelist) // CHOMPedit
		return 1 // CHOMPedit
	var/datum/job/job = job_master.GetJob(rank)
	if(!job.whitelist_only)
		return 1
	if(rank == USELESS_JOB) //VOREStation Edit - Visitor not Assistant
		return 1
	if(check_rights(R_ADMIN, 0) || check_rights(R_DEBUG, 0) || check_rights(R_EVENT, 0)) // CHOMPedit
		return 1
	if(!job_whitelist)
		return 0
	if(M && rank)
		for (var/s in job_whitelist)
			if(findtext(s,"[lowertext(M.ckey)] - [lowertext(rank)]"))
				return 1
			if(findtext(s,"[M.ckey] - All"))
				return 1
