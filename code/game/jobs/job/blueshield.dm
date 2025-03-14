/datum/job/blueshield
	title = JOB_BLUESHIELD_GUARD
	flag = BLUESHIELD //this may be used later.
	departments = list(DEPARTMENT_COMMAND)
	department_flag = ENGSEC
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the " + JOB_ALT_COLONY_DIRECTOR + " and Central Command" //Reports directly to CD, or failing that, CC
	selection_color = "#006cb3"
	req_admin_notify = 1
	minimum_character_age = 25
	ideal_character_age = 32 		//Experienced, but physically in their prime
	minimal_player_age = 3
	economic_modifier = 8
	access = list(access_security, access_sec_doors, access_brig,
						access_medical, access_eva, access_heads, access_teleporter,
						access_maint_tunnels, access_morgue,
						access_crematorium, access_research, access_hop, access_RC_announce, access_keycard_auth, access_gateway, access_blueshield, access_blueshield_exclusive)
	minimal_access = list(access_forensics_lockers, access_sec_doors, access_medical, access_maint_tunnels, access_RC_announce, access_keycard_auth, access_heads, access_blueshield, access_blueshield_exclusive)

	outfit_type = /decl/hierarchy/outfit/job/blueshield
	job_description = "Placeholder desc: General rules is to not get involved with security matters, your job is only to keep command personnel alive."

/datum/job/blueshield/equip(var/mob/living/carbon/human/H)
	. = ..()
	if(.)
		H.implant_loyalty(src)
