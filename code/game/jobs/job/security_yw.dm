/datum/job/hos
	disallow_jobhop = TRUE

	access = list(access_security, access_eva, access_sec_doors, access_brig, access_armory,
						access_forensics_lockers, access_morgue, access_maint_tunnels, access_all_personal_lockers,
						access_research, access_engine, access_mining, access_construction, access_mailsorting,
						access_heads, access_hos, access_RC_announce, access_keycard_auth, access_gateway, access_external_airlocks, access_secpilot)
	minimal_access = list(access_security, access_eva, access_sec_doors, access_brig, access_armory,
						access_forensics_lockers, access_morgue, access_maint_tunnels, access_all_personal_lockers,
						access_research, access_engine, access_mining, access_construction, access_mailsorting,
						access_heads, access_hos, access_RC_announce, access_keycard_auth, access_gateway, access_external_airlocks, access_secpilot)

/datum/job/warden
	access = list(access_security, access_eva, access_sec_doors, access_brig, access_armory, access_maint_tunnels, access_morgue, access_external_airlocks, access_secpilot)
	minimal_access = list(access_security, access_eva, access_sec_doors, access_brig, access_armory, access_maint_tunnels, access_external_airlocks, access_secpilot)

/datum/job/security/pilot
	title = JOB_SECURITY_PILOT
	flag = SECPILOT
	departments = list(DEPARTMENT_SECURITY)
	department_flag = ENGSEC
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	supervisors = "the head of security"
	selection_color = "#601C1C"
	economic_modifier = 5
	access = list(access_security, access_eva, access_sec_doors, access_brig, access_maint_tunnels, access_morgue, access_external_airlocks, access_secpilot, access_pilot)
	minimal_access = list(access_security, access_eva, access_sec_doors, access_brig, access_maint_tunnels, access_external_airlocks, access_secpilot, access_pilot)
	minimal_player_age = 7
	outfit_type = /decl/hierarchy/outfit/job/security/pilot
	pto_type = PTO_SECURITY

	job_description = "Tasked with flying, operating, and sometimes even maintaining small spacecraft and personal exosuits such as the Durand or Gygax, \
						" + JOB_SECURITY_PILOT + "s are responsible for transporting criminals to more permanent holding facilities, and patrolling \
						for potential threats to their workplace. They may also be expected to step in to standard Security duties if \
						there's a shortage of regular officers."

//	alt_titles = list("Mech Operator" = /datum/alt_title/sec_mech_operator)
