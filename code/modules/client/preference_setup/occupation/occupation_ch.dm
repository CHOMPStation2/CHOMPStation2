/datum/category_item/player_setup_item/occupation/load_character(var/savefile/S)
	..()
	S["job_sleepingslug_low"]		>> pref.job_sleepingslug_low
	S["job_sleepingslug_med"]		>> pref.job_sleepingslug_med
	S["job_sleepingslug_high"]		>> pref.job_sleepingslug_high

/datum/category_item/player_setup_item/occupation/save_character(var/savefile/S)
	..()
	S["job_sleepingslug_low"]		<< pref.job_sleepingslug_low
	S["job_sleepingslug_med"]		<< pref.job_sleepingslug_med
	S["job_sleepingslug_high"]		<< pref.job_sleepingslug_high

/datum/category_item/player_setup_item/occupation/sanitize_character()
	..()
	pref.job_sleepingslug_high		= sanitize_integer(pref.job_sleepingslug_high, 0, 65535, initial(pref.job_sleepingslug_high))
	pref.job_sleepingslug_med 		= sanitize_integer(pref.job_sleepingslug_med, 0, 65535, initial(pref.job_sleepingslug_med))
	pref.job_sleepingslug_low 		= sanitize_integer(pref.job_sleepingslug_low, 0, 65535, initial(pref.job_sleepingslug_low))

/datum/category_item/player_setup_item/occupation/reset_jobhigh()
	.=..()
	pref.job_sleepingslug_med |= pref.job_sleepingslug_high
	pref.job_sleepingslug_high = 0

// Level is equal to the desired new level of the job. So for a value of 4, we want to disable the job.
/datum/category_item/player_setup_item/occupation/SetJobDepartment(var/datum/job/job, var/level)
	.=..()
	switch(job.department_flag)
		if(SLEEPING_SLUG)
			pref.job_sleepingslug_low &= ~job.flag
			pref.job_sleepingslug_med &= ~job.flag
			pref.job_sleepingslug_high &= ~job.flag
			switch(level)
				if(1)
					reset_jobhigh()
					pref.job_sleepingslug_high = job.flag
				if(2)
					pref.job_sleepingslug_med |= job.flag
				if(3)
					pref.job_sleepingslug_low |= job.flag

/datum/category_item/player_setup_item/occupation/ResetJobs()
	..()
	pref.job_sleepingslug_high = 0
	pref.job_sleepingslug_med = 0
	pref.job_sleepingslug_low = 0