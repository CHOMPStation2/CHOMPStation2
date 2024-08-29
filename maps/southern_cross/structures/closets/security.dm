/*
 * SC Security
 */


/obj/structure/closet/secure_closet/hos_wardrobe
	name = "head of security's locker"
	req_access = list(access_hos)
	closet_appearance = /decl/closet_appearance/secure_closet/security/hos

	starts_with = list(
		/obj/item/clothing/head/helmet/HoS,
		/obj/item/clothing/head/helmet/HoS/hat,
		/obj/item/clothing/suit/storage/vest/hos,
		/obj/item/clothing/under/rank/head_of_security/jensen,
		/obj/item/clothing/under/rank/head_of_security/corp,
		/obj/item/clothing/suit/storage/vest/hoscoat/jensen/alt,
		/obj/item/clothing/suit/storage/vest/hoscoat/jensen,
		/obj/item/clothing/suit/storage/vest/hoscoat,
		/obj/item/cartridge/hos, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/clothing/head/helmet/dermal,
		/obj/item/radio/headset/heads/hos, // CHOMPEdit - Removal of obj/item/device
		/obj/item/radio/headset/heads/hos/alt, // CHOMPEdit - Removal of obj/item/device
		/obj/item/clothing/head/beret/sec/corporate/hos,
		/obj/item/clothing/suit/storage/hooded/wintercoat/security/hos,
		/obj/item/clothing/mask/gas/half)

/obj/structure/closet/secure_closet/hos_wardrobe/Initialize()
	if(prob(50))
		starts_with += /obj/item/storage/backpack/security // CHOMPEdit - Removal of obj/item/weapon
	else
		starts_with += /obj/item/storage/backpack/satchel/sec // CHOMPEdit - Removal of obj/item/weapon
	if(prob(50))
		starts_with += /obj/item/storage/backpack/dufflebag/sec // CHOMPEdit - Removal of obj/item/weapon
	return ..()
