/obj/structure/closet/secure_closet/blueshield
	name = "blueshield's closet"
	req_access = list(access_blueshield_exclusive)
	closet_appearance = /decl/closet_appearance/secure_closet/blueshield
	storage_capacity = 2.5 * MOB_MEDIUM

	starts_with = list(
		/obj/item/storage/briefcase,
		/obj/item/storage/firstaid/adv,
		/obj/item/storage/belt/security,
		/obj/item/grenade/flashbang,
		/obj/item/flash,
		/obj/item/reagent_containers/spray/pepper,
		/obj/item/handcuffs,
		/obj/item/melee/baton/loaded,
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

/obj/structure/closet/secure_closet/security_pilot
	name = "security pilot's locker"
	req_access = list(access_secpilot)
	closet_appearance = /decl/closet_appearance/secure_closet/security_pilot
	storage_capacity = 2.5 * MOB_MEDIUM

	starts_with = list(
		/obj/item/storage/backpack/parachute,
		/obj/item/material/knife/tacknife/survival,
		/obj/item/clothing/head/pilot/alt,
		/obj/item/clothing/mask/gas/half,
		/obj/item/clothing/suit/storage/toggle/yw/secjacket,
		/obj/item/clothing/under/rank/khi/sec/pilot,
		/obj/item/clothing/gloves/fingerless,
		/obj/item/cartridge/security,
		/obj/item/radio/headset/headset_sec/alt,
		/obj/item/storage/belt/security,
		/obj/item/clothing/glasses/sunglasses/sechud,
		/obj/item/storage/box/flare,
		/obj/item/clothing/accessory/storage/webbing/combatpilot,
		/obj/item/reagent_containers/food/snacks/liquidfood,
		/obj/item/reagent_containers/food/drinks/cans/waterbottle,
		/obj/item/clothing/head/soft/sec/corp,
		/obj/item/clothing/accessory/holster/armpit,
		/obj/item/gun/energy/taser,
		/obj/item/melee/baton/loaded,
		/obj/item/cell/device/weapon,
		/obj/item/flashlight/maglight,
		/obj/item/radio
		)

/obj/structure/closet/secure_closet/personal/volunteer
	closet_appearance = /decl/closet_appearance/cabinet/secure

	starts_with = list(
		/obj/item/radio/off,
		/obj/item/gps
		)