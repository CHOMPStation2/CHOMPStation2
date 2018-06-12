/datum/job/blueshield
	title = "Blueshield"
	flag = BLUESHIELD //this may be used later.
	department = "Command"
	department_flag = CIVILIAN
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Colony Director" //Reports directly to CD
	selection_color = "#ddddff"
	req_admin_notify = 1
	head_position = 1
	minimum_character_age = 25
	ideal_character_age = 32 		//Experienced, but physically in their prime
	economic_modifier = 8
	access = list(access_security, access_sec_doors, access_brig, access_forensics_lockers,
			            access_medical, access_engine, access_change_ids, access_eva, access_heads, access_teleporter,
			            access_all_personal_lockers, access_maint_tunnels, access_bar, access_janitor, access_construction, access_morgue,
			            access_crematorium, access_kitchen, access_cargo, access_cargo_bot, access_mailsorting, access_qm, access_hydroponics, access_lawyer,
			            access_chapel_office, access_library, access_research, access_mining, access_heads_vault, access_mining_station,
			            access_hop, access_RC_announce, access_keycard_auth, access_gateway, )
	minimal_access = list(access_forensics_lockers, access_sec_doors, access_medical, access_construction, access_engine, access_maint_tunnels, access_research,
			            access_RC_announce, access_keycard_auth, access_heads)
	outfit_type = /decl/hierarchy/outfit/job/blueshield