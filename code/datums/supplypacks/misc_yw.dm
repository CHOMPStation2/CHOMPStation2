/datum/supply_pack/misc/blueshieldgear
	name = "Blueshield Special Equipment"
	contains = list(
			/obj/item/clothing/head/beret/blueshield = 1,
			/obj/item/clothing/under/yw/blueshield = 1,
			/obj/item/clothing/under/yw/blueshield2 = 1,
			/obj/item/clothing/suit/armor/yw/blueshield = 1,
			/obj/item/clothing/suit/armor/yw/blueshieldcoat = 1,
			/obj/item/clothing/accessory/poncho/roles/cloak/blueshield = 1,
			/obj/item/clothing/accessory/holster/leg = 1
			)
	cost = 80
	containertype = /obj/structure/closet/crate/secure/weapon
	containername = "Blueshield equipment"
	access = access_blueshield_exclusive

/datum/supply_pack/misc/blueshieldweapons
	name = "Blueshield Weapon Kits"
	contains = list(
			/obj/item/gunbox/blueshield = 1,
			/obj/item/gunbox/blueshield/secondary = 1
			)
	cost = 100
	containertype = /obj/structure/closet/crate/secure/weapon
	containername = "Blueshield armaments"
	access = access_blueshield_exclusive

/datum/supply_pack/misc/bluespaceradioyw
	name = "Bluespace Radio Packs"
	contains = list(
				/obj/item/bluespaceradio/cryogaia_prelinked = 2
			)
	cost = 75
	containertype = /obj/structure/closet/crate
	containername = "Bluespace Radio Packs"
