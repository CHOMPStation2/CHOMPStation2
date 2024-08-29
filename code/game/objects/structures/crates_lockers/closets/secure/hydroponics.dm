/obj/structure/closet/secure_closet/hydroponics
	name = "botanist's locker"
	req_access = list(access_hydroponics)
	closet_appearance = /decl/closet_appearance/secure_closet/hydroponics

	starts_with = list(
		/obj/item/storage/bag/plants, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/clothing/under/rank/hydroponics,
		/obj/item/clothing/gloves/botanic_leather,
		/obj/item/analyzer/plant_analyzer, // CHOMPEdit - Removal of obj/item/device
		/obj/item/radio/headset/headset_service, // CHOMPEdit - Removal of obj/item/device
		/obj/item/clothing/head/greenbandana,
		/obj/item/shovel/spade, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/material/minihoe, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/material/knife/machete/hatchet, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/glass/beaker = 2, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/tool/wirecutters/clippers/trimmers, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/spray/plantbgone, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/clothing/suit/storage/hooded/wintercoat/hydro,
		/obj/item/clothing/shoes/boots/winter/hydro,
		/obj/item/storage/belt/hydro, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/material/fishing_net/butterfly_net) // CHOMPEdit - Removal of obj/item/weapon

/obj/structure/closet/secure_closet/hydroponics/Initialize()
	if(prob(50))
		starts_with += /obj/item/clothing/suit/storage/apron
	else
		starts_with += /obj/item/clothing/suit/storage/apron/overalls
	return ..()

/obj/structure/closet/secure_closet/hydroponics/sci
	name = "xenoflorist's locker"
	req_access = list(access_xenobiology)
	closet_appearance = /decl/closet_appearance/secure_closet/hydroponics/xenoflora

/obj/structure/closet/secure_closet/hydroponics/sci/Initialize()
	starts_with += /obj/item/clothing/head/bio_hood/scientist
	starts_with += /obj/item/clothing/suit/bio_suit/scientist
	starts_with += /obj/item/clothing/mask/gas/clear			// VOREStation Edit: Gasmasks we use are different //Chompedit: not anymore!

	if(prob(1))
		starts_with += /obj/item/chainsaw // CHOMPEdit - Removal of obj/item/weapon

	return ..()
