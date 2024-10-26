/decl/hierarchy/outfit/noncrew
	name = OUTFIT_JOB_NAME(JOB_OUTSIDER)
	//hierarchy_type = /decl/hierarchy/outfit/noncrew
	uniform = /obj/item/clothing/under/primitive
	shoes = /obj/item/clothing/shoes/primitive
	r_pocket = /obj/item/spacecash/ewallet
	l_pocket = /obj/item/survivalcapsule/superpose

	l_ear = /obj/item/radio/headset/outsider

	id_slot = slot_wear_id
	id_type = /obj/item/card/id/external // No access, allows activating PDA's.

	flags = OUTFIT_HAS_BACKPACK|OUTFIT_EXTENDED_SURVIVAL|OUTFIT_COMPREHENSIVE_SURVIVAL

/decl/hierarchy/outfit/noncrew/post_equip(mob/living/carbon/human/H)
	..()
	var/obj/item/spacecash/ewallet/wallet = H.r_store
	if(istype(wallet))
		wallet.owner_name = H.real_name
		wallet.worth = 1000

/decl/hierarchy/outfit/noncrew/spacefarer
	name = OUTFIT_JOB_NAME("Spacefarer")
	uniform = /obj/item/clothing/under/rank/pilot2
	shoes = /obj/item/clothing/shoes/boots/jackboots/
	r_pocket = /obj/item/spacecash/ewallet
	l_pocket = /obj/item/survivalcapsule/superpose/shuttle
	l_hand = /obj/item/tank/jetpack/oxygen //OUTFIT_HAS_JETPACK doesnt seem to work.

	flags = OUTFIT_HAS_BACKPACK|OUTFIT_EXTENDED_SURVIVAL|OUTFIT_COMPREHENSIVE_SURVIVAL

/decl/hierarchy/outfit/shadekin
	name = OUTFIT_JOB_NAME(JOB_ANOMALY)
	//hierarchy_type = /decl/hierarchy/outfit/noncrew
	uniform = /obj/item/clothing/under/primitive
	shoes = /obj/item/clothing/shoes/primitive
	r_pocket = /obj/item/spacecash/ewallet
	l_pocket = /obj/item/survivalcapsule/superpose //Kind of want this removed, but I don't have the energy for this plus other kin change discussion

	id_slot = slot_wear_id
	id_type = /obj/item/card/id/external // No access, allows activating PDA's.

	flags = OUTFIT_HAS_BACKPACK|OUTFIT_EXTENDED_SURVIVAL|OUTFIT_COMPREHENSIVE_SURVIVAL

/decl/hierarchy/outfit/shadekin/post_equip(mob/living/carbon/human/H)
	..()
	var/obj/item/spacecash/ewallet/wallet = H.r_store
	if(istype(wallet))
		wallet.owner_name = H.real_name
		wallet.worth = 1000

/decl/hierarchy/outfit/noncrew/vr_avatar
	pda_slot = null
	id_slot = null
	r_pocket = null
	l_pocket = null
	flags = OUTFIT_HAS_BACKPACK
