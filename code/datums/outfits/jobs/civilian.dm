/decl/hierarchy/outfit/job/assistant
	name = OUTFIT_JOB_NAME(USELESS_JOB) //VOREStation Edit - Visitor not Assistant
	id_type = /obj/item/card/id/generic	//VOREStation Edit // CHOMPEdit - Removal of obj/item/weapon

/decl/hierarchy/outfit/job/assistant/visitor
	name = OUTFIT_JOB_NAME("Visitor")
	id_pda_assignment = "Visitor"
	uniform = /obj/item/clothing/under/assistantformal

//VOREStation Add - Interns
/decl/hierarchy/outfit/job/assistant/intern
	name = OUTFIT_JOB_NAME("Intern")
	id_type = /obj/item/card/id/civilian // CHOMPEdit - Removal of obj/item/weapon
//VOREStation Add End - Interns

/decl/hierarchy/outfit/job/assistant/resident
	name = OUTFIT_JOB_NAME("Resident")
	id_pda_assignment = "Resident"
	uniform = /obj/item/clothing/under/color/white

/decl/hierarchy/outfit/job/service
	l_ear = /obj/item/radio/headset/headset_service // CHOMPEdit - Removal of obj/item/device
	hierarchy_type = /decl/hierarchy/outfit/job/service

/decl/hierarchy/outfit/job/service/bartender
	name = OUTFIT_JOB_NAME("Bartender")
	uniform = /obj/item/clothing/under/rank/bartender
	id_type = /obj/item/card/id/civilian/service/bartender		//VOREStation Edit // CHOMPEdit - Removal of obj/item/weapon
	pda_type = /obj/item/pda/bar // CHOMPEdit - Removal of obj/item/device
	backpack_contents = list(/obj/item/clothing/accessory/permit/gun/bar = 1)

/decl/hierarchy/outfit/job/service/bartender/post_equip(mob/living/carbon/human/H)
	..()
	if(H.back)
		for(var/obj/item/clothing/accessory/permit/gun/bar/permit in H.back.contents)
			permit.set_name(H.real_name)

/decl/hierarchy/outfit/job/service/bartender/barista
	name = OUTFIT_JOB_NAME("Barista")
	id_pda_assignment = "Barista"
	backpack_contents = null

/decl/hierarchy/outfit/job/service/chef
	name = OUTFIT_JOB_NAME("Chef")
	uniform = /obj/item/clothing/under/rank/chef
	suit = /obj/item/clothing/suit/chef
	head = /obj/item/clothing/head/chefhat
	id_type = /obj/item/card/id/civilian/service/chef		//VOREStation Edit // CHOMPEdit - Removal of obj/item/weapon
	pda_type = /obj/item/pda/chef // CHOMPEdit - Removal of obj/item/device

/decl/hierarchy/outfit/job/service/chef/cook
	name = OUTFIT_JOB_NAME("Cook")
	id_pda_assignment = "Cook"

// Rykka adds Server Outfit

/decl/hierarchy/outfit/job/service/server
	name = OUTFIT_JOB_NAME("Server")
	uniform = /obj/item/clothing/under/waiter

// End Outfit addition

/decl/hierarchy/outfit/job/service/gardener
	name = OUTFIT_JOB_NAME("Gardener")
	uniform = /obj/item/clothing/under/rank/hydroponics
	suit = /obj/item/clothing/suit/storage/apron
	gloves = /obj/item/clothing/gloves/botanic_leather
	r_pocket = /obj/item/analyzer/plant_analyzer // CHOMPEdit - Removal of obj/item/device
	backpack = /obj/item/storage/backpack/hydroponics // CHOMPEdit - Removal of obj/item/weapon
	satchel_one = /obj/item/storage/backpack/satchel/hyd // CHOMPEdit - Removal of obj/item/weapon
	messenger_bag = /obj/item/storage/backpack/messenger/hyd // CHOMPEdit - Removal of obj/item/weapon
	sports_bag = /obj/item/storage/backpack/sport/hyd // CHOMPEdit - Removal of obj/item/weapon
	id_type = /obj/item/card/id/civilian/service/botanist	//VOREStation Edit // CHOMPEdit - Removal of obj/item/weapon
	pda_type = /obj/item/pda/botanist // CHOMPEdit - Removal of obj/item/device

/decl/hierarchy/outfit/job/service/janitor
	name = OUTFIT_JOB_NAME("Janitor")
	uniform = /obj/item/clothing/under/rank/janitor
	id_type = /obj/item/card/id/civilian/service/janitor		//VOREStation Edit // CHOMPEdit - Removal of obj/item/weapon
	pda_type = /obj/item/pda/janitor // CHOMPEdit - Removal of obj/item/device

/decl/hierarchy/outfit/job/librarian
	name = OUTFIT_JOB_NAME("Librarian")
	uniform = /obj/item/clothing/under/suit_jacket/red
	l_hand = /obj/item/barcodescanner // CHOMPEdit - Removal of obj/item/weapon
	id_type = /obj/item/card/id/civilian // CHOMPEdit - Removal of obj/item/weapon
	pda_type = /obj/item/pda/librarian // CHOMPEdit - Removal of obj/item/device

/decl/hierarchy/outfit/job/librarian/journalist
	id_type = /obj/item/card/id/civilian/journalist // CHOMPEdit - Removal of obj/item/weapon

/decl/hierarchy/outfit/job/internal_affairs_agent
	name = OUTFIT_JOB_NAME("Internal affairs agent")
	l_ear = /obj/item/radio/headset/ia // CHOMPEdit - Removal of obj/item/device
	uniform = /obj/item/clothing/under/rank/internalaffairs
	suit = /obj/item/clothing/suit/storage/toggle/internalaffairs
	shoes = /obj/item/clothing/shoes/brown
	glasses = /obj/item/clothing/glasses/sunglasses/big
	l_hand = /obj/item/clipboard // CHOMPEdit - Removal of obj/item/weapon
	id_type = /obj/item/card/id/civilian/internal_affairs // CHOMPEdit - Removal of obj/item/weapon
	pda_type = /obj/item/pda/lawyer // CHOMPEdit - Removal of obj/item/device

/decl/hierarchy/outfit/job/chaplain
	name = OUTFIT_JOB_NAME("Chaplain")
	uniform = /obj/item/clothing/under/rank/chaplain
	l_hand = /obj/item/storage/bible // CHOMPEdit - Removal of obj/item/weapon
	id_type = /obj/item/card/id/civilian/chaplain // CHOMPEdit - Removal of obj/item/weapon
	pda_type = /obj/item/pda/chaplain // CHOMPEdit - Removal of obj/item/device

/decl/hierarchy/outfit/job/explorer
	name = OUTFIT_JOB_NAME("Explorer")
	shoes = /obj/item/clothing/shoes/boots/winter/explorer
	uniform = /obj/item/clothing/under/explorer
	mask = /obj/item/clothing/mask/gas/explorer
	suit = /obj/item/clothing/suit/storage/hooded/explorer
	gloves = /obj/item/clothing/gloves/black
	l_ear = /obj/item/radio/headset // CHOMPEdit - Removal of obj/item/device
	id_slot = slot_wear_id
	id_type = /obj/item/card/id/exploration					//VOREStation Edit // CHOMPEdit - Removal of obj/item/weapon
	pda_slot = slot_belt
	pda_type = /obj/item/pda/cargo // Brown looks more rugged // CHOMPEdit - Removal of obj/item/device
	r_pocket = /obj/item/gps/explorer // CHOMPEdit - Removal of obj/item/device
	id_pda_assignment = "Explorer"
