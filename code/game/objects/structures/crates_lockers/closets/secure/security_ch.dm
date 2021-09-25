// I don't know why COMMAND's lockers are in security.dm, but whatever.
/obj/structure/closet/secure_closet/blueshield
	name = "blueshield's closet"
	req_access = list(access_blueshield_exclusive)
	closet_appearance = /decl/closet_appearance/secure_closet/blueshield
	storage_capacity = 2.5 * MOB_MEDIUM

	starts_with = list(
		/obj/item/weapon/storage/briefcase,
		/obj/item/weapon/storage/firstaid/adv,
		/obj/item/weapon/storage/belt/security,
		/obj/item/weapon/grenade/flashbang,
		/obj/item/device/flash,
		/obj/item/weapon/reagent_containers/spray/pepper,
		/obj/item/weapon/handcuffs,
		/obj/item/weapon/melee/baton/loaded,
		/obj/item/clothing/glasses/sunglasses,
		/obj/item/clothing/glasses/sunglasses/medhud,
		/obj/item/clothing/head/beret/blueshield,
		/obj/item/clothing/head/helmet/dermal,
		/obj/item/clothing/under/yw/blueshield,
		/obj/item/clothing/under/yw/blueshield2,
		/obj/item/clothing/suit/armor/yw/blueshield,
		/obj/item/clothing/suit/armor/yw/blueshieldcoat,
		/obj/item/clothing/accessory/poncho/roles/cloak/blueshield,
		/obj/item/clothing/shoes/laceup,
		/obj/item/clothing/accessory/holster/leg,
		/obj/item/clothing/shoes/boots/jackboots,
		/obj/item/clothing/shoes/boots/jackboots/toeless,
		/obj/item/gunbox/blueshield,
		/obj/item/gunbox/blueshield/secondary
		)