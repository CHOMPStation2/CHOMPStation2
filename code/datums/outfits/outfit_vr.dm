/decl/hierarchy/outfit/USDF/Marine
	name = "USDF marine"
	uniform = /obj/item/clothing/under/solgov/utility/army/urban
	shoes = /obj/item/clothing/shoes/boots/jackboots
	gloves = /obj/item/clothing/gloves/combat
	l_ear = /obj/item/radio/headset/centcom // CHOMPEdit - Removal of obj/item/device
	r_pocket = /obj/item/ammo_magazine/m95
	l_pocket = /obj/item/ammo_magazine/m95
	l_hand = /obj/item/ammo_magazine/m95
	r_hand = /obj/item/ammo_magazine/m95
	back = /obj/item/gun/projectile/automatic/battlerifle // CHOMPEdit - Removal of obj/item/weapon
	backpack_contents = list(/obj/item/storage/box = 1) // CHOMPEdit - Removal of obj/item/weapon
	hierarchy_type = /decl/hierarchy/outfit/wizard
	head = /obj/item/clothing/head/helmet/combat/USDF
	suit = /obj/item/clothing/suit/armor/combat/USDF
	belt = /obj/item/storage/belt/security/tactical // CHOMPEdit - Removal of obj/item/weapon

/decl/hierarchy/outfit/USDF/Marine/equip_id(mob/living/carbon/human/H)
	var/obj/item/card/id/C = ..() // CHOMPEdit - Removal of obj/item/weapon
	C.name = "[H.real_name]'s military ID Card"
	C.icon_state = "lifetime"
	C.access = get_all_station_access()
	C.access += get_all_centcom_access()
	C.assignment = "USDF"
	C.registered_name = H.real_name
	return C

/decl/hierarchy/outfit/USDF/Officer
	name = "USDF officer"
	head = /obj/item/clothing/head/dress/army/command
	shoes = /obj/item/clothing/shoes/boots/jackboots
	l_ear = /obj/item/radio/headset/centcom // CHOMPEdit - Removal of obj/item/device
	uniform = /obj/item/clothing/under/solgov/mildress/army/command
	back = /obj/item/storage/backpack/satchel // CHOMPEdit - Removal of obj/item/weapon
	belt = /obj/item/gun/projectile/revolver/consul // CHOMPEdit - Removal of obj/item/weapon
	l_pocket = /obj/item/ammo_magazine/s44
	r_pocket = /obj/item/ammo_magazine/s44
	r_hand = /obj/item/clothing/accessory/holster/hip
	l_hand = /obj/item/clothing/accessory/tie/black

/decl/hierarchy/outfit/USDF/Officer/equip_id(mob/living/carbon/human/H)
	var/obj/item/card/id/C = ..() // CHOMPEdit - Removal of obj/item/weapon
	C.name = "[H.real_name]'s military ID Card"
	C.icon_state = "lifetime"
	C.access = get_all_station_access()
	C.access += get_all_centcom_access()
	C.assignment = "USDF"
	C.registered_name = H.real_name
	return C

/decl/hierarchy/outfit/solcom/representative
	name = "SolGov Representative" //YW EDIT: SolGov
	shoes = /obj/item/clothing/shoes/laceup
	l_ear = /obj/item/radio/headset/centcom // CHOMPEdit - Removal of obj/item/device
	uniform = /obj/item/clothing/under/suit_jacket/navy
	back = /obj/item/storage/backpack/satchel // CHOMPEdit - Removal of obj/item/weapon
	l_pocket = /obj/item/pen/blue // CHOMPEdit - Removal of obj/item/weapon
	r_pocket = /obj/item/pen/red // CHOMPEdit - Removal of obj/item/weapon
	r_hand = /obj/item/pda/centcom // CHOMPEdit - Removal of obj/item/device
	l_hand = /obj/item/clipboard // CHOMPEdit - Removal of obj/item/weapon

/decl/hierarchy/outfit/solcom/representative/equip_id(mob/living/carbon/human/H)
	var/obj/item/card/id/C = ..() // CHOMPEdit - Removal of obj/item/weapon
	C.name = "[H.real_name]'s SolGov ID Card" //YW EDIT: SolGov
	C.icon_state = "lifetime"
	C.access = get_all_station_access()
	C.access += get_all_centcom_access()
	C.assignment = "SolGov Representative" //YW EDIT: SolGov
	C.registered_name = H.real_name
	return C

/decl/hierarchy/outfit/imperial/soldier
	name = "Imperial soldier"
	head = /obj/item/clothing/head/helmet/combat/imperial
	shoes =/obj/item/clothing/shoes/leg_guard/combat/imperial
	gloves = /obj/item/clothing/gloves/arm_guard/combat/imperial
	l_ear = /obj/item/radio/headset/syndicate // CHOMPEdit - Removal of obj/item/device
	uniform = /obj/item/clothing/under/imperial
	mask = /obj/item/clothing/mask/gas/imperial
	suit = /obj/item/clothing/suit/armor/combat/imperial
	back = /obj/item/storage/backpack/satchel // CHOMPEdit - Removal of obj/item/weapon
	belt = /obj/item/storage/belt/security/tactical/bandolier // CHOMPEdit - Removal of obj/item/weapon
	l_pocket = /obj/item/cell/device/weapon // CHOMPEdit - Removal of obj/item/weapon
	r_pocket = /obj/item/cell/device/weapon // CHOMPEdit - Removal of obj/item/weapon
	r_hand = /obj/item/melee/energy/sword/imperial // CHOMPEdit - Removal of obj/item/weapon
	l_hand = /obj/item/shield/energy/imperial // CHOMPEdit - Removal of obj/item/weapon
	suit_store = /obj/item/gun/energy/imperial // CHOMPEdit - Removal of obj/item/weapon

/decl/hierarchy/outfit/imperial/officer
	name = "Imperial officer"
	head = /obj/item/clothing/head/helmet/combat/imperial/centurion
	shoes = /obj/item/clothing/shoes/leg_guard/combat/imperial
	gloves = /obj/item/clothing/gloves/arm_guard/combat/imperial
	l_ear = /obj/item/radio/headset/syndicate // CHOMPEdit - Removal of obj/item/device
	uniform = /obj/item/clothing/under/imperial
	mask = /obj/item/clothing/mask/gas/imperial
	suit = /obj/item/clothing/suit/armor/combat/imperial/centurion
	belt = /obj/item/storage/belt/security/tactical/bandolier // CHOMPEdit - Removal of obj/item/weapon
	l_pocket = /obj/item/cell/device/weapon // CHOMPEdit - Removal of obj/item/weapon
	r_pocket = /obj/item/cell/device/weapon // CHOMPEdit - Removal of obj/item/weapon
	r_hand = /obj/item/melee/energy/sword/imperial // CHOMPEdit - Removal of obj/item/weapon
	l_hand = /obj/item/shield/energy/imperial // CHOMPEdit - Removal of obj/item/weapon
	suit_store = /obj/item/gun/energy/imperial // CHOMPEdit - Removal of obj/item/weapon

/*
SOUTHERN CROSS OUTFITS
Keep outfits simple. Spawn with basic uniforms and minimal gear. Gear instead goes in lockers. Keep this in mind if editing.
*/


/decl/hierarchy/outfit/job/explorer2
	name = OUTFIT_JOB_NAME("Explorer")
	shoes = /obj/item/clothing/shoes/boots/winter/explorer
	uniform = /obj/item/clothing/under/explorer
	l_ear = /obj/item/radio/headset/explorer // CHOMPEdit - Removal of obj/item/device
	id_slot = slot_wear_id
	pda_slot = slot_l_store
	pda_type = /obj/item/pda/explorer // CHOMPEdit - Removal of obj/item/device
	id_type = /obj/item/card/id/exploration // CHOMPEdit - Removal of obj/item/weapon
	id_pda_assignment = "Explorer"
	backpack = /obj/item/storage/backpack/explorer // CHOMPEdit - Removal of obj/item/weapon
	satchel_one = /obj/item/storage/backpack/satchel/explorer // CHOMPEdit - Removal of obj/item/weapon
	messenger_bag = /obj/item/storage/backpack/messenger/explorer // CHOMPEdit - Removal of obj/item/weapon
	flags = OUTFIT_HAS_BACKPACK|OUTFIT_COMPREHENSIVE_SURVIVAL

/decl/hierarchy/outfit/job/pilot
	name = OUTFIT_JOB_NAME("Pilot")
	shoes = /obj/item/clothing/shoes/black
	uniform = /obj/item/clothing/under/rank/pilot1/no_webbing
	suit = /obj/item/clothing/suit/storage/toggle/bomber/pilot
	gloves = /obj/item/clothing/gloves/fingerless
	glasses = /obj/item/clothing/glasses/fakesunglasses/aviator
	l_ear = /obj/item/radio/headset/pilot/alt // CHOMPEdit - Removal of obj/item/device
	uniform_accessories = list(/obj/item/clothing/accessory/storage/webbing/pilot1 = 1)
	id_slot = slot_wear_id
	pda_slot = slot_belt
	pda_type = /obj/item/pda/pilot // CHOMPEdit - Removal of obj/item/device
	id_type = /obj/item/card/id/civilian/pilot // CHOMPEdit - Removal of obj/item/weapon
	id_pda_assignment = "Pilot"
	flags = OUTFIT_HAS_BACKPACK|OUTFIT_COMPREHENSIVE_SURVIVAL

/decl/hierarchy/outfit/job/medical/sar
	name = OUTFIT_JOB_NAME("Field Medic")
	uniform = /obj/item/clothing/under/utility/blue
	//suit = /obj/item/clothing/suit/storage/hooded/wintercoat/medical/sar
	shoes = /obj/item/clothing/shoes/boots/winter/explorer
	l_ear = /obj/item/radio/headset/sar // CHOMPEdit - Removal of obj/item/device
	l_hand = /obj/item/storage/firstaid/regular // CHOMPEdit - Removal of obj/item/weapon
	belt = /obj/item/storage/belt/medical/emt // CHOMPEdit - Removal of obj/item/weapon
	pda_slot = slot_l_store
	pda_type = /obj/item/pda/sar // CHOMPEdit - Removal of obj/item/device
	id_type = /obj/item/card/id/exploration/fm // CHOMPEdit - Removal of obj/item/weapon
	id_pda_assignment = "Field Medic"
	backpack = /obj/item/storage/backpack/explorer // CHOMPEdit - Removal of obj/item/weapon
	satchel_one = /obj/item/storage/backpack/satchel/explorer // CHOMPEdit - Removal of obj/item/weapon
	messenger_bag = /obj/item/storage/backpack/messenger/explorer // CHOMPEdit - Removal of obj/item/weapon
	flags = OUTFIT_HAS_BACKPACK|OUTFIT_EXTENDED_SURVIVAL|OUTFIT_COMPREHENSIVE_SURVIVAL

/decl/hierarchy/outfit/job/pathfinder
	name = OUTFIT_JOB_NAME("Pathfinder")
	shoes = /obj/item/clothing/shoes/boots/winter/explorer
	uniform = /obj/item/clothing/under/explorer //TODO: Uniforms.
	l_ear = /obj/item/radio/headset/pathfinder // CHOMPEdit - Removal of obj/item/device
	id_slot = slot_wear_id
	pda_slot = slot_l_store
	pda_type = /obj/item/pda/pathfinder // CHOMPEdit - Removal of obj/item/device
	id_type = /obj/item/card/id/exploration/head // CHOMPEdit - Removal of obj/item/weapon
	id_pda_assignment = "Pathfinder"
	backpack = /obj/item/storage/backpack/explorer //CHOMPADD // CHOMPEdit - Removal of obj/item/weapon
	satchel_one = /obj/item/storage/backpack/satchel/explorer //CHOMPADD // CHOMPEdit - Removal of obj/item/weapon
	messenger_bag = /obj/item/storage/backpack/messenger/explorer //CHOMPADD // CHOMPEdit - Removal of obj/item/weapon
	flags = OUTFIT_HAS_BACKPACK|OUTFIT_EXTENDED_SURVIVAL|OUTFIT_COMPREHENSIVE_SURVIVAL

/decl/hierarchy/outfit/job/assistant/explorer
	id_type = /obj/item/card/id/exploration // CHOMPEdit - Removal of obj/item/weapon
	flags = OUTFIT_HAS_BACKPACK|OUTFIT_COMPREHENSIVE_SURVIVAL
