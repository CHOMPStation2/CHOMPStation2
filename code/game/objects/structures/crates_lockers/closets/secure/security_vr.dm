/obj/structure/closet/secure_closet/hos
	name = "head of security's attire"
	req_access = list(access_hos)
	closet_appearance = /decl/closet_appearance/secure_closet/security/hos
	storage_capacity = 2.5 * MOB_MEDIUM

	starts_with = list(
		/obj/item/clothing/head/helmet/HoS,
		/obj/item/clothing/head/helmet/HoS/hat,
		/obj/item/clothing/suit/storage/vest/hos,
		/obj/item/clothing/under/rank/head_of_security/jensen,
		/obj/item/clothing/under/rank/head_of_security/corp,
		/obj/item/clothing/suit/storage/vest/hoscoat/jensen/alt,
		/obj/item/clothing/suit/storage/vest/hoscoat/jensen,
		/obj/item/clothing/suit/storage/vest/hoscoat,
		/obj/item/clothing/under/rank/neo_hos_red,
		/obj/item/clothing/under/rank/neo_hos_red_skirt,
		/obj/item/clothing/under/rank/neo_hos_blackred,
		/obj/item/clothing/under/rank/neo_hos_blackred_skirt,
		/obj/item/clothing/under/rank/neo_hos_parade,
		/obj/item/clothing/under/rank/neo_hos_parade_fem,
		/obj/item/clothing/under/rank/neo_hos_blue,
		/obj/item/clothing/under/rank/neo_hos_blackblue,
		/obj/item/clothing/under/rank/neo_hos_blackblue_skirt,
		/obj/item/clothing/under/rank/neo_hos_parade_blue,
		/obj/item/clothing/under/rank/neo_hos_parade_blue_fem,
		/obj/item/clothing/under/rank/neo_hos_gorka,
		/obj/item/clothing/suit/storage/toggle/labcoat/neo_hos_parade,
		/obj/item/clothing/suit/storage/toggle/labcoat/neo_hosformal_blue,
		/obj/item/clothing/suit/storage/vest/wardencoat/neo_armsco_trench,
		/obj/item/clothing/head/helmet/HoS/hat/blue,
		/obj/item/clothing/head/helmet/dermal,
		/obj/item/radio/headset/heads/hos, // CHOMPEdit - Removal of obj/item/device
		/obj/item/radio/headset/heads/hos/alt, // CHOMPEdit - Removal of obj/item/device
		/obj/item/clothing/glasses/sunglasses/sechud,
		/obj/item/storage/belt/security, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/clothing/accessory/holster/waist,
		/obj/item/clothing/head/beret/sec/corporate/hos,
//		/obj/item/clothing/suit/storage/hooded/wintercoat/security, //CHOMP Remove
		/obj/item/clothing/suit/storage/hooded/wintercoat/security/hos,
		/obj/item/clothing/shoes/boots/winter/security,
//CHOMP Add ^
		/obj/item/clothing/mask/gas/half, // CHOMPADD
		/obj/item/clothing/mask/gas/sechailer/swat/hos) // CHOMPADD

/obj/structure/closet/secure_closet/hos2
	name = "head of security's gear"
	req_access = list(access_hos)
	closet_appearance = /decl/closet_appearance/secure_closet/security/hos
	storage_capacity = 2.5 * MOB_MEDIUM

	starts_with = list(
		/obj/item/cartridge/hos, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/taperoll/police,
		/obj/item/shield/riot/tele, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/box/holobadge/hos, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/clothing/accessory/badge/holo/hos,
		/obj/item/reagent_containers/spray/pepper, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/tool/crowbar/red, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/box/flashbangs, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/flash, // CHOMPEdit - Removal of obj/item/device
		/obj/item/melee/baton/loaded, // CHOMPEdit - Removal of obj/item/weapon
//		/obj/item/storage/secure/briefcase/nsfw_pack_hos, // CHOMPEdit - Removal of obj/item/weapon
//YW Removal,
		/obj/item/gun/projectile/caseless/prototype/loaded, // CHOMPADD // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/ammo_magazine/m5mmcaseless, // CHOMPADD
		/obj/item/gun/energy/x01, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/cell/device/weapon, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/melee/telebaton, // CHOMPEdit - Removal of obj/item/weapon
//		/obj/item/clothing/head/beret/sec/corporate/hos, //CHOMP Remove
//		/obj/item/clothing/suit/storage/hooded/wintercoat/security, //CHOMP Remove
//		/obj/item/clothing/shoes/boots/winter/security, //CHOMP Remove
		/obj/item/ticket_printer, //CHOMP Add // CHOMPEdit - Removal of obj/item/device
		/obj/item/gun/energy/taser, // CHOMPADD // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/flashlight/maglight) // CHOMPEdit - Removal of obj/item/device

//Custom NT Security Lockers, Only found at central command
/obj/structure/closet/secure_closet/nanotrasen_security
	name = "NanoTrasen security officer's locker"
	req_access = list(access_brig)
	closet_appearance = /decl/closet_appearance/secure_closet/nanotrasen/security
	storage_capacity = 3.5 * MOB_MEDIUM

	starts_with = list(
		/obj/item/clothing/suit/storage/vest/nanotrasen,
		/obj/item/clothing/head/helmet,
		/obj/item/cartridge/security, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/radio/headset/headset_sec, // CHOMPEdit - Removal of obj/item/device
		/obj/item/radio/headset/headset_sec/alt, // CHOMPEdit - Removal of obj/item/device
		/obj/item/storage/belt/security, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/flash, // CHOMPEdit - Removal of obj/item/device
		/obj/item/reagent_containers/spray/pepper, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/grenade/flashbang, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/melee/baton/loaded, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/clothing/glasses/sunglasses/sechud,
		/obj/item/taperoll/police,
		/obj/item/hailer, // CHOMPEdit - Removal of obj/item/device
		/obj/item/flashlight/flare, // CHOMPEdit - Removal of obj/item/device
		/obj/item/clothing/accessory/storage/black_vest,
		/obj/item/gun/energy/taser, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/cell/device/weapon, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/flashlight/maglight, // CHOMPEdit - Removal of obj/item/device
		/obj/item/clothing/head/soft/nanotrasen,
		/obj/item/clothing/head/beret/nanotrasen,
		/obj/item/clothing/under/nanotrasen/security,
		/obj/item/clothing/gloves/black,
		/obj/item/clothing/shoes/boots/jackboots,
		/obj/item/clothing/shoes/boots/jackboots/toeless)

/obj/structure/closet/secure_closet/nanotrasen_security/Initialize()
	if(prob(25))
		starts_with += /obj/item/storage/backpack/security // CHOMPEdit - Removal of obj/item/weapon
	else
		starts_with += /obj/item/storage/backpack/satchel/sec // CHOMPEdit - Removal of obj/item/weapon
	if(prob(75))
		starts_with += /obj/item/storage/backpack/dufflebag/sec // CHOMPEdit - Removal of obj/item/weapon
	return ..()

/obj/structure/closet/secure_closet/nanotrasen_commander
	name = "NanoTrasen commander's locker"
	req_access = list(access_brig)
	closet_appearance = /decl/closet_appearance/secure_closet/nanotrasen/commander
	storage_capacity = 3.5 * MOB_MEDIUM

	starts_with = list(
		/obj/item/clothing/head/helmet/HoS,
		/obj/item/clothing/suit/storage/vest/hos,
		/obj/item/clothing/under/rank/head_of_security/jensen,
		/obj/item/clothing/suit/storage/vest/hoscoat/jensen/alt,
		/obj/item/clothing/suit/storage/vest/hoscoat/jensen,
		/obj/item/clothing/suit/storage/vest/hoscoat,
		/obj/item/clothing/head/helmet/dermal,
		/obj/item/cartridge/hos, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/radio/headset/heads/hos, // CHOMPEdit - Removal of obj/item/device
		/obj/item/radio/headset/heads/hos/alt, // CHOMPEdit - Removal of obj/item/device
		/obj/item/clothing/glasses/sunglasses/sechud,
		/obj/item/taperoll/police,
		/obj/item/shield/riot, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/shield/riot/tele, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/box/holobadge/hos, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/clothing/accessory/badge/holo/hos,
		/obj/item/reagent_containers/spray/pepper, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/tool/crowbar/red, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/box/flashbangs, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/belt/security, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/flash, // CHOMPEdit - Removal of obj/item/device
		/obj/item/melee/baton/loaded, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/gun/energy/gun, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/cell/device/weapon, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/clothing/accessory/holster/waist,
		/obj/item/melee/telebaton, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/clothing/head/beret/sec/corporate/hos,
		/obj/item/flashlight/maglight, // CHOMPEdit - Removal of obj/item/device
		/obj/item/clothing/gloves/black,
		/obj/item/clothing/shoes/boots/jackboots,
		/obj/item/clothing/shoes/boots/jackboots/toeless,
		/obj/item/clothing/under/nanotrasen/security/commander)

/obj/structure/closet/secure_closet/nanotrasen_commander/Initialize()
	if(prob(25))
		starts_with += /obj/item/storage/backpack/security // CHOMPEdit - Removal of obj/item/weapon
	else
		starts_with += /obj/item/storage/backpack/satchel/sec // CHOMPEdit - Removal of obj/item/weapon
	if(prob(75))
		starts_with += /obj/item/storage/backpack/dufflebag/sec // CHOMPEdit - Removal of obj/item/weapon
	return ..()

/obj/structure/closet/secure_closet/nanotrasen_warden
	name = "NanoTrasen warden's locker"
	req_access = list(access_brig)
	closet_appearance = /decl/closet_appearance/secure_closet/nanotrasen/warden
	storage_capacity = 3.5 * MOB_MEDIUM

	starts_with = list(
		/obj/item/clothing/suit/storage/vest/warden,
		/obj/item/clothing/under/nanotrasen/security/warden,
		/obj/item/clothing/suit/storage/vest/wardencoat/alt,
		/obj/item/clothing/suit/storage/vest/wardencoat/alt2,
		/obj/item/clothing/head/helmet/warden,
		/obj/item/cartridge/security, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/radio/headset/headset_sec, // CHOMPEdit - Removal of obj/item/device
		/obj/item/radio/headset/headset_sec/alt, // CHOMPEdit - Removal of obj/item/device
		/obj/item/clothing/glasses/sunglasses/sechud,
		/obj/item/taperoll/police,
		/obj/item/clothing/accessory/badge/holo/warden,
		/obj/item/storage/box/flashbangs, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/belt/security, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/spray/pepper, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/melee/baton/loaded, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/gun/energy/gun, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/cell/device/weapon, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/box/holobadge, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/clothing/head/beret/sec/corporate/warden,
		/obj/item/flashlight/maglight, // CHOMPEdit - Removal of obj/item/device
		/obj/item/megaphone, // CHOMPEdit - Removal of obj/item/device
		/obj/item/clothing/gloves/black,
		/obj/item/clothing/shoes/boots/jackboots,
		/obj/item/clothing/shoes/boots/jackboots/toeless)

/obj/structure/closet/secure_closet/nanotrasen_warden/Initialize()
	if(prob(25))
		new /obj/item/storage/backpack/security(src) // CHOMPEdit - Removal of obj/item/weapon
	else
		new /obj/item/storage/backpack/satchel/sec(src) // CHOMPEdit - Removal of obj/item/weapon
	if(prob(75))
		new /obj/item/storage/backpack/dufflebag/sec(src) // CHOMPEdit - Removal of obj/item/weapon
	return ..()

/obj/structure/closet/secure_closet/captains
	starts_with = list(
		/obj/item/storage/backpack/dufflebag/captain, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/clothing/head/helmet,
		/obj/item/clothing/suit/storage/vest,
		/obj/item/cartridge/captain, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/lockbox/medal, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/radio/headset/heads/captain, // CHOMPEdit - Removal of obj/item/device
		/obj/item/radio/headset/heads/captain/alt, // CHOMPEdit - Removal of obj/item/device
		/obj/item/gunbox/captain,
		/obj/item/melee/telebaton, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/flash, // CHOMPEdit - Removal of obj/item/device
		/obj/item/storage/box/ids, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/melee/rapier, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/clothing/accessory/holster/machete/rapier)
