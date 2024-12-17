/decl/hierarchy/outfit/standard_space_gear
	name = "Standard space gear"
	shoes = /obj/item/clothing/shoes/black
	head = /obj/item/clothing/head/helmet/space
	suit = /obj/item/clothing/suit/space
	uniform = /obj/item/clothing/under/color/grey
	back = /obj/item/tank/jetpack/oxygen
	mask = /obj/item/clothing/mask/breath
	flags = OUTFIT_HAS_JETPACK

/decl/hierarchy/outfit/emergency_space_gear
	name = "Emergency space gear"
	shoes = /obj/item/clothing/shoes/black
	head = /obj/item/clothing/head/helmet/space/emergency
	suit = /obj/item/clothing/suit/space/emergency
	uniform = /obj/item/clothing/under/color/grey
	back = /obj/item/tank/oxygen
	mask = /obj/item/clothing/mask/breath

/decl/hierarchy/outfit/soviet_soldier
	name = "Soviet soldier"
	uniform = /obj/item/clothing/under/soviet
	shoes = /obj/item/clothing/shoes/boots/combat
	head = /obj/item/clothing/head/ushanka/soviet
	gloves = /obj/item/clothing/gloves/combat
	back = /obj/item/storage/backpack/satchel
	belt = /obj/item/gun/projectile/revolver/mateba

/decl/hierarchy/outfit/soviet_soldier/admiral
	name = "Soviet admiral"
	head = /obj/item/clothing/head/hgpiratecap
	glasses = /obj/item/clothing/glasses/thermal/plain/eyepatch
	suit = /obj/item/clothing/suit/hgpirate

	id_slot = slot_wear_id
	id_type = /obj/item/card/id/centcom	//station
	id_pda_assignment = "Admiral"

	headset = /obj/item/radio/headset/heads/captain
	headset_alt = /obj/item/radio/headset/heads/captain
	headset_earbud = /obj/item/radio/headset/heads/captain

/decl/hierarchy/outfit/merchant
	name = "Merchant"
	shoes = /obj/item/clothing/shoes/black
	uniform = /obj/item/clothing/under/color/grey
	id_slot = slot_wear_id
	id_type = /obj/item/card/id/civilian	//merchant
	pda_slot = slot_r_store
	pda_type = /obj/item/pda/chef //cause I like the look
	id_pda_assignment = "Merchant"

	headset = /obj/item/radio/headset
	headset_alt = /obj/item/radio/headset
	headset_earbud = /obj/item/radio/headset

/decl/hierarchy/outfit/merchant/vox
	name = "Merchant - Vox"
	shoes = /obj/item/clothing/shoes/boots/jackboots/toeless
	uniform = /obj/item/clothing/under/vox/vox_robes
	suit = /obj/item/clothing/suit/armor/vox_scrap

/decl/hierarchy/outfit/zaddat
	name = "Zaddat Suit"
	suit = /obj/item/clothing/suit/space/void/zaddat/
	mask = /obj/item/clothing/mask/gas/zaddat

/decl/hierarchy/outfit/maint_lurker
	name = "Maintenance Lurker Outfit"
	id_slot = slot_wear_id
	id_type = /obj/item/card/id/civilian/lurker
	pda_slot = slot_belt
	pda_type = /obj/item/pda
	id_pda_assignment = "NO DATA"

	headset = /obj/item/radio/headset
	headset_alt = /obj/item/radio/headset/alt
	headset_earbud = /obj/item/radio/headset/earbud

	flags = OUTFIT_HAS_BACKPACK
	backpack = /obj/item/storage/backpack
	satchel_one  = /obj/item/storage/backpack/satchel/norm
	satchel_two  = /obj/item/storage/backpack/satchel
	messenger_bag = /obj/item/storage/backpack/messenger
	sports_bag = /obj/item/storage/backpack/sport
	satchel_three = /obj/item/storage/backpack/satchel/strapless

	backpack_contents = list(/obj/item/spacecash/c200 = 1)

/decl/hierarchy/outfit/maint_lurker/post_equip(var/mob/living/carbon/human/H)
	..()
	if(H.backbag == 1)
		H.equip_to_slot_or_del(new /obj/item/spacecash/c200(H), slot_l_hand)
