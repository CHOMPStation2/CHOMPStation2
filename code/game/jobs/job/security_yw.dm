/datum/job/security/pilot
	title = "Security Pilot"
	flag = SECPILOT
	department = "Security"
	department_flag = ENGSEC
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	supervisors = "the head of security"
	selection_color = "#601C1C"
	economic_modifier = 5
	access = list(access_security, access_eva, access_sec_doors, access_brig, access_maint_tunnels, access_morgue, access_external_airlocks, access_secpilot)
	minimal_access = list(access_security, access_eva, access_sec_doors, access_brig, access_maint_tunnels, access_external_airlocks, access_secpilot)
	minimal_player_age = 7
	outfit_type = /decl/hierarchy/outfit/job/security/pilot
//	alt_titles = list("Mech Operator","Rover Pilot")