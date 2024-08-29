/decl/hierarchy/outfit/job/captain
	name = OUTFIT_JOB_NAME("Captain")
	glasses = /obj/item/clothing/glasses/sunglasses
	uniform = /obj/item/clothing/under/rank/captain
	l_ear = /obj/item/radio/headset/heads/captain // CHOMPEdit - Removal of obj/item/device
	shoes = /obj/item/clothing/shoes/brown
	backpack = /obj/item/storage/backpack/captain // CHOMPEdit - Removal of obj/item/weapon
	satchel_one = /obj/item/storage/backpack/satchel/cap // CHOMPEdit - Removal of obj/item/weapon
	messenger_bag = /obj/item/storage/backpack/messenger/com // CHOMPEdit - Removal of obj/item/weapon
	id_type = /obj/item/card/id/gold/captain // CHOMPFix, captain gets their two gold stripe drip back. // CHOMPEdit - Removal of obj/item/weapon
	pda_type = /obj/item/pda/captain // CHOMPEdit - Removal of obj/item/device

/decl/hierarchy/outfit/job/captain/post_equip(var/mob/living/carbon/human/H)
	..()
	if(H.age>49)
		// Since we can have something other than the default uniform at this
		// point, check if we can actually attach the medal
		var/obj/item/clothing/uniform = H.w_uniform
		if(uniform)
			var/obj/item/clothing/accessory/medal/gold/captain/medal = new()
			if(uniform.can_attach_accessory(medal))
				uniform.attach_accessory(null, medal)
			else
				qdel(medal)

/decl/hierarchy/outfit/job/hop
	name = OUTFIT_JOB_NAME("Head of Personnel")
	uniform = /obj/item/clothing/under/rank/head_of_personnel
	l_ear = /obj/item/radio/headset/heads/hop // CHOMPEdit - Removal of obj/item/device
	shoes = /obj/item/clothing/shoes/brown
	id_type = /obj/item/card/id/silver/hop // CHOMPEdit - Removal of obj/item/weapon
	pda_type = /obj/item/pda/heads/hop // CHOMPEdit - Removal of obj/item/device

/decl/hierarchy/outfit/job/secretary
	name = OUTFIT_JOB_NAME("Command Secretary")
	l_ear = /obj/item/radio/headset/headset_com // CHOMPEdit - Removal of obj/item/device
	shoes = /obj/item/clothing/shoes/brown
	id_type = /obj/item/card/id/silver/secretary // CHOMPEdit - Removal of obj/item/weapon
	pda_type = /obj/item/pda/heads // CHOMPEdit - Removal of obj/item/device
	r_hand = /obj/item/clipboard // CHOMPEdit - Removal of obj/item/weapon

/decl/hierarchy/outfit/job/secretary/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.gender == FEMALE)
		uniform = /obj/item/clothing/under/suit_jacket/female/skirt
	else
		uniform = /obj/item/clothing/under/suit_jacket/charcoal