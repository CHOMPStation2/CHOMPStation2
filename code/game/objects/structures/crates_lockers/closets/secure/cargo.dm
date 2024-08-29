/obj/structure/closet/secure_closet/cargotech
	name = "cargo technician's locker"
	req_access = list(access_cargo)
	closet_appearance = /decl/closet_appearance/secure_closet/cargo

	starts_with = list(
		/obj/item/clothing/under/rank/cargotech,
		/obj/item/clothing/under/rank/cargotech/skirt,
		/obj/item/clothing/under/rank/cargotech/jeans,
		/obj/item/clothing/under/rank/cargotech/jeans/female,
		/obj/item/clothing/suit/storage/hooded/wintercoat/cargo,
		/obj/item/clothing/shoes/boots/winter/supply,
		/obj/item/clothing/shoes/black,
		/obj/item/radio/headset/headset_cargo, // CHOMPEdit - Removal of obj/item/device
		/obj/item/radio/headset/headset_cargo/alt, // CHOMPEdit - Removal of obj/item/device
		/obj/item/clothing/gloves/black,
		/obj/item/clothing/gloves/fingerless,
		/obj/item/clothing/head/soft)

/obj/structure/closet/secure_closet/cargotech/Initialize()
	if(prob(75))
		starts_with += /obj/item/storage/backpack // CHOMPEdit - Removal of obj/item/weapon
	else
		starts_with += /obj/item/storage/backpack/satchel/norm // CHOMPEdit - Removal of obj/item/weapon
	if(prob(25))
		starts_with += /obj/item/storage/backpack/dufflebag // CHOMPEdit - Removal of obj/item/weapon
	return ..()

/obj/structure/closet/secure_closet/quartermaster
	name = "quartermaster's locker"
	req_access = list(access_qm)
	closet_appearance = /decl/closet_appearance/secure_closet/cargo/qm

	starts_with = list(
		/obj/item/clothing/under/rank/cargo,
		/obj/item/clothing/under/rank/cargo/skirt,
		/obj/item/clothing/under/rank/cargo/jeans,
		/obj/item/clothing/under/rank/cargo/jeans/female,
		/obj/item/clothing/shoes/brown,
		/obj/item/radio/headset/headset_qm, //VOREStation Edit, // CHOMPEdit - Removal of obj/item/device
		/obj/item/radio/headset/headset_qm/alt, //VOREStation Edit, // CHOMPEdit - Removal of obj/item/device
		/obj/item/clothing/under/rank/neo_qm,
		/obj/item/clothing/under/rank/neo_qm_skirt,
		/obj/item/clothing/under/rank/neo_qm_jacket,
		/obj/item/clothing/under/rank/neo_qm_white,
		/obj/item/clothing/under/rank/neo_qm_white_skirt,
		/obj/item/clothing/under/rank/neo_qm_turtle,
		/obj/item/clothing/under/rank/neo_qm_turtle_skirt,
		/obj/item/clothing/under/rank/neo_qm_gorka,
		/obj/item/clothing/gloves/black,
		/obj/item/clothing/gloves/fingerless,
		/obj/item/tank/emergency/oxygen, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/clothing/mask/gas,
		/obj/item/clothing/glasses/meson,
		/obj/item/clothing/head/soft,
		/obj/item/clothing/suit/storage/hooded/wintercoat/cargo,
		/obj/item/clothing/suit/storage/hooded/wintercoat/cargo/qm,
		/obj/item/clothing/head/beret/qm,
		/obj/item/clothing/shoes/boots/winter/supply)

/obj/structure/closet/secure_closet/quartermaster/Initialize()
	if(prob(75))
		starts_with += /obj/item/storage/backpack // CHOMPEdit - Removal of obj/item/weapon
	else
		starts_with += /obj/item/storage/backpack/satchel/norm // CHOMPEdit - Removal of obj/item/weapon
	if(prob(25))
		starts_with += /obj/item/storage/backpack/dufflebag // CHOMPEdit - Removal of obj/item/weapon
	return ..()

/obj/structure/closet/secure_closet/miner
	name = "miner's equipment"
	req_access = list(access_mining)
	closet_appearance = /decl/closet_appearance/secure_closet/mining

	starts_with = list(
		/obj/item/radio/headset/headset_mine, // CHOMPEdit - Removal of obj/item/device
		/obj/item/clothing/under/rank/miner,
		/obj/item/clothing/gloves/black,
		/obj/item/clothing/shoes/black,
		/obj/item/analyzer, // CHOMPEdit - Removal of obj/item/device
		/obj/item/storage/bag/ore, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/belt/miner, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/flashlight/lantern, // CHOMPEdit - Removal of obj/item/device
		/obj/item/shovel, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/pickaxe/drill, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/clothing/glasses/material,
		/obj/item/clothing/suit/storage/hooded/wintercoat/miner,
		/obj/item/clothing/shoes/boots/winter/mining,
		/obj/item/emergency_beacon, // CHOMPEdit - Removal of obj/item/device
		/obj/item/stack/marker_beacon/thirty)

/obj/structure/closet/secure_closet/miner/Initialize()
	if(prob(50))
		starts_with += /obj/item/storage/backpack/industrial // CHOMPEdit - Removal of obj/item/weapon
	else
		starts_with += /obj/item/storage/backpack/satchel/eng // CHOMPEdit - Removal of obj/item/weapon
	return ..()



/obj/structure/closet/lumber
	name = "Lumberjack's equipment"
	desc = "It's a storage unit for Lumberjack equpiment, though it seems the lock is broken."
	closet_appearance = /decl/closet_appearance/secure_closet/lumber

	starts_with = list(
		/obj/item/radio/headset/headset_mine, // CHOMPEdit - Removal of obj/item/device
		/obj/item/clothing/under/overalls,
		/obj/item/clothing/gloves/light_brown,
		/obj/item/clothing/gloves/black,
		/obj/item/clothing/shoes/black,
		/obj/item/material/knife/machete/hatchet, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/gun/energy/kinetic_accelerator, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/flashlight/lantern, // CHOMPEdit - Removal of obj/item/device
		/obj/item/shovel, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/clothing/glasses/material,
		/obj/item/clothing/suit/storage/hooded/wintercoat/miner,
		/obj/item/clothing/shoes/boots/winter/mining,
		/obj/item/stack/marker_beacon/thirty)

/obj/structure/closet/lumber/Initialize()
	if(prob(50))
		starts_with += /obj/item/storage/backpack/industrial // CHOMPEdit - Removal of obj/item/weapon
	else
		starts_with += /obj/item/storage/backpack/satchel/eng // CHOMPEdit - Removal of obj/item/weapon
	return ..()