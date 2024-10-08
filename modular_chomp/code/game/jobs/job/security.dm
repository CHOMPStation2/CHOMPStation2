/datum/job/hos
	camp_protection = TRUE

/datum/job/brigphysician
	title = JOB_BRIG_PHYSICIAN
	flag = BRIGPHYS
	departments = list(DEPARTMENT_SECURITY, DEPARTMENT_MEDICAL)
	department_flag = ENGSEC
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	supervisors = "the " + JOB_HEAD_OF_SECURITY + " and " + JOB_CHIEF_MEDICAL_OFFICER
	selection_color = "#601C1C"
	economic_modifier = 7
	access = list(access_medical, access_medical_equip, access_morgue, access_surgery, access_chemistry, access_virology, access_genetics, access_security, access_sec_doors, access_brig, access_eva)
	minimal_access = list(access_medical, access_medical_equip, access_morgue, access_surgery, access_virology, access_security, access_sec_doors, access_brig, access_eva)

	outfit_type = /decl/hierarchy/outfit/job/security/brigphysician
	job_description = "The " + JOB_BRIG_PHYSICIAN + " is a doctor that helps security staff with medical issues. They have minimum access to Security, but they are not officers and should not conduct arrests."
	alt_titles = list(
		JOB_ALT_SECURITY_MEDIC = /datum/alt_title/security_medic,
		JOB_ALT_SECURITY_MEDIC_CARE = /datum/alt_title/sec_med_supp,
		JOB_ALT_SECURITY_PENITENTIARY_MED = /datum/alt_title/pen_med,
		JOB_ALT_JUNIOR_BRIGPHYS = /datum/alt_title/junior_brigphys,
		JOB_ALT_DETENTION_HEALTH_OFFICER = /datum/alt_title/detention_med
	)
	outfit_type = /decl/hierarchy/outfit/job/security/brigphysician

/datum/alt_title/security_medic
	title = JOB_ALT_SECURITY_MEDIC

/datum/alt_title/sec_med_supp
	title = JOB_ALT_SECURITY_MEDIC_CARE

/datum/alt_title/pen_med
	title = JOB_ALT_SECURITY_PENITENTIARY_MED

/datum/alt_title/junior_brigphys
	title = JOB_ALT_JUNIOR_BRIGPHYS

/datum/alt_title/detention_med
	title = JOB_ALT_DETENTION_HEALTH_OFFICER
