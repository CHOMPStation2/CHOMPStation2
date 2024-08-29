/decl/hierarchy/outfit/job/centcom_officer
	name = OUTFIT_JOB_NAME("CentCom Officer")
	uniform = /obj/item/clothing/under/rank/centcom
	gloves = /obj/item/clothing/gloves/white
	shoes = /obj/item/clothing/shoes/laceup
	head = /obj/item/clothing/head/beret/centcom/officer
	l_ear = /obj/item/radio/headset/centcom // CHOMPEdit - Removal of obj/item/device
	glasses = /obj/item/clothing/glasses/omnihud/all
	id_type = /obj/item/card/id/centcom // CHOMPEdit - Removal of obj/item/weapon
	pda_type = /obj/item/pda/centcom // CHOMPEdit - Removal of obj/item/device
	flags = OUTFIT_EXTENDED_SURVIVAL|OUTFIT_COMPREHENSIVE_SURVIVAL

/decl/hierarchy/outfit/job/emergency_responder
	name = OUTFIT_JOB_NAME("Emergency Responder")
	uniform = /obj/item/clothing/under/ert
	shoes = /obj/item/clothing/shoes/boots/swat
	gloves = /obj/item/clothing/gloves/swat
	l_ear = /obj/item/radio/headset/ert // CHOMPEdit - Removal of obj/item/device
	glasses = /obj/item/clothing/glasses/sunglasses
	back = /obj/item/storage/backpack/satchel // CHOMPEdit - Removal of obj/item/weapon
	id_type = /obj/item/card/id/centcom/ERT // CHOMPEdit - Removal of obj/item/weapon
	pda_type = /obj/item/pda/centcom // CHOMPEdit - Removal of obj/item/device
	flags = OUTFIT_EXTENDED_SURVIVAL|OUTFIT_COMPREHENSIVE_SURVIVAL

/decl/hierarchy/outfit/job/emergency_responder/post_equip(var/mob/living/carbon/human/H)
	..()
	ert.add_antagonist(H.mind)

/decl/hierarchy/outfit/job/clown
	name = OUTFIT_JOB_NAME("Clown")
	uniform = /obj/item/clothing/under/rank/clown
	back = /obj/item/storage/backpack/clown // CHOMPEdit - Removal of obj/item/weapon
	shoes = /obj/item/clothing/shoes/clown_shoes
	mask = /obj/item/clothing/mask/gas/clown_hat
	backpack_contents = list(/obj/item/stamp/clown = 1, /obj/item/bikehorn = 1) // CHOMPEdit - Removal of obj/item/weapon
	id_type = /obj/item/card/id/civilian/clown // CHOMPEdit - Removal of obj/item/weapon
	pda_type = /obj/item/pda/clown // CHOMPEdit - Removal of obj/item/device
	flags = 0

/decl/hierarchy/outfit/job/mime
	name = OUTFIT_JOB_NAME("Mime")
	uniform = /obj/item/clothing/under/mime
	shoes = /obj/item/clothing/shoes/mime
	head = /obj/item/clothing/head/soft/mime
	mask = /obj/item/clothing/mask/gas/mime
	backpack_contents = list(/obj/item/pen/crayon/mime = 1) // CHOMPEdit - Removal of obj/item/weapon
	id_type = /obj/item/card/id/civilian/mime // CHOMPEdit - Removal of obj/item/weapon
	pda_type = /obj/item/pda/mime // CHOMPEdit - Removal of obj/item/device

/decl/hierarchy/outfit/job/mime/post_equip(var/mob/living/carbon/human/H)
	..()
	if(H.backbag == 1)
		H.equip_to_slot_or_del(new /obj/item/pen/crayon/mime(H), slot_l_hand) // CHOMPEdit - Removal of obj/item/weapon
