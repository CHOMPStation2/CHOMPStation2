var/datum/antagonist/revolutionary/revs

/datum/antagonist/revolutionary
	id = MODE_REVOLUTIONARY
	role_type = BE_REV
	role_text = "Head Revolutionary"
	role_text_plural = "Revolutionaries"
	bantype = "revolutionary"
	feedback_tag = "rev_objective"
	antag_indicator = "rev_head"
	welcome_text = "Down with the capitalists! Down with the Bourgeoise!"
	victory_text = "The heads of staff were relieved of their posts! The revolutionaries win!"
	loss_text = "The heads of staff managed to stop the revolution!"
	victory_feedback_tag = "win - heads killed"
	loss_feedback_tag = "loss - rev heads killed"
	flags = ANTAG_SUSPICIOUS | ANTAG_VOTABLE
	antaghud_indicator = "hudrevolutionary"

	hard_cap = 2
	hard_cap_round = 4
	initial_spawn_req = 2
	initial_spawn_target = 4

	//Inround revs.
	faction_role_text = "Revolutionary"
	faction_descriptor = "Revolution"
	faction_verb = /mob/living/proc/convert_to_rev
	faction_welcome = "Help the cause overturn the ruling class. Do not harm your fellow freedom fighters."
	faction_indicator = "rev"
	faction_invisible = 1

	avoid_silicons = TRUE
	protected_jobs = list(JOB_SECURITY_OFFICER, JOB_WARDEN, JOB_DETECTIVE, JOB_INTERNAL_AFFAIRS_AGENT, JOB_SITE_MANAGER, JOB_HEAD_OF_PERSONNEL, JOB_HEAD_OF_SECURITY, JOB_CHIEF_ENGINEER, JOB_RESEARCH_DIRECTOR, JOB_CHIEF_MEDICAL_OFFICER)
	roundstart_restricted = list(JOB_INTERNAL_AFFAIRS_AGENT, JOB_SITE_MANAGER, JOB_HEAD_OF_PERSONNEL, JOB_HEAD_OF_SECURITY, JOB_CHIEF_ENGINEER, JOB_RESEARCH_DIRECTOR, JOB_CHIEF_MEDICAL_OFFICER)

/datum/antagonist/revolutionary/New()
	..()
	revs = src

/datum/antagonist/revolutionary/create_global_objectives()
	if(!..())
		return
	global_objectives = list()
	for(var/mob/living/carbon/human/player in GLOB.mob_list)
		if(!player.mind || player.stat==2 || !(SSjob.is_job_in_department(player.mind.assigned_role, DEPARTMENT_COMMAND)))
			continue
		var/datum/objective/rev/rev_obj = new
		rev_obj.target = player.mind
		rev_obj.explanation_text = "Assassinate, capture or convert [player.real_name], the [player.mind.assigned_role]."
		global_objectives += rev_obj
