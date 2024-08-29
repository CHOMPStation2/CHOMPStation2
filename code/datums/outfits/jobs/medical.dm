/decl/hierarchy/outfit/job/medical
	hierarchy_type = /decl/hierarchy/outfit/job/medical
	l_ear = /obj/item/radio/headset/headset_med // CHOMPEdit - Removal of obj/item/device
	shoes = /obj/item/clothing/shoes/white
	pda_type = /obj/item/pda/medical // CHOMPEdit - Removal of obj/item/device
	pda_slot = slot_l_store
	backpack = /obj/item/storage/backpack/medic // CHOMPEdit - Removal of obj/item/weapon
	satchel_one = /obj/item/storage/backpack/satchel/med // CHOMPEdit - Removal of obj/item/weapon
	messenger_bag = /obj/item/storage/backpack/messenger/med // CHOMPEdit - Removal of obj/item/weapon

/decl/hierarchy/outfit/job/medical/cmo
	name = OUTFIT_JOB_NAME("Chief Medical Officer")
	l_ear  =/obj/item/radio/headset/heads/cmo // CHOMPEdit - Removal of obj/item/device
	uniform = /obj/item/clothing/under/rank/chief_medical_officer
	suit = /obj/item/clothing/suit/storage/toggle/labcoat/cmo
	shoes = /obj/item/clothing/shoes/brown
	l_hand = /obj/item/storage/firstaid/adv // CHOMPEdit - Removal of obj/item/weapon
	r_pocket = /obj/item/healthanalyzer // CHOMPEdit - Removal of obj/item/device
	id_type = /obj/item/card/id/medical/head // CHOMPEdit - Removal of obj/item/weapon
	pda_type = /obj/item/pda/heads/cmo // CHOMPEdit - Removal of obj/item/device

/decl/hierarchy/outfit/job/medical/doctor
	name = OUTFIT_JOB_NAME("Medical Doctor")
	uniform = /obj/item/clothing/under/rank/medical
	suit = /obj/item/clothing/suit/storage/toggle/labcoat
	l_hand = /obj/item/storage/firstaid/adv //CHOMP Edit // CHOMPEdit - Removal of obj/item/weapon
	r_pocket = /obj/item/flashlight/pen // CHOMPEdit - Removal of obj/item/device
	id_type = /obj/item/card/id/medical // CHOMPEdit - Removal of obj/item/weapon

/decl/hierarchy/outfit/job/medical/doctor/emergency_physician
	name = OUTFIT_JOB_NAME("Emergency Physician")
	suit = /obj/item/clothing/suit/storage/toggle/fr_jacket

/decl/hierarchy/outfit/job/medical/doctor/surgeon
	name = OUTFIT_JOB_NAME("Surgeon")
	uniform = /obj/item/clothing/under/rank/medical/scrubs
	head = /obj/item/clothing/head/surgery/blue

/decl/hierarchy/outfit/job/medical/doctor/virologist
	name = OUTFIT_JOB_NAME("Virologist")
	uniform = /obj/item/clothing/under/rank/virologist
	suit = /obj/item/clothing/suit/storage/toggle/labcoat/virologist
	mask = /obj/item/clothing/mask/surgical
	backpack = /obj/item/storage/backpack/virology // CHOMPEdit - Removal of obj/item/weapon
	satchel_one = /obj/item/storage/backpack/satchel/vir // CHOMPEdit - Removal of obj/item/weapon

/decl/hierarchy/outfit/job/medical/doctor/nurse
	name = OUTFIT_JOB_NAME("Nurse")
	suit = null

/decl/hierarchy/outfit/job/medical/doctor/nurse/pre_equip(mob/living/carbon/human/H)
	if(H.gender == FEMALE)
		if(prob(50))
			uniform = /obj/item/clothing/under/rank/nursesuit
		else
			uniform = /obj/item/clothing/under/rank/nurse
		head = /obj/item/clothing/head/nursehat
	else
		uniform = /obj/item/clothing/under/rank/medical/scrubs/purple
	..()

/decl/hierarchy/outfit/job/medical/chemist
	name = OUTFIT_JOB_NAME("Chemist")
	uniform = /obj/item/clothing/under/rank/chemist
	suit = /obj/item/clothing/suit/storage/toggle/labcoat/chemist
	backpack = /obj/item/storage/backpack/chemistry // CHOMPEdit - Removal of obj/item/weapon
	satchel_one = /obj/item/storage/backpack/satchel/chem // CHOMPEdit - Removal of obj/item/weapon
	sports_bag = /obj/item/storage/backpack/sport/chem // CHOMPEdit - Removal of obj/item/weapon
	id_type = /obj/item/card/id/medical/chemist // CHOMPEdit - Removal of obj/item/weapon
	pda_type = /obj/item/pda/chemist // CHOMPEdit - Removal of obj/item/device

/decl/hierarchy/outfit/job/medical/geneticist
	name = OUTFIT_JOB_NAME("Geneticist")
	uniform = /obj/item/clothing/under/rank/geneticist
	suit = /obj/item/clothing/suit/storage/toggle/labcoat/genetics
	backpack = /obj/item/storage/backpack/genetics // CHOMPEdit - Removal of obj/item/weapon
	r_pocket = /obj/item/flashlight/pen // CHOMPEdit - Removal of obj/item/device
	satchel_one = /obj/item/storage/backpack/satchel/gen // CHOMPEdit - Removal of obj/item/weapon
	id_type = /obj/item/card/id/medical/geneticist // CHOMPEdit - Removal of obj/item/weapon
	pda_type = /obj/item/pda/geneticist // CHOMPEdit - Removal of obj/item/device

/decl/hierarchy/outfit/job/medical/psychiatrist
	name = OUTFIT_JOB_NAME("Psychiatrist")
	uniform = /obj/item/clothing/under/rank/psych
	suit = /obj/item/clothing/suit/storage/toggle/labcoat
	shoes = /obj/item/clothing/shoes/laceup
	id_type = /obj/item/card/id/medical/psych // CHOMPEdit - Removal of obj/item/weapon

/decl/hierarchy/outfit/job/medical/psychiatrist/psychologist
	name = OUTFIT_JOB_NAME("Psychologist")
	uniform = /obj/item/clothing/under/rank/psych/turtleneck

/decl/hierarchy/outfit/job/medical/paramedic
	name = OUTFIT_JOB_NAME("Paramedic")
	uniform = /obj/item/clothing/under/rank/medical/paramedic
	suit = /obj/item/clothing/suit/storage/toggle/fr_jacket
	shoes = /obj/item/clothing/shoes/boots/jackboots
	l_hand = /obj/item/storage/firstaid/regular // CHOMPEdit - Removal of obj/item/weapon
	belt = /obj/item/storage/belt/medical/emt // CHOMPEdit - Removal of obj/item/weapon
	pda_slot = slot_l_store
	id_type = /obj/item/card/id/medical/emt // CHOMPEdit - Removal of obj/item/weapon
	flags = OUTFIT_HAS_BACKPACK|OUTFIT_EXTENDED_SURVIVAL

/decl/hierarchy/outfit/job/medical/paramedic/emt
	name = OUTFIT_JOB_NAME("Emergency Medical Technician")
	uniform = /obj/item/clothing/under/rank/medical/paramedic_alt
	suit = /obj/item/clothing/suit/storage/toggle/labcoat/emt
