/decl/hierarchy/outfit/job/engineering
	hierarchy_type = /decl/hierarchy/outfit/job/engineering
	belt = /obj/item/storage/belt/utility/full/multitool // CHOMPEdit - Removal of obj/item/weapon
	l_ear = /obj/item/radio/headset/headset_eng // CHOMPEdit - Removal of obj/item/device
	shoes = /obj/item/clothing/shoes/boots/workboots
	r_pocket = /obj/item/t_scanner // CHOMPEdit - Removal of obj/item/device
	backpack = /obj/item/storage/backpack/industrial // CHOMPEdit - Removal of obj/item/weapon
	satchel_one = /obj/item/storage/backpack/satchel/eng // CHOMPEdit - Removal of obj/item/weapon
	messenger_bag = /obj/item/storage/backpack/messenger/engi // CHOMPEdit - Removal of obj/item/weapon
	pda_slot = slot_l_store
	flags = OUTFIT_HAS_BACKPACK|OUTFIT_EXTENDED_SURVIVAL

/decl/hierarchy/outfit/job/engineering/chief_engineer
	name = OUTFIT_JOB_NAME("Chief engineer")
	head = /obj/item/clothing/head/hardhat/white
	uniform = /obj/item/clothing/under/rank/chief_engineer
	l_ear = /obj/item/radio/headset/heads/ce // CHOMPEdit - Removal of obj/item/device
	gloves = /obj/item/clothing/gloves/black
	id_type = /obj/item/card/id/engineering/head // CHOMPEdit - Removal of obj/item/weapon
	pda_type = /obj/item/pda/heads/ce // CHOMPEdit - Removal of obj/item/device

/decl/hierarchy/outfit/job/engineering/engineer
	name = OUTFIT_JOB_NAME("Engineer")
	head = /obj/item/clothing/head/hardhat
	uniform = /obj/item/clothing/under/rank/engineer
	id_type = /obj/item/card/id/engineering // CHOMPEdit - Removal of obj/item/weapon
	pda_type = /obj/item/pda/engineering // CHOMPEdit - Removal of obj/item/device

/decl/hierarchy/outfit/job/engineering/atmos
	name = OUTFIT_JOB_NAME("Atmospheric technician")
	uniform = /obj/item/clothing/under/rank/atmospheric_technician
	belt = /obj/item/storage/belt/utility/atmostech // CHOMPEdit - Removal of obj/item/weapon
	id_type = /obj/item/card/id/engineering/atmos // CHOMPEdit - Removal of obj/item/weapon
	pda_type = /obj/item/pda/atmos // CHOMPEdit - Removal of obj/item/device
