/datum/job/brigphysician
	title = "Brig Physician"
	flag = BRIGPHYS
	departments = list(DEPARTMENT_SECURITY, DEPARTMENT_MEDICAL)
	department_flag = ENGSEC
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Head of Security and Chief Medical Officer"
	selection_color = "#601C1C"
	economic_modifier = 7
	access = list(access_medical, access_medical_equip, access_morgue, access_surgery, access_chemistry, access_virology, access_genetics, access_security, access_sec_doors, access_brig, access_eva)
	minimal_access = list(access_medical, access_medical_equip, access_morgue, access_surgery, access_virology, access_security, access_sec_doors, access_brig, access_eva)

	outfit_type = /decl/hierarchy/outfit/job/security/brigphysician
	job_description = "The Brig Physician is a doctor that helps security staff with medical issues, be it healing an officer or harvesting the organs of tending to prisoners. Due to your unique position on the station, you have many things that you can do; be it making security more machine than man or seeing how many organs are actually required for a prisoner to live.\
						As with everyone else, you are to follow The Law and your supervisor to the best of your abilities. You should also have a good understanding of the medical system (be able to revive people, know surgery, etc.) and have a basic understanding of Space Law, as all staff working closely with security should. "
	alt_titles = list(
		"Security Medic" = /datum/alt_title/security_medic,
		"Security Medical Support" = /datum/alt_title/sec_med_supp,
		"Penitentiary Medical Care Unit" = /datum/alt_title/pen_med,
		"Junior Brig Physician" = /datum/alt_title/junior_brigphys,
		"Detention Health Officer" = /datum/alt_title/detention_med
	)
	outfit_type = /decl/hierarchy/outfit/job/security/brigphysician

/datum/alt_title/security_medic
	title = "Security Medic"

/datum/alt_title/sec_med_supp
	title = "Security Medical Care Unit"

/datum/alt_title/pen_med
	title = "Penitentiary Medical Care Unit"

/datum/alt_title/junior_brigphys
	title = "Junior Brig Physician"

/datum/alt_title/detention_med
	title = "Detention Health Officer"
