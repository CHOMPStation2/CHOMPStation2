/datum/job/blueshield
	title = "Blueshield Guard"
	flag = BLUESHIELD //this may be used later.
	department = "Command"
	department_flag = ENGSEC
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Colony Director" //Reports directly to CD
	selection_color = "#006cb3"
	req_admin_notify = 1
	head_position = 1
	minimum_character_age = 25
	ideal_character_age = 32 		//Experienced, but physically in their prime
	minimal_player_age = 3
	economic_modifier = 8
	access = list(access_security, access_sec_doors, access_brig,
			            access_medical, access_eva, access_heads, access_teleporter,
			            access_maint_tunnels, access_morgue,
			            access_crematorium, access_research, access_hop, access_RC_announce, access_keycard_auth, access_gateway, access_blueshield)
	minimal_access = list(access_forensics_lockers, access_sec_doors, access_medical, access_maint_tunnels, access_RC_announce, access_keycard_auth, access_heads, access_blueshield)

	outfit_type = /decl/hierarchy/outfit/job/blueshield