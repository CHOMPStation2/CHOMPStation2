// Pilots
/*
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
	department = "Civilian"
	department_flag = CIVILIAN
	faction = "Station"
	total_positions = 4
	spawn_positions = 4
	supervisors = "the explorer leader and the head of personnel"
	selection_color = "#515151"
	economic_modifier = 4
	access = list(access_explorer)
	minimal_access = list(access_explorer)
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
*/
///////////////////////////////////////////
///			Sleeping Slug Jobs			///
///////////////////////////////////////////

/datum/department/sleeping_slug
	name = DEPARTMENT_SLEEP_SLUG
	short_name = "Sleeping Slug"
	color = "#888888"
	sorting_order = -2
	assignable = FALSE
	visible = FALSE

/datum/job/sleeping_slug_captain
	title = "Sleeping Slug Captain"
	flag = SLEEP_SLUG_CAP
	department_flag = SLEEPING_SLUG
	departments_managed = list(DEPARTMENT_SLEEP_SLUG)
	job_description = "The captain's job is to generate profit through trade or other means such as salvage or even privateering."
	supervisors = "yourself"
	outfit_type = /decl/hierarchy/outfit/job/sleeping_slug_captain

	offmap_spawn = TRUE
	faction = "Station" //Required for SSjob to allow people to join as it
	departments = list(DEPARTMENT_SLEEP_SLUG)
	total_positions = 1
	spawn_positions = 1
	selection_color = "#999999"
	economic_modifier = 7
	minimal_player_age = 14
	pto_type = null
	access = list(access_sleeping_slug)
	minimal_access = list(access_sleeping_slug)
	alt_titles = list("Sleeping Slug Commander" = /datum/alt_title/sleeping_slug_commander)

/datum/alt_title/sleeping_slug_commander
	title = "Sleeping Slug Commander"

/datum/job/sleeping_slug_doctor
	title = "Sleeping Slug Doctor"
	flag = SLEEP_SLUG_DOC
	department_flag = SLEEPING_SLUG
	job_description = "The doctor's job is to make sure the crew of the ITV Sleeping Slug remain in good health and to monitor them when away from the ship."
	supervisors = "the ITV Sleeping Slug's captain"
	outfit_type = /decl/hierarchy/outfit/job/sleeping_slug_doctor

	offmap_spawn = TRUE
	faction = "Station" //Required for SSjob to allow people to join as it
	departments = list(DEPARTMENT_SLEEP_SLUG)
	total_positions = 1
	spawn_positions = 1
	selection_color = "#aaaaaa"
	economic_modifier = 5
	minimal_player_age = 14
	pto_type = null
	access = list(access_sleeping_slug)
	minimal_access = list(access_sleeping_slug)
	alt_titles = list("Sleeping Slug Medic" = /datum/alt_title/sleeping_slug_medic)

/datum/alt_title/sleeping_slug_medic
	title = "Sleeping Slug Medic"


/datum/job/sleeping_slug_engineer
	title = "Sleeping Slug Engineer"
	flag = SLEEP_SLUG_ENG
	department_flag = SLEEPING_SLUG
	job_description = "The engineer's job is to ensure the ITV Sleeping Slug remains in tip-top shape and to repair any damage as well as manage the shields."
	supervisors = "the ITV Sleeping Slug's captain"
	outfit_type = /decl/hierarchy/outfit/job/sleeping_slug_engineer

	offmap_spawn = TRUE
	faction = "Station" //Required for SSjob to allow people to join as it
	departments = list(DEPARTMENT_SLEEP_SLUG)
	total_positions = 1
	spawn_positions = 1
	selection_color = "#aaaaaa"
	economic_modifier = 5
	minimal_player_age = 14
	pto_type = null
	access = list(access_sleeping_slug)
	minimal_access = list(access_sleeping_slug)
	alt_titles = list("Sleeping Slug Technician" = /datum/alt_title/sleeping_slug_tech)

/datum/alt_title/sleeping_slug_tech
	title = "Sleeping Slug Technician"


/datum/job/sleeping_slug_pilot
	title = "Sleeping Slug Pilot"
	flag = SLEEP_SLUG_PIL
	department_flag = SLEEPING_SLUG
	job_description = "The pilot's job is to fly the ITV Sleeping Slug in the most efficient and profitable way possible."
	supervisors = "the ITV Sleeping Slug's captain"
	outfit_type = /decl/hierarchy/outfit/job/sleeping_slug_pilot

	offmap_spawn = TRUE
	faction = "Station" //Required for SSjob to allow people to join as it
	departments = list(DEPARTMENT_SLEEP_SLUG)
	total_positions = 1
	spawn_positions = 1
	selection_color = "#aaaaaa"
	economic_modifier = 5
	minimal_player_age = 14
	pto_type = null
	access = list(access_sleeping_slug)
	minimal_access = list(access_sleeping_slug)
	alt_titles = list("Sleeping Slug Helmsman" = /datum/alt_title/sleeping_slug_helmsman)

/datum/alt_title/sleeping_slug_helmsman
	title = "Sleeping Slug Helmsman"


/datum/job/sleeping_slug_guard
	title = "Sleeping Slug Guard"
	flag = SLEEP_SLUG_GUA
	department_flag = SLEEPING_SLUG
	job_description = "The guard's job is to keep the crew of the ITV Sleeping Slug safe and ensure the captain's wishes are carried out."
	supervisors = "the ITV Sleeping Slug's captain"
	outfit_type = /decl/hierarchy/outfit/job/sleeping_slug_security

	offmap_spawn = TRUE
	faction = "Station" //Required for SSjob to allow people to join as it
	departments = list(DEPARTMENT_SLEEP_SLUG)
	total_positions = 1
	spawn_positions = 1
	selection_color = "#aaaaaa"
	economic_modifier = 5
	minimal_player_age = 14
	pto_type = null
	access = list(access_sleeping_slug)
	minimal_access = list(access_sleeping_slug)
	alt_titles = list("Sleeping Slug Security" = /datum/alt_title/sleeping_slug_security)

/datum/alt_title/sleeping_slug_security
	title = "Sleeping Slug Security"

//////////////////////SLEEPING SLUG OUTFITS//////////////////////

/decl/hierarchy/outfit/job/sleeping_slug_captain
	name = OUTFIT_JOB_NAME("Sleeping Slug Captain")

	id_type = /obj/item/weapon/card/id/sleeping_slug/captain
	id_slot = slot_wear_id
	pda_type = null

	l_ear = /obj/item/device/radio/headset/sleeping_slug
	glasses = /obj/item/clothing/glasses/sunglasses
	uniform = /obj/item/clothing/under/rank/sleeping_slug/command
	shoes = /obj/item/clothing/shoes/brown
	backpack = /obj/item/weapon/storage/backpack/sleeping_slug
	satchel_one = /obj/item/weapon/storage/backpack/satchel/sleeping_slug
	messenger_bag = /obj/item/weapon/storage/backpack/messenger/sleeping_slug

/decl/hierarchy/outfit/job/sleeping_slug_pilot
	name = OUTFIT_JOB_NAME("Sleeping Slug Pilot")
	id_pda_assignment = "Pilot"

	id_type = /obj/item/weapon/card/id/sleeping_slug/pilot
	id_slot = slot_wear_id
	pda_type = null
	flags = OUTFIT_HAS_BACKPACK|OUTFIT_COMPREHENSIVE_SURVIVAL

	l_ear = /obj/item/device/radio/headset/sleeping_slug
	shoes = /obj/item/clothing/shoes/black
	head = /obj/item/clothing/head/pilot_vr/sleeping_slug
	uniform = /obj/item/clothing/under/rank/sleeping_slug/pilot
	suit = /obj/item/clothing/suit/storage/toggle/bomber/pilot
	gloves = /obj/item/clothing/gloves/fingerless
	glasses = /obj/item/clothing/glasses/fakesunglasses/aviator
	uniform_accessories = list(/obj/item/clothing/accessory/storage/webbing/pilot1 = 1)
	backpack = /obj/item/weapon/storage/backpack/sleeping_slug
	satchel_one = /obj/item/weapon/storage/backpack/satchel/sleeping_slug
	messenger_bag = /obj/item/weapon/storage/backpack/messenger/sleeping_slug

/decl/hierarchy/outfit/job/sleeping_slug_doctor
	name = OUTFIT_JOB_NAME("Sleeping Slug Doctor")
	hierarchy_type = /decl/hierarchy/outfit/job

	id_type = /obj/item/weapon/card/id/sleeping_slug/doctor
	id_slot = slot_wear_id
	pda_type = null

	l_ear = /obj/item/device/radio/headset/sleeping_slug
	shoes = /obj/item/clothing/shoes/white
	backpack = /obj/item/weapon/storage/backpack/medic
	satchel_one = /obj/item/weapon/storage/backpack/satchel/med
	messenger_bag = /obj/item/weapon/storage/backpack/messenger/med
	uniform = /obj/item/clothing/under/rank/sleeping_slug/proper
	suit = /obj/item/clothing/suit/storage/toggle/labcoat
	l_hand = /obj/item/weapon/storage/firstaid/regular
	r_pocket = /obj/item/device/flashlight/pen
	backpack = /obj/item/weapon/storage/backpack/sleeping_slug
	satchel_one = /obj/item/weapon/storage/backpack/satchel/sleeping_slug
	messenger_bag = /obj/item/weapon/storage/backpack/messenger/sleeping_slug

/decl/hierarchy/outfit/job/sleeping_slug_security
	name = OUTFIT_JOB_NAME("Sleeping Slug Security")
	hierarchy_type = /decl/hierarchy/outfit/job

	id_type = /obj/item/weapon/card/id/sleeping_slug/officer
	id_slot = slot_wear_id
	pda_type = null
	backpack_contents = list(/obj/item/weapon/handcuffs = 1)

	l_ear = /obj/item/device/radio/headset/sleeping_slug
	gloves = /obj/item/clothing/gloves/black
	shoes = /obj/item/clothing/shoes/boots/jackboots
	backpack = /obj/item/weapon/storage/backpack/security
	satchel_one = /obj/item/weapon/storage/backpack/satchel/sec
	messenger_bag = /obj/item/weapon/storage/backpack/messenger/sec
	uniform = /obj/item/clothing/under/rank/sleeping_slug/security
	l_pocket = /obj/item/device/flash
	backpack = /obj/item/weapon/storage/backpack/sleeping_slug
	satchel_one = /obj/item/weapon/storage/backpack/satchel/sleeping_slug
	messenger_bag = /obj/item/weapon/storage/backpack/messenger/sleeping_slug

/decl/hierarchy/outfit/job/sleeping_slug_engineer
	name = OUTFIT_JOB_NAME("Sleeping Slug Engineer")
	hierarchy_type = /decl/hierarchy/outfit/job

	id_type = /obj/item/weapon/card/id/sleeping_slug/engineer
	id_slot = slot_wear_id
	pda_type = null
	flags = OUTFIT_HAS_BACKPACK|OUTFIT_EXTENDED_SURVIVAL

	l_ear = /obj/item/device/radio/headset/sleeping_slug
	belt = /obj/item/weapon/storage/belt/utility/full
	shoes = /obj/item/clothing/shoes/boots/workboots
	r_pocket = /obj/item/device/t_scanner
	backpack = /obj/item/weapon/storage/backpack/industrial
	satchel_one = /obj/item/weapon/storage/backpack/satchel/eng
	messenger_bag = /obj/item/weapon/storage/backpack/messenger/engi
	uniform = /obj/item/clothing/under/rank/sleeping_slug/basic
	belt = /obj/item/weapon/storage/belt/utility/atmostech
	backpack = /obj/item/weapon/storage/backpack/sleeping_slug
	satchel_one = /obj/item/weapon/storage/backpack/satchel/sleeping_slug
	messenger_bag = /obj/item/weapon/storage/backpack/messenger/sleeping_slug

