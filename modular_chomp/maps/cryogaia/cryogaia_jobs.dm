/obj/item/card/id/medical/sar
	assignment = "Field Medic"
	rank = "Field Medic"
	icon_state = "cyan"
	primary_color = rgb(47,189,189)
	secondary_color = rgb(127,223,223)

/obj/item/card/id/explorer
	name = "identification card"
	desc = "A card issued to station exploration staff."
	icon_state = "cyan"
	primary_color = rgb(47,189,189)
	secondary_color = rgb(127,223,223)

/obj/item/card/id/explorer/pilot
	assignment = "Pilot"
	rank = "Pilot"

/obj/item/card/id/explorer/explorer
	assignment = "Explorer"
	rank = "Explorer"

/obj/item/card/id/explorer/head
	name = "identification card"
	desc = "A card which represents discovery of the unknown."
	icon_state = "cyanGold"
	primary_color = rgb(47,189,189)
	secondary_color = rgb(127,223,223)

/obj/item/card/id/explorer/head/pathfinder
	assignment = "Pathfinder"
	rank = "Pathfinder"

/datum/department/planetside
	name = DEPARTMENT_PLANET
	color = "#bab421"
	sorting_order = 2 // Same as cargo in importance.

/datum/job/pathfinder
	title = "Pathfinder"
	flag = PATHFINDER
	departments = list(DEPARTMENT_PLANET)
	sorting_order = 1 // above the other explorers
	department_flag = MEDSCI
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the research director"
	selection_color = "#d6d05c"
	economic_modifier = 7
	minimal_player_age = 7
	pto_type = PTO_EXPLORATION
	access = list(access_eva, access_maint_tunnels, access_external_airlocks, access_pilot, access_explorer, access_research, access_gateway, access_pathfinder)
	minimal_access = list(access_eva, access_maint_tunnels, access_external_airlocks, access_pilot, access_explorer, access_research, access_gateway, access_pathfinder)
	outfit_type = /decl/hierarchy/outfit/job/pathfinder
	job_description = "The Pathfinder's job is to lead and manage expeditions, and is the primary authority on all off-station expeditions."

/datum/alt_title/pathfinder
        title = "Pathfinder"

/datum/job/pilot
	title = "Pilot"
	flag = PILOT
	departments = list(DEPARTMENT_CIVILIAN)
	department_flag = MEDSCI
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	supervisors = "the pathfinder and the head of personnel"
	selection_color = "#999440"
	economic_modifier = 5
	minimal_player_age = 3
	pto_type = PTO_CIVILIAN
	access = list(access_pilot)
	minimal_access = list(access_pilot)
	outfit_type = /decl/hierarchy/outfit/job/pilot
	job_description = "A Pilot flies the various shuttles in the Borealis System."

/datum/alt_title/pilot
	title = "Pilot"

/datum/job/explorer
	title = "Explorer"
	flag = EXPLORER
	departments = list(DEPARTMENT_PLANET)
	department_flag = MEDSCI
	faction = "Station"
	total_positions = 3
	spawn_positions = 3
	supervisors = "the pathfinder and the research director"
	selection_color = "#999440"
	economic_modifier = 6
	pto_type = PTO_EXPLORATION
	access = list(access_explorer, access_research)
	minimal_access = list(access_explorer, access_research)
	outfit_type = /decl/hierarchy/outfit/job/explorer2
	job_description = "An Explorer searches for interesting things, and returns them to the station."

/datum/alt_title/explorer
        title = "Explorer"

/datum/job/sar
	title = "Field Medic"
	flag = SAR
	departments = list(DEPARTMENT_MEDICAL,DEPARTMENT_PLANET)
	department_flag = MEDSCI
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	supervisors = "the pathfinder and the chief medical officer"
	selection_color = "#999440"
	economic_modifier = 6
	minimal_player_age = 3
	pto_type = PTO_EXPLORATION
	access = list(access_medical, access_medical_equip, access_eva, access_maint_tunnels, access_external_airlocks, access_fieldmedic, access_chemistry) //restoring chemistry access. FMs need it to mix meds, and they're basically just glorified EMTs - who also have chemistry access.
	minimal_access = list(access_medical, access_medical_equip, access_eva, access_fieldmedic)
	outfit_type = /decl/hierarchy/outfit/job/medical/sar
	job_description = "A Field Medic works as the field doctor of expedition teams."

/datum/alt_title/field_medic
	title = "Field Medic"

/datum/job/offduty_exploration
	title = "Off-duty Explorer"
	latejoin_only = TRUE
	timeoff_factor = -1
	total_positions = -1
	faction = "Station"
	departments = list(DEPARTMENT_OFFDUTY)
	supervisors = "nobody! Enjoy your time off"
	selection_color = "#999440"
	access = list(access_maint_tunnels, access_external_airlocks)
	minimal_access = list(access_maint_tunnels, access_external_airlocks)
	outfit_type = /decl/hierarchy/outfit/job/assistant/explorer
	job_description = "Off-duty crew has no responsibilities or authority and is just there to spend their well-deserved time off."
	pto_type = PTO_EXPLORATION

/datum/alt_title/offduty_exp
	title = "Off-duty Explorer"


///////////////////////////////////
//// Talon Jobs
/datum/department/talon
	name = DEPARTMENT_TALON
	short_name = "Talon"
	color = "#888888"
	sorting_order = -2
	assignable = FALSE
	visible = FALSE

/datum/job/talon_captain
	title = "Talon Captain"
	flag = TALCAP
	department_flag = TALON
	departments_managed = list(DEPARTMENT_TALON)
	job_description = "The captain's job is to generate profit through trade or other means such as salvage or even privateering."
	supervisors = "yourself"
	outfit_type = /decl/hierarchy/outfit/job/talon_captain

	offmap_spawn = TRUE
	faction = "Station" //Required for SSjob to allow people to join as it
	departments = list(DEPARTMENT_TALON)
	total_positions = 1
	spawn_positions = 1
	selection_color = "#999999"
	economic_modifier = 7
	minimal_player_age = 14
	pto_type = null
	access = list(access_talon)
	minimal_access = list(access_talon)
	alt_titles = list("Talon Commander" = /datum/alt_title/talon_commander)

/datum/alt_title/talon_commander
	title = "Talon Commander"

/datum/job/talon_doctor
	title = "Talon Doctor"
	flag = TALDOC
	department_flag = TALON
	job_description = "The doctor's job is to make sure the crew of the ITV Talon remain in good health and to monitor them when away from the ship."
	supervisors = "the ITV Talon's captain"
	outfit_type = /decl/hierarchy/outfit/job/talon_doctor

	offmap_spawn = TRUE
	faction = "Station" //Required for SSjob to allow people to join as it
	departments = list(DEPARTMENT_TALON)
	total_positions = 1
	spawn_positions = 1
	selection_color = "#aaaaaa"
	economic_modifier = 5
	minimal_player_age = 14
	pto_type = null
	access = list(access_talon)
	minimal_access = list(access_talon)
	alt_titles = list("Talon Medic" = /datum/alt_title/talon_medic)

/datum/alt_title/talon_medic
	title = "Talon Medic"


/datum/job/talon_engineer
	title = "Talon Engineer"
	flag = TALENG
	department_flag = TALON
	job_description = "The engineer's job is to ensure the ITV Talon remains in tip-top shape and to repair any damage as well as manage the shields."
	supervisors = "the ITV Talon's captain"
	outfit_type = /decl/hierarchy/outfit/job/talon_engineer

	offmap_spawn = TRUE
	faction = "Station" //Required for SSjob to allow people to join as it
	departments = list(DEPARTMENT_TALON)
	total_positions = 1
	spawn_positions = 1
	selection_color = "#aaaaaa"
	economic_modifier = 5
	minimal_player_age = 14
	pto_type = null
	access = list(access_talon)
	minimal_access = list(access_talon)
	alt_titles = list("Talon Technician" = /datum/alt_title/talon_tech)

/datum/alt_title/talon_tech
	title = "Talon Technician"


/datum/job/talon_pilot
	title = "Talon Pilot"
	flag = TALPIL
	department_flag = TALON
	job_description = "The pilot's job is to fly the ITV Talon in the most efficient and profitable way possible."
	supervisors = "the ITV Talon's captain"
	outfit_type = /decl/hierarchy/outfit/job/talon_pilot

	offmap_spawn = TRUE
	faction = "Station" //Required for SSjob to allow people to join as it
	departments = list(DEPARTMENT_TALON)
	total_positions = 1
	spawn_positions = 1
	selection_color = "#aaaaaa"
	economic_modifier = 5
	minimal_player_age = 14
	pto_type = null
	access = list(access_talon)
	minimal_access = list(access_talon)
	alt_titles = list("Talon Helmsman" = /datum/alt_title/talon_helmsman)

/datum/alt_title/talon_helmsman
	title = "Talon Helmsman"


/datum/job/talon_guard
	title = "Talon Guard"
	flag = TALSEC
	department_flag = TALON
	job_description = "The guard's job is to keep the crew of the ITV Talon safe and ensure the captain's wishes are carried out."
	supervisors = "the ITV Talon's captain"
	outfit_type = /decl/hierarchy/outfit/job/talon_security

	offmap_spawn = TRUE
	faction = "Station" //Required for SSjob to allow people to join as it
	departments = list(DEPARTMENT_TALON)
	total_positions = 1
	spawn_positions = 1
	selection_color = "#aaaaaa"
	economic_modifier = 5
	minimal_player_age = 14
	pto_type = null
	access = list(access_talon)
	minimal_access = list(access_talon)
	alt_titles = list("Talon Security" = /datum/alt_title/talon_security)

/datum/alt_title/talon_security
	title = "Talon Security"

/datum/job/talon_miner
	title = "Talon Miner"
	flag = TALMIN
	department_flag = TALON
	job_description = "The miner's job is to excavate ores and refine them for the Talon's use, as well as for trading."
	supervisors = "the ITV Talon's captain"
	outfit_type = /decl/hierarchy/outfit/job/talon_miner

	offmap_spawn = TRUE
	faction = "Station" //Required for SSjob to allow people to join as it
	departments = list(DEPARTMENT_TALON)
	total_positions = 1
	spawn_positions = 1
	selection_color = "#aaaaaa"
	economic_modifier = 5
	minimal_player_age = 14
	pto_type = null
	access = list(access_talon)
	minimal_access = list(access_talon)
	alt_titles = list("Talon Excavator" = /datum/alt_title/talon_excavator)

/datum/alt_title/talon_excavator
	title = "Talon Excavator"

//////////////////////TALON OUTFITS//////////////////////

/decl/hierarchy/outfit/job/talon_captain
	name = OUTFIT_JOB_NAME("Talon Captain")

	id_type = /obj/item/card/id/talon/captain
	id_slot = slot_wear_id
	pda_type = null

	l_ear = /obj/item/radio/headset/talon
	glasses = /obj/item/clothing/glasses/sunglasses
	uniform = /obj/item/clothing/under/rank/captain
	shoes = /obj/item/clothing/shoes/brown
	backpack = /obj/item/storage/backpack/captain
	satchel_one = /obj/item/storage/backpack/satchel/cap
	messenger_bag = /obj/item/storage/backpack/messenger/com

/decl/hierarchy/outfit/job/talon_pilot
	name = OUTFIT_JOB_NAME("Talon Pilot")
	id_pda_assignment = "Pilot"

	id_type = /obj/item/card/id/talon/pilot
	id_slot = slot_wear_id
	pda_type = null
	flags = OUTFIT_HAS_BACKPACK|OUTFIT_COMPREHENSIVE_SURVIVAL

	l_ear = /obj/item/radio/headset/talon
	shoes = /obj/item/clothing/shoes/black
	uniform = /obj/item/clothing/under/rank/pilot1/no_webbing
	suit = /obj/item/clothing/suit/storage/toggle/bomber/pilot
	gloves = /obj/item/clothing/gloves/fingerless
	glasses = /obj/item/clothing/glasses/fakesunglasses/aviator
	uniform_accessories = list(/obj/item/clothing/accessory/storage/webbing/pilot1 = 1)

/decl/hierarchy/outfit/job/talon_doctor
	name = OUTFIT_JOB_NAME("Talon Doctor")
	hierarchy_type = /decl/hierarchy/outfit/job

	id_type = /obj/item/card/id/talon/doctor
	id_slot = slot_wear_id
	pda_type = null

	l_ear = /obj/item/radio/headset/talon
	shoes = /obj/item/clothing/shoes/white
	backpack = /obj/item/storage/backpack/medic
	satchel_one = /obj/item/storage/backpack/satchel/med
	messenger_bag = /obj/item/storage/backpack/messenger/med
	uniform = /obj/item/clothing/under/rank/medical
	suit = /obj/item/clothing/suit/storage/toggle/labcoat
	l_hand = /obj/item/storage/firstaid/regular
	r_pocket = /obj/item/flashlight/pen

/decl/hierarchy/outfit/job/talon_security
	name = OUTFIT_JOB_NAME("Talon Security")
	hierarchy_type = /decl/hierarchy/outfit/job

	id_type = /obj/item/card/id/talon/officer
	id_slot = slot_wear_id
	pda_type = null
	backpack_contents = list(/obj/item/handcuffs = 1)

	l_ear = /obj/item/radio/headset/talon
	gloves = /obj/item/clothing/gloves/black
	shoes = /obj/item/clothing/shoes/boots/jackboots
	backpack = /obj/item/storage/backpack/security
	satchel_one = /obj/item/storage/backpack/satchel/sec
	messenger_bag = /obj/item/storage/backpack/messenger/sec
	uniform = /obj/item/clothing/under/rank/security
	l_pocket = /obj/item/flash

/decl/hierarchy/outfit/job/talon_engineer
	name = OUTFIT_JOB_NAME("Talon Engineer")
	hierarchy_type = /decl/hierarchy/outfit/job

	id_type = /obj/item/card/id/talon/engineer
	id_slot = slot_wear_id
	pda_type = null
	flags = OUTFIT_HAS_BACKPACK|OUTFIT_EXTENDED_SURVIVAL

	l_ear = /obj/item/radio/headset/talon
	belt = /obj/item/storage/belt/utility/full
	shoes = /obj/item/clothing/shoes/boots/workboots
	r_pocket = /obj/item/t_scanner
	backpack = /obj/item/storage/backpack/industrial
	satchel_one = /obj/item/storage/backpack/satchel/eng
	messenger_bag = /obj/item/storage/backpack/messenger/engi
	uniform = /obj/item/clothing/under/rank/atmospheric_technician
	belt = /obj/item/storage/belt/utility/atmostech

/decl/hierarchy/outfit/job/talon_miner
	name = OUTFIT_JOB_NAME("Talon Miner")
	hierarchy_type = /decl/hierarchy/outfit/job

	id_type = /obj/item/card/id/talon/miner
	id_slot = slot_wear_id
	pda_type = null
	flags = OUTFIT_HAS_BACKPACK|OUTFIT_EXTENDED_SURVIVAL

	l_ear = /obj/item/radio/headset/talon
	shoes = /obj/item/clothing/shoes/boots/workboots
	r_pocket = /obj/item/storage/bag/ore
	l_pocket = /obj/item/tool/crowbar
	uniform = /obj/item/clothing/under/rank/talon/basic
	backpack = /obj/item/storage/backpack/talon
	satchel_one = /obj/item/storage/backpack/satchel/talon
	messenger_bag = /obj/item/storage/backpack/messenger/talon
