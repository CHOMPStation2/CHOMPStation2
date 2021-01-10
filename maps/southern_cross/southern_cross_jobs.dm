// Pilots

var/const/SAR 				=(1<<11)
var/const/PILOT 			=(1<<13)
var/const/EXPLORER 			=(1<<14)

var/const/access_pilot = 67
var/const/access_explorer = 43

/datum/access/pilot
	id = access_pilot
	desc = "Pilot"
	region = ACCESS_REGION_SUPPLY

/datum/access/explorer
	id = access_explorer
	desc = "Explorer"
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
	title = "Pilot"
	flag = PILOT
	department = "Civilian"
	department_flag = CIVILIAN
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	supervisors = "the head of personnel"
	selection_color = "#515151"
	economic_modifier = 4
	access = list(access_pilot, access_cargo, access_mining, access_mining_station)
	minimal_access = list(access_pilot, access_cargo, access_mining, access_mining_station)
	outfit_type = /decl/hierarchy/outfit/job/pilot

/datum/job/explorer
	title = "Explorer"
	flag = EXPLORER
<<<<<<< HEAD
	department = "Civilian"
	department_flag = CIVILIAN
||||||| parent of 4caa4f98ec... Merge pull request #9563 from VOREStation/upstream-merge-7821
	departments = list(DEPARTMENT_PLANET)
	department_flag = CIVILIAN
=======
	departments = list(DEPARTMENT_RESEARCH, DEPARTMENT_PLANET)
	department_flag = MEDSCI
>>>>>>> 4caa4f98ec... Merge pull request #9563 from VOREStation/upstream-merge-7821
	faction = "Station"
	total_positions = 4
	spawn_positions = 4
<<<<<<< HEAD
	supervisors = "the explorer leader and the head of personnel"
	selection_color = "#515151"
||||||| parent of 4caa4f98ec... Merge pull request #9563 from VOREStation/upstream-merge-7821
	supervisors = "the Head of Personnel"
	selection_color = "#515151"
=======
	supervisors = "the Research Director"
	selection_color =  "#633D63"
>>>>>>> 4caa4f98ec... Merge pull request #9563 from VOREStation/upstream-merge-7821
	economic_modifier = 4
<<<<<<< HEAD
	access = list(access_explorer)
	minimal_access = list(access_explorer)
||||||| parent of 4caa4f98ec... Merge pull request #9563 from VOREStation/upstream-merge-7821
	access = list(access_explorer)
	minimal_access = list(access_explorer)

=======
	access = list(access_explorer, access_research)
	minimal_access = list(access_explorer, access_research)

>>>>>>> 4caa4f98ec... Merge pull request #9563 from VOREStation/upstream-merge-7821
	outfit_type = /decl/hierarchy/outfit/job/explorer2
/*
	alt_titles = list(
		"Explorer Technician" = /decl/hierarchy/outfit/job/explorer2/technician,
		"Explorer Medic" = /decl/hierarchy/outfit/job/explorer2/medic)
*/

/datum/job/sar
	title = "Search and Rescue"
	flag = SAR
	department = "Medical"
	department_flag = MEDSCI
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	supervisors = "the chief medical officer"
	selection_color = "#515151"
	economic_modifier = 4
	access = list(access_medical, access_medical_equip, access_morgue, access_surgery, access_chemistry, access_virology, access_eva, access_maint_tunnels, access_external_airlocks, access_psychiatrist, access_explorer)
	minimal_access = list(access_medical, access_medical_equip, access_morgue, access_explorer)
	outfit_type = /decl/hierarchy/outfit/job/medical/sar