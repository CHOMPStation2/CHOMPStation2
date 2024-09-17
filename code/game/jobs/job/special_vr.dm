/datum/job/centcom_officer //For Business
	title = "CentCom Officer"
	departments = list("Central Command")
	department_accounts = list(DEPARTMENT_COMMAND, DEPARTMENT_ENGINEERING, DEPARTMENT_MEDICAL, DEPARTMENT_RESEARCH, DEPARTMENT_SECURITY, DEPARTMENT_CARGO, DEPARTMENT_PLANET, DEPARTMENT_CIVILIAN)
	faction = FACTION_STATION
	total_positions = 2
	spawn_positions = 1
	supervisors = "company officials and Corporate Regulations"
	selection_color = "#1D1D4F"
	access = list()
	minimal_access = list()
	minimal_player_age = 14
	economic_modifier = 20
	whitelist_only = 1
	latejoin_only = 1
	outfit_type = /decl/hierarchy/outfit/job/centcom_officer
	job_description = "A Central Command Officer is there on official business. Most of time. Whatever it is, they're a VIP."

	minimum_character_age = 25
	ideal_character_age = 40

	pto_type = PTO_CIVILIAN

/datum/job/centcom_officer/get_access()
	return get_all_accesses().Copy()

//YW UNCOMMENTINGSTART: INSTATE LOYALTY IMPLANT
/datum/job/centcom_officer/equip(var/mob/living/carbon/human/H)
	. = ..()
	if(.)
		H.implant_loyalty(src)
//YW UNCOMMENTING END

/*/datum/job/centcom_visitor //For Pleasure // You mean for admin abuse... -Ace
	title = "CentCom Visitor"
	department = "Civilian"
	head_position = 1
	faction = "Station"
	total_positions = 2
	spawn_positions = 1
	supervisors = "company officials and Corporate Regulations"
	selection_color = "#1D1D4F"
	idtype = /obj/item/weapon/card/id/centcom
	access = list()
	minimal_access = list()
	minimal_player_age = 14
	economic_modifier = 20
	whitelist_only = 1
	latejoin_only = 1

	minimum_character_age = 25
	ideal_character_age = 40

	equip(var/mob/living/carbon/human/H)
		if(!H)	return 0
		H.equip_to_slot_or_del(new /obj/item/device/radio/headset/centcom(H), slot_l_ear)
		switch(H.backbag)
			if(2) H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack(H), slot_back)
			if(3) H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/satchel(H), slot_back)
			if(4) H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/satchel(H), slot_back)
		H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/centcom, slot_w_uniform)
		H.equip_to_slot_or_del(new /obj/item/device/pda/centcom(H), slot_belt)
		H.equip_to_slot_or_del(new /obj/item/clothing/shoes/laceup(H), slot_shoes)
		H.equip_to_slot_or_del(new /obj/item/clothing/gloves/white(H), slot_gloves)
		H.equip_to_slot_or_del(new /obj/item/clothing/head/beret/centcom/officer(H), slot_head)
		H.equip_to_slot_or_del(new /obj/item/clothing/glasses/omnihud(H), slot_l_store)

		H.implant_loyalty()

		return 1

	get_access()
		var/access = get_all_accesses()
		return access*/

/datum/job/emergency_responder //For staff managing/leading ERTs
	title = "Emergency Responder"
	departments = list("Central Command")
	department_accounts = list(DEPARTMENT_COMMAND, DEPARTMENT_ENGINEERING, DEPARTMENT_MEDICAL, DEPARTMENT_RESEARCH, DEPARTMENT_SECURITY, DEPARTMENT_CARGO, DEPARTMENT_PLANET, DEPARTMENT_CIVILIAN)
	faction = FACTION_STATION
	total_positions = 2
	spawn_positions = 1
	supervisors = "company officials and Corporate Regulations"
	selection_color = "#1D1D4F"
	access = list()
	minimal_access = list()
	minimal_player_age = 14
	economic_modifier = 20
	whitelist_only = 1
	latejoin_only = 1
	outfit_type = /decl/hierarchy/outfit/job/emergency_responder
	job_description = "Emergency Responders are usually called in to deal with on-station emergencies that the crew require assistance to deal with."

	minimum_character_age = 18
	ideal_character_age = 30

	pto_type = PTO_CIVILIAN

/datum/job/emergency_responder/get_access()
	return get_all_accesses().Copy()
/* CHOMPEDIT: Removing Clown/Mime job from being initialized at all (These are alt titles of Entertainer on our codebase)
/datum/job/clown
	title = JOB_CLOWN
	flag = CLOWN
	departments = list(DEPARTMENT_CIVILIAN)
	department_flag = ENGSEC
	faction = FACTION_STATION
	total_positions = -1 //CHOMP Edit: Disable. Change to + integer to enable.
	spawn_positions = -1 //CHOMP Edit: Disable. Change to + integer to enable.
	supervisors = "the spirit of laughter"
	selection_color = "#515151"
	economic_modifier = 1
	job_description = "A " + JOB_CLOWN + " is there to entertain the crew and keep high morale using various harmless pranks and ridiculous jokes!"
	whitelist_only = 1
	latejoin_only = 0
	requestable = FALSE
	outfit_type = /decl/hierarchy/outfit/job/clown
	pto_type = PTO_CIVILIAN
	alt_titles = list(JOB_ALT_JESTER = /datum/alt_title/jester, JOB_ALT_FOOL = /datum/alt_title/fool)

/datum/alt_title/jester
	title = JOB_ALT_JESTER

/datum/alt_title/fool
	title = JOB_ALT_FOOL

/datum/job/clown/get_access()
	if(CONFIG_GET(flag/assistant_maint)) // CHOMPEdit
		return list(access_maint_tunnels, access_entertainment, access_clown, access_tomfoolery)
	else
		return list(access_entertainment, access_clown, access_tomfoolery)

/datum/job/mime
	title = JOB_MIME
	flag = MIME
	departments = list(DEPARTMENT_CIVILIAN)
	department_flag = ENGSEC
	faction = FACTION_STATION
	total_positions = -1 //CHOMP Edit: Disable. Change to + integer to enable.
	spawn_positions = -1 //CHOMP Edit: Disable. Change to + integer to enable.
	supervisors = "the spirit of performance"
	selection_color = "#515151"
	economic_modifier = 1
	job_description = "A " + JOB_MIME + " is there to entertain the crew and keep high morale using unbelievable performances and acting skills!"
	alt_titles = list(JOB_ALT_PASEUR = /datum/alt_title/poseur)
	whitelist_only = 1
	latejoin_only = 0
	requestable = FALSE
	outfit_type = /decl/hierarchy/outfit/job/mime
	pto_type = PTO_CIVILIAN

/datum/alt_title/poseur
	title = JOB_ALT_PASEUR

/datum/job/mime/get_access()
	if(CONFIG_GET(flag/assistant_maint)) // CHOMPEdit
		return list(access_maint_tunnels, access_entertainment, access_tomfoolery, access_mime)
	else
		return list(access_entertainment, access_tomfoolery, access_mime)
*/ //CHOMPEDIT: END remove Mime/clown defines (These are alt titles of Entertainer on our codebase)
