/decl/hierarchy/outfit/noncrew
	name = OUTFIT_JOB_NAME("Non-Crew")
	//hierarchy_type = /decl/hierarchy/outfit/noncrew
	r_pocket = /obj/item/weapon/spacecash/ewallet
	flags = OUTFIT_HAS_BACKPACK|OUTFIT_EXTENDED_SURVIVAL|OUTFIT_COMPREHENSIVE_SURVIVAL

/decl/hierarchy/outfit/noncrew/post_equip(mob/living/carbon/human/H)
	..()
	var/obj/item/weapon/spacecash/ewallet/wallet = H.r_store
	if(istype(wallet))
		wallet.owner_name = H.real_name
		wallet.worth = 1000
