//Job Outfits

/*
SOUTHERN CROSS OUTFITS
Keep outfits simple. Spawn with basic uniforms and minimal gear. Gear instead goes in lockers. Keep this in mind if editing.
*/
/decl/hierarchy/outfit/job/explorer2
	name = OUTFIT_JOB_NAME(JOB_EXPLORER)
	shoes = /obj/item/clothing/shoes/boots/winter/explorer
	uniform = /obj/item/clothing/under/explorer
	l_ear = /obj/item/device/radio/headset/explorer
	id_slot = slot_wear_id
	pda_slot = slot_l_store
	pda_type = /obj/item/device/pda/explorer //VORESTation Edit - Better Brown
	id_type = /obj/item/weapon/card/id/explorer //VOREStation Edit
	id_pda_assignment = JOB_EXPLORER
	flags = OUTFIT_HAS_BACKPACK|OUTFIT_COMPREHENSIVE_SURVIVAL
	backpack_contents = list(/obj/item/clothing/accessory/permit/gun/planetside = 1)

/decl/hierarchy/outfit/job/explorer2/post_equip(mob/living/carbon/human/H)
	..()
	for(var/obj/item/clothing/accessory/permit/gun/planetside/permit in H.back.contents)
		permit.set_name(H.real_name)

/decl/hierarchy/outfit/job/explorer2/technician
	name = OUTFIT_JOB_NAME(JOB_ALT_EXPLORERE_TECHNICIAN)
	belt = /obj/item/weapon/storage/belt/utility/full
	pda_slot = slot_l_store
	id_pda_assignment = JOB_ALT_EXPLORERE_TECHNICIAN

/decl/hierarchy/outfit/job/explorer2/medic
	name = OUTFIT_JOB_NAME(JOB_ALT_EXPLORER_MEDIC)
	l_hand = /obj/item/weapon/storage/firstaid/regular
	pda_slot = slot_l_store
	id_pda_assignment = JOB_ALT_EXPLORER_MEDIC

/decl/hierarchy/outfit/job/pilot
	name = OUTFIT_JOB_NAME(JOB_PILOT)
	shoes = /obj/item/clothing/shoes/black
	uniform = /obj/item/clothing/under/rank/pilot1
	suit = /obj/item/clothing/suit/storage/toggle/bomber/pilot
	gloves = /obj/item/clothing/gloves/fingerless
	glasses = /obj/item/clothing/glasses/fakesunglasses/aviator
	l_ear = /obj/item/device/radio/headset/pilot/alt
	id_slot = slot_wear_id
	pda_slot = slot_belt
	pda_type = /obj/item/device/pda //VOREStation Edit - Civilian
	id_pda_assignment = JOB_PILOT
	flags = OUTFIT_HAS_BACKPACK|OUTFIT_COMPREHENSIVE_SURVIVAL

/decl/hierarchy/outfit/job/medical/sar
	name = OUTFIT_JOB_NAME(JOB_FIELD_MEDIC) //VOREStation Edit
	uniform = /obj/item/clothing/under/utility/blue
	//suit = /obj/item/clothing/suit/storage/hooded/wintercoat/medical/sar //VOREStation Edit
	shoes = /obj/item/clothing/shoes/boots/winter/explorer
	l_ear = /obj/item/device/radio/headset/sar
	l_hand = /obj/item/weapon/storage/firstaid/regular
	belt = /obj/item/weapon/storage/belt/medical/emt
	pda_slot = slot_l_store
	pda_type = /obj/item/device/pda/sar //VOREStation Add
	id_pda_assignment = JOB_FIELD_MEDIC //VOREStation Edit
	flags = OUTFIT_HAS_BACKPACK|OUTFIT_EXTENDED_SURVIVAL|OUTFIT_COMPREHENSIVE_SURVIVAL


/decl/hierarchy/outfit/job/explorer2
	name = OUTFIT_JOB_NAME(JOB_EXPLORER)
	shoes = /obj/item/clothing/shoes/boots/winter/explorer
	uniform = /obj/item/clothing/under/explorer
	l_ear = /obj/item/device/radio/headset/explorer
	id_slot = slot_wear_id
	pda_slot = slot_l_store
	pda_type = /obj/item/device/pda/explorer //VORESTation Edit - Better Brown
	id_type = /obj/item/weapon/card/id/explorer/explorer //VOREStation Edit
	id_pda_assignment = JOB_EXPLORER
	flags = OUTFIT_HAS_BACKPACK|OUTFIT_COMPREHENSIVE_SURVIVAL
	backpack_contents = list(/obj/item/clothing/accessory/permit/gun/planetside = 1)

/decl/hierarchy/outfit/job/explorer2/post_equip(mob/living/carbon/human/H)
	..()
	for(var/obj/item/clothing/accessory/permit/gun/planetside/permit in H.back.contents)
		permit.set_name(H.real_name)

/decl/hierarchy/outfit/job/explorer2/technician
	name = OUTFIT_JOB_NAME(JOB_ALT_EXPLORERE_TECHNICIAN)
	belt = /obj/item/weapon/storage/belt/utility/full
	pda_slot = slot_l_store
	id_pda_assignment = JOB_ALT_EXPLORERE_TECHNICIAN

/decl/hierarchy/outfit/job/explorer2/medic
	name = OUTFIT_JOB_NAME(JOB_ALT_EXPLORER_MEDIC)
	l_hand = /obj/item/weapon/storage/firstaid/regular
	pda_slot = slot_l_store
	id_pda_assignment = JOB_ALT_EXPLORER_MEDIC

/decl/hierarchy/outfit/job/pilot
	name = OUTFIT_JOB_NAME(JOB_PILOT)
	shoes = /obj/item/clothing/shoes/black
	uniform = /obj/item/clothing/under/rank/pilot1
	suit = /obj/item/clothing/suit/storage/toggle/bomber/pilot
	gloves = /obj/item/clothing/gloves/fingerless
	glasses = /obj/item/clothing/glasses/fakesunglasses/aviator
	l_ear = /obj/item/device/radio/headset/pilot/alt
	id_slot = slot_wear_id
	pda_slot = slot_belt
	pda_type = /obj/item/device/pda //VOREStation Edit - Civilian
	id_type = /obj/item/weapon/card/id/explorer/pilot //VOREStation Edit
	id_pda_assignment = JOB_PILOT
	flags = OUTFIT_HAS_BACKPACK|OUTFIT_COMPREHENSIVE_SURVIVAL

/decl/hierarchy/outfit/job/medical/sar
	name = OUTFIT_JOB_NAME(JOB_FIELD_MEDIC) //VOREStation Edit
	uniform = /obj/item/clothing/under/utility/blue
	//suit = /obj/item/clothing/suit/storage/hooded/wintercoat/medical/sar //VOREStation Edit
	shoes = /obj/item/clothing/shoes/boots/winter/explorer
	l_ear = /obj/item/device/radio/headset/sar
	l_hand = /obj/item/weapon/storage/firstaid/regular
	belt = /obj/item/weapon/storage/belt/medical/emt
	pda_slot = slot_l_store
	pda_type = /obj/item/device/pda/sar //VOREStation Add
	id_type = /obj/item/weapon/card/id/medical/sar
	id_pda_assignment = JOB_FIELD_MEDIC //VOREStation Edit
	flags = OUTFIT_HAS_BACKPACK|OUTFIT_EXTENDED_SURVIVAL|OUTFIT_COMPREHENSIVE_SURVIVAL


/decl/hierarchy/outfit/job/pathfinder
	name = OUTFIT_JOB_NAME(JOB_PATHFINDER)
	shoes = /obj/item/clothing/shoes/boots/winter/explorer
	uniform = /obj/item/clothing/under/explorer //TODO: Uniforms.
	l_ear = /obj/item/device/radio/headset/explorer
	id_slot = slot_wear_id
	pda_slot = slot_l_store
	pda_type = /obj/item/device/pda/pathfinder
	id_type = /obj/item/weapon/card/id/explorer/head/pathfinder
	id_pda_assignment = JOB_PATHFINDER
	flags = OUTFIT_HAS_BACKPACK|OUTFIT_EXTENDED_SURVIVAL|OUTFIT_COMPREHENSIVE_SURVIVAL
	backpack_contents = list(/obj/item/clothing/accessory/permit/gun/planetside = 1)

/decl/hierarchy/outfit/job/pathfinder/post_equip(mob/living/carbon/human/H)
	..()
	for(var/obj/item/clothing/accessory/permit/gun/planetside/permit in H.back.contents)
		permit.set_name(H.real_name)

/decl/hierarchy/outfit/job/assistant/explorer
	id_type = /obj/item/weapon/card/id/explorer
	flags = OUTFIT_HAS_BACKPACK|OUTFIT_COMPREHENSIVE_SURVIVAL
