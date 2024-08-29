/decl/hierarchy/outfit/job/security
	hierarchy_type = /decl/hierarchy/outfit/job/security
	glasses = /obj/item/clothing/glasses/sunglasses/sechud
	l_ear = /obj/item/radio/headset/headset_sec // CHOMPEdit - Removal of obj/item/device
	gloves = /obj/item/clothing/gloves/black
	shoes = /obj/item/clothing/shoes/boots/jackboots
	backpack = /obj/item/storage/backpack/security // CHOMPEdit - Removal of obj/item/weapon
	satchel_one = /obj/item/storage/backpack/satchel/sec // CHOMPEdit - Removal of obj/item/weapon
	backpack_contents = list(/obj/item/handcuffs = 1) // CHOMPEdit - Removal of obj/item/weapon
	messenger_bag = /obj/item/storage/backpack/messenger/sec // CHOMPEdit - Removal of obj/item/weapon
	sports_bag = /obj/item/storage/backpack/sport/sec // CHOMPEdit - Removal of obj/item/weapon

/decl/hierarchy/outfit/job/security/hos
	name = OUTFIT_JOB_NAME("Head of security")
	l_ear = /obj/item/radio/headset/heads/hos // CHOMPEdit - Removal of obj/item/device
	uniform = /obj/item/clothing/under/rank/head_of_security
	id_type = /obj/item/card/id/security/head // CHOMPEdit - Removal of obj/item/weapon
	pda_type = /obj/item/pda/heads/hos // CHOMPEdit - Removal of obj/item/device

/decl/hierarchy/outfit/job/security/warden
	name = OUTFIT_JOB_NAME("Warden")
	uniform = /obj/item/clothing/under/rank/warden
	l_pocket = /obj/item/flash // CHOMPEdit - Removal of obj/item/device
	id_type = /obj/item/card/id/security/warden // CHOMPEdit - Removal of obj/item/weapon
	pda_type = /obj/item/pda/warden // CHOMPEdit - Removal of obj/item/device

/decl/hierarchy/outfit/job/security/detective
	name = OUTFIT_JOB_NAME("Detective")
	head = /obj/item/clothing/head/det
	uniform = /obj/item/clothing/under/det
	suit = /obj/item/clothing/suit/storage/det_trench
	l_pocket = /obj/item/flame/lighter/zippo // CHOMPEdit - Removal of obj/item/weapon
	shoes = /obj/item/clothing/shoes/laceup
	r_hand = /obj/item/storage/briefcase/crimekit // CHOMPEdit - Removal of obj/item/weapon
	id_type = /obj/item/card/id/security/detective // CHOMPEdit - Removal of obj/item/weapon
	pda_type = /obj/item/pda/detective // CHOMPEdit - Removal of obj/item/device
	backpack = /obj/item/storage/backpack // CHOMPEdit - Removal of obj/item/weapon
	satchel_one = /obj/item/storage/backpack/satchel/norm // CHOMPEdit - Removal of obj/item/weapon
	backpack_contents = list(/obj/item/storage/box/evidence = 1) // CHOMPEdit - Removal of obj/item/weapon
	gloves = /obj/item/clothing/gloves/forensic //CHOMP Addition

//VOREStation Edit - More cyberpunky
/decl/hierarchy/outfit/job/security/detective/forensic
	name = OUTFIT_JOB_NAME("Forensic technician")
	head = null
	suit = /obj/item/clothing/suit/storage/det_trench/alt2
	uniform = /obj/item/clothing/under/det
//VOREStation Edit End

/decl/hierarchy/outfit/job/security/officer
	name = OUTFIT_JOB_NAME("Security Officer")
	uniform = /obj/item/clothing/under/rank/security
	l_pocket = /obj/item/flash // CHOMPEdit - Removal of obj/item/device
	id_type = /obj/item/card/id/security // CHOMPEdit - Removal of obj/item/weapon
	pda_type = /obj/item/pda/security // CHOMPEdit - Removal of obj/item/device
