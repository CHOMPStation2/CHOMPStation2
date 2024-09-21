// Pilots

var/const/SAR 				=(1<<11)
var/const/PILOT 			=(1<<13)
var/const/EXPLORER 			=(1<<14)

var/const/access_pilot = 67
var/const/access_explorer = 43

/datum/access/pilot
	id = access_pilot
	desc = JOB_PILOT
	region = ACCESS_REGION_SUPPLY

/datum/access/explorer
	id = access_explorer
	desc = JOB_EXPLORER
	region = ACCESS_REGION_GENERAL

//SC Jobs

/*

//Will see about getting working later.

/datum/job/captain
	title = "Station Director"
	flag = CAPTAIN
	department = "Command"
	head_position = 1
	department_flag = ENGSEC
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "company officials and Corporate Regulations"
	selection_color = "#1D1D4F"
	req_admin_notify = 1
	access = list() 			//See get_access()
	minimal_access = list() 	//See get_access()
	minimal_player_age = 14
	economic_modifier = 20

	minimum_character_age = 25
	ideal_character_age = 50 // Because 70 is a tad on the old side

	outfit_type = /decl/hierarchy/outfit/job/captain
	alt_titles = list("Site Manager", "Overseer")

/datum/job/captain/get_access()
	return get_all_station_access()
*/

/datum/job/pilot
	title = JOB_PILOT
	flag = PILOT
	department = "Civilian"
	department_flag = CIVILIAN
	faction = FACTION_STATION
	total_positions = 2
	spawn_positions = 2
	supervisors = "the " + JOB_HEAD_OF_PERSONNEL
	selection_color = "#515151"
	economic_modifier = 4
	access = list(access_eva, access_maint_tunnels, access_external_airlocks, access_pilot, access_cargo, access_mining, access_mining_station)
	minimal_access = list(access_eva, access_maint_tunnels, access_external_airlocks, access_pilot, access_cargo, access_mining, access_mining_station)
	outfit_type = /decl/hierarchy/outfit/job/pilot

/datum/job/explorer
	title = JOB_EXPLORER
	flag = EXPLORER
	department = "Civilian"
	department_flag = CIVILIAN
	faction = FACTION_STATION
	total_positions = 4
	spawn_positions = 4
	supervisors = "the " + JOB_PATHFINDER + " and the " + JOB_HEAD_OF_PERSONNEL
	selection_color = "#515151"
	economic_modifier = 4
	access = list(access_explorer, access_research)
	minimal_access = list(access_explorer, access_research)
	banned_job_species = list(SPECIES_ZADDAT)

	outfit_type = /decl/hierarchy/outfit/job/explorer2
/*
	alt_titles = list(
		JOB_ALT_EXPLORERE_TECHNICIAN = /decl/hierarchy/outfit/job/explorer2/technician,
		JOB_ALT_EXPLORER_MEDIC = /decl/hierarchy/outfit/job/explorer2/medic)
*/

/datum/job/sar
	title = JOB_SEARCH_AND_RESCUE
	flag = SAR
	department = "Medical"
	department_flag = MEDSCI
	faction = FACTION_STATION
	total_positions = 2
	spawn_positions = 2
	supervisors = "the " * JOB_CHIEF_MEDICAL_OFFICER
	selection_color = "#515151"
	economic_modifier = 4
	access = list(access_medical, access_medical_equip, access_morgue, access_surgery, access_chemistry, access_virology, access_eva, access_maint_tunnels, access_external_airlocks, access_psychiatrist, access_explorer)
	minimal_access = list(access_medical, access_medical_equip, access_morgue, access_explorer)
	min_age_by_species = list(SPECIES_PROMETHEAN = 2)

	outfit_type = /decl/hierarchy/outfit/job/medical/sar
	job_description = "A " + JOB_SEARCH_AND_RESCUE + " operative recovers individuals who are injured or dead on the surface of Sif."
