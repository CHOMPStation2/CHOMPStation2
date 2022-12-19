/decl/hierarchy/outfit/noncrew
	name = OUTFIT_JOB_NAME(JOB_OUTSIDER)
	//hierarchy_type = /decl/hierarchy/outfit/noncrew
	uniform = /obj/item/clothing/under/primitive
	shoes = /obj/item/clothing/shoes/primitive
	r_pocket = /obj/item/weapon/spacecash/ewallet
	l_pocket = /obj/item/device/survivalcapsule/superpose

	id_slot = slot_wear_id
	id_type = /obj/item/weapon/card/id/external // No access, allows activating PDA's.

	flags = OUTFIT_HAS_BACKPACK|OUTFIT_EXTENDED_SURVIVAL|OUTFIT_COMPREHENSIVE_SURVIVAL

/decl/hierarchy/outfit/noncrew/post_equip(mob/living/carbon/human/H)
	..()
	var/obj/item/weapon/spacecash/ewallet/wallet = H.r_store
	if(istype(wallet))
		wallet.owner_name = H.real_name
		wallet.worth = 1000
