GLOBAL_LIST_EMPTY(job_whitelist)

/hook/startup/proc/loadJobWhitelist()
	if(CONFIG_GET(flag/use_jobwhitelist)) // CHOMPedit
		load_jobwhitelist() // CHOMPedit
	return 1

/proc/load_jobwhitelist()
	var/text = file2text("config/jobwhitelist.txt")
	if (!text)
		log_misc("Failed to load config/jobwhitelist.txt")
	else
		GLOB.job_whitelist = splittext(text, "\n")

/proc/is_job_whitelisted(mob/M, var/rank)
	if(!CONFIG_GET(flag/use_jobwhitelist)) // CHOMPedit
		return 1 // CHOMPedit
	var/datum/job/job = job_master.GetJob(rank)
	if(!job.whitelist_only)
		return 1
	if(rank == JOB_ALT_VISITOR) //VOREStation Edit - Visitor not Assistant
		return 1
	if(check_rights(R_ADMIN, 0) || check_rights(R_DEBUG, 0) || check_rights(R_EVENT, 0)) // CHOMPedit
		return 1
	if(!GLOB.job_whitelist)
		return 0
	if(M && rank)
		for (var/s in GLOB.job_whitelist)
			if(findtext(s,"[lowertext(M.ckey)] - [lowertext(rank)]"))
				return 1
			if(findtext(s,"[M.ckey] - All"))
				return 1
	return 0

//ChompEDIT START - admin reload buttons
/client/proc/reload_jobwhitelist()
	set category = "Server.Config"
	set name = "Reload Job whitelist"

	if(!check_rights(R_ADMIN|R_MOD|R_DEBUG|R_EVENT))
		return

	load_jobwhitelist()
	log_and_message_admins("reloaded the job whitelist")
//ChompEDIT End
