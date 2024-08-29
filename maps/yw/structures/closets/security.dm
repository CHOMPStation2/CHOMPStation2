/*
 * SC Security
 */


/obj/structure/closet/secure_closet/hos_wardrobe
	name = "head of security's locker"
	closet_appearance = /decl/closet_appearance/secure_closet/security/hos
	req_access = list(access_hos)

	starts_with = list(
		/obj/item/clothing/under/rank/head_of_security/jensen,
		/obj/item/clothing/under/rank/head_of_security/corp,
		/obj/item/clothing/suit/storage/vest/hoscoat/jensen,
		/obj/item/clothing/suit/storage/vest/hoscoat,
		/obj/item/cartridge/hos, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/radio/headset/heads/hos, // CHOMPEdit - Removal of obj/item/device
		/obj/item/clothing/glasses/sunglasses/sechud,
		/obj/item/storage/box/holobadge/hos, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/clothing/accessory/badge/holo/hos,
		/obj/item/clothing/accessory/holster/waist,
		/obj/item/clothing/head/beret/sec/corporate/hos,
		/obj/item/clothing/mask/gas/half)

/obj/structure/closet/secure_closet/hos_wardrobe/Initialize()
	if(prob(50))
		starts_with += /obj/item/storage/backpack/security // CHOMPEdit - Removal of obj/item/weapon
	else
		starts_with += /obj/item/storage/backpack/satchel/sec // CHOMPEdit - Removal of obj/item/weapon
	if(prob(50))
		starts_with += /obj/item/storage/backpack/dufflebag/sec // CHOMPEdit - Removal of obj/item/weapon
	return ..()
