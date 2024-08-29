/obj/structure/closet/secure_closet/scientist
	name = "scientist's locker"
	req_access = list(access_tox_storage)
	closet_appearance = /decl/closet_appearance/secure_closet/science

	starts_with = list(
		/obj/item/clothing/under/rank/scientist,
		/obj/item/clothing/suit/storage/toggle/labcoat,
		/obj/item/clothing/shoes/white,
		/obj/item/radio/headset/headset_sci, // CHOMPEdit - Removal of obj/item/device
		/obj/item/tank/air, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/clothing/mask/gas,
		/obj/item/clothing/suit/storage/hooded/wintercoat/science,
		/obj/item/clothing/shoes/boots/winter/science)

/obj/structure/closet/secure_closet/scientist/Initialize()
	if(prob(50))
		starts_with += /obj/item/storage/backpack/dufflebag/sci // CHOMPEdit - Removal of obj/item/weapon
	else
		starts_with += /obj/item/storage/backpack/toxins // CHOMPEdit - Removal of obj/item/weapon
	return ..()


/obj/structure/closet/secure_closet/RD
	name = "research director's locker"
	req_access = list(access_rd)
	closet_appearance = /decl/closet_appearance/secure_closet/science/rd

	starts_with = list(
		/obj/item/clothing/suit/bio_suit/scientist,
		/obj/item/clothing/head/bio_hood/scientist,
		/obj/item/clothing/under/rank/research_director,
		/obj/item/clothing/under/rank/research_director/rdalt,
		/obj/item/clothing/under/rank/research_director/dress_rd,
		/obj/item/clothing/suit/storage/toggle/labcoat,
		/obj/item/clothing/suit/storage/toggle/labcoat/modern,
		/obj/item/clothing/suit/storage/toggle/labcoat/rd,
		/obj/item/clothing/under/rank/neo_rd_turtle,
		/obj/item/clothing/under/rank/neo_rd_turtle_skirt,
		/obj/item/clothing/under/rank/neo_rd_suit,
		/obj/item/clothing/under/rank/neo_rd_suit_skirt,
		/obj/item/clothing/under/rank/neo_rd_gorka,
		/obj/item/cartridge/rd, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/clothing/shoes/white,
		/obj/item/clothing/shoes/laceup/brown,
		/obj/item/clothing/gloves/sterile/latex,
		/obj/item/radio/headset/heads/rd, // CHOMPEdit - Removal of obj/item/device
		/obj/item/radio/headset/heads/rd/alt, // CHOMPEdit - Removal of obj/item/device
		/obj/item/tank/air, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/clothing/mask/gas,
		/obj/item/flash, // CHOMPEdit - Removal of obj/item/device
		/obj/item/clothing/suit/storage/hooded/wintercoat/science,
		/obj/item/clothing/suit/storage/hooded/wintercoat/science/rd,
		/obj/item/clothing/shoes/boots/winter/science,
		/obj/item/clothing/head/beret/science/rd,
		/obj/item/bluespace_harpoon) //VOREStation Add // CHOMPEdit - Removal of obj/item/weapon

/obj/structure/closet/secure_closet/xenoarchaeologist
	name = "Xenoarchaeologist Locker"
	req_access = list(access_tox_storage)
	closet_appearance = /decl/closet_appearance/secure_closet/science/xenoarch

	starts_with = list(
		/obj/item/clothing/under/rank/scientist,
		/obj/item/clothing/suit/storage/toggle/labcoat,
		/obj/item/clothing/suit/storage/toggle/labcoat/modern,
		/obj/item/clothing/shoes/white,
		/obj/item/melee/umbrella, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/clothing/glasses/science,
		/obj/item/radio/headset/headset_sci, // CHOMPEdit - Removal of obj/item/device
		/obj/item/storage/belt/archaeology, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/excavation) // CHOMPEdit - Removal of obj/item/weapon

/obj/structure/closet/excavation
	name = "Excavation tools"
	closet_appearance = /decl/closet_appearance/secure_closet/engineering/tools/xenoarch

	starts_with = list(
		/obj/item/storage/belt/archaeology, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/excavation, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/flashlight/lantern, // CHOMPEdit - Removal of obj/item/device
		/obj/item/ano_scanner, // CHOMPEdit - Removal of obj/item/device
		/obj/item/depth_scanner, // CHOMPEdit - Removal of obj/item/device
		/obj/item/core_sampler, // CHOMPEdit - Removal of obj/item/device
		/obj/item/gps, // CHOMPEdit - Removal of obj/item/device
		/obj/item/beacon_locator, // CHOMPEdit - Removal of obj/item/device
		/obj/item/radio/beacon, // CHOMPEdit - Removal of obj/item/device
		/obj/item/clothing/glasses/meson,
		/obj/item/pickaxe, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/measuring_tape, // CHOMPEdit - Removal of obj/item/device
		/obj/item/pickaxe/hand, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/bag/fossils, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/hand_labeler) // CHOMPEdit - Removal of obj/item/weapon
