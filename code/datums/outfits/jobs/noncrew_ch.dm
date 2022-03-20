/decl/hierarchy/outfit/job/noncrew
    hierarchy_type = /decl/hierarchy/outfit/job/noncrew
    r_pocket = /obj/item/weapon/spacecash/ewallet

/decl/hierarchy/outfit/job/noncrew/post_equip(mob/living/carbon/human/H)
    ..()
    var/obj/item/weapon/spacecash/ewallet/wallet = H.r_store
    if(istype(wallet))
        wallet.owner_name = H.real_name
        wallet.worth = 1000